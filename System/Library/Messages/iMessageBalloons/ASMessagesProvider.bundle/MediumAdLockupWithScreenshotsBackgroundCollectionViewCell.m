@interface MediumAdLockupWithScreenshotsBackgroundCollectionViewCell
- (_TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation MediumAdLockupWithScreenshotsBackgroundCollectionViewCell

- (_TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell *)sub_42FF98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_430E1C();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(MediumAdLockupWithScreenshotsBackgroundCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(MediumAdLockupWithScreenshotsBackgroundCollectionViewCell *)&v4 prepareForReuse];
  id v3 = &v2[OBJC_IVAR____TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_impressionsCalculator];
  swift_beginAccess();
  *(void *)id v3 = 0;

  swift_release();
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self+ OBJC_IVAR____TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_impressionsUpdateBlock);

  sub_13308(v3);
}

@end