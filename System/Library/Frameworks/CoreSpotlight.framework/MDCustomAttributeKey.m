@interface MDCustomAttributeKey
+ (BOOL)supportsSecureCoding;
@end

@implementation MDCustomAttributeKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end