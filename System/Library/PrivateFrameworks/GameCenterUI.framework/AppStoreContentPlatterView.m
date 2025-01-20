@interface AppStoreContentPlatterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI26AppStoreContentPlatterView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI26AppStoreContentPlatterView)initWithFrame:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (void)addSubview:(id)a3;
- (void)layoutSubviews;
@end

@implementation AppStoreContentPlatterView

- (_TtC12GameCenterUI26AppStoreContentPlatterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6893E0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1AF68974C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF689A88();
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF68A1D8((uint64_t)v4);
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

- (_TtC12GameCenterUI26AppStoreContentPlatterView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_materialBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_contentContainer));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_titleActionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_loadingIndicator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_errorView);
}

@end