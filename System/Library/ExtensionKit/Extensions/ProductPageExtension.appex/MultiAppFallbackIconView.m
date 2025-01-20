@interface MultiAppFallbackIconView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension24MultiAppFallbackIconView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension24MultiAppFallbackIconView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MultiAppFallbackIconView

- (_TtC20ProductPageExtension24MultiAppFallbackIconView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension24MultiAppFallbackIconView *)sub_10017D5D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension24MultiAppFallbackIconView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10017E240();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10017D838();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  id v6 = [(MultiAppFallbackIconView *)v5 traitCollection];
  double v7 = sub_10017DB7C(width, height);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension24MultiAppFallbackIconView_iconReusePool;
  uint64_t v4 = sub_10000D280(&qword_100954138);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end