@interface UpdatesLockupCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)backgroundColor;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityVersionMetadata;
- (_TtC20ProductPageExtension15SmallLockupView)accessibilitytLockupView;
- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityExpandableTextView;
- (_TtC20ProductPageExtension31UpdatesLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31UpdatesLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation UpdatesLockupCollectionViewCell

- (_TtC20ProductPageExtension31UpdatesLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31UpdatesLockupCollectionViewCell *)sub_1003FF3BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31UpdatesLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100401720();
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
  sub_1003FF9E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003FFB28();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1004001FC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_100400BE0(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilitytLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_lockupView));
}

- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC20ProductPageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_expandableTextView);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityVersionMetadata
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_versionMetadata));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_expandableTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_versionMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_separatorView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31UpdatesLockupCollectionViewCell_fetchingArtworkTemplate, &qword_10094C368);
}

@end