@interface MLProgramTrainer
- (MLFeatureProvider)currentUpdatedWeights;
- (MLModeling)inferenceModel;
- (MLProgramContext)context;
- (MLProgramEvaluator)evaluator;
- (MLProgramInternal)program;
- (MLProgramTrainer)initWithProgram:(id)a3 learningRate:(double)a4 error:(id *)a5;
- (double)learningRate;
- (id)attachLearningRateToFeatures:(id)a3;
- (id)copyCurrentTrainingDelta;
- (id)evaluateUsingTestData:(id)a3 error:(id *)a4;
- (id)evaluateUsingTestData:(id)a3 evaluationMetricNames:(id)a4 error:(id *)a5;
- (id)evaluateUsingTestData:(id)a3 evaluationMetricNames:(id)a4 evaluateOnTrainFunction:(BOOL)a5 error:(id *)a6;
- (id)flattenFeatures:(id)a3 orderedFeatures:(id)a4;
- (id)orderedTrainableWeightsNames;
- (id)trainUsingTrainingData:(id)a3 error:(id *)a4;
- (id)trainUsingTrainingData:(id)a3 evaluationMetricNames:(id)a4 error:(id *)a5;
- (void)setContext:(id)a3;
- (void)setCurrentUpdatedWeights:(id)a3;
- (void)setEvaluator:(id)a3;
- (void)setLearningRate:(double)a3;
- (void)setProgram:(id)a3;
@end

@implementation MLProgramTrainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUpdatedWeights, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_program, 0);
}

- (void)setCurrentUpdatedWeights:(id)a3
{
}

- (MLFeatureProvider)currentUpdatedWeights
{
  return self->_currentUpdatedWeights;
}

- (void)setEvaluator:(id)a3
{
}

- (MLProgramEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setContext:(id)a3
{
}

- (MLProgramContext)context
{
  return self->_context;
}

- (void)setProgram:(id)a3
{
}

- (MLProgramInternal)program
{
  return self->_program;
}

- (void)setLearningRate:(double)a3
{
  self->_learningRate = a3;
}

- (double)learningRate
{
  return self->_learningRate;
}

- (id)copyCurrentTrainingDelta
{
  v3 = [(MLProgramTrainer *)self evaluator];
  v4 = (void *)[v3 newContextAndReturnError:0];

  if (v4)
  {
    v5 = [(MLProgramTrainer *)self orderedTrainableWeightsNames];
    v6 = [v4 executionState];
    v7 = [(MLProgramTrainer *)self flattenFeatures:v6 orderedFeatures:v5];

    v8 = [(MLProgramTrainer *)self currentUpdatedWeights];

    if (v8)
    {
      v9 = [(MLProgramTrainer *)self currentUpdatedWeights];
      v10 = [(MLProgramTrainer *)self flattenFeatures:v9 orderedFeatures:v5];

      id v11 = v7;
      v12 = (const float *)[v11 bytes];
      id v13 = v10;
      v14 = (const float *)[v13 bytes];
      id v15 = v13;
      vDSP_vsub(v12, 1, v14, 1, (float *)[v15 mutableBytes], 1, (unint64_t)objc_msgSend(v11, "length") >> 2);
      v16 = [MLProgramTrainingDelta alloc];
    }
    else
    {
      v19 = [MLProgramTrainingDelta alloc];
      objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v7, "length"));
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v19;
    }
    v18 = [(MLProgramTrainingDelta *)v16 initWithFlattenedModelUpdate:v15];
  }
  else
  {
    v17 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "The copyCurrentTrainingDelta failed to extract initial weights.", v21, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The copyCurrentTrainingDelta failed to extract initial weights."];
    v18 = 0;
  }

  return v18;
}

- (id)orderedTrainableWeightsNames
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v4 = [(MLProgramTrainer *)self context];
  v5 = [v4 functionNameToInputLayersNames];
  v6 = [NSString stringWithUTF8String:"forward"];
  v7 = [v5 objectForKeyedSubscript:v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(MLProgramTrainer *)self context];
  v9 = [v8 functionNameToOutputLayersNames];
  v10 = [NSString stringWithUTF8String:"init"];
  id v11 = [v9 objectForKeyedSubscript:v10];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([v7 containsObject:v16]) {
          [v3 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v3;
}

- (id)flattenFeatures:(id)a3 orderedFeatures:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v41;
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [v5 featureValueForName:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        uint64_t v13 = [v12 multiArrayValue];

        if ([v13 dataType] != 65568)
        {
          uint64_t v14 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            long long v18 = +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", [v13 dataType]);
            *(_DWORD *)buf = 138412290;
            v47 = v18;
            _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "The trainable weights should be Float32, but it is %@.", buf, 0xCu);
          }
          id v15 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v16 = +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", [v13 dataType]);
          [v15 raise:v10, @"The trainable weights should be Float32, but it is %@.", v16 format];
        }
        uint64_t v17 = [v13 count];
        v8 += [v13 numberOfBytesPerElement] * v17;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  long long v19 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v8];
  [v19 setLength:v8];
  id v33 = v19;
  uint64_t v20 = [v33 mutableBytes];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obja = obj;
  uint64_t v21 = [obja countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(obja);
        }
        v25 = [v5 featureValueForName:*(void *)(*((void *)&v36 + 1) + 8 * j)];
        v26 = [v25 multiArrayValue];

        v27 = [MLMultiArray alloc];
        v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v26, "count"));
        v44 = v28;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
        v30 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v27, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v20, v29, [v26 dataType], &unk_1EF11A928, 0, 0);

        [v26 vectorizeIntoMultiArray:v30 storageOrder:0 error:0];
        uint64_t v31 = [(MLMultiArray *)v30 count];
        v20 += [(MLMultiArray *)v30 numberOfBytesPerElement] * v31;
      }
      uint64_t v22 = [obja countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v22);
  }

  return v33;
}

- (MLModeling)inferenceModel
{
  v2 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19E58B000, v2, OS_LOG_TYPE_ERROR, ".inferenceModel property is not implemented yet. See rdar://81339842.", v4, 2u);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@".inferenceModel property is not implemented yet. See rdar://81339842."];
  return 0;
}

- (id)attachLearningRateToFeatures:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = objc_msgSend(v4, "featureNames", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v4 featureValueForName:v11];
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  uint64_t v13 = NSNumber;
  [(MLProgramTrainer *)self learningRate];
  uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  v24 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  uint64_t v16 = +[MLMultiArray doubleMultiArrayWithShape:&unk_1EF11A910 valueArray:v15 error:0];

  if (v16)
  {
    uint64_t v17 = +[MLFeatureValue featureValueWithMultiArray:v16];
    [v5 setObject:v17 forKeyedSubscript:@"learning_rate_0"];

    long long v18 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v5 error:0];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Failed to add lr to training data."];
    long long v18 = 0;
  }

  return v18;
}

- (id)evaluateUsingTestData:(id)a3 evaluationMetricNames:(id)a4 evaluateOnTrainFunction:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_alloc_init(MLProgramEvaluationResult);
  long long v36 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v13 = [NSString stringWithUTF8String:"forward"];
  BOOL v39 = v7;
  if (v7)
  {
    uint64_t v14 = [NSString stringWithUTF8String:"train"];

    uint64_t v13 = (void *)v14;
  }
  if ([v10 count] < 1)
  {
    id v24 = 0;
LABEL_17:
    if ([v11 count])
    {
      uint64_t v31 = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:v36];
      [(MLProgramEvaluationResult *)v12 setEvaluationMetrics:v31];
    }
    v32 = v12;
  }
  else
  {
    v34 = a6;
    v35 = v12;
    long long v40 = v13;
    long long v37 = v10;
    long long v38 = v11;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    while (1)
    {
      long long v18 = (void *)MEMORY[0x19F3C29E0]();
      long long v19 = [v10 featuresAtIndex:v15];
      if (v39)
      {
        uint64_t v20 = [(MLProgramTrainer *)self attachLearningRateToFeatures:v19];

        long long v19 = (void *)v20;
      }
      long long v21 = [(MLProgramTrainer *)self evaluator];
      long long v22 = [(MLProgramTrainer *)self context];
      id v41 = v16;
      long long v23 = [v21 evaluateFunction:v40 arguments:v19 context:v22 updateContext:0 error:&v41];
      id v24 = v41;

      if (!v23) {
        break;
      }
      uint64_t v17 = v23;
      id v10 = v37;
      if ([v38 count])
      {
        v25 = +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:v38 providedBy:v23];
        [v36 addObject:v25];
      }
      if (v15 == [v37 count] - 1)
      {
        uint64_t v26 = [(MLProgramTrainer *)self context];
        v27 = [v26 forwardFunctionLossName];
        v28 = [v23 featureValueForName:v27];
        v29 = [v28 multiArrayValue];

        if (v29)
        {
          v30 = [v29 objectAtIndexedSubscript:0];
          [v30 doubleValue];
          -[MLProgramEvaluationResult setLoss:](v35, "setLoss:");
        }
      }
      ++v15;
      uint64_t v16 = v24;
      if ([v37 count] <= v15)
      {

        id v11 = v38;
        uint64_t v12 = v35;
        uint64_t v13 = v40;
        goto LABEL_17;
      }
    }
    id v10 = v37;
    id v11 = v38;
    if (v34)
    {
      id v24 = v24;
      v32 = 0;
      id *v34 = v24;
    }
    else
    {
      v32 = 0;
    }
    uint64_t v12 = v35;
    uint64_t v13 = v40;
  }

  return v32;
}

- (id)evaluateUsingTestData:(id)a3 evaluationMetricNames:(id)a4 error:(id *)a5
{
  return [(MLProgramTrainer *)self evaluateUsingTestData:a3 evaluationMetricNames:a4 evaluateOnTrainFunction:0 error:a5];
}

- (id)evaluateUsingTestData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  uint64_t v8 = [v6 set];
  uint64_t v9 = [(MLProgramTrainer *)self evaluateUsingTestData:v7 evaluationMetricNames:v8 error:a4];

  return v9;
}

- (id)trainUsingTrainingData:(id)a3 evaluationMetricNames:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 count])
  {
    id v10 = [(MLProgramTrainer *)self evaluateUsingTestData:v8 evaluationMetricNames:v9 evaluateOnTrainFunction:1 error:a5];
    if (!v10)
    {
      id v11 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    id v10 = objc_alloc_init(MLProgramEvaluationResult);
  }
  v46 = v10;
  id v45 = v9;
  if ([v8 count] < 1)
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
LABEL_15:
    id v50 = v13;
    id v44 = v8;
    v25 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    uint64_t v26 = [(MLProgramTrainer *)self orderedTrainableWeightsNames];
    context = self;
    v27 = [(MLProgramTrainer *)self context];
    v28 = [v27 functionNameToStateMap];
    v29 = [NSString stringWithUTF8String:"train"];
    v30 = [v28 objectForKeyedSubscript:v29];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v31 = v26;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v52 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          long long v37 = [v30 objectForKeyedSubscript:v36];
          if (v37)
          {
            long long v38 = [v14 featureValueForName:v37];
            [v25 setObject:v38 forKeyedSubscript:v36];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v33);
    }

    BOOL v39 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v25 error:0];
    [(MLProgramTrainer *)context setCurrentUpdatedWeights:v39];

    long long v40 = v46;
    id v11 = v46;

    id v8 = v44;
    id v9 = v45;
  }
  else
  {
    long long v43 = a5;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    while (1)
    {
      v47 = v14;
      contexta = (void *)MEMORY[0x19F3C29E0]();
      uint64_t v15 = [v8 featuresAtIndex:v12];
      uint64_t v16 = [(MLProgramTrainer *)self attachLearningRateToFeatures:v15];
      uint64_t v17 = [(MLProgramTrainer *)self evaluator];
      long long v18 = [NSString stringWithUTF8String:"train"];
      long long v19 = [(MLProgramTrainer *)self context];
      id v55 = v13;
      uint64_t v14 = [v17 evaluateFunction:v18 arguments:v16 context:v19 error:&v55];
      id v50 = v55;

      if (!v14) {
        break;
      }
      if (v12 == [v8 count] - 1)
      {
        uint64_t v20 = [(MLProgramTrainer *)self context];
        long long v21 = [v20 trainFunctionLossName];
        long long v22 = [v14 featureValueForName:v21];
        long long v23 = [v22 multiArrayValue];

        if (v23)
        {
          id v24 = [v23 objectAtIndexedSubscript:0];
          [v24 doubleValue];
          -[MLProgramEvaluationResult setLoss:](v46, "setLoss:");
        }
      }
      ++v12;
      uint64_t v13 = v50;
      if ([v8 count] <= v12) {
        goto LABEL_15;
      }
    }
    id v9 = v45;
    if (v43)
    {
      id v41 = v50;
      id v11 = 0;
      *long long v43 = v41;
      long long v40 = v46;
      goto LABEL_26;
    }
    id v11 = 0;
    long long v40 = v46;
  }
  id v41 = v50;
LABEL_26:

LABEL_27:

  return v11;
}

- (id)trainUsingTrainingData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  id v8 = [v6 set];
  id v9 = [(MLProgramTrainer *)self trainUsingTrainingData:v7 evaluationMetricNames:v8 error:a4];

  return v9;
}

- (MLProgramTrainer)initWithProgram:(id)a3 learningRate:(double)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MLProgramTrainer;
  id v10 = [(MLProgramTrainer *)&v27 init];
  if (!v10) {
    goto LABEL_6;
  }
  if (([v9 conformsToProtocol:&unk_1EF12A780] & 1) == 0)
  {
    uint64_t v20 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "The program argument to MLProgramTrainer is not conforming to some internal requirements. Do not implement MLProgram protocol by yourself. Use the one returned by MLModel's .program property.", v26, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The program argument to MLProgramTrainer is not conforming to some internal requirements. Do not implement MLProgram protocol by yourself. Use the one returned by MLModel's .program property."];
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v10->_program, a3);
  v10->_learningRate = a4;
  id v11 = [[MLProgramEvaluator alloc] initWithProgram:v9 error:a5];
  evaluator = v10->_evaluator;
  v10->_evaluator = v11;

  uint64_t v13 = v10->_evaluator;
  if (!v13
    || (uint64_t v14 = [(MLProgramEvaluator *)v13 newContextAndReturnError:a5],
        context = v10->_context,
        v10->_context = (MLProgramContext *)v14,
        context,
        (uint64_t v16 = v10->_context) == 0))
  {
LABEL_10:
    a5 = 0;
    goto LABEL_11;
  }
  uint64_t v17 = [(MLProgramContext *)v16 functionNameToInputLayersNames];
  long long v18 = [NSString stringWithUTF8String:"train"];
  long long v19 = [v17 objectForKey:v18];

  if (v19)
  {
LABEL_6:
    a5 = v10;
    goto LABEL_11;
  }
  long long v22 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v26 = 0;
    _os_log_error_impl(&dword_19E58B000, v22, OS_LOG_TYPE_ERROR, "The program has no train function.", v26, 2u);
  }

  if (a5)
  {
    long long v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    id v24 = [NSString stringWithFormat:@"The program has no train function."];
    v29[0] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    *a5 = [v23 errorWithDomain:@"com.apple.CoreML" code:60 userInfo:v25];

    goto LABEL_10;
  }
LABEL_11:

  return (MLProgramTrainer *)a5;
}

@end