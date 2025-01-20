@interface MLAppleGazetteerParameters
- (MLAppleGazetteerParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 outputFeatureName:(id)a6 modelData:(id)a7 labelNames:(id)a8 metadata:(id)a9 error:(id *)a10;
- (NSArray)labelNames;
- (NSData)modelParameterData;
- (NSDictionary)metadata;
- (NSString)inputFeatureName;
- (NSString)language;
- (NSString)outputFeatureName;
- (unint64_t)revision;
- (void)setInputFeatureName:(id)a3;
- (void)setLabelNames:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setModelParameterData:(id)a3;
- (void)setOutputFeatureName:(id)a3;
- (void)setRevision:(unint64_t)a3;
@end

@implementation MLAppleGazetteerParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_labelNames, 0);
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
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLabelNames:(id)a3
{
}

- (NSArray)labelNames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
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

- (MLAppleGazetteerParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 outputFeatureName:(id)a6 modelData:(id)a7 labelNames:(id)a8 metadata:(id)a9 error:(id *)a10
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v17 = a8;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MLAppleGazetteerParameters;
  v19 = [(MLAppleGazetteerParameters *)&v27 init];
  v20 = v19;
  if (v19)
  {
    v19->_revision = a3;
    objc_storeStrong((id *)&v19->_language, a4);
    objc_storeStrong((id *)&v20->_inputFeatureName, a5);
    objc_storeStrong((id *)&v20->_outputFeatureName, a6);
    objc_storeStrong((id *)&v20->_modelParameterData, a7);
    objc_storeStrong((id *)&v20->_labelNames, a8);
    objc_storeStrong((id *)&v20->_metadata, a9);
    v21 = v20;
  }
  else if (a10)
  {
    *a10 = +[MLModelErrorUtils genericErrorWithFormat:@"Initialization of Gazetteer parameters failed", v23, v24, v25, v26];
  }

  return v20;
}

@end