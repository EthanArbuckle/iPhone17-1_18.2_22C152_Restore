@interface CNAvatarPosterPairCollectionPreWarmer
- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)init;
- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)initWithContact:(id)a3 contactForSharedProfile:(id)a4;
- (void)dealloc;
- (void)preWarmFirstPosterSnapshotIn:(id)a3;
@end

@implementation CNAvatarPosterPairCollectionPreWarmer

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)initWithContact:(id)a3 contactForSharedProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *)sub_18B64E4E0(v5, v6);

  return v7;
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer_carouselViewModelSubscriber))
  {
    v3 = self;
    swift_retain();
    sub_18B984668();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionPreWarmer();
  [(CNAvatarPosterPairCollectionPreWarmer *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer_contact));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer_carouselViewModel));
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer_windowScene);
}

- (void)preWarmFirstPosterSnapshotIn:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_18B64D938(v4);
}

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)init
{
  result = (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end