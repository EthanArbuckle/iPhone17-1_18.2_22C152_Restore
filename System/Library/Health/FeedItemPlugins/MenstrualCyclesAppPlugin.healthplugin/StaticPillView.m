@interface StaticPillView
- (CGSize)intrinsicContentSize;
- (_TtC24MenstrualCyclesAppPlugin14StaticPillView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin14StaticPillView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation StaticPillView

- (_TtC24MenstrualCyclesAppPlugin14StaticPillView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin14StaticPillView *)sub_2411D083C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin14StaticPillView)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin14StaticPillView *)sub_2411D09CC(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView_configuration);
  double v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView_configuration);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StaticPillView();
  id v2 = v4.receiver;
  [(StaticPillView *)&v4 layoutSubviews];
  sub_2411D19AC();
  double v3 = self;
  objc_msgSend(v3, sel_begin, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setDisableActions_, 1);
  sub_2411D1D28(v2);
  objc_msgSend(v3, sel_commit);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___fertilityProjectionReversed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___menstruationProjectionHighReversed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___menstruationProjectionLowReversed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___pill));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___pillMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___menstruationIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___menstruationIndicatorMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___logIndicator));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___pregnancyBorderLayer);
}

@end