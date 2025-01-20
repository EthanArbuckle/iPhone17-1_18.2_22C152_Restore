@interface GEOMapsAuthServiceHelper
+ (GEOMapsAuthServiceHelper)sharedAuthHelper;
- (BOOL)_hasMAT;
- (BOOL)_hasMRT;
- (BOOL)isCurrentEnvironmentSecure;
- (GEOMapsAuthServiceHelper)init;
- (id)dictionaryForAuthTokenState;
- (void)_postNotificationSuccess:(void *)a3 requestType:(void *)a4 extraInfo:(uint64_t)a5 waitForKey:(uint64_t)a6 updateKeys:(void *)a7 completion:(void *)a8;
- (void)_refreshFromTask:(char)a3 force:;
- (void)addMapsAuthDidFinishObserver:(id)a3;
- (void)addMapsAuthDidFinishObserver:(id)a3 forRequestType:(id)a4;
- (void)addProxyAuthHeaderOrReAuth:(id)a3 authProxyURL:(id)a4;
- (void)checkNetworkError:(id)a3 sendingGeoDErrorIfApplicable:(int64_t)a4;
- (void)doEnvironmentSwitchCheck:(id)a3 authProxyURL:(id)a4 suppressNotification:(BOOL)a5;
- (void)handleSecureProxyChallenge:(id)a3;
- (void)invalidateTokens;
- (void)refresh:(BOOL)a3;
- (void)refreshFromTask:(id)a3;
- (void)removeMapsAuthDidFinishObserver:(id)a3;
- (void)removeMapsAuthDidFinishObserver:(id)a3 forRequestType:(id)a4;
- (void)renewMapsAuthProxyToken:(unint64_t)a3 fromToken:(id)a4 authProxyURL:(id)a5 suppressNotification:(BOOL)a6;
- (void)requestFeatureFlagsWithURL:(id)a3 suppressNotification:(BOOL)a4;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)sendProxyAuthNotification:(int64_t)a3;
- (void)setConnectionProxyDictionary:(id)a3 url:(id)a4 proxyURL:(id)a5;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation GEOMapsAuthServiceHelper

- (void)checkNetworkError:(id)a3 sendingGeoDErrorIfApplicable:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = +[GEOPlatform sharedPlatform];
    int v8 = [v7 isInternalInstall];

    if (v8)
    {
      v9 = [v6 domain];
      if ([v9 isEqual:*MEMORY[0x1E4F289A0]])
      {
        uint64_t v10 = [v6 code];

        if (v10 == -1003)
        {
          global_queue = geo_get_global_queue();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke;
          block[3] = &unk_1E53D9680;
          block[4] = self;
          id v13 = v6;
          int64_t v14 = a4;
          dispatch_async(global_queue, block);
        }
      }
      else
      {
      }
    }
  }
}

void __44__GEOMapsAuthServiceHelper_sharedAuthHelper__block_invoke()
{
  v0 = objc_alloc_init(GEOMapsAuthServiceHelper);
  v1 = (void *)qword_1EB2A0850;
  qword_1EB2A0850 = (uint64_t)v0;
}

- (GEOMapsAuthServiceHelper)init
{
  v9.receiver = self;
  v9.super_class = (Class)GEOMapsAuthServiceHelper;
  v2 = [(GEOMapsAuthServiceHelper *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentEnvironmentState = 0;
    uint64_t v4 = geo_isolater_create();
    currentEnvironmentStateIsolater = v3->_currentEnvironmentStateIsolater;
    v3->_currentEnvironmentStateIsolater = (geo_isolater *)v4;

    id v6 = +[GEOResourceManifestManager modernManager];
    global_queue = (void *)geo_get_global_queue();
    [v6 addTileGroupObserver:v3 queue:global_queue];
  }
  return v3;
}

+ (GEOMapsAuthServiceHelper)sharedAuthHelper
{
  if (qword_1EB2A0858 != -1) {
    dispatch_once(&qword_1EB2A0858, &__block_literal_global_59_0);
  }
  v2 = (void *)qword_1EB2A0850;

  return (GEOMapsAuthServiceHelper *)v2;
}

- (id)dictionaryForAuthTokenState
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [NSNumber numberWithBool:-[GEOMapsAuthServiceHelper _hasMAT]((uint64_t)self)];
  [v3 setObject:v4 forKey:@"Has MAT"];

  v5 = [NSNumber numberWithBool:-[GEOMapsAuthServiceHelper _hasMRT]((uint64_t)self)];
  [v3 setObject:v5 forKey:@"Has MRT"];

  return v3;
}

- (BOOL)_hasMRT
{
  if (!a1) {
    return 0;
  }
  v1 = _getValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98, 1, 0, 0, 0);
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)_hasMAT
{
  if (!a1) {
    return 0;
  }
  v1 = _getValue(GeoServicesConfig_MapsAuthToken, (uint64_t)off_1E9113A88, 1, 0, 0, 0);
  BOOL v2 = v1 != 0;

  return v2;
}

- (void)addMapsAuthDidFinishObserver:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 addObserver:v4 selector:sel_mapsAuthTokenRequestDidFinish_ name:@"MapsAuthDidFinishNotification" object:0];
}

- (void)addMapsAuthDidFinishObserver:(id)a3 forRequestType:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultCenter];
  [v8 addObserver:v7 selector:sel_mapsAuthTokenRequestDidFinish_ name:@"MapsAuthDidFinishNotification" object:v6];
}

- (void)removeMapsAuthDidFinishObserver:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4 name:@"MapsAuthDidFinishNotification" object:0];
}

- (void)removeMapsAuthDidFinishObserver:(id)a3 forRequestType:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultCenter];
  [v8 removeObserver:v7 name:@"MapsAuthDidFinishNotification" object:v6];
}

- (void)sendProxyAuthNotification:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__GEOMapsAuthServiceHelper_sendProxyAuthNotification___block_invoke;
  v3[3] = &__block_descriptor_40_e39_v16__0___GEOUserNotificationProvider__8l;
  v3[4] = a3;
  objc_msgSend(MEMORY[0x1E4F29268], "geo_withMapsNotificationProviderDaemon:errorHandler:", v3, &__block_literal_global_69_0);
}

uint64_t __54__GEOMapsAuthServiceHelper_sendProxyAuthNotification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 proxyAuthFailed:*(void *)(a1 + 32)];
}

- (void)renewMapsAuthProxyToken:(unint64_t)a3 fromToken:(id)a4 authProxyURL:(id)a5 suppressNotification:(BOOL)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v11 = (__CFString *)a5;
  if (a3) {
    v12 = @"mrt";
  }
  else {
    v12 = @"actoken";
  }
  if ((atomic_exchange(&self->_isRenewing._Value, 1u) & 1) == 0)
  {
    currentToken = self->_currentToken;
    self->_currentToken = &v12->isa;

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __96__GEOMapsAuthServiceHelper_renewMapsAuthProxyToken_fromToken_authProxyURL_suppressNotification___block_invoke;
    v31[3] = &unk_1E53F6A70;
    v31[4] = self;
    v32 = v12;
    int64_t v14 = (void (**)(void, void))MEMORY[0x18C120660](v31);
    v15 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v12;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "renewing token %@", buf, 0xCu);
    }

    if (a3 != 1 || v10)
    {
      if (a3 || !v10)
      {
LABEL_28:

        goto LABEL_29;
      }
      _setValue(GeoServicesConfig_MapsAuthToken, (uint64_t)off_1E9113A88, 0, 0, 0);
      v17 = [v10 dataUsingEncoding:4];
      uint64_t v22 = [v17 base64EncodedStringWithOptions:0];

      v35 = @"actoken";
      uint64_t v36 = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      _buildRequest(v11, @"v2/actoken", v23, 0);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v10 = (id)v22;
    }
    else
    {
      uint64_t v16 = _getValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98, 1, 0, 0, 0);
      if (!v16)
      {
        if (!a6)
        {
          v28 = GEOGetMapsProxyAuthLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "sending proxy notificaiton for bad mrt because mrt is nil", buf, 2u);
          }

          [(GEOMapsAuthServiceHelper *)self sendProxyAuthNotification:2];
        }
        v14[2](v14, 2);
        id v10 = 0;
        goto LABEL_28;
      }
      id v10 = (id)v16;
      _setValue(GeoServicesConfig_MapsAuthToken, (uint64_t)off_1E9113A88, 0, 0, 0);
      v33 = @"mrt";
      id v34 = v10;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      _buildRequest(v11, @"v2/mrt", v17, 0);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    if (v18)
    {
      v24 = _defaultURLSession();
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __96__GEOMapsAuthServiceHelper_renewMapsAuthProxyToken_fromToken_authProxyURL_suppressNotification___block_invoke_74;
      v29[3] = &unk_1E53F6A98;
      v29[4] = self;
      v29[5] = a3;
      BOOL v30 = a6;
      v25 = [v24 dataTaskWithRequest:v18 completionHandler:v29];
      if (!v25)
      {
        v26 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v18;
          _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_ERROR, "token exhange task is nil, request was %@", buf, 0xCu);
        }

        v14[2](v14, 0);
      }
      [v25 resume];
    }
    else
    {
      v27 = GEOGetMapsProxyAuthLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v11;
        _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_ERROR, "Unable to build request for URL: %@", buf, 0xCu);
      }

      v14[2](v14, 5);
    }

    goto LABEL_28;
  }
  v19 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = self->_currentToken;
    *(_DWORD *)buf = 138412546;
    v40 = (__CFString *)v20;
    __int16 v41 = 2112;
    v42 = v12;
    _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "already renewing token %@, will not renew %@", buf, 0x16u);
  }

  if (([(NSString *)self->_currentToken isEqual:v12] & 1) == 0)
  {
    v37 = @"failReason";
    v38 = &unk_1ED73EB78;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    [(GEOMapsAuthServiceHelper *)(uint64_t)self _postNotificationSuccess:v12 requestType:v21 extraInfo:GEOConfigKey_Invalid waitForKey:unk_1E91186C0 updateKeys:0 completion:0];
  }
LABEL_29:
}

void __96__GEOMapsAuthServiceHelper_renewMapsAuthProxyToken_fromToken_authProxyURL_suppressNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 8));
  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v10 = @"failReason";
  id v8 = [NSNumber numberWithInteger:a2];
  v11[0] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  if (v7) {
    [(GEOMapsAuthServiceHelper *)v7 _postNotificationSuccess:v6 requestType:v9 extraInfo:GEOConfigKey_Invalid waitForKey:unk_1E91186C0 updateKeys:0 completion:0];
  }
}

void __96__GEOMapsAuthServiceHelper_renewMapsAuthProxyToken_fromToken_authProxyURL_suppressNotification___block_invoke_74(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  id v10 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = _responseDescription(v7);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "auth response: %@", (uint8_t *)&buf, 0xCu);
  }
  v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  int v14 = *(unsigned __int8 *)(a1 + 48);
  id v15 = v7;
  id v16 = v9;
  id v17 = v8;
  if (v12)
  {
    uint64_t v18 = _httpStatusCodeSafe(v15);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v52 = __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke;
    v53 = &unk_1E53F6AC0;
    if (v13) {
      v19 = @"mrt";
    }
    else {
      v19 = @"actoken";
    }
    v54 = v12;
    v55 = v19;
    v20 = (void (**)(void, void, void, void, void, void))MEMORY[0x18C120660](&buf);
    if (!v17 && (unint64_t)(v18 - 200) <= 0x63)
    {
      id v49 = 0;
      v21 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v16 options:0 error:&v49];
      id v22 = v49;
      if (v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v39 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          _responseDescription(v15);
          __int16 v41 = v40 = v16;
          *(_DWORD *)v50 = 138413058;
          *(void *)&v50[4] = v19;
          *(_WORD *)&v50[12] = 2112;
          *(void *)&v50[14] = v21;
          *(_WORD *)&v50[22] = 2112;
          *(void *)&v50[24] = v22;
          *(_WORD *)&v50[32] = 2112;
          *(void *)&v50[34] = v41;
          _os_log_impl(&dword_188D96000, v39, OS_LOG_TYPE_ERROR, "Response for %@ was not a json dict: %@ / %@ (response: %@)", v50, 0x2Au);

          id v16 = v40;
        }

        v20[2](v20, 0, 0, GEOConfigKey_Invalid, unk_1E91186C0, 0);
        goto LABEL_40;
      }
      id v47 = v16;
      v23 = [v21 objectForKey:@"mapsRefreshToken"];
      v24 = [v21 objectForKey:@"mapsAccessToken"];
      if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v43 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = _responseDescription(v15);
          *(_DWORD *)v50 = 138412802;
          *(void *)&v50[4] = v23;
          *(_WORD *)&v50[12] = 2112;
          *(void *)&v50[14] = v24;
          *(_WORD *)&v50[22] = 2112;
          *(void *)&v50[24] = v44;
          _os_log_impl(&dword_188D96000, v43, OS_LOG_TYPE_ERROR, "Response included an invalid type for mrt/mat: %@/%@  (response: %@)", v50, 0x20u);
        }
        goto LABEL_57;
      }
      if (!v13) {
        goto LABEL_61;
      }
      if (v13 != 1)
      {
LABEL_19:
        v25 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v50 = 138412290;
          *(void *)&v50[4] = v19;
          _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_DEBUG, "newTokenResponse succeeded for %@", v50, 0xCu);
        }

        uint64_t v26 = [v24 length];
        if (v26) {
          v27 = &GeoServicesConfig_MapsAuthToken;
        }
        else {
          v27 = &GeoServicesConfig_MapsRefreshToken;
        }
        uint64_t v28 = *v27;
        v29 = (uint64_t *)&off_1E9113A98;
        if (v26) {
          v29 = (uint64_t *)&off_1E9113A88;
        }
        uint64_t v30 = *v29;
        *(void *)v50 = MEMORY[0x1E4F143A8];
        *(void *)&v50[8] = 3221225472;
        *(void *)&v50[16] = __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke_79;
        *(void *)&v50[24] = &unk_1E53D8998;
        *(void *)&v50[32] = v23;
        *(void *)&v50[40] = v24;
        ((void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, unsigned char *))v20)[2](v20, 1, -1, v28, v30, v50);

        goto LABEL_58;
      }
      if (![v24 length])
      {
        uint64_t v43 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v45 = _responseDescription(v15);
          *(_DWORD *)v50 = 138412802;
          *(void *)&v50[4] = v19;
          *(_WORD *)&v50[12] = 2112;
          *(void *)&v50[14] = v21;
          *(_WORD *)&v50[22] = 2112;
          *(void *)&v50[24] = v45;
          v46 = "Response for %@ did not include an mat: %@ (response: %@)";
          goto LABEL_56;
        }
      }
      else
      {
LABEL_61:
        if ([v23 length]) {
          goto LABEL_19;
        }
        uint64_t v43 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v45 = _responseDescription(v15);
          *(_DWORD *)v50 = 138412802;
          *(void *)&v50[4] = v19;
          *(_WORD *)&v50[12] = 2112;
          *(void *)&v50[14] = v21;
          *(_WORD *)&v50[22] = 2112;
          *(void *)&v50[24] = v45;
          v46 = "Response for %@ did not include an mrt: %@ (response: %@)";
LABEL_56:
          _os_log_impl(&dword_188D96000, v43, OS_LOG_TYPE_ERROR, v46, v50, 0x20u);
        }
      }
LABEL_57:

      v20[2](v20, 0, 0, GEOConfigKey_Invalid, unk_1E91186C0, 0);
LABEL_58:

      id v16 = v47;
LABEL_40:

LABEL_48:
      goto LABEL_49;
    }
    v31 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      _responseDescription(v15);
      int v48 = v14;
      id v32 = v15;
      v33 = v20;
      v35 = id v34 = v16;
      *(_DWORD *)v50 = 138413058;
      *(void *)&v50[4] = v19;
      *(_WORD *)&v50[12] = 1024;
      *(_DWORD *)&v50[14] = v18;
      *(_WORD *)&v50[18] = 2112;
      *(void *)&v50[20] = v17;
      *(_WORD *)&v50[28] = 2112;
      *(void *)&v50[30] = v35;
      _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_ERROR, "Response for %@ received status code %d and error %@ (response: %@)", v50, 0x26u);

      id v16 = v34;
      v20 = v33;
      id v15 = v32;
      int v14 = v48;
    }

    if (v13 == 1)
    {
      uint64_t v38 = 2;
      if (!v14) {
        goto LABEL_44;
      }
    }
    else
    {
      if (!v13)
      {
        if (_GEOConfigHasValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98))
        {
          uint64_t v36 = GEOGetMapsProxyAuthLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v37 = _responseDescription(v15);
            *(_DWORD *)v50 = 138412290;
            *(void *)&v50[4] = v37;
            _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_ERROR, "Removing old mrt as ACToken received an error (response: %@)", v50, 0xCu);
          }
          _setValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98, 0, 0, 0);
        }
        uint64_t v38 = 3;
        if (v14) {
          goto LABEL_47;
        }
        goto LABEL_44;
      }
      uint64_t v38 = 0;
      if (!v14)
      {
LABEL_44:
        v42 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v50 = 67109120;
          *(_DWORD *)&v50[4] = v38;
          _os_log_impl(&dword_188D96000, v42, OS_LOG_TYPE_DEBUG, "sending proxy notificaiton for reason: %d", v50, 8u);
        }

        [v12 sendProxyAuthNotification:v38];
      }
    }
LABEL_47:
    v20[2](v20, 0, v38, GEOConfigKey_Invalid, unk_1E91186C0, 0);
    goto LABEL_48;
  }
LABEL_49:
}

void __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  uint64_t v18 = @"failReason";
  uint64_t v13 = NSNumber;
  id v14 = a6;
  id v15 = [v13 numberWithInteger:a3];
  v19[0] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke_2;
  v17[3] = &unk_1E53D79D8;
  v17[4] = *(void *)(a1 + 32);
  [(GEOMapsAuthServiceHelper *)v11 _postNotificationSuccess:v12 requestType:v16 extraInfo:a4 waitForKey:a5 updateKeys:v14 completion:v17];
}

void __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 8));
}

- (void)_postNotificationSuccess:(void *)a3 requestType:(void *)a4 extraInfo:(uint64_t)a5 waitForKey:(uint64_t)a6 updateKeys:(void *)a7 completion:(void *)a8
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = v16;
  if (a1)
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke;
    v42[3] = &unk_1E53F6B60;
    id v44 = v16;
    v42[4] = a1;
    char v45 = a2;
    id v18 = v32;
    id v43 = v18;
    v19 = (void (**)(void))MEMORY[0x18C120660](v42);
    v20 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = "failure";
      *(_DWORD *)long long buf = 136315650;
      if (a2) {
        v21 = "success";
      }
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      id v47 = v14;
      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEBUG, "Enqueuing %s notification for action \"%@\" extraInfo: %@", buf, 0x20u);
    }

    v50[0] = @"success";
    id v22 = [NSNumber numberWithBool:a2];
    v50[1] = @"requestType";
    v51[0] = v22;
    v51[1] = v18;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];

    if (v14)
    {
      v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count") + 2);
      [v24 addEntriesFromDictionary:v14];
      [v24 addEntriesFromDictionary:v23];
      uint64_t v25 = [v24 copy];

      v23 = (void *)v25;
    }
    uint64_t v26 = [MEMORY[0x1E4F28EA0] notificationWithName:@"MapsAuthDidFinishNotification" object:v18 userInfo:v23];
    if (a2 && a5 && a6)
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v47 = __Block_byref_object_copy__104;
      int v48 = __Block_byref_object_dispose__104;
      id v49 = 0;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_125;
      v35[3] = &unk_1E53F6B88;
      id v40 = buf;
      v39 = v19;
      char v41 = a2;
      id v36 = v18;
      v37 = v14;
      id v38 = v26;
      uint64_t v27 = _GEOConfigAddBlockListenerForKey(a5, a6, MEMORY[0x1E4F14428], v35);
      uint64_t v28 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v27;

      if (v15) {
        v15[2](v15);
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v15) {
        v15[2](v15);
      }
      v19[2](v19);
      v29 = GEOGetMapsProxyAuthLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = "failure";
        *(_DWORD *)long long buf = 136315650;
        if (a2) {
          uint64_t v30 = "success";
        }
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        id v47 = v14;
        _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_DEBUG, "Posting %s notification for action \"%@\" extraInfo: %@", buf, 0x20u);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_128;
      block[3] = &unk_1E53D79D8;
      id v34 = v26;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke_79(uint64_t a1)
{
  _setValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98, *(void **)(a1 + 32), 1, 0);
  if ([*(id *)(a1 + 40) length])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    int v3 = GeoServicesConfig_MapsAuthToken;
    uint64_t v4 = off_1E9113A88;
    int v5 = 1;
  }
  else
  {
    int v3 = GeoServicesConfig_MapsAuthToken;
    uint64_t v4 = off_1E9113A88;
    uint64_t v2 = 0;
    int v5 = 0;
  }

  return _setValue(v3, (uint64_t)v4, v2, v5, 0);
}

- (void)requestFeatureFlagsWithURL:(id)a3 suppressNotification:(BOOL)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "requesting client feature flags", buf, 2u);
  }

  if (!v6)
  {
    GEOGetURLWithSource(51, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = _getValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98, 1, 0, 0, 0);
  id v9 = v8;
  if (v6)
  {
    if ([v8 length])
    {
      id v22 = @"mrt";
      v23 = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v11 = _buildRequest(v6, @"v2/clientfeatureflags", v10, 0);

      v12 = _defaultURLSession();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__GEOMapsAuthServiceHelper_requestFeatureFlagsWithURL_suppressNotification___block_invoke;
      v17[3] = &unk_1E53ECA20;
      v17[4] = self;
      uint64_t v13 = [v12 dataTaskWithRequest:v11 completionHandler:v17];
      if (!v13)
      {
        id v14 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          v19 = @"clientfeatureflags";
          __int16 v20 = 2112;
          v21 = v11;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "%@ task is nil for request: %@", buf, 0x16u);
        }
      }
      [v13 resume];

      goto LABEL_28;
    }
    id v15 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      id v16 = "mrt is nil requesting client feature flags";
      goto LABEL_16;
    }
  }
  else
  {
    id v15 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      id v16 = "affURL is nil";
LABEL_16:
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    }
  }

  if (_GEOConfigHasValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1E9114AC8)) {
    _setValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1E9114AC8, 0, 0, 0);
  }
  if (_GEOConfigHasValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1E9114AD8)) {
    _setValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1E9114AD8, 0, 0, 0);
  }
  _setValue(GeoServicesConfig_MapsAuthClientFeatureFlagsLastUpdated, (uint64_t)off_1E9114B28, 0, 0, 0);
  uint64_t v11 = 0;
  if (!v6)
  {
    v24 = @"failReason";
    v25[0] = &unk_1ED73EB90;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  }
  if (self) {
    [(GEOMapsAuthServiceHelper *)(uint64_t)self _postNotificationSuccess:@"clientfeatureflags" requestType:v11 extraInfo:GEOConfigKey_Invalid waitForKey:unk_1E91186C0 updateKeys:0 completion:0];
  }
  if (v6 && !a4) {
    [(GEOMapsAuthServiceHelper *)self sendProxyAuthNotification:2];
  }
LABEL_28:
}

void __76__GEOMapsAuthServiceHelper_requestFeatureFlagsWithURL_suppressNotification___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  id v10 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = _responseDescription(v7);
    *(_DWORD *)long long buf = 138412290;
    *(void *)v91 = v11;
    _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "ff response: %@", buf, 0xCu);
  }
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v9;
  id v14 = v7;
  id v15 = v8;
  if (v12)
  {
    uint64_t v16 = _httpStatusCodeSafe(v14);
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __74__GEOMapsAuthServiceHelper__handleFeatureFlagResponseData_response_error___block_invoke;
    v79[3] = &unk_1E53F6AE8;
    v79[4] = v12;
    id v17 = (void (**)(void, void, void))MEMORY[0x18C120660](v79);
    if (v15 || (unint64_t)(v16 - 200) > 0x63)
    {
      uint64_t v25 = GEOGetMapsProxyAuthLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = _responseDescription(v14);
        *(_DWORD *)long long buf = 67109634;
        *(_DWORD *)v91 = v16;
        *(_WORD *)&v91[4] = 2112;
        *(void *)&v91[6] = v15;
        *(_WORD *)&v91[14] = 2112;
        *(void *)&v91[16] = v26;
        _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_ERROR, "Feature Flag received status code %d and error %@ (response: %@)", buf, 0x1Cu);
      }
      v17[2](v17, 0, 0);
    }
    else
    {
      id v78 = 0;
      id v18 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:&v78];
      id v19 = v78;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || v19)
      {
        uint64_t v27 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = _responseDescription(v14);
          *(_DWORD *)long long buf = 138412802;
          *(void *)v91 = v18;
          *(_WORD *)&v91[8] = 2112;
          *(void *)&v91[10] = v19;
          *(_WORD *)&v91[18] = 2112;
          *(void *)&v91[20] = v28;
          _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_ERROR, "Feature Flag response was not json format: %@ %@ (response: %@)", buf, 0x20u);
        }
        v17[2](v17, 0, 0);
      }
      else
      {
        uint64_t v20 = [v18 objectForKey:@"clientFeatureFlags"];
        objc_opt_class();
        v70 = (void *)v20;
        if (objc_opt_isKindOfClass())
        {
          id v21 = v18;
          id v22 = _getValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1E9114AD8, 1, 0, 0, 0);
          v23 = v22;
          if (v22)
          {
            uint64_t v24 = [v22 mutableCopy];
          }
          else
          {
            uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          v31 = (void *)v24;
          v64 = v23;
          id v65 = v21;
          v66 = v18;
          v67 = v17;
          id v68 = v14;
          id v69 = v13;
          id v32 = v21;
          if (!v21)
          {
            id v32 = _getValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1E9114AC8, 1, 0, 0, 0);
          }
          v74 = [MEMORY[0x1E4F1CA80] set];
          v63 = v32;
          v33 = [v32 objectForKeyedSubscript:@"clientFeatureFlags"];
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id obj = v33;
          uint64_t v73 = [obj countByEnumeratingWithState:&v80 objects:buf count:16];
          if (v73)
          {
            uint64_t v72 = *(void *)v81;
            id v34 = @"isDefaultOn";
            v35 = @"userOn";
            unint64_t v36 = 0x1E4F28000uLL;
            while (2)
            {
              for (uint64_t i = 0; i != v73; ++i)
              {
                if (*(void *)v81 != v72) {
                  objc_enumerationMutation(obj);
                }
                id v38 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                v39 = [v38 objectForKeyedSubscript:@"name"];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v57 = GEOGetMapsProxyAuthLog();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v88 = 138412290;
                    v89 = v39;
                    _os_log_impl(&dword_188D96000, v57, OS_LOG_TYPE_ERROR, "featureName %@ is not NSString", v88, 0xCu);
                  }

                  goto LABEL_43;
                }
                [v74 addObject:v39];
                id v40 = [v38 objectForKeyedSubscript:v34];
                objc_opt_class();
                v77 = v40;
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v41 = [v40 BOOLValue];
                }
                else
                {
                  v42 = GEOGetMapsProxyAuthLog();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v88 = 138412290;
                    v89 = v40;
                    _os_log_impl(&dword_188D96000, v42, OS_LOG_TYPE_ERROR, "isDefaultOn %@ is not NSNumber", v88, 0xCu);
                  }

                  uint64_t v41 = 0;
                }
                id v43 = [v31 objectForKeyedSubscript:v39];
                id v44 = [v43 objectForKeyedSubscript:v35];
                char v45 = v44;
                if (v44)
                {
                  uint64_t v46 = [v44 BOOLValue];
                  v84[0] = v35;
                  v76 = [*(id *)(v36 + 3792) numberWithBool:v46];
                  v85[0] = v76;
                  v84[1] = v34;
                  id v47 = [*(id *)(v36 + 3792) numberWithBool:v41];
                  v85[1] = v47;
                  v84[2] = @"active";
                  [*(id *)(v36 + 3792) numberWithBool:v46];
                  v75 = v45;
                  uint64_t v48 = i;
                  id v49 = v39;
                  v50 = v43;
                  unint64_t v51 = v36;
                  v52 = v35;
                  v53 = v34;
                  v55 = v54 = v31;
                  v85[2] = v55;
                  uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:3];

                  v31 = v54;
                  id v34 = v53;
                  v35 = v52;
                  unint64_t v36 = v51;
                  id v43 = v50;
                  v39 = v49;
                  uint64_t i = v48;
                  char v45 = v75;
                }
                else
                {
                  v86[0] = v34;
                  v76 = [*(id *)(v36 + 3792) numberWithBool:v41];
                  v86[1] = @"active";
                  v87[0] = v76;
                  id v47 = [*(id *)(v36 + 3792) numberWithBool:v41];
                  v87[1] = v47;
                  uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
                }

                [v31 setObject:v56 forKeyedSubscript:v39];
              }
              uint64_t v73 = [obj countByEnumeratingWithState:&v80 objects:buf count:16];
              if (v73) {
                continue;
              }
              break;
            }
          }
LABEL_43:

          v58 = (void *)MEMORY[0x1E4F1CA80];
          v59 = [v31 allKeys];
          v60 = [v58 setWithArray:v59];

          [v60 minusSet:v74];
          v61 = [v60 allObjects];
          [v31 removeObjectsForKeys:v61];

          if (v64 && ([v64 isEqual:v31] & 1) != 0) {
            id v62 = 0;
          }
          else {
            id v62 = v31;
          }
          id v14 = v68;
          id v13 = v69;
          id v17 = v67;
          id v15 = 0;
          id v19 = 0;
          id v18 = v66;

          ((void (**)(void, id, id))v17)[2](v17, v65, v62);
        }
        else
        {
          v29 = GEOGetMapsProxyAuthLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = _responseDescription(v14);
            *(_DWORD *)long long buf = 138412546;
            *(void *)v91 = v70;
            *(_WORD *)&v91[8] = 2112;
            *(void *)&v91[10] = v30;
            _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_ERROR, "featuresInfo is not an array: %@ (response: %@)", buf, 0x16u);
          }
          v17[2](v17, 0, 0);
        }
      }
    }
  }
}

void __74__GEOMapsAuthServiceHelper__handleFeatureFlagResponseData_response_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v5 != 0;
  BOOL v8 = v6 != 0;
  uint64_t v9 = *(void *)(a1 + 32);
  BOOL v10 = !v7 || !v8;
  if (v7 && v8) {
    uint64_t v11 = &GeoServicesConfig_ClientAuthFeatureFlagsStateInfo;
  }
  else {
    uint64_t v11 = &GEOConfigKey_Invalid;
  }
  uint64_t v12 = *v11;
  id v13 = (uint64_t *)&off_1E9114AD8;
  if (v10) {
    id v13 = (uint64_t *)&unk_1E91186C0;
  }
  uint64_t v14 = *v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__GEOMapsAuthServiceHelper__handleFeatureFlagResponseData_response_error___block_invoke_2;
  v17[3] = &unk_1E53D8998;
  id v18 = v5;
  id v19 = v6;
  id v15 = v6;
  id v16 = v5;
  [(GEOMapsAuthServiceHelper *)v9 _postNotificationSuccess:@"clientfeatureflags" requestType:0 extraInfo:v12 waitForKey:v14 updateKeys:v17 completion:0];
}

void __74__GEOMapsAuthServiceHelper__handleFeatureFlagResponseData_response_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    _setValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1E9114AC8, v2, 1, 0);
    int v3 = [MEMORY[0x1E4F1C9C8] date];
    _setValue(GeoServicesConfig_MapsAuthClientFeatureFlagsLastUpdated, (uint64_t)off_1E9114B28, v3, 1, 0);
  }
  else
  {
    _setValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1E9114AC8, 0, 0, 0);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    int v5 = GeoServicesConfig_ClientAuthFeatureFlagsStateInfo;
    id v6 = off_1E9114AD8;
    _setValue(v5, (uint64_t)v6, v4, 1, 0);
  }
}

- (void)doEnvironmentSwitchCheck:(id)a3 authProxyURL:(id)a4 suppressNotification:(BOOL)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    BOOL v10 = _getValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98, 1, 0, 0, 0);
    if ([v10 length])
    {
      uint64_t v26 = @"mrt";
      uint64_t v27 = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v24 = @"environment";
      id v25 = v8;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v13 = _buildRequest(v9, @"v2/environmentswitch", v11, v12);

      if (v13)
      {
        uint64_t v14 = _defaultURLSession();
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __87__GEOMapsAuthServiceHelper_doEnvironmentSwitchCheck_authProxyURL_suppressNotification___block_invoke;
        v17[3] = &unk_1E53F6B10;
        BOOL v19 = a5;
        void v17[4] = self;
        id v18 = v8;
        id v15 = [v14 dataTaskWithRequest:v13 completionHandler:v17];
        if (!v15)
        {
          id v16 = GEOGetMapsProxyAuthLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v21 = v13;
            _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "token exhange task is nil for request: %@", buf, 0xCu);
          }
        }
        [v15 resume];
      }
      else
      {
        v22[0] = @"failReason";
        v22[1] = @"environment";
        v23[0] = &unk_1ED73EB90;
        v23[1] = v8;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
        if (self) {
          [(GEOMapsAuthServiceHelper *)(uint64_t)self _postNotificationSuccess:@"environmentswitch" requestType:v14 extraInfo:GEOConfigKey_Invalid waitForKey:unk_1E91186C0 updateKeys:0 completion:0];
        }
      }
    }
    else
    {
      v28[0] = @"failReason";
      v28[1] = @"environment";
      v29[0] = &unk_1ED73EBC0;
      v29[1] = v8;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      if (self) {
        [(GEOMapsAuthServiceHelper *)(uint64_t)self _postNotificationSuccess:@"environmentswitch" requestType:v13 extraInfo:GEOConfigKey_Invalid waitForKey:unk_1E91186C0 updateKeys:0 completion:0];
      }
    }
  }
  else
  {
    v30[0] = @"failReason";
    v30[1] = @"environment";
    v31[0] = &unk_1ED73EBA8;
    v31[1] = v8;
    BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    if (self) {
      [(GEOMapsAuthServiceHelper *)(uint64_t)self _postNotificationSuccess:@"environmentswitch" requestType:v10 extraInfo:GEOConfigKey_Invalid waitForKey:unk_1E91186C0 updateKeys:0 completion:0];
    }
  }
}

void __87__GEOMapsAuthServiceHelper_doEnvironmentSwitchCheck_authProxyURL_suppressNotification___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    _responseDescription(v7);
    BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)long long buf = 138412290;
    uint64_t v48 = v10;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "env response: %@", buf, 0xCu);
  }
  uint64_t v11 = _httpStatusCodeSafe(v7);
  int v12 = v11;
  uint64_t v13 = GEOConfigKey_Invalid;
  uint64_t v14 = (void *)unk_1E91186C0;
  if (v8 || (unint64_t)(v11 - 200) > 0x63)
  {
    unsigned int v39 = 0;
    id v16 = 0;
    uint64_t v21 = 2;
    if ((unint64_t)(v11 - 400) < 2 || v11 == 407) {
      goto LABEL_33;
    }
    if (v11 != 423)
    {
      uint64_t v24 = GEOGetMapsProxyAuthLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = _responseDescription(v7);
        *(_DWORD *)long long buf = 138413058;
        uint64_t v48 = @"environmentswitch";
        __int16 v49 = 1024;
        *(_DWORD *)v50 = v12;
        *(_WORD *)&v50[4] = 2112;
        *(void *)&v50[6] = v8;
        *(_WORD *)&v50[14] = 2112;
        *(void *)&v50[16] = v25;
        _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Response for %@ received status code %d and error %@ (response: %@)", buf, 0x26u);
      }
      id v16 = 0;
      unsigned int v39 = 0;
      goto LABEL_32;
    }
    id v16 = 0;
    unsigned int v39 = 0;
    uint64_t v21 = 4;
LABEL_33:
    if (!*(unsigned char *)(a1 + 48))
    {
      v29 = GEOGetMapsProxyAuthLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_DEBUG, "sending proxy notificaiton", buf, 2u);
      }

      [*(id *)(a1 + 32) sendProxyAuthNotification:v21];
    }
    uint64_t v30 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      id v31 = v16;
      uint64_t v32 = v13;
      if (v39) {
        v33 = "succeeded";
      }
      else {
        v33 = "failed";
      }
      id v38 = v8;
      uint64_t v34 = *(void *)(a1 + 40);
      v35 = _responseDescription(v7);
      *(_DWORD *)long long buf = 138413058;
      uint64_t v48 = @"environmentswitch";
      __int16 v49 = 2080;
      *(void *)v50 = v33;
      uint64_t v13 = v32;
      id v16 = v31;
      *(_WORD *)&v50[8] = 2112;
      *(void *)&v50[10] = v34;
      id v8 = v38;
      *(_WORD *)&v50[18] = 2112;
      *(void *)&v50[20] = v35;
      _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_DEBUG, "%@ %s for %@ (response: %@)", buf, 0x2Au);
    }
    uint64_t v36 = *(void *)(a1 + 32);
    v45[0] = @"failReason";
    id v15 = [NSNumber numberWithInteger:v21];
    v45[1] = @"environment";
    v46[0] = v15;
    v46[1] = *(void *)(a1 + 40);
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
    [(GEOMapsAuthServiceHelper *)v36 _postNotificationSuccess:@"environmentswitch" requestType:v22 extraInfo:v13 waitForKey:(uint64_t)v14 updateKeys:v16 completion:0];
    goto LABEL_43;
  }
  if (![v40 length])
  {
    id v16 = 0;
    uint64_t v21 = 0;
    unsigned int v39 = 1;
    goto LABEL_33;
  }
  id v44 = 0;
  id v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v40 options:0 error:&v44];
  id v16 = v44;
  if (!v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [(__CFString *)v15 objectForKey:@"mapsRefreshToken"];
      id v18 = [(__CFString *)v15 objectForKey:@"mapsAccessToken"];
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v37 = v18;
        uint64_t v26 = v17;
        uint64_t v20 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = _responseDescription(v7);
          *(_DWORD *)long long buf = 138412802;
          BOOL v19 = v26;
          uint64_t v48 = v26;
          __int16 v49 = 2112;
          id v18 = v37;
          *(void *)v50 = v37;
          *(_WORD *)&v50[8] = 2112;
          *(void *)&v50[10] = v27;
          uint64_t v28 = "Response included an invalid type for mrt/mat: %@/%@ (response: %@)";
LABEL_29:
          _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, v28, buf, 0x20u);

          id v16 = 0;
          unsigned int v39 = 0;
          goto LABEL_31;
        }
      }
      else
      {
        if (-[__CFString length](v17, "length") && [v18 length])
        {
          uint64_t v13 = GeoServicesConfig_MapsAuthToken;
          uint64_t v14 = off_1E9113A88;
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __87__GEOMapsAuthServiceHelper_doEnvironmentSwitchCheck_authProxyURL_suppressNotification___block_invoke_91;
          v41[3] = &unk_1E53D8998;
          v42 = v17;
          id v43 = v18;
          BOOL v19 = v17;
          id v16 = (id)MEMORY[0x18C120660](v41);

          unsigned int v39 = 1;
          uint64_t v20 = v42;
LABEL_31:

LABEL_32:
          uint64_t v21 = 0;
          goto LABEL_33;
        }
        v37 = v18;
        uint64_t v26 = v17;
        uint64_t v20 = GEOGetMapsProxyAuthLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = _responseDescription(v7);
          *(_DWORD *)long long buf = 138412802;
          BOOL v19 = v26;
          uint64_t v48 = v26;
          __int16 v49 = 2112;
          id v18 = v37;
          *(void *)v50 = v37;
          *(_WORD *)&v50[8] = 2112;
          *(void *)&v50[10] = v27;
          uint64_t v28 = "Response for environtment switch returned invalid mrt/mat: %@/%@ (response: %@)";
          goto LABEL_29;
        }
      }
      id v16 = 0;
      unsigned int v39 = 0;
      BOOL v19 = v26;
      id v18 = v37;
      goto LABEL_31;
    }
  }
  id v22 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = _responseDescription(v7);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v48 = v15;
    __int16 v49 = 2112;
    *(void *)v50 = v16;
    *(_WORD *)&v50[8] = 2112;
    *(void *)&v50[10] = v23;
    _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "Response for environment check was not a json dict: %@ / %@ (response: %@)", buf, 0x20u);
  }
LABEL_43:
}

uint64_t __87__GEOMapsAuthServiceHelper_doEnvironmentSwitchCheck_authProxyURL_suppressNotification___block_invoke_91(uint64_t a1)
{
  _setValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98, *(void **)(a1 + 32), 1, 0);
  uint64_t v2 = *(void **)(a1 + 40);
  int v3 = GeoServicesConfig_MapsAuthToken;
  uint64_t v4 = off_1E9113A88;

  return _setValue(v3, (uint64_t)v4, v2, 1, 0);
}

- (void)setConnectionProxyDictionary:(id)a3 url:(id)a4 proxyURL:(id)a5
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    GEOGetURLWithSource(39, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (GEOAuthProxyURLIsValid(v9))
  {
    BOOL v10 = [v8 scheme];
    int v11 = [v10 isEqualToString:@"https"];

    if (v11)
    {
      v25[0] = *MEMORY[0x1E4F190D8];
      int v12 = [v9 host];
      v26[0] = v12;
      v25[1] = *MEMORY[0x1E4F190E0];
      uint64_t v13 = [v9 port];
      v26[1] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
      [v7 setConnectionProxyDictionary:v14];

      objc_msgSend(v7, "set_requiresSecureHTTPSProxyConnection:", 1);
    }
    else
    {
      id v16 = GEOGetMapsProxyAuthLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138412290;
        id v22 = v8;
        _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "url.scheme is not https when attempting to set proxy %@", (uint8_t *)&v21, 0xCu);
      }
    }
    id v17 = [v8 scheme];
    id v18 = [v9 scheme];
    char v19 = [v17 isEqualToString:v18];

    if ((v19 & 1) == 0)
    {
      uint64_t v20 = GEOGetMapsProxyAuthLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138412546;
        id v22 = v9;
        __int16 v23 = 2112;
        id v24 = v8;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "proxyURL %@ scheme does not match URL %@ scheme", (uint8_t *)&v21, 0x16u);
      }
    }
    objc_msgSend(v7, "set_preventsSystemHTTPProxyAuthentication:", 1);
  }
  else
  {
    id v15 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "aborting setting connectionProxyDictionary because proxyURL, proxyURL.host, or proxyURL.port is nil. proxyURL is %@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)addProxyAuthHeaderOrReAuth:(id)a3 authProxyURL:(id)a4
{
  int v4 = GeoServicesConfig_MapsAuthToken;
  int v5 = off_1E9113A88;
  id v6 = a3;
  _getValue(v4, (uint64_t)v5, 1, 0, 0, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [NSString stringWithFormat:@"mat:%@", v12];
  id v8 = [v7 dataUsingEncoding:4];
  id v9 = NSString;
  BOOL v10 = [v8 base64EncodedStringWithOptions:0];
  int v11 = [v9 stringWithFormat:@"Basic %@", v10];

  [v6 setObject:v11 forKeyedSubscript:@"Proxy-Authorization"];
  [v6 setObject:v12 forKeyedSubscript:@"X-Env-Sec-Mat"];
}

- (void)handleSecureProxyChallenge:(id)a3
{
  int v4 = [a3 failureResponse];
  int v5 = [v4 allHeaderFields];

  id v6 = [v5 objectForKeyedSubscript:@"X-Proxy-Missing-Group-Access"];

  id v7 = GEOGetMapsProxyAuthLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Missing group access challenge", buf, 2u);
    }

    [(GEOMapsAuthServiceHelper *)self sendProxyAuthNotification:4];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Non-missing group access challenge - no valid mat, attempting to renew mrt and mat", v9, 2u);
    }

    [(GEOMapsAuthServiceHelper *)self renewMapsAuthProxyToken:1 fromToken:0 authProxyURL:0 suppressNotification:0];
  }
}

void __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = -[GEOMapsAuthServiceHelper _hasMRT](*(void *)(a1 + 32));
  BOOL v4 = -[GEOMapsAuthServiceHelper _hasMAT](*(void *)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_2;
  v5[3] = &unk_1E53F6B38;
  char v7 = *(unsigned char *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  BOOL v8 = v3;
  BOOL v9 = v4;
  geoAnalyticsSendEventLazy(@"com.apple.GeoServices.AuthResult", v5);
}

id __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_2(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"success";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = @"requestType";
  v8[2] = @"hasMRT";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v9[2] = v4;
  v8[3] = @"hasMAT";
  int v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 42)];
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

void __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_125(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  GEOConfigRemoveBlockListener(*(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  BOOL v4 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(a1 + 72)) {
      int v5 = "success";
    }
    else {
      int v5 = "failure";
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 136315650;
    int v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Posting %s notification for action \"%@\" extraInfo: %@", buf, 0x20u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_126;
  block[3] = &unk_1E53D79D8;
  id v9 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_126(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotification:*(void *)(a1 + 32)];
}

void __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_128(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotification:*(void *)(a1 + 32)];
}

- (void)invalidateTokens
{
  _setValue(GeoServicesConfig_MapsAuthToken, (uint64_t)off_1E9113A88, 0, 0, 0);
  int v2 = GeoServicesConfig_MapsRefreshToken;
  uint64_t v3 = off_1E9113A98;

  _setValue(v2, (uint64_t)v3, 0, 0, 0);
}

- (BOOL)isCurrentEnvironmentSecure
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v18 = self->_currentEnvironmentStateIsolater;
  _geo_isolate_lock();
  unint64_t currentEnvironmentState = self->_currentEnvironmentState;
  if (!currentEnvironmentState)
  {
    BOOL v4 = _GEOGetURLWithSource(39, 0, 1, 0);
    uint64_t v5 = [v4 length];

    if (!v5)
    {
LABEL_19:
      unint64_t currentEnvironmentState = 1;
LABEL_20:
      self->_unint64_t currentEnvironmentState = currentEnvironmentState;
      goto LABEL_21;
    }
    unint64_t currentEnvironmentState = self->_currentEnvironmentState;
    if (!currentEnvironmentState)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v6 = +[GEOResourceManifestManager modernManager];
      uint64_t v7 = [v6 activeTileGroup];
      BOOL v8 = [v7 tileSets];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v8);
            }
            if ([*(id *)(*((void *)&v14 + 1) + 8 * i) useAuthProxy])
            {
              self->_unint64_t currentEnvironmentState = 2;
              goto LABEL_14;
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_14:

      unint64_t currentEnvironmentState = self->_currentEnvironmentState;
      if (!currentEnvironmentState)
      {
        uint64_t v12 = 0;
        unint64_t currentEnvironmentState = 2;
        while ((GEOURLRequestsAuthForURLType(v12) & 1) == 0)
        {
          if (++v12 == 66)
          {
            unint64_t currentEnvironmentState = self->_currentEnvironmentState;
            if (currentEnvironmentState) {
              goto LABEL_21;
            }
            goto LABEL_19;
          }
        }
        goto LABEL_20;
      }
    }
  }
LABEL_21:
  _geo_isolate_unlock();

  return currentEnvironmentState == 2;
}

uint64_t __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isCurrentEnvironmentSecure];
  if (result)
  {
    uint64_t v3 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Apple VPN connection appears to be down: %@", buf, 0xCu);
    }

    uint64_t result = GEOConfigGetBOOL(GeoServicesConfig_InternalNetworkErrorAlertsEnabled, (uint64_t)off_1E9114D98);
    if (result)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke_136;
      v5[3] = &__block_descriptor_40_e39_v16__0___GEOUserNotificationProvider__8l;
      void v5[4] = *(void *)(a1 + 48);
      return objc_msgSend(MEMORY[0x1E4F29268], "geo_withMapsNotificationProviderDaemon:errorHandler:", v5, &__block_literal_global_138);
    }
  }
  return result;
}

uint64_t __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke_136(uint64_t a1, void *a2)
{
  return [a2 geoDInternalError:*(void *)(a1 + 32)];
}

void __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = GEOGetMapsProxyAuthLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Unable to push internal geod error notification: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == GeoServicesConfig_MapsRefreshToken && a3.var1 == off_1E9113A98) {
    -[GEOMapsAuthServiceHelper _refreshFromTask:force:]((uint64_t)self, 0, 1);
  }
}

- (void)_refreshFromTask:(char)a3 force:
{
  id v5 = a2;
  if (a1 && +[GEOPlatform isRunningInGeod])
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    void v28[2] = __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke;
    v28[3] = &unk_1E53D79D8;
    v28[4] = a1;
    [v5 setCompletion:v28];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_3;
    block[3] = &unk_1E53D79D8;
    void block[4] = a1;
    if (qword_1EB2A0860 != -1) {
      dispatch_once(&qword_1EB2A0860, block);
    }
    GEOGetMonotonicTime();
    double v7 = v6;
    if (a3) {
      goto LABEL_10;
    }
    uint64_t v8 = _getValue(GeoServicesConfig_MapsAuthClientFeatureFlagsLastUpdated, (uint64_t)off_1E9114B28, 1, 0, 0, 0);
    uint64_t v9 = v8;
    if (!v8 || ([v8 timeIntervalSinceNow], v10 >= -1800.0) || v7 - *(double *)&qword_1EB2A0868 <= 1800.0)
    {

      goto LABEL_11;
    }

    int v11 = +[GEONetworkObserver sharedNetworkObserver];
    int v12 = [v11 isNetworkReachable];

    if (v12)
    {
LABEL_10:
      qword_1EB2A0868 = *(void *)&v7;
      uint64_t v21 = 0;
      id v22 = &v21;
      uint64_t v23 = 0x3032000000;
      id v24 = __Block_byref_object_copy__104;
      id v25 = __Block_byref_object_dispose__104;
      id v26 = 0;
      uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      global_operation_queue = (void *)geo_get_global_operation_queue();
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_4;
      v18[3] = &unk_1E53F6BB0;
      v18[4] = a1;
      id v19 = v5;
      uint64_t v20 = &v21;
      uint64_t v15 = [v13 addObserverForName:@"MapsAuthDidFinishNotification" object:@"clientfeatureflags" queue:global_operation_queue usingBlock:v18];
      long long v16 = (void *)v22[5];
      v22[5] = v15;

      long long v17 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
      [v17 requestFeatureFlagsWithURL:0 suppressNotification:0];

      _Block_object_dispose(&v21, 8);
    }
  }
LABEL_11:
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v4 = a3;
  id v5 = self->_currentEnvironmentStateIsolater;
  _geo_isolate_lock();
  self->_unint64_t currentEnvironmentState = 0;
  _geo_isolate_unlock();
}

- (void)refresh:(BOOL)a3
{
}

- (void)refreshFromTask:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOBGSystemTaskCompleter alloc] initWithTask:v4];

  -[GEOMapsAuthServiceHelper _refreshFromTask:force:]((uint64_t)self, v5, 0);
}

void __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke(uint64_t a1)
{
  global_queue = geo_get_global_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_2;
  block[3] = &unk_1E53D79D8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && BackgroundSystemTasksLibraryCore())
  {
    BOOL HasValue = _GEOConfigHasValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98);
    id v2 = [getBGSystemTaskSchedulerClass() sharedScheduler];
    uint64_t v3 = [v2 taskRequestForIdentifier:@"com.apple.geod.EnvironmentSecurity"];
    id v4 = (void *)v3;
    if (HasValue)
    {
      double Double = GEOConfigGetDouble(GeoServicesConfig_MapsAuthClientFeatureFlagsUpdateInterval, (uint64_t)off_1E9114B48);
      if (!v4)
      {
        double v7 = [objc_alloc((Class)getBGRepeatingSystemTaskRequestClass()) initWithIdentifier:@"com.apple.geod.EnvironmentSecurity"];
        [v7 setInterval:Double];
        [v7 setMinDurationBetweenInstances:Double / 3.0 + Double / 3.0];
        [v7 setPriority:2];
        [v7 setRequiresExternalPower:0];
        [v7 setRequiresUserInactivity:0];
        [v7 setRequiresProtectionClass:3];
        [v7 setRequiresNetworkConnectivity:1];
        [v7 setNetworkDownloadSize:5120];
        id v14 = 0;
        char v13 = [v2 submitTaskRequest:v7 error:&v14];
        uint64_t v9 = v14;
        if ((v13 & 1) == 0)
        {
          double v10 = GEOGetMapsProxyAuthLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            long long v16 = v9;
            int v11 = "Error scheduling token update background task: %{public}@";
            goto LABEL_16;
          }
LABEL_17:
        }
LABEL_18:

        goto LABEL_19;
      }
      [v4 interval];
      if (v6 != Double)
      {
        double v7 = v4;
        [v7 setInterval:Double];
        [v7 setMinDurationBetweenInstances:Double / 3.0 + Double / 3.0];
        [v7 setPriority:2];
        [v7 setRequiresExternalPower:0];
        [v7 setRequiresUserInactivity:0];
        [v7 setRequiresProtectionClass:3];
        [v7 setRequiresNetworkConnectivity:1];
        [v7 setNetworkDownloadSize:5120];
        id v14 = 0;
        char v8 = [v2 updateTaskRequest:v7 error:&v14];
        uint64_t v9 = v14;
        if ((v8 & 1) == 0)
        {
          double v10 = GEOGetMapsProxyAuthLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            long long v16 = v9;
            int v11 = "Error updating token update background task: %{public}@";
LABEL_16:
            _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
            goto LABEL_17;
          }
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    else if (v3)
    {
      id v14 = 0;
      char v12 = [v2 cancelTaskRequestWithIdentifier:@"com.apple.geod.EnvironmentSecurity" error:&v14];
      double v7 = v14;
      if (v12)
      {
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v9 = GEOGetMapsProxyAuthLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        long long v16 = v7;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Error canceling token update background task: %{public}@", buf, 0xCu);
      }
      goto LABEL_18;
    }
LABEL_20:
  }
}

void __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_3(uint64_t a1)
{
  id global_queue = (id)geo_get_global_queue();
  _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1E9113A98, global_queue, *(void **)(a1 + 32));
}

void __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    id v4 = _getValue(GeoServicesConfig_MapsAuthClientFeatureFlagsLastUpdated, (uint64_t)off_1E9114B28, 1, 0, 0, 0);
    id v5 = v4;
    if (!v4
      || ([v4 timeIntervalSinceNow],
          GEOConfigGetDouble(GeoServicesConfig_MapsAuthClientFeatureFlagsTTL, (uint64_t)off_1E9114B38) <= -v6))
    {
      if (_GEOConfigHasValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1E9114AC8)) {
        _setValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1E9114AC8, 0, 0, 0);
      }
      if (_GEOConfigHasValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1E9114AD8)) {
        _setValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1E9114AD8, 0, 0, 0);
      }
      [v3 complete];
    }
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEnvironmentStateIsolater, 0);

  objc_storeStrong((id *)&self->_currentToken, 0);
}

@end