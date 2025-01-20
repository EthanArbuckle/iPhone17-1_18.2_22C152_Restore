@interface CondensedAdLockupWithIconBackgroundCollectionViewCell
- (_TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation CondensedAdLockupWithIconBackgroundCollectionViewCell

- (_TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell *)sub_2E7A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2F994();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(CondensedAdLockupWithIconBackgroundCollectionViewCell *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell_shadowView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell_condensedAdLockupWithIconBackgroundView];
  [v2 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(CondensedAdLockupWithIconBackgroundCollectionViewCell *)&v4 prepareForReuse];
  sub_76E280();
  id v3 = &v2[OBJC_IVAR____TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsCalculator];
  swift_beginAccess();
  *(void *)id v3 = 0;

  swift_release();
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self+ OBJC_IVAR____TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell_condensedAdLockupWithIconBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell_shadowView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsUpdateBlock);

  sub_13308(v3);
}

@end