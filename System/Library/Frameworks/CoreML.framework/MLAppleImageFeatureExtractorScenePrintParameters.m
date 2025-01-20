@interface MLAppleImageFeatureExtractorScenePrintParameters
- (NSString)requestClassName;
- (id)initScenePrintParameters:(unint64_t)a3 requestClass:(id)a4 error:(id *)a5;
- (unint64_t)scenePrintVersion;
@end

@implementation MLAppleImageFeatureExtractorScenePrintParameters

- (void).cxx_destruct
{
}

- (NSString)requestClassName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)scenePrintVersion
{
  return self->_scenePrintVersion;
}

- (id)initScenePrintParameters:(unint64_t)a3 requestClass:(id)a4 error:(id *)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLAppleImageFeatureExtractorScenePrintParameters;
  v10 = [(MLAppleImageFeatureExtractorScenePrintParameters *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_scenePrintVersion = a3;
    objc_storeStrong((id *)&v10->_requestClassName, a4);
    v12 = v11;
  }
  else if (a5)
  {
    *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Initialization of sceneprint parameters failed"];
  }

  return v11;
}

@end