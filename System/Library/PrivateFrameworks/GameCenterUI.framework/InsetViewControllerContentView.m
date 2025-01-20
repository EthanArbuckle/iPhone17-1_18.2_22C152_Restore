@interface InsetViewControllerContentView
- (_TtC12GameCenterUI30InsetViewControllerContentView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI30InsetViewControllerContentView)initWithFrame:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (unint64_t)edgesInsettingLayoutMarginsFromSafeArea;
- (void)setEdgesInsettingLayoutMarginsFromSafeArea:(unint64_t)a3;
@end

@implementation InsetViewControllerContentView

- (_TtC12GameCenterUI30InsetViewControllerContentView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI30InsetViewControllerContentView *)sub_1AF379B20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI30InsetViewControllerContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF379BE8();
}

- (unint64_t)edgesInsettingLayoutMarginsFromSafeArea
{
  v2 = self;
  unint64_t v3 = sub_1AF379CC8();

  return v3;
}

- (void)setEdgesInsettingLayoutMarginsFromSafeArea:(unint64_t)a3
{
  v4 = self;
  sub_1AF379D8C(a3);
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  v2 = self;
  unint64_t v3 = sub_1AF379DD4();

  return v3;
}

- (void).cxx_destruct
{
}

@end