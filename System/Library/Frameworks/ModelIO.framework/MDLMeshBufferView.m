@interface MDLMeshBufferView
- (MDLMeshBufferAllocator)allocator;
- (MDLMeshBufferView)init;
- (MDLMeshBufferView)initWithBufferViewNoCopy:(id)a3 type:(unint64_t)a4;
- (MDLMeshBufferZone)zone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)map;
- (unint64_t)type;
- (void)fillData:(id)a3 offset:(unint64_t)a4;
@end

@implementation MDLMeshBufferView

- (unint64_t)type
{
  return self->_type;
}

- (MDLMeshBufferZone)zone
{
  return 0;
}

- (MDLMeshBufferAllocator)allocator
{
  return (MDLMeshBufferAllocator *)self->_allocator;
}

- (MDLMeshBufferView)initWithBufferViewNoCopy:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MDLMeshBufferView;
  v7 = [(MDLMeshBufferView *)&v13 init];
  if (v7)
  {
    v8 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      objc_storeStrong((id *)&v7->_allocator, *((id *)v6 + 5));
    }
    v7->super._writable = 0;
    v7->super._offset = *((void *)v6 + 3);
    v7->_type = a4;
    unint64_t v10 = *((void *)v6 + 2);
    v7->super._data = (const void *)*((void *)v6 + 1);
    v7->super._length = v10;
    v7->super._regionIndex = *((void *)v6 + 4);
    v11 = v7;
  }

  return v7;
}

- (MDLMeshBufferView)init
{
  v7.receiver = self;
  v7.super_class = (Class)MDLMeshBufferView;
  v2 = [(MDLMeshBufferView *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->super._writable = 0;
    allocator = v2->_allocator;
    v2->_allocator = 0;

    v3->super._data = 0;
    v3->super._length = 0;
    v3->_type = -1;
    *(_OWORD *)&v3->super._offset = xmmword_20B1E6180;
    v5 = v3;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
}

- (id)map
{
  return 0;
}

- (void).cxx_destruct
{
}

@end