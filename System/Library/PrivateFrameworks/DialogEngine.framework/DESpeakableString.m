@interface DESpeakableString
- (BOOL)isEqual:(id)a3;
- (DESpeakableString)init;
- (DESpeakableString)initWithPrint:(id)a3 speak:(id)a4;
- (NSString)print;
- (NSString)speak;
- (void)This;
- (void)dealloc;
- (void)setPrint:(id)a3;
- (void)setSpeak:(id)a3;
- (void)setThis:(void *)a3;
@end

@implementation DESpeakableString

- (void)setThis:(void *)a3
{
  self->_This = a3;
}

- (void)This
{
  return self->_This;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = siri::dialogengine::SpeakableString::operator==((unsigned __int8 *)-[DESpeakableString This](self, "This"), (unsigned __int8 *)[v4 This]);

  return (char)self;
}

- (void)setSpeak:(id)a3
{
  id v4 = a3;
  v5 = [(DESpeakableString *)self This];
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=(v5 + 1, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

- (NSString)speak
{
  v2 = NSString;
  v3 = [(DESpeakableString *)self This];
  if (v3[47] < 0) {
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v3 + 3), *((void *)v3 + 4));
  }
  else {
    std::string __p = *(std::string *)(v3 + 1);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v5 = objc_msgSend(v2, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return (NSString *)v5;
}

- (void)setPrint:(id)a3
{
  id v4 = a3;
  v5 = [(DESpeakableString *)self This];
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=(v5, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

- (NSString)print
{
  v2 = NSString;
  v3 = [(DESpeakableString *)self This];
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *v3, (std::string::size_type)v3[1]);
  }
  else
  {
    long long v4 = *(_OWORD *)v3;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)v3[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v4;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  id v6 = objc_msgSend(v2, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return (NSString *)v6;
}

- (void)dealloc
{
  v3 = [(DESpeakableString *)self This];
  if (v3)
  {
    siri::dialogengine::SpeakableString::~SpeakableString(v3);
    MEMORY[0x1C8796D70]();
  }
  v4.receiver = self;
  v4.super_class = (Class)DESpeakableString;
  [(DESpeakableString *)&v4 dealloc];
}

- (DESpeakableString)initWithPrint:(id)a3 speak:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)DESpeakableString;
  if ([(DESpeakableString *)&v9 init]) {
    operator new();
  }

  return 0;
}

- (DESpeakableString)init
{
  v3.receiver = self;
  v3.super_class = (Class)DESpeakableString;
  if ([(DESpeakableString *)&v3 init]) {
    operator new();
  }
  return 0;
}

@end