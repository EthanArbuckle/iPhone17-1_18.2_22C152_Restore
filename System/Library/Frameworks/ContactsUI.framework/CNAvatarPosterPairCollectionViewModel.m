@interface CNAvatarPosterPairCollectionViewModel
- (_TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel)init;
@end

@implementation CNAvatarPosterPairCollectionViewModel

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel)init
{
  result = (_TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel__avatarPosterPairs;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913BC20);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel_contact));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel_contactForSharedProfile));
  swift_unknownObjectRelease();

  swift_release();
}

@end