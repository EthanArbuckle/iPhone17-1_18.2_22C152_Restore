@interface NSString(EARStringView)
+ (id)ear_stringWithStringView:()EARStringView;
- (uint64_t)ear_toString;
- (void)ear_toStringOrNothing;
@end

@implementation NSString(EARStringView)

+ (id)ear_stringWithStringView:()EARStringView
{
  v4 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
  return v4;
}

- (uint64_t)ear_toString
{
  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    return (uint64_t)std::string::basic_string[abi:ne180100]<0>(a2, CStringPtr);
  }
  else
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    std::string::size_type v6 = [(__CFString *)a1 lengthOfBytesUsingEncoding:4];
    std::string::resize(a2, v6, 0);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v7 = (uint64_t *)a2;
    }
    else {
      v7 = (uint64_t *)a2->__r_.__value_.__r.__words[0];
    }
    uint64_t result = [(__CFString *)a1 getCString:v7 maxLength:v6 + 1 encoding:4];
    if ((result & 1) == 0) {
      return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Invalid string: %@", a1 format];
    }
  }
  return result;
}

- (void)ear_toStringOrNothing
{
  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    std::string::basic_string[abi:ne180100]<0>(&v8, CStringPtr);
    *(_OWORD *)a2 = v8;
    std::string::size_type v5 = v9;
LABEL_8:
    *(void *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 24) = 1;
    return;
  }
  memset(&v25, 0, sizeof(v25));
  std::string::size_type v6 = [(__CFString *)a1 lengthOfBytesUsingEncoding:4];
  std::string::resize(&v25, v6, 0);
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v7 = &v25;
  }
  else {
    v7 = (std::string *)v25.__r_.__value_.__r.__words[0];
  }
  if ([(__CFString *)a1 getCString:v7 maxLength:v6 + 1 encoding:4])
  {
    *(_OWORD *)a2 = *(_OWORD *)&v25.__r_.__value_.__l.__data_;
    std::string::size_type v5 = v25.__r_.__value_.__r.__words[2];
    goto LABEL_8;
  }
  if (quasar::gLogLevel >= 4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v8);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"Failed to perform UTF-8 encoding on string: ", 44);
    std::ostream::operator<<();
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)&v8);
  }
  *(unsigned char *)a2 = 0;
  *(unsigned char *)(a2 + 24) = 0;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
}

@end