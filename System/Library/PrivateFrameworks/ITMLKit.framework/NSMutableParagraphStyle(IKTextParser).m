@interface NSMutableParagraphStyle(IKTextParser)
- (void)ik_applyViewElementStyle:()IKTextParser;
@end

@implementation NSMutableParagraphStyle(IKTextParser)

- (void)ik_applyViewElementStyle:()IKTextParser
{
  v4 = [a3 lineHeight];
  if (v4)
  {
    id v10 = v4;
    uint64_t v5 = objc_msgSend(v4, "ik_unit");
    [v10 doubleValue];
    double v7 = v6;
    if (v5 == 1)
    {
      [a1 setMaximumLineHeight:v6];
      [v10 doubleValue];
      objc_msgSend(a1, "setMinimumLineHeight:");
    }
    else
    {
      uint64_t v8 = objc_msgSend(v10, "ik_unit");
      double v9 = v7 / 100.0;
      if (v8 != 2) {
        double v9 = v7;
      }
      [a1 setLineHeightMultiple:v9];
    }
    v4 = v10;
  }
}

@end