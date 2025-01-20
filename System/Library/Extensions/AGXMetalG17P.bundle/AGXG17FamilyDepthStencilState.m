@interface AGXG17FamilyDepthStencilState
- (BOOL)readsDepth;
- (BOOL)readsStencil;
- (BOOL)writesDepth;
- (BOOL)writesStencil;
- (id).cxx_construct;
@end

@implementation AGXG17FamilyDepthStencilState

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0uLL;
  *((void *)self + 4) = 0;
  *((void *)self + 9) |= 0xE0000000E000000uLL;
  return self;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_impl.desc.label.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_impl.desc.label.__r_.__value_.var0.__l.__data_);
  }
}

- (BOOL)writesStencil
{
  return (LOWORD(self->_impl.desc.label.__r_.var0) >> 3) & 1;
}

- (BOOL)readsStencil
{
  return (LOWORD(self->_impl.desc.label.__r_.var0) >> 2) & 1;
}

- (BOOL)writesDepth
{
  return (LOWORD(self->_impl.desc.label.__r_.var0) >> 1) & 1;
}

- (BOOL)readsDepth
{
  return self->_impl.desc.label.__r_.var0 & 1;
}

@end