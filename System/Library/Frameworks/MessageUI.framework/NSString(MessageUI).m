@interface NSString(MessageUI)
- (uint64_t)ef_repeatedStringTimes:()MessageUI;
@end

@implementation NSString(MessageUI)

- (uint64_t)ef_repeatedStringTimes:()MessageUI
{
  uint64_t v4 = [a1 length] * a3;

  return [&stru_1F0817A00 stringByPaddingToLength:v4 withString:a1 startingAtIndex:0];
}

@end