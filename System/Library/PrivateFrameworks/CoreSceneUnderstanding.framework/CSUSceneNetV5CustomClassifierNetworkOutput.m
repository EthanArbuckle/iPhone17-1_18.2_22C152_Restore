@interface CSUSceneNetV5CustomClassifierNetworkOutput
- (CSUBuffer)classificationLikelihoods;
- (CSUSceneNetV5CustomClassifierNetworkOutput)initWithClassificationLikelihoods:(id)a3;
@end

@implementation CSUSceneNetV5CustomClassifierNetworkOutput

- (CSUSceneNetV5CustomClassifierNetworkOutput)initWithClassificationLikelihoods:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSUSceneNetV5CustomClassifierNetworkOutput;
  v6 = [(CSUSceneNetV5CustomClassifierNetworkOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_classificationLikelihoods, a3);
  }

  return v7;
}

- (CSUBuffer)classificationLikelihoods
{
  return (CSUBuffer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end