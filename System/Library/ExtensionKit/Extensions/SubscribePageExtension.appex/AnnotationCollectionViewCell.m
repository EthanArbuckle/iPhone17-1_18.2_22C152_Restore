@interface AnnotationCollectionViewCell
- (BOOL)accessibilityCellIsExpanded;
- (BOOL)accessibilityIsSummaryExpandable;
- (NSArray)accessibilityDetailItems;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityLinkLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension28AnnotationCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)accessibilityLinkLabelTapped;
- (void)layoutSubviews;
- (void)linkLabelTapped:(id)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AnnotationCollectionViewCell

- (_TtC22SubscribePageExtension28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28AnnotationCollectionViewCell *)sub_10028D254(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28AnnotationCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002912B4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10028D9E0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10028DDE0();
}

- (void)linkLabelTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002914DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10028F954((uint64_t)a3);
}

- (NSArray)accessibilityDetailItems
{
  v2 = self;
  sub_10028FAC0();

  v3.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_summaryLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityLinkLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_linkLabel));
}

- (BOOL)accessibilityCellIsExpanded
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_isExpanded);
}

- (BOOL)accessibilityIsSummaryExpandable
{
  v2 = self;
  BOOL v3 = sub_10028E898();

  return v3;
}

- (void)accessibilityLinkLabelTapped
{
  v2 = self;
  sub_1002914DC();
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_disclosureView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_linkLabel));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_detailViewPool;
  uint64_t v4 = sub_10000FB44(&qword_100941360);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_separatorLineView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_linkAction, &qword_1009443B0);
}

@end