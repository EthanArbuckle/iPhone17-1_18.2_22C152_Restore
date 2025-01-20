@interface UpdatesLockupCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)backgroundColor;
- (_TtC18ASMessagesProvider15SmallLockupView)accessibilitytLockupView;
- (_TtC18ASMessagesProvider18ExpandableTextView)accessibilityExpandableTextView;
- (_TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityVersionMetadata;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation UpdatesLockupCollectionViewCell

- (_TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell *)sub_37FBE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_38235C();
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for UpdatesLockupCollectionViewCell();
  v2 = [(UpdatesLockupCollectionViewCell *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UpdatesLockupCollectionViewCell();
  id v4 = a3;
  id v5 = v6.receiver;
  [(UpdatesLockupCollectionViewCell *)&v6 setBackgroundColor:v4];
  sub_380214();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_380354();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_380A28();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_38140C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC18ASMessagesProvider15SmallLockupView)accessibilitytLockupView
{
  return (_TtC18ASMessagesProvider15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell_lockupView));
}

- (_TtC18ASMessagesProvider18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC18ASMessagesProvider18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell_expandableTextView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityVersionMetadata
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell_versionMetadata));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell_expandableTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell_versionMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell_separatorView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31UpdatesLockupCollectionViewCell_fetchingArtworkTemplate, &qword_956450);
}

@end