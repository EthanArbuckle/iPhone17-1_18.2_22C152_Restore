@interface ASDClipRestrictionsTask
- (ASDClipRestrictionsTask)initWithClipRequest:(id)a3;
- (ASDClipRestrictionsTask)initWithClipRequest:(id)a3 verificationDate:(id)a4;
- (ASDClipRestrictionsTask)initWithDictionary:(id)a3;
- (ASDClipRestrictionsTask)initWithDictionary:(id)a3 verificationDate:(id)a4;
- (BOOL)hasErrorStatus;
- (BOOL)hasResponseFlag:(int64_t)a3;
- (int64_t)responseCode;
- (void)_verifyRequest;
@end

@implementation ASDClipRestrictionsTask

- (ASDClipRestrictionsTask)initWithDictionary:(id)a3
{
  return [(ASDClipRestrictionsTask *)self initWithDictionary:a3 verificationDate:0];
}

- (ASDClipRestrictionsTask)initWithDictionary:(id)a3 verificationDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDClipRestrictionsTask;
  v9 = [(ASDClipRestrictionsTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dictionary, a3);
    objc_storeStrong((id *)&v10->_verificationDate, a4);
    -[ASDClipRestrictionsTask _verifyRequest]((uint64_t)v10);
  }

  return v10;
}

- (void)_verifyRequest
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 16) objectForKeyedSubscript:@"attributes"];
  v3 = [v2 objectForKeyedSubscript:@"appContentRatingsBySystem"];
  v4 = [v3 objectForKeyedSubscript:@"appsApple"];
  v5 = [v4 objectForKeyedSubscript:@"value"];

  if (v5)
  {
    v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_INFO, "Performing age verification", (uint8_t *)&v39, 2u);
    }

    id v7 = [MEMORY[0x1E4F74230] sharedConnection];
    id v8 = [v7 effectiveValueForSetting:*MEMORY[0x1E4F740B0]];

    uint64_t v9 = [v8 integerValue];
    v10 = [*(id *)(a1 + 16) objectForKeyedSubscript:@"attributes"];
    v11 = [v10 objectForKeyedSubscript:@"appContentRatingsBySystem"];
    objc_super v12 = [v11 objectForKeyedSubscript:@"appsApple"];
    v13 = [v12 objectForKeyedSubscript:@"value"];

    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = [v13 integerValue];
    }
    else {
      uint64_t v14 = 0;
    }
    v16 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v39 = 134218240;
      uint64_t v40 = v14;
      __int16 v41 = 2048;
      uint64_t v42 = v9;
      _os_log_impl(&dword_19BF6A000, v16, OS_LOG_TYPE_INFO, "Verfiying app rank: %ld to restrictionsRank: %ld", (uint8_t *)&v39, 0x16u);
    }

    if (v14 <= v9)
    {
      uint64_t v15 = 0;
    }
    else
    {
      v17 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v39) = 0;
        _os_log_error_impl(&dword_19BF6A000, v17, OS_LOG_TYPE_ERROR, "Age verificaton failed", (uint8_t *)&v39, 2u);
      }

      uint64_t v15 = 1;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  v18 = [*(id *)(a1 + 16) objectForKeyedSubscript:@"attributes"];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"permissions"];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [*(id *)(a1 + 16) objectForKeyedSubscript:@"attributes"];
    v22 = [v21 objectForKeyedSubscript:@"permissions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [*(id *)(a1 + 16) objectForKeyedSubscript:@"attributes"];
      v24 = [v23 objectForKeyedSubscript:@"permissions"];
      int v25 = [v24 containsObject:@"koreanAgeVerification"];

      if (!v25) {
        goto LABEL_41;
      }
      v26 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v18 = objc_msgSend(v26, "ams_activeiTunesAccount");

      if (!v18)
      {
        v27 = ASDLogHandleForCategory(13);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v39) = 0;
          _os_log_error_impl(&dword_19BF6A000, v27, OS_LOG_TYPE_ERROR, "AppStore account required to verify Korean age verification", (uint8_t *)&v39, 2u);
        }
      }
      v28 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_19BF6A000, v28, OS_LOG_TYPE_INFO, "Performing Korean age verification", (uint8_t *)&v39, 2u);
      }

      v21 = objc_msgSend(v18, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E4F4D9C0]);
      if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v21, "longLongValue") / 1000));
      }
      else
      {
        v20 = 0;
      }
      v29 = *(void **)(a1 + 24);
      if (v29)
      {
        id v30 = v29;
      }
      else
      {
        id v30 = [MEMORY[0x1E4F1C9C8] date];
      }
      v22 = v30;

      v31 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v39 = 138412546;
        uint64_t v40 = (uint64_t)v22;
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)v20;
        _os_log_impl(&dword_19BF6A000, v31, OS_LOG_TYPE_INFO, "Verfiying currentDate: %@ is before expirationDate: %@", (uint8_t *)&v39, 0x16u);
      }

      if (!v20 || [v22 compare:v20] != -1)
      {
        v32 = ASDLogHandleForCategory(13);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v39) = 0;
          _os_log_error_impl(&dword_19BF6A000, v32, OS_LOG_TYPE_ERROR, "Korean age verification failed", (uint8_t *)&v39, 2u);
        }

        v15 |= 2uLL;
      }
    }
  }
LABEL_41:
  v33 = [*(id *)(a1 + 16) objectForKeyedSubscript:@"attributes"];
  v34 = [v33 objectForKeyedSubscript:@"platformAttributes"];
  v35 = [v34 objectForKeyedSubscript:@"ios"];
  v36 = [v35 objectForKeyedSubscript:@"minimumOSVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = [MEMORY[0x1E4F4DC48] productVersion];
    if (v37)
    {
      if ([v36 compare:v37 options:64] == 1) {
        v15 |= 4uLL;
      }
    }
    else
    {
      v38 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v39) = 0;
        _os_log_error_impl(&dword_19BF6A000, v38, OS_LOG_TYPE_ERROR, "Unable to read device OS version, skipping minimum OS version check!", (uint8_t *)&v39, 2u);
      }
    }
  }
  *(void *)(a1 + 8) = v15;
}

- (ASDClipRestrictionsTask)initWithClipRequest:(id)a3
{
  v4 = [a3 dictionary];
  v5 = [(ASDClipRestrictionsTask *)self initWithDictionary:v4 verificationDate:0];

  return v5;
}

- (ASDClipRestrictionsTask)initWithClipRequest:(id)a3 verificationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASDClipRestrictionsTask;
  id v8 = [(ASDClipRestrictionsTask *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 dictionary];
    uint64_t v10 = [v9 copy];
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSDictionary *)v10;

    objc_storeStrong((id *)&v8->_verificationDate, a4);
    -[ASDClipRestrictionsTask _verifyRequest]((uint64_t)v8);
  }

  return v8;
}

- (BOOL)hasErrorStatus
{
  return [(ASDClipRestrictionsTask *)self responseCode] != 0;
}

- (BOOL)hasResponseFlag:(int64_t)a3
{
  return ([(ASDClipRestrictionsTask *)self responseCode] & a3) != 0;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationDate, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end