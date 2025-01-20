@interface UpdatesLockupCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)backgroundColor;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityVersionMetadata;
- (_TtC22SubscribePageExtension15SmallLockupView)accessibilitytLockupView;
- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityExpandableTextView;
- (_TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation UpdatesLockupCollectionViewCell

- (_TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell *)sub_10043D808(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10043FF14();
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
  sub_10043DE34();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10043DF74();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10043E648();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_10043F02C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilitytLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_lockupView));
}

- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC22SubscribePageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_expandableTextView);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityVersionMetadata
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_versionMetadata));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_expandableTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_versionMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_separatorView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31UpdatesLockupCollectionViewCell_fetchingArtworkTemplate, &qword_100938110);
}

@end