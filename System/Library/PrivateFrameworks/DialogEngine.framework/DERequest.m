@interface DERequest
+ (id)parseRequest:(id)a3 params:(id)a4 locale:(id)a5;
@end

@implementation DERequest

+ (id)parseRequest:(id)a3 params:(id)a4 locale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(&v14, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&v13, (char *)[v8 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&v12, (char *)[v9 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  siri::dialogengine::ParseRequestFromJson(&v15);
}

@end