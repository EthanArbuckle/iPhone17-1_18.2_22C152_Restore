@interface BLDownloadDRMOperation
- (BLBookInstallInfo)installInfo;
- (BLDownloadDRMOperation)initWithInstallInfo:(id)a3;
- (BOOL)_decryptAsset:(id *)a3;
- (BOOL)success;
- (NSError)error;
- (void)main;
- (void)setInstallInfo:(id)a3;
@end

@implementation BLDownloadDRMOperation

- (BLDownloadDRMOperation)initWithInstallInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLDownloadDRMOperation;
  v6 = [(BLDownloadDRMOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_installInfo, a3);
  }

  return v7;
}

- (void)main
{
  id obj = 0;
  BOOL v3 = [(BLDownloadDRMOperation *)self _decryptAsset:&obj];
  id v4 = obj;
  self->_success = v3;
  objc_storeStrong((id *)&self->_error, v4);
}

- (BOOL)_decryptAsset:(id *)a3
{
  id v5 = [(BLDownloadDRMOperation *)self installInfo];
  v6 = [v5 dpInfo];

  if ([v6 length])
  {
    v7 = [(BLDownloadDRMOperation *)self installInfo];
    v8 = [v7 databaseManager];
    objc_super v9 = [(BLDownloadDRMOperation *)self installInfo];
    v10 = [v9 downloadID];
    [v8 syncSaveDownloadStateWithId:v10 state:11];

    v11 = [(BLDownloadDRMOperation *)self installInfo];
    v12 = [v11 assetPath];

    v13 = BLBookInstallLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(BLDownloadDRMOperation *)self installInfo];
      v15 = [v14 downloadID];
      int v24 = 138543618;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-DRM-Op]:  Decrypting asset for download at path: %@", (uint8_t *)&v24, 0x16u);
    }
    v16 = [[BLFairPlayDecryptFileOperation alloc] initWithPath:v12 dpInfo:v6 installInfo:self->_installInfo];
    [(BLFairPlayDecryptFileOperation *)v16 start];
    unsigned __int8 v17 = [(BLFairPlayDecryptFileOperation *)v16 success];
    id v18 = [(BLFairPlayDecryptFileOperation *)v16 error];
    v19 = [(BLDownloadDRMOperation *)self installInfo];
    v20 = [v19 databaseManager];
    v21 = [(BLDownloadDRMOperation *)self installInfo];
    v22 = [v21 downloadID];
    [v20 syncSaveDownloadStateWithId:v22 state:12];

    if (a3 && (v17 & 1) == 0)
    {
      id v18 = v18;
      unsigned __int8 v17 = 0;
      *a3 = v18;
    }
  }
  else
  {
    id v18 = 0;
    unsigned __int8 v17 = 1;
  }

  return v17;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (BLBookInstallInfo)installInfo
{
  return self->_installInfo;
}

- (void)setInstallInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installInfo, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end