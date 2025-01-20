@interface _MarkupViewController
+ (double)_maxImageDimensionInView;
- (BOOL)_canShowWhileLocked;
- (CGSize)adjustedSourceImageSize;
- (_TtC16ContinuityMarkup21_MarkupViewController)initWithCoder:(id)a3;
- (_TtC16ContinuityMarkup21_MarkupViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation _MarkupViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (double)_maxImageDimensionInView
{
  return 5120.0;
}

- (CGSize)adjustedSourceImageSize
{
  double v2 = sub_100007C94();
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC16ContinuityMarkup21_MarkupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC16ContinuityMarkup21_MarkupViewController *)sub_100007D50((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100007CA8);
}

- (_TtC16ContinuityMarkup21_MarkupViewController)initWithCoder:(id)a3
{
  return (_TtC16ContinuityMarkup21_MarkupViewController *)sub_100007DC4(a3);
}

@end