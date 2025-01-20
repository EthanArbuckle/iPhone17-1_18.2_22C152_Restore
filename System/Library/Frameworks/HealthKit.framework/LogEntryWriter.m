@interface LogEntryWriter
- (_TtC7healthd14LogEntryWriter)init;
@end

@implementation LogEntryWriter

- (_TtC7healthd14LogEntryWriter)init
{
  result = (_TtC7healthd14LogEntryWriter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7healthd14LogEntryWriter_fileURL;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7healthd14LogEntryWriter_fileHandle);
}

@end