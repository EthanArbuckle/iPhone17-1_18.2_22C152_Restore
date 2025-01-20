@interface AppPromotionMediaContainerView
- (CGRect)frame;
- (_TtC18ASMessagesProvider30AppPromotionMediaContainerView)init;
- (_TtC18ASMessagesProvider30AppPromotionMediaContainerView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30AppPromotionMediaContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)videoTapGestureRecognized;
@end

@implementation AppPromotionMediaContainerView

- (_TtC18ASMessagesProvider30AppPromotionMediaContainerView)init
{
  return (_TtC18ASMessagesProvider30AppPromotionMediaContainerView *)sub_1DFFC0();
}

- (_TtC18ASMessagesProvider30AppPromotionMediaContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E29AC();
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
  sub_1E0380();
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1E0650();
}

- (void)videoTapGestureRecognized
{
  double v2 = self;
  sub_1E0904();
}

- (_TtC18ASMessagesProvider30AppPromotionMediaContainerView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC18ASMessagesProvider30AppPromotionMediaContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_174B8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30AppPromotionMediaContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30AppPromotionMediaContainerView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30AppPromotionMediaContainerView_artworkFallbackView));
  swift_unknownObjectWeakDestroy();
  double v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider30AppPromotionMediaContainerView_mediaOverlayStyle;
  uint64_t v4 = sub_771910();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider30AppPromotionMediaContainerView_refetchArtworkBlock);

  sub_13308(v5);
}

@end