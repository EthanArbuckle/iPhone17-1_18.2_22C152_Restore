@interface HDAppAnalyticsAcceptanceStateSyncEntity
+ (BOOL)updateDataWithStateStorage:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (HDStateSyncEntitySchema)stateEntitySchema;
- (HDAppAnalyticsAcceptanceStateSyncEntity)init;
@end

@implementation HDAppAnalyticsAcceptanceStateSyncEntity

+ (HDStateSyncEntitySchema)stateEntitySchema
{
  if (qword_26B205A18 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B205A10;
  return (HDStateSyncEntitySchema *)v2;
}

+ (BOOL)updateDataWithStateStorage:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  swift_unknownObjectRetain();
  id v9 = a4;
  id v10 = a5;
  sub_250D5A880(a3, v9, (uint64_t)v10);

  swift_unknownObjectRelease();
  return 1;
}

- (HDAppAnalyticsAcceptanceStateSyncEntity)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppAnalyticsAcceptanceStateSyncEntity();
  return [(HDAppAnalyticsAcceptanceStateSyncEntity *)&v3 init];
}

@end