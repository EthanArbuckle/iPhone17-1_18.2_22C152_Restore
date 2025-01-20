@interface TitledParagraphCollectionViewCell
- (_TtC18ASMessagesProvider18ExpandableTextView)accessibilityExpandableTextView;
- (_TtC18ASMessagesProvider33TitledParagraphCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySecondarySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TitledParagraphCollectionViewCell

- (_TtC18ASMessagesProvider33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider33TitledParagraphCollectionViewCell *)sub_354404(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider33TitledParagraphCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_356010();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_354FC4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_355920((uint64_t)a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider33TitledParagraphCollectionViewCell_primarySubtitleLabel));
}

- (_TtC18ASMessagesProvider18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC18ASMessagesProvider18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC18ASMessagesProvider33TitledParagraphCollectionViewCell_bodyTextView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySecondarySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33TitledParagraphCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33TitledParagraphCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33TitledParagraphCollectionViewCell_primarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider33TitledParagraphCollectionViewCell_itemLayoutContext);

  swift_unknownObjectRelease();
}

@end