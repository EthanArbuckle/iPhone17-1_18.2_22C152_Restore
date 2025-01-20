@interface WidgetIntentHandler
- (Class)defaultCalendarsForEKUICalendars:(void *)a3;
- (_TtC16IntentsExtension19WidgetIntentHandler)init;
- (void)handleEKUICalendars:(id)a3 completion:(id)a4;
- (void)handleNextEventComplicationConfiguration:(id)a3 completion:(id)a4;
- (void)provideCalendarsOptionsCollectionForEKUICalendars:(void *)a3 withCompletion:(void *)aBlock;
@end

@implementation WidgetIntentHandler

- (_TtC16IntentsExtension19WidgetIntentHandler)init
{
  id v3 = objc_allocWithZone((Class)EKEventStore);
  v4 = self;
  v5 = (objc_class *)[v3 initWithEKOptions:0x2000];
  if (!v5) {
    v5 = (objc_class *)[objc_allocWithZone((Class)EKEventStore) init];
  }
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC16IntentsExtension19WidgetIntentHandler_eventStore) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for WidgetIntentHandler();
  return [(WidgetIntentHandler *)&v7 init];
}

- (void).cxx_destruct
{
}

- (void)handleEKUICalendars:(id)a3 completion:(id)a4
{
}

- (void)provideCalendarsOptionsCollectionForEKUICalendars:(void *)a3 withCompletion:(void *)aBlock
{
  v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = a1;
  sub_100005FA8((uint64_t)v8, (unint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (Class)defaultCalendarsForEKUICalendars:(void *)a3
{
  id v4 = a3;
  id v5 = a1;
  unint64_t v6 = (unint64_t)sub_100003768();
  sub_100009970();
  sub_100006428(&qword_100011530);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10000A170;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100009A20();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v7 + 56) = &type metadata for Int;
  *(void *)(v7 + 64) = &protocol witness table for Int;
  *(void *)(v7 + 32) = v8;
  sub_100006488(0, &qword_100011538);
  v9 = (void *)sub_100009980();
  sub_1000098A0();

  swift_bridgeObjectRelease();
  type metadata accessor for EKUICalendar();
  v10.super.isa = sub_100009910().super.isa;
  swift_bridgeObjectRelease();
  return v10.super.isa;
}

- (void)handleNextEventComplicationConfiguration:(id)a3 completion:(id)a4
{
}

@end