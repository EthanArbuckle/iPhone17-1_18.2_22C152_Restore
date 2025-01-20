@interface CondensedInAppPurchaseContentView
- (_TtC22SubscribePageExtension33CondensedInAppPurchaseContentView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension33CondensedInAppPurchaseContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CondensedInAppPurchaseContentView

- (_TtC22SubscribePageExtension33CondensedInAppPurchaseContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension33CondensedInAppPurchaseContentView *)sub_100100F18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension33CondensedInAppPurchaseContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001045C8();
}

- (void)layoutSubviews
{
  v2 = self;
  CondensedInAppPurchaseContentView.layoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  CondensedInAppPurchaseContentView.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_inAppPurchaseView));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_metrics;
  uint64_t v4 = sub_100756BA0();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end