@interface TrainingLoadSummaryQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (_TtC13HealthBalance24TrainingLoadSummaryQuery)initWithQueryDescriptors:(id)a3;
- (void)client_deliverTrainingLoadSampleDaySummaries:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation TrainingLoadSummaryQuery

+ (Class)configurationClass
{
  type metadata accessor for TrainingLoadDaySummaryQueryConfiguration();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)queue_populateConfiguration:(id)a3
{
  v4 = (HKQueryServerConfiguration *)a3;
  v5 = self;
  TrainingLoadSummaryQuery.queue_populateConfiguration(_:)(v4);
}

- (void)queue_deliverError:(id)a3
{
  id v5 = a3;
  v4 = self;
  TrainingLoadSummaryQuery.queue_deliverError(_:)(v5);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return (*((unsigned char *)&self->super.super.isa
          + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_continueAfterInitialResults) & 1) == 0;
}

- (void)queue_queryDidDeactivate:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_250E24750();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E24740();
  v9 = self;
  v10 = (void *)sub_250E24730();
  v13.receiver = v9;
  v13.super_class = ObjectType;
  [(HKQuery *)&v13 queue_queryDidDeactivate:v10];

  v11 = (Class *)((char *)&v9->super.super.isa
                + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_queue_resultsHandler);
  uint64_t v12 = *(uint64_t *)((char *)&v9->super.super.isa
                   + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_queue_resultsHandler);
  void *v11 = 0;
  v11[1] = 0;
  sub_250D8C39C(v12);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

+ (id)clientInterfaceProtocol
{
  return &unk_2701EC5A0;
}

+ (void)configureClientInterface:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  static TrainingLoadSummaryQuery.configureClientInterface(_:)(v4);
}

- (void)client_deliverTrainingLoadSampleDaySummaries:(id)a3 queryUUID:(id)a4
{
  uint64_t v5 = sub_250E24750();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = sub_250E24DC0();
  sub_250E24740();
  v10 = self;
  TrainingLoadSummaryQuery.client_deliverTrainingLoadSampleDaySummaries(_:queryUUID:)(v9, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC13HealthBalance24TrainingLoadSummaryQuery)initWithQueryDescriptors:(id)a3
{
  result = (_TtC13HealthBalance24TrainingLoadSummaryQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_250DCD5F0((uint64_t)self + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_morningIndexRange);
  v3 = (char *)self + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_gregorianCalendar;
  uint64_t v4 = sub_250E248B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_250D8C39C(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_queue_resultsHandler));

  swift_bridgeObjectRelease();
}

@end