@interface CondensedAdLockupWithIconBackgroundCollectionViewCell
- (_TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation CondensedAdLockupWithIconBackgroundCollectionViewCell

- (_TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell *)sub_1001773FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001785E8();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(CondensedAdLockupWithIconBackgroundCollectionViewCell *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell_shadowView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell_condensedAdLockupWithIconBackgroundView];
  [v2 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(CondensedAdLockupWithIconBackgroundCollectionViewCell *)&v4 prepareForReuse];
  sub_10076C6F0();
  id v3 = &v2[OBJC_IVAR____TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsCalculator];
  swift_beginAccess();
  *(void *)id v3 = 0;

  swift_release();
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self+ OBJC_IVAR____TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell_condensedAdLockupWithIconBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell_shadowView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsUpdateBlock);

  sub_1000194B0(v3);
}

@end