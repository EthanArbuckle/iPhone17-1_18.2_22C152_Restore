@interface HDClinicalContentAnalyticsAccumulator
- (HDClinicalContentAnalyticsAccumulator)initWithProfileExtension:(id)a3;
- (HDClinicalContentAnalyticsUnknownRecordsMetric)unknownRecordsMetric;
- (HDHealthRecordsProfileExtension)profileExtension;
- (id)_fetchDeviceContextAnalytics;
- (id)analyticsString;
- (id)debugDescription;
- (int64_t)batchCount;
- (void)accumulateMetricsForItem:(id)a3;
- (void)incrementBatchCount;
- (void)resetMetrics;
- (void)submitMetricsWithCoordinator:(id)a3;
@end

@implementation HDClinicalContentAnalyticsAccumulator

- (HDClinicalContentAnalyticsAccumulator)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDClinicalContentAnalyticsAccumulator;
  v5 = [(HDClinicalContentAnalyticsAccumulator *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    v7 = objc_alloc_init(HDClinicalContentAnalyticsUnknownRecordsMetric);
    unknownRecordsMetric = v6->_unknownRecordsMetric;
    v6->_unknownRecordsMetric = v7;

    v6->_batchCount = 1;
  }

  return v6;
}

- (void)accumulateMetricsForItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 medicalRecord];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(HDClinicalContentAnalyticsAccumulator *)self unknownRecordsMetric];
    [v7 accumulateMetricForItem:v4];
LABEL_5:

    goto LABEL_6;
  }
  _HKInitializeLogging();
  v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v8;
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = [v4 medicalRecord];
    int v13 = 138412546;
    v14 = v9;
    __int16 v15 = 2112;
    id v16 = (id)objc_opt_class();
    id v12 = v16;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%@ attempting to accumulate metric for record type %@ which we don't support", (uint8_t *)&v13, 0x16u);

    goto LABEL_5;
  }
LABEL_6:
}

- (void)submitMetricsWithCoordinator:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDClinicalContentAnalyticsAccumulator.m", 50, @"Invalid parameter not satisfying: %@", @"coordinator" object file lineNumber description];
  }
  _HKInitializeLogging();
  v6 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = [(HDClinicalContentAnalyticsAccumulator *)self debugDescription];
    v9 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    __int16 v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ ingestion analytics collection %{public}@", buf, 0x16u);
  }
  id v10 = [(HDClinicalContentAnalyticsAccumulator *)self unknownRecordsMetric];
  id v11 = [v10 count];

  if (v11)
  {
    _HKInitializeLogging();
    id v12 = HKLogAnalytics();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

    if (v13)
    {
      v14 = HKLogAnalytics();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_B1DCC((uint64_t)self, v14);
      }
    }
    __int16 v15 = [(HDClinicalContentAnalyticsAccumulator *)self unknownRecordsMetric];
    id v16 = [(HDClinicalContentAnalyticsAccumulator *)self _fetchDeviceContextAnalytics];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_73EE0;
    v18[3] = &unk_114200;
    id v19 = v5;
    [v15 enumerateElementsAsCoreAnalyticsPayloadWithDeviceContext:v16 block:v18];
  }
}

- (id)_fetchDeviceContextAnalytics
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  v3 = [WeakRetained profile];
  id v4 = [v3 deviceContextManager];
  id v5 = [v4 numberOfDeviceContextsPerDeviceType:0];

  if (v5)
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:&off_11D230];
    v7 = (void *)v6;
    if (v6) {
      v8 = (_UNKNOWN **)v6;
    }
    else {
      v8 = &off_11D248;
    }
    v9 = v8;

    uint64_t v10 = [v5 objectForKeyedSubscript:&off_11D260];
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (_UNKNOWN **)v10;
    }
    else {
      id v12 = &off_11D248;
    }
    BOOL v13 = v12;

    uint64_t v14 = [v5 objectForKeyedSubscript:&off_11D278];
    __int16 v15 = (void *)v14;
    if (v14) {
      id v16 = (_UNKNOWN **)v14;
    }
    else {
      id v16 = &off_11D248;
    }
    v17 = v16;

    uint64_t v18 = [v5 objectForKeyedSubscript:&off_11D290];
    id v19 = (void *)v18;
    if (v18) {
      v20 = (_UNKNOWN **)v18;
    }
    else {
      v20 = &off_11D248;
    }
    v21 = v20;

    v24[0] = HKAnalyticsPropertyNameDeviceContextCountPhone;
    v24[1] = HKAnalyticsPropertyNameDeviceContextCountWatch;
    v25[0] = v9;
    v25[1] = v17;
    v24[2] = HKAnalyticsPropertyNameDeviceContextCountiPad;
    v24[3] = HKAnalyticsPropertyNameDeviceContextCountVisionPro;
    v25[2] = v13;
    v25[3] = v21;
    __int16 v22 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  }
  else
  {
    v26[0] = HKAnalyticsPropertyNameDeviceContextCountPhone;
    v26[1] = HKAnalyticsPropertyNameDeviceContextCountWatch;
    v27[0] = &off_11D218;
    v27[1] = &off_11D218;
    v26[2] = HKAnalyticsPropertyNameDeviceContextCountiPad;
    v26[3] = HKAnalyticsPropertyNameDeviceContextCountVisionPro;
    v27[2] = &off_11D218;
    v27[3] = &off_11D218;
    __int16 v22 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  }

  return v22;
}

- (void)resetMetrics
{
  id v2 = [(HDClinicalContentAnalyticsAccumulator *)self unknownRecordsMetric];
  [v2 resetMetric];
}

- (void)incrementBatchCount
{
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(HDClinicalContentAnalyticsAccumulator *)self batchCount];
  id v5 = [(HDClinicalContentAnalyticsAccumulator *)self unknownRecordsMetric];
  uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p> %lu batches: {%@: %lu}", v3, self, v4, @"unknownRecordsMetric", [v5 count]);

  return v6;
}

- (id)analyticsString
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(HDClinicalContentAnalyticsAccumulator *)self batchCount];
  id v5 = [(HDClinicalContentAnalyticsAccumulator *)self unknownRecordsMetric];
  uint64_t v6 = [v5 analyticsString];
  v7 = +[NSString stringWithFormat:@"%@ %lu batches:\n\n %@\n\n", v3, v4, v6];

  return v7;
}

- (HDClinicalContentAnalyticsUnknownRecordsMetric)unknownRecordsMetric
{
  return self->_unknownRecordsMetric;
}

- (int64_t)batchCount
{
  return self->_batchCount;
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);

  return (HDHealthRecordsProfileExtension *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profileExtension);

  objc_storeStrong((id *)&self->_unknownRecordsMetric, 0);
}

@end