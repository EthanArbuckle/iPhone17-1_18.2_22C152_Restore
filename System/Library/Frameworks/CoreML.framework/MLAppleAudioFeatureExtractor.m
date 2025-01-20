@interface MLAppleAudioFeatureExtractor
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLAppleAudioFeatureExtractor)initWithParameters:(id)a3 modelDescription:(id)a4 configuration:(id)a5 error:(id *)a6;
- (MLAppleAudioFeatureExtractorParameters)parameters;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation MLAppleAudioFeatureExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_featureEmbeddingModel, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);

  objc_storeStrong((id *)&self->_inputFeatureName, 0);
}

- (MLAppleAudioFeatureExtractorParameters)parameters
{
  return (MLAppleAudioFeatureExtractorParameters *)objc_getProperty(self, a2, 104, 1);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v17, v10, 6, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v11 = [(MLModel *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__MLAppleAudioFeatureExtractor_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(void))_Block_copy(aBlock);
  if (!v9)
  {
    id v9 = +[MLPredictionOptions defaultOptions];
  }
  v14 = [(MLCustomModel *)self->_featureEmbeddingModel predictionFromFeatures:v8 options:v9 error:a5];
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v17);

  return v14;
}

uint64_t __69__MLAppleAudioFeatureExtractor_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLAppleAudioFeatureExtractor)initWithParameters:(id)a3 modelDescription:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v30 = @"parameters == nil.";
    v31 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_13;
  }
  if (([NSClassFromString(&cfstr_Snsoundprintaf.isa) conformsToProtocol:&unk_1EF11E650] & 1) == 0)
  {
    v30 = @"Not conforming custom model protocol.";
    v31 = (void *)MEMORY[0x1E4F1C3B8];
LABEL_13:
    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*v31 reason:v30 userInfo:0];
    objc_exception_throw(v32);
  }
  v33.receiver = self;
  v33.super_class = (Class)MLAppleAudioFeatureExtractor;
  v14 = [(MLModel *)&v33 initWithDescription:v12 configuration:v13];
  if (!v14)
  {
LABEL_6:
    v28 = v14;
    goto LABEL_10;
  }
  v15 = [v12 inputDescriptionsByName];
  v16 = [v15 allKeys];
  uint64_t v17 = [v16 objectAtIndexedSubscript:0];
  inputFeatureName = v14->_inputFeatureName;
  v14->_inputFeatureName = (NSString *)v17;

  v19 = [v12 outputDescriptionsByName];
  v20 = [v19 allKeys];
  uint64_t v21 = [v20 objectAtIndexedSubscript:0];
  outputFeatureName = v14->_outputFeatureName;
  v14->_outputFeatureName = (NSString *)v21;

  objc_storeStrong((id *)&v14->_parameters, a3);
  v23 = (MLCustomModel *)objc_alloc(NSClassFromString(&cfstr_Snsoundprintaf.isa));
  featureEmbeddingModel = v14->_featureEmbeddingModel;
  v14->_featureEmbeddingModel = v23;

  id v25 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  uint64_t v26 = [(MLCustomModel *)v14->_featureEmbeddingModel initWithModelDescription:v12 parameterDictionary:v25 error:a6];
  v27 = v14->_featureEmbeddingModel;
  v14->_featureEmbeddingModel = (MLCustomModel *)v26;

  if (v14->_featureEmbeddingModel)
  {

    goto LABEL_6;
  }
  if (a6)
  {
    *a6 = +[MLModelErrorUtils IOErrorWithFormat:@"Audio feature extractor failed to init"];
  }

  v28 = 0;
LABEL_10:

  return v28;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 2006)
  {
    if (*(void *)(*(void *)a3 + 16)) {
      id v8 = *(const CoreML::Specification::ModelDescription **)(*(void *)a3 + 16);
    }
    else {
      id v8 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
    }
    _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)v19, v8);
    id v9 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
    v10 = +[_MLSNFrameworkHandle sharedHandle];
    if (v10)
    {
      id v11 = NSClassFromString(&cfstr_Snsoundprintaf.isa);
      if (v11)
      {
        if (*(_DWORD *)(*(void *)a3 + 44) == 2006)
        {
          id v12 = *(uint64_t **)(*(void *)a3 + 32);
        }
        else
        {
          CoreML::Specification::CoreMLModels::protobuf_AudioFeaturePrint_2eproto::InitDefaults(v11);
          id v12 = &CoreML::Specification::CoreMLModels::_AudioFeaturePrint_default_instance_;
        }
        v15 = &unk_1EF0CF0B0;
        unint64_t v16 = 0;
        int v17 = 0;
        uint64_t v13 = v12[1];
        if (v13) {
          google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v16, v13 & 0xFFFFFFFFFFFFFFFELL);
        }
        int v18 = 0;
        if (*((_DWORD *)v12 + 7) == 20)
        {
          int v18 = 20;
          operator new();
        }
        if (a5)
        {
          *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Audio feature print type not set"];
        }

        CoreML::Specification::CoreMLModels::AudioFeaturePrint::~AudioFeaturePrint((CoreML::Specification::CoreMLModels::AudioFeaturePrint *)&v15);
        goto LABEL_25;
      }
      if (a5) {
        goto LABEL_15;
      }
    }
    else if (a5)
    {
LABEL_15:
      *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Audio feature print not available on this OS version"];
    }
LABEL_25:

    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    goto LABEL_27;
  }
  if (a5)
  {
    *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"Model type is not an audio feature print"];
  }
LABEL_27:

  return 0;
}

@end