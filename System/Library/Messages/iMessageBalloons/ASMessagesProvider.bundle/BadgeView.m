@interface BadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)accessibilityValueView;
- (_TtC18ASMessagesProvider9BadgeView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider9BadgeView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCaptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityValueLabel;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)dealloc;
- (void)didTapBadgeView:(id)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BadgeView

- (_TtC18ASMessagesProvider9BadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider9BadgeView *)sub_4B808C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider9BadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4BB60C();
}

- (void)dealloc
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for BadgeView(0);
  [(BadgeView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_leadingValue;
  uint64_t v4 = sub_771380();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_captionCappingType;
  uint64_t v6 = sub_774EF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  v7 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_valueViewAlignment;
  uint64_t v8 = sub_774F00();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_spacing;
  uint64_t v10 = sub_7708F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_action, &qword_9616A0);
  v11 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_badgeType;
  uint64_t v12 = sub_77A4B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_tapGestureRecognizer));

  v13 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_headingLabel);
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_4B9198();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BadgeView(0);
  id v2 = v3.receiver;
  [(BadgeView *)&v3 _dynamicUserInterfaceTraitDidChange];
  sub_4B9320();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_4B9AF4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v3 = self;
  double v4 = sub_4B9E5C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_4BA14C((uint64_t)a3);
}

- (void)didTapBadgeView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_4BB978();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityValueLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_valueLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCaptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_captionLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_headingLabel));
}

- (UIView)accessibilityValueView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC18ASMessagesProvider9BadgeView_valueView));
}

@end