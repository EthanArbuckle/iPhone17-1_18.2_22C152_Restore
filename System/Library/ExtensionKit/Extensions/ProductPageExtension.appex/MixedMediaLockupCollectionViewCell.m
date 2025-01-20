@interface MixedMediaLockupCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel;
- (_TtC20ProductPageExtension15LockupMediaView)accessibilityMediaView;
- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC20ProductPageExtension9VideoView)accessibilityVideoView;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation MixedMediaLockupCollectionViewCell

- (_TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell *)sub_10022BBE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10022CC34();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10022C09C();
}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_lockupView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_taglineLabel));
}

- (_TtC20ProductPageExtension9VideoView)accessibilityVideoView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC20ProductPageExtension9VideoView *)Strong;
}

- (_TtC20ProductPageExtension15LockupMediaView)accessibilityMediaView
{
  return (_TtC20ProductPageExtension15LockupMediaView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_mediaView));
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MixedMediaLockupCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(MixedMediaLockupCollectionViewCell *)&v4 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_mediaView];
  sub_100576C8C();
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_taglineLabel));
  swift_unknownObjectRelease();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_overrideLockupPosition, &qword_100957880);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_searchAdTransparencyButton);
}

@end