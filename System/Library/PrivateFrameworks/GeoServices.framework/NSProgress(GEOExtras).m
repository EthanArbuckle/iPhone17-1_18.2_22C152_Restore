@interface NSProgress(GEOExtras)
+ (_GEOAggregateProgress)_geo_progressAggregatingChildrenWithTotalUnitCount:()GEOExtras;
+ (_GEOMirroredProgress)_geo_progressMirroringProgress:()GEOExtras;
+ (_GEOProgressForReceivingOverXPC)_geo_mirroredProgressFromReceivingXPCEndpoint:()GEOExtras;
+ (id)_geo_mirroredProgressForReceivingOverXPC:()GEOExtras;
+ (id)_geo_mirroredProgressFromReportingXPCEndpoint:()GEOExtras totalUnitCount:;
+ (id)_geo_newReportingXPCEndpointMirroringProgress:()GEOExtras;
- (id)_geo_mirroredProgressXPCDictionary;
- (void)_geo_configureFromMirroredProgressXPCDictionary:()GEOExtras;
- (void)_geo_configureFromPairedDeviceProgress:()GEOExtras;
- (void)_geo_mirroredProgressReplaceObservedProgressWith:()GEOExtras;
- (void)_geo_setUserInfo:()GEOExtras;
@end

@implementation NSProgress(GEOExtras)

- (void)_geo_setUserInfo:()GEOExtras
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 userInfo];
  if ((id)v5 == v4)
  {
  }
  else
  {
    v6 = (void *)v5;
    v7 = [a1 userInfo];
    char v8 = [v4 isEqualToDictionary:v7];

    if ((v8 & 1) == 0)
    {
      v9 = [a1 userInfo];
      v10 = [v9 allKeys];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __42__NSProgress_GEOExtras___geo_setUserInfo___block_invoke;
      v38[3] = &unk_1E53E4910;
      id v11 = v4;
      id v39 = v11;
      v12 = objc_msgSend(v10, "_geo_filtered:", v38);

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            [a1 setUserInfoObject:0 forKey:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
        }
        while (v15);
      }

      v18 = [v11 allKeys];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __42__NSProgress_GEOExtras___geo_setUserInfo___block_invoke_2;
      v32[3] = &unk_1E53E4938;
      v32[4] = a1;
      id v19 = v11;
      id v33 = v19;
      v20 = objc_msgSend(v18, "_geo_filtered:", v32);

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v29 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v28 + 1) + 8 * j);
            v27 = objc_msgSend(v19, "objectForKeyedSubscript:", v26, (void)v28);
            [a1 setUserInfoObject:v27 forKey:v26];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v23);
      }
    }
  }
}

+ (_GEOMirroredProgress)_geo_progressMirroringProgress:()GEOExtras
{
  id v3 = a3;
  id v4 = [[_GEOMirroredProgress alloc] initWithMirroredProgress:v3];

  return v4;
}

- (void)_geo_mirroredProgressReplaceObservedProgressWith:()GEOExtras
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a1 _replaceObservedProgressWith:v4];
  }
}

+ (id)_geo_newReportingXPCEndpointMirroringProgress:()GEOExtras
{
  id v3 = a3;
  id v4 = [[_GEOProgressForSendingOverXPC alloc] initWithMirroredProgress:v3];

  uint64_t v5 = [(_GEOProgressForSendingOverXPC *)v4 endpoint];

  return v5;
}

+ (_GEOProgressForReceivingOverXPC)_geo_mirroredProgressFromReceivingXPCEndpoint:()GEOExtras
{
  id v3 = a3;
  id v4 = [[_GEOProgressForReceivingOverXPC alloc] initWithEndpoint:v3];

  return v4;
}

+ (id)_geo_mirroredProgressForReceivingOverXPC:()GEOExtras
{
  id v3 = [[_GEOProgressForReceivingOverXPC alloc] initVendingEndpoint:a3];

  return v3;
}

+ (id)_geo_mirroredProgressFromReportingXPCEndpoint:()GEOExtras totalUnitCount:
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28F90];
  id v6 = a3;
  v7 = [v5 discreteProgressWithTotalUnitCount:a4];
  char v8 = [[_GEOProgressForSendingOverXPC alloc] initWithMirroredProgress:v7 endpoint:v6];

  return v7;
}

- (id)_geo_mirroredProgressXPCDictionary
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "indeterminate", [a1 isIndeterminate]);
  [a1 fractionCompleted];
  xpc_dictionary_set_double(v2, "fraction_completed", v3);
  id v4 = [a1 kind];

  if (v4)
  {
    uint64_t v5 = [a1 kind];
    int v6 = [v5 isEqual:*MEMORY[0x1E4F28898]];

    if (v6)
    {
      xpc_dictionary_set_int64(v2, "kind_type", 1);
    }
    else
    {
      xpc_dictionary_set_int64(v2, "kind_type", 2);
      id v7 = [a1 kind];
      xpc_dictionary_set_string(v2, "kind", (const char *)[v7 cStringUsingEncoding:4]);
    }
  }
  char v8 = [a1 userInfo];
  if ([v8 count])
  {
    v9 = objc_msgSend(v8, "_geo_newXPCObject");
    if (v9) {
      xpc_dictionary_set_value(v2, "user_info", v9);
    }
  }

  return v2;
}

- (void)_geo_configureFromMirroredProgressXPCDictionary:()GEOExtras
{
  id v4 = a3;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_BOOL(v4, "indeterminate"))
    {
      uint64_t v5 = -1;
      [a1 setTotalUnitCount:-1];
    }
    else
    {
      double v6 = xpc_dictionary_get_double(v4, "fraction_completed");
      [a1 setTotalUnitCount:100];
      uint64_t v5 = (uint64_t)(v6 * 100.0);
    }
    [a1 setCompletedUnitCount:v5];
    int64_t int64 = xpc_dictionary_get_int64(v4, "kind_type");
    if (int64 == 2)
    {
      objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "kind"));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (int64 != 1)
      {
        v9 = 0;
        goto LABEL_11;
      }
      id v8 = (id)*MEMORY[0x1E4F28898];
    }
    v9 = v8;
LABEL_11:
    uint64_t v10 = [a1 kind];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      id v11 = (void *)v10;
      v12 = [a1 kind];
      char v13 = [v9 isEqualToString:v12];

      if ((v13 & 1) == 0) {
        [a1 setKind:v9];
      }
    }
    uint64_t v14 = xpc_dictionary_get_value(v4, "user_info");
    if (v14)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "_geo_dictionaryFromXPCObject:", v14);
      if (v15) {
        objc_msgSend(a1, "_geo_setUserInfo:", v15);
      }
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: xpc_get_type(dictionary) == (&_xpc_type_dictionary)", v16, 2u);
  }
LABEL_20:
}

- (void)_geo_configureFromPairedDeviceProgress:()GEOExtras
{
  id v14 = a3;
  if ([v14 isIndeterminate])
  {
    uint64_t v4 = -1;
    [a1 setTotalUnitCount:-1];
  }
  else
  {
    [a1 setTotalUnitCount:100];
    [v14 fractionCompleted];
    uint64_t v4 = (uint64_t)(float)(v5 * 100.0);
  }
  [a1 setCompletedUnitCount:v4];
  if ([v14 hasKind] && objc_msgSend(v14, "kind") == 1) {
    id v6 = (id)*MEMORY[0x1E4F28898];
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = [a1 kind];
  if (v6 == (id)v7)
  {
  }
  else
  {
    id v8 = (void *)v7;
    v9 = [a1 kind];
    char v10 = [v6 isEqualToString:v9];

    if ((v10 & 1) == 0) {
      [a1 setKind:v6];
    }
  }
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v14 hasByteTotalCount])
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "byteTotalCount"));
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28800]];
  }
  if ([v14 hasByteCompletedCount])
  {
    char v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "byteCompletedCount"));
    [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F287F8]];
  }
  objc_msgSend(a1, "_geo_setUserInfo:", v11);
}

+ (_GEOAggregateProgress)_geo_progressAggregatingChildrenWithTotalUnitCount:()GEOExtras
{
  double v3 = [[_GEOAggregateProgress alloc] initWithTotalUnitCount:a3];

  return v3;
}

@end