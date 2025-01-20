@interface AAQuotaInfoResponse
- (AAQuotaInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (BOOL)hasMaxTier;
- (NSArray)usage;
- (NSNumber)availableStorageInBytes;
- (NSNumber)totalStorageInBytes;
- (NSNumber)usedStorageInBytes;
- (NSString)displayLabel;
- (NSURL)manageStorageURL;
- (void)_initFromResponseDict;
- (void)updateAccount:(id)a3 completion:(id)a4;
@end

@implementation AAQuotaInfoResponse

- (AAQuotaInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AAQuotaInfoResponse;
  v4 = [(AAResponse *)&v8 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    if ([(NSHTTPURLResponse *)v4->super._httpResponse statusCode] == 200)
    {
      [(AAQuotaInfoResponse *)v5 _initFromResponseDict];
    }
    else
    {
      v6 = _AALogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[AAQuotaInfoResponse initWithHTTPResponse:data:]((id *)&v5->super._httpResponse, v6);
      }
    }
  }
  return v5;
}

- (void)_initFromResponseDict
{
  id v8 = [(NSDictionary *)self->super._responseDictionary objectForKeyedSubscript:@"storage_data"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = [v8 objectForKeyedSubscript:@"quota_info_in_bytes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&self->_quotaInfo, v3);
      }
      v4 = [v8 objectForKeyedSubscript:@"storage_info_in_bytes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&self->_storageInfo, v4);
      }
    }
  }
  v5 = [(NSDictionary *)self->super._responseDictionary objectForKeyedSubscript:@"storage_usage_by_media"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_usage, v5);
  }
  v6 = [(NSDictionary *)self->super._responseDictionary objectForKeyedSubscript:@"entry_points"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_endPoints, v6);
  }
  v7 = [(NSDictionary *)self->super._responseDictionary objectForKeyedSubscript:@"storage_meter_label"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_storageMeterLabel, v7);
  }
}

- (NSURL)manageStorageURL
{
  v2 = [(NSDictionary *)self->_endPoints objectForKeyedSubscript:@"quota.manage_storage_url"];
  v3 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  v4 = [v2 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  return (NSURL *)v5;
}

- (NSNumber)totalStorageInBytes
{
  return (NSNumber *)[(NSDictionary *)self->_quotaInfo objectForKeyedSubscript:@"total_quota"];
}

- (NSNumber)usedStorageInBytes
{
  return (NSNumber *)[(NSDictionary *)self->_quotaInfo objectForKeyedSubscript:@"total_used"];
}

- (NSNumber)availableStorageInBytes
{
  return (NSNumber *)[(NSDictionary *)self->_quotaInfo objectForKeyedSubscript:@"total_available"];
}

- (BOOL)hasMaxTier
{
  v2 = [(NSDictionary *)self->super._responseDictionary objectForKeyedSubscript:@"quota_status"];
  v3 = [v2 objectForKeyedSubscript:@"have_max_quota_tier"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)displayLabel
{
  v2 = [(NSDictionary *)self->_storageMeterLabel objectForKeyedSubscript:@"display_label"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    char v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    id v3 = [v4 localizedStringForKey:@"SERVICE_TYPE_ICLOUD" value:0 table:@"Localizable"];
  }

  return (NSString *)v3;
}

- (void)updateAccount:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "aa_lastKnownQuota");
  v9 = [(AAQuotaInfoResponse *)self totalStorageInBytes];
  if (v9 && ([v8 isEqualToNumber:v9] & 1) == 0)
  {
    objc_msgSend(v6, "aa_setLastKnownQuota:", v9);
    v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Quota for %@ changed from %@ to %@; updating last known quota",
        buf,
        0x20u);
    }

    v11 = [v6 accountStore];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__AAQuotaInfoResponse_updateAccount_completion___block_invoke;
    v12[3] = &unk_1E5A48DE8;
    id v13 = v7;
    [v11 saveVerifiedAccount:v6 withCompletionHandler:v12];
  }
}

void __48__AAQuotaInfoResponse_updateAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Updated account quota information with success: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (NSArray)usage
{
  return self->_usage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_storageMeterLabel, 0);
  objc_storeStrong((id *)&self->_storageInfo, 0);
  objc_storeStrong((id *)&self->_endPoints, 0);

  objc_storeStrong((id *)&self->_quotaInfo, 0);
}

- (void)initWithHTTPResponse:(id *)a1 data:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*a1 statusCode];
  id v5 = *a1;
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "AAQuotaInfoResponse has non-200 status code: %zd for response: %@", (uint8_t *)&v6, 0x16u);
}

@end