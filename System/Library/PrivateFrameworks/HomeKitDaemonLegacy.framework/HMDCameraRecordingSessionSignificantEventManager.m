@interface HMDCameraRecordingSessionSignificantEventManager
+ (id)logCategory;
- (BOOL)_isAnyEventInAnalyzerEvents:(id)a3 includedInRecordingEventTriggers:(unint64_t)a4;
- (BOOL)_isAnyEventInAnalyzerFrameResults:(id)a3 includedInRecordingEventTriggers:(unint64_t)a4;
- (BOOL)isAnyEventInAnalyzerFragmentResult:(id)a3 includedInRecordingEventTriggers:(unint64_t)a4;
- (HMDCameraRecordingSessionSignificantEventManager)initWithWorkQueue:(id)a3 faceClassificationResolver:(id)a4 logIdentifier:(id)a5;
- (HMDCameraSignificantEventFaceClassificationResolver)faceClassificationResolver;
- (NSMutableArray)significantEvents;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_faceRecognitionSignificantEventForAnalyzerEvent:(id)a3 dateOfOccurrence:(id)a4 heroFrameData:(id)a5 timeOffsetWithinClip:(double)a6 confidenceLevel:(unint64_t)a7;
- (id)_filteredAndUpdatedSignificantEventsFromSignificantEvents:(id)a3;
- (id)_filteredFaceClassificationsFromFaceClassifications:(id)a3;
- (id)_significantEventsForAnalyzerEvent:(id)a3 dateOfOccurrence:(id)a4 heroFrameData:(id)a5 timeOffsetWithinClip:(double)a6 recordingEventTriggers:(unint64_t)a7;
- (id)_significantEventsForEmptyAnalyzerResult:(id)a3 dateOfOccurrence:(id)a4 timeOffsetWithinClip:(double)a5;
- (id)_significantEventsForFrameResult:(id)a3 analyzerResult:(id)a4 dateOfOccurrence:(id)a5 timeOffsetWithinClip:(double)a6 recordingEventTriggers:(unint64_t)a7;
- (id)faceClassificationUUIDFactory;
- (id)significantEventUUIDFactory;
- (id)significantEventsForAnalyzerFragmentResult:(id)a3 dateOfOccurrence:(id)a4 timeOffsetWithinClip:(double)a5 recordingEventTriggers:(unint64_t)a6;
- (void)resetState;
- (void)setFaceClassificationUUIDFactory:(id)a3;
- (void)setSignificantEventUUIDFactory:(id)a3;
@end

@implementation HMDCameraRecordingSessionSignificantEventManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_faceClassificationUUIDFactory, 0);
  objc_storeStrong(&self->_significantEventUUIDFactory, 0);
  objc_storeStrong((id *)&self->_significantEvents, 0);
  objc_storeStrong((id *)&self->_faceClassificationResolver, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setFaceClassificationUUIDFactory:(id)a3
{
}

- (id)faceClassificationUUIDFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSignificantEventUUIDFactory:(id)a3
{
}

- (id)significantEventUUIDFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (NSMutableArray)significantEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCameraSignificantEventFaceClassificationResolver)faceClassificationResolver
{
  return (HMDCameraSignificantEventFaceClassificationResolver *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)_faceRecognitionSignificantEventForAnalyzerEvent:(id)a3 dateOfOccurrence:(id)a4 heroFrameData:(id)a5 timeOffsetWithinClip:(double)a6 confidenceLevel:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v15);

  id v16 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  v19 = [v18 face];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v22 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v21 = v23;
  }
  v24 = [v21 faceRecognition];
  v25 = v24;
  if (v24)
  {
    unint64_t v39 = a7;
    v26 = [v24 classifications];
    v27 = [(HMDCameraRecordingSessionSignificantEventManager *)self _filteredFaceClassificationsFromFaceClassifications:v26];

    if ([v27 count])
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __169__HMDCameraRecordingSessionSignificantEventManager__faceRecognitionSignificantEventForAnalyzerEvent_dateOfOccurrence_heroFrameData_timeOffsetWithinClip_confidenceLevel___block_invoke;
      v41[3] = &unk_1E6A0BC48;
      v41[4] = self;
      id v28 = v25;
      id v42 = v28;
      v37 = objc_msgSend(v27, "na_map:", v41);
      v29 = [(HMDCameraRecordingSessionSignificantEventManager *)self significantEventUUIDFactory];
      [v28 sessionEntityUUID];
      id v40 = v14;
      v31 = id v30 = v13;
      v38 = ((void (**)(void, id, void *))v29)[2](v29, v16, v31);

      v32 = [(HMDCameraRecordingSessionSignificantEvent *)[HMDMutableCameraRecordingSessionSignificantEvent alloc] initWithUUID:v38];
      [(HMDCameraRecordingSessionSignificantEvent *)v32 setReason:2];
      [(HMDCameraRecordingSessionSignificantEvent *)v32 setDateOfOccurrence:v30];
      [(HMDCameraRecordingSessionSignificantEvent *)v32 setConfidenceLevel:v39];
      v33 = [v28 sessionEntityUUID];
      [(HMDCameraRecordingSessionSignificantEvent *)v32 setSessionEntityUUID:v33];

      [(HMDCameraRecordingSessionSignificantEvent *)v32 setFaceClassifications:v37];
      [(HMDCameraRecordingSessionSignificantEvent *)v32 setHeroFrameData:v40];
      v34 = [v28 faceCrop];
      v35 = [v34 dataRepresentation];
      [(HMDCameraRecordingSessionSignificantEvent *)v32 setFaceCropData:v35];

      id v13 = v30;
      id v14 = v40;

      [(HMDCameraRecordingSessionSignificantEvent *)v32 setTimeOffsetWithinClip:a6];
    }
    else
    {
      v32 = 0;
    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

HMDMutableCameraSignificantEventFaceClassification *__169__HMDCameraRecordingSessionSignificantEventManager__faceRecognitionSignificantEventForAnalyzerEvent_dateOfOccurrence_heroFrameData_timeOffsetWithinClip_confidenceLevel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) faceClassificationUUIDFactory];
  v5 = ((void (**)(void, id))v4)[2](v4, v3);

  v6 = [HMDMutableCameraSignificantEventFaceClassification alloc];
  v7 = [v3 sourceUUID];
  v8 = [(HMDCameraSignificantEventFaceClassification *)v6 initWithUUID:v5 personManagerUUID:v7];

  v9 = [v3 personUUID];
  if (!v9)
  {
    id v12 = [*(id *)(a1 + 40) faceCrop];
    id v13 = [v12 UUID];
    [(HMDCameraSignificantEventFaceClassification *)v8 setUnassociatedFaceCropUUID:v13];
    goto LABEL_6;
  }
  [(HMDCameraSignificantEventFaceClassification *)v8 setPersonUUID:v9];
  v10 = [*(id *)(a1 + 32) faceClassificationResolver];
  v11 = [v3 sourceUUID];
  id v12 = [v10 personManagerWithUUID:v11];

  if ([v12 sharesFaceClassifications] && (objc_msgSend(v12, "syncsPersonData") & 1) == 0)
  {
    id v13 = [v12 personWithUUID:v9];
    id v14 = [v13 name];
    [(HMDCameraSignificantEventFaceClassification *)v8 setPersonName:v14];

LABEL_6:
  }

  return v8;
}

- (id)_filteredFaceClassificationsFromFaceClassifications:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __104__HMDCameraRecordingSessionSignificantEventManager__filteredFaceClassificationsFromFaceClassifications___block_invoke;
  v8[3] = &unk_1E6A0BC20;
  v8[4] = self;
  v6 = objc_msgSend(v4, "na_filter:", v8);

  return v6;
}

uint64_t __104__HMDCameraRecordingSessionSignificantEventManager__filteredFaceClassificationsFromFaceClassifications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 familiarity];
  if (v4 == 1) {
    goto LABEL_4;
  }
  if (v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [*(id *)(a1 + 32) faceClassificationResolver];
  v6 = [v3 sourceUUID];
  v7 = [(id)v5 personManagerWithUUID:v6];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if (v5) {
LABEL_4:
  }
    uint64_t v8 = 0;
  else {
LABEL_5:
  }
    uint64_t v8 = 1;

  return v8;
}

- (id)_filteredAndUpdatedSignificantEventsFromSignificantEvents:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v65 = [MEMORY[0x1E4F1CA80] set];
  v6 = (void *)MEMORY[0x1E4F1CA80];
  v7 = [(HMDCameraRecordingSessionSignificantEventManager *)self significantEvents];
  v68 = [v6 setWithArray:v7];

  v62 = v4;
  uint64_t v8 = [v4 allObjects];
  v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_15_53316];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v75 = 0u;
  long long v74 = 0u;
  id obj = v9;
  uint64_t v67 = [obj countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (v67)
  {
    uint64_t v66 = *(void *)v75;
    v63 = self;
    do
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v75 != v66) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_2;
        v73[3] = &unk_1E6A0BBD0;
        v73[4] = v11;
        id v12 = objc_msgSend(v68, "na_firstObjectPassingTest:", v73);
        if (v12)
        {
          id v13 = [v11 sessionEntityUUID];
          id v14 = v13;
          if (v13)
          {
            v71[0] = MEMORY[0x1E4F143A8];
            v71[1] = 3221225472;
            v71[2] = __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_17;
            v71[3] = &unk_1E6A0BBD0;
            id v72 = v13;
            uint64_t v15 = objc_msgSend(v68, "na_firstObjectPassingTest:", v71);
            if (!v15)
            {
              v32 = [v12 sessionEntityUUID];

              if (v32)
              {
                v33 = (void *)MEMORY[0x1D9452090]();
                v34 = self;
                v35 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  v36 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v36;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v11;
                  _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Adding new significant event: %@", buf, 0x16u);

                  self = v63;
                }

                v37 = [(HMDCameraRecordingSessionSignificantEventManager *)v34 significantEvents];
                v38 = (void *)[v11 mutableCopy];
                [v37 addObject:v38];

                [v65 addObject:v11];
              }
              else
              {
                v45 = (void *)MEMORY[0x1D9452090]([v68 removeObject:v12]);
                v46 = self;
                v47 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  v48 = HMFGetLogIdentifier();
                  *(void *)buf = 0;
                  *(void *)&buf[8] = 0;
                  v49 = [v12 UUID];

                  if (v49)
                  {
                    v50 = [v12 UUID];
                    [v50 getUUIDBytes:buf];
                  }
                  else
                  {
                    *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
                  }
                  long long v79 = *(_OWORD *)buf;
                  *(_DWORD *)buf = 138544130;
                  *(void *)&buf[4] = v48;
                  *(_WORD *)&buf[12] = 1040;
                  *(_DWORD *)&buf[14] = 16;
                  *(_WORD *)&buf[18] = 2096;
                  *(void *)&buf[20] = &v79;
                  __int16 v82 = 2112;
                  v83 = (long long *)v11;
                  _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Updating existing significant event with UUID %{uuid_t}.16P using new significant event: %@", buf, 0x26u);

                  self = v63;
                }

                v54 = [v11 dateOfOccurrence];
                [v12 setDateOfOccurrence:v54];

                v55 = [v11 sessionEntityUUID];
                [v12 setSessionEntityUUID:v55];

                v56 = [v11 faceClassifications];
                [v12 setFaceClassifications:v56];

                v57 = [v11 heroFrameData];
                [v12 setHeroFrameData:v57];

                v58 = [v11 faceCropData];
                [v12 setFaceCropData:v58];

                [v11 timeOffsetWithinClip];
                objc_msgSend(v12, "setTimeOffsetWithinClip:");
                v59 = (void *)[v12 copy];
                [v65 addObject:v59];
              }
              goto LABEL_37;
            }
            id v16 = (void *)v15;
            v17 = [v11 faceClassifications];
            v69[0] = MEMORY[0x1E4F143A8];
            v69[1] = 3221225472;
            v69[2] = __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_2_18;
            v69[3] = &unk_1E6A0BBF8;
            id v18 = v16;
            id v70 = v18;
            v19 = objc_msgSend(v17, "na_filter:", v69);

            if ([v19 count])
            {
              v20 = (void *)MEMORY[0x1D9452090]([v68 removeObject:v18]);
              id v21 = self;
              id v22 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                v23 = HMFGetLogIdentifier();
                *(void *)buf = 0;
                *(void *)&buf[8] = 0;
                v24 = [v18 UUID];

                if (v24)
                {
                  v25 = [v18 UUID];
                  [v25 getUUIDBytes:buf];
                }
                else
                {
                  *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
                }
                long long v80 = *(_OWORD *)buf;
                *(_DWORD *)buf = 138544130;
                *(void *)&buf[4] = v23;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v19;
                *(_WORD *)&buf[22] = 1040;
                *(_DWORD *)&buf[24] = 16;
                __int16 v82 = 2096;
                v83 = &v80;
                _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Adding new face classifications %@ to existing significant event with UUID: %{uuid_t}.16P", buf, 0x26u);

                self = v63;
              }

              v51 = [v18 faceClassifications];
              v52 = [v51 setByAddingObjectsFromSet:v19];
              [v18 setFaceClassifications:v52];

              v53 = (void *)[v18 copy];
              [v65 addObject:v53];

LABEL_37:
              goto LABEL_38;
            }
          }
          unint64_t v39 = (void *)MEMORY[0x1D9452090]();
          id v40 = self;
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            id v42 = HMFGetLogIdentifier();
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            v43 = [v11 UUID];

            if (v43)
            {
              v44 = [v11 UUID];
              [v44 getUUIDBytes:buf];
            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
            }
            long long v78 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v42;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            *(_WORD *)&buf[18] = 2096;
            *(void *)&buf[20] = &v78;
            _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Skipping already-represented significant event with UUID: %{uuid_t}.16P", buf, 0x1Cu);

            self = v63;
          }

          goto LABEL_37;
        }
        v26 = (void *)MEMORY[0x1D9452090]();
        v27 = self;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Adding new significant event: %@", buf, 0x16u);
        }
        id v30 = [(HMDCameraRecordingSessionSignificantEventManager *)v27 significantEvents];
        v31 = (void *)[v11 mutableCopy];
        [v30 addObject:v31];

        [v65 addObject:v11];
LABEL_38:
      }
      uint64_t v67 = [obj countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v67);
  }

  v60 = (void *)[v65 copy];
  return v60;
}

BOOL __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v6 = 1;
  if ([*(id *)(a1 + 32) reason] != 1 || objc_msgSend(v3, "reason") == 6)
  {
    uint64_t v4 = [v3 reason];
    if (v4 != [*(id *)(a1 + 32) reason]
      || (unint64_t v5 = [v3 confidenceLevel], v5 < objc_msgSend(*(id *)(a1 + 32), "confidenceLevel")))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

uint64_t __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = [a2 sessionEntityUUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_2_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) faceClassifications];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_3;
  v8[3] = &unk_1E6A0BBF8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_allObjectsPassTest:", v8);

  return v6;
}

uint64_t __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 personManagerUUID];
  id v5 = [*(id *)(a1 + 32) personManagerUUID];
  int v6 = [v4 isEqual:v5];

  v7 = [v3 personUUID];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) personUUID];
    BOOL v8 = v9 != 0;
  }
  return v6 ^ 1 | v8;
}

uint64_t __110__HMDCameraRecordingSessionSignificantEventManager__filteredAndUpdatedSignificantEventsFromSignificantEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 sessionEntityUUID];
  if (v5
    && (int v6 = (void *)v5,
        [v4 sessionEntityUUID],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = [v4 sessionEntityUUID];

    if (v9) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = -1;
    }
  }

  return v8;
}

- (id)_significantEventsForEmptyAnalyzerResult:(id)a3 dateOfOccurrence:(id)a4 timeOffsetWithinClip:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(HMDCameraRecordingSessionSignificantEventManager *)self significantEventUUIDFactory];
  v11 = v10[2](v10, 0, 0);

  id v12 = [(HMDCameraRecordingSessionSignificantEvent *)[HMDMutableCameraRecordingSessionSignificantEvent alloc] initWithUUID:v11];
  id v13 = [v9 outcome];
  if ([v13 isSuccess]) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 6;
  }
  [(HMDCameraRecordingSessionSignificantEvent *)v12 setReason:v14];

  [(HMDCameraRecordingSessionSignificantEvent *)v12 setDateOfOccurrence:v8];
  [(HMDCameraRecordingSessionSignificantEvent *)v12 setConfidenceLevel:100];
  uint64_t v15 = [v9 thumbnails];

  id v16 = [v15 firstObject];
  v17 = [v16 data];
  [(HMDCameraRecordingSessionSignificantEvent *)v12 setHeroFrameData:v17];

  [(HMDCameraRecordingSessionSignificantEvent *)v12 setTimeOffsetWithinClip:a5];
  id v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  v19 = [(HMDCameraRecordingSessionSignificantEventManager *)self _filteredAndUpdatedSignificantEventsFromSignificantEvents:v18];

  return v19;
}

- (id)_significantEventsForAnalyzerEvent:(id)a3 dateOfOccurrence:(id)a4 heroFrameData:(id)a5 timeOffsetWithinClip:(double)a6 recordingEventTriggers:(unint64_t)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v37 = a4;
  id v12 = a5;
  id v13 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = significantEventReasonFromVideoAnalyzerEventClass(v15);
  unint64_t v17 = [v11 confidenceLevel];
  unint64_t v18 = v17;
  if (v17 >= 3)
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      unint64_t v39 = v22;
      __int16 v40 = 2048;
      unint64_t v41 = v18;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unknown analyzer event confidence level: %ld", buf, 0x16u);
    }
    uint64_t v19 = 100;
  }
  else
  {
    uint64_t v19 = qword_1D54D3AB8[v17];
  }
  v23 = (void *)MEMORY[0x1E4F1CAD0];
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v16, a7);
  v25 = [v23 setWithObject:v24];
  uint64_t v26 = HMCameraSignificantEventTypesFromReasons();

  if ((v26 & v36) != 0)
  {
    v27 = v37;
    id v28 = v12;
    v29 = [(HMDCameraRecordingSessionSignificantEventManager *)self _faceRecognitionSignificantEventForAnalyzerEvent:v11 dateOfOccurrence:v37 heroFrameData:v12 timeOffsetWithinClip:v19 confidenceLevel:a6];
    if (v29)
    {
      [v14 addObject:v29];
    }
    else
    {
      v31 = [(HMDCameraRecordingSessionSignificantEventManager *)self significantEventUUIDFactory];
      v32 = ((void (**)(void, id, void))v31)[2](v31, v11, 0);

      v33 = [(HMDCameraRecordingSessionSignificantEvent *)[HMDMutableCameraRecordingSessionSignificantEvent alloc] initWithUUID:v32];
      [(HMDCameraRecordingSessionSignificantEvent *)v33 setReason:v16];
      [(HMDCameraRecordingSessionSignificantEvent *)v33 setDateOfOccurrence:v37];
      [(HMDCameraRecordingSessionSignificantEvent *)v33 setConfidenceLevel:v19];
      [(HMDCameraRecordingSessionSignificantEvent *)v33 setHeroFrameData:v28];
      [(HMDCameraRecordingSessionSignificantEvent *)v33 setTimeOffsetWithinClip:a6];
      [v14 addObject:v33];
    }
    id v30 = (void *)[v14 copy];
  }
  else
  {
    id v30 = [MEMORY[0x1E4F1CAD0] set];
    v27 = v37;
    id v28 = v12;
  }

  return v30;
}

- (id)_significantEventsForFrameResult:(id)a3 analyzerResult:(id)a4 dateOfOccurrence:(id)a5 timeOffsetWithinClip:(double)a6 recordingEventTriggers:(unint64_t)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v49 = a4;
  id v48 = a5;
  id v12 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)MEMORY[0x1D9452090]();
  uint64_t v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    unint64_t v17 = [v11 frame];
    unint64_t v18 = [v11 events];
    *(_DWORD *)buf = 138543874;
    v61 = v16;
    __int16 v62 = 2112;
    v63 = v17;
    __int16 v64 = 2112;
    id v65 = v18;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Finding significant events for frame result %@ with analyzer events: %@", buf, 0x20u);
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
  v20 = [v11 frame];
  id v58 = 0;
  id v21 = [v20 compressedFrameWithScale:&v58 quality:1.0 error:1.0];
  id v45 = v58;

  if (!v21)
  {
    id v22 = (void *)MEMORY[0x1D9452090]();
    v23 = v14;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      uint64_t v26 = [v11 frame];
      *(_DWORD *)buf = 138543874;
      v61 = v25;
      __int16 v62 = 2112;
      v63 = v26;
      __int16 v64 = 2112;
      id v65 = v45;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hero frame from frame %@: %@", buf, 0x20u);
    }
  }
  v27 = v14;
  id v28 = objc_msgSend(v21, "data", v21);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v29 = v11;
  id obj = [v11 events];
  uint64_t v30 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        v35 = [v29 frame];
        uint64_t v36 = v35;
        if (v35) {
          [v35 presentationTimeStamp];
        }
        else {
          memset(&lhs, 0, sizeof(lhs));
        }
        id v37 = [v49 fragment];
        v38 = v37;
        if (v37) {
          [v37 timeRange];
        }
        else {
          memset(&v50, 0, sizeof(v50));
        }
        CMTime rhs = v50;
        CMTimeSubtract(&time, &lhs, &rhs);
        double Seconds = CMTimeGetSeconds(&time);

        __int16 v40 = [v48 dateByAddingTimeInterval:Seconds];
        unint64_t v41 = [(HMDCameraRecordingSessionSignificantEventManager *)v27 _significantEventsForAnalyzerEvent:v34 dateOfOccurrence:v40 heroFrameData:v28 timeOffsetWithinClip:a7 recordingEventTriggers:Seconds + a6];
        [v19 unionSet:v41];
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v31);
  }

  uint64_t v42 = (void *)[v19 copy];
  return v42;
}

- (BOOL)_isAnyEventInAnalyzerEvents:(id)a3 includedInRecordingEventTriggers:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __113__HMDCameraRecordingSessionSignificantEventManager__isAnyEventInAnalyzerEvents_includedInRecordingEventTriggers___block_invoke;
  v9[3] = &unk_1E6A0BB88;
  v9[4] = self;
  v9[5] = a4;
  LOBYTE(a4) = objc_msgSend(v6, "na_any:", v9);

  return a4;
}

BOOL __113__HMDCameraRecordingSessionSignificantEventManager__isAnyEventInAnalyzerEvents_includedInRecordingEventTriggers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_class();
  uint64_t v5 = significantEventReasonFromVideoAnalyzerEventClass(v4);
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = [NSNumber numberWithUnsignedInteger:v5];
  id v8 = [v6 setWithObject:v7];
  uint64_t v9 = HMCameraSignificantEventTypesFromReasons();

  uint64_t v10 = *(void *)(a1 + 40) & v9;
  if (v10)
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      unint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Recording fragment due to recording trigger event: %@", (uint8_t *)&v16, 0x16u);
    }
  }

  return v10 != 0;
}

- (BOOL)_isAnyEventInAnalyzerFrameResults:(id)a3 includedInRecordingEventTriggers:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __119__HMDCameraRecordingSessionSignificantEventManager__isAnyEventInAnalyzerFrameResults_includedInRecordingEventTriggers___block_invoke;
  v9[3] = &unk_1E6A0BB60;
  v9[4] = self;
  v9[5] = a4;
  LOBYTE(a4) = objc_msgSend(v6, "na_any:", v9);

  return a4;
}

uint64_t __119__HMDCameraRecordingSessionSignificantEventManager__isAnyEventInAnalyzerFrameResults_includedInRecordingEventTriggers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 events];
  uint64_t v5 = [v3 _isAnyEventInAnalyzerEvents:v4 includedInRecordingEventTriggers:*(void *)(a1 + 40)];

  return v5;
}

- (void)resetState
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Resetting state", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(HMDCameraRecordingSessionSignificantEventManager *)v5 significantEvents];
  [v8 removeAllObjects];
}

- (id)significantEventsForAnalyzerFragmentResult:(id)a3 dateOfOccurrence:(id)a4 timeOffsetWithinClip:(double)a5 recordingEventTriggers:(unint64_t)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v9 outcome];
  char v13 = [v12 isSuccess];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = [v9 events];
    id v47 = v10;
    id v48 = v9;
    uint64_t v45 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v45)
    {
      uint64_t v43 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v63 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          unint64_t v17 = [v9 thumbnails];
          __int16 v18 = [v17 firstObject];
          id v19 = [v18 data];
          uint64_t v20 = [(HMDCameraRecordingSessionSignificantEventManager *)self _significantEventsForAnalyzerEvent:v16 dateOfOccurrence:v10 heroFrameData:v19 timeOffsetWithinClip:a6 recordingEventTriggers:a5];

          id v21 = [(HMDCameraRecordingSessionSignificantEventManager *)self _filteredAndUpdatedSignificantEventsFromSignificantEvents:v20];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v68 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v59;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v59 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                v27 = [v26 UUID];
                [v14 setObject:v26 forKeyedSubscript:v27];
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v58 objects:v68 count:16];
            }
            while (v23);
          }

          id v10 = v47;
          id v9 = v48;
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v45);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obja = [v9 frameResults];
    uint64_t v46 = [obja countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v46)
    {
      uint64_t v44 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(obja);
          }
          v29 = [(HMDCameraRecordingSessionSignificantEventManager *)self _significantEventsForFrameResult:*(void *)(*((void *)&v54 + 1) + 8 * k) analyzerResult:v9 dateOfOccurrence:v10 timeOffsetWithinClip:a6 recordingEventTriggers:a5];
          uint64_t v30 = [(HMDCameraRecordingSessionSignificantEventManager *)self _filteredAndUpdatedSignificantEventsFromSignificantEvents:v29];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v66 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v51;
            do
            {
              for (uint64_t m = 0; m != v32; ++m)
              {
                if (*(void *)v51 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = *(void **)(*((void *)&v50 + 1) + 8 * m);
                uint64_t v36 = [v35 UUID];
                [v14 setObject:v35 forKeyedSubscript:v36];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v50 objects:v66 count:16];
            }
            while (v32);
          }

          id v10 = v47;
          id v9 = v48;
        }
        uint64_t v46 = [obja countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v46);
    }

    if ([v14 count])
    {
      id v37 = (void *)MEMORY[0x1E4F1CAD0];
      v38 = [v14 allValues];
      unint64_t v39 = [v37 setWithArray:v38];
    }
    else
    {
      unint64_t v39 = [(HMDCameraRecordingSessionSignificantEventManager *)self _significantEventsForEmptyAnalyzerResult:v9 dateOfOccurrence:v10 timeOffsetWithinClip:a5];
    }
  }
  else
  {
    unint64_t v39 = [(HMDCameraRecordingSessionSignificantEventManager *)self _significantEventsForEmptyAnalyzerResult:v9 dateOfOccurrence:v10 timeOffsetWithinClip:a5];
  }

  return v39;
}

- (BOOL)isAnyEventInAnalyzerFragmentResult:(id)a3 includedInRecordingEventTriggers:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(HMDCameraRecordingSessionSignificantEventManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 events];
  if ([(HMDCameraRecordingSessionSignificantEventManager *)self _isAnyEventInAnalyzerEvents:v8 includedInRecordingEventTriggers:a4])
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = [v6 frameResults];
    BOOL v9 = [(HMDCameraRecordingSessionSignificantEventManager *)self _isAnyEventInAnalyzerFrameResults:v10 includedInRecordingEventTriggers:a4];
  }
  return v9;
}

- (HMDCameraRecordingSessionSignificantEventManager)initWithWorkQueue:(id)a3 faceClassificationResolver:(id)a4 logIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    id v12 = v11;
    v21.receiver = self;
    v21.super_class = (Class)HMDCameraRecordingSessionSignificantEventManager;
    char v13 = [(HMDCameraRecordingSessionSignificantEventManager *)&v21 init];
    uint64_t v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_workQueue, a3);
      objc_storeStrong((id *)&v14->_faceClassificationResolver, a4);
      objc_storeStrong((id *)&v14->_logIdentifier, a5);
      uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
      significantEvents = v14->_significantEvents;
      v14->_significantEvents = (NSMutableArray *)v15;

      id significantEventUUIDFactory = v14->_significantEventUUIDFactory;
      v14->_id significantEventUUIDFactory = &__block_literal_global_53345;

      id faceClassificationUUIDFactory = v14->_faceClassificationUUIDFactory;
      v14->_id faceClassificationUUIDFactory = &__block_literal_global_5_53346;
    }
    return v14;
  }
  else
  {
    uint64_t v20 = _HMFPreconditionFailure();
    return (HMDCameraRecordingSessionSignificantEventManager *)__111__HMDCameraRecordingSessionSignificantEventManager_initWithWorkQueue_faceClassificationResolver_logIdentifier___block_invoke_2(v20);
  }
}

uint64_t __111__HMDCameraRecordingSessionSignificantEventManager_initWithWorkQueue_faceClassificationResolver_logIdentifier___block_invoke_2()
{
  return [MEMORY[0x1E4F29128] UUID];
}

uint64_t __111__HMDCameraRecordingSessionSignificantEventManager_initWithWorkQueue_faceClassificationResolver_logIdentifier___block_invoke()
{
  return [MEMORY[0x1E4F29128] UUID];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_53358 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_53358, &__block_literal_global_28);
  }
  v2 = (void *)logCategory__hmf_once_v14_53359;
  return v2;
}

uint64_t __63__HMDCameraRecordingSessionSignificantEventManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v14_53359;
  logCategory__hmf_once_v14_53359 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end