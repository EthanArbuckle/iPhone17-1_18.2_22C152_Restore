@interface NSMutableURLRequest(AppleAccount)
- (id)aa_setXMLBodyWithParameters:()AppleAccount;
- (uint64_t)aa_addAppProvidedContext:()AppleAccount;
- (uint64_t)aa_addAuthTokenOrBasicAuthHeaderWithAccount:()AppleAccount preferUsingPassword:;
- (uint64_t)aa_addDeviceInternalDevHeaderIfEnabled;
- (uint64_t)aa_addDeviceProvisioningInfoHeadersWithDSID:()AppleAccount;
- (uint64_t)aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:()AppleAccount;
- (uint64_t)aa_addGrandSlamAuthorizationHeaderWithAccount:()AppleAccount grandslamToken:;
- (uint64_t)aa_addGrandslamAuthorizationHeaderWithAltDSID:()AppleAccount grandslamToken:;
- (uint64_t)aa_addGrandslamAuthorizationheaderWithAltDSID:()AppleAccount heartbeatToken:;
- (uint64_t)aa_addLocationSharingAllowedHeader;
- (void)aa_addAltDSIDAndRepairStateWithAccount:()AppleAccount;
- (void)aa_addBasicAuthPasswordWithAccount:()AppleAccount;
- (void)aa_addBasicAuthorizationHeaderWithAccount:()AppleAccount authToken:;
- (void)aa_addBasicAuthorizationHeaderWithAccount:()AppleAccount preferUsingPassword:;
- (void)aa_addClientInfoHeaders;
- (void)aa_addContentTypeHeaders:()AppleAccount;
- (void)aa_addDeviceIDHeader;
- (void)aa_addDeviceProvisioningInfoHeadersWithAccount:()AppleAccount;
- (void)aa_addDeviceProvisioningInfoHeadersWithDSID:()AppleAccount sendEmptyValues:;
- (void)aa_addLoggedInAppleIDHeaderWithAccount:()AppleAccount;
- (void)aa_addMultiUserDeviceHeaderIfEnabled;
- (void)aa_addProxiedAuthHeaderWithAccount:()AppleAccount;
- (void)aa_addSpyglassModeHeaderWithMask:()AppleAccount;
- (void)aa_addTokenAuthHeaderWithAccount:()AppleAccount;
- (void)aa_setBodyWithParameters:()AppleAccount;
- (void)aa_setJSONBodyWithParameters:()AppleAccount;
- (void)aa_setXMLBodyWithParameters:()AppleAccount signingSession:;
- (void)aa_signBodyData:()AppleAccount withSigningSession:;
@end

@implementation NSMutableURLRequest(AppleAccount)

- (void)aa_addTokenAuthHeaderWithAccount:()AppleAccount
{
  v4 = NSString;
  id v5 = a3;
  v6 = objc_msgSend(v5, "aa_personID");
  v7 = objc_msgSend(v5, "aa_authToken");

  v8 = [v4 stringWithFormat:@"%@:%@", v6, v7];

  v9 = [v8 dataUsingEncoding:4];
  v10 = [v9 base64EncodedStringWithOptions:0];

  v11 = [NSString stringWithFormat:@"X-MobileMe-AuthToken %@", v10];
  v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Using token auth", buf, 2u);
  }

  [a1 setValue:v11 forHTTPHeaderField:@"Authorization"];
}

- (void)aa_addBasicAuthPasswordWithAccount:()AppleAccount
{
  v4 = NSString;
  id v5 = a3;
  v6 = [v5 username];
  v7 = objc_msgSend(v5, "aa_password");

  v8 = [v4 stringWithFormat:@"%@:%@", v6, v7];

  v9 = [v8 dataUsingEncoding:4];
  v10 = [v9 base64EncodedStringWithOptions:0];

  v11 = [NSString stringWithFormat:@"Basic %@", v10];
  v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
  }

  [a1 setValue:v11 forHTTPHeaderField:@"Authorization"];
}

- (void)aa_addAltDSIDAndRepairStateWithAccount:()AppleAccount
{
  id v8 = a3;
  v4 = objc_msgSend(v8, "aa_altDSID");
  if (v4) {
    [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-ADSID"];
  }
  id v5 = objc_msgSend(v8, "aa_repairState");
  v6 = v5;
  if (v5)
  {
    v7 = [v5 stringValue];
    [a1 setValue:v7 forHTTPHeaderField:@"X-Apple-I-Repair"];
  }
}

- (void)aa_addBasicAuthorizationHeaderWithAccount:()AppleAccount preferUsingPassword:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (a4)
    {
      uint64_t v8 = [v6 username];
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(v7, "aa_password");

        if (v10)
        {
          v11 = NSString;
          v12 = [v7 username];
          v13 = objc_msgSend(v7, "aa_password");
          v14 = [v11 stringWithFormat:@"%@:%@", v12, v13];

          v15 = _AALogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
          }

          if (![MEMORY[0x1E4F47018] isInternalBuild]) {
            goto LABEL_27;
          }
          v16 = _AALogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
LABEL_25:
            v36 = objc_msgSend(v7, "aa_password");
            v37 = [v36 unredactedSuffixOfLength:4];
            *(_DWORD *)buf = 138412290;
            v44 = v37;
            _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Using PET: %@", buf, 0xCu);
          }
LABEL_26:

LABEL_27:
          if (v14)
          {
            v38 = [v14 dataUsingEncoding:4];
            v39 = [v38 base64EncodedStringWithOptions:0];

            v40 = [NSString stringWithFormat:@"Basic %@", v39];
            if ([MEMORY[0x1E4F47018] isInternalBuild])
            {
              v41 = _AALogSystem();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v14;
                _os_log_impl(&dword_1A11D8000, v41, OS_LOG_TYPE_DEFAULT, "Authentication Header before Base64: %@", buf, 0xCu);
              }

              v42 = _AALogSystem();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v40;
                _os_log_impl(&dword_1A11D8000, v42, OS_LOG_TYPE_DEFAULT, "Authentication Header after Base64: %@", buf, 0xCu);
              }
            }
            [a1 setValue:v40 forHTTPHeaderField:@"Authorization"];
          }
          goto LABEL_35;
        }
      }
      uint64_t v23 = objc_msgSend(v7, "aa_personID");
      if (v23)
      {
        v24 = (void *)v23;
        v25 = objc_msgSend(v7, "aa_authToken");

        if (v25)
        {
          v26 = NSString;
          v27 = objc_msgSend(v7, "aa_personID");
          v28 = objc_msgSend(v7, "aa_authToken");
          v14 = [v26 stringWithFormat:@"%@:%@", v27, v28];

          v16 = _AALogSystem();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_26;
          }
          *(_WORD *)buf = 0;
          goto LABEL_18;
        }
      }
    }
    else
    {
      uint64_t v17 = objc_msgSend(v6, "aa_personID");
      if (v17)
      {
        v18 = (void *)v17;
        v19 = objc_msgSend(v7, "aa_authToken");

        if (v19)
        {
          v20 = NSString;
          v21 = objc_msgSend(v7, "aa_personID");
          v22 = objc_msgSend(v7, "aa_authToken");
          v14 = [v20 stringWithFormat:@"%@:%@", v21, v22];

          v16 = _AALogSystem();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_26;
          }
          *(_WORD *)buf = 0;
LABEL_18:
          _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Using token auth (basic)", buf, 2u);
          goto LABEL_26;
        }
      }
      uint64_t v29 = [v7 username];
      if (v29)
      {
        v30 = (void *)v29;
        v31 = objc_msgSend(v7, "aa_password");

        if (v31)
        {
          v32 = NSString;
          v33 = [v7 username];
          v34 = objc_msgSend(v7, "aa_password");
          v14 = [v32 stringWithFormat:@"%@:%@", v33, v34];

          v35 = _AALogSystem();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A11D8000, v35, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
          }

          if (![MEMORY[0x1E4F47018] isInternalBuild]) {
            goto LABEL_27;
          }
          v16 = _AALogSystem();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_26;
          }
          goto LABEL_25;
        }
      }
    }
LABEL_35:
    objc_msgSend(a1, "aa_addAltDSIDAndRepairStateWithAccount:", v7);
  }
}

- (void)aa_addBasicAuthorizationHeaderWithAccount:()AppleAccount authToken:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Signing Request with basic authoriation w/ authToken", buf, 2u);
    }

    v10 = NSString;
    v11 = objc_msgSend(v6, "aa_personID");
    v12 = [v10 stringWithFormat:@"%@:%@", v11, v8];

    v13 = [v12 dataUsingEncoding:4];
    v14 = [v13 base64EncodedStringWithOptions:0];

    v15 = [NSString stringWithFormat:@"Basic %@", v14];
    [a1 setValue:v15 forHTTPHeaderField:@"Authorization"];
    objc_msgSend(a1, "aa_addAltDSIDAndRepairStateWithAccount:", v6);
  }
  else if (v6)
  {
    objc_msgSend(a1, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v6, 0);
  }
}

- (uint64_t)aa_addAuthTokenOrBasicAuthHeaderWithAccount:()AppleAccount preferUsingPassword:
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    uint64_t v8 = [v6 username];
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(v7, "aa_password"),
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      uint64_t v11 = objc_msgSend(v7, "aa_personID");
      if (!v11
        || (v12 = (void *)v11,
            objc_msgSend(v7, "aa_authToken"),
            v13 = objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            !v13))
      {
        v14 = _AALogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v25 = 0;
          v15 = (uint8_t *)&v25;
LABEL_17:
          _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Unable to add auth header. No pertinent information in account.", v15, 2u);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      goto LABEL_10;
    }
LABEL_13:
    objc_msgSend(a1, "aa_addBasicAuthPasswordWithAccount:", v7);
    goto LABEL_14;
  }
  uint64_t v16 = objc_msgSend(v6, "aa_personID");
  if (!v16
    || (uint64_t v17 = (void *)v16,
        objc_msgSend(v7, "aa_authToken"),
        v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    uint64_t v19 = [v7 username];
    if (!v19
      || (v20 = (void *)v19,
          objc_msgSend(v7, "aa_password"),
          v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          v20,
          !v21))
    {
      v14 = _AALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = 0;
        v15 = (uint8_t *)&v24;
        goto LABEL_17;
      }
LABEL_18:

      uint64_t v22 = 0;
      goto LABEL_19;
    }
    goto LABEL_13;
  }
LABEL_10:
  objc_msgSend(a1, "aa_addTokenAuthHeaderWithAccount:", v7);
LABEL_14:
  objc_msgSend(a1, "aa_addAltDSIDAndRepairStateWithAccount:", v7);
  uint64_t v22 = 1;
LABEL_19:

  return v22;
}

- (void)aa_setBodyWithParameters:()AppleAccount
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:100 options:0 error:&v7];
  id v5 = v7;
  if (v4)
  {
    [a1 setHTTPBody:v4];
  }
  else
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Error adding body %@", buf, 0xCu);
    }
  }
}

- (id)aa_setXMLBodyWithParameters:()AppleAccount
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:100 options:0 error:&v8];
  id v5 = v8;
  if (v4)
  {
    [a1 setHTTPBody:v4];
    [a1 setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  }
  else
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Error adding body %@", buf, 0xCu);
    }
  }

  return v4;
}

- (void)aa_setJSONBodyWithParameters:()AppleAccount
{
  v8[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8[0] = 0;
  id v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:v8];
  id v6 = v8[0];
  if (v6)
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSMutableURLRequest(AppleAccount) aa_setJSONBodyWithParameters:]((uint64_t)v6, v7);
    }
  }
  else
  {
    [a1 setHTTPBody:v5];
    [a1 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  }
}

- (void)aa_signBodyData:()AppleAccount withSigningSession:
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a4, "signatureForData:");
  id v6 = [v5 base64EncodedStringWithOptions:0];
  [a1 setValue:v6 forHTTPHeaderField:@"X-Mme-Nas-Qualify"];
  id v7 = _AALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "X-Mme-Nas-Qualify: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)aa_setXMLBodyWithParameters:()AppleAccount signingSession:
{
  id v6 = a4;
  objc_msgSend(a1, "aa_setXMLBodyWithParameters:", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aa_signBodyData:withSigningSession:", v7, v6);
}

- (uint64_t)aa_addGrandSlamAuthorizationHeaderWithAccount:()AppleAccount grandslamToken:
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a3, "aa_personID");
  int v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  if (!v9)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%@:%@", v7, v6];
    v12 = [v11 dataUsingEncoding:4];
    v13 = [v12 base64EncodedStringWithOptions:0];

    [a1 setValue:v13 forHTTPHeaderField:@"X-Apple-GS-Token"];
    v14 = [NSString stringWithFormat:@"Basic %@", v13];
    [a1 setValue:v14 forHTTPHeaderField:@"Authorization"];
  }
  return v10;
}

- (uint64_t)aa_addGrandslamAuthorizationHeaderWithAltDSID:()AppleAccount grandslamToken:
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = !v4;
  if (!v4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@:%@", a3, a4];
    int v8 = [v7 dataUsingEncoding:4];
    BOOL v9 = [v8 base64EncodedStringWithOptions:0];

    [a1 setValue:v9 forHTTPHeaderField:@"X-Apple-GS-Token"];
  }
  return v5;
}

- (uint64_t)aa_addGrandslamAuthorizationheaderWithAltDSID:()AppleAccount heartbeatToken:
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = !v4;
  if (!v4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@:%@", a3, a4];
    int v8 = [v7 dataUsingEncoding:4];
    BOOL v9 = [v8 base64EncodedStringWithOptions:0];

    [a1 setValue:v9 forHTTPHeaderField:@"X-Apple-HB-Token"];
  }
  return v5;
}

- (void)aa_addDeviceProvisioningInfoHeadersWithAccount:()AppleAccount
{
  objc_msgSend(a3, "aa_personID");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v4);
}

- (uint64_t)aa_addDeviceProvisioningInfoHeadersWithDSID:()AppleAccount
{
  return objc_msgSend(a1, "aa_addDeviceProvisioningInfoHeadersWithDSID:sendEmptyValues:", a3, 0);
}

- (void)aa_addDeviceProvisioningInfoHeadersWithDSID:()AppleAccount sendEmptyValues:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [[AADeviceProvisioningSession alloc] initWithDSID:v6];
    [(AADeviceProvisioningSession *)v7 addProvisioningInfoToURLRequest:a1 sendEmptyValues:a4];
  }
  else
  {
    int v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "BADNESS!!! No DSID passed to aa_addDeviceProvisioningInfoHeadersWithDSID: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (uint64_t)aa_addDeviceInternalDevHeaderIfEnabled
{
  Boolean keyExistsAndHasValidFormat = 1;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"AAUISendInternalDevHeader", @"com.apple.appleaccount", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = result == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    uint64_t result = [MEMORY[0x1E4F47018] isInternalBuild];
    if (result) {
      return [a1 setValue:@"true" forHTTPHeaderField:@"X-Mme-Setup-AEBB-653C-D843-8834"];
    }
  }
  return result;
}

- (void)aa_addDeviceIDHeader
{
  v2 = objc_alloc_init(AADeviceInfo);
  if (v2)
  {
    BOOL v3 = _AALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Adding device udid to the request header", v5, 2u);
    }

    id v4 = [(AADeviceInfo *)v2 udid];
    [a1 setValue:v4 forHTTPHeaderField:@"X-Mme-Device-Id"];
  }
}

- (void)aa_addMultiUserDeviceHeaderIfEnabled
{
  if (aa_addMultiUserDeviceHeaderIfEnabled_onceToken != -1) {
    dispatch_once(&aa_addMultiUserDeviceHeaderIfEnabled_onceToken, &__block_literal_global_18);
  }
  if (aa_addMultiUserDeviceHeaderIfEnabled_isMultiUserDevice == 1)
  {
    [a1 setValue:@"true" forHTTPHeaderField:@"X-MMe-Multi-User"];
  }
}

- (void)aa_addLoggedInAppleIDHeaderWithAccount:()AppleAccount
{
  if (a3)
  {
    id v4 = [a3 username];
    [a1 setValue:v4 forHTTPHeaderField:@"X-MMe-LoggedIn-AppleID"];
  }
}

- (uint64_t)aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:()AppleAccount
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F18D28];
  id v6 = [v4 allHeaderFields];
  uint64_t v7 = [a1 URL];
  int v8 = [v5 cookiesWithResponseHeaderFields:v6 forURL:v7];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v10)
  {

    v13 = 0;
LABEL_20:
    uint64_t v28 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = v10;
  v30 = a1;
  unsigned __int8 v12 = 0;
  v13 = 0;
  uint64_t v14 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v17 = objc_msgSend(v16, "name", v30);
      int v18 = [v17 isEqualToString:@"dsid"];

      if (v18)
      {
        uint64_t v19 = [v16 value];

        v13 = (void *)v19;
      }
      else
      {
        v20 = [v16 name];
        if ([v20 isEqualToString:@"hsa-action"])
        {
          v21 = [v16 value];
          char v22 = [v21 isEqualToString:@"LinkiTunes"];
        }
        else
        {
          char v22 = 0;
        }

        v12 |= v22;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v11);

  if (((v13 != 0) & v12) != 1) {
    goto LABEL_20;
  }
  uint64_t v23 = _AALogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v23, OS_LOG_TYPE_DEFAULT, "Server is asking for device provisioning information", buf, 2u);
  }

  __int16 v24 = [v30 allHTTPHeaderFields];
  unint64_t v25 = [v24 count];

  objc_msgSend(v30, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v13);
  v26 = [v30 allHTTPHeaderFields];
  unint64_t v27 = [v26 count];

  if (v27 <= v25) {
    goto LABEL_20;
  }
  uint64_t v28 = 1;
LABEL_21:

  return v28;
}

- (void)aa_addClientInfoHeaders
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = +[AADeviceInfo userAgentHeader];
  [a1 setValue:v2 forHTTPHeaderField:@"User-Agent"];

  BOOL v3 = +[AADeviceInfo clientInfoHeader];
  [a1 setValue:v3 forHTTPHeaderField:@"X-MMe-Client-Info"];

  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F1C400]];
  id v6 = [v5 uppercaseString];
  [a1 setValue:v6 forHTTPHeaderField:@"X-MMe-Country"];

  uint64_t v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v8 = [v7 componentsJoinedByString:@","];
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = @"en";
  }
  [a1 setValue:v10 forHTTPHeaderField:@"X-MMe-Language"];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CA20];
  unsigned __int8 v12 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  v16[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v14 = [v11 minimizedLanguagesFromLanguages:v13];
  v15 = [v14 componentsJoinedByString:@","];

  [a1 setValue:v15 forHTTPHeaderField:@"Accept-Language"];
}

- (void)aa_addContentTypeHeaders:()AppleAccount
{
  id v4 = a3;
  [a1 setValue:v4 forHTTPHeaderField:@"Content-Type"];
  [a1 setValue:v4 forHTTPHeaderField:@"Accept"];
}

- (uint64_t)aa_addLocationSharingAllowedHeader
{
  if (MGGetBoolAnswer()) {
    v2 = @"true";
  }
  else {
    v2 = @"false";
  }

  return [a1 setValue:v2 forHTTPHeaderField:@"X-MMe-FMFAllowed"];
}

- (void)aa_addProxiedAuthHeaderWithAccount:()AppleAccount
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [v5 username];
  uint64_t v7 = objc_msgSend(v5, "aa_password");

  uint64_t v8 = [v4 stringWithFormat:@"%@:%@", v6, v7];

  id v9 = [v8 dataUsingEncoding:4];
  uint64_t v10 = [v9 base64EncodedStringWithOptions:0];

  uint64_t v11 = [NSString stringWithFormat:@"Basic %@", v10];
  [a1 setValue:v11 forHTTPHeaderField:@"Authorization-Proxied"];
  unsigned __int8 v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Using proxied auth credentials", buf, 2u);
  }
}

- (uint64_t)aa_addAppProvidedContext:()AppleAccount
{
  return [a1 setValue:a3 forHTTPHeaderField:@"X-Apple-I-App-Provided-Context"];
}

- (void)aa_addSpyglassModeHeaderWithMask:()AppleAccount
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-I-Spyglass-Mode"];
}

- (void)aa_setJSONBodyWithParameters:()AppleAccount .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "JSON Serialization exception: %@\nInvalid JSON input: %@", buf, 0x16u);
}

- (void)aa_setJSONBodyWithParameters:()AppleAccount .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize request parameters! Error: %@", (uint8_t *)&v2, 0xCu);
}

@end