@interface HMIVideoTemporalEventFilter
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeInterval;
- (BOOL)_resetPreviousFrameResult:(id)a3 expirationPTS:(id *)a4 regionOfInterest:(CGRect)a5;
- (HMIVideoAnalyzerFrameResult)prevFrameResult;
- (HMIVideoTemporalEventFilter)init;
- (NSDictionary)targetEventClassRanks;
- (NSMutableArray)stationaryObjects;
- (id)_filterEvents:(id)a3 stationaryEvents:(id)a4 motionDetection:(id)a5;
- (id)_filterEvents:(id)a3 stationaryEvents:(id)a4 motionDetection:(id)a5 prevFrameResult:(id)a6 regionOfInterest:(CGRect)a7;
- (id)_filterEvents:(id)a3 stationaryEvents:(id)a4 stationaryObjects:(id)a5 expirationPTS:(id *)a6 imageSize:(CGSize)a7;
- (id)applyFilterWithFrameResult:(id)a3 motionDetection:(id)a4;
- (void)setPrevFrameResult:(id)a3;
@end

@implementation HMIVideoTemporalEventFilter

- (HMIVideoTemporalEventFilter)init
{
  v12[3] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HMIVideoTemporalEventFilter;
  v2 = [(HMIVideoTemporalEventFilter *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    stationaryObjects = v2->_stationaryObjects;
    v2->_stationaryObjects = (NSMutableArray *)v3;

    CMTimeMakeWithSeconds(&v9, 10.0, 1000);
    long long v5 = *(_OWORD *)&v9.value;
    v2->_timeInterval.epoch = v9.epoch;
    *(_OWORD *)&v2->_timeInterval.value = v5;
    v11[0] = objc_opt_class();
    v12[0] = &unk_26D9A9438;
    v11[1] = objc_opt_class();
    v12[1] = &unk_26D9A9450;
    v11[2] = objc_opt_class();
    v12[2] = &unk_26D9A9468;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    targetEventClassRanks = v2->_targetEventClassRanks;
    v2->_targetEventClassRanks = (NSDictionary *)v6;
  }
  return v2;
}

- (id)applyFilterWithFrameResult:(id)a3 motionDetection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 events];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke;
  v41[3] = &unk_26477E050;
  v41[4] = self;
  CMTime v9 = objc_msgSend(v8, "na_filter:", v41);

  objc_super v10 = [v6 events];
  v11 = [v10 allObjects];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_2;
  v40[3] = &unk_26477E050;
  v40[4] = self;
  v12 = objc_msgSend(v11, "na_filter:", v40);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_3;
  v39[3] = &unk_26477E078;
  v39[4] = self;
  v13 = [v12 sortedArrayUsingComparator:v39];

  memset(&v38, 0, sizeof(v38));
  v14 = [v6 frame];
  v15 = v14;
  if (v14) {
    [v14 presentationTimeStamp];
  }
  else {
    memset(&v38, 0, sizeof(v38));
  }

  memset(&v37, 0, sizeof(v37));
  [(HMIVideoTemporalEventFilter *)self timeInterval];
  CMTime lhs = v38;
  CMTimeSubtract(&v37, &lhs, &rhs);
  v16 = [MEMORY[0x263EFF980] array];
  v17 = [(HMIVideoTemporalEventFilter *)self _filterEvents:v13 stationaryEvents:v16 motionDetection:v7];

  v18 = [(HMIVideoTemporalEventFilter *)self stationaryObjects];
  v19 = [v6 frame];
  [v19 size];
  CMTime lhs = v37;
  v20 = -[HMIVideoTemporalEventFilter _filterEvents:stationaryEvents:stationaryObjects:expirationPTS:imageSize:](self, "_filterEvents:stationaryEvents:stationaryObjects:expirationPTS:imageSize:", v17, v16, v18, &lhs);

  uint64_t v21 = [(HMIVideoTemporalEventFilter *)self prevFrameResult];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(HMIVideoTemporalEventFilter *)self prevFrameResult];
    [v6 regionOfInterest];
    CMTime lhs = v37;
    BOOL v24 = -[HMIVideoTemporalEventFilter _resetPreviousFrameResult:expirationPTS:regionOfInterest:](self, "_resetPreviousFrameResult:expirationPTS:regionOfInterest:", v23, &lhs);

    if (v24) {
      [(HMIVideoTemporalEventFilter *)self setPrevFrameResult:0];
    }
  }
  v25 = [(HMIVideoTemporalEventFilter *)self prevFrameResult];
  [v6 regionOfInterest];
  v26 = -[HMIVideoTemporalEventFilter _filterEvents:stationaryEvents:motionDetection:prevFrameResult:regionOfInterest:](self, "_filterEvents:stationaryEvents:motionDetection:prevFrameResult:regionOfInterest:", v20, v16, v7, v25);

  v27 = [v6 redactedCopy];
  [(HMIVideoTemporalEventFilter *)self setPrevFrameResult:v27];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_4;
  v33[3] = &unk_26477E0A0;
  v33[4] = self;
  CMTime v34 = v38;
  objc_msgSend(v16, "na_each:", v33);
  v28 = [HMIVideoAnalyzerFrameResult alloc];
  v29 = [v6 frame];
  v30 = [v9 setByAddingObjectsFromArray:v26];
  [v6 regionOfInterest];
  v31 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v28, "initWithFrame:events:regionOfInterest:", v29, v30);

  return v31;
}

BOOL __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 targetEventClassRanks];
  uint64_t v5 = objc_opt_class();

  id v6 = [v4 objectForKeyedSubscript:v5];
  BOOL v7 = v6 == 0;

  return v7;
}

BOOL __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 targetEventClassRanks];
  uint64_t v5 = objc_opt_class();

  id v6 = [v4 objectForKeyedSubscript:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

BOOL __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 targetEventClassRanks];
  uint64_t v9 = objc_opt_class();

  objc_super v10 = [v8 objectForKeyedSubscript:v9];
  LODWORD(v7) = [v10 intValue];
  v11 = [*(id *)(a1 + 32) targetEventClassRanks];
  uint64_t v12 = objc_opt_class();

  v13 = [v11 objectForKeyedSubscript:v12];
  BOOL v14 = (int)v7 > (int)[v13 intValue];

  return v14;
}

void __74__HMIVideoTemporalEventFilter_applyFilterWithFrameResult_motionDetection___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 stationaryObjects];
  id v6 = [HMIStationaryObject alloc];
  long long v8 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  id v7 = [(HMIStationaryObject *)v6 initWithEvent:v4 time:&v8];

  [v5 addObject:v7];
}

- (id)_filterEvents:(id)a3 stationaryEvents:(id)a4 motionDetection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = v9;
  if (v9)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __78__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection___block_invoke;
    v13[3] = &unk_26477E0C8;
    id v14 = v9;
    v15 = self;
    id v16 = v8;
    v11 = objc_msgSend(a3, "na_filter:", v13);
  }
  else
  {
    v11 = (void *)MEMORY[0x263EFFA68];
  }

  return v11;
}

uint64_t __78__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  [v3 boundingBox];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = objc_opt_class();
  id v14 = [v3 confidence];
  [v14 value];
  *(float *)&double v16 = v15;
  int v17 = objc_msgSend(v4, "applyEventTypeAndCheckIfSubBoundingIsStatic:eventClass:confidence:", v13, v6, v8, v10, v12, v16);

  if (v17)
  {
    uint64_t v18 = objc_opt_class();
    if (v18 == objc_opt_class())
    {
      v19 = (void *)MEMORY[0x22A641C70]();
      id v20 = *(id *)(a1 + 40);
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = HMFGetLogIdentifier();
        v23 = [v3 shortDescription];
        int v25 = 138543618;
        v26 = v22;
        __int16 v27 = 2112;
        v28 = v23;
        _os_log_impl(&dword_225DC6000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Add motion-vector stationary event %@", (uint8_t *)&v25, 0x16u);
      }
      [*(id *)(a1 + 48) addObject:v3];
    }
  }

  return v17 ^ 1u;
}

- (id)_filterEvents:(id)a3 stationaryEvents:(id)a4 stationaryObjects:(id)a5 expirationPTS:(id *)a6 imageSize:(CGSize)a7
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if ((objc_msgSend(v15, "hmf_isEmpty") & 1) == 0)
  {
    do
    {
      double v16 = [v15 firstObject];
      int v17 = v16;
      if (v16) {
        [v16 time];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      CMTime time2 = (CMTime)*a6;
      int32_t v18 = CMTimeCompare(&time1, &time2);

      if ((v18 & 0x80000000) == 0) {
        break;
      }
      objc_msgSend(v15, "hmf_removeFirstObject");
    }
    while (!objc_msgSend(v15, "hmf_isEmpty"));
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __104__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_stationaryObjects_expirationPTS_imageSize___block_invoke;
  v23[3] = &unk_26477E118;
  CGFloat v27 = width;
  CGFloat v28 = height;
  id v24 = v15;
  int v25 = self;
  id v26 = v14;
  id v19 = v14;
  id v20 = v15;
  uint64_t v21 = objc_msgSend(v13, "na_filter:", v23);

  return v21;
}

BOOL __104__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_stationaryObjects_expirationPTS_imageSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __104__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_stationaryObjects_expirationPTS_imageSize___block_invoke_2;
  v15[3] = &unk_26477E0F0;
  id v5 = v3;
  id v16 = v5;
  long long v17 = *(_OWORD *)(a1 + 56);
  double v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v15);
  if (v6)
  {
    double v7 = (void *)MEMORY[0x22A641C70]();
    id v8 = *(id *)(a1 + 40);
    double v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      double v10 = HMFGetLogIdentifier();
      double v11 = [v5 shortDescription];
      double v12 = [v6 event];
      id v13 = [v12 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Replace matched stationary event %@ for %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) addObject:v5];
    [*(id *)(a1 + 32) removeObject:v6];
  }

  return v6 == 0;
}

BOOL __104__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_stationaryObjects_expirationPTS_imageSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 event];
  if (v4 == objc_opt_class())
  {
    [*(id *)(a1 + 32) boundingBox];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    id v15 = [v3 event];
    [v15 boundingBox];
    BOOL v6 = HMICGRectMaxParallelEdgeDistance(v8, v10, v12, v14, v16, v17, v18, v19, *(double *)(a1 + 40), *(double *)(a1 + 48)) < 1.86;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_filterEvents:(id)a3 stationaryEvents:(id)a4 motionDetection:(id)a5 prevFrameResult:(id)a6 regionOfInterest:(CGRect)a7
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v17)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke_2;
    v20[3] = &unk_26477E168;
    id v21 = v16;
    CGFloat v25 = x;
    CGFloat v26 = y;
    CGFloat v27 = width;
    CGFloat v28 = height;
    id v22 = v17;
    v23 = self;
    id v24 = v15;
    CGFloat v18 = objc_msgSend(a3, "na_filter:", v20);
  }
  else
  {
    CGFloat v18 = objc_msgSend(a3, "na_filter:", &__block_literal_global_30);
  }

  return v18;
}

BOOL __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke()
{
  uint64_t v0 = objc_opt_class();
  return v0 != objc_opt_class();
}

BOOL __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    BOOL v6 = *(void **)(a1 + 32);
    if (v6)
    {
      [v3 boundingBox];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      uint64_t v15 = objc_opt_class();
      id v16 = [v3 confidence];
      [v16 value];
      *(float *)&double v18 = v17;
      objc_msgSend(v6, "scoreForSubBoundingBox:eventClass:confidence:", v15, v8, v10, v12, v14, v18);
      LODWORD(v8) = v19;

      if (*(float *)&v8 <= 15.0) {
        goto LABEL_6;
      }
    }
    [v3 boundingBox];
    if (HMICGRectMinElementwiseDistance(v20, v21, v22, v23, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88)) < 0.02)
    {
LABEL_6:
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v45 = 0;
      v46 = (float *)&v45;
      uint64_t v47 = 0x2020000000;
      float v48 = 0.0;
      id v24 = [*(id *)(a1 + 40) frame];
      [v24 size];
      double v26 = v25;

      CGFloat v27 = [*(id *)(a1 + 40) frame];
      [v27 size];
      double v29 = v28;

      if (v26 >= v29) {
        double v30 = v26;
      }
      else {
        double v30 = v29;
      }
      float v31 = v30;
      float v48 = v31;
      v32 = [*(id *)(a1 + 40) events];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke_3;
      v41[3] = &unk_26477E140;
      id v33 = v3;
      id v42 = v33;
      id v43 = *(id *)(a1 + 40);
      v44 = &v45;
      objc_msgSend(v32, "na_each:", v41);

      float v34 = v46[6];
      BOOL v5 = v34 >= 1.86;
      if (v34 < 1.86)
      {
        v35 = (void *)MEMORY[0x22A641C70]();
        id v36 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        CMTime v37 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          id v38 = (id)objc_claimAutoreleasedReturnValue();
          v39 = [v33 shortDescription];
          *(_DWORD *)buf = 138543618;
          id v50 = v38;
          __int16 v51 = 2112;
          v52 = v39;
          _os_log_impl(&dword_225DC6000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Add edge-distance stationary event %@", buf, 0x16u);
        }
        [*(id *)(a1 + 56) addObject:v33];
      }

      _Block_object_dispose(&v45, 8);
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

void __111__HMIVideoTemporalEventFilter__filterEvents_stationaryEvents_motionDetection_prevFrameResult_regionOfInterest___block_invoke_3(uint64_t a1, void *a2)
{
  id v26 = a2;
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    [*(id *)(a1 + 32) boundingBox];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [v26 boundingBox];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v20 = [*(id *)(a1 + 40) frame];
    [v20 size];
    float v23 = HMICGRectMaxParallelEdgeDistance(v5, v7, v9, v11, v13, v15, v17, v19, v21, v22);

    uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
    float v25 = *(float *)(v24 + 24);
    if (v23 < v25) {
      float v25 = v23;
    }
    *(float *)(v24 + 24) = v25;
  }
}

- (BOOL)_resetPreviousFrameResult:(id)a3 expirationPTS:(id *)a4 regionOfInterest:(CGRect)a5
{
  id v6 = a3;
  CGFloat v7 = [v6 frame];
  double v8 = v7;
  if (v7) {
    [v7 presentationTimeStamp];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  int32_t v9 = CMTimeCompare(&time1, (CMTime *)&v14);

  if (v9 < 0)
  {
    char v12 = 1;
  }
  else
  {
    double v10 = [v6 events];
    char v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_32);

    char v12 = v11 ^ 1;
  }

  return v12;
}

BOOL __88__HMIVideoTemporalEventFilter__resetPreviousFrameResult_expirationPTS_regionOfInterest___block_invoke()
{
  uint64_t v0 = objc_opt_class();
  return v0 == objc_opt_class();
}

- (HMIVideoAnalyzerFrameResult)prevFrameResult
{
  return (HMIVideoAnalyzerFrameResult *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrevFrameResult:(id)a3
{
}

- (NSMutableArray)stationaryObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeInterval
{
  objc_copyStruct(retstr, &self->_timeInterval, 24, 1, 0);
  return result;
}

- (NSDictionary)targetEventClassRanks
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEventClassRanks, 0);
  objc_storeStrong((id *)&self->_stationaryObjects, 0);
  objc_storeStrong((id *)&self->_prevFrameResult, 0);
}

@end