@interface CTBChatBotRenderInformationWrapper
- (CTBChatBotRenderInformationWrapper)initWithWrapped:(optional<ctb:(optional<ctb:(optional<ctb::chatbot::WebResources> *)a5 :chatbot::CategoryList> *)a4 :chatbot::RenderInformation> *)a3;
- (id).cxx_construct;
- (optional<ctb::chatbot::RenderInformation>)wrapped;
@end

@implementation CTBChatBotRenderInformationWrapper

- (CTBChatBotRenderInformationWrapper)initWithWrapped:(optional<ctb:(optional<ctb:(optional<ctb::chatbot::WebResources> *)a5 :chatbot::CategoryList> *)a4 :chatbot::RenderInformation> *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTBChatBotRenderInformationWrapper;
  v6 = [(CTBChatBotRenderInformationWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    std::__optional_storage_base<ctb::chatbot::RenderInformation,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::chatbot::RenderInformation,false>>((ctb::chatbot::BotInformation *)&v6->_wrapped, (uint64_t)a3);
  }
  return v7;
}

- (optional<ctb::chatbot::RenderInformation>)wrapped
{
  return (optional<ctb::chatbot::RenderInformation> *)std::__optional_copy_base<ctb::chatbot::RenderInformation,false>::__optional_copy_base[abi:ne180100]((std::string *)retstr, (const ctb::chatbot::RenderInformation *)&self->_wrapped);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 688) = 0;
  return self;
}

@end