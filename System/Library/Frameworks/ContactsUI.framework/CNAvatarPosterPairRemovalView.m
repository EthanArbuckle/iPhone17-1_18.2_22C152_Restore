@interface CNAvatarPosterPairRemovalView
- (_TtC10ContactsUI29CNAvatarPosterPairRemovalView)initWithCoder:(id)a3;
- (_TtC10ContactsUI29CNAvatarPosterPairRemovalView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation CNAvatarPosterPairRemovalView

- (void)prepareForReuse
{
  v2 = self;
  sub_18B66E0EC();
}

- (_TtC10ContactsUI29CNAvatarPosterPairRemovalView)initWithFrame:(CGRect)a3
{
  return (_TtC10ContactsUI29CNAvatarPosterPairRemovalView *)sub_18B66E1C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10ContactsUI29CNAvatarPosterPairRemovalView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_avatarPosterPair) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_deleteButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_deleteButtonDimension) = (Class)0x4051000000000000;
  id v5 = a3;

  result = (_TtC10ContactsUI29CNAvatarPosterPairRemovalView *)sub_18B986768();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18B66E7C4();
}

- (void).cxx_destruct
{
  sub_18B66EA04((uint64_t)self + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_avatarPosterPair));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_deleteButton);
}

@end