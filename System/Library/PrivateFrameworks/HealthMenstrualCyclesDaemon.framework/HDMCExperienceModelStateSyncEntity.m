@interface HDMCExperienceModelStateSyncEntity
+ (BOOL)updateDataWithStateStorage:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (HDStateSyncEntitySchema)stateEntitySchema;
+ (void)syncDidFinishWithResult:(int64_t)a3 stateStore:(id)a4 profile:(id)a5;
- (HDMCExperienceModelStateSyncEntity)init;
@end

@implementation HDMCExperienceModelStateSyncEntity

+ (HDStateSyncEntitySchema)stateEntitySchema
{
  if (qword_26ABF9870 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26ABF95B0;
  return (HDStateSyncEntitySchema *)v2;
}

- (HDMCExperienceModelStateSyncEntity)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExperienceModelStateSyncEntity();
  return [(HDMCExperienceModelStateSyncEntity *)&v3 init];
}

+ (BOOL)updateDataWithStateStorage:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  swift_unknownObjectRetain();
  id v9 = a4;
  id v10 = a5;
  sub_225793984((uint64_t)a3, v9, (uint64_t)v10);

  swift_unknownObjectRelease();
  return 1;
}

+ (void)syncDidFinishWithResult:(int64_t)a3 stateStore:(id)a4 profile:(id)a5
{
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  id v7 = a5;
  sub_225793C84(a3, v7);
  swift_unknownObjectRelease();
}

@end