@interface DELog
+ (void)debug:(id)a3;
+ (void)error:(id)a3;
+ (void)info:(id)a3;
@end

@implementation DELog

+ (void)error:(id)a3
{
  id v3 = a3;
  v7 = &v8;
  id v4 = (id) [[NSString alloc] initWithFormat:v3 arguments:&v8];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 3u);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

+ (void)info:(id)a3
{
  id v3 = a3;
  v7 = &v8;
  id v4 = (id) [[NSString alloc] initWithFormat:v3 arguments:&v8];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 0);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

+ (void)debug:(id)a3
{
  id v3 = a3;
  v7 = &v8;
  id v4 = (id) [[NSString alloc] initWithFormat:v3 arguments:&v8];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

@end