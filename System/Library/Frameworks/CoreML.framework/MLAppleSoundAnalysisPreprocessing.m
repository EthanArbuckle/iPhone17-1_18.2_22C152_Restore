@interface MLAppleSoundAnalysisPreprocessing
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLAppleSoundAnalysisPreprocessing)initWithDescription:(id)a3 configuration:(id)a4 error:(id *)p_isa;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation MLAppleSoundAnalysisPreprocessing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontendProcessingModel, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);

  objc_storeStrong((id *)&self->_inputFeatureName, 0);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v17, v10, 5, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v11 = [(MLModel *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__MLAppleSoundAnalysisPreprocessing_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(void))_Block_copy(aBlock);
  if (!v9)
  {
    id v9 = +[MLPredictionOptions defaultOptions];
  }
  v14 = [(MLCustomModel *)self->_frontendProcessingModel predictionFromFeatures:v8 options:v9 error:a5];
  v13[2](v13);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v17);

  return v14;
}

uint64_t __74__MLAppleSoundAnalysisPreprocessing_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLAppleSoundAnalysisPreprocessing)initWithDescription:(id)a3 configuration:(id)a4 error:(id *)p_isa
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([NSClassFromString(&cfstr_Snvggishfronte.isa) conformsToProtocol:&unk_1EF11E650])
  {
    v29.receiver = self;
    v29.super_class = (Class)MLAppleSoundAnalysisPreprocessing;
    v10 = [(MLModel *)&v29 initWithDescription:v8 configuration:v9];
    if (!v10)
    {
LABEL_5:
      self = v10;
      p_isa = (id *)&self->super.super.isa;
      goto LABEL_11;
    }
    unint64_t v11 = [v8 inputDescriptionsByName];
    uint64_t v12 = [v11 allKeys];
    uint64_t v13 = [v12 objectAtIndexedSubscript:0];
    inputFeatureName = v10->_inputFeatureName;
    v10->_inputFeatureName = (NSString *)v13;

    v15 = [v8 outputDescriptionsByName];
    v16 = [v15 allKeys];
    uint64_t v17 = [v16 objectAtIndexedSubscript:0];
    outputFeatureName = v10->_outputFeatureName;
    v10->_outputFeatureName = (NSString *)v17;

    v19 = (MLCustomModel *)objc_alloc(NSClassFromString(&cfstr_Snvggishfronte.isa));
    frontendProcessingModel = v10->_frontendProcessingModel;
    v10->_frontendProcessingModel = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    uint64_t v22 = [(MLCustomModel *)v10->_frontendProcessingModel initWithModelDescription:v8 parameterDictionary:v21 error:p_isa];
    v23 = v10->_frontendProcessingModel;
    v10->_frontendProcessingModel = (MLCustomModel *)v22;

    if (v10->_frontendProcessingModel)
    {

      goto LABEL_5;
    }
    if (p_isa)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31 = @"Sound analysis preprocessing failed to init";
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *p_isa = [v26 errorWithDomain:@"com.apple" code:0 userInfo:v27];
    }
    p_isa = 0;
    self = v10;
  }
  else if (p_isa)
  {
    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = @"Sound analysis preprocessing does not conform to custom model protocol";
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    *p_isa = [v24 errorWithDomain:@"com.apple" code:0 userInfo:v25];

    p_isa = 0;
  }
LABEL_11:

  return (MLAppleSoundAnalysisPreprocessing *)p_isa;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 2003)
  {
    id v8 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
    id v9 = +[_MLSNFrameworkHandle sharedHandle];
    if (v9)
    {
      v10 = NSClassFromString(&cfstr_Snvggishfronte.isa);
      if (v10)
      {
        if (*(_DWORD *)(*(void *)a3 + 44) == 2003)
        {
          unint64_t v11 = *(uint64_t **)(*(void *)a3 + 32);
        }
        else
        {
          CoreML::Specification::CoreMLModels::protobuf_SoundAnalysisPreprocessing_2eproto::InitDefaults(v10);
          unint64_t v11 = &CoreML::Specification::CoreMLModels::_SoundAnalysisPreprocessing_default_instance_;
        }
        v16 = &unk_1EF0CF310;
        unint64_t v17 = 0;
        int v18 = 0;
        uint64_t v14 = v11[1];
        if (v14) {
          google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v17, v14 & 0xFFFFFFFFFFFFFFFELL);
        }
        int v19 = 0;
        if (*((_DWORD *)v11 + 7) == 20)
        {
          int v19 = 20;
          operator new();
        }
        if (a5)
        {
          *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Preprocessing type not set"];
        }
        CoreML::Specification::CoreMLModels::SoundAnalysisPreprocessing::~SoundAnalysisPreprocessing((CoreML::Specification::CoreMLModels::SoundAnalysisPreprocessing *)&v16);
      }
      else if (a5)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        v21[0] = @"Sound analysis preprocessing not available on this version";
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        *a5 = [v12 errorWithDomain:@"com.apple" code:0 userInfo:v13];
      }
    }
    else if (a5)
    {
      *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Sound analysis framework not available on this OS version"];
    }
  }
  else if (a5)
  {
    *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"Model type is not a sound analysis preprocessing"];
  }

  return 0;
}

@end