@interface SiriUIHostingView
- (BOOL)shouldAutomaticallyScaleContentInAmbient;
- (BOOL)suppressVibrantBackground;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView)initWithCoder:(id)a3;
- (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SiriUIHostingView

- (BOOL)shouldAutomaticallyScaleContentInAmbient
{
  return 0;
}

- (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView)initWithCoder:(id)a3
{
  result = (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)&self->SiriUICardSnippetView_opaque[OBJC_IVAR____TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView_rootView] sizeThatFits:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(SiriUIHostingView *)&v4 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView_rootView];
  [v2 bounds];
  [v3 setFrame:];
}

- (BOOL)suppressVibrantBackground
{
  return 1;
}

- (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end