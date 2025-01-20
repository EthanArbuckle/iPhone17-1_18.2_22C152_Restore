@interface TrainingLoadSummaryQueryServer
+ (Class)queryClass;
- (BOOL)_shouldListenForUpdates;
- (_TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
- (void)_queue_stop;
- (void)associationsUpdatedForObject:(id)a3 subObject:(id)a4 type:(unint64_t)a5 objects:(id)a6 anchor:(id)a7;
@end

@implementation TrainingLoadSummaryQueryServer

+ (Class)queryClass
{
  sub_250F0C650();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_queue_start
{
  v2 = self;
  sub_250EE2A18();
}

- (void)_queue_stop
{
  v2 = self;
  sub_250EE427C();
}

- (BOOL)_shouldListenForUpdates
{
  v2 = self;
  v3 = [(HDQueryServer *)v2 configuration];
  unsigned __int8 v4 = [(HKQueryServerConfiguration *)v3 shouldDeactivateAfterInitialResults];

  return v4 ^ 1;
}

- (void)associationsUpdatedForObject:(id)a3 subObject:(id)a4 type:(unint64_t)a5 objects:(id)a6 anchor:(id)a7
{
  sub_250E8D194(0, (unint64_t *)&unk_269B11220);
  uint64_t v12 = sub_250F0D040();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v13 = a7;
  v14 = self;
  sub_250EE47BC((uint64_t)a3, (void (*)(char *, uint64_t))a4, a5, v12, (uint64_t)v13);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_250F0C0C0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250F0C0A0();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer____lazy_storage___loadBaselineUnit) = 0;
  id v15 = a4;
  id v16 = a5;
  swift_unknownObjectRetain();
  v17 = (void *)sub_250F0C080();
  v20.receiver = self;
  v20.super_class = ObjectType;
  v18 = [(HDQueryServer *)&v20 initWithUUID:v17 configuration:v15 client:v16 delegate:a6];

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v18;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon30TrainingLoadSummaryQueryServer____lazy_storage___loadBaselineUnit));
}

@end