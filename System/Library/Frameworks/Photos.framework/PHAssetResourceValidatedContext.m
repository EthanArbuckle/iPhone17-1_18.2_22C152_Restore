@interface PHAssetResourceValidatedContext
- (NSData)validatedData;
- (NSURL)validatedURL;
- (PHAssetResourceValidatedContext)initWithResource:(id)a3 validatedURL:(id)a4 validatedData:(id)a5;
- (PHExternalAssetResource)resource;
@end

@implementation PHAssetResourceValidatedContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedData, 0);
  objc_storeStrong((id *)&self->_validatedURL, 0);

  objc_storeStrong((id *)&self->_resource, 0);
}

- (NSData)validatedData
{
  return self->_validatedData;
}

- (NSURL)validatedURL
{
  return self->_validatedURL;
}

- (PHExternalAssetResource)resource
{
  return self->_resource;
}

- (PHAssetResourceValidatedContext)initWithResource:(id)a3 validatedURL:(id)a4 validatedData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetResourceValidatedContext;
  v12 = [(PHAssetResourceValidatedContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_resource, a3);
    objc_storeStrong((id *)&v13->_validatedURL, a4);
    objc_storeStrong((id *)&v13->_validatedData, a5);
  }

  return v13;
}

@end