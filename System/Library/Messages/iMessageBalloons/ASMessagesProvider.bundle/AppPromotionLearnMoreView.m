@interface AppPromotionLearnMoreView
- (_TtC18ASMessagesProvider25AppPromotionLearnMoreView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider25AppPromotionLearnMoreView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppPromotionLearnMoreView

- (_TtC18ASMessagesProvider25AppPromotionLearnMoreView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_6DA478();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_6D9CA4();
}

- (_TtC18ASMessagesProvider25AppPromotionLearnMoreView)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider25AppPromotionLearnMoreView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider25AppPromotionLearnMoreView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider25AppPromotionLearnMoreView_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider25AppPromotionLearnMoreView_learnMoreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider25AppPromotionLearnMoreView_backButtonAction));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider25AppPromotionLearnMoreView_mediaOverlayStyle;
  uint64_t v4 = sub_771910();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end