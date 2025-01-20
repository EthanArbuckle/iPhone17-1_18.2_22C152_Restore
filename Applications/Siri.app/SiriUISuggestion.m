@interface SiriUISuggestion
- (NSString)spokenText;
- (NSUUID)suggestionId;
- (SAUIAddViews)addViews;
- (_TtC4Siri16SiriUISuggestion)init;
- (void)setAddViews:(id)a3;
- (void)setSpokenText:(id)a3;
- (void)setSuggestionId:(id)a3;
- (void)siriDidSpeakHint;
@end

@implementation SiriUISuggestion

- (NSString)spokenText
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setSpokenText:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Siri16SiriUISuggestion_spokenText);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (NSUUID)suggestionId
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC4Siri16SiriUISuggestion_suggestionId;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSUUID *)v8.super.isa;
}

- (void)setSuggestionId:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  NSUUID v8 = (char *)self + OBJC_IVAR____TtC4Siri16SiriUISuggestion_suggestionId;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (SAUIAddViews)addViews
{
  return (SAUIAddViews *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC4Siri16SiriUISuggestion_addViews));
}

- (void)setAddViews:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Siri16SiriUISuggestion_addViews);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Siri16SiriUISuggestion_addViews) = (Class)a3;
  id v3 = a3;
}

- (void)siriDidSpeakHint
{
  NSString v2 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Siri16SiriUISuggestion_exposureCallback);
  id v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (_TtC4Siri16SiriUISuggestion)init
{
  result = (_TtC4Siri16SiriUISuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC4Siri16SiriUISuggestion_suggestionId;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end