@interface AppPromotionScrollableContentContainerView
- (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView)init;
- (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation AppPromotionScrollableContentContainerView

- (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView)init
{
  return (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *)sub_1004297DC();
}

- (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_protectionMode) = (Class)1;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_isCollapsing) = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  uint64_t v6 = enum case for MediaOverlayStyle.matchSystem(_:);
  uint64_t v7 = sub_10076FE10();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_contentBasedProtectionView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_fullProtectionView) = 0;
  id v8 = a3;

  result = (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10042A504();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_10042A608((uint64_t)a4, x, y);

  return v10;
}

- (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension42AppPromotionScrollableContentContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10042AC7C(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_protectionMode));
  v3 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  uint64_t v4 = sub_10076FE10();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_contentBasedProtectionView));
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension42AppPromotionScrollableContentContainerView_fullProtectionView);
}

@end