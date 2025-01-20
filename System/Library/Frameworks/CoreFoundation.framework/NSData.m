@interface NSData
+ (BOOL)supportsSecureCoding;
@end

@implementation NSData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end