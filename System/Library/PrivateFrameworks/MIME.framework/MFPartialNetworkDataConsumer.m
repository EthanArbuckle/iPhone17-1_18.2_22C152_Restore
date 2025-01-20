@interface MFPartialNetworkDataConsumer
- (MFPartialNetworkDataConsumer)init;
- (id)copyDataWithUnixLineEndings;
- (id)data;
- (int64_t)appendData:(id)a3;
- (unint64_t)length;
- (void)dealloc;
- (void)done;
- (void)purge;
@end

@implementation MFPartialNetworkDataConsumer

- (int64_t)appendData:(id)a3
{
  self->_strippedData = 0;
  if ((*((unsigned char *)self + 32) & 1) == 0) {
    *((unsigned char *)self + 32) = *((unsigned char *)self + 32) & 0xFE | (memchr((void *)[a3 bytes], 13, objc_msgSend(a3, "length")) != 0);
  }
  int64_t result = [(MFGuaranteedCollectingDataConsumer *)self->_rawDataConsumer appendData:a3];
  if (result >= 1) {
    self->_length += result;
  }
  return result;
}

- (MFPartialNetworkDataConsumer)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFPartialNetworkDataConsumer;
  v2 = [(MFPartialNetworkDataConsumer *)&v4 init];
  if (v2) {
    v2->_rawDataConsumer = (MFGuaranteedCollectingDataConsumer *)objc_alloc_init(MFBufferedDataConsumer);
  }
  return v2;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFPartialNetworkDataConsumer;
  [(MFPartialNetworkDataConsumer *)&v3 dealloc];
}

- (id)copyDataWithUnixLineEndings
{
  if (self->_length)
  {
    if (*((unsigned char *)self + 32))
    {
      strippedData = self->_strippedData;
      if (!strippedData)
      {
        objc_super v4 = objc_alloc_init(MFBufferedDataConsumer);
        v5 = [(MFBaseFilterDataConsumer *)[MFLineEndingConverterFilter alloc] initWithConsumer:v4];
        [(MFLineEndingConverterFilter *)v5 appendData:[(MFGuaranteedCollectingDataConsumer *)self->_rawDataConsumer data]];
        [(MFLineEndingConverterFilter *)v5 done];
        [(MFBufferedDataConsumer *)v4 done];
        v7 = (NSData *)[(MFBufferedDataConsumer *)v4 data];
        self->_strippedData = v7;

        strippedData = v7;
      }
    }
    else
    {
      strippedData = (NSData *)[(MFGuaranteedCollectingDataConsumer *)self->_rawDataConsumer data];
    }
  }
  else
  {
    strippedData = 0;
  }
  return strippedData;
}

- (void)done
{
  self->_strippedData = 0;
}

- (id)data
{
  if (self->_length) {
    return (id)[(MFGuaranteedCollectingDataConsumer *)self->_rawDataConsumer data];
  }
  else {
    return 0;
  }
}

- (void)purge
{
  self->_strippedData = 0;
}

@end