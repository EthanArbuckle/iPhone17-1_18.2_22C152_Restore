@interface UserCharacteristicsChangeDetector
- (_TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector)init;
- (void)dealloc;
@end

@implementation UserCharacteristicsChangeDetector

- (void)dealloc
{
  v2 = self;
  sub_241357218();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector_observerQueue));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector__currentAge;
  sub_241357984();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector__currentBiologicalSex;
  sub_2413579DC();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (_TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector)init
{
  result = (_TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end