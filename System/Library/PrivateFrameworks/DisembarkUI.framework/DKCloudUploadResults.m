@interface DKCloudUploadResults
- (BOOL)success;
- (DKCloudUploadResult)syncResult;
- (NSArray)backupResults;
- (void)setBackupResults:(id)a3;
- (void)setSyncResult:(id)a3;
@end

@implementation DKCloudUploadResults

- (BOOL)success
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DKCloudUploadResults *)self syncResult];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(DKCloudUploadResults *)self syncResult];
    int v6 = [v5 success];

    if (!v6) {
      return 0;
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = [(DKCloudUploadResults *)self backupResults];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (![*(id *)(*((void *)&v14 + 1) + 8 * i) success])
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (NSArray)backupResults
{
  return self->_backupResults;
}

- (void)setBackupResults:(id)a3
{
}

- (DKCloudUploadResult)syncResult
{
  return self->_syncResult;
}

- (void)setSyncResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncResult, 0);
  objc_storeStrong((id *)&self->_backupResults, 0);
}

@end