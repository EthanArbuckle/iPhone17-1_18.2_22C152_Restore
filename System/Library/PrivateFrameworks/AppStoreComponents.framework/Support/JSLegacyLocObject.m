@interface JSLegacyLocObject
- (NSString)arcadeWordmarkAssetName;
- (NSString)identifier;
- (_TtC19appstorecomponentsd17JSLegacyLocObject)init;
- (id)decimal:(id)a3 :(int64_t)a4;
- (id)fileSize:(id)a3;
- (id)formatDate:(id)a3 :(id)a4;
- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5;
- (id)formattedCount:(id)a3;
- (id)relativeDate:(id)a3;
- (id)string:(id)a3;
- (id)stringWithCount:(id)a3 :(int64_t)a4;
- (id)stringWithCounts:(id)a3 :(id)a4;
- (id)timeAgo:(id)a3;
@end

@implementation JSLegacyLocObject

- (NSString)identifier
{
  v2 = self;
  Locale.identifier.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)arcadeWordmarkAssetName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (id)string:(id)a3
{
  return sub_1000E9704((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer);
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v6 = sub_10002EB60(&qword_1001A4748);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  sub_10002EC6C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 16]);
  v12 = self;
  v13._countAndFlagsBits = v9;
  v13._object = v11;
  Localizer.string(forKey:)(v13);
  v14 = (char *)v12 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendarWithBagFixUp;
  uint64_t v15 = type metadata accessor for Locale();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v8, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v8, 0, 1, v15);
  sub_10002EB60(&qword_1001A3C18);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_10014CED0;
  *(void *)(v17 + 56) = &type metadata for Int;
  *(void *)(v17 + 64) = &protocol witness table for Int;
  *(void *)(v17 + 32) = a4;
  String.init(format:locale:arguments:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100034B8C((uint64_t)v8, &qword_1001A4748);

  swift_bridgeObjectRelease();
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v18;
}

- (id)stringWithCounts:(id)a3 :(id)a4
{
  uint64_t v5 = sub_10002EB60(&qword_1001A4748);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10002EC6C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 16]);
  v12 = self;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  Localizer.string(forKey:)(v13);
  v14 = (char *)v12 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendarWithBagFixUp;
  uint64_t v15 = type metadata accessor for Locale();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_1000E72A0(v11);
  String.init(format:locale:arguments:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100034B8C((uint64_t)v7, &qword_1001A4748);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v17;
}

- (id)decimal:(id)a3 :(int64_t)a4
{
  uint64_t v6 = self;
  id v7 = a3;
  sub_1000E7598(a3, a4);
  uint64_t v9 = v8;

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (id)fileSize:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    v4 = self;
    id v5 = v3;
    id v6 = objc_msgSend(self, "stringFromByteCount:countStyle:", objc_msgSend(v5, "longLongValue"), 0);
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return v3;
}

- (id)formattedCount:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1000E7810(a3);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (id)timeAgo:(id)a3
{
  return sub_1000E9248(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1000E7A44);
}

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v6 = sub_10002EB60((uint64_t *)&unk_1001A50C0);
  __chkstk_darwin(v6 - 8);
  NSString v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  v14 = self;
  sub_1000E80A0(v9, v11, (uint64_t)v8);
  uint64_t v16 = v15;

  swift_bridgeObjectRelease();
  sub_100034B8C((uint64_t)v8, (uint64_t *)&unk_1001A50C0);
  if (v16)
  {
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v17 = 0;
  }

  return v17;
}

- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  return sub_1000EA498(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *))sub_1000E857C);
}

- (id)relativeDate:(id)a3
{
  return sub_1000E9248(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1000E8920);
}

- (_TtC19appstorecomponentsd17JSLegacyLocObject)init
{
  result = (_TtC19appstorecomponentsd17JSLegacyLocObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer);
  id v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_locale;
  uint64_t v4 = type metadata accessor for Locale();
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendar, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendarWithBagFixUp;

  v6(v5, v4);
}

@end