@interface DEDataReader
- (DEDataReader)init;
- (DEDataReader)initWithData:(id)a3;
- (NSData)data;
- (id)readData;
- (id)readDataOfLength:(unint64_t)a3;
- (unint64_t)dataOffset;
- (void)setData:(id)a3;
- (void)setDataOffset:(unint64_t)a3;
@end

@implementation DEDataReader

- (void).cxx_destruct
{
}

- (void)setDataOffset:(unint64_t)a3
{
  self->_dataOffset = a3;
}

- (unint64_t)dataOffset
{
  return self->_dataOffset;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (id)readData
{
  p_data = &self->_data;
  data = self->_data;
  if (p_data[1])
  {
    v5 = [(DEDataReader *)self readDataOfLength:[(NSData *)data length] - self->_dataOffset];
  }
  else
  {
    v5 = data;
  }
  return v5;
}

- (id)readDataOfLength:(unint64_t)a3
{
  v4 = +[DEIO readDataOfLength:a3 offset:self->_dataOffset from:self->_data];
  self->_dataOffset += [v4 length];
  return v4;
}

- (DEDataReader)init
{
  return [(DEDataReader *)self initWithData:0];
}

- (DEDataReader)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DEDataReader;
  v6 = [(DEDataReader *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_dataOffset = 0;
    v8 = v7;
  }

  return v7;
}

@end