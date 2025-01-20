@interface NSCharacterSet
+ (id)hexadecimalCharacterSet;
@end

@implementation NSCharacterSet

+ (id)hexadecimalCharacterSet
{
  return +[NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
}

@end