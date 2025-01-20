@interface BlastDoorWorkoutPreview
- (BOOL)isIndoor;
- (BlastDoorWorkoutPreview)init;
- (NSString)configurationName;
- (NSString)description;
- (int64_t)configurationType;
- (unint64_t)activityType;
- (unint64_t)goalTypeIdentifier;
@end

@implementation BlastDoorWorkoutPreview

- (NSString)description
{
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)activityType
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorWorkoutPreview_workoutPreview);
}

- (BOOL)isIndoor
{
  return self->workoutPreview[OBJC_IVAR___BlastDoorWorkoutPreview_workoutPreview];
}

- (int64_t)configurationType
{
  return sub_1B17A5E98();
}

- (NSString)configurationName
{
  return (NSString *)sub_1B17A7844();
}

- (unint64_t)goalTypeIdentifier
{
  return sub_1B17A5F14();
}

- (BlastDoorWorkoutPreview)init
{
  result = (BlastDoorWorkoutPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end