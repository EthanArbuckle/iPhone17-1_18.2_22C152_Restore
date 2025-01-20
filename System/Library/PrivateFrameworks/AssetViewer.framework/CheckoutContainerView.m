@interface CheckoutContainerView
- (UILabel)titleLabel;
- (UIStackView)verticalTextStackView;
- (_TtC11AssetViewer21CheckoutContainerView)initWithCoder:(id)a3;
- (_TtC11AssetViewer21CheckoutContainerView)initWithFrame:(CGRect)a3;
- (void)contentSizeCategoryDidChangeWithNotification:(id)a3;
- (void)layoutSubviews;
@end

@implementation CheckoutContainerView

- (UIStackView)verticalTextStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_verticalTextStackView));
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_titleLabel));
}

- (_TtC11AssetViewer21CheckoutContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E2981224();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CheckoutContainerView();
  id v2 = v3.receiver;
  [(CheckoutContainerView *)&v3 layoutSubviews];
  sub_1E297F178();
}

- (void)contentSizeCategoryDidChangeWithNotification:(id)a3
{
  uint64_t v4 = sub_1E2991818();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E29917F8();
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_traitManager);
  v9 = self;
  v10 = self;
  id v11 = objc_msgSend(v9, sel_currentTraitCollection);
  id v12 = objc_msgSend(v11, sel_preferredContentSizeCategory);

  v13 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v12;

  sub_1E297F178();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11AssetViewer21CheckoutContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC11AssetViewer21CheckoutContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_parentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_verticalTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_subTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_ctaButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_applePayButton));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_rightParentStackViewConstraint);
}

@end