@interface UIScreen(MailUI)
+ (double)mui_maxDimension;
+ (uint64_t)mui_isLargeFormatPad;
@end

@implementation UIScreen(MailUI)

+ (uint64_t)mui_isLargeFormatPad
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad");
  if (result)
  {
    objc_msgSend(MEMORY[0x1E4FB1BA8], "mui_maxDimension");
    return v1 > 1200.0;
  }
  return result;
}

+ (double)mui_maxDimension
{
  v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v0 bounds];
  double v2 = v1;
  [v0 bounds];
  if (v2 < v3) {
    double v2 = v3;
  }

  return v2;
}

@end