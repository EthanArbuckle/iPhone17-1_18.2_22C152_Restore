@interface AnnotationCollectionViewCell
- (BOOL)accessibilityCellIsExpanded;
- (BOOL)accessibilityIsSummaryExpandable;
- (NSArray)accessibilityDetailItems;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityLinkLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension28AnnotationCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)accessibilityLinkLabelTapped;
- (void)layoutSubviews;
- (void)linkLabelTapped:(id)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AnnotationCollectionViewCell

- (_TtC20ProductPageExtension28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension28AnnotationCollectionViewCell *)sub_10032CD24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension28AnnotationCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003304A8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10032D4B0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10032D8B0();
}

- (void)linkLabelTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003306D0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10032EBE0((uint64_t)a3);
}

- (NSArray)accessibilityDetailItems
{
  v2 = self;
  sub_10032ED4C();

  v3.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_summaryLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityLinkLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_linkLabel));
}

- (BOOL)accessibilityCellIsExpanded
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_isExpanded);
}

- (BOOL)accessibilityIsSummaryExpandable
{
  v2 = self;
  BOOL v3 = sub_10032B380();

  return v3;
}

- (void)accessibilityLinkLabelTapped
{
  v2 = self;
  sub_1003306D0();
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_disclosureView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_linkLabel));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_detailViewPool;
  uint64_t v4 = sub_10000D280((uint64_t *)&unk_10095BF10);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_separatorLineView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension28AnnotationCollectionViewCell_linkAction, &qword_10095BF20);
}

@end