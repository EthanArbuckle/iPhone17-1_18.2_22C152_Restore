@interface CTBIMRevokeWrapper
- (CTBIMRevokeWrapper)initWithWrapped:(optional<ctb::IMRevoke> *)a3;
- (id).cxx_construct;
- (optional<ctb::IMRevoke>)wrapped;
@end

@implementation CTBIMRevokeWrapper

- (CTBIMRevokeWrapper)initWithWrapped:(optional<ctb::IMRevoke> *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CTBIMRevokeWrapper;
  v4 = [(CTBIMRevokeWrapper *)&v7 init];
  v5 = v4;
  if (v4) {
    std::__optional_storage_base<ctb::IMRevoke,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::IMRevoke,false>>((uint64_t)&v4->_wrapped, (long long *)&a3->var0.var0);
  }
  return v5;
}

- (optional<ctb::IMRevoke>)wrapped
{
  return (optional<ctb::IMRevoke> *)std::__optional_copy_base<ctb::IMRevoke,false>::__optional_copy_base[abi:ne180100]((std::string *)retstr, v1 + 8);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 88) = 0;
  return self;
}

@end