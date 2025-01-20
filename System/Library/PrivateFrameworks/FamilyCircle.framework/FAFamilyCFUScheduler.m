@interface FAFamilyCFUScheduler
- (FAFamilyCFUScheduler)init;
@end

@implementation FAFamilyCFUScheduler

- (FAFamilyCFUScheduler)init
{
  result = (FAFamilyCFUScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___FAFamilyCFUScheduler_factory);
  sub_1D2571FEC((uint64_t)self + OBJC_IVAR___FAFamilyCFUScheduler_scheduler, &qword_1EA68DD00);
  v3 = (char *)self + OBJC_IVAR___FAFamilyCFUScheduler_familyProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end