@interface APSigningAuthority
- (APSigningAuthority)initWithPoolName:(id)a3;
- (APSigningContextStorage)signingContextStorage;
- (BOOL)_createAttribute:(void *)a3 enableStashing:(BOOL *)a4;
- (BOOL)_verifyContext:(void *)a3;
- (BOOL)isUsed;
- (BOOL)usingStashedContext;
- (NSString)poolName;
- (id)_createContext:(void *)a3 requestStashed:(BOOL *)a4;
- (id)_failureString:(int64_t)a3;
- (id)_getEncodedStringFromFPDIDataRef:(void *)a3 withLength:(unsigned int)a4;
- (id)_handleInitResponse:(void *)a3 length:(unsigned int)a4 forContextRef:(void *)a5 error:(id)a6;
- (id)_signatureForData:(id)a3 error:(id *)a4;
- (id)signatureForData:(id)a3 error:(id *)a4;
- (int64_t)failureError;
- (int64_t)state;
- (unint64_t)signpostID;
- (void)_destroyObject:(void *)a3 ofType:(int64_t)a4;
- (void)_handleSetupResponse:(void *)a3 length:(unsigned int)a4 forContextRef:(unint64_t *)a5 error:(id)a6;
- (void)_sendInitRequest:(id)a3 forContextRef:(void *)a4 withCompletion:(id)a5;
- (void)_sendSetupRequest:(id)a3 forContextRef:(unint64_t *)a4 withCompletion:(id)a5;
- (void)_setFailureStateWithError:(int64_t)a3;
- (void)_setFailureStateWithErrorAndDestroyContext:(int64_t)a3 contextRef:(void *)a4;
- (void)_setupNewContext:(BOOL)a3 withCompletion:(id)a4;
- (void)setFailureError:(int64_t)a3;
- (void)setIsUsed:(BOOL)a3;
- (void)setPoolName:(id)a3;
- (void)setSigningContextStorage:(id)a3;
- (void)setSignpostID:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setupWithCompletion:(BOOL)a3 completion:(id)a4;
@end

@implementation APSigningAuthority

- (APSigningAuthority)initWithPoolName:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSigningAuthority;
  v6 = [(APSigningAuthority *)&v9 init];
  if (v6)
  {
    if (+[APSigningClientValidator isAllowedClient])
    {
      objc_storeStrong((id *)&v6->_poolName, a3);
      v6->_failureError = 7204;
      v6->_state = 17005;
      v7 = APPerfLogForCategory(0x2BuLL);
      v6->_signpostID = os_signpost_id_generate(v7);
    }
    else
    {
      [(APSigningAuthority *)v6 _setFailureStateWithError:7206];
      v10 = @"finalStatus";
      v11[0] = &unk_1F2EAD640;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      AnalyticsSendEvent();
    }
  }
  return v6;
}

- (void)_setupNewContext:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v18 = a3;
  id v5 = a4;
  v6 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v20 = self;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "Setting up new context for authority %p", buf, 0xCu);
  }

  [(APSigningAuthority *)self setState:17001];
  v17 = 0;
  v7 = [(APSigningAuthority *)self poolName];
  if (!v7
    || ([(APSigningAuthority *)self poolName],
        v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = [v8 length] == 0,
        v8,
        v7,
        v9))
  {
    BOOL v18 = 0;
  }
  v10 = [(APSigningAuthority *)self _createContext:&v17 requestStashed:&v18];
  if (v10)
  {
    objc_initWeak((id *)buf, self);
    v11 = v17;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D70E0BF0;
    v13[3] = &unk_1E6A6BCA8;
    objc_copyWeak(v15, (id *)buf);
    v15[1] = v17;
    v13[4] = self;
    BOOL v16 = v18;
    id v14 = v5;
    [(APSigningAuthority *)self _sendInitRequest:v10 forContextRef:v11 withCompletion:v13];

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      v20 = (APSigningAuthority *)"-[APSigningAuthority _setupNewContext:withCompletion:]";
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: initRequest nil, FPDI creation failed.", buf, 0xCu);
    }

    [(APSigningAuthority *)self setState:7200];
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

- (id)_createContext:(void *)a3 requestStashed:(BOOL *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v7 = APPerfLogForCategory(0x2BuLL);
  unint64_t v8 = [(APSigningAuthority *)self signpostID];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D70B2000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ContextCreate", "", buf, 2u);
    }
  }

  v28[8] = 0;
  *(void *)v28 = a4 != 0;
  v10 = 0;
  if ([(APSigningAuthority *)self _createAttribute:&v28[1] enableStashing:v28])
  {
    uint64_t v27 = 0;
    unsigned int v26 = 0;
    v11 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v32 = self;
      _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_INFO, "Signing Authority %p creating context", buf, 0xCu);
    }

    int v12 = +[APFPDIWrapper FPDICreateContext:a3 withAttribute:*(void *)&v28[1] initRequest:&v27 initRequestLength:&v26];
    if (v12 != -44663)
    {
      int v13 = v12;
      if (v12 != -44802) {
        goto LABEL_15;
      }
    }
    id v14 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v32 = self;
      _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_INFO, "Attempting to re-create stashed context for authority %p as non-stashed", buf, 0xCu);
    }

    +[APFPDIWrapper FPDISetStashingIsEnabled:0 forAttribute:*(void *)&v28[1]];
    int v13 = +[APFPDIWrapper FPDICreateContext:a3 withAttribute:*(void *)&v28[1] initRequest:&v27 initRequestLength:&v26];
    if (v13 == -44663)
    {
      [(APSigningAuthority *)self _setFailureStateWithError:7201];
      [(APSigningAuthority *)self _destroyObject:&v28[1] ofType:1205];
      v35 = @"finalStatus";
      v36[0] = &unk_1F2EAD658;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      AnalyticsSendEvent();

      BOOL v16 = APPerfLogForCategory(0x2BuLL);
      unint64_t v17 = [(APSigningAuthority *)self signpostID];
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_22;
      }
      os_signpost_id_t v18 = v17;
      if (!os_signpost_enabled(v16)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
LABEL_15:
      if (!v13)
      {
        v10 = [(APSigningAuthority *)self _getEncodedStringFromFPDIDataRef:v27 withLength:v26];
        [(APSigningAuthority *)self _destroyObject:&v28[1] ofType:1205];
        [(APSigningAuthority *)self _destroyObject:&v27 ofType:1206];
        v23 = APLogForCategory(0x2BuLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v32 = self;
          _os_log_impl(&dword_1D70B2000, v23, OS_LOG_TYPE_INFO, "Signing Authority %p finished creating context", buf, 0xCu);
        }

        BOOL v16 = APPerfLogForCategory(0x2BuLL);
        unint64_t v24 = [(APSigningAuthority *)self signpostID];
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v25 = v24;
          if (os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D70B2000, v16, OS_SIGNPOST_INTERVAL_END, v25, "ContextCreate", " enableTelemetry=YES ", buf, 2u);
          }
        }
        goto LABEL_23;
      }
      v19 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136643075;
        v32 = (APSigningAuthority *)"-[APSigningAuthority _createContext:requestStashed:]";
        __int16 v33 = 1025;
        int v34 = v13;
        _os_log_impl(&dword_1D70B2000, v19, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Attribution set privacy level error, FPDI creation failed. Status: %{private}d", buf, 0x12u);
      }

      [(APSigningAuthority *)self _setFailureStateWithError:7200];
      [(APSigningAuthority *)self _destroyObject:&v28[1] ofType:1205];
      v29 = @"finalStatus";
      v30 = &unk_1F2EAD670;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      AnalyticsSendEvent();

      BOOL v16 = APPerfLogForCategory(0x2BuLL);
      unint64_t v21 = [(APSigningAuthority *)self signpostID];
      if (v21 - 1 > 0xFFFFFFFFFFFFFFFDLL || (os_signpost_id_t v18 = v21, !os_signpost_enabled(v16)))
      {
LABEL_22:
        v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1D70B2000, v16, OS_SIGNPOST_INTERVAL_END, v18, "ContextCreate", " enableTelemetry=YES ", buf, 2u);
    goto LABEL_22;
  }
LABEL_24:
  return v10;
}

- (BOOL)_createAttribute:(void *)a3 enableStashing:(BOOL *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (+[APFPDIWrapper FPDIInitAttribute:](APFPDIWrapper, "FPDIInitAttribute:")
    && +[APFPDIWrapper FPDISetHighPrivacyLevelForAttribute:*a3])
  {
    v7 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136642819;
      *(void *)v15 = "-[APSigningAuthority _createAttribute:enableStashing:]";
      _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Attribution initialization error, FPDI creation failed", (uint8_t *)&v14, 0xCu);
    }

    [(APSigningAuthority *)self _setFailureStateWithError:7200];
    [(APSigningAuthority *)self _destroyObject:a3 ofType:1205];
    os_signpost_id_t v18 = @"finalStatus";
    v19[0] = &unk_1F2EAD688;
    unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    AnalyticsSendEvent();

    return 0;
  }
  else
  {
    int v10 = +[APFPDIWrapper FPDISetStashingIsEnabled:a4 != 0 forAttribute:*a3];
    if (v10)
    {
      int v11 = v10;
      int v12 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = @"NO";
        int v14 = 67109634;
        *(_DWORD *)v15 = v11;
        if (a4) {
          int v13 = @"YES";
        }
        *(_WORD *)&v15[4] = 2112;
        *(void *)&v15[6] = v13;
        __int16 v16 = 2048;
        unint64_t v17 = self;
        _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_ERROR, "Error %d setting stash attribute to %@ for signing authority %p", (uint8_t *)&v14, 0x1Cu);
      }

      *a4 = 0;
    }
    return 1;
  }
}

- (void)_sendInitRequest:(id)a3 forContextRef:(void *)a4 withCompletion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v20 = self;
    _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_INFO, "Signing Authority %p sending init request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v11 = objc_alloc_init(APSigningServerRequestor);
  int v12 = APPerfLogForCategory(0x2BuLL);
  os_signpost_id_t v13 = [(APSigningAuthority *)self signpostID];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)os_signpost_id_t v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D70B2000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ContextInit", "", v18, 2u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = sub_1D70E1844;
  v15[3] = &unk_1E6A6BCD0;
  objc_copyWeak(v17, (id *)buf);
  v15[4] = self;
  v17[1] = a4;
  id v14 = v9;
  id v16 = v14;
  [(APSigningServerRequestor *)v11 sendRequestForData:v8 requestType:1301 completionHandler:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

- (id)_handleInitResponse:(void *)a3 length:(unsigned int)a4 forContextRef:(void *)a5 error:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  int v11 = APLogForCategory(0x2BuLL);
  int v12 = v11;
  if (!a3 || v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      unsigned int v26 = (APSigningAuthority *)"-[APSigningAuthority _handleInitResponse:length:forContextRef:error:]";
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to receive init reponse, FPDI setup has failed.", buf, 0xCu);
    }

    [(APSigningAuthority *)self _setFailureStateWithErrorAndDestroyContext:7205 contextRef:a5];
    v23 = @"finalStatus";
    unint64_t v24 = &unk_1F2EAD6A0;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    AnalyticsSendEvent();

    v15 = 0;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unsigned int v26 = self;
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_INFO, "Signing Authority %p handling init response", buf, 0xCu);
    }

    uint64_t v20 = 0;
    unsigned int v19 = 0;
    if (+[APFPDIWrapper FPDIInitContext:a5 withInitResponse:a3 initResponseLength:v7 setupRequest:&v20 setupRequestLength:&v19])
    {
      os_signpost_id_t v13 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136642819;
        unsigned int v26 = (APSigningAuthority *)"-[APSigningAuthority _handleInitResponse:length:forContextRef:error:]";
        _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to receive setup request, FPDI setup has failed.", buf, 0xCu);
      }

      [(APSigningAuthority *)self _setFailureStateWithErrorAndDestroyContext:7205 contextRef:a5];
      uint64_t v21 = @"finalStatus";
      v22 = &unk_1F2EAD6B8;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      AnalyticsSendEvent();

      v15 = 0;
    }
    else
    {
      v15 = [(APSigningAuthority *)self _getEncodedStringFromFPDIDataRef:v20 withLength:v19];
    }
    [(APSigningAuthority *)self _destroyObject:&v20 ofType:1206];
  }
  unint64_t v17 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unsigned int v26 = self;
    _os_log_impl(&dword_1D70B2000, v17, OS_LOG_TYPE_INFO, "Signing Authority %p finished handling init response", buf, 0xCu);
  }

  return v15;
}

- (void)_sendSetupRequest:(id)a3 forContextRef:(unint64_t *)a4 withCompletion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = self;
    _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_INFO, "Signing Authority %p sending setup request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v11 = objc_alloc_init(APSigningServerRequestor);
  int v12 = APPerfLogForCategory(0x2BuLL);
  os_signpost_id_t v13 = [(APSigningAuthority *)self signpostID];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)os_signpost_id_t v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D70B2000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ContextSetup", "", v18, 2u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = sub_1D70E1F18;
  v15[3] = &unk_1E6A6BCD0;
  objc_copyWeak(v17, (id *)buf);
  v15[4] = self;
  v17[1] = a4;
  id v14 = v9;
  id v16 = v14;
  [(APSigningServerRequestor *)v11 sendRequestForData:v8 requestType:1302 completionHandler:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

- (void)_handleSetupResponse:(void *)a3 length:(unsigned int)a4 forContextRef:(unint64_t *)a5 error:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v11 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v28 = self;
    _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_INFO, "Signing Authority %p handling setup response", buf, 0xCu);
  }

  if (!a3 || a6)
  {
    os_signpost_id_t v18 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136642819;
      v28 = (APSigningAuthority *)"-[APSigningAuthority _handleSetupResponse:length:forContextRef:error:]";
      _os_log_impl(&dword_1D70B2000, v18, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to receive init reponse, FPDI setup has failed.", buf, 0xCu);
    }

    [(APSigningAuthority *)self _setFailureStateWithErrorAndDestroyContext:7205 contextRef:a5];
    os_signpost_id_t v25 = @"finalStatus";
    unsigned int v26 = &unk_1F2EAD6D0;
    unsigned int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    AnalyticsSendEvent();
  }
  else
  {
    int v12 = +[APFPDIWrapper FPDISetupContext:a5 withSetupResponse:a3 setupResponseLength:v8];
    os_signpost_id_t v13 = APLogForCategory(0x2BuLL);
    id v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136642819;
        v28 = (APSigningAuthority *)"-[APSigningAuthority _handleSetupResponse:length:forContextRef:error:]";
        _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to set setup response, FPDI setup has failed.", buf, 0xCu);
      }

      [(APSigningAuthority *)self _setFailureStateWithErrorAndDestroyContext:7205 contextRef:a5];
      v23 = @"finalStatus";
      unint64_t v24 = &unk_1F2EAD6E8;
      v15 = (void *)MEMORY[0x1E4F1C9E8];
      id v16 = &v24;
      unint64_t v17 = &v23;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136642819;
        v28 = (APSigningAuthority *)"-[APSigningAuthority _handleSetupResponse:length:forContextRef:error:]";
        _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_DEBUG, "[%{sensitive}s]: FPDI setup has succeeded.", buf, 0xCu);
      }

      [(APSigningAuthority *)self setState:17002];
      uint64_t v21 = @"finalStatus";
      v22 = &unk_1F2EAD700;
      v15 = (void *)MEMORY[0x1E4F1C9E8];
      id v16 = &v22;
      unint64_t v17 = &v21;
    }
    uint64_t v20 = objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v21, v22, v23, v24);
    AnalyticsSendEvent();

    unsigned int v19 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v28 = self;
      _os_log_impl(&dword_1D70B2000, v19, OS_LOG_TYPE_INFO, "Signing Authority %p finished setup response", buf, 0xCu);
    }
  }
}

- (BOOL)_verifyContext:(void *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v17 = self;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Signing Authority %p verifying stored context", buf, 0xCu);
  }

  id v6 = [@"verificationContext" dataUsingEncoding:4];
  uint64_t v13 = 0;
  int v12 = 0;
  int v7 = +[APFPDIWrapper FPDISignWithContext:message:messageLength:rawSignature:rawSignatureLength:](APFPDIWrapper, "FPDISignWithContext:message:messageLength:rawSignature:rawSignatureLength:", a3, [v6 bytes], objc_msgSend(v6, "length"), &v13, &v12);
  uint64_t v8 = APLogForCategory(0x2BuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = self;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_INFO, "FPDI context for signing authority %p is not valid.", buf, 0xCu);
    }

    id v14 = @"finalStatus";
    v15 = &unk_1F2EAD718;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    AnalyticsSendEvent();
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = self;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_INFO, "Signing Authority %p verified context", buf, 0xCu);
    }

    [(APSigningAuthority *)self setState:17002];
  }
  [(APSigningAuthority *)self _destroyObject:&v13 ofType:1206];

  return v7 == 0;
}

- (void)_destroyObject:(void *)a3 ofType:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4 == 1207)
  {
    if (!+[APFPDIWrapper FPDIDestroyContext:a3]) {
      goto LABEL_10;
    }
  }
  else if (a4 == 1206)
  {
    if (!+[APFPDIWrapper FPDIDestroyData:a3]) {
      goto LABEL_10;
    }
  }
  else if (a4 != 1205 {
         || !+[APFPDIWrapper FPDIDestroyAttribute:a3])
  }
  {
LABEL_10:
    id v5 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 136643075;
      id v10 = "-[APSigningAuthority _destroyObject:ofType:]";
      __int16 v11 = 2050;
      int64_t v12 = a4;
      id v6 = "[%{sensitive}s]: Successfully destroyed an object of type %{public}ld";
      int v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v5 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136643075;
    id v10 = "-[APSigningAuthority _destroyObject:ofType:]";
    __int16 v11 = 2050;
    int64_t v12 = a4;
    id v6 = "[%{sensitive}s]: Unsuccessfully attempted to destroy an object of type %{public}ld, object possibly no longer exists.";
    int v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
LABEL_12:
    _os_log_impl(&dword_1D70B2000, v7, v8, v6, (uint8_t *)&v9, 0x16u);
  }
LABEL_13:
}

- (id)_getEncodedStringFromFPDIDataRef:(void *)a3 withLength:(unsigned int)a4
{
  v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:a4];
  id v5 = [v4 base64EncodedStringWithOptions:0];

  return v5;
}

- (id)_failureString:(int64_t)a3
{
  if ((unint64_t)(a3 - 7200) <= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", off_1E6A6BD40[a3 - 7200], self);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (void)_setFailureStateWithError:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  -[APSigningAuthority setFailureError:](self, "setFailureError:");
  [(APSigningAuthority *)self setState:17003];
  id v5 = [(APSigningAuthority *)self _failureString:a3];
  id v6 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    os_log_type_t v8 = v5;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_setFailureStateWithErrorAndDestroyContext:(int64_t)a3 contextRef:(void *)a4
{
  [(APSigningAuthority *)self _setFailureStateWithError:a3];
  if (a4)
  {
    id v6 = [(APSigningAuthority *)self poolName];
    +[APSigningContextStorage removeContextForPool:v6 contextIdentifier:a4];
  }
}

- (id)_signatureForData:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(APSigningAuthority *)self state] == 17002)
  {
    int v7 = [(APSigningAuthority *)self signingContextStorage];
    [v7 setUsed:1];

    id v8 = v6;
    uint64_t v9 = [v8 bytes];
    uint64_t v10 = [v8 length];
    uint64_t v26 = 0;
    unsigned int v25 = 0;
    __int16 v11 = [(APSigningAuthority *)self signingContextStorage];
    uint64_t v12 = +[APFPDIWrapper FPDISignWithContext:message:messageLength:rawSignature:rawSignatureLength:](APFPDIWrapper, "FPDISignWithContext:message:messageLength:rawSignature:rawSignatureLength:", [v11 contextRef], v9, v10, &v26, &v25);

    if (v12)
    {
      if (a4)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v14 = objc_msgSend(NSString, "stringWithFormat:", @"failed with error code %d.", v12);
        v28 = v14;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        *a4 = [v13 errorWithDomain:@"com.apple.ap.signingAuthorityErrorDomain" code:7202 userInfo:v15];
      }
      id v16 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136643075;
        v30 = "-[APSigningAuthority _signatureForData:error:]";
        __int16 v31 = 1024;
        LODWORD(v32) = v12;
        _os_log_impl(&dword_1D70B2000, v16, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: FairPlaySAPSign failed with error code %d. Unable to generate signature - disabling request signing.", buf, 0x12u);
      }

      unint64_t v17 = [(APSigningAuthority *)self signingContextStorage];
      uint64_t v18 = [v17 contextRef];

      [(APSigningAuthority *)self _setFailureStateWithErrorAndDestroyContext:7202 contextRef:v18];
      unsigned int v19 = 0;
    }
    else
    {
      v23 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136642819;
        v30 = "-[APSigningAuthority _signatureForData:error:]";
        _os_log_impl(&dword_1D70B2000, v23, OS_LOG_TYPE_DEBUG, "[%{sensitive}s]: Successfully got a signature", buf, 0xCu);
      }

      unsigned int v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v26 length:v25];
    }
    [(APSigningAuthority *)self _destroyObject:&v26 ofType:1206];
  }
  else
  {
    if (a4)
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v34[0] = @"Signing authority is not setup, can not sign data";
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      *a4 = [v20 errorWithDomain:@"com.apple.ap.signingAuthorityErrorDomain" code:7202 userInfo:v21];
    }
    v22 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136643075;
      v30 = "-[APSigningAuthority _signatureForData:error:]";
      __int16 v31 = 2114;
      v32 = @"Signing authority is not setup, can not sign data";
      _os_log_impl(&dword_1D70B2000, v22, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: %{public}@", buf, 0x16u);
    }

    unsigned int v19 = 0;
  }

  return v19;
}

- (BOOL)isUsed
{
  v2 = [(APSigningAuthority *)self signingContextStorage];
  char v3 = [v2 used];

  return v3;
}

- (void)setIsUsed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(APSigningAuthority *)self signingContextStorage];
  [v4 setUsed:v3];
}

- (BOOL)usingStashedContext
{
  v2 = [(APSigningAuthority *)self signingContextStorage];
  char v3 = [v2 stashed];

  return v3;
}

- (void)setState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int64_t v6 = [(APSigningAuthority *)self state];
    if ((unint64_t)(v6 - 17000) > 4) {
      int v7 = @"invalid";
    }
    else {
      int v7 = off_1E6A6BD78[v6 - 17000];
    }
    if ((unint64_t)(a3 - 17000) > 4) {
      id v8 = @"invalid";
    }
    else {
      id v8 = off_1E6A6BD78[a3 - 17000];
    }
    int v9 = 134218498;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "SigningAuthority %p state %@ -> %@", (uint8_t *)&v9, 0x20u);
  }

  self->_state = a3;
}

- (void)setupWithCompletion:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = APPerfLogForCategory(0x2BuLL);
  unint64_t v8 = [(APSigningAuthority *)self signpostID];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D70B2000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TotalSetupTime", "", (uint8_t *)&buf, 2u);
    }
  }

  if (!v4) {
    goto LABEL_28;
  }
  uint64_t v10 = APPerfLogForCategory(0x2BuLL);
  os_signpost_id_t v11 = [(APSigningAuthority *)self signpostID];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D70B2000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CacheReadTime", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v12 = [(APSigningAuthority *)self poolName];
  __int16 v13 = +[APSigningContextStorage retrieveAvailableStashedContextsForPool:v12];

  id v14 = APPerfLogForCategory(0x2BuLL);
  os_signpost_id_t v15 = [(APSigningAuthority *)self signpostID];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D70B2000, v14, OS_SIGNPOST_INTERVAL_END, v15, "CacheReadTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  if (![v13 count])
  {
LABEL_27:

LABEL_28:
    objc_initWeak(&buf, self);
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.ap.signingauthority.setup.%p", self);
    id v32 = objc_claimAutoreleasedReturnValue();
    uint64_t v33 = dispatch_queue_create((const char *)[v32 UTF8String], 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D70E3484;
    block[3] = &unk_1E6A6BD20;
    objc_copyWeak(&v36, &buf);
    BOOL v37 = v4;
    block[4] = self;
    id v35 = v6;
    dispatch_async(v33, block);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&buf);
    goto LABEL_29;
  }
  id v16 = [v13 objectAtIndexedSubscript:0];
  uint64_t v17 = [v16 contextRef];

  uint64_t v18 = APPerfLogForCategory(0x2BuLL);
  os_signpost_id_t v19 = [(APSigningAuthority *)self signpostID];
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D70B2000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VerifyCachedContext", "", (uint8_t *)&buf, 2u);
  }

  BOOL v20 = [(APSigningAuthority *)self _verifyContext:v17];
  uint64_t v21 = APPerfLogForCategory(0x2BuLL);
  unint64_t v22 = [(APSigningAuthority *)self signpostID];
  os_signpost_id_t v23 = v22;
  if (!v20)
  {
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D70B2000, v21, OS_SIGNPOST_INTERVAL_END, v23, "VerifyCachedContext", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
    }

    __int16 v31 = [(APSigningAuthority *)self poolName];
    +[APSigningContextStorage removeContextForPool:v31 contextIdentifier:v17];

    goto LABEL_27;
  }
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D70B2000, v21, OS_SIGNPOST_INTERVAL_END, v23, "VerifyCachedContext", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  unint64_t v24 = [APSigningContextStorage alloc];
  unsigned int v25 = [(APSigningAuthority *)self poolName];
  uint64_t v26 = [(APSigningContextStorage *)v24 initWithContextRef:v17 poolName:v25 stashed:1];
  signingContextStorage = self->_signingContextStorage;
  self->_signingContextStorage = v26;

  v28 = APPerfLogForCategory(0x2BuLL);
  os_signpost_id_t v29 = [(APSigningAuthority *)self signpostID];
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D70B2000, v28, OS_SIGNPOST_INTERVAL_END, v29, "TotalSetupTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  v39 = @"finalStatus";
  v40[0] = &unk_1F2EAD730;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  AnalyticsSendEvent();

  (*((void (**)(id, APSigningAuthority *))v6 + 2))(v6, self);
LABEL_29:
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  id v6 = [a3 sha256];
  int v7 = [(APSigningAuthority *)self _signatureForData:v6 error:a4];

  return v7;
}

- (int64_t)state
{
  return self->_state;
}

- (APSigningContextStorage)signingContextStorage
{
  return self->_signingContextStorage;
}

- (void)setSigningContextStorage:(id)a3
{
}

- (NSString)poolName
{
  return self->_poolName;
}

- (void)setPoolName:(id)a3
{
}

- (int64_t)failureError
{
  return self->_failureError;
}

- (void)setFailureError:(int64_t)a3
{
  self->_failureError = a3;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poolName, 0);
  objc_storeStrong((id *)&self->_signingContextStorage, 0);
}

@end