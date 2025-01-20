@interface SmallLockupCollectionViewCell
- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension29SmallLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SmallLockupCollectionViewCell

- (_TtC20ProductPageExtension29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29SmallLockupCollectionViewCell *)sub_1002B2948(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29SmallLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002B3FAC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002B3380();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(SmallLockupCollectionViewCell *)&v5 prepareForReuse];
  id v3 = objc_retain(*(id *)(*(void *)&v2[OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC20ProductPageExtension14BaseLockupView_artworkView));
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  sub_10076C730(v6, v4);
}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_separatorView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_separator, (uint64_t *)&unk_10094E4E0);
}

@end