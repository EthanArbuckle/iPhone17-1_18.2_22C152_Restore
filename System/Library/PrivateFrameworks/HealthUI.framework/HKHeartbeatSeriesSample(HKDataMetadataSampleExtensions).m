@interface HKHeartbeatSeriesSample(HKDataMetadataSampleExtensions)
- (HKHeartbeatSequenceChartData)sequenceChartData;
@end

@implementation HKHeartbeatSeriesSample(HKDataMetadataSampleExtensions)

- (HKHeartbeatSequenceChartData)sequenceChartData
{
  v2 = objc_alloc_init(HKHeartbeatSequenceChartData);
  uint64_t v19 = 0;
  v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __76__HKHeartbeatSeriesSample_HKDataMetadataSampleExtensions__sequenceChartData__block_invoke;
  v11 = &unk_1E6D52660;
  v13 = v17;
  v14 = &v19;
  v3 = v2;
  v12 = v3;
  v15 = v16;
  [a1 _enumerateHeartbeatDataWithBlock:&v8];
  if (v20[3] == 0.0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_msgSend(a1, "metadata", v8, v9, v10, v11);
    v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2BB48]];

    if (v6)
    {
      [v6 doubleValue];
      -[HKHeartbeatSequenceChartData setInitialXAxisOffset:](v3, "setInitialXAxisOffset:");
    }
    v4 = v3;
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v4;
}

@end