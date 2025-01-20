@interface AppPromotionMediaContainerView
- (CGRect)frame;
- (_TtC20ProductPageExtension30AppPromotionMediaContainerView)init;
- (_TtC20ProductPageExtension30AppPromotionMediaContainerView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension30AppPromotionMediaContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)videoTapGestureRecognized;
@end

@implementation AppPromotionMediaContainerView

- (_TtC20ProductPageExtension30AppPromotionMediaContainerView)init
{
  return (_TtC20ProductPageExtension30AppPromotionMediaContainerView *)sub_100649368();
}

- (_TtC20ProductPageExtension30AppPromotionMediaContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10064BC40();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(AppPromotionMediaContainerView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = self;
  [(AppPromotionMediaContainerView *)&v11 frame];
  v10.receiver = v9;
  v10.super_class = ObjectType;
  -[AppPromotionMediaContainerView setFrame:](&v10, "setFrame:", x, y, width, height);
  sub_100649728();
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1006499F8();
}

- (void)videoTapGestureRecognized
{
  double v2 = self;
  sub_100649CAC();
}

- (_TtC20ProductPageExtension30AppPromotionMediaContainerView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC20ProductPageExtension30AppPromotionMediaContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000F76C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30AppPromotionMediaContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30AppPromotionMediaContainerView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30AppPromotionMediaContainerView_artworkFallbackView));
  swift_unknownObjectWeakDestroy();
  double v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension30AppPromotionMediaContainerView_mediaOverlayStyle;
  uint64_t v4 = sub_10076FE10();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension30AppPromotionMediaContainerView_refetchArtworkBlock);

  sub_1000194B0(v5);
}

@end