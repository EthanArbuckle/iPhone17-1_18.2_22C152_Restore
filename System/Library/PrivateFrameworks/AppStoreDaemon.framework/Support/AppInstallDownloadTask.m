@interface AppInstallDownloadTask
- (void)main;
@end

@implementation AppInstallDownloadTask

- (void)main
{
  if (self)
  {
    id v3 = sub_10026E91C(self->_package, @"request_count");
    v22 = 0;
    id v23 = 0;
    v4 = sub_1002AAD2C((uint64_t)self, &v23, &v22);
    id v5 = v23;
    v6 = v22;
    v7 = v6;
    if (v4)
    {
      id v19 = v3;
      v21 = v6;
      installID = (void *)self->_installID;
      id v9 = v4;
      id v10 = v5;
      self;
      v11 = (AppInstallDownloadResponse *)sub_1002AC770((id *)[AppInstallDownloadResponse alloc], installID, 0, v10, v9, 0);

      if (self->_didLoadAssetSize)
      {
        v12 = sub_10026E82C(self->_package, @"bytes_total");
        int64_t v13 = [(SQLiteMemoryEntity *)self->_package databaseID];
        id v14 = v12;
        if (v11)
        {
          objc_storeStrong((id *)&v11->_assetSize, v12);
          v11->_packageID = v13;
        }
      }
      int64_t v15 = [(SQLiteMemoryEntity *)self->_package databaseID];
      if (v11)
      {
        v11->_packageID = v15;
        v11->_requestCount = v20 + 1;
      }
      v7 = v21;
    }
    else
    {
      v16 = sub_100330828();
      v17 = sub_10026E95C(self->_install, @"bundle_id");
      sub_1003327FC((uint64_t)v16, v17);

      sub_1002AC440((uint64_t)AppInstallDownloadResponse, (void *)[(SQLiteMemoryEntity *)self->_install databaseID], v7);
      v11 = (AppInstallDownloadResponse *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }
  downloadResponse = self->_downloadResponse;
  self->_downloadResponse = v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadResponse, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_installInfo, 0);
  objc_storeStrong((id *)&self->_install, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end