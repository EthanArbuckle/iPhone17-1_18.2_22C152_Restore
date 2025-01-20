@interface SmallLockupCollectionViewCell
- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension29SmallLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SmallLockupCollectionViewCell

- (_TtC22SubscribePageExtension29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29SmallLockupCollectionViewCell *)sub_10023CA5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29SmallLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10023E17C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10023D494();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(SmallLockupCollectionViewCell *)&v5 prepareForReuse];
  id v3 = objc_retain(*(id *)(*(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_artworkView));
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  sub_100758320(v6, v4);
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_separatorView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_separator, (uint64_t *)&unk_100945230);
}

@end