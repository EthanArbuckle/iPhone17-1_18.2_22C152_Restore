@interface _EARCommandTagging
- (NSArray)tagSequence;
- (NSString)commandId;
- (id).cxx_construct;
- (id)_initWithQuasarCommandTagging:(const void *)a3;
- (id)tokensForTag:(id)a3;
@end

@implementation _EARCommandTagging

- (id)_initWithQuasarCommandTagging:(const void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_EARCommandTagging;
  if ([(_EARCommandTagging *)&v6 init])
  {
    quasar::CommandTagging::getCommandId((quasar::CommandTagging *)a3, &v5);
    quasar::Bitmap::~Bitmap((quasar::Bitmap *)a3);
    operator new();
  }
  return 0;
}

- (id)tokensForTag:(id)a3
{
  id v4 = a3;
  std::string v5 = v4;
  value = self->_tagging.__ptr_.__value_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v11 = 0;
  }
  TokensFromTag = (uint64_t *)quasar::CommandTagging::getTokensFromTag((uint64_t)value, (const void **)__p);
  memset(v12, 0, sizeof(v12));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v12, *TokensFromTag, TokensFromTag[1], 0x6DB6DB6DB6DB6DB7 * ((TokensFromTag[1] - *TokensFromTag) >> 5));
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  v8 = EARHelpers::EARSpeechRecognitionTokensFromQuasarTokens(v12);
  v13 = v12;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);

  return v8;
}

- (NSString)commandId
{
  return self->_commandId;
}

- (NSArray)tagSequence
{
  return self->_tagSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagSequence, 0);
  objc_storeStrong((id *)&self->_commandId, 0);
  std::unique_ptr<quasar::CommandTagging>::reset[abi:ne180100]((void ***)&self->_tagging, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end