@interface TKDataView
- (NSData)buffer;
- (NSMutableData)mutableBuffer;
- (TKDataView)initWithData:(id)a3;
- (TKDataView)initWithLength:(unint64_t)a3;
- (unsigned)uint16:(unint64_t)a3;
- (unsigned)uint32:(unint64_t)a3;
- (unsigned)uint8:(unint64_t)a3;
- (void)setUint16:(unsigned __int16)a3 at:(unint64_t)a4;
- (void)setUint32:(unsigned int)a3 at:(unint64_t)a4;
- (void)setUint8:(unsigned __int8)a3 at:(unint64_t)a4;
@end

@implementation TKDataView

- (TKDataView)initWithLength:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TKDataView;
  v4 = [(TKDataView *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:a3];
    mutableBuffer = v4->_mutableBuffer;
    v4->_mutableBuffer = v5;
  }
  return v4;
}

- (TKDataView)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKDataView;
  v6 = [(TKDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_buffer, a3);
  }

  return v7;
}

- (NSData)buffer
{
  buffer = (NSMutableData *)self->_buffer;
  if (!buffer) {
    buffer = self->_mutableBuffer;
  }
  return (NSData *)buffer;
}

- (NSMutableData)mutableBuffer
{
  mutableBuffer = self->_mutableBuffer;
  if (!mutableBuffer)
  {
    v4 = +[NSMutableData dataWithData:self->_buffer];
    id v5 = self->_mutableBuffer;
    self->_mutableBuffer = v4;

    buffer = self->_buffer;
    self->_buffer = 0;

    mutableBuffer = self->_mutableBuffer;
  }

  return mutableBuffer;
}

- (unsigned)uint8:(unint64_t)a3
{
  unsigned __int8 v6 = 0;
  v4 = [(TKDataView *)self buffer];
  objc_msgSend(v4, "getBytes:range:", &v6, a3, 1);

  return v6;
}

- (void)setUint8:(unsigned __int8)a3 at:(unint64_t)a4
{
  unsigned __int8 v6 = a3;
  id v5 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v5, "replaceBytesInRange:withBytes:", a4, 1, &v6);
}

- (unsigned)uint16:(unint64_t)a3
{
  unsigned __int16 v6 = 0;
  v4 = [(TKDataView *)self buffer];
  objc_msgSend(v4, "getBytes:range:", &v6, a3, 2);

  return v6;
}

- (void)setUint16:(unsigned __int16)a3 at:(unint64_t)a4
{
  unsigned __int16 v6 = a3;
  id v5 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v5, "replaceBytesInRange:withBytes:", a4, 2, &v6);
}

- (unsigned)uint32:(unint64_t)a3
{
  unsigned int v6 = 0;
  v4 = [(TKDataView *)self buffer];
  objc_msgSend(v4, "getBytes:range:", &v6, a3, 4);

  return v6;
}

- (void)setUint32:(unsigned int)a3 at:(unint64_t)a4
{
  unsigned int v6 = a3;
  id v5 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v5, "replaceBytesInRange:withBytes:", a4, 4, &v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableBuffer, 0);

  objc_storeStrong((id *)&self->_buffer, 0);
}

@end