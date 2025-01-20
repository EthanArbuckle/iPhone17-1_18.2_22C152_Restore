@interface WidgetEntry
- (NSString)description;
- (_TtC9ChronoKit11WidgetEntry)init;
- (void)invalidate;
@end

@implementation WidgetEntry

- (void)invalidate
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9ChronoKit11WidgetEntry_descriptorObserver);
  uint64_t v4 = v3[4];
  __swift_project_boxed_opaque_existential_0(v3, v3[3]);
  v5 = *(void (**)(void))(v4 + 24);
  v6 = self;
  v5();
}

- (_TtC9ChronoKit11WidgetEntry)init
{
  result = (_TtC9ChronoKit11WidgetEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry_protectionType;
  uint64_t v4 = sub_1DA98B9E8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1DA932AB4((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry_key, (uint64_t (*)(void))type metadata accessor for WidgetEntryKey);
  swift_release();
  sub_1DA7A1AE0((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_cachedViewableEntry, (uint64_t *)&unk_1EBE62A20);
  v5 = (char *)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_configuredDate;
  uint64_t v6 = sub_1DA989638();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_1DA7A1AE0((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_currentEntry, &qword_1EBE62A10);
  swift_release();
  sub_1DA7A1AE0((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_content, &qword_1EBE62A38);
  sub_1DA7A1AE0((uint64_t)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry__lock_contentLoadErrorDate, &qword_1EBE61CC0);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  v7 = (char *)self + OBJC_IVAR____TtC9ChronoKit11WidgetEntry_descriptorObserver;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (NSString)description
{
  v2 = self;
  WidgetEntry.description.getter();

  v3 = (void *)sub_1DA98C008();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end