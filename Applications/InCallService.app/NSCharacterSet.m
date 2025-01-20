@interface NSCharacterSet
+ (id)pauseCharacterSet;
+ (id)starAndOctothorpeCharacterSet;
+ (id)unicodeDirectionalCharactersSet;
@end

@implementation NSCharacterSet

+ (id)unicodeDirectionalCharactersSet
{
  return +[NSCharacterSet characterSetWithRange:](NSCharacterSet, "characterSetWithRange:", 8234, 4);
}

+ (id)pauseCharacterSet
{
  return +[NSCharacterSet characterSetWithCharactersInString:@";,"];
}

+ (id)starAndOctothorpeCharacterSet
{
  return +[NSCharacterSet characterSetWithCharactersInString:@"*#"];
}

@end