@interface ATXAggregateKeys
+ (id)abGroupNilString;
+ (id)featureIdentifier;
+ (id)keyWithSubkey:(id)a3;
@end

@implementation ATXAggregateKeys

+ (id)abGroupNilString
{
  return @"unknown";
}

+ (id)featureIdentifier
{
  return @"DEC";
}

+ (id)keyWithSubkey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.duet.expertcenter", a3];
}

@end