@interface MLSCodecConfiguration
+ (BOOL)supportsSecureCoding;
- (MLSCodecConfiguration)init;
@end

@implementation MLSCodecConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MLSCodecConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)MLSCodecConfiguration;
  return [(MLSCodecConfiguration *)&v3 init];
}

@end