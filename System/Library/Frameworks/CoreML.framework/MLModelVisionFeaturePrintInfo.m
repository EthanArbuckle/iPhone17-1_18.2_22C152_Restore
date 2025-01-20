@interface MLModelVisionFeaturePrintInfo
- (MLModel)postVisionFeaturePrintModel;
- (id)featureExtractorParameters;
- (unint64_t)version;
- (void)setFeatureExtractorParameters:(id)a3;
- (void)setPostVisionFeaturePrintModel:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation MLModelVisionFeaturePrintInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postVisionFeaturePrintModel, 0);

  objc_storeStrong(&self->_featureExtractorParameters, 0);
}

- (void)setPostVisionFeaturePrintModel:(id)a3
{
}

- (MLModel)postVisionFeaturePrintModel
{
  return self->_postVisionFeaturePrintModel;
}

- (void)setFeatureExtractorParameters:(id)a3
{
}

- (id)featureExtractorParameters
{
  return self->_featureExtractorParameters;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

@end