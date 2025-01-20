@interface HMIPersonTracker
- (HMIPersonTracker)init;
- (NSMutableArray)previousPersons;
- (id)getBlobIDAtIndex:(unint64_t)a3;
- (void)trackNewPersons:(id)a3 knownPersons:(id)a4 regionOfInterest:(CGRect)a5 timeStamp:(id *)a6;
@end

@implementation HMIPersonTracker

- (HMIPersonTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMIPersonTracker;
  v2 = [(HMIPersonTracker *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    previousPersons = v2->_previousPersons;
    v2->_previousPersons = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)trackNewPersons:(id)a3 knownPersons:(id)a4 regionOfInterest:(CGRect)a5 timeStamp:(id *)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke;
  v83[3] = &__block_descriptor_56_e52___HMIPersonBlob_16__0__HMIVideoAnalyzerEventPerson_8l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v84 = *a6;
  id v13 = a4;
  id v14 = a3;
  v50 = objc_msgSend(v13, "na_map:", v83);
  v15 = [MEMORY[0x263EFFA08] setWithArray:v13];

  v16 = objc_msgSend(v15, "na_map:", &__block_literal_global_12);

  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_3;
  v81[3] = &__block_descriptor_56_e52___HMIPersonBlob_16__0__HMIVideoAnalyzerEventPerson_8l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v82 = *a6;
  v17 = objc_msgSend(v14, "na_map:", v81);

  v18 = [(HMIPersonTracker *)self previousPersons];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_4;
  v77[3] = &unk_26477C3A0;
  long long v79 = *(_OWORD *)&a6->var0;
  int64_t var3 = a6->var3;
  id v78 = v16;
  int64_t v80 = var3;
  id v51 = v16;
  v20 = objc_msgSend(v18, "na_map:", v77);

  v21 = [MEMORY[0x263EFF980] array];
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_5;
  v74[3] = &unk_26477C3F0;
  id v22 = v17;
  id v75 = v22;
  id v76 = v21;
  id v48 = v21;
  [v20 enumerateObjectsUsingBlock:v74];
  v23 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v20, "count"));
  v24 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v22, "count"));
  v25 = [MEMORY[0x263EFF9A0] dictionary];
  v26 = [MEMORY[0x263EFF9A0] dictionary];
  v27 = [MEMORY[0x263F089C8] indexSet];
  v28 = [MEMORY[0x263F089C8] indexSet];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_7;
  v67[3] = &unk_26477C418;
  id v68 = v23;
  id v69 = v24;
  id v29 = v27;
  id v70 = v29;
  id v30 = v28;
  id v71 = v30;
  id v72 = v25;
  id v73 = v26;
  id v31 = v26;
  id v32 = v25;
  id v47 = v24;
  id v33 = v23;
  objc_msgSend(v48, "na_each:", v67);
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_8;
  v64[3] = &unk_26477C440;
  id v34 = v22;
  id v65 = v34;
  id v35 = v20;
  id v66 = v35;
  objc_msgSend(v32, "na_each:", v64);
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_9;
  v59[3] = &unk_26477C468;
  id v60 = v34;
  id v36 = v35;
  id v61 = v36;
  id v62 = v30;
  id v63 = v29;
  id v46 = v29;
  id v37 = v30;
  id v38 = v34;
  objc_msgSend(v31, "na_each:", v59);
  v39 = [MEMORY[0x263EFF980] array];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_10;
  v52[3] = &unk_26477C490;
  CGFloat v55 = x;
  CGFloat v56 = y;
  CGFloat v57 = width;
  CGFloat v58 = height;
  id v53 = v36;
  id v54 = v39;
  id v40 = v39;
  id v41 = v36;
  [v33 enumerateIndexesUsingBlock:v52];
  v42 = [(HMIPersonTracker *)self previousPersons];
  [v42 removeAllObjects];

  v43 = [(HMIPersonTracker *)self previousPersons];
  [v43 addObjectsFromArray:v38];

  v44 = [(HMIPersonTracker *)self previousPersons];
  [v44 addObjectsFromArray:v50];

  v45 = [(HMIPersonTracker *)self previousPersons];
  [v45 addObjectsFromArray:v40];
}

HMIPersonBlob *__76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HMIPersonBlob alloc];
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  v5 = [(HMIPersonBlob *)v4 initWithNewPersonEvent:v3 timeStamp:&v7];

  return v5;
}

uint64_t __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sessionEntityUUID];
}

HMIPersonBlob *__76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HMIPersonBlob alloc];
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  v5 = [(HMIPersonBlob *)v4 initWithNewPersonEvent:v3 timeStamp:&v7];

  return v5;
}

id __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 personIndices];
  [v4 removeAllIndexes];

  v5 = *(void **)(a1 + 32);
  objc_super v6 = [v3 blobID];
  if ([v5 containsObject:v6])
  {
    long long v7 = 0;
  }
  else
  {
    long long v10 = *(_OWORD *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    if ([v3 isExpiredAtTimeStamp:&v10]) {
      long long v7 = 0;
    }
    else {
      long long v7 = v3;
    }
  }
  id v8 = v7;

  return v8;
}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_6;
  v8[3] = &unk_26477C3C8;
  id v9 = v5;
  uint64_t v11 = a3;
  objc_super v6 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v26 = a2;
  [v26 similarityToPersonBlob:*(void *)(a1 + 32)];
  float v6 = v5;
  if (v5 > 0.0)
  {
    id v7 = [HMIPairwiseMatch alloc];
    *(float *)&double v8 = v6;
    id v9 = [(HMIPairwiseMatch *)v7 initWithFirstIndex:*(void *)(a1 + 48) secondIndex:a3 score:v8];
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v9, objc_msgSend(*(id *)(a1 + 40), "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(*(id *)(a1 + 40), "count"), 1024, &__block_literal_global_2));
  }
  [*(id *)(a1 + 32) boundingBox];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [v26 boundingBox];
  v29.origin.CGFloat x = v18;
  v29.origin.CGFloat y = v19;
  v29.size.CGFloat width = v20;
  v29.size.CGFloat height = v21;
  v28.origin.CGFloat x = v11;
  v28.origin.CGFloat y = v13;
  v28.size.CGFloat width = v15;
  v28.size.CGFloat height = v17;
  BOOL v22 = CGRectIntersectsRect(v28, v29);
  if (v6 >= 0.0 && v22)
  {
    v24 = [*(id *)(a1 + 32) personIndices];
    [v24 addIndex:a3];

    v25 = [v26 personIndices];
    [v25 addIndex:*(void *)(a1 + 48)];
  }
}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_7(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v7, "firstIndex"))
    && objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v7, "secondIndex")))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:", objc_msgSend(v7, "firstIndex"));
    objc_msgSend(*(id *)(a1 + 40), "removeIndex:", objc_msgSend(v7, "secondIndex"));
    [v7 score];
    if (v3 <= 1.0)
    {
      v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "firstIndex"));
      float v5 = *(void **)(a1 + 72);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v7, "firstIndex"));
      objc_msgSend(*(id *)(a1 + 56), "addIndex:", objc_msgSend(v7, "secondIndex"));
      v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "firstIndex"));
      float v5 = *(void **)(a1 + 64);
    }
    float v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "secondIndex"));
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a1;
  float v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", (int)objc_msgSend(a2, "intValue"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = *(void **)(v4 + 40);
  LODWORD(v4) = [v6 intValue];

  double v8 = [v7 objectAtIndexedSubscript:(int)v4];
  [v9 trackPersonBlob:v8];
}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_9(void *a1, void *a2, void *a3)
{
  float v5 = (void *)a1[4];
  id v6 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", (int)objc_msgSend(a2, "intValue"));
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)a1[5];
  LODWORD(v5) = [v6 intValue];

  double v8 = [v7 objectAtIndexedSubscript:(int)v5];
  id v9 = [v14 personIndices];
  [v9 removeIndexes:a1[6]];

  double v10 = [v8 personIndices];
  [v10 removeIndexes:a1[7]];

  CGFloat v11 = [v14 personIndices];
  if ((unint64_t)[v11 count] >= 2)
  {
  }
  else
  {
    double v12 = [v8 personIndices];
    unint64_t v13 = [v12 count];

    if (v13 <= 1) {
      [v14 trackPersonBlob:v8];
    }
  }
}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_10(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v7 boundingBox];
  v9.origin.CGFloat x = v3;
  v9.origin.CGFloat y = v4;
  v9.size.CGFloat width = v5;
  v9.size.CGFloat height = v6;
  if (!CGRectIntersectsRect(*(CGRect *)(a1 + 48), v9)) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (id)getBlobIDAtIndex:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CGFloat v5 = [(HMIPersonTracker *)self previousPersons];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    CGRect v9 = [MEMORY[0x263F08C38] UUID];
    double v10 = (void *)MEMORY[0x22A641C70]();
    CGFloat v11 = self;
    double v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = HMFGetLogIdentifier();
      id v14 = [(HMIPersonTracker *)v11 previousPersons];
      int v16 = 138544130;
      CGFloat v17 = v13;
      __int16 v18 = 2112;
      CGFloat v19 = v9;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      __int16 v22 = 2048;
      uint64_t v23 = [v14 count];
      _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_ERROR, "%{public}@HMIPersonTracker: unable to get %@ at index %lu / %lu", (uint8_t *)&v16, 0x2Au);
    }
  }
  else
  {
    id v7 = [(HMIPersonTracker *)self previousPersons];
    double v8 = [v7 objectAtIndexedSubscript:a3];
    CGRect v9 = [v8 blobID];
  }
  return v9;
}

- (NSMutableArray)previousPersons
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end