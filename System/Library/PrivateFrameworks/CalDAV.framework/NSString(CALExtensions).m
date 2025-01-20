@interface NSString(CALExtensions)
+ (id)ellipsisString;
@end

@implementation NSString(CALExtensions)

+ (id)ellipsisString
{
  __int16 v2 = 8230;
  v0 = [NSString stringWithCharacters:&v2 length:1];
  return v0;
}

@end