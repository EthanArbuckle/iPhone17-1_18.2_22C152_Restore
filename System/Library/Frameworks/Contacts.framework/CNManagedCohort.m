@interface CNManagedCohort
- (CNManagedCohort)init;
@end

@implementation CNManagedCohort

- (CNManagedCohort)init
{
  result = (CNManagedCohort *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_190B2EB14(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CNManagedCohort_imageData), *(void *)&self->identifier[OBJC_IVAR___CNManagedCohort_imageData]);
  sub_190B2EB14(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CNManagedCohort_posterData), *(void *)&self->identifier[OBJC_IVAR___CNManagedCohort_posterData]);

  swift_bridgeObjectRelease();
}

@end