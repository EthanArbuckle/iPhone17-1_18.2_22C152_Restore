@interface MLPipelineClassifier
- (MLPipeline)engine;
- (MLPipeline)pipeline;
- (MLPipelineClassifier)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6;
- (id)classify:(id)a3 options:(id)a4 error:(id *)a5;
- (id)executionSchedule;
- (unint64_t)signpostID;
- (void)classify:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)enableInstrumentsTracing;
- (void)setEngine:(id)a3;
@end

@implementation MLPipelineClassifier

- (void).cxx_destruct
{
}

- (void)setEngine:(id)a3
{
}

- (MLPipeline)engine
{
  return (MLPipeline *)objc_getProperty(self, a2, 96, 1);
}

- (id)executionSchedule
{
  v2 = [(MLPipelineClassifier *)self engine];
  v3 = [v2 executionSchedule];

  return v3;
}

- (void)enableInstrumentsTracing
{
  id v2 = [(MLPipelineClassifier *)self engine];
  [v2 enableInstrumentsTracing];
}

- (unint64_t)signpostID
{
  id v2 = [(MLPipelineClassifier *)self engine];
  unint64_t v3 = [v2 signpostID];

  return v3;
}

- (void)classify:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3812000000;
  v11[3] = __Block_byref_object_copy__4966;
  v11[4] = __Block_byref_object_dispose__4967;
  v11[5] = 0;
  [(MLModel *)self predictionEvent];
  objc_claimAutoreleasedReturnValue();
  [(MLPipelineClassifier *)self signpostID];
  [v9 parentSignpostID];
  [(MLModel *)self nextPredictionRequestID];
  operator new();
}

void __59__MLPipelineClassifier_classify_options_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)a1[4];
    id v11 = v6;
    uint64_t v8 = [v7 classifierResultFromOutputFeatures:v5 error:&v11];
    id v9 = v11;

    id v10 = (void *)v8;
    id v6 = v9;
  }
  else
  {
    id v10 = 0;
  }
  std::unique_ptr<ElapsedTimeRecorder>::reset[abi:ne180100]((id **)(*(void *)(a1[6] + 8) + 48));
  (*(void (**)(void))(a1[5] + 16))();
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  id v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v15, v10, 3, -[MLPipelineClassifier signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  id v11 = [(MLPipelineClassifier *)self engine];
  v12 = [v11 predictionFromFeatures:v8 options:v9 error:a5];

  if (v12)
  {
    v13 = [(MLClassifier *)self classifierResultFromOutputFeatures:v12 error:a5];
  }
  else
  {
    v13 = 0;
  }

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v15);

  return v13;
}

- (MLPipelineClassifier)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MLPipelineClassifier;
  v14 = [(MLClassifier *)&v20 initWithDescription:v12 configuration:v13 error:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_engine, a3);
    v16 = [v11 modelDescription];
    v17 = [v16 classLabels];
    v18 = [(MLModel *)v15 modelDescription];
    [v18 setClassLabels:v17];
  }
  return v15;
}

- (MLPipeline)pipeline
{
  return self->_engine;
}

@end