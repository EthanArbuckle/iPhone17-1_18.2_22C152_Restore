@interface CTBSIPResourceListsWrapper
- (CTBSIPResourceListsWrapper)initWithWrapped:(optional<ctb::SIPResourceLists> *)a3;
- (id).cxx_construct;
- (optional<ctb::SIPResourceLists>)wrapped;
@end

@implementation CTBSIPResourceListsWrapper

- (CTBSIPResourceListsWrapper)initWithWrapped:(optional<ctb::SIPResourceLists> *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CTBSIPResourceListsWrapper;
  v4 = [(CTBSIPResourceListsWrapper *)&v7 init];
  v5 = (CTBSIPResourceListsWrapper *)v4;
  if (v4) {
    std::__optional_storage_base<ctb::chatbot::CategoryList,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::chatbot::CategoryList,false>>((std::vector<std::string> *)(v4 + 8), (uint64_t)a3);
  }
  return v5;
}

- (optional<ctb::SIPResourceLists>)wrapped
{
  return (optional<ctb::SIPResourceLists> *)std::__optional_copy_base<ctb::SIPResourceLists,false>::__optional_copy_base[abi:ne180100]((std::string *)retstr, (uint64_t)&self->_wrapped);
}

- (void).cxx_destruct
{
  if (self->_wrapped.__engaged_)
  {
    p_wrapped = &self->_wrapped;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_wrapped);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 32) = 0;
  return self;
}

@end