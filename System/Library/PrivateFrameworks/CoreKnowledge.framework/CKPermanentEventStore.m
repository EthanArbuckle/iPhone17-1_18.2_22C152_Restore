@interface CKPermanentEventStore
+ (id)createEventWithIdentifier:(id)a3 dateInterval:(id)a4 metadata:(id)a5 fromEvent:(id)a6;
+ (id)defaultStore;
- (BOOL)deleteEventWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteInteractionsWithBundleId:(id)a3 error:(id *)a4;
- (BOOL)recordEvent:(id)a3 error:(id *)a4;
- (BOOL)recordInteraction:(id)a3 bundleId:(id)a4 error:(id *)a5;
- (BOOL)recordInteraction:(id)a3 error:(id *)a4;
- (CKKnowledgeStore)backingStore;
- (CKPermanentEventStore)init;
- (CKPermanentEventStore)initWithKnowledgeStore:(id)a3;
- (id)historicEventsAndReturnError:(id *)a3;
- (void)deleteEventWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)deleteInteractionsWithBundleId:(id)a3 completionHandler:(id)a4;
- (void)historicEventWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)historicEventsWithCompletionHandler:(id)a3;
- (void)historicEventsWithSourceBundleIdentifier:(id)a3 andIntent:(id)a4 completionHandler:(id)a5;
- (void)recordEvent:(id)a3 completionHandler:(id)a4;
- (void)recordInteraction:(id)a3 bundleId:(id)a4 completionHandler:(id)a5;
- (void)recordInteraction:(id)a3 completionHandler:(id)a4;
- (void)setFirstSeen:(id)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setFrequency:(int64_t)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setLastDuration:(double)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setLastSeen:(id)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setTotalDuration:(double)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation CKPermanentEventStore

- (CKPermanentEventStore)initWithKnowledgeStore:(id)a3
{
  return (CKPermanentEventStore *)CKPermanentEventStore.init(knowledgeStore:)((uint64_t)a3);
}

+ (id)defaultStore
{
  id v2 = static CKPermanentEventStore.defaultStore()();
  return v2;
}

- (CKPermanentEventStore)init
{
}

- (void).cxx_destruct
{
}

+ (id)createEventWithIdentifier:(id)a3 dateInterval:(id)a4 metadata:(id)a5 fromEvent:(id)a6
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9731980);
  MEMORY[0x1F4188790](v8 - 8, v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1A78317EC();
  uint64_t v14 = v13;
  if (a4)
  {
    sub_1A78313FC();
    uint64_t v15 = sub_1A783144C();
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v15 = sub_1A783144C();
    uint64_t v16 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v11, v16, 1, v15);
  uint64_t v17 = sub_1A783178C();
  id v18 = a6;
  v19 = (void *)static CKPermanentEventStore.createEvent(withIdentifier:dateInterval:metadata:from:)(v12, v14, (uint64_t)v11, v17, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A77DADAC((uint64_t)v11, &qword_1E9731980);
  return v19;
}

- (void)recordEvent:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)recordEvent:(id)a3 error:(id *)a4
{
  return sub_1A77DC20C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CKPermanentEventStore.record(_:));
}

- (BOOL)recordInteraction:(id)a3 error:(id *)a4
{
  return sub_1A77DC20C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CKPermanentEventStore.record(_:));
}

- (void)recordInteraction:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)recordInteraction:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v8 = sub_1A78317EC();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = a3;
  uint64_t v12 = self;
  v13.value._countAndFlagsBits = v8;
  v13.value._object = v10;
  CKPermanentEventStore.record(_:withBundleId:)((INInteraction)v11, v13);

  swift_bridgeObjectRelease();
  if (v14)
  {
    if (a5)
    {
      uint64_t v15 = (void *)sub_1A783148C();

      id v16 = v15;
      *a5 = v15;
    }
    else
    {
    }
  }
  return v14 == 0;
}

- (void)recordInteraction:(id)a3 bundleId:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_1A78317EC();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  uint64_t v12 = self;
  sub_1A77DC874(v11, v9, (uint64_t)a4, v12, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (BOOL)deleteInteractionsWithBundleId:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1A78317EC();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  CKPermanentEventStore.deleteInteractions(withBundleId:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      uint64_t v12 = (void *)sub_1A783148C();

      id v13 = v12;
      *a4 = v12;
    }
    else
    {
    }
  }
  return v11 == 0;
}

- (void)deleteInteractionsWithBundleId:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A78317EC();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  Swift::String v10 = self;
  CKPermanentEventStore.deleteInteractions(withBundleId:completionHandler:)(v6, v8, (uint64_t)sub_1A77C2624, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)historicEventWithIdentifier:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A78317EC();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  Swift::String v10 = self;
  CKPermanentEventStore.historicEvent(withIdentifier:completionHandler:)(v6, v8, (uint64_t)sub_1A77E3C94, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)historicEventsWithSourceBundleIdentifier:(id)a3 andIntent:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a3)
  {
    uint64_t v9 = sub_1A78317EC();
    a3 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a4;
  uint64_t v12 = self;
  sub_1A77E30AC(v9, (uint64_t)a3, a4, v12, (void (**)(void, void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (CKKnowledgeStore)backingStore
{
  id v2 = CKPermanentEventStore.backingStore.getter();
  return (CKKnowledgeStore *)v2;
}

- (id)historicEventsAndReturnError:(id *)a3
{
  v3 = self;
  CKPermanentEventStore.historicEvents()();

  type metadata accessor for CKHistoricEvent();
  v4 = (void *)sub_1A783177C();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)historicEventsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  CKPermanentEventStore.historicEvents(completionHandler:)((uint64_t)sub_1A77E3C48, v5);

  swift_release();
}

- (void)setFirstSeen:(id)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (void)setLastSeen:(id)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (void)setFrequency:(int64_t)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1A78317EC();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  uint64_t v12 = self;
  CKPermanentEventStore.setFrequency(_:forEventWithIdentifier:completionHandler:)(a3, v8, v10, (uint64_t)sub_1A77C2630, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)setLastDuration:(double)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (void)setTotalDuration:(double)a3 forEventWithIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (BOOL)deleteEventWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1A78317EC();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  CKPermanentEventStore.deleteEvent(withIdentifier:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      uint64_t v12 = (void *)sub_1A783148C();

      id v13 = v12;
      *a4 = v12;
    }
    else
    {
    }
  }
  return v11 == 0;
}

- (void)deleteEventWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A78317EC();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  Swift::String v10 = self;
  CKPermanentEventStore.deleteEvent(withIdentifier:completionHandler:)(v6, v8, sub_1A77C2624, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

@end