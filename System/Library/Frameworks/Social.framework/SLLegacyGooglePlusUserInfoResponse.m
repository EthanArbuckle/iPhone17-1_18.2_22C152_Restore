@interface SLLegacyGooglePlusUserInfoResponse
- (void)_populateDataFromResponseDictionary:(id)a3;
@end

@implementation SLLegacyGooglePlusUserInfoResponse

- (void)_populateDataFromResponseDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(SLWebUserInfoResponse *)self setUserInfo:v5];
  _SLLog(v3, 7, @"SLLegacyGooglePlusUserInfoResponse got _userInfo: %@");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", @"displayName", v5);
  [(SLWebUserInfoResponse *)self setDisplayName:v6];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v25 = v5;
  v7 = [v5 objectForKeyedSubscript:@"emails"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v13 = [v12 objectForKeyedSubscript:@"type"];
        if ([v13 isEqualToString:@"account"])
        {
        }
        else
        {
          v14 = [(SLWebUserInfoResponse *)self emailAddresses];

          if (v14) {
            continue;
          }
        }
        v15 = [v12 objectForKeyedSubscript:@"value"];
        v30 = v15;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        [(SLWebUserInfoResponse *)self setEmailAddresses:v16];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  v17 = [(SLWebUserInfoResponse *)self emailAddresses];

  if (!v17)
  {
    v24 = v25;
    _SLLog(v3, 3, @"Couldn't get an email address. userInfo was: %@");
  }
  v18 = objc_msgSend(v25, "objectForKeyedSubscript:", @"error", v24);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v20 = [v25 objectForKeyedSubscript:@"error"];
    v21 = [v20 objectForKeyedSubscript:@"message"];
    objc_opt_class();
    char v22 = objc_opt_isKindOfClass();

    if (v22)
    {
      v23 = [v20 objectForKeyedSubscript:@"message"];
      [(SLWebUserInfoResponse *)self setErrorMessage:v23];
    }
  }
}

@end