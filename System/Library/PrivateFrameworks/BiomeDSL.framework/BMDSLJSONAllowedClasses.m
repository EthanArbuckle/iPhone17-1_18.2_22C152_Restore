@interface BMDSLJSONAllowedClasses
+ (Class)classFromString:(id)a3;
@end

@implementation BMDSLJSONAllowedClasses

+ (Class)classFromString:(id)a3
{
  v37[28] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v36[0] = @"BMDSL";
  v37[0] = objc_opt_class();
  v36[1] = @"BMDSLArray";
  v37[1] = objc_opt_class();
  v36[2] = @"BMDSLCollect";
  v37[2] = objc_opt_class();
  v36[3] = @"BMDSLFilter";
  v37[3] = objc_opt_class();
  v36[4] = @"BMDSLInstanceTransform";
  v37[4] = objc_opt_class();
  v36[5] = @"BMDSLMap";
  v37[5] = objc_opt_class();
  v36[6] = @"BMDSLMerge";
  v37[6] = objc_opt_class();
  v36[7] = @"BMDSLOrderedMerge";
  v37[7] = objc_opt_class();
  v36[8] = @"BMDSLPersistentDerivatives";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v4 = (void *)getBMDSLPersistentDerivativesClass_softClass;
  uint64_t v35 = getBMDSLPersistentDerivativesClass_softClass;
  if (!getBMDSLPersistentDerivativesClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMDSLPersistentDerivativesClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMDSLPersistentDerivativesClass_block_invoke((uint64_t)&v27);
    v4 = (void *)v33[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v32, 8);
  v37[8] = v5;
  v36[9] = @"BMDSLState";
  v37[9] = objc_opt_class();
  v36[10] = @"BMDSLStreamPublisher";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v6 = (void *)getBMDSLStreamPublisherClass_softClass;
  uint64_t v35 = getBMDSLStreamPublisherClass_softClass;
  if (!getBMDSLStreamPublisherClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMDSLStreamPublisherClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMDSLStreamPublisherClass_block_invoke((uint64_t)&v27);
    v6 = (void *)v33[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v32, 8);
  v37[10] = v7;
  v36[11] = @"BMDSLTableMap";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v8 = (void *)getBMDSLTableMapClass_softClass;
  uint64_t v35 = getBMDSLTableMapClass_softClass;
  if (!getBMDSLTableMapClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMDSLTableMapClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMDSLTableMapClass_block_invoke((uint64_t)&v27);
    v8 = (void *)v33[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v32, 8);
  v37[11] = v9;
  v36[12] = @"BMDSLTableStream";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v10 = (void *)getBMDSLTableStreamClass_softClass;
  uint64_t v35 = getBMDSLTableStreamClass_softClass;
  if (!getBMDSLTableStreamClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMDSLTableStreamClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMDSLTableStreamClass_block_invoke((uint64_t)&v27);
    v10 = (void *)v33[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v32, 8);
  v37[12] = v11;
  v36[13] = @"BMDSLWindower";
  v37[13] = objc_opt_class();
  v36[14] = @"BMDSLAggregator";
  v37[14] = objc_opt_class();
  v36[15] = @"BMDSLTableAggregator";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v12 = (void *)getBMDSLTableAggregatorClass_softClass;
  uint64_t v35 = getBMDSLTableAggregatorClass_softClass;
  if (!getBMDSLTableAggregatorClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMDSLTableAggregatorClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMDSLTableAggregatorClass_block_invoke((uint64_t)&v27);
    v12 = (void *)v33[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v32, 8);
  v37[15] = v13;
  v36[16] = @"BMDSLArgumentTransform";
  v37[16] = objc_opt_class();
  v36[17] = @"BMDSLClassTransform";
  v37[17] = objc_opt_class();
  v36[18] = @"BMDSLKeyPathRowTransform";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v14 = (void *)getBMDSLKeyPathRowTransformClass_softClass;
  uint64_t v35 = getBMDSLKeyPathRowTransformClass_softClass;
  if (!getBMDSLKeyPathRowTransformClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMDSLKeyPathRowTransformClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMDSLKeyPathRowTransformClass_block_invoke((uint64_t)&v27);
    v14 = (void *)v33[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v32, 8);
  v37[18] = v15;
  v36[19] = @"BMDSLKeyPathSelector";
  v37[19] = objc_opt_class();
  v36[20] = @"BMDSLKeyPathTransform";
  v37[20] = objc_opt_class();
  v36[21] = @"BMDSLSubscriber";
  v37[21] = objc_opt_class();
  v36[22] = @"BMDSLTableUpsertSubscriber";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v16 = (void *)getBMDSLTableUpsertSubscriberClass_softClass;
  uint64_t v35 = getBMDSLTableUpsertSubscriberClass_softClass;
  if (!getBMDSLTableUpsertSubscriberClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMDSLTableUpsertSubscriberClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMDSLTableUpsertSubscriberClass_block_invoke((uint64_t)&v27);
    v16 = (void *)v33[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v32, 8);
  v37[22] = v17;
  v36[23] = @"BMDSLTableSQLQueryTransform";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v18 = (void *)getBMDSLTableSQLQueryTransformClass_softClass;
  uint64_t v35 = getBMDSLTableSQLQueryTransformClass_softClass;
  if (!getBMDSLTableSQLQueryTransformClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMDSLTableSQLQueryTransformClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMDSLTableSQLQueryTransformClass_block_invoke((uint64_t)&v27);
    v18 = (void *)v33[3];
  }
  id v19 = v18;
  _Block_object_dispose(&v32, 8);
  v37[23] = v19;
  v36[24] = @"BMDSLTableTransform";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v20 = (void *)getBMDSLTableTransformClass_softClass;
  uint64_t v35 = getBMDSLTableTransformClass_softClass;
  if (!getBMDSLTableTransformClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMDSLTableTransformClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMDSLTableTransformClass_block_invoke((uint64_t)&v27);
    v20 = (void *)v33[3];
  }
  id v21 = v20;
  _Block_object_dispose(&v32, 8);
  v37[24] = v21;
  v36[25] = @"BMDSLWindowAssigner";
  v37[25] = objc_opt_class();
  v36[26] = @"BMDSLTumblingWindowAssigner";
  v37[26] = objc_opt_class();
  v36[27] = @"BMTableSchema";
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v22 = (void *)getBMTableSchemaClass_softClass;
  uint64_t v35 = getBMTableSchemaClass_softClass;
  if (!getBMTableSchemaClass_softClass)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __getBMTableSchemaClass_block_invoke;
    v30 = &unk_1E60217D0;
    v31 = &v32;
    __getBMTableSchemaClass_block_invoke((uint64_t)&v27);
    v22 = (void *)v33[3];
  }
  id v23 = v22;
  _Block_object_dispose(&v32, 8);
  v37[27] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:28];
  v25 = [v24 objectForKeyedSubscript:v3];

  return (Class)v25;
}

@end