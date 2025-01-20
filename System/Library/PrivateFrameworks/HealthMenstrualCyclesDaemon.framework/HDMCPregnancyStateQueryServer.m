@interface HDMCPregnancyStateQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (NSSet)objectTypes;
- (_TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
- (void)_queue_stop;
- (void)pregnancyModelDidUpdate:(id)a3;
@end

@implementation HDMCPregnancyStateQueryServer

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_225729DB0(v7);

  return 1;
}

- (void)_queue_start
{
  v2 = self;
  HDMCPregnancyStateQueryServer._queue_start()();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  uint64_t v10 = sub_22579F398();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22579F378();
  swift_getObjCClassMetadata();
  id v14 = a4;
  id v15 = a5;
  swift_unknownObjectRetain();
  v16 = static HDMCPregnancyStateQueryServer.createTaskServer(with:configuration:client:delegate:)((uint64_t)v13, a4, v15, (uint64_t)a6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_unknownObjectRelease();

  return v16;
}

+ (Class)queryClass
{
  sub_22572F19C(0, (unint64_t *)&unk_26ABF9530);
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSSet)objectTypes
{
  sub_22572FE14(0, (unint64_t *)&qword_26ABF95A0, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2257A3D00;
  sub_22572F19C(0, &qword_26ABF94E8);
  v4 = (void *)*MEMORY[0x263F093C0];
  v5 = self;
  *(void *)(inited + 32) = MEMORY[0x22A634170](v4);
  sub_22579FB78();
  unint64_t v6 = inited;
  if (!(inited >> 62))
  {
    if (!*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_22579FF88();
  swift_bridgeObjectRelease();
  if (v7) {
LABEL_3:
  }
    sub_22572F9BC(v6);
LABEL_5:
  swift_bridgeObjectRelease();

  sub_22572F19C(0, (unint64_t *)&unk_26ABF94D0);
  sub_22572F45C();
  v8 = (void *)sub_22579FBD8();
  swift_bridgeObjectRelease();
  return (NSSet *)v8;
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  HDMCPregnancyStateQueryServer.pregnancyModelDidUpdate(_:)((uint64_t)v4);
}

- (_TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  uint64_t v6 = sub_22579F398();
  MEMORY[0x270FA5388](v6 - 8);
  sub_22579F378();
  result = (_TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer *)sub_22579FF78();
  __break(1u);
  return result;
}

- (void)_queue_stop
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager);
  v3 = *(void **)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers);
  id v4 = self;
  objc_msgSend(v3, sel_unregisterObserver_, v4);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_unregisterObserver_, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_profileExtension));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager);
}

@end