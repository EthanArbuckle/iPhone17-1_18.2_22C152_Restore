@interface BreakoutDetailsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC18ASMessagesProvider19BreakoutDetailsView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider19BreakoutDetailsView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityBadgeLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC19AppStoreKitInternal17DynamicTypeButton)accessibilityCallToActionButton;
- (void)didTapActionButton;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BreakoutDetailsView

- (_TtC18ASMessagesProvider19BreakoutDetailsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_63F720();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_63F0E4((uint64_t)a4, (char *)v6);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_63F0E4((uint64_t)v3, (char *)v3);
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_63CBF4();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  double v5 = (char *)v7.receiver;
  [(BreakoutDetailsView *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_backgroundMaterialView], "contentView", v7.receiver, v7.super_class);
  sub_63A470();
  sub_77DFA0();
  objc_msgSend(v6, "setLayoutMargins:");

  sub_6397EC();
  sub_63B378();
  [v5 setNeedsLayout];
}

- (void)didTapActionButton
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_callToActionButtonHandler);
  if (v2)
  {
    id v4 = self;
    uint64_t v3 = sub_13318((uint64_t)v2);
    v2(v3);
    sub_13308((uint64_t)v2);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityBadgeLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_badgeLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_descriptionLabel));
}

- (_TtC19AppStoreKitInternal17DynamicTypeButton)accessibilityCallToActionButton
{
  return (_TtC19AppStoreKitInternal17DynamicTypeButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_callToActionButton));
}

- (_TtC18ASMessagesProvider19BreakoutDetailsView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18ASMessagesProvider19BreakoutDetailsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_badge;
  uint64_t v4 = sub_7701A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_badgeWordmark));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_callToActionButton));
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_callToActionButtonHandler));
  double v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_config;
  uint64_t v6 = sub_FD50((uint64_t *)&unk_95A700);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_super v7 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_detailTextAlignment;
  uint64_t v8 = sub_770150();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider19BreakoutDetailsView_detailBackgroundStyle, &qword_95F588);
}

@end