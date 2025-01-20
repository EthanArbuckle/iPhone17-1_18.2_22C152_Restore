@interface MUAppleRatingRowSubtitleView
- (MUAppleRatingRowSubtitleView)initWithArrangedSubviews:(id)a3;
- (MUAppleRatingRowSubtitleView)initWithCoder:(id)a3;
- (MUAppleRatingRowSubtitleView)initWithFrame:(CGRect)a3;
- (void)contentSizeDidChange;
- (void)layoutSubviews;
- (void)setPercentageString:(id)a3 ratingsValueString:(id)a4 ratingsValueAnimation:(int64_t)a5 ratingsString:(id)a6;
@end

@implementation MUAppleRatingRowSubtitleView

- (MUAppleRatingRowSubtitleView)initWithFrame:(CGRect)a3
{
  return (MUAppleRatingRowSubtitleView *)AppleRatingRowSubtitleView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MUAppleRatingRowSubtitleView)initWithArrangedSubviews:(id)a3
{
  return (MUAppleRatingRowSubtitleView *)sub_1932676E8();
}

- (MUAppleRatingRowSubtitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_193268430();
}

- (void)layoutSubviews
{
  v2 = self;
  AppleRatingRowSubtitleView.layoutSubviews()();
}

- (void)setPercentageString:(id)a3 ratingsValueString:(id)a4 ratingsValueAnimation:(int64_t)a5 ratingsString:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  AppleRatingRowSubtitleView.set(percentageString:ratingsValueString:ratingsValueAnimation:ratingsString:)(a3, a4, a5, (uint64_t)v13);
}

- (void)contentSizeDidChange
{
  v2 = self;
  sub_193267BA4(0, 0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MUAppleRatingRowSubtitleView____lazy_storage___percentLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MUAppleRatingRowSubtitleView____lazy_storage___rollingLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MUAppleRatingRowSubtitleView____lazy_storage___ratingsLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___MUAppleRatingRowSubtitleView____lazy_storage___lineTwoStackView);
}

@end