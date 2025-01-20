@interface SleepMeasurementsConfigurationProvider
- (_TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider)init;
- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepFocusConfigurationDidUpdate:(id)a4;
@end

@implementation SleepMeasurementsConfigurationProvider

- (_TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider)init
{
  result = (_TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider_sleepStore));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider_logger;
  uint64_t v4 = sub_24162EFA8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  v5 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin38SleepMeasurementsConfigurationProvider_configurationPublisher;
  sub_2411C3EA4();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_241461288(v6, v7);
}

- (void)sleepStore:(id)a3 sleepFocusConfigurationDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_241461684((uint64_t)v6);
}

@end