@interface LoadingView
- (_TtC13FTMInternal_411LoadingView)initWithCoder:(id)a3;
- (_TtC13FTMInternal_411LoadingView)initWithFrame:(CGRect)a3;
@end

@implementation LoadingView

- (_TtC13FTMInternal_411LoadingView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_411LoadingView_shouldHideLoadingView) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_411LoadingView____lazy_storage___activityIndicator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_411LoadingView____lazy_storage___loadingLabel) = 0;
  id v4 = a3;

  result = (_TtC13FTMInternal_411LoadingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC13FTMInternal_411LoadingView)initWithFrame:(CGRect)a3
{
  result = (_TtC13FTMInternal_411LoadingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_411LoadingView____lazy_storage___activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_411LoadingView____lazy_storage___loadingLabel));

  swift_bridgeObjectRelease();
}

@end