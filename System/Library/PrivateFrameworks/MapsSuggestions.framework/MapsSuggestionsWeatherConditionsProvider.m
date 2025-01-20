@interface MapsSuggestionsWeatherConditionsProvider
- (_TtC12destinationd40MapsSuggestionsWeatherConditionsProvider)init;
- (_TtC12destinationd40MapsSuggestionsWeatherConditionsProvider)initWithQueue:(id)a3 locationRange:(double)a4;
- (void)didUpdateLocation;
- (void)startProvidingForObserver:(id)a3;
- (void)stopProvidingForObserver:(id)a3;
@end

@implementation MapsSuggestionsWeatherConditionsProvider

- (_TtC12destinationd40MapsSuggestionsWeatherConditionsProvider)initWithQueue:(id)a3 locationRange:(double)a4
{
  id v5 = a3;
  v6 = (_TtC12destinationd40MapsSuggestionsWeatherConditionsProvider *)sub_10000D064(v5, a4);

  return v6;
}

- (void)startProvidingForObserver:(id)a3
{
}

- (void)stopProvidingForObserver:(id)a3
{
}

- (void)didUpdateLocation
{
  v2 = self;
  MapsSuggestionsWeatherConditionsProvider.didUpdateLocation()();
}

- (_TtC12destinationd40MapsSuggestionsWeatherConditionsProvider)init
{
  result = (_TtC12destinationd40MapsSuggestionsWeatherConditionsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__observers));
  sub_100010388((uint64_t)self + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__weatherDataModel, &qword_100080F70);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__queue);
}

@end