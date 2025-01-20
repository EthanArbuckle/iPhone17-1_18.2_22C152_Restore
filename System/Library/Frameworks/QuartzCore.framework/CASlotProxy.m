@interface CASlotProxy
- (CASlotProxy)initWithName:(unsigned int)a3;
- (Object)CA_copyRenderValue;
- (void)dealloc;
@end

@implementation CASlotProxy

- (Object)CA_copyRenderValue
{
  result = (Object *)self->_proxy;
  if (result)
  {
    p_var1 = &result->var1;
    if (!atomic_fetch_add(&result->var1.var0.var0, 1u))
    {
      result = 0;
      atomic_fetch_add(&p_var1->var0.var0, 0xFFFFFFFF);
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  proxy = (atomic_uint *)self->_proxy;
  if (proxy && atomic_fetch_add(proxy + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *, SEL))(*(void *)proxy + 16))(proxy, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CASlotProxy;
  [(CASlotProxy *)&v4 dealloc];
}

- (CASlotProxy)initWithName:(unsigned int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CASlotProxy;
  objc_super v4 = [(CASlotProxy *)&v8 init];
  if (v4)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v6 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
    if (v6)
    {
      v6[2] = 1;
      v6[3] = 43;
      ++dword_1EB2ADE74;
      *(void *)v6 = &unk_1ED02F4B0;
      *((void *)v6 + 2) = a3;
      v4->_proxy = v6;
    }
    else
    {
      v4->_proxy = 0;

      return 0;
    }
  }
  return v4;
}

@end