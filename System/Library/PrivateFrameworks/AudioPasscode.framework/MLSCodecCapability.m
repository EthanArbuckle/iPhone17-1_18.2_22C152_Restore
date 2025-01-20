@interface MLSCodecCapability
+ (BOOL)supportsSecureCoding;
- (MLSCodecCapability)init;
- (MLSCodecCapability)initWithCoder:(id)a3;
@end

@implementation MLSCodecCapability

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MLSCodecCapability)init
{
  v3.receiver = self;
  v3.super_class = (Class)MLSCodecCapability;
  return [(AUPasscodeCodecCapability *)&v3 initWithAlgorithmName:@"mls "];
}

- (MLSCodecCapability)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MLSCodecCapability;
  return [(AUPasscodeCodecCapability *)&v4 init];
}

@end