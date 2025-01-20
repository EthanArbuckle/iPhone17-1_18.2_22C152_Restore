@interface MLAppleImageFeatureExtractor
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLAppleImageFeatureExtractor)initWithParameters:(id)a3 modelDescription:(id)a4 featureExtractorType:(int)a5 configuration:(id)a6 error:(id *)a7;
- (MLAppleImageFeatureExtractorParameters)parameters;
- (id)computeScenePrintFeatures:(__CVBuffer *)a3 handle:(id)a4 useCPUOnly:(BOOL)a5 error:(id *)a6;
- (id)featureValueFromObjectPrint:(id)a3 key:(id)a4 shape:(id)a5;
- (id)featureValueFromScenePrint:(id)a3 elementSize:(unint64_t)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation MLAppleImageFeatureExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);

  objc_storeStrong((id *)&self->_inputFeatureName, 0);
}

- (MLAppleImageFeatureExtractorParameters)parameters
{
  return (MLAppleImageFeatureExtractorParameters *)objc_getProperty(self, a2, 112, 1);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v7 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v8 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v41, v8, 11, -[MLModel signpostID](self, "signpostID"), [v7 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v9 = [(MLModel *)self signpostID];
  uint64_t v10 = [v7 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__MLAppleImageFeatureExtractor_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  v35 = (void (**)(void))_Block_copy(aBlock);
  if (!v7)
  {
    id v7 = +[MLPredictionOptions defaultOptions];
  }
  v37 = +[_MLVNFrameworkHandle sharedHandle];
  v11 = [v38 featureValueForName:self->_inputFeatureName];
  uint64_t v12 = [(MLDictionaryFeatureProvider *)v11 imageBufferValue];

  if (!v12)
  {
    if (!a5) {
      goto LABEL_28;
    }
    id v14 = +[MLModelErrorUtils genericErrorWithFormat:@"Expected feature '%@' of type 'image' was not present in input", self->_inputFeatureName];
LABEL_27:
    v11 = 0;
    *a5 = v14;
    goto LABEL_36;
  }
  if ([v7 predictionUsesCPU])
  {
    BOOL v13 = 1;
  }
  else
  {
    v11 = +[MLInternalSettings globalSettings];
    if ([(MLDictionaryFeatureProvider *)v11 restrictNeuralNetworksToUseCPUOnly])
    {
      BOOL v13 = 1;
    }
    else
    {
      v15 = [(MLModel *)self configuration];
      BOOL v13 = [v15 computeUnits] == 0;
    }
  }
  int extractorType = self->_extractorType;
  switch(extractorType)
  {
    case 0:
      if (!a5) {
        break;
      }
      id v14 = +[MLModelErrorUtils genericErrorWithFormat:@"Feature extractor type not set"];
      goto LABEL_27;
    case 20:
      if ([v37 isValid])
      {
        v19 = [(MLAppleImageFeatureExtractor *)self computeScenePrintFeatures:v12 handle:v37 useCPUOnly:v13 error:a5];
        if (v19)
        {
          v20 = [MLDictionaryFeatureProvider alloc];
          v21 = [(NSArray *)self->_outputFeatureName objectAtIndexedSubscript:0];
          v42 = v21;
          v43[0] = v19;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
          v11 = [(MLDictionaryFeatureProvider *)v20 initWithDictionary:v22 error:a5];
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_36;
      }
      if (a5)
      {
        id v14 = +[MLModelErrorUtils genericErrorWithFormat:@"Vision framework for scene print not available on this OS version"];
        goto LABEL_27;
      }
      break;
    case 21:
      if ([v37 isValid])
      {
        v17 = [(MLAppleImageFeatureExtractorParameters *)self->_parameters featureExtractorParameters];
        id v39 = 0;
        v18 = objc_msgSend(v37, "detectionPrintsFromPixelBuffers:version:augmentationOptions:useCPUOnly:error:", v12, objc_msgSend(v17, "objectPrintVersion"), 0, v13, &v39);
        id v31 = v39;
        v32 = v18;
        if (v31)
        {
          v11 = 0;
        }
        else
        {
          v34 = [v18 firstObject];
          id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          for (unint64_t i = 0; i < [(NSArray *)self->_outputFeatureName count]; ++i)
          {
            v24 = [v17 expectedKeys];
            v25 = [v24 objectAtIndexedSubscript:i];
            v26 = [v17 expectedShapes];
            v27 = [v26 objectAtIndexedSubscript:i];
            v28 = [(MLAppleImageFeatureExtractor *)self featureValueFromObjectPrint:v34 key:v25 shape:v27];

            v29 = [(NSArray *)self->_outputFeatureName objectAtIndexedSubscript:i];
            [v33 setObject:v28 forKey:v29];
          }
          v11 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v33 error:a5];
        }
        goto LABEL_36;
      }
      if (a5)
      {
        id v14 = +[MLModelErrorUtils genericErrorWithFormat:@"Vision framework for object print not available on this OS version"];
        goto LABEL_27;
      }
      break;
    default:
      goto LABEL_36;
  }
LABEL_28:
  v11 = 0;
LABEL_36:

  v35[2](v35);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v41);

  return v11;
}

uint64_t __69__MLAppleImageFeatureExtractor_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)featureValueFromObjectPrint:(id)a3 key:(id)a4 shape:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 objectForKey:v8];
  v11 = v10;
  if (v10)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__17570;
    v21[4] = __Block_byref_object_dispose__17571;
    id v12 = v10;
    id v22 = v12;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__MLAppleImageFeatureExtractor_featureValueFromObjectPrint_key_shape___block_invoke;
    aBlock[3] = &unk_1E59A5200;
    aBlock[4] = v21;
    BOOL v13 = _Block_copy(aBlock);
    id v14 = [MLMultiArray alloc];
    uint64_t v15 = [v12 bytes];
    v16 = +[MLDataConversionUtils stridesForShape:v9];
    v17 = [(MLMultiArray *)v14 initWithDataPointer:v15 shape:v9 dataType:65568 strides:v16 deallocator:v13 error:0];

    v18 = +[MLFeatureValue featureValueWithMultiArray:v17];

    _Block_object_dispose(v21, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __70__MLAppleImageFeatureExtractor_featureValueFromObjectPrint_key_shape___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) bytes] == a2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (id)computeScenePrintFeatures:(__CVBuffer *)a3 handle:(id)a4 useCPUOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  v11 = [(MLAppleImageFeatureExtractorParameters *)self->_parameters featureExtractorParameters];
  id v17 = 0;
  id v12 = objc_msgSend(v10, "scenePrintsFromPixelBuffers:version:augmentationOptions:useCPUOnly:error:", a3, objc_msgSend(v11, "scenePrintVersion"), 0, v7, &v17);
  id v13 = v17;
  if (v13 || ![v12 count])
  {
    id v14 = 0;
    if (a6) {
      *a6 = v13;
    }
  }
  else
  {
    uint64_t v15 = [v12 objectAtIndexedSubscript:0];
    id v14 = -[MLAppleImageFeatureExtractor featureValueFromScenePrint:elementSize:](self, "featureValueFromScenePrint:elementSize:", v15, [v15 length]/ (unint64_t)objc_msgSend(v10, "elementCountForScenePrintRequestRevision:", objc_msgSend(v11, "scenePrintVersion")));
  }

  return v14;
}

- (id)featureValueFromScenePrint:(id)a3 elementSize:(unint64_t)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (a4 <= 4) {
    uint64_t v7 = 65568;
  }
  else {
    uint64_t v7 = 65600;
  }
  unint64_t v8 = [v5 length];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__17570;
  v26[4] = __Block_byref_object_dispose__17571;
  id v9 = v6;
  id v27 = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__MLAppleImageFeatureExtractor_featureValueFromScenePrint_elementSize___block_invoke;
  aBlock[3] = &unk_1E59A5200;
  aBlock[4] = v26;
  v24 = _Block_copy(aBlock);
  id v10 = [MLMultiArray alloc];
  id v11 = v9;
  uint64_t v12 = [v11 bytes];
  unint64_t v13 = v8 / a4;
  id v14 = [NSNumber numberWithUnsignedInteger:v13];
  v29[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v16 = [(MLMultiArray *)v10 initWithDataPointer:v12 shape:v15 dataType:v7 strides:&unk_1EF11A9A0 deallocator:v24 error:0];

  if (self->_outputDataType == v7)
  {
    id v17 = v16;
  }
  else
  {
    v18 = [MLMultiArray alloc];
    v19 = [NSNumber numberWithUnsignedInteger:v13];
    v28 = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    id v17 = [(MLMultiArray *)v18 initWithShape:v20 dataType:self->_outputDataType error:0];

    [(MLMultiArray *)v16 copyIntoMultiArray:v17 error:0];
  }
  v21 = +[MLFeatureValue featureValueWithMultiArray:v17];

  _Block_object_dispose(v26, 8);

  return v21;
}

void __71__MLAppleImageFeatureExtractor_featureValueFromScenePrint_elementSize___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) bytes] == a2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (MLAppleImageFeatureExtractor)initWithParameters:(id)a3 modelDescription:(id)a4 featureExtractorType:(int)a5 configuration:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (v13)
  {
    v31.receiver = self;
    v31.super_class = (Class)MLAppleImageFeatureExtractor;
    v16 = [(MLModel *)&v31 initWithDescription:v14 configuration:v15];
    id v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_parameters, a3);
      v18 = [v14 inputDescriptionsByName];
      v19 = [v18 allKeys];
      uint64_t v20 = [v19 objectAtIndexedSubscript:0];
      inputFeatureName = v17->_inputFeatureName;
      v17->_inputFeatureName = (NSString *)v20;

      id v22 = [v14 outputDescriptionsByName];
      uint64_t v23 = [v22 allKeys];
      outputFeatureName = v17->_outputFeatureName;
      v17->_outputFeatureName = (NSArray *)v23;

      v25 = [v14 outputDescriptionsByName];
      v26 = [v25 allValues];
      id v27 = [v26 objectAtIndexedSubscript:0];
      v28 = [v27 multiArrayConstraint];
      v17->_outputDataType = [v28 dataType];

      v17->_int extractorType = a5;
    }
    self = v17;
    v29 = self;
  }
  else if (a7)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"Invalid parameters for vision feature print"];
    v29 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 2002)
  {
    id v8 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 inputDescriptionsByName];
      if ([v10 count] == 1)
      {
        id v11 = [v9 inputDescriptionsByName];
        uint64_t v12 = [v11 allValues];
        id v13 = [v12 objectAtIndexedSubscript:0];
        uint64_t v14 = [v13 type];

        if (v14 == 4)
        {

          id v15 = +[_MLVNFrameworkHandle sharedHandle];
          v16 = v15;
          if (*(_DWORD *)(*(void *)a3 + 44) == 2002)
          {
            id v17 = *(uint64_t **)(*(void *)a3 + 32);
          }
          else
          {
            CoreML::Specification::CoreMLModels::protobuf_VisionFeaturePrint_2eproto::InitDefaults(v15);
            id v17 = &CoreML::Specification::CoreMLModels::_VisionFeaturePrint_default_instance_;
          }
          v21 = &unk_1EF0CF148;
          unint64_t v22 = 0;
          int v23 = 0;
          uint64_t v18 = v17[1];
          if (v18) {
            google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v22, v18 & 0xFFFFFFFFFFFFFFFELL);
          }
          int v24 = 0;
          int v19 = *((_DWORD *)v17 + 7);
          if (v19 == 20)
          {
            int v24 = 20;
            operator new();
          }
          if (v19 == 21)
          {
            int v24 = 21;
            operator new();
          }
          if (a5)
          {
            *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Feature extractor type not set"];
          }

          CoreML::Specification::CoreMLModels::VisionFeaturePrint::~VisionFeaturePrint((CoreML::Specification::CoreMLModels::VisionFeaturePrint *)&v21);
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {
      }
    }

    if (a5)
    {
      *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Must only have one input image feature"];
    }
    goto LABEL_24;
  }
  if (a5)
  {
    *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"Model type is not a vision feature print"];
  }
LABEL_25:

  return 0;
}

@end