@interface MenstrualCyclesAnalysisChangeDetector
- (NSString)description;
- (_TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector)init;
- (void)dealloc;
@end

@implementation MenstrualCyclesAnalysisChangeDetector

- (void)dealloc
{
  v2 = self;
  sub_24127E88C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector_analysisQuery));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector_observerQueue));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector_generatorContext;
  uint64_t v4 = sub_24162C1C8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector__currentAnalysisResult;
  sub_24127EEE4();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  sub_2416333E8();
  sub_241631E08();
  swift_bridgeObjectRelease();
  sub_241631E08();
  sub_241632F68();

  uint64_t v4 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector)init
{
  result = (_TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end