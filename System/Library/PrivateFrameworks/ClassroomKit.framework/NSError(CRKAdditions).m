@interface NSError(CRKAdditions)
+ (id)crk_errorForSecurityOSStatus:()CRKAdditions;
+ (id)crk_errorWithPOSIXCode:()CRKAdditions;
@end

@implementation NSError(CRKAdditions)

+ (id)crk_errorForSecurityOSStatus:()CRKAdditions
{
  v10[1] = *MEMORY[0x263EF8340];
  if (status)
  {
    CFStringRef v4 = SecCopyErrorMessageString(status, 0);
    v5 = (__CFString *)v4;
    if (v4)
    {
      uint64_t v9 = *MEMORY[0x263F08320];
      v10[0] = v4;
      v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      v6 = 0;
    }
    v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:status userInfo:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)crk_errorWithPOSIXCode:()CRKAdditions
{
  v11[1] = *MEMORY[0x263EF8340];
  CFStringRef v4 = strerror(__errnum);
  if (v4)
  {
    uint64_t v5 = [NSString stringWithUTF8String:v4];
    v6 = (void *)v5;
    if (v5)
    {
      uint64_t v10 = *MEMORY[0x263F08320];
      v11[0] = v5;
      v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:__errnum userInfo:v7];

  return v8;
}

@end