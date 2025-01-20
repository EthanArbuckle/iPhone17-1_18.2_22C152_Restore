@interface MLIdentity
+ (id)loadModelFromSpecification:(_MLModelSpecification *)a3 configuration:(id)a4 error:(id *)a5;
- (MLIdentity)init;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation MLIdentity

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v9 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v16, v9, 20, -[MLModel signpostID](self, "signpostID"), [v8 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v10 = [(MLModel *)self signpostID];
  uint64_t v11 = [v8 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__MLIdentity_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(void))_Block_copy(aBlock);
  id v13 = v7;
  v12[2](v12);

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v16);

  return v13;
}

uint64_t __51__MLIdentity_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLIdentity)init
{
  v3 = objc_alloc_init(MLModelConfiguration);
  v6.receiver = self;
  v6.super_class = (Class)MLIdentity;
  v4 = [(MLModel *)&v6 initWithConfiguration:v3];

  return v4;
}

+ (id)loadModelFromSpecification:(_MLModelSpecification *)a3 configuration:(id)a4 error:(id *)a5
{
  v5 = objc_alloc_init(MLIdentity);

  return v5;
}

@end