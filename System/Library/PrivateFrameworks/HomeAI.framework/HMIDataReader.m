@interface HMIDataReader
- (HMIDataReader)initWithData:(id)a3;
- (id)readData:(unint64_t)a3;
- (unint64_t)length;
- (unint64_t)position;
- (unint64_t)readUInt64;
- (unsigned)readUInt32;
- (void)seek:(unint64_t)a3;
@end

@implementation HMIDataReader

- (HMIDataReader)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMIDataReader;
  v6 = [(HMIDataReader *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_position = 0;
  }

  return v7;
}

- (unint64_t)position
{
  return self->_position;
}

- (unint64_t)length
{
  return [(NSData *)self->_data length];
}

- (unsigned)readUInt32
{
  v3 = [(NSData *)self->_data bytes];
  unint64_t position = self->_position;
  self->_unint64_t position = position + 4;
  return bswap32(*(_DWORD *)&v3[position]);
}

- (unint64_t)readUInt64
{
  v3 = [(NSData *)self->_data bytes];
  unint64_t position = self->_position;
  self->_unint64_t position = position + 8;
  return bswap64(*(void *)&v3[position]);
}

- (void)seek:(unint64_t)a3
{
  self->_unint64_t position = a3;
}

- (id)readData:(unint64_t)a3
{
  id result = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", self->_position, a3);
  self->_position += a3;
  return result;
}

- (void).cxx_destruct
{
}

@end