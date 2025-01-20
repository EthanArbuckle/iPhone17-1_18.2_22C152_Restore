@interface DateSequenceTimeline
- (_TtC7SwiftUI20DateSequenceTimeline)initWithIdentifier:(id)a3 configure:(id)a4;
- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4;
- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4;
@end

@implementation DateSequenceTimeline

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  uint64_t v6 = type metadata accessor for DateInterval();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  id v11 = a4;
  uint64_t v12 = specialized DateSequenceTimeline.unconfiguredEntries(for:previousEntry:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v12)
  {
    type metadata accessor for BLSAlwaysOnTimelineUnconfiguredEntry();
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }

  return v13.super.isa;
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  uint64_t v6 = type metadata accessor for DateInterval();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (uint64_t *)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a4;
  id v11 = self;
  int64_t v12 = DateSequenceTimeline.requestedFidelityForStartEntry(in:withPreviousEntry:)(v9, a4);

  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (_TtC7SwiftUI20DateSequenceTimeline)initWithIdentifier:(id)a3 configure:(id)a4
{
  _Block_copy(a4);
  swift_unknownObjectRetain();
  result = (_TtC7SwiftUI20DateSequenceTimeline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end