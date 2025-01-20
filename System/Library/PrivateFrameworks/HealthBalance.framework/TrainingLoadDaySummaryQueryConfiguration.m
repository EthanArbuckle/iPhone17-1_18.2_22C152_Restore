@interface TrainingLoadDaySummaryQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (_TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration)init;
- (_TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TrainingLoadDaySummaryQueryConfiguration

- (_TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration)init
{
  v3 = (char *)self + OBJC_IVAR____TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration_gregorianCalendar;
  uint64_t v4 = sub_250E248B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR____TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration_morningIndexRange;
  sub_250D97944();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration_typeOfDataRequested) = 3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TrainingLoadDaySummaryQueryConfiguration();
  return [(HKQueryServerConfiguration *)&v8 init];
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4 = self;
  sub_250DF3380((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_250E253F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration)initWithCoder:(id)a3
{
  return (_TtC13HealthBalance40TrainingLoadDaySummaryQueryConfiguration *)TrainingLoadDaySummaryQueryConfiguration.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_250DF40B4(v4);
}

- (void).cxx_destruct
{
}

@end