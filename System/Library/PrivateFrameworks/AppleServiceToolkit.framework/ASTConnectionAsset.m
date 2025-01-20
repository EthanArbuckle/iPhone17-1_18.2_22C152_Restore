@interface ASTConnectionAsset
- (ASTConnectionAsset)initWithServerURL:(id)a3 endpoint:(id)a4 assetName:(id)a5 destinationFileHandle:(id)a6;
- (NSFileHandle)destinationFileHandle;
- (NSString)assetName;
- (id)accept;
- (id)didDownloadFile;
- (id)endpoint;
- (id)method;
- (id)serverURL;
- (void)setAssetName:(id)a3;
- (void)setDidDownloadFile:(id)a3;
@end

@implementation ASTConnectionAsset

- (ASTConnectionAsset)initWithServerURL:(id)a3 endpoint:(id)a4 assetName:(id)a5 destinationFileHandle:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ASTConnectionAsset;
  v15 = [(ASTMaterializedConnection *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serverURL, a3);
    objc_storeStrong((id *)&v16->_endpoint, a4);
    objc_storeStrong((id *)&v16->_assetName, a5);
    objc_storeStrong((id *)&v16->_destinationFileHandle, a6);
  }

  return v16;
}

- (id)serverURL
{
  return self->_serverURL;
}

- (id)endpoint
{
  endpoint = self->_endpoint;
  v3 = [(ASTConnectionAsset *)self assetName];
  if (endpoint)
  {
    uint64_t v4 = [(NSString *)endpoint stringByAppendingPathComponent:v3];

    v3 = (void *)v4;
  }

  return v3;
}

- (id)method
{
  return @"GET";
}

- (id)accept
{
  return 0;
}

- (id)didDownloadFile
{
  return self->_didDownloadFile;
}

- (void)setDidDownloadFile:(id)a3
{
}

- (NSFileHandle)destinationFileHandle
{
  return self->_destinationFileHandle;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setAssetName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong((id *)&self->_destinationFileHandle, 0);
  objc_storeStrong(&self->_didDownloadFile, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_serverURL, 0);
}

@end