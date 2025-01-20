@interface ExtensionTask
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC10ChronoCore13ExtensionTask)init;
- (int64_t)hash;
@end

@implementation ExtensionTask

- (NSString)description
{
  v2 = self;
  sub_1DAC4CDCC();
  sub_1DAD27A18();
  swift_bridgeObjectRetain();
  sub_1DAD27A18();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_1DAD278E8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1DAD22068();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DAD282E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1DAC4DA90((uint64_t)v8);

  sub_1DA9DD290((uint64_t)v8, &qword_1EBE43E80);
  return v6 & 1;
}

- (_TtC10ChronoCore13ExtensionTask)init
{
  result = (_TtC10ChronoCore13ExtensionTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_requiredDataProtectionLevel;
  uint64_t v4 = sub_1DAD27318();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1DAB12DDC((uint64_t)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_schedulingConfiguration, type metadata accessor for ExtensionTask.SchedulingConfiguration);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_powerlogWakeReason, &qword_1EBE43AC8);

  sub_1DAB12DDC((uint64_t)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_identifier, type metadata accessor for ExtensionTask.Identifier);
  v5 = (char *)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_taskIdentifier;
  uint64_t v6 = sub_1DAD22088();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  sub_1DA9F5534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_syncWorkItem));
  sub_1DA9F5534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_asyncWorkItem));
  sub_1DA9F5534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_taskWorkItem));
  sub_1DA9F5534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_completion));
  v7 = (char *)self + OBJC_IVAR____TtC10ChronoCore13ExtensionTask_creationDate;
  uint64_t v8 = sub_1DAD22008();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end