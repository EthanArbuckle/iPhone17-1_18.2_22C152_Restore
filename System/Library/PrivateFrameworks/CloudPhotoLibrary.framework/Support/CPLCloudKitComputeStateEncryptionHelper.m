@interface CPLCloudKitComputeStateEncryptionHelper
- (BOOL)decryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (BOOL)encryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (BOOL)unitTestMode;
- (CPLCloudKitComputeStateEncryptionHelper)init;
- (PFClientSideEncryptionManager)clientSideEncryptionManager;
- (void)setUnitTestMode:(BOOL)a3;
- (void)shutdown;
- (void)start;
@end

@implementation CPLCloudKitComputeStateEncryptionHelper

- (CPLCloudKitComputeStateEncryptionHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLCloudKitComputeStateEncryptionHelper;
  result = [(CPLCloudKitComputeStateEncryptionHelper *)&v3 init];
  if (result) {
    result->_unitTestMode = 0;
  }
  return result;
}

- (void)start
{
  objc_super v3 = (id *)&PFClientSideEncryptionManagerProfilePhotosCloudPhotoD;
  if (self->_unitTestMode) {
    objc_super v3 = (id *)&PFClientSideEncryptionManagerProfilePhotosUnitTest;
  }
  id v6 = *v3;
  v4 = (PFClientSideEncryptionManager *)[objc_alloc((Class)PFClientSideEncryptionManager) initWithProfile:v6];
  clientSideEncryptionManager = self->_clientSideEncryptionManager;
  self->_clientSideEncryptionManager = v4;

  [(PFClientSideEncryptionManager *)self->_clientSideEncryptionManager start];
}

- (void)shutdown
{
}

- (BOOL)encryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  clientSideEncryptionManager = self->_clientSideEncryptionManager;
  id v22 = 0;
  unsigned __int8 v7 = [(PFClientSideEncryptionManager *)clientSideEncryptionManager archiveFileAtURL:a3 outputFileURL:a4 error:&v22];
  id v8 = v22;
  id v9 = v8;
  if (v7) {
    goto LABEL_12;
  }
  v10 = [v8 domain];
  unsigned int v11 = [v10 isEqualToString:PFErrorDomain];

  if (v11)
  {
    id v12 = [v9 code];
    if (v12 != (id)8)
    {
      if (v12 == (id)500101)
      {
        id v13 = objc_alloc((Class)NSString);
        v14 = [v9 localizedDescription];
        id v15 = [v13 initWithFormat:@"Encryption helper is unavailable: %@", v14];
        uint64_t v16 = 1;
        goto LABEL_8;
      }
      v17 = [v9 cplUnderlyingPOSIXError];

      if (!v17)
      {
        id v18 = objc_alloc((Class)NSString);
        v14 = [v9 localizedDescription];
        id v15 = [v18 initWithFormat:@"Failed to encrypt file: %@", v14];
        uint64_t v16 = 2;
LABEL_8:

        if (v15)
        {
          v23[0] = NSLocalizedDescriptionKey;
          v23[1] = NSUnderlyingErrorKey;
          v24[0] = v15;
          v24[1] = v9;
          v19 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
          uint64_t v20 = +[NSError errorWithDomain:@"CPLComputeStateEncryptionError" code:v16 userInfo:v19];

          id v9 = (id)v20;
        }
      }
    }
  }
  if (a5)
  {
    id v9 = v9;
    *a5 = v9;
  }
LABEL_12:

  return v7;
}

- (BOOL)decryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  clientSideEncryptionManager = self->_clientSideEncryptionManager;
  id v22 = 0;
  unsigned __int8 v7 = [(PFClientSideEncryptionManager *)clientSideEncryptionManager unarchiveFileAtURL:a3 outputFileURL:a4 error:&v22];
  id v8 = v22;
  id v9 = v8;
  if (v7) {
    goto LABEL_12;
  }
  v10 = [v8 domain];
  unsigned int v11 = [v10 isEqualToString:PFErrorDomain];

  if (v11)
  {
    id v12 = [v9 code];
    if (v12 != (id)8)
    {
      if (v12 == (id)500101)
      {
        id v13 = objc_alloc((Class)NSString);
        v14 = [v9 localizedDescription];
        id v15 = [v13 initWithFormat:@"Encryption helper is unavailable: %@", v14];
        uint64_t v16 = 1;
        goto LABEL_8;
      }
      v17 = [v9 cplUnderlyingPOSIXError];

      if (!v17)
      {
        id v18 = objc_alloc((Class)NSString);
        v14 = [v9 localizedDescription];
        id v15 = [v18 initWithFormat:@"Failed to decrypt file: %@", v14];
        uint64_t v16 = 3;
LABEL_8:

        if (v15)
        {
          v23[0] = NSLocalizedDescriptionKey;
          v23[1] = NSUnderlyingErrorKey;
          v24[0] = v15;
          v24[1] = v9;
          v19 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
          uint64_t v20 = +[NSError errorWithDomain:@"CPLComputeStateEncryptionError" code:v16 userInfo:v19];

          id v9 = (id)v20;
        }
      }
    }
  }
  if (a5)
  {
    id v9 = v9;
    *a5 = v9;
  }
LABEL_12:

  return v7;
}

- (PFClientSideEncryptionManager)clientSideEncryptionManager
{
  return (PFClientSideEncryptionManager *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)unitTestMode
{
  return self->_unitTestMode;
}

- (void)setUnitTestMode:(BOOL)a3
{
  self->_unitTestMode = a3;
}

- (void).cxx_destruct
{
}

@end