@interface RadioWaveformView
- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView)initWithCoder:(id)a3;
- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView)initWithFrame:(CGRect)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation RadioWaveformView

- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView)initWithFrame:(CGRect)a3
{
  return (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView *)sub_100032818(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)willMoveToWindow:(id)a3
{
  v4 = self;
  v7 = v4;
  if (a3
    && (id v5 = a3,
        v6 = (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView *)[v5 rootViewController], v4 = v7, v6))
  {
    [*(id *)((char *)&v7->super.super.super.isa+ OBJC_IVAR____TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView_host) willMoveToParentViewController:v6];

    a3 = v7;
    v7 = v6;
  }
  else
  {
    [*(id *)((char *)&v4->super.super.super.isa+ OBJC_IVAR____TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView_host) willMoveToParentViewController:0];
  }
}

- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView)initWithCoder:(id)a3
{
  result = (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09717RadioWaveformView_host));
}

@end