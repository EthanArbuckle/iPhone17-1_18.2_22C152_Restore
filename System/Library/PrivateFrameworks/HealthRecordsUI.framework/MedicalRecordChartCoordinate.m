@interface MedicalRecordChartCoordinate
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (_TtC15HealthRecordsUI28MedicalRecordChartCoordinate)init;
- (double)endXValue;
- (double)startXValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation MedicalRecordChartCoordinate

- (double)startXValue
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartCoordinate_pointValuesAscending);
  if (*(void *)(v2 + 16)) {
    return *(double *)(v2 + 32);
  }
  else {
    return 0.0;
  }
}

- (double)endXValue
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartCoordinate_pointValuesAscending);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3) {
    return *(double *)(v2 + 16 * v3 + 16);
  }
  else {
    return 0.0;
  }
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  uint64_t v2 = (void *)swift_unknownObjectRetain();
  return (HKGraphSeriesBlockCoordinateInfo *)v2;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  long long v4 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a3->tx;
  v5 = self;
  id v6 = sub_1C24134E0(v8);

  return v6;
}

- (_TtC15HealthRecordsUI28MedicalRecordChartCoordinate)init
{
  result = (_TtC15HealthRecordsUI28MedicalRecordChartCoordinate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end