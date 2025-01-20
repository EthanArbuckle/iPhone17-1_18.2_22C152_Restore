@interface ACAccount(HMDRemoteLoginMessages)
- (id)messagePayload;
@end

@implementation ACAccount(HMDRemoteLoginMessages)

- (id)messagePayload
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"kRemoteLoginAccount";
  v0 = encodeRootObject();
  v4[0] = v0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

@end