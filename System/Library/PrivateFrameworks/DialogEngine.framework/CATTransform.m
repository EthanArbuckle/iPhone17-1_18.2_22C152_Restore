@interface CATTransform
+ (id)capitalize:(id)a3 forLocale:(id)a4;
+ (id)lowerFirst:(id)a3 forLocale:(id)a4;
+ (id)lowercase:(id)a3 forLocale:(id)a4;
+ (id)quote:(id)a3 forLocale:(id)a4;
+ (id)upperFirst:(id)a3 forLocale:(id)a4;
+ (id)uppercase:(id)a3 forLocale:(id)a4;
@end

@implementation CATTransform

+ (id)upperFirst:(id)a3 forLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v6 UTF8String]);
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "upperfirst");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v8 = &v17;
  }
  else {
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  v9 = [NSString stringWithUTF8String:v8];
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }

  return v9;
}

+ (id)uppercase:(id)a3 forLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v6 UTF8String]);
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "uppercase");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v8 = &v17;
  }
  else {
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  v9 = [NSString stringWithUTF8String:v8];
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }

  return v9;
}

+ (id)quote:(id)a3 forLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v6 UTF8String]);
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "quote");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v8 = &v17;
  }
  else {
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  v9 = [NSString stringWithUTF8String:v8];
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }

  return v9;
}

+ (id)lowerFirst:(id)a3 forLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v6 UTF8String]);
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "lowerfirst");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v8 = &v17;
  }
  else {
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  v9 = [NSString stringWithUTF8String:v8];
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }

  return v9;
}

+ (id)lowercase:(id)a3 forLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v6 UTF8String]);
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "lowercase");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v8 = &v17;
  }
  else {
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  v9 = [NSString stringWithUTF8String:v8];
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }

  return v9;
}

+ (id)capitalize:(id)a3 forLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(v15, (char *)[v6 UTF8String]);
  id v7 = v5;
  std::string::basic_string[abi:ne180100]<0>(v13, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "capitalize");
  siri::dialogengine::TransformText((uint64_t)v15, (uint64_t)v13, (uint64_t)__p, &v17);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v8 = &v17;
  }
  else {
    v8 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  v9 = [NSString stringWithUTF8String:v8];
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }

  return v9;
}

@end