@interface HDFakeDataCollector
+ (id)collectedTypes;
- (BOOL)canResumeCollectionFromLastSensorDatum;
- (HDFakeDataCollector)initWithProfile:(id)a3;
- (HDFakeDataCollectorConfiguration)configuration;
- (id)identifierForDataAggregator:(id)a3;
- (id)sourceForDataAggregator:(id)a3;
- (int64_t)datumCount;
- (void)_lock_addGenerator:(uint64_t)a1;
- (void)_lock_endFaking;
- (void)_lock_generateThrough:(uint64_t)a1;
- (void)_lock_setupFakeGeneratorForQuantityType:(void *)a3 interval:(void *)a4 time:(double)a5 metadata:(double)a6 quantity:;
- (void)_lock_setupGeneratorsForStartTime:(uint64_t)a1;
- (void)dealloc;
- (void)generateForConfiguration:(id)a3 from:(id)a4 to:(id)a5;
- (void)registerWithAggregators;
- (void)setConfiguration:(id)a3;
- (void)unregisterFromAggregators;
@end

@implementation HDFakeDataCollector

- (HDFakeDataCollector)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDFakeDataCollector;
  v5 = [(HDFakeDataCollector *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E4F2AEB0]);
    state = v6->_state;
    v6->_state = v7;

    uint64_t v9 = HKCreateSerialDispatchQueue();
    generationQueue = v6->_generationQueue;
    v6->_generationQueue = (OS_dispatch_queue *)v9;
  }
  return v6;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDFakeDataCollector _lock_endFaking]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)HDFakeDataCollector;
  [(HDFakeDataCollector *)&v4 dealloc];
}

- (void)_lock_endFaking
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    v2 = *(NSObject **)(a1 + 48);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
  }
}

- (void)setConfiguration:(id)a3
{
  v11 = (HDFakeDataCollectorConfiguration *)a3;
  os_unfair_lock_lock(&self->_lock);
  configuration = self->_configuration;
  v6 = v11;
  if (configuration != v11)
  {
    if (!v11 || ![(HDFakeDataCollectorConfiguration *)configuration isEqual:v11])
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      double Current = CFAbsoluteTimeGetCurrent();
      -[HDFakeDataCollector _lock_setupGeneratorsForStartTime:]((uint64_t)self, Current);
    }
    v6 = self->_configuration;
  }
  if (v6)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    if (!self->_generationSource)
    {
      v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_generationQueue);
      generationSource = self->_generationSource;
      self->_generationSource = v8;

      dispatch_source_set_timer((dispatch_source_t)self->_generationSource, 0, 0x98968000uLL, 0x98968000uLL);
      objc_initWeak(&location, self);
      v10 = self->_generationSource;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __40__HDFakeDataCollector__lock_beginFaking__block_invoke;
      handler[3] = &unk_1E62F6BD0;
      objc_copyWeak(&v13, &location);
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume((dispatch_object_t)self->_generationSource);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[HDFakeDataCollector _lock_endFaking]((uint64_t)self);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_setupGeneratorsForStartTime:(uint64_t)a1
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_super v4 = (const os_unfair_lock *)(a1 + 16);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v5;

    v7 = (void *)[*(id *)(a1 + 72) activityType];
    v8 = [_HDFakeDataGenerator alloc];
    uint64_t v9 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __57__HDFakeDataCollector__lock_setupGeneratorsForStartTime___block_invoke;
    v122[3] = &__block_descriptor_40_e56____HDCollectedSensorDatum__32__0__HKQuantityType_8d16d24l;
    v122[4] = v7;
    id v10 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v8, v9, v122, 5.0, a2);
    -[HDFakeDataCollector _lock_addGenerator:](a1, v10);

    os_unfair_lock_assert_owner(v4);
    v11 = [_HDFakeDataGenerator alloc];
    objc_super v12 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v124 = 3221225472;
    v125 = __68__HDFakeDataCollector__lock_setupCalorieGeneratorsForActivity_time___block_invoke;
    v126 = &__block_descriptor_40_e56____HDCollectedSensorDatum__32__0__HKQuantityType_8d16d24l;
    v127 = v7;
    id v13 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v11, v12, &aBlock, 2.56, a2);
    -[HDFakeDataCollector _lock_addGenerator:](a1, v13);

    v14 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A600]];
    v152 = @"HKFakedData";
    v160 = (__CFString *)MEMORY[0x1E4F1CC38];
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v152 count:1];
    uint64_t v173 = MEMORY[0x1E4F143A8];
    uint64_t v174 = 3221225472;
    v175 = __68__HDFakeDataCollector__lock_setupCalorieGeneratorsForActivity_time___block_invoke_2;
    v176 = &unk_1E63011F0;
    id v177 = v14;
    id v16 = v14;
    -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v16, v15, &v173, 2.56, a2);

    unint64_t v17 = (unint64_t)v7 - 1;
    switch((unint64_t)v7)
    {
      case 1uLL:
      case 2uLL:
      case 4uLL:
        os_unfair_lock_assert_owner(v4);
        v18 = [*(id *)(a1 + 72) speed];
        v19 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        [v18 doubleValueForUnit:v19];
        double v21 = v20;

        double v22 = 1.0;
        if (v17 <= 3) {
          double v22 = dbl_1BD32C498[v17];
        }
        v23 = [*(id *)(a1 + 72) speed];
        v24 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        [v23 doubleValueForUnit:v24];
        uint64_t v26 = v25;

        v172[0] = 0;
        v172[1] = v172;
        v172[2] = 0x2020000000;
        v172[3] = 0;
        v170[0] = 0;
        v170[1] = v170;
        v170[2] = 0x2020000000;
        int v171 = 0;
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v124 = 3221225472;
        v125 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke;
        v126 = &unk_1E6301218;
        v127 = v172;
        v128 = v170;
        v27 = _Block_copy(&aBlock);
        v168[0] = MEMORY[0x1E4F143A8];
        v168[1] = 3221225472;
        v168[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_2;
        v168[3] = &unk_1E6301240;
        id v28 = v27;
        id v169 = v28;
        v29 = _Block_copy(v168);
        v166[0] = MEMORY[0x1E4F143A8];
        v166[1] = 3221225472;
        v166[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_3;
        v166[3] = &unk_1E6301268;
        id v30 = v28;
        id v167 = v30;
        v31 = _Block_copy(v166);
        v32 = [_HDFakeDataGenerator alloc];
        v33 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E0]];
        double v34 = v21 * 2.56;
        uint64_t v173 = MEMORY[0x1E4F143A8];
        uint64_t v174 = 3221225472;
        v175 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_4;
        v176 = &unk_1E6301290;
        id v35 = v31;
        id v177 = v35;
        double v178 = v34;
        id v36 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v32, v33, &v173, 2.56, a2);
        -[HDFakeDataCollector _lock_addGenerator:](a1, v36);

        v37 = [_HDFakeDataGenerator alloc];
        v38 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F0]];
        v160 = (__CFString *)MEMORY[0x1E4F143A8];
        uint64_t v161 = 3221225472;
        v162 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_5;
        v163 = &unk_1E6301290;
        id v39 = v29;
        id v164 = v39;
        double v165 = v34 / v22;
        id v40 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v37, v38, &v160, 2.56, a2);
        -[HDFakeDataCollector _lock_addGenerator:](a1, v40);

        if (v7 == (void *)2)
        {
          v41 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8B8]];
          v158 = @"HKFakedData";
          uint64_t v159 = MEMORY[0x1E4F1CC38];
          v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v159 forKeys:&v158 count:1];
          v152 = (__CFString *)MEMORY[0x1E4F143A8];
          uint64_t v153 = 3221225472;
          v154 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_6;
          v155 = &unk_1E63012B8;
          id v43 = v41;
          id v156 = v43;
          uint64_t v157 = 0x4069000000000000;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v43, v42, &v152, 2.56, a2);

          v44 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8C0]];

          v150 = @"HKFakedData";
          uint64_t v151 = MEMORY[0x1E4F1CC38];
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];
          v144 = (__CFString *)MEMORY[0x1E4F143A8];
          uint64_t v145 = 3221225472;
          v146 = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_7;
          v147 = &unk_1E63012B8;
          id v46 = v44;
          id v148 = v46;
          uint64_t v149 = v26;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v46, v45, &v144, 2.56, a2);

          v47 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8C8]];

          v142 = @"HKFakedData";
          uint64_t v143 = MEMORY[0x1E4F1CC38];
          v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
          v139[0] = MEMORY[0x1E4F143A8];
          v139[1] = 3221225472;
          v139[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_8;
          v139[3] = &unk_1E63012B8;
          id v49 = v47;
          id v140 = v49;
          uint64_t v141 = 0x4052800000000000;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v49, v48, v139, 2.56, a2);

          v50 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8B0]];

          v137 = @"HKFakedData";
          uint64_t v138 = MEMORY[0x1E4F1CC38];
          v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
          v134[0] = MEMORY[0x1E4F143A8];
          v134[1] = 3221225472;
          v134[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_9;
          v134[3] = &unk_1E63012B8;
          id v52 = v50;
          id v135 = v52;
          uint64_t v136 = 0x4069000000000000;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v52, v51, v134, 2.56, a2);

          v53 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8D0]];

          v132 = @"HKFakedData";
          uint64_t v133 = MEMORY[0x1E4F1CC38];
          v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
          v129[0] = MEMORY[0x1E4F143A8];
          v129[1] = 3221225472;
          v129[2] = __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_10;
          v129[3] = &unk_1E63012B8;
          id v55 = v53;
          id v130 = v55;
          uint64_t v131 = 0x3FBC28F5C28F5C29;
          -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v55, v54, v129, 2.56, a2);
        }
        _Block_object_dispose(v170, 8);
        _Block_object_dispose(v172, 8);
        break;
      case 3uLL:
        v56 = [*(id *)(a1 + 72) speed];
        v57 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        [v56 doubleValueForUnit:v57];
        v59 = v58;

        v60 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B0]];
        v139[0] = @"HKFakedData";
        v144 = (__CFString *)MEMORY[0x1E4F1CC38];
        v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:v139 count:1];
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v124 = 3221225472;
        v125 = __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke;
        v126 = &unk_1E63012B8;
        v127 = v60;
        v128 = v59;
        v62 = v60;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v62, v61, &aBlock, 2.56, a2);

        v63 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A668]];

        v129[0] = @"HKFakedData";
        v134[0] = MEMORY[0x1E4F1CC38];
        v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v129 count:1];
        uint64_t v173 = MEMORY[0x1E4F143A8];
        uint64_t v174 = 3221225472;
        v175 = __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_2;
        v176 = &unk_1E63012B8;
        id v177 = v63;
        double v178 = *(double *)&v59;
        id v65 = v63;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v65, v64, &v173, 2.56, a2);

        v66 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A660]];

        v166[0] = @"HKFakedData";
        v168[0] = MEMORY[0x1E4F1CC38];
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v166 count:1];
        v160 = (__CFString *)MEMORY[0x1E4F143A8];
        uint64_t v161 = 3221225472;
        v162 = __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_3;
        v163 = &unk_1E63012B8;
        id v164 = v66;
        double v165 = 200.0;
        id v68 = v66;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v68, v67, &v160, 2.56, a2);

        v69 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A650]];

        v170[0] = @"HKFakedData";
        v172[0] = MEMORY[0x1E4F1CC38];
        v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v172 forKeys:v170 count:1];
        v152 = (__CFString *)MEMORY[0x1E4F143A8];
        uint64_t v153 = 3221225472;
        v154 = __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_4;
        v155 = &unk_1E63012B8;
        id v156 = v69;
        uint64_t v157 = 0x4054000000000000;
        id v71 = v69;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v71, v70, &v152, 2.56, a2);

        break;
      case 6uLL:
        v72 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D8]];
        v134[0] = @"HKFakedData";
        v139[0] = MEMORY[0x1E4F1CC38];
        v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v134 count:1];
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v124 = 3221225472;
        v125 = __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke;
        v126 = &unk_1E63011F0;
        v127 = v72;
        v74 = v72;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v74, v73, &aBlock, 5.0, a2);

        v75 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F8]];

        uint64_t v76 = *MEMORY[0x1E4F2A1E8];
        v144 = @"HKFakedData";
        uint64_t v145 = v76;
        v152 = (__CFString *)MEMORY[0x1E4F1CC38];
        uint64_t v153 = (uint64_t)&unk_1F17ED308;
        v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v144 count:2];
        uint64_t v173 = MEMORY[0x1E4F143A8];
        uint64_t v174 = 3221225472;
        v175 = __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke_310;
        v176 = &unk_1E63011F0;
        id v177 = v75;
        id v78 = v75;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v78, v77, &v173, 5.0, a2);

        v79 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A948]];

        v168[0] = @"HKFakedData";
        v129[0] = MEMORY[0x1E4F1CC38];
        v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v129 forKeys:v168 count:1];
        v160 = (__CFString *)MEMORY[0x1E4F143A8];
        uint64_t v161 = 3221225472;
        v162 = __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke_2;
        v163 = &unk_1E63011F0;
        id v164 = v79;
        id v81 = v79;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v81, v80, &v160, 60.0, a2);

        break;
      case 8uLL:
        v82 = [*(id *)(a1 + 72) speed];
        v83 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        [v82 doubleValueForUnit:v83];
        v85 = v84;

        v86 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C0]];
        v152 = @"HKFakedData";
        v160 = (__CFString *)MEMORY[0x1E4F1CC38];
        v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v152 count:1];
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v124 = 3221225472;
        v125 = __63__HDFakeDataCollector__lock_setupPaddleSportsGeneratorsAtTime___block_invoke;
        v126 = &unk_1E63012B8;
        v127 = v86;
        v128 = v85;
        v88 = v86;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v88, v87, &aBlock, 3.0, a2);

        v89 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A870]];

        v139[0] = @"HKFakedData";
        v144 = (__CFString *)MEMORY[0x1E4F1CC38];
        v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:v139 count:1];
        uint64_t v173 = MEMORY[0x1E4F143A8];
        uint64_t v174 = 3221225472;
        v175 = __63__HDFakeDataCollector__lock_setupPaddleSportsGeneratorsAtTime___block_invoke_2;
        v176 = &unk_1E63012B8;
        id v177 = v89;
        double v178 = *(double *)&v85;
        id v91 = v89;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v91, v90, &v173, 3.0, a2);

        break;
      case 9uLL:
        v92 = [*(id *)(a1 + 72) speed];
        v93 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        [v92 doubleValueForUnit:v93];
        v95 = v94;

        v96 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D0]];
        v160 = @"HKFakedData";
        uint64_t v173 = MEMORY[0x1E4F1CC38];
        v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v160 count:1];
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v124 = 3221225472;
        v125 = __64__HDFakeDataCollector__lock_setupSkatingSportsGeneratorsAtTime___block_invoke;
        v126 = &unk_1E63012B8;
        v127 = v96;
        v128 = v95;
        v98 = v96;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v98, v97, &aBlock, 3.0, a2);

        break;
      case 0xAuLL:
        v99 = [*(id *)(a1 + 72) speed];
        v100 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        [v99 doubleValueForUnit:v100];
        v102 = v101;

        v103 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C8]];
        v152 = @"HKFakedData";
        v160 = (__CFString *)MEMORY[0x1E4F1CC38];
        v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v152 count:1];
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v124 = 3221225472;
        v125 = __57__HDFakeDataCollector__lock_setupRowingGeneratorsAtTime___block_invoke;
        v126 = &unk_1E63012B8;
        v127 = v103;
        v128 = v102;
        v105 = v103;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v105, v104, &aBlock, 3.0, a2);

        v106 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8A8]];

        v139[0] = @"HKFakedData";
        v144 = (__CFString *)MEMORY[0x1E4F1CC38];
        v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:v139 count:1];
        uint64_t v173 = MEMORY[0x1E4F143A8];
        uint64_t v174 = 3221225472;
        v175 = __57__HDFakeDataCollector__lock_setupRowingGeneratorsAtTime___block_invoke_2;
        v176 = &unk_1E63012B8;
        id v177 = v106;
        double v178 = *(double *)&v102;
        id v108 = v106;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v108, v107, &v173, 3.0, a2);

        break;
      case 0xBuLL:
        v109 = [*(id *)(a1 + 72) speed];
        v110 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        [v109 doubleValueForUnit:v110];
        v112 = v111;

        v113 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7A8]];
        v152 = @"HKFakedData";
        v160 = (__CFString *)MEMORY[0x1E4F1CC38];
        v114 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v152 count:1];
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v124 = 3221225472;
        v125 = __69__HDFakeDataCollector__lock_setupCrossCountrySkiingGeneratorsAtTime___block_invoke;
        v126 = &unk_1E63012B8;
        v127 = v113;
        v128 = v112;
        v115 = v113;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v115, v114, &aBlock, 3.0, a2);

        v116 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A648]];

        v139[0] = @"HKFakedData";
        v144 = (__CFString *)MEMORY[0x1E4F1CC38];
        v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:v139 count:1];
        uint64_t v173 = MEMORY[0x1E4F143A8];
        uint64_t v174 = 3221225472;
        v175 = __69__HDFakeDataCollector__lock_setupCrossCountrySkiingGeneratorsAtTime___block_invoke_2;
        v176 = &unk_1E63012B8;
        id v177 = v116;
        double v178 = *(double *)&v112;
        id v118 = v116;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v118, v117, &v173, 3.0, a2);

        break;
      case 0xCuLL:
        v119 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B8]];
        v160 = @"HKFakedData";
        uint64_t v173 = MEMORY[0x1E4F1CC38];
        v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v160 count:1];
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v124 = 3221225472;
        v125 = __65__HDFakeDataCollector__lock_setupDownhillSkiingGeneratorsAtTime___block_invoke;
        v126 = &unk_1E63011F0;
        v127 = v119;
        v121 = v119;
        -[HDFakeDataCollector _lock_setupFakeGeneratorForQuantityType:interval:time:metadata:quantity:](a1, v121, v120, &aBlock, 5.0, a2);

        break;
      default:
        return;
    }
  }
}

- (int64_t)datumCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t datumCount = self->_datumCount;
  os_unfair_lock_unlock(p_lock);
  return datumCount;
}

void __40__HDFakeDataCollector__lock_beginFaking__block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  double Current = CFAbsoluteTimeGetCurrent();
  if (WeakRetained)
  {
    double v2 = Current;
    os_unfair_lock_lock(WeakRetained + 4);
    -[HDFakeDataCollector _lock_generateThrough:]((uint64_t)WeakRetained, v2);
    os_unfair_lock_unlock(WeakRetained + 4);
  }
}

- (void)generateForConfiguration:(id)a3 from:(id)a4 to:(id)a5
{
  v8 = (HDFakeDataCollectorConfiguration *)a3;
  id v9 = a5;
  id v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[HDFakeDataCollector _lock_endFaking]((uint64_t)self);
  configuration = self->_configuration;
  self->_configuration = v8;
  objc_super v12 = v8;

  [v10 timeIntervalSinceReferenceDate];
  double v14 = v13;

  -[HDFakeDataCollector _lock_setupGeneratorsForStartTime:]((uint64_t)self, v14);
  [v9 timeIntervalSinceReferenceDate];
  double v16 = v15;

  -[HDFakeDataCollector _lock_generateThrough:]((uint64_t)self, v16);
  unint64_t v17 = self->_configuration;
  self->_configuration = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_generateThrough:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    while (1)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v4 = *(id *)(a1 + 56);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (!v5) {
        break;
      }
      uint64_t v6 = v5;
      char v7 = 0;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v11 = [*(id *)(a1 + 56) objectForKeyedSubscript:v10];
          objc_super v12 = (double *)v11;
          if (v11 && *(double *)(v11 + 32) <= a2)
          {
            double v13 = (*(void (**)(double))(*(void *)(v11 + 40) + 16))(*(double *)(v11 + 8));
            double v15 = v12[3];
            double v14 = v12[4];
            v12[1] = v14;
            v12[4] = v14 + v15;

            if (v13)
            {
              double v16 = [*(id *)(a1 + 24) aggregatorForType:v10];
              v23 = v13;
              char v7 = 1;
              unint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
              v18 = [MEMORY[0x1E4F2AEF8] localDevice];
              [v16 dataCollector:a1 didCollectSensorData:v17 device:v18];

              ++*(void *)(a1 + 64);
            }
          }
          else
          {

            double v13 = 0;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);

      if ((v7 & 1) == 0) {
        return;
      }
    }
  }
}

- (void)_lock_addGenerator:(uint64_t)a1
{
  v3 = (const os_unfair_lock *)(a1 + 16);
  uint64_t v5 = a2;
  os_unfair_lock_assert_owner(v3);
  if (v5) {
    uint64_t v4 = v5[2];
  }
  else {
    uint64_t v4 = 0;
  }
  [*(id *)(a1 + 56) setObject:v5 forKeyedSubscript:v4];
}

HDHeartRateSensorDatum *__57__HDFakeDataCollector__lock_setupGeneratorsForStartTime___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  char v7 = [HDHeartRateSensorDatum alloc];
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithStart:end:", a4, a4);
  uint64_t v10 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v11 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
  double v13 = [v10 quantityWithUnit:v11 doubleValue:(double)(int)(arc4random_uniform(dword_1BD32C4B8[*(void *)(a1 + 32)]) + dword_1BD32C4EC[v12])];
  unint64_t v17 = @"HKFakedData";
  v18[0] = MEMORY[0x1E4F1CC38];
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  double v15 = [(HDQuantityDatum *)v7 initWithIdentifier:v8 dateInterval:v9 quantity:v13 metadata:v14 resumeContextProvider:0];

  return v15;
}

HDQuantityDatum *__68__HDFakeDataCollector__lock_setupCalorieGeneratorsForActivity_time___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [HDQuantityDatum alloc];
  id v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithStart:end:", a3, a4);
  uint64_t v11 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v12 = [v7 canonicalUnit];

  unint64_t v13 = *(void *)(a1 + 32);
  double v14 = 0.0;
  if (v13 <= 0xC)
  {
    if (((1 << v13) & 0x1FC5) != 0)
    {
      double v15 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 * 0.344 + -0.172;
      double v16 = 0.172;
LABEL_4:
      double v14 = v15 + v16;
      goto LABEL_5;
    }
    if (v13 == 1)
    {
      double v15 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 * 0.006 + -0.003;
      double v16 = 0.033;
      goto LABEL_4;
    }
    if (v13 == 3)
    {
      double v15 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 * 0.266 + -0.133;
      double v16 = 0.133;
      goto LABEL_4;
    }
  }
LABEL_5:
  unint64_t v17 = [v11 quantityWithUnit:v12 doubleValue:(a4 - a3) * v14];
  long long v21 = @"HKFakedData";
  v22[0] = MEMORY[0x1E4F1CC38];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  long long v19 = [(HDQuantityDatum *)v8 initWithIdentifier:v9 dateInterval:v10 quantity:v17 metadata:v18 resumeContextProvider:0];

  return v19;
}

id __68__HDFakeDataCollector__lock_setupCalorieGeneratorsForActivity_time___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F2B370];
  double v2 = [*(id *)(a1 + 32) canonicalUnit];
  v3 = [v1 quantityWithUnit:v2 doubleValue:(double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 * 0.0 + 0.033];

  return v3;
}

- (void)_lock_setupFakeGeneratorForQuantityType:(void *)a3 interval:(void *)a4 time:(double)a5 metadata:(double)a6 quantity:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a2;
  double v14 = [_HDFakeDataGenerator alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __95__HDFakeDataCollector__lock_setupFakeGeneratorForQuantityType_interval_time_metadata_quantity___block_invoke;
  v18[3] = &unk_1E63012E0;
  id v15 = v12;
  id v20 = v15;
  id v16 = v11;
  id v19 = v16;
  id v17 = -[_HDFakeDataGenerator initWithType:interval:startTime:generator:](v14, v13, v18, a5, a6);

  -[HDFakeDataCollector _lock_addGenerator:](a1, v17);
}

uint64_t __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(double *)(v3 + 24) != a2)
  {
    *(double *)(v3 + 24) = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = arc4random_uniform(0xFFFFFFFF);
  }
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_2(uint64_t a1, int a2, int a3)
{
  return a2 - a3 + (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() % ((2 * a3) | 1u);
}

double __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_3(uint64_t a1, double a2, double a3, double a4)
{
  return a3 - (a4 - (a4 + a4) * ((double)(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() / 4294967300.0));
}

HDQuantityDatum *__70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_4(uint64_t a1, void *a2, double a3, double a4)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [HDQuantityDatum alloc];
  id v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithStart:end:", a3, a4);
  id v11 = (void *)MEMORY[0x1E4F2B370];
  id v12 = [v7 canonicalUnit];

  (*(void (**)(double, double, double))(*(void *)(a1 + 32) + 16))(a4, *(double *)(a1 + 40), *(double *)(a1 + 40) * 0.1);
  id v13 = objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12);
  id v17 = @"HKFakedData";
  v18[0] = MEMORY[0x1E4F1CC38];
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v15 = [(HDQuantityDatum *)v8 initWithIdentifier:v9 dateInterval:v10 quantity:v13 metadata:v14 resumeContextProvider:0];

  return v15;
}

HDQuantityDatum *__70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_5(uint64_t a1, void *a2, double a3, double a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [HDQuantityDatum alloc];
  id v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithStart:end:", a3, a4);
  id v11 = (void *)MEMORY[0x1E4F2B370];
  id v12 = [v7 canonicalUnit];

  int v13 = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a4);
  double v14 = [v11 quantityWithUnit:v12 doubleValue:(double)(v13 & ~(v13 >> 31))];
  v18 = @"HKFakedData";
  v19[0] = MEMORY[0x1E4F1CC38];
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v16 = [(HDQuantityDatum *)v8 initWithIdentifier:v9 dateInterval:v10 quantity:v14 metadata:v15 resumeContextProvider:0];

  return v16;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_6(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.25- (*(double *)(a1 + 40) * 0.25 + *(double *)(a1 + 40) * 0.25)* ((double)arc4random_uniform(0xFFFFFFFF)/ 4294967300.0))];

  return v4;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_7(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_8(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.25- (*(double *)(a1 + 40) * 0.25 + *(double *)(a1 + 40) * 0.25)* ((double)arc4random_uniform(0xFFFFFFFF)/ 4294967300.0))];

  return v4;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_9(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.25- (*(double *)(a1 + 40) * 0.25 + *(double *)(a1 + 40) * 0.25)* ((double)arc4random_uniform(0xFFFFFFFF)/ 4294967300.0))];

  return v4;
}

id __70__HDFakeDataCollector__lock_setupPedometerGeneratorsForActivity_time___block_invoke_10(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F2B370];
  double v2 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v3 = [v1 quantityWithUnit:v2 doubleValue:(double)(int)(arc4random_uniform(3u) + 4)];

  return v3;
}

id __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke_310(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F2B370];
  double v2 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v3 = [v1 quantityWithUnit:v2 doubleValue:(double)(int)(arc4random_uniform(7u) + 9)];

  return v3;
}

id __59__HDFakeDataCollector__lock_setupSwimmingGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F2B370];
  double v2 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v3 = [v1 quantityWithUnit:v2 doubleValue:(double)(int)(arc4random_uniform(1u) + 26)];

  return v3;
}

id __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_3(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.2- (*(double *)(a1 + 40) * 0.2 + *(double *)(a1 + 40) * 0.2) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __58__HDFakeDataCollector__lock_setupCyclingGeneratorsAtTime___block_invoke_4(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.25- (*(double *)(a1 + 40) * 0.25 + *(double *)(a1 + 40) * 0.25)* ((double)arc4random_uniform(0xFFFFFFFF)/ 4294967300.0))];

  return v4;
}

id __69__HDFakeDataCollector__lock_setupCrossCountrySkiingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __69__HDFakeDataCollector__lock_setupCrossCountrySkiingGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __63__HDFakeDataCollector__lock_setupPaddleSportsGeneratorsAtTime___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __63__HDFakeDataCollector__lock_setupPaddleSportsGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __57__HDFakeDataCollector__lock_setupRowingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __57__HDFakeDataCollector__lock_setupRowingGeneratorsAtTime___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __64__HDFakeDataCollector__lock_setupSkatingSportsGeneratorsAtTime___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v3 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)- (*(double *)(a1 + 40) * 0.1- (*(double *)(a1 + 40) * 0.1 + *(double *)(a1 + 40) * 0.1) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0))];

  return v4;
}

id __65__HDFakeDataCollector__lock_setupDownhillSkiingGeneratorsAtTime___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F2B370];
  double v2 = [*(id *)(a1 + 32) canonicalUnit];
  uint64_t v3 = [v1 quantityWithUnit:v2 doubleValue:(double)(int)(arc4random_uniform(3u) + 4)];

  return v3;
}

+ (id)collectedTypes
{
  v31[25] = *MEMORY[0x1E4F143B8];
  id v22 = (id)MEMORY[0x1E4F1CAD0];
  id v30 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F0]];
  v31[0] = v30;
  v29 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E0]];
  v31[1] = v29;
  id v28 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B0]];
  v31[2] = v28;
  v27 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B8]];
  v31[3] = v27;
  uint64_t v26 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D8]];
  v31[4] = v26;
  uint64_t v25 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F8]];
  v31[5] = v25;
  v24 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  v31[6] = v24;
  long long v21 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
  v31[7] = v21;
  id v20 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A600]];
  v31[8] = v20;
  id v19 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8C0]];
  v31[9] = v19;
  v18 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8B8]];
  v31[10] = v18;
  id v17 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8C8]];
  v31[11] = v17;
  id v16 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8B0]];
  v31[12] = v16;
  id v15 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8D0]];
  v31[13] = v15;
  double v14 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A660]];
  v31[14] = v14;
  int v13 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A650]];
  v31[15] = v13;
  double v2 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A668]];
  v31[16] = v2;
  uint64_t v3 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7A8]];
  v31[17] = v3;
  uint64_t v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C0]];
  v31[18] = v4;
  uint64_t v5 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C8]];
  v31[19] = v5;
  id v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D0]];
  v31[20] = v6;
  id v7 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A948]];
  v31[21] = v7;
  uint64_t v8 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A648]];
  v31[22] = v8;
  id v9 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A870]];
  v31[23] = v9;
  uint64_t v10 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8A8]];
  v31[24] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:25];
  id v23 = [v22 setWithArray:v11];

  return v23;
}

HDQuantityDatum *__95__HDFakeDataCollector__lock_setupFakeGeneratorForQuantityType_interval_time_metadata_quantity___block_invoke(uint64_t a1, double a2, double a3)
{
  id v6 = [HDQuantityDatum alloc];
  id v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithStart:end:", a2, a3);
  id v9 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v10 = [(HDQuantityDatum *)v6 initWithIdentifier:v7 dateInterval:v8 quantity:v9 metadata:*(void *)(a1 + 32) resumeContextProvider:0];

  return v10;
}

- (id)sourceForDataAggregator:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F2B560], "_localDeviceSource", a3);
}

- (id)identifierForDataAggregator:(id)a3
{
  uint64_t v3 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v3);
}

- (void)registerWithAggregators
{
  uint64_t v3 = [HDDataCollectorMultiplexer alloc];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = +[HDFakeDataCollector collectedTypes];
  uint64_t v8 = [(HDDataCollectorMultiplexer *)v3 initForCollector:self identifier:v5 profile:WeakRetained types:v7];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  multiplexer = self->_multiplexer;
  self->_multiplexer = v8;
  id v12 = v8;

  id v11 = self->_state;
  os_unfair_lock_unlock(p_lock);
  [(HDDataCollectorMultiplexer *)v12 registerForCollectionWithState:v11];
}

- (void)unregisterFromAggregators
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(HDDataCollectorMultiplexer *)self->_multiplexer unregisterForCollection];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)canResumeCollectionFromLastSensorDatum
{
  return 0;
}

- (HDFakeDataCollectorConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_generatorsByType, 0);
  objc_storeStrong((id *)&self->_generationSource, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_multiplexer, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end