@interface JSModernLocObject
- (NSString)identifier;
- (_TtC19appstorecomponentsd17JSModernLocObject)init;
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

@implementation JSModernLocObject

- (NSString)identifier
{
  uint64_t v3 = type metadata accessor for Locale();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002EC6C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
  v7 = self;
  dispatch thunk of Localizer.locale.getter();
  Locale.identifier.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (id)string:(id)a3
{
  return sub_1000E9704((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer);
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v8 = v7;
  sub_10002EC6C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  Localizer.string(withCount:forKey:)(a4, v10);

  swift_bridgeObjectRelease();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v11;
}

- (id)stringWithCounts:(id)a3 :(id)a4
{
  uint64_t v5 = sub_10002EB60(&qword_1001A4748);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  Swift::String v10 = v9;
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer);
  sub_10002EC6C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
  v13 = self;
  v14._countAndFlagsBits = v8;
  v14._object = v10;
  Localizer.string(forKey:)(v14);
  sub_10002EC6C(v12, v12[3]);
  dispatch thunk of Localizer.locale.getter();
  uint64_t v15 = type metadata accessor for Locale();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 0, 1, v15);
  sub_1000E72A0(v11);
  String.init(format:locale:arguments:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100034B8C((uint64_t)v7, &qword_1001A4748);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v16;
}

- (id)decimal:(id)a3 :(int64_t)a4
{
  uint64_t v6 = type metadata accessor for LocalizerContext();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_10002EC6C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizerContext.unknown(_:), v6);
    Swift::String v10 = self;
    id v11 = a3;
    dispatch thunk of Localizer.decimal(forNumber:minimumFractionDigits:maximumFractionDigits:in:)();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }

  return v12;
}

- (id)fileSize:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v4 = self;
    id v5 = v3;
    [v5 doubleValue];
    sub_10002EC6C((Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer), *(void *)&v4->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
    dispatch thunk of Localizer.fileSize(forBytes:)();

    id v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return v3;
}

- (id)formattedCount:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v4 = self;
    id v5 = v3;
    [v5 integerValue];
    sub_10002EC6C((Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer), *(void *)&v4->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
    dispatch thunk of Localizer.formattedCount(_:)();

    id v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return v3;
}

- (id)timeAgo:(id)a3
{
  uint64_t v5 = sub_10002EB60((uint64_t *)&unk_1001A50C0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_1000D70FC();
  Swift::String v10 = self;
  id v11 = (void *)static JSContext.requiredCurrent.getter();
  NSString v12 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  JSValue.string.getter();
  uint64_t v14 = v13;

  sub_100034B8C((uint64_t)v7, (uint64_t *)&unk_1001A50C0);
  if (v14)
  {
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v15 = 0;
  }

  return v15;
}

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10002EB60((uint64_t *)&unk_1001A50C0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  NSString v15 = (char *)&v20 - v14;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v15, 1, 1, v6);
  }
  sub_1000EA944((uint64_t)v15, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    NSString v16 = self;
    sub_100034B8C((uint64_t)v13, (uint64_t *)&unk_1001A50C0);

    swift_bridgeObjectRelease();
    sub_100034B8C((uint64_t)v15, (uint64_t *)&unk_1001A50C0);
    NSString v17 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    sub_10002EC6C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
    uint64_t v18 = self;
    Localizer.formattedDate(format:date:)();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

    swift_bridgeObjectRelease();
    sub_100034B8C((uint64_t)v15, (uint64_t *)&unk_1001A50C0);
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return v17;
}

- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  return sub_1000EA498(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *))sub_1000EA298);
}

- (id)relativeDate:(id)a3
{
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10002EB60((uint64_t *)&unk_1001A50C0);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v18 - v13;
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v14, 0, 1, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))((char *)&v18 - v13, 1, 1, v5);
  }
  sub_1000EA944((uint64_t)v14, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1, v5) == 1)
  {
    sub_100034B8C((uint64_t)v12, (uint64_t *)&unk_1001A50C0);
    sub_100034B8C((uint64_t)v14, (uint64_t *)&unk_1001A50C0);
    NSString v15 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v12, v5);
    sub_10002EC6C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 16]);
    NSString v16 = self;
    Localizer.relativeDate(_:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    sub_100034B8C((uint64_t)v14, (uint64_t *)&unk_1001A50C0);
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return v15;
}

- (_TtC19appstorecomponentsd17JSModernLocObject)init
{
  result = (_TtC19appstorecomponentsd17JSModernLocObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end