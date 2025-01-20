@interface CTBClientAuthenticityRequestWrapper
- (CTBClientAuthenticityRequestWrapper)initWithWrapped:(optional<ctb::ClientAuthenticityRequest> *)a3;
- (id).cxx_construct;
- (optional<ctb::ClientAuthenticityRequest>)wrapped;
@end

@implementation CTBClientAuthenticityRequestWrapper

- (CTBClientAuthenticityRequestWrapper)initWithWrapped:(optional<ctb::ClientAuthenticityRequest> *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CTBClientAuthenticityRequestWrapper;
  v4 = [(CTBClientAuthenticityRequestWrapper *)&v7 init];
  v5 = v4;
  if (v4) {
    std::__optional_storage_base<ctb::ClientAuthenticityRequest,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::ClientAuthenticityRequest,false>>((uint64_t)&v4->_wrapped, (__n128 *)a3);
  }
  return v5;
}

- (optional<ctb::ClientAuthenticityRequest>)wrapped
{
  return (optional<ctb::ClientAuthenticityRequest> *)std::__optional_copy_base<ctb::ClientAuthenticityRequest,false>::__optional_copy_base[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_wrapped);
}

- (void).cxx_destruct
{
  if (self->_wrapped.__engaged_)
  {
    p_wrapped = &self->_wrapped;
    std::vector<ctb::ClientAuthenticityRequest::Method>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_wrapped);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 32) = 0;
  return self;
}

@end