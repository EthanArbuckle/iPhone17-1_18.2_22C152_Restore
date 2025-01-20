@interface CoreDataStackShared
- (_TtC21JournalDataclassOwner19CoreDataStackShared)init;
@end

@implementation CoreDataStackShared

- (_TtC21JournalDataclassOwner19CoreDataStackShared)init
{
  result = (_TtC21JournalDataclassOwner19CoreDataStackShared *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_sessionID;
  uint64_t v4 = sub_23E00();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_CF68((uint64_t)self + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_customBundleURL);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_container);
}

@end