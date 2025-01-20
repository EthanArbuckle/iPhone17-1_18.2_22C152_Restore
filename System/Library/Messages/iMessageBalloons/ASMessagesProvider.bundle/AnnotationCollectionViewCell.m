@interface AnnotationCollectionViewCell
- (BOOL)accessibilityCellIsExpanded;
- (BOOL)accessibilityIsSummaryExpandable;
- (NSArray)accessibilityDetailItems;
- (_TtC18ASMessagesProvider28AnnotationCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityLinkLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)accessibilityLinkLabelTapped;
- (void)layoutSubviews;
- (void)linkLabelTapped:(id)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AnnotationCollectionViewCell

- (_TtC18ASMessagesProvider28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider28AnnotationCollectionViewCell *)sub_306AB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider28AnnotationCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_30A798();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_305704();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_307368();
}

- (void)linkLabelTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_30A9C0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_308EDC((uint64_t)a3);
}

- (NSArray)accessibilityDetailItems
{
  v2 = self;
  sub_309048();

  v3.super.isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_summaryLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityLinkLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_linkLabel));
}

- (BOOL)accessibilityCellIsExpanded
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_isExpanded);
}

- (BOOL)accessibilityIsSummaryExpandable
{
  v2 = self;
  BOOL v3 = sub_307E20();

  return v3;
}

- (void)accessibilityLinkLabelTapped
{
  v2 = self;
  sub_30A9C0();
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_disclosureView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_linkLabel));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_detailViewPool;
  uint64_t v4 = sub_FD50((uint64_t *)&unk_961690);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_separatorLineView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider28AnnotationCollectionViewCell_linkAction, &qword_9616A0);
}

@end