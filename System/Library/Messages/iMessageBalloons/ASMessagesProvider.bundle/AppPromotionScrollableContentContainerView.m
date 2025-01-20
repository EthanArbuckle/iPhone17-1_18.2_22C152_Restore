@interface AppPromotionScrollableContentContainerView
- (_TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView)init;
- (_TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation AppPromotionScrollableContentContainerView

- (_TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView)init
{
  return (_TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView *)sub_21F1AC();
}

- (_TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView_protectionMode) = (Class)(&def_270DE0 + 1);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView_isCollapsing) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  uint64_t v6 = enum case for MediaOverlayStyle.matchSystem(_:);
  uint64_t v7 = sub_771910();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView_contentBasedProtectionView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView_fullProtectionView) = 0;
  id v8 = a3;

  result = (_TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21FED4();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_21FFD8((uint64_t)a4, x, y);

  return v10;
}

- (_TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22064C(*(id *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView_protectionMode));
  v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView_mediaOverlayStyle;
  uint64_t v4 = sub_771910();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView_contentBasedProtectionView));
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider42AppPromotionScrollableContentContainerView_fullProtectionView);
}

@end