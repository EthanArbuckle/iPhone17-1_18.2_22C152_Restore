@interface MixedMediaLockupCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel;
- (_TtC22SubscribePageExtension15LockupMediaView)accessibilityMediaView;
- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC22SubscribePageExtension9VideoView)accessibilityVideoView;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation MixedMediaLockupCollectionViewCell

- (_TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell *)sub_1003A00D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003A14FC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003A07B0();
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_lockupView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_taglineLabel));
}

- (_TtC22SubscribePageExtension9VideoView)accessibilityVideoView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC22SubscribePageExtension9VideoView *)Strong;
}

- (_TtC22SubscribePageExtension15LockupMediaView)accessibilityMediaView
{
  return (_TtC22SubscribePageExtension15LockupMediaView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_mediaView));
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MixedMediaLockupCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(MixedMediaLockupCollectionViewCell *)&v4 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_mediaView];
  sub_100656328();
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_taglineLabel));
  swift_unknownObjectRelease();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_overrideLockupPosition, &qword_100933E70);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_searchAdTransparencyButton);
}

@end