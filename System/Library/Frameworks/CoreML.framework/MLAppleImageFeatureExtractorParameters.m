@interface MLAppleImageFeatureExtractorParameters
- (MLAppleImageFeatureExtractorParameters)initWithObjectPrintParameters:(id)a3 error:(id *)a4;
- (MLAppleImageFeatureExtractorParameters)initWithScenePrintParameters:(id)a3 error:(id *)a4;
- (id)featureExtractorParameters;
@end

@implementation MLAppleImageFeatureExtractorParameters

- (void).cxx_destruct
{
}

- (id)featureExtractorParameters
{
  return objc_getProperty(self, a2, 8, 1);
}

- (MLAppleImageFeatureExtractorParameters)initWithObjectPrintParameters:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLAppleImageFeatureExtractorParameters;
  v8 = [(MLAppleImageFeatureExtractorParameters *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_featureExtractorParameters, a3);
    v10 = v9;
  }
  else if (a4)
  {
    *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"Initialization of image feature extractor parameters failed"];
  }

  return v9;
}

- (MLAppleImageFeatureExtractorParameters)initWithScenePrintParameters:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLAppleImageFeatureExtractorParameters;
  v8 = [(MLAppleImageFeatureExtractorParameters *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_featureExtractorParameters, a3);
    v10 = v9;
  }
  else if (a4)
  {
    *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"Initialization of image feature extractor parameters failed"];
  }

  return v9;
}

@end