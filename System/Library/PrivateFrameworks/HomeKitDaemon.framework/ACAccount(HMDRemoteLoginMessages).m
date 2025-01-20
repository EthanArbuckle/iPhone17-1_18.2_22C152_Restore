@interface ACAccount(HMDRemoteLoginMessages)
- (id)messagePayload;
@end

@implementation ACAccount(HMDRemoteLoginMessages)

- (id)messagePayload
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"kRemoteLoginAccount";
  v0 = encodeRootObject();
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

@end