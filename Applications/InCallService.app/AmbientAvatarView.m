@interface AmbientAvatarView
- (CNContact)contact;
- (_TtC13InCallService17AmbientAvatarView)initWithCoder:(id)a3;
- (_TtC13InCallService17AmbientAvatarView)initWithContact:(id)a3;
- (_TtC13InCallService17AmbientAvatarView)initWithFrame:(CGRect)a3;
- (void)setContact:(id)a3;
@end

@implementation AmbientAvatarView

- (CNContact)contact
{
  id v2 = AmbientAvatarView.contact.getter();

  return (CNContact *)v2;
}

- (void)setContact:(id)a3
{
  id v4 = a3;
  v5 = self;
  AmbientAvatarView.contact.setter(v4);
}

- (_TtC13InCallService17AmbientAvatarView)initWithContact:(id)a3
{
  return (_TtC13InCallService17AmbientAvatarView *)AmbientAvatarView.init(contact:)(a3);
}

- (_TtC13InCallService17AmbientAvatarView)initWithCoder:(id)a3
{
}

- (_TtC13InCallService17AmbientAvatarView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13InCallService17AmbientAvatarView_avatarView);
}

@end