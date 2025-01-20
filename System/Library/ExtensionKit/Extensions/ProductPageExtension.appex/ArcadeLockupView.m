@interface ArcadeLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityIdentifier;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton;
- (_TtC20ProductPageExtension16ArcadeLockupView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension16ArcadeLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)offerButtonWasTapped;
- (void)setAccessibilityIdentifier:(id)a3;
@end

@implementation ArcadeLockupView

- (_TtC20ProductPageExtension16ArcadeLockupView)initWithFrame:(CGRect)a3
{
  uint64_t v4 = OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerButton;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for OfferButton()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerLabelPresenter);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerButtonTapHandler);
  void *v6 = 0;
  v6[1] = 0;

  result = (_TtC20ProductPageExtension16ArcadeLockupView *)sub_10077D120();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension16ArcadeLockupView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerButton;
  id v6 = objc_allocWithZone((Class)type metadata accessor for OfferButton());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerLabelPresenter);
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerButtonTapHandler);
  void *v9 = 0;
  v9[1] = 0;

  result = (_TtC20ProductPageExtension16ArcadeLockupView *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  sub_1001A4D88();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001A5050();
}

- (void)offerButtonWasTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerButtonTapHandler);
  if (v2)
  {
    uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerButton);
    double v4 = self;
    sub_1000194C0((uint64_t)v2);
    v2(v3);
    sub_1000194B0((uint64_t)v2);
  }
}

- (NSString)accessibilityIdentifier
{
  swift_getObjectType();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  double v4 = self;
  double v5 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v6 = sub_10077BCB0();
  uint64_t v8 = v7;

  sub_100448A1C(v6, v8, 0, 0);
  swift_bridgeObjectRelease();
  NSString v9 = sub_10077BC80();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  if (a3)
  {
    sub_10077BCB0();
    double v4 = self;
    NSString v5 = sub_10077BC80();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ArcadeLockupView();
  [(ArcadeLockupView *)&v7 setAccessibilityIdentifier:v5];
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_subtitleLabel));
}

- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC20ProductPageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                            + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerButton));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerButton));
  sub_10001172C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerLabelPresenter);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_metrics;
  uint64_t v4 = sub_1007706E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension16ArcadeLockupView_offerButtonTapHandler);

  sub_1000194B0(v5);
}

@end