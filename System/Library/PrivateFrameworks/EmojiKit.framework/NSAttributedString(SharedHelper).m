@interface NSAttributedString(SharedHelper)
+ (id)emptyAttributedStringOfLength_emk:()SharedHelper;
@end

@implementation NSAttributedString(SharedHelper)

+ (id)emptyAttributedStringOfLength_emk:()SharedHelper
{
  v4 = [&stru_1F4063248 stringByPaddingToLength:a3 withString:@" " startingAtIndex:0];
  v5 = (void *)[[a1 alloc] initWithString:v4];

  return v5;
}

@end