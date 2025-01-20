@interface OSLaunchdError
+ (id)createXPCError:(int)a3;
@end

@implementation OSLaunchdError

+ (id)createXPCError:(int)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v4 = [NSString stringWithUTF8String:xpc_strerror()];
  uint64_t v8 = *MEMORY[0x263F08338];
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [MEMORY[0x263F087E8] errorWithDomain:@"OSLaunchdErrorDomain" code:a3 userInfo:v5];

  return v6;
}

@end