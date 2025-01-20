@interface MLClassConfidenceThresholding
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLClassConfidenceThresholding)initWithDescription:(id)a3 configuration:(id)a4 precisionRecallCurves:(id)a5 error:(id *)a6;
- (MLFeatureProviderConformer)inputFeatureConformer;
- (MLParameterContainer)parameterContainer;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (void)setParameterContainer:(id)a3;
@end

@implementation MLClassConfidenceThresholding

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFeatureConformer, 0);

  objc_storeStrong((id *)&self->_parameterContainer, 0);
}

- (MLFeatureProviderConformer)inputFeatureConformer
{
  return self->_inputFeatureConformer;
}

- (void)setParameterContainer:(id)a3
{
}

- (MLParameterContainer)parameterContainer
{
  return self->_parameterContainer;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v39 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v8 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v42, v8, 40, -[MLModel signpostID](self, "signpostID"), [v39 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v9 = [(MLModel *)self signpostID];
  uint64_t v10 = [v39 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__MLClassConfidenceThresholding_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  v36 = (void (**)(void))_Block_copy(aBlock);
  v11 = [(MLClassConfidenceThresholding *)self inputFeatureConformer];
  v38 = [v11 conformFeatures:v7 error:a5];

  if (v38)
  {
    v12 = [(MLModel *)self modelDescription];
    v13 = [v12 inputFeatureNames];
    v35 = [v13 objectAtIndexedSubscript:0];

    v34 = [v38 featureValueForName:v35];
    v40 = [v34 multiArrayValue];
    uint64_t v14 = [v40 count];
    uint64_t v15 = [v40 dataType];
    if (v15 == 131104)
    {
      if (a5)
      {
        +[MLModelErrorUtils featureTypeErrorWithFormat:@"Data type of input MLMultiArray is Int32, expected a floating point type."];
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v17 = [(MLModel *)self modelDescription];
      v18 = [v17 outputFeatureNames];
      v33 = [v18 objectAtIndexedSubscript:0];

      v19 = [MLMultiArray alloc];
      v47[0] = &unk_1EF11A4A8;
      v20 = [NSNumber numberWithUnsignedLong:v14];
      v47[1] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
      v22 = [(MLMultiArray *)v19 initWithShape:v21 dataType:v15 error:a5];

      if (v14)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          v24 = [v40 objectAtIndexedSubscript:i];
          v46[0] = &unk_1EF11A4C0;
          v25 = [NSNumber numberWithUnsignedLong:i];
          v46[1] = v25;
          v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
          [(MLMultiArray *)v22 setObject:v24 forKeyedSubscript:v26];

          v45[0] = &unk_1EF11A4D8;
          v27 = [NSNumber numberWithUnsignedLong:i];
          v45[1] = v27;
          v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
          [(MLMultiArray *)v22 setObject:&unk_1EF119EB0 forKeyedSubscript:v28];
        }
      }
      v29 = [MLDictionaryFeatureProvider alloc];
      v43 = v33;
      v30 = +[MLFeatureValue featureValueWithMultiArray:v22];
      v44 = v30;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      v16 = [(MLDictionaryFeatureProvider *)v29 initWithDictionary:v31 error:a5];
    }
  }
  else
  {
    v16 = 0;
  }
  v36[2](v36);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v42);

  return v16;
}

uint64_t __70__MLClassConfidenceThresholding_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 hasGlobalScope]
    || ([(MLParameterContainer *)self->_parameterContainer currentParameterValues],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v6],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (a4)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Class Confidence Thresholding Model does not have a parameter for requested key %@.", v6 format];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (MLClassConfidenceThresholding)initWithDescription:(id)a3 configuration:(id)a4 precisionRecallCurves:(id)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MLClassConfidenceThresholding;
  v13 = [(MLModel *)&v28 initWithDescription:v10 configuration:v11];
  uint64_t v14 = +[MLParameterKey precisionRecallCurves];
  v29[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v16 = [v10 parameterDescriptionsByKey];
  uint64_t v17 = +[MLParameterContainer parameterContainerFor:v15 descriptions:v16];
  parameterContainer = v13->_parameterContainer;
  v13->_parameterContainer = (MLParameterContainer *)v17;

  v19 = v13->_parameterContainer;
  v20 = +[MLParameterKey precisionRecallCurves];
  LOBYTE(a6) = [(MLParameterContainer *)v19 setCurrentValue:v12 forKey:v20 error:a6];

  if (a6)
  {
    v21 = [MLFeatureProviderConformer alloc];
    v22 = [v10 inputDescriptionsByName];
    v23 = [v22 allValues];
    uint64_t v24 = [(MLFeatureProviderConformer *)v21 initWithFeatureDescriptions:v23 defaultValues:MEMORY[0x1E4F1CC08] usingRank5Mapping:0 optionalInputTypes:MEMORY[0x1E4F1CC08] passthroughStateFeatures:0];
    inputFeatureConformer = v13->_inputFeatureConformer;
    v13->_inputFeatureConformer = (MLFeatureProviderConformer *)v24;

    v26 = v13;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  id v10 = objc_alloc((Class)a1);
  id v11 = (CoreML::Specification::protobuf_ClassConfidenceThresholding_2eproto *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v12 = v11;
  id v32 = v8;
  v31 = a5;
  if (*(_DWORD *)(*(void *)a3 + 44) == 560)
  {
    v13 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_ClassConfidenceThresholding_2eproto::InitDefaults(v11);
    v13 = &CoreML::Specification::_ClassConfidenceThresholding_default_instance_;
  }
  uint64_t v14 = v13[4];
  if (v14) {
    uint64_t v15 = v14 + 8;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *((int *)v13 + 6);
  if (v16)
  {
    uint64_t v17 = 8 * v16;
    do
    {
      v18 = *(void **)v15;
      if (*(void *)(*(void *)v15 + 16)) {
        v19 = *(const CoreML::Specification::FloatVector **)(*(void *)v15 + 16);
      }
      else {
        v19 = (const CoreML::Specification::FloatVector *)&CoreML::Specification::_FloatVector_default_instance_;
      }
      v20 = NSArrayFromFloatVector(v19);
      if (v18[3]) {
        v21 = (const CoreML::Specification::FloatVector *)v18[3];
      }
      else {
        v21 = (const CoreML::Specification::FloatVector *)&CoreML::Specification::_FloatVector_default_instance_;
      }
      v22 = NSArrayFromFloatVector(v21);
      if (v18[4]) {
        v23 = (const CoreML::Specification::FloatVector *)v18[4];
      }
      else {
        v23 = (const CoreML::Specification::FloatVector *)&CoreML::Specification::_FloatVector_default_instance_;
      }
      uint64_t v24 = NSArrayFromFloatVector(v23);
      if (v18[5]) {
        v25 = (const CoreML::Specification::FloatVector *)v18[5];
      }
      else {
        v25 = (const CoreML::Specification::FloatVector *)&CoreML::Specification::_FloatVector_default_instance_;
      }
      v26 = NSArrayFromFloatVector(v25);
      v27 = [[MLPrecisionRecallCurve alloc] initWithPrecisionValues:v20 precisionConfidenceThresholds:v22 recallValues:v24 recallConfidenceThresholds:v26];
      [(CoreML::Specification::protobuf_ClassConfidenceThresholding_2eproto *)v12 addObject:v27];

      v15 += 8;
      v17 -= 8;
    }
    while (v17);
  }
  objc_super v28 = v32;
  v29 = objc_msgSend(v10, "initWithDescription:configuration:precisionRecallCurves:error:", v9, v32, v12, v31, v10, v31, v9, v32);

  return v29;
}

@end