@interface SVSLEDPasscodeActivityIndicatorView
- (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView)init;
- (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView)initWithCoder:(id)a3;
- (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView)initWithFrame:(CGRect)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
@end

@implementation SVSLEDPasscodeActivityIndicatorView

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10008F154(v5);
}

- (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView)init
{
  return (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView *)sub_10008CE04();
}

- (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10008F360();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10008D220();
}

- (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView)initWithFrame:(CGRect)a3
{
  result = (_TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_viewFinderTintLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_viewFinderBorderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_borderLayerMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService35SVSLEDPasscodeActivityIndicatorView_initialWhiteTintLayer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end