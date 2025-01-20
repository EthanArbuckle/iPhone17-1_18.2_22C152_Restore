@interface BloodPressureChartSeries
- ($29D920EB297D915BAF2BF71A1708758A)selectedPathRange;
- (_TtC15HealthRecordsUI24BloodPressureChartSeries)init;
@end

@implementation BloodPressureChartSeries

- ($29D920EB297D915BAF2BF71A1708758A)selectedPathRange
{
  v4 = self;
  if ([(HKGraphSeries *)v4 allowsSelection])
  {
    HKGraphSeriesDataBlockPathMake((uint64_t)&v14);
    __n128 v20 = v14;
    *(void *)&long long v21 = v15;
    HKGraphSeriesDataPointPathMake(&v20, &v14);
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F67920] + 16);
    __n128 v20 = *(__n128 *)MEMORY[0x1E4F67920];
    long long v21 = v5;
    __n128 v18 = v14;
    long long v19 = v15;
  }
  else
  {
    unint64_t v6 = *(void *)(MEMORY[0x1E4F67920] + 8);
    uint64_t v8 = *(void *)(MEMORY[0x1E4F67920] + 16);
    uint64_t v7 = *(void *)(MEMORY[0x1E4F67920] + 24);
    v20.n128_u64[0] = *MEMORY[0x1E4F67920];
    v20.n128_u64[1] = v6;
    *(void *)&long long v21 = v8;
    *((void *)&v21 + 1) = v7;
    v18.n128_u64[0] = v20.n128_u64[0];
    v18.n128_u64[1] = v6;
    *(void *)&long long v19 = v8;
    *((void *)&v19 + 1) = v7;
  }
  HKGraphSeriesDataPointPathRangeMake(&v20, (uint64_t)&v18, &v14);
  long long v12 = v15;
  __n128 v13 = v14;
  long long v10 = v17;
  long long v11 = v16;

  *(__n128 *)&retstr->var0.var0.index = v13;
  *(_OWORD *)&retstr->var0.var0.resolution = v12;
  *(_OWORD *)&retstr->var1.var0.index = v11;
  *(_OWORD *)&retstr->var1.var0.resolution = v10;
  return result;
}

- (_TtC15HealthRecordsUI24BloodPressureChartSeries)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BloodPressureChartSeries();
  return [(HKBloodPressureSeries *)&v3 init];
}

@end