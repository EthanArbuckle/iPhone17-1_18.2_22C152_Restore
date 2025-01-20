@interface HorizontalMeterView
- (_TtC16HearingAppPlugin19HorizontalMeterView)initWithCoder:(id)a3;
- (_TtC16HearingAppPlugin19HorizontalMeterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HorizontalMeterView

- (_TtC16HearingAppPlugin19HorizontalMeterView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth) = 0;
  id v4 = a3;

  result = (_TtC16HearingAppPlugin19HorizontalMeterView *)sub_240A05258();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  HorizontalMeterView.layoutSubviews()();
}

- (_TtC16HearingAppPlugin19HorizontalMeterView)initWithFrame:(CGRect)a3
{
  result = (_TtC16HearingAppPlugin19HorizontalMeterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_model);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_model));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewOffset));
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HearingAppPlugin19HorizontalMeterView_foregroundViewWidth);
}

@end