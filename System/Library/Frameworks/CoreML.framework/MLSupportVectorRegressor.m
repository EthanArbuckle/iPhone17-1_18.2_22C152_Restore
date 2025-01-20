@interface MLSupportVectorRegressor
- (MLSVREngine)engine;
- (MLSupportVectorRegressor)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6;
- (id)regress:(id)a3 options:(id)a4 error:(id *)a5;
- (void)setEngine:(id)a3;
@end

@implementation MLSupportVectorRegressor

- (void).cxx_destruct
{
}

- (void)setEngine:(id)a3
{
}

- (MLSVREngine)engine
{
  return (MLSVREngine *)objc_getProperty(self, a2, 80, 1);
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v25, v10, 22, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v11 = [(MLModel *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__MLSupportVectorRegressor_regress_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(void))_Block_copy(aBlock);
  v14 = [(MLModel *)self modelDescription];
  v15 = [v14 inputFeatureNames];
  v16 = [v15 array];
  v17 = +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:v8 featureNames:v16 error:a5];

  if (!v17) {
    goto LABEL_11;
  }
  if ([(MLSVREngine *)self->_engine isInputSizeLowerBoundOnly])
  {
    int64_t v18 = [v17 count];
    if (v18 < (int64_t)[(MLSVREngine *)self->_engine inputSize])
    {
      if (a5)
      {
        v19 = +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", @"Input feature length mismatch. Got features of length %d expected length of at least %d", [v17 count], -[MLSVREngine inputSize](self->_engine, "inputSize"));
LABEL_10:
        v22 = 0;
        *a5 = v19;
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_7:
    v21 = [(MLSVREngine *)self->_engine predict:v17];
    v22 = +[MLRegressorResult resultWithValue:v21];

    goto LABEL_12;
  }
  uint64_t v20 = [v17 count];
  if (v20 == [(MLSVREngine *)self->_engine inputSize]) {
    goto LABEL_7;
  }
  if (a5)
  {
    v19 = +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", @"Input feature length mismatch. Got features of length %d expected length of %d", [v17 count], -[MLSVREngine inputSize](self->_engine, "inputSize"));
    goto LABEL_10;
  }
LABEL_11:
  v22 = 0;
LABEL_12:

  v13[2](v13);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v25);

  return v22;
}

uint64_t __50__MLSupportVectorRegressor_regress_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLSupportVectorRegressor)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLSupportVectorRegressor;
  uint64_t v12 = [(MLRegressor *)&v15 initWithDescription:a4 configuration:a5 error:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_engine, a3);
  }

  return v13;
}

@end