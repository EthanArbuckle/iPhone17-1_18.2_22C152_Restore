@interface NullCodecCapability
+ (BOOL)supportsSecureCoding;
- (NullCodecCapability)init;
- (NullCodecCapability)initWithCoder:(id)a3;
@end

@implementation NullCodecCapability

- (NullCodecCapability)init
{
  v3.receiver = self;
  v3.super_class = (Class)NullCodecCapability;
  return [(AUPasscodeCodecCapability *)&v3 initWithAlgorithmName:@"null"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NullCodecCapability)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NullCodecCapability;
  return [(AUPasscodeCodecCapability *)&v4 initWithAlgorithmName:@"null"];
}

@end