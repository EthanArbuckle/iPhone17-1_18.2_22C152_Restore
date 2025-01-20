@interface AccountActionSectionFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC22SubscribePageExtension30AccountActionSectionFooterView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30AccountActionSectionFooterView)initWithFrame:(CGRect)a3;
- (void)buttonTapped;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)tintColorDidChange;
@end

@implementation AccountActionSectionFooterView

- (_TtC22SubscribePageExtension30AccountActionSectionFooterView)initWithFrame:(CGRect)a3
{
  sub_1000DD744();
  return result;
}

- (_TtC22SubscribePageExtension30AccountActionSectionFooterView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_tapGestureRecognizer) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_isCentered) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_text);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_buttonAction);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC22SubscribePageExtension30AccountActionSectionFooterView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000DCD74();
}

- (void)buttonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_buttonAction);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_10001A4E0((uint64_t)v2);
    v2(v3);
    sub_10001A4D0((uint64_t)v2);
  }
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1000DD290();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000DD524();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_text);
  uint64_t v6 = *(void *)&self->titleLabel[OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_text];
  swift_bridgeObjectRetain();
  v7 = self;
  [(AccountActionSectionFooterView *)v7 layoutMargins];
  double v8 = sub_1000DDA7C(width, v5, v6);
  double v10 = v9;

  swift_bridgeObjectRelease();
  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_titleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_tapGestureRecognizer));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension30AccountActionSectionFooterView_buttonAction);

  sub_10001A4D0(v3);
}

@end