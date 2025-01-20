@interface CoreDataStackShared
- (_TtC15JournalSettings19CoreDataStackShared)init;
@end

@implementation CoreDataStackShared

- (_TtC15JournalSettings19CoreDataStackShared)init
{
  result = (_TtC15JournalSettings19CoreDataStackShared *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15JournalSettings19CoreDataStackShared_sessionID;
  uint64_t v4 = sub_145290();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_296E0((uint64_t)self + OBJC_IVAR____TtC15JournalSettings19CoreDataStackShared_customBundleURL);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15JournalSettings19CoreDataStackShared_container);
}

@end