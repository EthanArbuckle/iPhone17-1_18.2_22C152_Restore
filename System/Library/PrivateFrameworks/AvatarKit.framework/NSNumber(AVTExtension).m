@interface NSNumber(AVTExtension)
+ (id)avt_numberWithFloat:()AVTExtension roundingBehavior:;
- (id)avt_numberByRoundingWithBehavior:()AVTExtension;
@end

@implementation NSNumber(AVTExtension)

+ (id)avt_numberWithFloat:()AVTExtension roundingBehavior:
{
  v5 = NSNumber;
  id v6 = a4;
  *(float *)&double v7 = a1;
  v8 = [v5 numberWithFloat:v7];
  v9 = objc_msgSend(v8, "avt_numberByRoundingWithBehavior:", v6);

  return v9;
}

- (id)avt_numberByRoundingWithBehavior:()AVTExtension
{
  v4 = (objc_class *)MEMORY[0x263F087B0];
  id v5 = a3;
  id v6 = [v4 alloc];
  [a1 decimalValue];
  double v7 = (void *)[v6 initWithDecimal:v10];
  v8 = [v7 decimalNumberByRoundingAccordingToBehavior:v5];

  return v8;
}

@end