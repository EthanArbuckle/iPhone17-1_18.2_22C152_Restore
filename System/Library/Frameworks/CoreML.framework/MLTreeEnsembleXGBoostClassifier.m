@interface MLTreeEnsembleXGBoostClassifier
- ($4C320686E39F107BF64A17E17E3DD7CB)xgBoostDataFormatFromBatchProvider:(SEL)a3 needLabels:(id)a4 error:(BOOL)a5;
- ($4C320686E39F107BF64A17E17E3DD7CB)xgBoostDataFormatFromFeatureProvider:(SEL)a3 error:(id)a4;
- (BOOL)initializeAndvalidateObjectiveAndNumClassesWithConfiguration:(id)a3 error:(id *)a4;
- (BOOL)initializeBoosterIfOneExists;
- (MLTreeEnsembleXGBoostClassifier)initWithDescription:(id)a3 configuration:(id)a4 indexToStringLabelArray:()vector<std:(std:(vector<long)long :(std:(id)a7 :(id *)a8 allocator<long long>> *)a6 allocator<std::string>> *)a5 :string indexToIntLabelArray:modelURL:error:;
- (NSArray)labelsForDataPoints;
- (NSString)objective;
- (NSURL)modelURL;
- (id)batchProviderFromXGboostResults:(const float *)a3 length:(unint64_t)a4 error:(id *)a5;
- (id)featureProviderArrayFromXGBoostResult:(const float *)a3 length:(unint64_t)a4 error:(id *)a5;
- (id)featureProviderFromXGboostResults:(const float *)a3 length:(unint64_t)a4 error:(id *)a5;
- (id)loadLabelsWithStringLabels:()vector<std:(std:(vector<long)long :(std::allocator<long long>> *)a4 allocator<std::string>> *)a3 :string intLabels:;
- (id)packageOutputWithPredictedLabel:(id)a3 classProbabilities:(id)a4;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 error:(id *)a4;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)numClasses;
- (void)booster;
- (void)dealloc;
- (void)populateXGBoostDataFormat:(void *)a3 trainingData:(id)a4 dataIndex:(int64_t)a5 inputName:(id)a6 needLabels:(BOOL)a7 error:(id *)a8;
- (void)setBooster:(void *)a3;
- (void)setLabelsForDataPoints:(id)a3;
- (void)setModelURL:(id)a3;
- (void)setNumClasses:(unint64_t)a3;
- (void)setObjective:(id)a3;
@end

@implementation MLTreeEnsembleXGBoostClassifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objective, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);

  objc_storeStrong((id *)&self->_labelsForDataPoints, 0);
}

- (void)setBooster:(void *)a3
{
  self->_booster = a3;
}

- (void)booster
{
  return self->_booster;
}

- (void)setNumClasses:(unint64_t)a3
{
  self->_numClasses = a3;
}

- (unint64_t)numClasses
{
  return self->_numClasses;
}

- (void)setObjective:(id)a3
{
}

- (NSString)objective
{
  return self->_objective;
}

- (void)setModelURL:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setLabelsForDataPoints:(id)a3
{
}

- (NSArray)labelsForDataPoints
{
  return self->_labelsForDataPoints;
}

- (void)dealloc
{
  if ([(MLTreeEnsembleXGBoostClassifier *)self booster]) {
    softLink_XGBoosterFree([(MLTreeEnsembleXGBoostClassifier *)self booster]);
  }
  v3.receiver = self;
  v3.super_class = (Class)MLTreeEnsembleXGBoostClassifier;
  [(MLTreeEnsembleXGBoostClassifier *)&v3 dealloc];
}

- (BOOL)initializeAndvalidateObjectiveAndNumClassesWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 parameters];
  v8 = +[MLParameterKey numClasses];
  v9 = [v7 objectForKeyedSubscript:v8];
  unsigned int v10 = [v9 unsignedIntValue];

  if (v10)
  {
    v11 = [v6 parameters];
    v12 = +[MLParameterKey objective];
    v13 = [v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      int v14 = [v13 isEqualToString:@"binary:logistic"];
      if (v10 == 1) {
        int v15 = 0;
      }
      else {
        int v15 = v14;
      }
      if (v15 != 1)
      {
        self->_numClasses = v10;
        objc_storeStrong((id *)&self->_objective, v13);
        BOOL v17 = 1;
        goto LABEL_16;
      }
      if (a4)
      {
        v16 = +[MLModelErrorUtils updateErrorWithFormat:@"Objective and number of classes does not match. numClasses for 'binary:logistic' must be defined as 1."];
LABEL_13:
        BOOL v17 = 0;
        *a4 = v16;
LABEL_16:

        goto LABEL_17;
      }
    }
    else if (a4)
    {
      v16 = +[MLModelErrorUtils updateErrorWithFormat:@"objective parameter must be provided."];
      goto LABEL_13;
    }
    BOOL v17 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    +[MLModelErrorUtils updateErrorWithFormat:@"numClasses parameter must be provided."];
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_17:

  return v17;
}

- (id)loadLabelsWithStringLabels:()vector<std:(std:(vector<long)long :(std::allocator<long long>> *)a4 allocator<std::string>> *)a3 :string intLabels:
{
  v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if ([(NSString *)self->_objective isEqualToString:@"binary:logistic"])
  {
    uint64_t v8 = 0;
    char v9 = 1;
    do
    {
      char v10 = v9;
      if (a3->__end_ == a3->__begin_)
      {
        v12 = [NSNumber numberWithLongLong:a4->__begin_[v8]];
        [v7 addObject:v12];
      }
      else
      {
        v11 = (char *)a3->__begin_ + 24 * v8;
        if (v11[23] < 0) {
          v11 = *(char **)v11;
        }
        v12 = [NSString stringWithUTF8String:v11];
        [v7 addObject:v12];
      }

      char v9 = 0;
      uint64_t v8 = 1;
    }
    while ((v10 & 1) != 0);
  }
  else if (self->_numClasses)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    do
    {
      if (a3->__end_ == a3->__begin_) {
        [NSNumber numberWithLongLong:a4->__begin_[v14]];
      }
      else {
      int v15 = objc_msgSend(NSString, "stringWithUTF8String:");
      }
      [v7 addObject:v15];

      ++v14;
      v13 += 24;
    }
    while (v14 < self->_numClasses);
  }

  return v7;
}

- (BOOL)initializeBoosterIfOneExists
{
  BOOL v17 = 0;
  objc_super v3 = [(NSURL *)self->_modelURL lastPathComponent];
  v4 = [v3 stringByReplacingOccurrencesOfString:@".mlmodelc" withString:@".xgboost"];

  v5 = [(NSURL *)self->_modelURL path];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (![v7 fileExistsAtPath:v6]) {
    goto LABEL_10;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v8 = getXGBoosterCreateSymbolLoc(void)::ptr;
  v26 = getXGBoosterCreateSymbolLoc(void)::ptr;
  if (!getXGBoosterCreateSymbolLoc(void)::ptr)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = ___ZL27getXGBoosterCreateSymbolLocv_block_invoke;
    v21 = &unk_1E59A51A0;
    v22 = &v23;
    char v9 = (void *)XGBoostFrameworkLibrary();
    v24[3] = (uint64_t)dlsym(v9, "XGBoosterCreate");
    getXGBoosterCreateSymbolLoc(void)::ptr = *(_UNKNOWN **)(v22[1] + 24);
    uint64_t v8 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (v8)
  {
    ((void (*)(void, void, void **))v8)(0, 0, &v17);
    char v10 = v17;
    uint64_t v11 = [v6 UTF8String];
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    v12 = (unsigned int (*)(void *, uint64_t))getXGBoosterLoadModelSymbolLoc(void)::ptr;
    v26 = getXGBoosterLoadModelSymbolLoc(void)::ptr;
    if (!getXGBoosterLoadModelSymbolLoc(void)::ptr)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = ___ZL30getXGBoosterLoadModelSymbolLocv_block_invoke;
      v21 = &unk_1E59A51A0;
      v22 = &v23;
      uint64_t v13 = (void *)XGBoostFrameworkLibrary();
      unint64_t v14 = dlsym(v13, "XGBoosterLoadModel");
      *(void *)(v22[1] + 24) = v14;
      getXGBoosterLoadModelSymbolLoc(void)::ptr = *(_UNKNOWN **)(v22[1] + 24);
      v12 = (unsigned int (*)(void *, uint64_t))v24[3];
    }
    _Block_object_dispose(&v23, 8);
    if (v12)
    {
      if (v12(v10, v11) == -1)
      {
        softLink_XGBoosterFree(v17);
        BOOL v15 = 0;
        goto LABEL_11;
      }
      self->_booster = v17;
LABEL_10:
      BOOL v15 = 1;
LABEL_11:

      return v15;
    }
    dlerror();
    BOOL result = abort_report_np();
  }
  else
  {
    dlerror();
    BOOL result = abort_report_np();
  }
  __break(1u);
  return result;
}

- (id)packageOutputWithPredictedLabel:(id)a3 classProbabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MLDictionaryFeatureProvider alloc];
  char v9 = [(MLDictionaryFeatureProvider *)v8 initWithFeatureValueDictionary:MEMORY[0x1E4F1CC08]];
  char v10 = +[MLClassifierResult resultWithClassProbability:v7 additionalFeatures:v9 classLabelOfMaxProbability:v6];

  uint64_t v11 = [(MLModel *)self modelDescription];
  v12 = [v11 predictedFeatureName];

  if (v12)
  {
    uint64_t v13 = [(MLModel *)self modelDescription];
    unint64_t v14 = [v13 outputDescriptionsByName];
    BOOL v15 = [(MLModel *)self modelDescription];
    v16 = [v15 predictedFeatureName];
    BOOL v17 = [v14 objectForKeyedSubscript:v16];
  }
  else
  {
    BOOL v17 = 0;
  }
  uint64_t v18 = [(MLModel *)self modelDescription];
  uint64_t v19 = [v18 predictedProbabilitiesName];

  if (v19)
  {
    v20 = [(MLModel *)self modelDescription];
    v21 = [v20 outputDescriptionsByName];
    v22 = [(MLModel *)self modelDescription];
    uint64_t v23 = [v22 predictedProbabilitiesName];
    v24 = [v21 objectForKeyedSubscript:v23];
  }
  else
  {
    v24 = 0;
  }
  uint64_t v25 = [v10 asFeatureDictionaryWithPredictedClassDescription:v17 classProbabilityDescription:v24];

  return v25;
}

- (id)featureProviderArrayFromXGBoostResult:(const float *)a3 length:(unint64_t)a4 error:(id *)a5
{
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  uint64_t v8 = [(MLTreeEnsembleXGBoostClassifier *)self labelsForDataPoints];
  v43 = +[MLProbabilityDictionary sharedKeySetForLabels:v8];

  if (!a4)
  {
LABEL_46:
    char v10 = v7;
    id v39 = v7;
    goto LABEL_51;
  }
  unint64_t v9 = 0;
  char v10 = v7;
  while (1)
  {
    uint64_t v11 = [(MLTreeEnsembleXGBoostClassifier *)self objective];
    int v12 = [v11 isEqualToString:@"binary:logistic"];

    if (v12)
    {
      float v13 = a3[v9];
      unint64_t v14 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(1uLL);
      v16 = v14;
      *unint64_t v14 = (float)(1.0 - v13);
      double v17 = v13;
      if (v15 < 2)
      {
        uint64_t v31 = 2;
        if ((unint64_t)((8 * v15) >> 2) > 2) {
          uint64_t v31 = (8 * v15) >> 2;
        }
        if ((unint64_t)(8 * v15) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v32 = v31;
        }
        if (v32) {
          unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v32);
        }
        uint64_t v33 = 0;
        *(double *)(v32 + 8) = v17;
        do
        {
          *(double *)(v32 + v33 * 8) = v16[v33];
          --v33;
        }
        while (v33 != -1);
        v34 = (double *)v32;
        operator delete(v16);
        v16 = v34;
        id v7 = v10;
      }
      else
      {
        v14[1] = v17;
      }
      goto LABEL_37;
    }
    uint64_t v18 = [(MLTreeEnsembleXGBoostClassifier *)self objective];
    int v19 = [v18 isEqualToString:@"multi:softprob"];

    if (!v19) {
      break;
    }
    v16 = 0;
    v20 = 0;
    unint64_t v21 = 0;
    for (unint64_t i = 0; i < [(MLTreeEnsembleXGBoostClassifier *)self numClasses]; ++i)
    {
      double v23 = a3[i + v9];
      if ((unint64_t)v20 >= v21)
      {
        uint64_t v25 = v20 - v16;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 61) {
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        }
        if ((uint64_t)(v21 - (void)v16) >> 2 > v26) {
          unint64_t v26 = (uint64_t)(v21 - (void)v16) >> 2;
        }
        if (v21 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v26;
        }
        if (v27) {
          unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v27);
        }
        else {
          uint64_t v28 = 0;
        }
        v29 = (double *)(v27 + 8 * v25);
        double *v29 = v23;
        v24 = v29 + 1;
        while (v20 != v16)
        {
          uint64_t v30 = *((void *)v20-- - 1);
          *((void *)v29-- - 1) = v30;
        }
        unint64_t v21 = v27 + 8 * v28;
        if (v16) {
          operator delete(v16);
        }
        v16 = v29;
      }
      else
      {
        double *v20 = v23;
        v24 = v20 + 1;
      }
      v20 = v24;
      id v7 = v10;
    }
LABEL_37:
    v35 = [[MLProbabilityDictionary alloc] initWithSharedKeySet:v43 probabilities:v16];
    v36 = [(MLProbabilityDictionary *)v35 classLabelOfMaxProbability];
    v37 = [(MLTreeEnsembleXGBoostClassifier *)self packageOutputWithPredictedLabel:v36 classProbabilities:v35];
    if (v37)
    {
      [v7 addObject:v37];
      int v38 = 0;
    }
    else
    {
      if (a5)
      {
        *a5 = +[MLModelErrorUtils updateErrorWithFormat:@"Data processing failed."];
      }
      int v38 = 1;
    }

    if (v16) {
      operator delete(v16);
    }
    if (v38) {
      goto LABEL_50;
    }
    unint64_t v9 = [(MLTreeEnsembleXGBoostClassifier *)self numClasses] + v9;
    id v7 = v10;
    if (v9 >= a4) {
      goto LABEL_46;
    }
  }
  if (a5)
  {
    +[MLModelErrorUtils updateErrorWithFormat:@"Current objective not supported. Supported objectives are multi:softprob and binary:logistic."];
    id v39 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  char v10 = v7;
LABEL_50:
  id v39 = 0;
LABEL_51:

  return v39;
}

- (id)featureProviderFromXGboostResults:(const float *)a3 length:(unint64_t)a4 error:(id *)a5
{
  id v10 = 0;
  id v6 = [(MLTreeEnsembleXGBoostClassifier *)self featureProviderArrayFromXGBoostResult:a3 length:a4 error:&v10];
  id v7 = v10;
  if (v6 && [v6 count])
  {
    uint64_t v8 = [v6 objectAtIndexedSubscript:0];
  }
  else if (a5)
  {
    +[MLModelErrorUtils errorWithCode:6 underlyingError:v7 format:@"Cannot create MLFeatureProvider."];
    uint64_t v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)batchProviderFromXGboostResults:(const float *)a3 length:(unint64_t)a4 error:(id *)a5
{
  id v10 = 0;
  id v6 = [(MLTreeEnsembleXGBoostClassifier *)self featureProviderArrayFromXGBoostResult:a3 length:a4 error:&v10];
  id v7 = v10;
  if (v6 && [v6 count])
  {
    uint64_t v8 = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:v6];
  }
  else if (a5)
  {
    +[MLModelErrorUtils errorWithCode:6 underlyingError:v7 format:@"Cannot create MLBatchProvider."];
    uint64_t v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)populateXGBoostDataFormat:(void *)a3 trainingData:(id)a4 dataIndex:(int64_t)a5 inputName:(id)a6 needLabels:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  v59[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a6;
  v56 = v13;
  uint64_t v15 = [v13 featuresAtIndex:a5];
  v16 = [v15 featureValueForName:v14];

  if (v16)
  {
    if ([v16 type] == 5)
    {
      double v17 = [v16 multiArrayValue];
      if (!v17)
      {
        if (!a8)
        {
LABEL_45:

          goto LABEL_46;
        }
        id v54 = 0;
        *a8 = +[MLModelErrorUtils updateErrorWithFormat:@"Missing MLMultiArrayValue for feature named %@", v14];
LABEL_44:
        double v17 = v54;
        goto LABEL_45;
      }
      v52 = self;
      id v54 = v17;
      uint64_t v18 = [v17 count];
      *((void *)a3 + 7) = v18;
      int v19 = [NSNumber numberWithUnsignedInteger:v18];
      v59[0] = v19;
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];

      v20 = [v54 shape];
      if ([v20 count] == 1)
      {
        unint64_t v21 = [v54 shape];
        v22 = [v21 objectAtIndex:0];
        BOOL v23 = [v22 unsignedIntegerValue] == v18;

        if (v23)
        {
          uint64_t v24 = *((void *)a3 + 1) - *(void *)a3;
          std::vector<float>::resize((char **)a3, v18 + (v24 >> 2));
          uint64_t v25 = *(void *)a3;
          unint64_t v26 = [MLMultiArray alloc];
          unint64_t v27 = [NSNumber numberWithUnsignedInteger:v18];
          v58 = v27;
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
          v50 = [(MLMultiArray *)v26 initWithDataPointer:v25 + 4 * (v24 >> 2) shape:v28 dataType:65568 strides:&unk_1EF11A9D0 deallocator:0 error:0];

          id v57 = 0;
          LOBYTE(v24) = [v54 copyIntoMultiArray:v50 error:&v57];
          id v29 = v57;
          if ((v24 & 1) == 0)
          {
            if (a8)
            {
              *a8 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v29 format:@"Failed to convert training data to the right format."];
            }
            goto LABEL_41;
          }
          if (!v9)
          {
LABEL_41:

LABEL_43:
            goto LABEL_44;
          }
          id v47 = v29;
          uint64_t v30 = [(MLModel *)v52 modelDescription];
          v48 = [v30 predictedFeatureName];

          uint64_t v31 = [v56 featuresAtIndex:a5];
          v49 = [v31 featureValueForName:v48];

          unint64_t v32 = v49;
          if (!v49)
          {
            if (a8)
            {
              id v41 = +[MLModelErrorUtils updateErrorWithFormat:@"Data provided in input is missing feature value for training input: %@", v48];
              goto LABEL_38;
            }
            goto LABEL_40;
          }
          if ([v49 type] == 3)
          {
            for (unint64_t i = 0; ; ++i)
            {
              v34 = [(MLTreeEnsembleXGBoostClassifier *)v52 labelsForDataPoints];
              BOOL v35 = i < [v34 count];

              if (!v35) {
                break;
              }
              v36 = [v49 stringValue];
              v37 = [(MLTreeEnsembleXGBoostClassifier *)v52 labelsForDataPoints];
              int v38 = [v37 objectAtIndexedSubscript:i];
              int v39 = [v36 isEqualToString:v38];

              if (v39) {
                goto LABEL_35;
              }
            }
          }
          else
          {
            if ([v49 type] != 1)
            {
              if (a8)
              {
                id v41 = +[MLModelErrorUtils updateErrorWithFormat:@"Label must be of type MLFeatureTypeString or MLFeatureTypeInt64"];
LABEL_38:
                *a8 = v41;
LABEL_39:
                unint64_t v32 = v49;
              }
LABEL_40:

              id v29 = v47;
              goto LABEL_41;
            }
            unint64_t i = 0;
            *(float *)(*((void *)a3 + 3) + 4 * a5) = (float)[v49 int64Value];
            while (1)
            {
              v42 = [(MLTreeEnsembleXGBoostClassifier *)v52 labelsForDataPoints];
              BOOL v43 = i < [v42 count];

              if (!v43) {
                break;
              }
              uint64_t v44 = [v49 int64Value];
              v45 = [(MLTreeEnsembleXGBoostClassifier *)v52 labelsForDataPoints];
              v46 = [v45 objectAtIndexedSubscript:i];
              LODWORD(v44) = v44 == [v46 intValue];

              if (v44)
              {
LABEL_35:
                *(float *)(*((void *)a3 + 3) + 4 * a5) = (float)i;
                goto LABEL_39;
              }
              ++i;
            }
          }
          unint64_t v32 = v49;
          if (a8)
          {
            id v41 = +[MLModelErrorUtils updateErrorWithFormat:@"Label %@ not found for data index: %ld.", v49, a5];
            goto LABEL_38;
          }
          goto LABEL_40;
        }
      }
      else
      {
      }
      if (a8)
      {
        v51 = [v54 shape];
        *a8 = +[MLModelErrorUtils updateErrorWithFormat:@"Shape of training data point %li MLMultiArray is %@, expected %@", a5, v51, v53];
      }
      goto LABEL_43;
    }
    if (a8)
    {
      id v40 = +[MLModelErrorUtils updateErrorWithFormat:@"Input data other than MLFeatureTypeMultiArray is not supported for training."];
      goto LABEL_18;
    }
  }
  else if (a8)
  {
    id v40 = +[MLModelErrorUtils updateErrorWithFormat:@"Received nil MLFeatureProvider for index %ld from training data MLBatchProvider for training input: %@", a5, v14];
LABEL_18:
    *a8 = v40;
  }
LABEL_46:
}

- ($4C320686E39F107BF64A17E17E3DD7CB)xgBoostDataFormatFromBatchProvider:(SEL)a3 needLabels:(id)a4 error:(BOOL)a5
{
  BOOL v7 = a5;
  id v10 = a4;
  *(_OWORD *)&retstr->var0.__begin_ = 0u;
  *(_OWORD *)&retstr->var0.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->var1.__end_ = 0u;
  retstr->var2 = [v10 count];
  std::vector<float>::resize((char **)&retstr->var1, [v10 count]);
  uint64_t v11 = [(MLModel *)self modelDescription];
  int v12 = [v11 inputDescriptionsByName];
  id v13 = [v12 allKeys];
  id v14 = [v13 objectAtIndexedSubscript:0];

  if (v14)
  {
    for (uint64_t i = 0; i < [v10 count]; ++i)
    {
      v16 = (void *)MEMORY[0x19F3C29E0]();
      id v19 = 0;
      [(MLTreeEnsembleXGBoostClassifier *)self populateXGBoostDataFormat:retstr trainingData:v10 dataIndex:i inputName:v14 needLabels:v7 error:&v19];
      id v17 = v19;
      if (a6) {
        *a6 = v17;
      }
    }
  }
  else if (a6)
  {
    *a6 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Missing input name for Tree Ensemble Classifier."];
  }

  return result;
}

- ($4C320686E39F107BF64A17E17E3DD7CB)xgBoostDataFormatFromFeatureProvider:(SEL)a3 error:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v33 = a4;
  uint64_t v8 = [(MLModel *)self modelDescription];
  BOOL v9 = [v8 inputDescriptionsByName];

  *(_OWORD *)&retstr->var0.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->var1.__end_ = 0u;
  *(_OWORD *)&retstr->var0.__begin_ = 0u;
  retstr->var2 = 1;
  id v10 = [v9 allKeys];
  uint64_t v11 = [v10 objectAtIndexedSubscript:0];
  int v12 = [v33 featureValueForName:v11];

  if ([v12 type] == 5)
  {
    id v13 = [v12 multiArrayValue];
    id v14 = v13;
    if (!v13)
    {
      if (a5)
      {
        id v29 = [v9 allKeys];
        uint64_t v30 = [v29 objectAtIndexedSubscript:0];
        *a5 = +[MLModelErrorUtils updateErrorWithFormat:@"Missing MLMultiArrayValue for feature named %@", v30];
      }
      goto LABEL_20;
    }
    unint64_t v15 = [v13 count];
    retstr->var3 = v15;
    v16 = [NSNumber numberWithUnsignedInteger:v15];
    v35[0] = v16;
    unint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];

    id v17 = [v14 shape];
    if ([v17 count] == 1)
    {
      uint64_t v18 = [v14 shape];
      id v19 = [v18 objectAtIndex:0];
      BOOL v20 = [v19 unsignedIntegerValue] == v15;

      if (v20)
      {
        std::vector<float>::resize((char **)retstr, v15);
        begin = retstr->var0.__begin_;
        v22 = [MLMultiArray alloc];
        BOOL v23 = [NSNumber numberWithUnsignedInteger:v15];
        v34 = v23;
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        uint64_t v25 = [(MLMultiArray *)v22 initWithDataPointer:begin shape:v24 dataType:65568 strides:&unk_1EF11A9B8 deallocator:0 error:0];

        char v26 = [v14 copyIntoMultiArray:v25 error:a5];
        if (a5) {
          char v27 = v26;
        }
        else {
          char v27 = 1;
        }
        if (v27) {
          goto LABEL_18;
        }
        uint64_t v28 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to convert training data to the right format"];
LABEL_17:
        *a5 = v28;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    if (!a5)
    {
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    uint64_t v25 = [v14 shape];
    uint64_t v28 = +[MLModelErrorUtils updateErrorWithFormat:@"Shape of training data point %i MLMultiArray is %@, expected %@", 0, v25, v32];
    goto LABEL_17;
  }
  if (a5)
  {
    *a5 = +[MLModelErrorUtils updateErrorWithFormat:@"Input data other than MLFeatureTypeMultiArray is not supported for training."];
  }
LABEL_21:

  return result;
}

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[MLPredictionOptions defaultOptions];
  uint64_t v8 = [(MLTreeEnsembleXGBoostClassifier *)self predictionsFromBatch:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  unint64_t v10 = [(MLModel *)self signpostID];
  uint64_t v11 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__MLTreeEnsembleXGBoostClassifier_predictionsFromBatch_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  int v12 = (void (**)(void))_Block_copy(aBlock);
  if (![(MLTreeEnsembleXGBoostClassifier *)self booster])
  {
    if (a5)
    {
      +[MLModelErrorUtils updateErrorWithFormat:@"Prediction failed since the tree was not trained with any data point."];
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_19;
  }
  id v26 = 0;
  [(MLTreeEnsembleXGBoostClassifier *)self xgBoostDataFormatFromBatchProvider:v8 needLabels:0 error:&v26];
  id v13 = v26;
  if (!v13)
  {
    uint64_t v25 = 0;
    softLink_XGDMatrixCreateFromMat(v27, v31, v32, v14, &v25);
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    id v17 = [(MLTreeEnsembleXGBoostClassifier *)self booster];
    int v21 = softLink_XGBoosterPredict(v17, v25, (uint64_t)&v24, (uint64_t)&v23, v18, v19, v20);
    softLink_XGDMatrixFree(v25);
    if (v21 != -1)
    {
      v16 = [(MLTreeEnsembleXGBoostClassifier *)self batchProviderFromXGboostResults:v23 length:v24 error:a5];
      goto LABEL_14;
    }
    if (a5)
    {
      unint64_t v15 = +[MLModelErrorUtils updateErrorWithFormat:@"Prediction failed."];
      goto LABEL_5;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  if (!a5) {
    goto LABEL_13;
  }
  unint64_t v15 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v13 format:@"Prediction failed since data could not be transformed properly."];
LABEL_5:
  v16 = 0;
  *a5 = v15;
LABEL_14:
  if (__p)
  {
    uint64_t v30 = __p;
    operator delete(__p);
  }
  if (v27)
  {
    uint64_t v28 = v27;
    operator delete(v27);
  }

LABEL_19:
  v12[2](v12);

  return v16;
}

uint64_t __70__MLTreeEnsembleXGBoostClassifier_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[MLPredictionOptions defaultOptions];
  id v8 = [(MLTreeEnsembleXGBoostClassifier *)self predictionFromFeatures:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v35, v10, 29, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v11 = [(MLModel *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MLTreeEnsembleXGBoostClassifier_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  id v13 = (void (**)(void))_Block_copy(aBlock);
  if (![(MLTreeEnsembleXGBoostClassifier *)self booster])
  {
    if (a5)
    {
      +[MLModelErrorUtils updateErrorWithFormat:@"Prediction failed since the tree was not trained with any data point."];
      id v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = 0;
    }
    goto LABEL_19;
  }
  id v27 = 0;
  [(MLTreeEnsembleXGBoostClassifier *)self xgBoostDataFormatFromFeatureProvider:v8 error:&v27];
  id v14 = v27;
  if (!v14)
  {
    id v26 = 0;
    softLink_XGDMatrixCreateFromMat(v28, v32, v33, v15, &v26);
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    int v18 = [(MLTreeEnsembleXGBoostClassifier *)self booster];
    int v22 = softLink_XGBoosterPredict(v18, v26, (uint64_t)&v25, (uint64_t)&v24, v19, v20, v21);
    softLink_XGDMatrixFree(v26);
    if (v22 != -1)
    {
      id v17 = [(MLTreeEnsembleXGBoostClassifier *)self featureProviderFromXGboostResults:v24 length:v25 error:a5];
      goto LABEL_14;
    }
    if (a5)
    {
      v16 = +[MLModelErrorUtils updateErrorWithFormat:@"Prediction failed."];
      goto LABEL_5;
    }
LABEL_13:
    id v17 = 0;
    goto LABEL_14;
  }
  if (!a5) {
    goto LABEL_13;
  }
  v16 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v14 format:@"Prediction failed since data could not be transformed properly."];
LABEL_5:
  id v17 = 0;
  *a5 = v16;
LABEL_14:
  if (__p)
  {
    uint64_t v31 = __p;
    operator delete(__p);
  }
  if (v28)
  {
    id v29 = v28;
    operator delete(v28);
  }

LABEL_19:
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v35);

  return v17;
}

uint64_t __72__MLTreeEnsembleXGBoostClassifier_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLTreeEnsembleXGBoostClassifier)initWithDescription:(id)a3 configuration:(id)a4 indexToStringLabelArray:()vector<std:(std:(vector<long)long :(std:(id)a7 :(id *)a8 allocator<long long>> *)a6 allocator<std::string>> *)a5 :string indexToIntLabelArray:modelURL:error:
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)MLTreeEnsembleXGBoostClassifier;
  id v17 = [(MLModel *)&v32 initWithDescription:v14 configuration:v15];
  int v18 = v17;
  if (v17)
  {
    id v31 = 0;
    BOOL v19 = [(MLTreeEnsembleXGBoostClassifier *)v17 initializeAndvalidateObjectiveAndNumClassesWithConfiguration:v15 error:&v31];
    id v20 = v31;
    if (v19)
    {
      memset(&v30, 0, sizeof(v30));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v30, (long long *)a5->__begin_, (long long *)a5->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a5->__end_ - (char *)a5->__begin_) >> 3));
      __p = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, a6->__begin_, (uint64_t)a6->__end_, a6->__end_ - a6->__begin_);
      uint64_t v21 = [(MLTreeEnsembleXGBoostClassifier *)v18 loadLabelsWithStringLabels:&v30 intLabels:&__p];
      labelsForDataPoints = v18->_labelsForDataPoints;
      v18->_labelsForDataPoints = (NSArray *)v21;

      if (__p)
      {
        uint64_t v28 = __p;
        operator delete(__p);
      }
      uint64_t v33 = &v30;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
      uint64_t v23 = v18->_labelsForDataPoints;
      if (v23 && [(NSArray *)v23 count])
      {
        objc_storeStrong((id *)&v18->_modelURL, a7);
        if ([(MLTreeEnsembleXGBoostClassifier *)v18 initializeBoosterIfOneExists])
        {
          uint64_t v24 = v18;
LABEL_20:

          goto LABEL_21;
        }
        if (a8)
        {
          uint64_t v25 = +[MLModelErrorUtils updateErrorWithFormat:@"Cannot load the trained model."];
          goto LABEL_18;
        }
LABEL_19:
        uint64_t v24 = 0;
        goto LABEL_20;
      }
      if (!a8) {
        goto LABEL_19;
      }
      uint64_t v25 = +[MLModelErrorUtils updateErrorWithFormat:@"Error in initalizing labels."];
    }
    else
    {
      if (!a8) {
        goto LABEL_19;
      }
      uint64_t v25 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v20 format:@"Invalid objective and/or numClasses."];
    }
LABEL_18:
    uint64_t v24 = 0;
    *a8 = v25;
    goto LABEL_20;
  }
  if (a8)
  {
    +[MLModelErrorUtils updateErrorWithFormat:@"Error in initalizing the classifier."];
    uint64_t v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v24 = 0;
  }
LABEL_21:

  return v24;
}

@end