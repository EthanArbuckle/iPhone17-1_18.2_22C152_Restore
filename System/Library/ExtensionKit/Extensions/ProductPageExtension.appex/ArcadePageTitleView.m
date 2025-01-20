@interface ArcadePageTitleView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension19ArcadePageTitleView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension19ArcadePageTitleView)initWithFrame:(CGRect)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ArcadePageTitleView

- (_TtC20ProductPageExtension19ArcadePageTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension19ArcadePageTitleView *)sub_100469E38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension19ArcadePageTitleView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v5 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView__contentOffset];
  *(void *)v5 = 0;
  v5[8] = 1;
  v6 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_cachedIntrinsicContentSize];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  v7 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_cachedIntrinsicContentSizeWithTabBar];
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;

  result = (_TtC20ProductPageExtension19ArcadePageTitleView *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_10046A450();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v2 = (char *)v11.receiver;
  [(ArcadePageTitleView *)&v11 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_lockupView];
  sub_100770A80();
  objc_msgSend(v3, "measurementsWithFitting:in:", v2, v4, v5, v11.receiver, v11.super_class);
  double v7 = v6;
  double v9 = v8;
  sub_100770A80();
  double MinX = CGRectGetMinX(v12);
  sub_100770A80();
  objc_msgSend(v3, "setFrame:", MinX, CGRectGetMaxY(v13) - v9, v7, v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = *(void **)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_lockupView];
  double v5 = self;
  [(ArcadePageTitleView *)v5 layoutMargins];
  sub_10077C770();
  objc_msgSend(v4, "sizeThatFits:");
  double v7 = v6;
  sub_10046A2F0();
  double v9 = v8;

  double v10 = v7 + v9;
  double v11 = width;
  result.height = v10;
  result.CGFloat width = v11;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  ObjectType = (objc_class *)swift_getObjectType();
  double v4 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_cachedIntrinsicContentSize];
  *(void *)double v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  double v5 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_cachedIntrinsicContentSizeWithTabBar];
  *(void *)double v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(ArcadePageTitleView *)&v6 invalidateIntrinsicContentSize];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_10046A774(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  double v3 = *(void **)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_lockupView];
}

@end