@interface CNAvatarPosterPairViewModel
- (_TtC10ContactsUI27CNAvatarPosterPairViewModel)init;
@end

@implementation CNAvatarPosterPairViewModel

- (_TtC10ContactsUI27CNAvatarPosterPairViewModel)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI27CNAvatarPosterPairViewModel_avatarPosterPair) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI27CNAvatarPosterPairViewModel_contact) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNAvatarPosterPairViewModel();
  return [(CNAvatarPosterPairViewModel *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI27CNAvatarPosterPairViewModel_avatarPosterPair));
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI27CNAvatarPosterPairViewModel_contact);
}

@end