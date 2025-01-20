@interface UIColor(ChatKit)
+ (uint64_t)ck_colorWithCKColor:()ChatKit;
- (double)ckColor;
@end

@implementation UIColor(ChatKit)

- (double)ckColor
{
  long long v2 = CKColorZero;
  long long v3 = *(_OWORD *)&qword_18F81CEF8;
  [a1 getRed:&v2 green:(char *)&v2 + 8 blue:&v3 alpha:(char *)&v3 + 8];
  return *(double *)&v2;
}

+ (uint64_t)ck_colorWithCKColor:()ChatKit
{
  return objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:");
}

@end