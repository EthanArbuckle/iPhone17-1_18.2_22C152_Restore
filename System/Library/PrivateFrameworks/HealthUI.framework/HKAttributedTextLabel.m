@interface HKAttributedTextLabel
- (CGSize)intrinsicContentSize;
@end

@implementation HKAttributedTextLabel

- (CGSize)intrinsicContentSize
{
  v5.receiver = self;
  v5.super_class = (Class)HKAttributedTextLabel;
  [(HKAttributedTextLabel *)&v5 intrinsicContentSize];
  *(float *)&double v3 = v3;
  double v4 = ceilf(*(float *)&v3);
  result.height = v4;
  result.width = v2;
  return result;
}

@end