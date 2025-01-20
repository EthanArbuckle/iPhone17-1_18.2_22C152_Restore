@interface SKSceneUnarchiveDummy
+ (BOOL)supportsSecureCoding;
- (SKSceneUnarchiveDummy)initWithCoder:(id)a3;
@end

@implementation SKSceneUnarchiveDummy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSceneUnarchiveDummy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKSceneUnarchiveDummy;
  return [(SKSceneUnarchiveDummy *)&v4 init];
}

@end