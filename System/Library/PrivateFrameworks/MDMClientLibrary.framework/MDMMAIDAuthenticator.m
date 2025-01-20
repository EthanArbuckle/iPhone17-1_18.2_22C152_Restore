@interface MDMMAIDAuthenticator
- (BOOL)authenticateRequest:(id)a3 error:(id *)a4;
- (BOOL)prepareTask:(id)a3 error:(id *)a4;
- (MDMMAIDAuthenticator)initWithRMAccountID:(id)a3;
- (NSString)rmAccountID;
- (id)_appleIDContext;
- (void)setRmAccountID:(id)a3;
@end

@implementation MDMMAIDAuthenticator

- (MDMMAIDAuthenticator)initWithRMAccountID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDMMAIDAuthenticator;
  v6 = [(MDMMAIDAuthenticator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rmAccountID, a3);
  }

  return v7;
}

- (BOOL)authenticateRequest:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(MDMMAIDAuthenticator *)self rmAccountID];
  v7 = +[MDMAccountUtilities maidPropertiesForRMAccountID:v6];

  v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = v7;
  v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __sortKeysAndMakeCommaSeparatedString_block_invoke;
  v41 = &unk_1E6CBCD90;
  id v42 = v10;
  id v11 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:buf];

  v12 = [v11 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  v13 = [v12 componentsJoinedByString:@", "];

  [v5 setValue:v13 forHTTPHeaderField:*MEMORY[0x1E4F5E6D0]];
  objc_msgSend(v5, "ak_addDeviceUDIDHeader");
  objc_msgSend(v5, "ak_addClientInfoHeader");
  objc_msgSend(v5, "ak_addDeviceSerialNumberHeader");
  v14 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F5E6E8]];
  v15 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F5E700]];
  v16 = v15;
  if (v14 && v15)
  {
    id v17 = v15;
    if (coerceIntoString_onceToken != -1) {
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_81);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = [v17 stringValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = [(id)coerceIntoString_dateFormatter stringFromDate:v17];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v17 base64EncodedStringWithOptions:0];
          }
          else {
          id v18 = [v17 description];
          }
        }
      }
    }
    v20 = v18;

    id v21 = v14;
    if (coerceIntoString_onceToken != -1) {
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_81);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = v21;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = [v21 stringValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = [(id)coerceIntoString_dateFormatter stringFromDate:v21];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v21 base64EncodedStringWithOptions:0];
          }
          else {
          id v22 = [v21 description];
          }
        }
      }
    }
    v23 = v22;

    objc_msgSend(v5, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v20, v23);
  }
  else
  {
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1DD340000, v19, OS_LOG_TYPE_ERROR, "Missing short-lived token details for RM account: altDSID: %{public}@, token: %{public}@", buf, 0x16u);
    }
  }
  v24 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F5E6F0]];
  uint64_t v25 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F5E6F8]];
  v26 = (void *)v25;
  if (v24 && v25)
  {
    v27 = NSString;
    id v28 = v24;
    if (coerceIntoString_onceToken != -1) {
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_81);
    }
    objc_opt_class();
    v39 = v27;
    if (objc_opt_isKindOfClass())
    {
      id v29 = v28;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = [v28 stringValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = [(id)coerceIntoString_dateFormatter stringFromDate:v28];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v28 base64EncodedStringWithOptions:0];
          }
          else {
          id v29 = [v28 description];
          }
        }
      }
    }
    v31 = v29;

    id v32 = v26;
    if (coerceIntoString_onceToken != -1) {
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_81);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v33 = v32;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = [v32 stringValue];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v33 = [(id)coerceIntoString_dateFormatter stringFromDate:v32];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v32 base64EncodedStringWithOptions:0];
          }
          else {
          id v33 = [v32 description];
          }
        }
      }
    }
    v34 = v33;

    v35 = [v39 stringWithFormat:@"%@:%@", v31, v34];

    v36 = [v35 dataUsingEncoding:4];
    v37 = [v36 base64EncodedStringWithOptions:0];
    [v5 setValue:v37 forHTTPHeaderField:*MEMORY[0x1E4F5E6E0]];
  }
  else
  {
    v30 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      _os_log_impl(&dword_1DD340000, v30, OS_LOG_TYPE_ERROR, "Missing long-lived token details for RM account: dsid: %{public}@, token: %{public}@", buf, 0x16u);
    }
  }

  return 1;
}

- (BOOL)prepareTask:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    v6 = [(MDMMAIDAuthenticator *)self _appleIDContext];
    [v5 _setAppleIDContext:v6];
  }
  return 1;
}

- (id)_appleIDContext
{
  if (_appleIDContext_onceToken != -1) {
    dispatch_once(&_appleIDContext_onceToken, &__block_literal_global_4);
  }
  id v3 = (id)_appleIDContext_lock;
  objc_sync_enter(v3);
  v4 = objc_getAssociatedObject(self, @"AssociatedKeyAppleIDContext");
  if (!v4)
  {
    DMCAKAppleIDSession();
    v4 = objc_opt_new();
    objc_setAssociatedObject(self, @"AssociatedKeyAppleIDContext", v4, (void *)0x301);
  }
  objc_sync_exit(v3);

  return v4;
}

uint64_t __39__MDMMAIDAuthenticator__appleIDContext__block_invoke()
{
  _appleIDContext_lock = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (NSString)rmAccountID
{
  return self->_rmAccountID;
}

- (void)setRmAccountID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end