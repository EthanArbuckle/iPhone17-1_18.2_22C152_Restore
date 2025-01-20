@interface MLPipelineRegressor
- (MLPipeline)engine;
- (MLPipeline)pipeline;
- (MLPipelineRegressor)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6;
- (id)executionSchedule;
- (id)regress:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)signpostID;
- (void)setEngine:(id)a3;
@end

@implementation MLPipelineRegressor

- (void).cxx_destruct
{
}

- (void)setEngine:(id)a3
{
}

- (MLPipeline)engine
{
  return (MLPipeline *)objc_getProperty(self, a2, 80, 1);
}

- (id)executionSchedule
{
  v2 = [(MLPipelineRegressor *)self engine];
  v3 = [v2 executionSchedule];

  return v3;
}

- (unint64_t)signpostID
{
  v2 = [(MLPipelineRegressor *)self engine];
  unint64_t v3 = [v2 signpostID];

  return v3;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v14, v10, 3, -[MLPipelineRegressor signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = [(MLPipeline *)self->_engine predictionFromFeatures:v8 options:v9 error:a5];
  v12 = [(MLRegressor *)self regressorResultFromOutputFeatures:v11 error:a5];

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v14);

  return v12;
}

- (MLPipelineRegressor)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLPipelineRegressor;
  v14 = [(MLRegressor *)&v17 initWithDescription:v12 configuration:v13 error:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_engine, a3);
    -[MLModel setSignpostID:](v15, "setSignpostID:", [v11 signpostID]);
  }

  return v15;
}

- (MLPipeline)pipeline
{
  return self->_engine;
}

@end