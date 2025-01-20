@interface AXSpeechPronunciationHelper
- (BOOL)supportsPronunciationSessions;
- (float)audioLevel;
- (id)_assetUpdaterClient;
- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6;
- (void)cancelPronunciationSession;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dealloc;
- (void)startPronunciationSession:(id)a3 resultCallback:(id)a4;
- (void)stopPronunciationSession;
@end

@implementation AXSpeechPronunciationHelper

- (id)_assetUpdaterClient
{
  if (_assetUpdaterClient_onceToken != -1) {
    dispatch_once(&_assetUpdaterClient_onceToken, &__block_literal_global);
  }
  v2 = (void *)_assetUpdaterClient_Client;

  return v2;
}

uint64_t __50__AXSpeechPronunciationHelper__assetUpdaterClient__block_invoke()
{
  _assetUpdaterClient_Client = [objc_alloc(MEMORY[0x263F22198]) initWithIdentifier:@"AXSpeechPronunciationClient" serviceBundleName:@"AXAssetAndDataServer"];

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  v3 = [(AXSpeechPronunciationHelper *)self _assetUpdaterClient];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)AXSpeechPronunciationHelper;
  [(AXSpeechPronunciationHelper *)&v4 dealloc];
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  self->_inSession = 0;
}

- (BOOL)supportsPronunciationSessions
{
  int v2 = MGGetBoolAnswer();
  if (v2)
  {
    v3 = [MEMORY[0x263F285A0] sharedPreferences];
    char v4 = [v3 dictationIsEnabled];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = [MEMORY[0x263F213D0] sharedInstance];
  char v10 = [v9 ignoreLogging];

  if ((v10 & 1) == 0)
  {
    v11 = [MEMORY[0x263F213D0] identifier];
    v12 = AXLoggerForFacility();

    os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = AXColorizeFormatLog();
      v15 = _AXStringForArgs();
      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v15;
        _os_log_impl(&dword_222E44000, v12, v13, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (a5 == 4)
  {
    v16 = [v8 objectForKeyedSubscript:@"results"];
    v17 = [v8 objectForKeyedSubscript:@"error"];

    if (v17)
    {
      v18 = (void *)MEMORY[0x263F087E8];
      v19 = [v8 objectForKeyedSubscript:@"error"];
      v17 = [v18 errorWithDomain:v19 code:0 userInfo:0];
    }
    (*((void (**)(id))self->_resultCallback + 2))(self->_resultCallback);
    self->_inSession = 0;
  }
  return 0;
}

- (float)audioLevel
{
  if (!self->_inSession) {
    return 0.0;
  }
  int v2 = [(AXSpeechPronunciationHelper *)self _assetUpdaterClient];
  v3 = [v2 sendSynchronousMessage:MEMORY[0x263EFFA78] withIdentifier:7 error:0];

  char v4 = [v3 objectForKeyedSubscript:@"audioLevel"];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (void)startPronunciationSession:(id)a3 resultCallback:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXSpeechPronunciationHelper *)self _assetUpdaterClient];
  [v8 setDelegate:self];

  v9 = [MEMORY[0x263F213D0] sharedInstance];
  char v10 = [v9 ignoreLogging];

  if ((v10 & 1) == 0)
  {
    v11 = [MEMORY[0x263F213D0] identifier];
    v12 = AXLoggerForFacility();

    os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = AXColorizeFormatLog();
      BOOL inSession = self->_inSession;
      v15 = _AXStringForArgs();
      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v15;
        _os_log_impl(&dword_222E44000, v12, v13, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (!self->_inSession)
  {
    v16 = (void *)[v7 copy];
    id resultCallback = self->_resultCallback;
    self->_id resultCallback = v16;

    self->_BOOL inSession = 1;
    v18 = [MEMORY[0x263F213D0] sharedInstance];
    char v19 = [v18 ignoreLogging];

    if ((v19 & 1) == 0)
    {
      v20 = [MEMORY[0x263F213D0] identifier];
      v21 = AXLoggerForFacility();

      os_log_type_t v22 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = AXColorizeFormatLog();
        BOOL inSession = (BOOL)v6;
        v24 = _AXStringForArgs();
        if (os_log_type_enabled(v21, v22))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v24;
          _os_log_impl(&dword_222E44000, v21, v22, "%{public}@", buf, 0xCu);
        }
      }
    }
    id v38 = 0;
    v25 = objc_msgSend(MEMORY[0x263F08910], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v38, inSession);
    id v26 = v38;
    if (v26)
    {
      v27 = [MEMORY[0x263F213D0] sharedInstance];
      char v28 = [v27 ignoreLogging];

      if ((v28 & 1) == 0)
      {
        v29 = [MEMORY[0x263F213D0] identifier];
        v30 = AXLoggerForFacility();

        os_log_type_t v31 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = AXColorizeFormatLog();
          v33 = _AXStringForArgs();
          if (os_log_type_enabled(v30, v31))
          {
            *(_DWORD *)buf = 138543362;
            v42 = v33;
            _os_log_impl(&dword_222E44000, v30, v31, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    if (v25)
    {
      v34 = [(AXSpeechPronunciationHelper *)self _assetUpdaterClient];
      v39 = @"options";
      v40 = v25;
      v35 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      v36 = [MEMORY[0x263F21380] mainAccessQueue];
      [v34 sendAsynchronousMessage:v35 withIdentifier:4 targetAccessQueue:v36 completion:0];
    }
  }
}

- (void)stopPronunciationSession
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F213D0] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    float v5 = [MEMORY[0x263F213D0] identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = AXColorizeFormatLog();
      v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v13 = v9;
        _os_log_impl(&dword_222E44000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_inSession)
  {
    char v10 = [(AXSpeechPronunciationHelper *)self _assetUpdaterClient];
    v11 = [MEMORY[0x263F21380] mainAccessQueue];
    [v10 sendAsynchronousMessage:MEMORY[0x263EFFA78] withIdentifier:5 targetAccessQueue:v11 completion:0];
  }
}

- (void)cancelPronunciationSession
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F213D0] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    float v5 = [MEMORY[0x263F213D0] identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = AXColorizeFormatLog();
      v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v13 = v9;
        _os_log_impl(&dword_222E44000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_inSession)
  {
    char v10 = [(AXSpeechPronunciationHelper *)self _assetUpdaterClient];
    v11 = [MEMORY[0x263F21380] mainAccessQueue];
    [v10 sendAsynchronousMessage:MEMORY[0x263EFFA78] withIdentifier:6 targetAccessQueue:v11 completion:&__block_literal_global_353];
  }
}

- (void).cxx_destruct
{
}

@end