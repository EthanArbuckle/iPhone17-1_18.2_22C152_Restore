@interface MUIManualSummaryView
- (MUIManualSummaryView)initWithCoder:(id)a3;
- (MUIManualSummaryView)initWithFrame:(CGRect)a3;
- (void)didTapButton;
- (void)updateConstraints;
- (void)updateTextView;
@end

@implementation MUIManualSummaryView

- (MUIManualSummaryView)initWithFrame:(CGRect)a3
{
  return (MUIManualSummaryView *)ManualSummaryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MUIManualSummaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DDE09828();
}

- (void)updateConstraints
{
  v2 = self;
  ManualSummaryView.updateConstraints()();
}

- (void)didTapButton
{
  v2 = self;
  sub_1DDE07D10();
}

- (void)updateTextView
{
  v2 = self;
  sub_1DDE0D320();
}

- (void).cxx_destruct
{
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MUIManualSummaryView____lazy_storage___titleLabel));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_buttonBaselineConstraint));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_buttonCenterYConstaint));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_buttonTrailingConstraint));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView____lazy_storage___button));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_textViewHeightConstraint));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_textViewTopConstraint));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_textViewBottomConstraint));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView____lazy_storage___textView));
  sub_1DDD31BC0();
}

@end