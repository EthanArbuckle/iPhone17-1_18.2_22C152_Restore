@interface GCGenericArcadeStickModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
@end

@implementation GCGenericArcadeStickModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)description
{
  return @"Arcade Stick Model";
}

@end