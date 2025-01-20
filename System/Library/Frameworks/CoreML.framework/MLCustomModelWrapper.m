@interface MLCustomModelWrapper
- (MLCustomModel)customModel;
- (MLCustomModelWrapper)initWithModelDescription:(id)a3 customModel:(id)a4 configuration:(id)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (void)setCustomModel:(id)a3;
@end

@implementation MLCustomModelWrapper

- (void).cxx_destruct
{
}

- (void)setCustomModel:(id)a3
{
}

- (MLCustomModel)customModel
{
  return (MLCustomModel *)objc_getProperty(self, a2, 80, 1);
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_opt_respondsToSelector())
  {
    [(MLModel *)self enableInstrumentsTracingIfNeeded];
    unint64_t v10 = [(MLModel *)self signpostID];
    uint64_t v11 = [v9 parentSignpostID];
    kdebug_trace();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MLCustomModelWrapper_predictionsFromBatch_options_error___block_invoke;
    aBlock[3] = &__block_descriptor_48_e5_v8__0l;
    aBlock[4] = v10;
    aBlock[5] = v11;
    v12 = (void (**)(void))_Block_copy(aBlock);
    v13 = [(MLCustomModel *)self->_customModel predictionsFromBatch:v8 options:v9 error:a5];
    v12[2](v12);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MLCustomModelWrapper;
    v13 = [(MLModel *)&v15 predictionsFromBatch:v8 options:v9 error:a5];
  }

  return v13;
}

uint64_t __59__MLCustomModelWrapper_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  unint64_t v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v13, v10, 0, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  uint64_t v11 = [(MLCustomModel *)self->_customModel predictionFromFeatures:v8 options:v9 error:a5];
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v13);

  return v11;
}

- (MLCustomModelWrapper)initWithModelDescription:(id)a3 customModel:(id)a4 configuration:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MLCustomModelWrapper;
  unint64_t v10 = [(MLModel *)&v13 initWithDescription:a3 configuration:a5];
  uint64_t v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_customModel, a4);
  }

  return v11;
}

@end