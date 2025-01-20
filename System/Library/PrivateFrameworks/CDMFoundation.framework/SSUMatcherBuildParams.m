@interface SSUMatcherBuildParams
- (BOOL)isEqual:(id)a3;
- (NSURL)cacheDirectoryURL;
- (NSURL)datasetAssetsDirectoryURL;
- (NSURL)modelAssetsDirectoryURL;
- (SSUMatcherBuildParams)initWithModelAssetsDirectoryURL:(id)a3 datasetAssetsDirectoryURL:(id)a4 cacheDirectoryURL:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SSUMatcherBuildParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_datasetAssetsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_modelAssetsDirectoryURL, 0);
}

- (NSURL)cacheDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)datasetAssetsDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)modelAssetsDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  modelAssetsDirectoryURL = self->_modelAssetsDirectoryURL;
  datasetAssetsDirectoryURL = self->_datasetAssetsDirectoryURL;
  cacheDirectoryURL = self->_cacheDirectoryURL;
  return (id)[v4 initWithModelAssetsDirectoryURL:modelAssetsDirectoryURL datasetAssetsDirectoryURL:datasetAssetsDirectoryURL cacheDirectoryURL:cacheDirectoryURL];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_modelAssetsDirectoryURL hash];
  uint64_t v4 = [(NSURL *)self->_datasetAssetsDirectoryURL hash] - v3 + 32 * v3;
  return [(NSURL *)self->_cacheDirectoryURL hash] - v4 + 32 * v4 + 29791;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  modelAssetsDirectoryURL = self->_modelAssetsDirectoryURL;
  v6 = [v4 modelAssetsDirectoryURL];
  if ([(NSURL *)modelAssetsDirectoryURL isEqual:v6])
  {
    datasetAssetsDirectoryURL = self->_datasetAssetsDirectoryURL;
    v8 = [v4 datasetAssetsDirectoryURL];
    if ([(NSURL *)datasetAssetsDirectoryURL isEqual:v8])
    {
      cacheDirectoryURL = self->_cacheDirectoryURL;
      v10 = [v4 cacheDirectoryURL];
      char v11 = [(NSURL *)cacheDirectoryURL isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (SSUMatcherBuildParams)initWithModelAssetsDirectoryURL:(id)a3 datasetAssetsDirectoryURL:(id)a4 cacheDirectoryURL:(id)a5
{
  v8 = (NSURL *)a3;
  v9 = (NSURL *)a4;
  v10 = (NSURL *)a5;
  v18.receiver = self;
  v18.super_class = (Class)SSUMatcherBuildParams;
  char v11 = [(SSUMatcherBuildParams *)&v18 init];
  modelAssetsDirectoryURL = v11->_modelAssetsDirectoryURL;
  v11->_modelAssetsDirectoryURL = v8;
  v13 = v8;

  datasetAssetsDirectoryURL = v11->_datasetAssetsDirectoryURL;
  v11->_datasetAssetsDirectoryURL = v9;
  v15 = v9;

  cacheDirectoryURL = v11->_cacheDirectoryURL;
  v11->_cacheDirectoryURL = v10;

  return v11;
}

@end