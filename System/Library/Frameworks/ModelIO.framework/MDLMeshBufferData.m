@interface MDLMeshBufferData
- (MDLMeshBufferAllocator)allocator;
- (MDLMeshBufferData)initWithLength:(unint64_t)a3 data:(id)a4 allocator:(id)a5 zone:(id)a6;
- (MDLMeshBufferData)initWithType:(MDLMeshBufferType)type data:(NSData *)data;
- (MDLMeshBufferData)initWithType:(MDLMeshBufferType)type length:(NSUInteger)length;
- (MDLMeshBufferZone)zone;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)map;
- (id)name;
- (unint64_t)length;
- (unint64_t)type;
- (void)dealloc;
- (void)fillData:(id)a3 offset:(unint64_t)a4;
- (void)setName:(id)a3;
@end

@implementation MDLMeshBufferData

- (void)setName:(id)a3
{
}

- (id)name
{
  return self->_name;
}

- (MDLMeshBufferAllocator)allocator
{
  if (!qword_267691138 && !self->_allocator)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)qword_267691138;
    qword_267691138 = v3;

    objc_storeStrong((id *)&self->_allocator, (id)qword_267691138);
  }
  allocator = self->_allocator;

  return allocator;
}

- (NSData)data
{
  return (NSData *)self->_data;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)length
{
  return self->_length;
}

- (MDLMeshBufferZone)zone
{
  return (MDLMeshBufferZone *)self->_zone;
}

- (MDLMeshBufferData)initWithType:(MDLMeshBufferType)type length:(NSUInteger)length
{
  v16.receiver = self;
  v16.super_class = (Class)MDLMeshBufferData;
  v6 = [(MDLMeshBufferData *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_length = length;
    id v8 = objc_alloc(MEMORY[0x263EFF990]);
    uint64_t v10 = objc_msgSend_initWithLength_(v8, v9, length);
    data = v7->_data;
    v7->_data = (NSMutableData *)v10;

    zone = v7->_zone;
    v7->_zone = 0;

    objc_storeStrong((id *)&v7->_zoneDefault, v7->_zone);
    allocator = v7->_allocator;
    v7->_allocator = 0;

    v7->_type = type;
    v14 = v7;
  }

  return v7;
}

- (MDLMeshBufferData)initWithType:(MDLMeshBufferType)type data:(NSData *)data
{
  v6 = data;
  v18.receiver = self;
  v18.super_class = (Class)MDLMeshBufferData;
  v9 = [(MDLMeshBufferData *)&v18 init];
  if (v9)
  {
    v9->_length = objc_msgSend_length(v6, v7, v8);
    id v10 = objc_alloc(MEMORY[0x263EFF990]);
    uint64_t v12 = objc_msgSend_initWithData_(v10, v11, (uint64_t)v6);
    v13 = v9->_data;
    v9->_data = (NSMutableData *)v12;

    zone = v9->_zone;
    v9->_zone = 0;

    objc_storeStrong((id *)&v9->_zoneDefault, v9->_zone);
    allocator = v9->_allocator;
    v9->_allocator = 0;

    v9->_type = type;
    objc_super v16 = v9;
  }

  return v9;
}

- (MDLMeshBufferData)initWithLength:(unint64_t)a3 data:(id)a4 allocator:(id)a5 zone:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MDLMeshBufferData;
  v13 = [(MDLMeshBufferData *)&v23 init];
  v14 = v13;
  if (v13
    && ((objc_storeStrong((id *)&v13->_zone, a6),
         objc_storeStrong((id *)&v14->_zoneDefault, v14->_zone),
         (zoneDefault = v14->_zoneDefault) == 0)
     || objc_msgSend_reserveMemory_allocator_(zoneDefault, v15, v14->_length, v11)))
  {
    objc_storeStrong((id *)&v14->_allocator, a5);
    v14->_length = a3;
    id v17 = objc_alloc(MEMORY[0x263EFF990]);
    if (v10) {
      uint64_t v19 = objc_msgSend_initWithData_(v17, v18, (uint64_t)v10);
    }
    else {
      uint64_t v19 = objc_msgSend_initWithLength_(v17, v18, a3);
    }
    data = v14->_data;
    v14->_data = (NSMutableData *)v19;

    v20 = v14;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  zoneDefault = self->_zoneDefault;
  if (zoneDefault) {
    objc_msgSend_cancelMemory_(zoneDefault, a2, self->_length);
  }
  v4.receiver = self;
  v4.super_class = (Class)MDLMeshBufferData;
  [(MDLMeshBufferData *)&v4 dealloc];
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_length(v6, v7, v8);
  unint64_t length = self->_length;
  uint64_t v13 = objc_msgSend_mutableBytes(self->_data, v11, v12);
  id v18 = v6;
  objc_super v16 = (const void *)objc_msgSend_bytes(v18, v14, v15);
  unint64_t v17 = v9 + a4 - length;
  if (v9 + a4 < length) {
    unint64_t v17 = 0;
  }
  memcpy((void *)(v13 + a4), v16, v17 + v9);
}

- (id)map
{
  uint64_t v3 = [MDLMeshBufferMap alloc];
  uint64_t v6 = objc_msgSend_mutableBytes(self->_data, v4, v5);
  uint64_t v8 = objc_msgSend_initWithBytes_deallocator_(v3, v7, v6, 0);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend_allocWithZone_(MDLMeshBufferData, a2, (uint64_t)a3);
  data = self->_data;
  unint64_t length = self->_length;
  allocator = self->_allocator;

  return (id)objc_msgSend_initWithLength_data_allocator_zone_(v4, v5, length, data, allocator, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_zoneDefault, 0);

  objc_storeStrong((id *)&self->_zone, 0);
}

@end