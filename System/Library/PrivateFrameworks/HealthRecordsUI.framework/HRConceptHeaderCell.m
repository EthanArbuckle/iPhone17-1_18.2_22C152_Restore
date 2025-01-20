@interface HRConceptHeaderCell
+ (id)defaultReuseIdentifier;
- (HRConceptHeaderCell)initWithCoder:(id)a3;
- (HRConceptHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)title;
- (UIColor)categoryColor;
- (UIImage)headerImage;
- (int64_t)intendedPlacement;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_updateForCurrentSizeCategory;
- (void)setCategoryColor:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setIntendedPlacement:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUpConstraints;
- (void)setupSubviews;
@end

@implementation HRConceptHeaderCell

- (UIImage)headerImage
{
  return (UIImage *)sub_1C25194E8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRConceptHeaderCell_headerImage);
}

- (void)setHeaderImage:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C2519084(a3);
}

- (NSString)title
{
  v2 = (char *)self + OBJC_IVAR___HRConceptHeaderCell_title;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1C254F470();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1C25192A4(v4, v6);
}

- (UIColor)categoryColor
{
  return (UIColor *)sub_1C25194E8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRConceptHeaderCell_categoryColor);
}

- (void)setCategoryColor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1C25195DC(a3);
}

+ (id)defaultReuseIdentifier
{
  swift_getObjCClassMetadata();
  sub_1C251A540();
  sub_1C254F4F0();
  v2 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)setupSubviews
{
  v2 = self;
  sub_1C2519854();
}

- (void)setUpConstraints
{
  v2 = self;
  sub_1C25199F8();
}

- (int64_t)intendedPlacement
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConceptHeaderCell();
  return [(WDMedicalRecordGroupableCell *)&v3 intendedPlacement];
}

- (void)setIntendedPlacement:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1C2519E84((id)a3);
}

- (void)_updateForCurrentSizeCategory
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HRConceptHeaderCell_titleLabel);
  uint64_t v4 = self;
  uint64_t v5 = *MEMORY[0x1E4FB2950];
  uint64_t v6 = self;
  id v7 = objc_msgSend(v4, sel__preferredFontForTextStyle_variant_, v5, 1024);
  objc_msgSend(v3, sel_setFont_, v7);
}

- (void)_traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1C251A02C(a3);
}

- (HRConceptHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C254F470();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (HRConceptHeaderCell *)ConceptHeaderCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (HRConceptHeaderCell)initWithCoder:(id)a3
{
  return (HRConceptHeaderCell *)ConceptHeaderCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HRConceptHeaderCell____lazy_storage___bottomConstraint));

  swift_bridgeObjectRelease();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HRConceptHeaderCell_categoryColor);
}

@end