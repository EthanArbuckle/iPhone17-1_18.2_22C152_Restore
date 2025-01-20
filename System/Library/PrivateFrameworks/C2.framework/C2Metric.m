@interface C2Metric
+ (id)generateDeviceInfo;
+ (id)generateError:(id)a3;
+ (id)generateGenericEventWithName:(id)a3 genericMetricType:(int64_t)a4 startTime:(id)a5 endTime:(id)a6 attributes:(id)a7;
@end

@implementation C2Metric

void __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = objc_alloc_init(C2MPGenericEventMetric);
  [(C2MPGenericEventMetric *)v7 setKey:v5];
  v8 = objc_alloc_init(C2MPGenericEventMetricValue);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 timeIntervalSinceReferenceDate];
    [(C2MPGenericEventMetricValue *)v8 setDateValue:+[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:")];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[C2MPGenericEventMetricValue setDoubleValue:](v8, "setDoubleValue:");
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(C2MPGenericEventMetricValue *)v8 setStringValue:v6];
      }
      else
      {
        if (C2_DEFAULT_LOG_BLOCK_0 != -1) {
          dispatch_once(&C2_DEFAULT_LOG_BLOCK_0, &__block_literal_global_19_0);
        }
        v9 = (void *)C2_DEFAULT_LOG_INTERNAL_0;
        if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          v11 = v9;
          v12 = (objc_class *)objc_opt_class();
          v13 = NSStringFromClass(v12);
          int v16 = 138543874;
          uint64_t v17 = v10;
          __int16 v18 = 2114;
          id v19 = v5;
          __int16 v20 = 2114;
          v21 = v13;
          _os_log_impl(&dword_1DD523000, v11, OS_LOG_TYPE_ERROR, "genericMetric with name %{public}@ had key %{public}@ with unhandled metric type: %{public}@", (uint8_t *)&v16, 0x20u);
        }
        v8 = 0;
      }
    }
  }
  [(C2MPGenericEventMetric *)v7 setValue:v8];
  if (v7 && v8)
  {
    [*(id *)(a1 + 40) addMetric:v7];
  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_0, &__block_literal_global_22);
    }
    v14 = C2_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_1DD523000, v14, OS_LOG_TYPE_ERROR, "genericMetric with name %{public}@ encountered error processing key %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
}

+ (id)generateDeviceInfo
{
  v2 = objc_alloc_init(C2MPDeviceInfo);
  v3 = +[C2DeviceInfo productName];
  [(C2MPDeviceInfo *)v2 setProductName:v3];

  v4 = +[C2DeviceInfo productType];
  [(C2MPDeviceInfo *)v2 setProductType:v4];

  id v5 = +[C2DeviceInfo productVersion];
  [(C2MPDeviceInfo *)v2 setProductVersion:v5];

  id v6 = +[C2DeviceInfo buildVersion];
  [(C2MPDeviceInfo *)v2 setProductBuild:v6];

  v7 = +[C2DeviceInfo processName];
  [(C2MPDeviceInfo *)v2 setProcessName:v7];

  v8 = +[C2DeviceInfo processVersion];
  [(C2MPDeviceInfo *)v2 setProcessVersion:v8];

  v9 = +[C2DeviceInfo processUUID];
  [(C2MPDeviceInfo *)v2 setProcessUuid:v9];

  uint64_t v10 = +[C2DeviceInfo testName];
  [(C2MPDeviceInfo *)v2 setUserDefaultTestName:v10];

  [(C2MPDeviceInfo *)v2 setIsAppleInternal:+[C2DeviceInfo isAppleInternal]];
  return v2;
}

+ (id)generateGenericEventWithName:(id)a3 genericMetricType:(int64_t)a4 startTime:(id)a5 endTime:(id)a6 attributes:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = objc_alloc_init(C2MPGenericEvent);
  [(C2MPGenericEvent *)v15 setName:v11];
  if (a4 == 2)
  {
    int v16 = v15;
    uint64_t v17 = 201;
  }
  else if (a4 == 1)
  {
    int v16 = v15;
    uint64_t v17 = 101;
  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_0, &__block_literal_global_3);
    }
    __int16 v18 = C2_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v30 = v11;
      __int16 v31 = 2048;
      int64_t v32 = a4;
      _os_log_impl(&dword_1DD523000, v18, OS_LOG_TYPE_ERROR, "genericMetric with name %{public}@ had unknown metricType %llu", buf, 0x16u);
    }
    int v16 = v15;
    uint64_t v17 = 0;
  }
  [(C2MPGenericEvent *)v16 setType:v17];
  if (v12)
  {
    [v12 timeIntervalSinceReferenceDate];
    unint64_t v19 = +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:");
  }
  else
  {
    unint64_t v19 = 0;
  }
  [(C2MPGenericEvent *)v15 setTimestampStart:v19];
  if (v13)
  {
    [v13 timeIntervalSinceReferenceDate];
    unint64_t v20 = +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:");
  }
  else
  {
    unint64_t v20 = 0;
  }
  [(C2MPGenericEvent *)v15 setTimestampEnd:v20];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke_12;
  v26[3] = &unk_1E6CCC110;
  id v27 = v11;
  v21 = v15;
  v28 = v21;
  id v22 = v11;
  [v14 enumerateKeysAndObjectsUsingBlock:v26];

  v23 = v28;
  v24 = v21;

  return v24;
}

+ (id)generateError:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(C2MPError);
  id v5 = [v3 domain];
  id v6 = [v5 description];
  [(C2MPError *)v4 setErrorDomain:v6];

  -[C2MPError setErrorCode:](v4, "setErrorCode:", [v3 code]);
  if (+[C2DeviceInfo isAppleInternal])
  {
    v7 = [v3 userInfo];
    v8 = [v7 objectForKeyedSubscript:@"CKErrorDescription"];
    [(C2MPError *)v4 setErrorDescription:v8];

    v9 = [(C2MPError *)v4 errorDescription];

    if (!v9)
    {
      uint64_t v10 = [v3 userInfo];
      id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
      [(C2MPError *)v4 setErrorDescription:v11];
    }
    id v12 = [(C2MPError *)v4 errorDescription];

    if (!v12)
    {
      id v13 = [v3 userInfo];
      id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
      [(C2MPError *)v4 setErrorDescription:v14];
    }
  }
  uint64_t v15 = [v3 userInfo];
  int v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v16)
  {
    uint64_t v17 = +[C2Metric generateError:v16];
    [(C2MPError *)v4 setUnderlyingError:v17];
  }
  return v4;
}

uint64_t __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke_20()
{
  C2_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

@end