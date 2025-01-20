@interface DiskHealthExperienceStore
- (void)mergeExternalChanges;
@end

@implementation DiskHealthExperienceStore

- (void)mergeExternalChanges
{
  sub_1C2624FC4();
  sub_1C2625030((unint64_t *)&unk_1EBB84A50, (void (*)(uint64_t))sub_1C2624FC4);
  swift_retain();
  sub_1C277B490();

  swift_release();
}

@end