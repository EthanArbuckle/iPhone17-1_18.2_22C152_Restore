@interface _IndicClassTableCache
- (id).cxx_construct;
@end

@implementation _IndicClassTableCache

- (void).cxx_destruct
{
  for (uint64_t i = 8; i != 80; i += 8)
  {
    uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + i);
    if (v4) {
      MEMORY[0x1853275A0](v4, 0x1000C8052888210);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end