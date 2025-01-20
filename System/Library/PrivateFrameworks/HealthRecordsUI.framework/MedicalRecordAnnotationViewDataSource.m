@interface MedicalRecordAnnotationViewDataSource
- (BOOL)showSeparators;
- (_TtC15HealthRecordsUI37MedicalRecordAnnotationViewDataSource)init;
- (id)dateViewWithOrientation:(int64_t)a3;
- (id)leftMarginViewWithOrientation:(int64_t)a3;
- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4;
- (int64_t)numberOfValuesForAnnotationView:(id)a3;
@end

@implementation MedicalRecordAnnotationViewDataSource

- (_TtC15HealthRecordsUI37MedicalRecordAnnotationViewDataSource)init
{
  return (_TtC15HealthRecordsUI37MedicalRecordAnnotationViewDataSource *)MedicalRecordAnnotationViewDataSource.init()();
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  return 1;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC15HealthRecordsUI37MedicalRecordAnnotationViewDataSource_dateGroup));
}

- (BOOL)showSeparators
{
  return 0;
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  v4 = self;
  id v5 = (id)sub_1C2456880(a3);

  return v5;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI37MedicalRecordAnnotationViewDataSource_dateGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI37MedicalRecordAnnotationViewDataSource_monthYearLabel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI37MedicalRecordAnnotationViewDataSource_timeLabel));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI37MedicalRecordAnnotationViewDataSource_dividerLabel);
}

@end