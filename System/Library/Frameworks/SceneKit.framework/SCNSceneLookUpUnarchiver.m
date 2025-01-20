@interface SCNSceneLookUpUnarchiver
+ (BOOL)supportsSecureCoding;
- (SCNSceneLookUpUnarchiver)initWithCoder:(id)a3;
@end

@implementation SCNSceneLookUpUnarchiver

- (SCNSceneLookUpUnarchiver)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNSceneLookUpUnarchiver;
  v4 = [(SCNSceneLookUpUnarchiver *)&v6 init];
  if (v4) {
    [a3 decodeObjectOfClass:objc_opt_class() forKey:@"db"];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end