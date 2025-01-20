@interface FAFamilyFetchActivityScheduler
- (FAFamilyFetchActivityScheduler)init;
- (FAFamilyFetchActivityScheduler)initWithFamilyCircleFetchBlock:(id)a3 cacheLoadBlock:(id)a4;
- (void)reschedule;
@end

@implementation FAFamilyFetchActivityScheduler

- (FAFamilyFetchActivityScheduler)initWithFamilyCircleFetchBlock:(id)a3 cacheLoadBlock:(id)a4
{
  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  v9 = (FAFamilyFetchActivityScheduler *)sub_1D25807D0((uint64_t)sub_1D2580AE0, v7, (uint64_t)sub_1D2580B20, v8);
  swift_release();
  swift_release();
  return v9;
}

- (void)reschedule
{
  v2 = self;
  FAFamilyFetchActivityScheduler.reschedule()();
}

- (FAFamilyFetchActivityScheduler)init
{
  result = (FAFamilyFetchActivityScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D2571FEC((uint64_t)self + OBJC_IVAR___FAFamilyFetchActivityScheduler____lazy_storage___scheduler, &qword_1EA68DD00);
  swift_release();
  swift_release();
}

@end