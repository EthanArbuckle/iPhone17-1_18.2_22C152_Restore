@interface MDLocalizedString
+ (BOOL)supportsSecureCoding;
@end

@implementation MDLocalizedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end