@interface GEOMobileAssetResource
- (GEOMobileAssetResource)initWithURL:(id)a3 sandboxExtensionData:(id)a4;
- (NSURL)fileURL;
- (void)dealloc;
@end

@implementation GEOMobileAssetResource

- (void).cxx_destruct
{
}

- (GEOMobileAssetResource)initWithURL:(id)a3 sandboxExtensionData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMobileAssetResource;
  v9 = [(GEOMobileAssetResource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileURL, a3);
    [v8 bytes];
    v10->_sandboxExtension = sandbox_extension_consume();
  }

  return v10;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)dealloc
{
  if (self->_sandboxExtension != -1) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOMobileAssetResource;
  [(GEOMobileAssetResource *)&v3 dealloc];
}

@end