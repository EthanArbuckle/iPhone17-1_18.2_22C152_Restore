@interface SleepingSampleDaySummaryQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (_TtC13HealthBalance42SleepingSampleDaySummaryQueryConfiguration)init;
- (_TtC13HealthBalance42SleepingSampleDaySummaryQueryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SleepingSampleDaySummaryQueryConfiguration

- (_TtC13HealthBalance42SleepingSampleDaySummaryQueryConfiguration)initWithCoder:(id)a3
{
  SleepingSampleDaySummaryQueryConfiguration.init(coder:)(a3);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_250D89BFC(v4);
}

- (id)copyWithZone:(void *)a3
{
  id v4 = self;
  sub_250D8A138((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_250E253F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (void).cxx_destruct
{
}

- (_TtC13HealthBalance42SleepingSampleDaySummaryQueryConfiguration)init
{
  v3 = (char *)self + OBJC_IVAR____TtC13HealthBalance42SleepingSampleDaySummaryQueryConfiguration_gregorianCalendar;
  uint64_t v4 = sub_250E248B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR____TtC13HealthBalance42SleepingSampleDaySummaryQueryConfiguration_morningIndexRange;
  sub_250D8CEA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SleepingSampleDaySummaryQueryConfiguration();
  return [(HKQueryServerConfiguration *)&v8 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end