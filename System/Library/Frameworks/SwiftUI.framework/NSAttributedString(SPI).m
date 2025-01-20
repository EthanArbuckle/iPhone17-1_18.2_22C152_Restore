@interface NSAttributedString(SPI)
- (uint64_t)isEmptyOrTerminatedByParagraphSeparator;
@end

@implementation NSAttributedString(SPI)

- (uint64_t)isEmptyOrTerminatedByParagraphSeparator
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  v4 = [a1 string];
  int v5 = [v4 characterAtIndex:v3 - 1];

  BOOL v6 = v5 == 8233;
  if (v5 == 13) {
    BOOL v6 = 1;
  }
  unsigned int v7 = v5 == 10 || v6;
  if ((v5 - 14) >= 0x201B) {
    return v7;
  }
  else {
    return 0;
  }
}

@end