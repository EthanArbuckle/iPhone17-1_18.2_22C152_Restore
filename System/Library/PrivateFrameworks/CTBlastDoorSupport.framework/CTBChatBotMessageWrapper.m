@interface CTBChatBotMessageWrapper
- (CTBChatBotMessageWrapper)initWithWrapped:(optional<ctb:(BOOL)a4 :chatbot::Message> *)a3;
- (id).cxx_construct;
- (optional<ctb::chatbot::Message>)wrapped;
@end

@implementation CTBChatBotMessageWrapper

- (CTBChatBotMessageWrapper)initWithWrapped:(optional<ctb:(BOOL)a4 :chatbot::Message> *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTBChatBotMessageWrapper;
  v5 = [(CTBChatBotMessageWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    std::__optional_storage_base<ctb::chatbot::Message,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::chatbot::Message,false>>(&v5->_wrapped.var0.var0, (uint64_t)a3);
  }
  return v6;
}

- (optional<ctb::chatbot::Message>)wrapped
{
  return (optional<ctb::chatbot::Message> *)std::__optional_copy_base<ctb::chatbot::Message,false>::__optional_copy_base[abi:ne180100](retstr, (uint64_t)&self->_wrapped);
}

- (void).cxx_destruct
{
  if (LOBYTE(self[3]._wrapped.var0.var1.fMessageContent.var0.__val_.__impl_.__data.__head.__value.var0.__words[0]))
  {
    if (LOBYTE(self[3]._wrapped.var0.var1.fMessageContent.var0.__val_.__impl_.__data.__head.__value.fLayout.fCardStyle.var0.var1.fUri.var0)) {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<ctb::chatbot::CardMessage,ctb::chatbot::CardCarouselMessage,ctb::chatbot::SuggestedChipList>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&self->_wrapped);
    }
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 352) = 0;
  return self;
}

@end