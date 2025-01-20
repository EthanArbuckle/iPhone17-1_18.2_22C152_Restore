@interface ShadowView
- (_TtC19AppStoreKitInternal10ShadowView)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal10ShadowView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ShadowView

- (void)layoutSubviews
{
  v2 = self;
  sub_1E1B564F0();
}

- (_TtC19AppStoreKitInternal10ShadowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC19AppStoreKitInternal10ShadowView_cornerRadius) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC19AppStoreKitInternal10ShadowView_cornerStyle) = 1;
  v7 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal10ShadowView_previousBounds;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC19AppStoreKitInternal10ShadowView_shadow);
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC19AppStoreKitInternal10ShadowView_shouldAnimateBoundsChange) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ShadowView();
  return -[ShadowView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19AppStoreKitInternal10ShadowView)initWithCoder:(id)a3
{
  return (_TtC19AppStoreKitInternal10ShadowView *)ShadowView.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end