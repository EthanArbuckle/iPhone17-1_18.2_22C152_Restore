@interface MDUserAction
+ (BOOL)supportsSecureCoding;
@end

@implementation MDUserAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end