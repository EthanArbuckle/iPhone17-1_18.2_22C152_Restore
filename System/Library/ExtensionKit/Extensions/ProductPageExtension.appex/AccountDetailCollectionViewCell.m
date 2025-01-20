@interface AccountDetailCollectionViewCell
- (BOOL)accessibilityDisabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)accessibilityAccessoryView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension31AccountDetailCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31AccountDetailCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapWithAccessoryView:(id)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeDidChangeWithView:(id)a3 previousTraitCollection:(id)a4;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)wasTapped;
@end

@implementation AccountDetailCollectionViewCell

- (BOOL)isSelected
{
  return sub_1003E7FA0(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return sub_1003E7FA0(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (_TtC20ProductPageExtension31AccountDetailCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31AccountDetailCollectionViewCell *)sub_1003E820C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31AccountDetailCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003EB4E0();
}

- (void)wasTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_selectionHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_1000194C0((uint64_t)v2);
    v2(v3);
    sub_1000194B0((uint64_t)v2);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003E8DD8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1003EA26C(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)preferredContentSizeDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  double v7 = self;
  id v8 = [(AccountDetailCollectionViewCell *)v7 traitCollection];
  int v9 = sub_10077C3E0() & 1;

  if (v9 != (sub_10077C3E0() & 1)) {
    sub_1003EA54C();
  }
}

- (void)didTapWithAccessoryView:(id)a3
{
  uint64_t v3 = *(void (**)(void *))((char *)&self->super.super.super.super.super.isa
                                       + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryAction);
  if (v3)
  {
    v8[3] = sub_100019840(0, &qword_100953B20);
    v8[0] = a3;
    id v6 = a3;
    double v7 = self;
    sub_1000194C0((uint64_t)v3);
    v3(v8);
    sub_1000194B0((uint64_t)v3);
    sub_10000FA80((uint64_t)v8, &qword_10094BAD0);
  }
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003EAD68();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_subtitleLabel));
}

- (UIView)accessibilityAccessoryView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryView));
}

- (BOOL)accessibilityDisabled
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_disabled);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessory, (uint64_t *)&unk_100959390);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_topSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_bottomSeparatorView));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_backgroundSelectionView));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_selectionHandler));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_tapGestureRecognizer);
}

@end