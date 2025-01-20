@interface MDLMeshBufferMap
- (MDLMeshBufferMap)initWithBytes:(void *)bytes deallocator:(void *)deallocator;
- (void)bytes;
- (void)dealloc;
@end

@implementation MDLMeshBufferMap

- (MDLMeshBufferMap)initWithBytes:(void *)bytes deallocator:(void *)deallocator
{
  v6 = deallocator;
  v12.receiver = self;
  v12.super_class = (Class)MDLMeshBufferMap;
  v7 = [(MDLMeshBufferMap *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_bytes = bytes;
    uint64_t v9 = MEMORY[0x210532CA0](v6);
    id v10 = v8->_deallocator;
    v8->_deallocator = (id)v9;
  }
  return v8;
}

- (void)dealloc
{
  deallocator = (void (**)(id, SEL))self->_deallocator;
  if (deallocator) {
    deallocator[2](deallocator, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)MDLMeshBufferMap;
  [(MDLMeshBufferMap *)&v4 dealloc];
}

- (void)bytes
{
  return self->_bytes;
}

- (void).cxx_destruct
{
}

@end