@interface MixedMediaLockupCollectionViewCell
- (_TtC18ASMessagesProvider15LockupMediaView)accessibilityMediaView;
- (_TtC18ASMessagesProvider15SmallLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC18ASMessagesProvider9VideoView)accessibilityVideoView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation MixedMediaLockupCollectionViewCell

- (_TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell *)sub_2C7ED4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2C92F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2C85AC();
}

- (_TtC18ASMessagesProvider15SmallLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_lockupView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_taglineLabel));
}

- (_TtC18ASMessagesProvider9VideoView)accessibilityVideoView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC18ASMessagesProvider9VideoView *)Strong;
}

- (_TtC18ASMessagesProvider15LockupMediaView)accessibilityMediaView
{
  return (_TtC18ASMessagesProvider15LockupMediaView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_mediaView));
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MixedMediaLockupCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(MixedMediaLockupCollectionViewCell *)&v4 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_mediaView];
  sub_566774();
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_taglineLabel));
  swift_unknownObjectRelease();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_overrideLockupPosition, &qword_954540);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider34MixedMediaLockupCollectionViewCell_searchAdTransparencyButton);
}

@end