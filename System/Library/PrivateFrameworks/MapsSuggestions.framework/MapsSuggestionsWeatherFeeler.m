@interface MapsSuggestionsWeatherFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (BOOL)startUpdatingSignals;
- (BOOL)stopUpdatingSignals;
- (BOOL)updateSignals;
- (_TtC12destinationd28MapsSuggestionsWeatherFeeler)init;
- (_TtC12destinationd28MapsSuggestionsWeatherFeeler)initWithDelegate:(id)a3;
- (_TtC12destinationd28MapsSuggestionsWeatherFeeler)initWithDelegate:(id)a3 locationUpdater:(id)a4;
- (_TtC12destinationd28MapsSuggestionsWeatherFeeler)initWithDelegate:(id)a3 name:(id)a4;
- (int64_t)disposition;
- (void)didLoseLocationPermission;
- (void)didUpdateLocation:(id)a3;
- (void)triggerFired:(id)a3;
@end

@implementation MapsSuggestionsWeatherFeeler

- (_TtC12destinationd28MapsSuggestionsWeatherFeeler)initWithDelegate:(id)a3 locationUpdater:(id)a4
{
  return (_TtC12destinationd28MapsSuggestionsWeatherFeeler *)MapsSuggestionsWeatherFeeler.init(delegate:locationUpdater:)((uint64_t)a3, (uint64_t)a4);
}

- (_TtC12destinationd28MapsSuggestionsWeatherFeeler)initWithDelegate:(id)a3
{
  return (_TtC12destinationd28MapsSuggestionsWeatherFeeler *)sub_100004EF0((uint64_t)a3);
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1C) & (0xE0003C0u >> a3);
}

- (int64_t)disposition
{
  return 2;
}

- (void)didUpdateLocation:(id)a3
{
  id v5 = a3;
  v8.value._id internal = self;
  id internal = v8.value._internal;
  v8.value.super.isa = (Class)a3;
  MapsSuggestionsWeatherFeeler.didUpdate(_:)(v8);
}

- (void)didLoseLocationPermission
{
  v2 = self;
  MapsSuggestionsWeatherFeeler.didLoseLocationPermission()();
}

- (BOOL)updateSignals
{
  return sub_100005E50((char *)self, (uint64_t)a2, (uint64_t)sub_10000D9C4, (uint64_t)&unk_100071300);
}

- (BOOL)startUpdatingSignals
{
  v2 = self;
  Swift::Bool v3 = MapsSuggestionsWeatherFeeler.startUpdatingSignals()();

  return v3;
}

- (BOOL)stopUpdatingSignals
{
  return sub_100005E50((char *)self, (uint64_t)a2, (uint64_t)sub_10000DCF0, (uint64_t)&unk_1000712D8);
}

- (void)triggerFired:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue);
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8[4] = sub_10000DCF8;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_10000544C;
  v8[3] = &unk_1000712B0;
  v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  v7 = self;
  swift_release();
  [v4 asyncBlock:v6];
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (_TtC12destinationd28MapsSuggestionsWeatherFeeler)initWithDelegate:(id)a3 name:(id)a4
{
  swift_unknownObjectRetain();
  result = (_TtC12destinationd28MapsSuggestionsWeatherFeeler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12destinationd28MapsSuggestionsWeatherFeeler)init
{
  result = (_TtC12destinationd28MapsSuggestionsWeatherFeeler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherConditionsDataProvider));
  sub_100010388((uint64_t)self + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherDataModel, &qword_100080F70);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue));
  swift_bridgeObjectRelease();
}

@end