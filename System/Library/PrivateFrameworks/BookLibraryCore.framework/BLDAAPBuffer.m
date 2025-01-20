@interface BLDAAPBuffer
- (BLDAAPBuffer)init;
- (NSData)data;
- (int64_t)appendHeader:(unsigned int)a3 size:(unsigned int)a4;
- (int64_t)appendUInt32:(unsigned int)a3 withCode:(unsigned int)a4;
- (int64_t)appendUInt64:(unint64_t)a3 withCode:(unsigned int)a4;
- (int64_t)appendUInt8:(unsigned __int8)a3 withCode:(unsigned int)a4;
@end

@implementation BLDAAPBuffer

- (BLDAAPBuffer)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLDAAPBuffer;
  v2 = [(BLDAAPBuffer *)&v6 init];
  if (v2)
  {
    v3 = (NSData *)objc_alloc_init(MEMORY[0x263EFF990]);
    data = v2->_data;
    v2->_data = v3;
  }
  return v2;
}

- (int64_t)appendUInt8:(unsigned __int8)a3 withCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned __int8 v14 = a3;
  objc_super v6 = self->_data;
  objc_msgSend_appendHeader_size_(self, v7, v4, 1);
  int64_t v11 = objc_msgSend_length(v6, v8, v9, v10);
  objc_msgSend_appendBytes_length_(v6, v12, (uint64_t)&v14, 1);

  return v11;
}

- (int64_t)appendUInt32:(unsigned int)a3 withCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  data = self->_data;
  unsigned int v15 = bswap32(a3);
  v7 = data;
  objc_msgSend_appendHeader_size_(self, v8, v4, 4);
  int64_t v12 = objc_msgSend_length(v7, v9, v10, v11);
  objc_msgSend_appendBytes_length_(v7, v13, (uint64_t)&v15, 4);

  return v12;
}

- (int64_t)appendUInt64:(unint64_t)a3 withCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  data = self->_data;
  unint64_t v15 = bswap64(a3);
  v7 = data;
  objc_msgSend_appendHeader_size_(self, v8, v4, 8);
  int64_t v12 = objc_msgSend_length(v7, v9, v10, v11);
  objc_msgSend_appendBytes_length_(v7, v13, (uint64_t)&v15, 8);

  return v12;
}

- (int64_t)appendHeader:(unsigned int)a3 size:(unsigned int)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v6 = self->_data;
  uint64_t v10 = objc_msgSend_length(v6, v7, v8, v9);
  v13[0] = bswap32(a3);
  v13[1] = bswap32(a4);
  objc_msgSend_appendBytes_length_(v6, v11, (uint64_t)v13, 8);

  return v10 + 4;
}

- (NSData)data
{
  uint64_t v4 = objc_msgSend_copy(self->_data, a2, v2, v3);

  return (NSData *)v4;
}

- (void).cxx_destruct
{
}

@end