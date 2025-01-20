@interface MLAppleWordTaggerParameters
- (MLAppleWordTaggerParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 tokensFeatureName:(id)a6 tokenTagsFeatureName:(id)a7 tokenLocationsFeatureName:(id)a8 tokenLengthsFeatureName:(id)a9 modelData:(id)a10 tagNames:(id)a11 error:(id *)a12;
- (MLAppleWordTaggerParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 tokensFeatureName:(id)a6 tokenTagsFeatureName:(id)a7 tokenLocationsFeatureName:(id)a8 tokenLengthsFeatureName:(id)a9 modelData:(id)a10 tagNames:(id)a11 metadata:(id)a12 error:(id *)a13;
- (NSArray)tagNames;
- (NSData)modelParameterData;
- (NSDictionary)metadata;
- (NSString)inputFeatureName;
- (NSString)language;
- (NSString)tokenLengthsOutputFeatureName;
- (NSString)tokenLocationsOutputFeatureName;
- (NSString)tokenTagsOutputFeatureName;
- (NSString)tokensOutputFeatureName;
- (unint64_t)revision;
- (void)setInputFeatureName:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setModelParameterData:(id)a3;
- (void)setRevision:(unint64_t)a3;
- (void)setTagNames:(id)a3;
- (void)setTokenLengthsOutputFeatureName:(id)a3;
- (void)setTokenLocationsOutputFeatureName:(id)a3;
- (void)setTokenTagsOutputFeatureName:(id)a3;
- (void)setTokensOutputFeatureName:(id)a3;
@end

@implementation MLAppleWordTaggerParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_tagNames, 0);
  objc_storeStrong((id *)&self->_modelParameterData, 0);
  objc_storeStrong((id *)&self->_tokenLengthsOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_tokenLocationsOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_tokenTagsOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_tokensOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTagNames:(id)a3
{
}

- (NSArray)tagNames
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setModelParameterData:(id)a3
{
}

- (NSData)modelParameterData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTokenLengthsOutputFeatureName:(id)a3
{
}

- (NSString)tokenLengthsOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTokenLocationsOutputFeatureName:(id)a3
{
}

- (NSString)tokenLocationsOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTokenTagsOutputFeatureName:(id)a3
{
}

- (NSString)tokenTagsOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokensOutputFeatureName:(id)a3
{
}

- (NSString)tokensOutputFeatureName
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

- (MLAppleWordTaggerParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 tokensFeatureName:(id)a6 tokenTagsFeatureName:(id)a7 tokenLocationsFeatureName:(id)a8 tokenLengthsFeatureName:(id)a9 modelData:(id)a10 tagNames:(id)a11 error:(id *)a12
{
  return [(MLAppleWordTaggerParameters *)self initWithData:a3 language:a4 inputFeatureName:a5 tokensFeatureName:a6 tokenTagsFeatureName:a7 tokenLocationsFeatureName:a8 tokenLengthsFeatureName:a9 modelData:a10 tagNames:a11 metadata:MEMORY[0x1E4F1CC08] error:a12];
}

- (MLAppleWordTaggerParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 tokensFeatureName:(id)a6 tokenTagsFeatureName:(id)a7 tokenLocationsFeatureName:(id)a8 tokenLengthsFeatureName:(id)a9 modelData:(id)a10 tagNames:(id)a11 metadata:(id)a12 error:(id *)a13
{
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v28 = a8;
  id v27 = a9;
  id v26 = a10;
  id v25 = a11;
  id v24 = a12;
  v33.receiver = self;
  v33.super_class = (Class)MLAppleWordTaggerParameters;
  v19 = [(MLAppleWordTaggerParameters *)&v33 init];
  v20 = v19;
  if (v19)
  {
    v19->_revision = a3;
    objc_storeStrong((id *)&v19->_language, a4);
    objc_storeStrong((id *)&v20->_inputFeatureName, a5);
    objc_storeStrong((id *)&v20->_tokensOutputFeatureName, a6);
    objc_storeStrong((id *)&v20->_tokenTagsOutputFeatureName, a7);
    objc_storeStrong((id *)&v20->_tokenLocationsOutputFeatureName, a8);
    objc_storeStrong((id *)&v20->_tokenLengthsOutputFeatureName, a9);
    objc_storeStrong((id *)&v20->_modelParameterData, a10);
    objc_storeStrong((id *)&v20->_tagNames, a11);
    objc_storeStrong((id *)&v20->_metadata, a12);
    v21 = v20;
  }
  else if (a13)
  {
    *a13 = +[MLModelErrorUtils genericErrorWithFormat:@"Initialization of word tagger parameters failed"];
  }

  return v20;
}

@end