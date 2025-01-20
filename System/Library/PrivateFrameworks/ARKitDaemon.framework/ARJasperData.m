@interface ARJasperData
- (ARJasperData)initWithBuffer:(__CVBuffer *)a3 timestamp:(double)a4;
- (__CVBuffer)dataBuffer;
- (double)timestamp;
- (void)dealloc;
- (void)setDataBuffer:(__CVBuffer *)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARJasperData

- (ARJasperData)initWithBuffer:(__CVBuffer *)a3 timestamp:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ARJasperData;
  v6 = [(ARJasperData *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(ARJasperData *)v6 setDataBuffer:a3];
    v7->_timestamp = a4;
  }
  return v7;
}

- (void)setDataBuffer:(__CVBuffer *)a3
{
  dataBuffer = self->_dataBuffer;
  if (dataBuffer != a3)
  {
    CVBufferRelease(dataBuffer);
    self->_dataBuffer = CVBufferRetain(a3);
  }
}

- (void)dealloc
{
  CVBufferRelease(self->_dataBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ARJasperData;
  [(ARJasperData *)&v3 dealloc];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__CVBuffer)dataBuffer
{
  return self->_dataBuffer;
}

@end