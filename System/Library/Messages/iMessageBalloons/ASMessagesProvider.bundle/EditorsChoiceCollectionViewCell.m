@interface EditorsChoiceCollectionViewCell
- (BOOL)accessibilityShowsBadge;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider17EditorsChoiceView)accessibilityBadgeView;
- (_TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
- (void)moreFrom:(id)a3;
- (void)prepareForReuse;
@end

@implementation EditorsChoiceCollectionViewCell

- (_TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell *)sub_5D9038(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_editorsChoiceReviewView;
  type metadata accessor for EditorsChoiceReviewView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];
  v8 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_itemLayoutContext;
  uint64_t v9 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);

  result = (_TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EditorsChoiceCollectionViewCell();
  id v2 = v3.receiver;
  [(EditorsChoiceCollectionViewCell *)&v3 prepareForReuse];
  sub_4A9E24(0, 0);
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_5D9474();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_editorsChoiceReviewView);
  v4 = self;
  [(EditorsChoiceCollectionViewCell *)v4 layoutMargins];
  sub_77E170();
  objc_msgSend(v3, "sizeThatFits:");
  [(EditorsChoiceCollectionViewCell *)v4 layoutMargins];
  sub_77E190();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)moreFrom:(id)a3
{
  objc_super v3 = *(void (**)(uint64_t))(*(char **)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                      + OBJC_IVAR____TtC18ASMessagesProvider23EditorsChoiceReviewView_moreTapHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_13318((uint64_t)v3);
    v3(v6);
    sub_13308((uint64_t)v3);
  }
}

- (_TtC18ASMessagesProvider17EditorsChoiceView)accessibilityBadgeView
{
  return (_TtC18ASMessagesProvider17EditorsChoiceView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider23EditorsChoiceReviewView_badgeView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider23EditorsChoiceReviewView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider23EditorsChoiceReviewView_textLabel));
}

- (BOOL)accessibilityShowsBadge
{
  return (*(unsigned char **)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_editorsChoiceReviewView))[OBJC_IVAR____TtC18ASMessagesProvider23EditorsChoiceReviewView_showsBadge];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_editorsChoiceReviewView));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31EditorsChoiceCollectionViewCell_itemLayoutContext;

  sub_411F8((uint64_t)v3);
}

@end