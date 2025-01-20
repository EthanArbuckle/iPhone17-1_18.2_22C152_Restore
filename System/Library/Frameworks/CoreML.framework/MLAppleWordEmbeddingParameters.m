@interface MLAppleWordEmbeddingParameters
- (MLAppleWordEmbeddingParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 outputFeatureName:(id)a6 modelData:(id)a7 error:(id *)a8;
- (MLAppleWordEmbeddingParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 outputFeatureName:(id)a6 modelData:(id)a7 metadata:(id)a8 error:(id *)a9;
- (NSData)modelParameterData;
- (NSDictionary)metadata;
- (NSString)inputFeatureName;
- (NSString)language;
- (NSString)outputFeatureName;
- (unint64_t)revision;
- (void)setInputFeatureName:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setModelParameterData:(id)a3;
- (void)setOutputFeatureName:(id)a3;
- (void)setRevision:(unint64_t)a3;
@end

@implementation MLAppleWordEmbeddingParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_modelParameterData, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModelParameterData:(id)a3
{
}

- (NSData)modelParameterData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOutputFeatureName:(id)a3
{
}

- (NSString)outputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInputFeatureName:(id)a3
{
}

- (NSString)inputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRevision:(unint64_t)a3
{
  self->_revision = a3;
}

- (unint64_t)revision
{
  return self->_revision;
}

- (MLAppleWordEmbeddingParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 outputFeatureName:(id)a6 modelData:(id)a7 error:(id *)a8
{
  return [(MLAppleWordEmbeddingParameters *)self initWithData:a3 language:a4 inputFeatureName:a5 outputFeatureName:a6 modelData:a7 metadata:MEMORY[0x1E4F1CC08] error:a8];
}

- (MLAppleWordEmbeddingParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 outputFeatureName:(id)a6 modelData:(id)a7 metadata:(id)a8 error:(id *)a9
{
  id v24 = a4;
  id v23 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MLAppleWordEmbeddingParameters;
  v19 = [(MLAppleWordEmbeddingParameters *)&v25 init];
  v20 = v19;
  if (v19)
  {
    v19->_revision = a3;
    objc_storeStrong((id *)&v19->_language, a4);
    objc_storeStrong((id *)&v20->_inputFeatureName, a5);
    objc_storeStrong((id *)&v20->_outputFeatureName, a6);
    objc_storeStrong((id *)&v20->_modelParameterData, a7);
    objc_storeStrong((id *)&v20->_metadata, a8);
    v21 = v20;
  }
  else if (a9)
  {
    *a9 = +[MLModelErrorUtils genericErrorWithFormat:@"Initialization of Word Embedding parameters failed", v23, v24];
  }

  return v20;
}

@end