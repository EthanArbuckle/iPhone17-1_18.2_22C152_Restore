@interface HDCMSwimData
- (CMSwimData)data;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSUUID)sourceId;
- (_TtC12HealthDaemon12HDCMSwimData)init;
- (double)distance;
- (id)init:(id)a3;
- (int64_t)lapCount;
- (int64_t)recordId;
- (int64_t)segment;
- (int64_t)strokeCount;
- (int64_t)strokeType;
@end

@implementation HDCMSwimData

- (CMSwimData)data
{
  return (CMSwimData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data));
}

- (NSDate)startDate
{
  return (NSDate *)sub_1BCBD9F28((char *)self, (uint64_t)a2, MEMORY[0x1E4F27928], (SEL *)&selRef_startDate, MEMORY[0x1E4F27918], MEMORY[0x1E4F278C0]);
}

- (NSDate)endDate
{
  return (NSDate *)sub_1BCBD9F28((char *)self, (uint64_t)a2, MEMORY[0x1E4F27928], (SEL *)&selRef_endDate, MEMORY[0x1E4F27918], MEMORY[0x1E4F278C0]);
}

- (int64_t)recordId
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_recordId);
}

- (NSUUID)sourceId
{
  return (NSUUID *)sub_1BCBD9F28((char *)self, (uint64_t)a2, MEMORY[0x1E4F27990], (SEL *)&selRef_sourceId, MEMORY[0x1E4F27988], MEMORY[0x1E4F27980]);
}

- (int64_t)lapCount
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_lapCount);
}

- (int64_t)segment
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_segment);
}

- (double)distance
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_distance);
  return result;
}

- (int64_t)strokeCount
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_strokeCount);
}

- (int64_t)strokeType
{
  v2 = self;
  int64_t v3 = sub_1BCBDA1F0();

  return v3;
}

- (id)init:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HDCMSwimData();
  id v4 = a3;
  return [(HDCMSwimData *)&v6 init];
}

- (_TtC12HealthDaemon12HDCMSwimData)init
{
  double result = (_TtC12HealthDaemon12HDCMSwimData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end