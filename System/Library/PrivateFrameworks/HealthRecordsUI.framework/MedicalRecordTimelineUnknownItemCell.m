@interface MedicalRecordTimelineUnknownItemCell
- (_TtC15HealthRecordsUI36MedicalRecordTimelineUnknownItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI36MedicalRecordTimelineUnknownItemCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation MedicalRecordTimelineUnknownItemCell

- (_TtC15HealthRecordsUI36MedicalRecordTimelineUnknownItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI36MedicalRecordTimelineUnknownItemCell *)sub_1C253BFD8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI36MedicalRecordTimelineUnknownItemCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI36MedicalRecordTimelineUnknownItemCell *)sub_1C253C2C4(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C254E690();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254E680();
  v8 = self;
  sub_1C230BE90((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
}

@end