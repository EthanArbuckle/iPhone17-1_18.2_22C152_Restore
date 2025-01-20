@interface InAppPurchaseSearchResultContentView
- (_TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InAppPurchaseSearchResultContentView

- (_TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView *)sub_3678C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_metrics;
  uint64_t v5 = qword_94EC58;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_76CFB0();
  uint64_t v8 = sub_FDF4(v7, (uint64_t)qword_9B23E0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))((char *)self + v4, v8, v7);
  uint64_t v9 = OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_bodyBackgroundColor;
  sub_FE2C(0, (unint64_t *)&qword_94FFD0);
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)sub_77E3C0();

  result = (_TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_36835C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_3687BC(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_metrics;
  uint64_t v4 = sub_76CFB0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_bodyBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_inAppPurchaseLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_body));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_iconView));
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider36InAppPurchaseSearchResultContentView_inAppDescription);
}

@end