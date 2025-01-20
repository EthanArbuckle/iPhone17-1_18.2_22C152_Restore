@interface HMDHAPAccessoryReaderWriterMetricHelper
+ (BOOL)_isLinkFallback:(id)a3 reportedLinkLayerType:(int64_t)a4;
+ (void)updateLogEvents:(id)a3 withResponses:(id)a4 forTaskID:(id)a5 shouldSubmit:(BOOL)a6;
+ (void)updateLogEvents:(id)a3 withResponses:(id)a4 remoteMessageResponse:(id)a5 forTaskID:(id)a6 shouldSubmit:(BOOL)a7;
@end

@implementation HMDHAPAccessoryReaderWriterMetricHelper

+ (BOOL)_isLinkFallback:(id)a3 reportedLinkLayerType:(int64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if ((unint64_t)(a4 - 1) < 2)
  {
    if ([v5 isEqualToString:@"WiFi-Ethernet"]) {
      goto LABEL_9;
    }
    v7 = @"IP";
  }
  else if (a4 == 3)
  {
    v7 = @"BLE";
  }
  else
  {
    if (a4 != 4) {
      goto LABEL_9;
    }
    v7 = @"Thread";
  }
  if (([v6 isEqualToString:v7] & 1) == 0)
  {
    BOOL v8 = 1;
    goto LABEL_11;
  }
LABEL_9:
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

+ (void)updateLogEvents:(id)a3 withResponses:(id)a4 remoteMessageResponse:(id)a5 forTaskID:(id)a6 shouldSubmit:(BOOL)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = [v14 objectForKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];
  int v17 = [v16 intValue];

  LOBYTE(v16) = objc_msgSend(v14, "hmf_BOOLForKey:", @"kRemoteMessageIsRapportLinkSlowKey");
  char v18 = objc_msgSend(v14, "hmf_BOOLForKey:", @"kRemoteMessageIsModernTransportUsedKey");

  [MEMORY[0x1E4F6A278] currentTime];
  uint64_t v20 = v19;
  v21 = [MEMORY[0x1E4F1CA80] set];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __118__HMDHAPAccessoryReaderWriterMetricHelper_updateLogEvents_withResponses_remoteMessageResponse_forTaskID_shouldSubmit___block_invoke;
  v25[3] = &unk_1E6A0D1B8;
  int v31 = v17;
  char v32 = (char)v16;
  char v33 = v18;
  uint64_t v29 = v20;
  BOOL v34 = a7;
  id v26 = v12;
  id v27 = v21;
  id v30 = a1;
  id v28 = v13;
  id v22 = v13;
  id v23 = v21;
  id v24 = v12;
  objc_msgSend(v15, "na_each:", v25);
}

void __118__HMDHAPAccessoryReaderWriterMetricHelper_updateLogEvents_withResponses_remoteMessageResponse_forTaskID_shouldSubmit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 request];
  id v5 = [v4 accessory];

  if (([v5 isPrimary] & 1) == 0)
  {
    uint64_t v6 = [v5 bridge];

    id v5 = (void *)v6;
  }
  v7 = [v5 uuid];
  BOOL v8 = [v7 UUIDString];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    v10 = v9;
    if (v9)
    {
      if (([v9 isSubmitted] & 1) == 0)
      {
        [v10 setTransportType:*(unsigned int *)(a1 + 72)];
        [v10 setIsSlowRapport:*(unsigned __int8 *)(a1 + 76)];
        [v10 setIsModernTransport:*(unsigned __int8 *)(a1 + 77)];
        v11 = [v3 error];
        [v10 setResidentFirstError:v11];

        [v10 setResidentFirstEndTime:*(double *)(a1 + 56)];
        id v12 = objc_opt_class();
        id v13 = [v10 expectedTransport];
        objc_msgSend(v10, "setIsLinkFallback:", objc_msgSend(v12, "_isLinkFallback:reportedLinkLayerType:", v13, objc_msgSend(v10, "linkLayerType")));

        if (*(unsigned char *)(a1 + 78))
        {
          if (([*(id *)(a1 + 40) containsObject:v8] & 1) == 0)
          {
            id v14 = (void *)MEMORY[0x1D9452090]();
            id v15 = *(id *)(a1 + 64);
            v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              char v33 = v14;
              BOOL v34 = HMFGetLogIdentifier();
              uint64_t v17 = *(void *)(a1 + 48);
              if ([v10 isWriteOperation]) {
                char v18 = @"Writing";
              }
              else {
                char v18 = @"Reading";
              }
              char v32 = [v10 characteristicsInRequest];
              uint64_t v28 = [v32 count];
              int v31 = [v10 accessoryUUID];
              id v30 = [v10 error];
              uint64_t v29 = [v10 residentFirstError];
              uint64_t v27 = [v10 durationMilliseconds];
              uint64_t v26 = [v10 localDurationInMilliseconds];
              uint64_t v25 = [v10 residentFirstDurationInMilliseconds];
              if ([v10 isLocal])
              {
                [v10 linkType];
                HAPLinkTypeDescription();
                uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                unsigned int v20 = [v10 transportType];
                if (v20 > 6) {
                  v21 = 0;
                }
                else {
                  v21 = off_1E6A19498[v20];
                }
                uint64_t v19 = v21;
              }
              id v22 = v19;
              *(_DWORD *)buf = 138545922;
              v36 = v34;
              __int16 v37 = 2114;
              uint64_t v38 = v17;
              __int16 v39 = 2114;
              v40 = v18;
              __int16 v41 = 2048;
              uint64_t v42 = v28;
              __int16 v43 = 2114;
              v44 = v31;
              __int16 v45 = 2114;
              v46 = v30;
              __int16 v47 = 2114;
              v48 = v29;
              __int16 v49 = 2048;
              uint64_t v50 = v27;
              __int16 v51 = 2048;
              uint64_t v52 = v26;
              __int16 v53 = 2048;
              uint64_t v54 = v25;
              __int16 v55 = 2114;
              v56 = v19;
              _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@For Task: %{public}@ -- %{public}@ %tu characteristic(s) on accessory %{public}@ completed with error: %{public}@ (Resident first error: %{public}@), Total duration: %ld ms (Local duration: %ld ms, Resident first duration: %ld ms) using transport: %{public}@", buf, 0x70u);

              id v14 = v33;
            }

            [*(id *)(a1 + 40) addObject:v8];
          }
          id v23 = +[HMDMetricsManager sharedLogEventSubmitter];
          id v24 = [v10 residentFirstError];
          [v23 submitLogEvent:v10 error:v24];
        }
      }
    }
  }
  else
  {
    v10 = 0;
  }
}

+ (void)updateLogEvents:(id)a3 withResponses:(id)a4 forTaskID:(id)a5 shouldSubmit:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void *)MEMORY[0x1E4F6A278];
  id v13 = a4;
  [v12 currentTime];
  uint64_t v15 = v14;
  v16 = [MEMORY[0x1E4F1CA80] set];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__HMDHAPAccessoryReaderWriterMetricHelper_updateLogEvents_withResponses_forTaskID_shouldSubmit___block_invoke;
  v20[3] = &unk_1E6A0D190;
  uint64_t v24 = v15;
  id v25 = a1;
  BOOL v26 = a6;
  id v21 = v10;
  id v22 = v16;
  id v23 = v11;
  id v17 = v11;
  id v18 = v16;
  id v19 = v10;
  objc_msgSend(v13, "na_each:", v20);
}

void __96__HMDHAPAccessoryReaderWriterMetricHelper_updateLogEvents_withResponses_forTaskID_shouldSubmit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 request];
  id v5 = [v4 accessory];

  if (([v5 isPrimary] & 1) == 0)
  {
    uint64_t v6 = [v5 bridge];

    id v5 = (void *)v6;
  }
  v7 = [v5 uuid];
  BOOL v8 = [v7 UUIDString];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    id v10 = v9;
    if (v9)
    {
      if (([v9 isSubmitted] & 1) == 0)
      {
        id v11 = [v3 error];
        [v10 setResidentFirstError:v11];

        [v10 setResidentFirstEndTime:*(double *)(a1 + 56)];
        id v12 = *(void **)(a1 + 64);
        id v13 = [v10 expectedTransport];
        objc_msgSend(v10, "setIsLinkFallback:", objc_msgSend(v12, "_isLinkFallback:reportedLinkLayerType:", v13, objc_msgSend(v10, "linkLayerType")));

        if (*(unsigned char *)(a1 + 72))
        {
          if (([*(id *)(a1 + 40) containsObject:v8] & 1) == 0)
          {
            uint64_t v14 = (void *)MEMORY[0x1D9452090]();
            id v15 = *(id *)(a1 + 64);
            v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              char v33 = v14;
              BOOL v34 = HMFGetLogIdentifier();
              uint64_t v17 = *(void *)(a1 + 48);
              if ([v10 isWriteOperation]) {
                id v18 = @"Writing";
              }
              else {
                id v18 = @"Reading";
              }
              char v32 = [v10 characteristicsInRequest];
              uint64_t v28 = [v32 count];
              int v31 = [v10 accessoryUUID];
              id v30 = [v10 error];
              uint64_t v29 = [v10 residentFirstError];
              uint64_t v27 = [v10 durationMilliseconds];
              uint64_t v26 = [v10 localDurationInMilliseconds];
              uint64_t v25 = [v10 residentFirstDurationInMilliseconds];
              if ([v10 isLocal])
              {
                [v10 linkType];
                HAPLinkTypeDescription();
                id v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                unsigned int v20 = [v10 transportType];
                if (v20 > 6) {
                  id v21 = 0;
                }
                else {
                  id v21 = off_1E6A19498[v20];
                }
                id v19 = v21;
              }
              id v22 = v19;
              *(_DWORD *)buf = 138545922;
              v36 = v34;
              __int16 v37 = 2114;
              uint64_t v38 = v17;
              __int16 v39 = 2114;
              v40 = v18;
              __int16 v41 = 2048;
              uint64_t v42 = v28;
              __int16 v43 = 2114;
              v44 = v31;
              __int16 v45 = 2114;
              v46 = v30;
              __int16 v47 = 2114;
              v48 = v29;
              __int16 v49 = 2048;
              uint64_t v50 = v27;
              __int16 v51 = 2048;
              uint64_t v52 = v26;
              __int16 v53 = 2048;
              uint64_t v54 = v25;
              __int16 v55 = 2114;
              v56 = v19;
              _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@For Task: %{public}@ -- %{public}@ %tu characteristic(s) on accessory %{public}@ completed with error: %{public}@ (Resident first error: %{public}@), Total duration: %ld ms (Local duration: %ld ms, Resident first duration: %ld ms) using transport: %{public}@", buf, 0x70u);

              uint64_t v14 = v33;
            }

            [*(id *)(a1 + 40) addObject:v8];
          }
          id v23 = +[HMDMetricsManager sharedLogEventSubmitter];
          uint64_t v24 = [v10 residentFirstError];
          [v23 submitLogEvent:v10 error:v24];
        }
      }
    }
  }
  else
  {
    id v10 = 0;
  }
}

@end