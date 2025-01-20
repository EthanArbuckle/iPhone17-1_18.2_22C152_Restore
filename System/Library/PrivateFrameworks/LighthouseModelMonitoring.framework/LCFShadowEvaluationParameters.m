@interface LCFShadowEvaluationParameters
- (NSArray)featureNames;
- (NSArray)modelNames;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)destLabelName;
- (NSString)groundTruthLabelFeatureName;
- (NSString)predictedLabelFeatureName;
- (NSString)srcLabelName;
- (NSString)vectorFeatureName;
- (id)inferenceHandler;
- (id)init:(id)a3 featureNames:(id)a4 vectorFeatureName:(id)a5 srcLabelName:(id)a6 destLabelName:(id)a7 startDate:(id)a8 endDate:(id)a9;
- (id)init:(id)a3 featureNames:(id)a4 vectorFeatureName:(id)a5 srcLabelName:(id)a6 destLabelName:(id)a7 startDate:(id)a8 endDate:(id)a9 preprocessHandler:(id)a10 inferenceHandler:(id)a11 metricsHandler:(id)a12 groundTruthLabelFeatureName:(id)a13 predictedLabelFeatureName:(id)a14;
- (id)metricsHandler;
- (id)preprocessHandler;
@end

@implementation LCFShadowEvaluationParameters

- (id)init:(id)a3 featureNames:(id)a4 vectorFeatureName:(id)a5 srcLabelName:(id)a6 destLabelName:(id)a7 startDate:(id)a8 endDate:(id)a9
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v16 = a8;
  id v17 = a9;
  v29.receiver = self;
  v29.super_class = (Class)LCFShadowEvaluationParameters;
  v18 = [(LCFShadowEvaluationParameters *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_modelNames, a3);
    objc_storeStrong((id *)&v19->_featureNames, a4);
    objc_storeStrong((id *)&v19->_vectorFeatureName, a5);
    objc_storeStrong((id *)&v19->_srcLabelName, a6);
    objc_storeStrong((id *)&v19->_destLabelName, a7);
    objc_storeStrong((id *)&v19->_startDate, a8);
    objc_storeStrong((id *)&v19->_endDate, a9);
    id preprocessHandler = v19->_preprocessHandler;
    v19->_id preprocessHandler = 0;

    id inferenceHandler = v19->_inferenceHandler;
    v19->_id inferenceHandler = 0;

    id metricsHandler = v19->_metricsHandler;
    v19->_id metricsHandler = 0;

    objc_storeStrong((id *)&v19->_groundTruthLabelFeatureName, a7);
    objc_storeStrong((id *)&v19->_predictedLabelFeatureName, a7);
  }

  return v19;
}

- (id)init:(id)a3 featureNames:(id)a4 vectorFeatureName:(id)a5 srcLabelName:(id)a6 destLabelName:(id)a7 startDate:(id)a8 endDate:(id)a9 preprocessHandler:(id)a10 inferenceHandler:(id)a11 metricsHandler:(id)a12 groundTruthLabelFeatureName:(id)a13 predictedLabelFeatureName:(id)a14
{
  id v49 = a3;
  id v48 = a4;
  id v41 = a5;
  id v47 = a5;
  id v46 = a6;
  id v42 = a7;
  id v19 = a7;
  id v45 = a8;
  id v44 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  v50.receiver = self;
  v50.super_class = (Class)LCFShadowEvaluationParameters;
  id v25 = [(LCFShadowEvaluationParameters *)&v50 init];
  id v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_modelNames, a3);
    objc_storeStrong((id *)&v26->_featureNames, a4);
    objc_storeStrong((id *)&v26->_vectorFeatureName, v41);
    objc_storeStrong((id *)&v26->_srcLabelName, a6);
    objc_storeStrong((id *)&v26->_destLabelName, v42);
    objc_storeStrong((id *)&v26->_startDate, a8);
    objc_storeStrong((id *)&v26->_endDate, a9);
    uint64_t v27 = MEMORY[0x25A2801F0](v20);
    id preprocessHandler = v26->_preprocessHandler;
    v26->_id preprocessHandler = (id)v27;

    uint64_t v29 = MEMORY[0x25A2801F0](v21);
    id inferenceHandler = v26->_inferenceHandler;
    v26->_id inferenceHandler = (id)v29;

    uint64_t v31 = MEMORY[0x25A2801F0](v22);
    id metricsHandler = v26->_metricsHandler;
    v26->_id metricsHandler = (id)v31;

    if (v23) {
      v33 = v23;
    }
    else {
      v33 = v19;
    }
    v34 = v33;
    groundTruthLabelFeatureName = v26->_groundTruthLabelFeatureName;
    v26->_groundTruthLabelFeatureName = v34;

    if (v24) {
      v36 = v24;
    }
    else {
      v36 = v19;
    }
    v37 = v36;
    predictedLabelFeatureName = v26->_predictedLabelFeatureName;
    v26->_predictedLabelFeatureName = v37;
  }
  return v26;
}

- (NSArray)modelNames
{
  return self->_modelNames;
}

- (NSArray)featureNames
{
  return self->_featureNames;
}

- (NSString)srcLabelName
{
  return self->_srcLabelName;
}

- (NSString)destLabelName
{
  return self->_destLabelName;
}

- (NSString)vectorFeatureName
{
  return self->_vectorFeatureName;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (id)preprocessHandler
{
  return self->_preprocessHandler;
}

- (id)inferenceHandler
{
  return self->_inferenceHandler;
}

- (id)metricsHandler
{
  return self->_metricsHandler;
}

- (NSString)groundTruthLabelFeatureName
{
  return self->_groundTruthLabelFeatureName;
}

- (NSString)predictedLabelFeatureName
{
  return self->_predictedLabelFeatureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedLabelFeatureName, 0);
  objc_storeStrong((id *)&self->_groundTruthLabelFeatureName, 0);
  objc_storeStrong(&self->_metricsHandler, 0);
  objc_storeStrong(&self->_inferenceHandler, 0);
  objc_storeStrong(&self->_preprocessHandler, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_vectorFeatureName, 0);
  objc_storeStrong((id *)&self->_destLabelName, 0);
  objc_storeStrong((id *)&self->_srcLabelName, 0);
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_modelNames, 0);
}

@end