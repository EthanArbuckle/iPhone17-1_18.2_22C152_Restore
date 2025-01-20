@interface SmallLockupCollectionViewCell
- (_TtC18ASMessagesProvider15SmallLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider29SmallLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SmallLockupCollectionViewCell

- (_TtC18ASMessagesProvider29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider29SmallLockupCollectionViewCell *)sub_27B5E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider29SmallLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_27CC44();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_27C018();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(SmallLockupCollectionViewCell *)&v5 prepareForReuse];
  id v3 = objc_retain(*(id *)(*(void *)&v2[OBJC_IVAR____TtC18ASMessagesProvider29SmallLockupCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC18ASMessagesProvider14BaseLockupView_artworkView));
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  sub_76E2C0(v6, v4);
}

- (_TtC18ASMessagesProvider15SmallLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC18ASMessagesProvider29SmallLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29SmallLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29SmallLockupCollectionViewCell_separatorView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider29SmallLockupCollectionViewCell_separator, &qword_95EE70);
}

@end