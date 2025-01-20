@interface CSReusablePrivateMemoryBackingStore
- (CSReusablePrivateMemoryBackingStore)initWithBufferSize:(unint64_t)a3;
@end

@implementation CSReusablePrivateMemoryBackingStore

- (CSReusablePrivateMemoryBackingStore)initWithBufferSize:(unint64_t)a3
{
  v5 = malloc_type_malloc(a3, 0xC5F8452CuLL);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__CSReusablePrivateMemoryBackingStore_initWithBufferSize___block_invoke;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  v8[4] = v5;
  v7.receiver = self;
  v7.super_class = (Class)CSReusablePrivateMemoryBackingStore;
  return [(CSReusableBufferBackingStore *)&v7 initWithBuffer:v5 bufferSize:a3 deallocator:v8];
}

void __58__CSReusablePrivateMemoryBackingStore_initWithBufferSize___block_invoke(uint64_t a1)
{
}

@end