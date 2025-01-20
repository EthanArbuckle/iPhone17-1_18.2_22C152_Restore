@interface ADAuthenticator
+ (BOOL)authenticationAvailable;
- (ADAuthenticator)initWithTargetQueue:(id)a3 authenticationStrategyVersion:(id)a4;
- (NSData)_requestData;
- (double)sessionInfoDuration;
- (id)_createDeviceAuthenticationSessionForVersion:(unint64_t)a3;
- (id)deviceAuthSession;
- (id)requestData;
- (id)signedDataForData:(id)a3;
- (int)state;
- (unint64_t)authenticationStrategyVersion;
- (void)_setRequestData:(id)a3;
- (void)prepareWithCertificateData:(id)a3 completion:(id)a4;
- (void)reset;
- (void)setSessionInfo:(id)a3 duration:(double)a4;
@end

@implementation ADAuthenticator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAuthSession, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_setRequestData:(id)a3
{
}

- (NSData)_requestData
{
  return self->_requestData;
}

- (id)_createDeviceAuthenticationSessionForVersion:(unint64_t)a3
{
  if (!a3)
  {
    v4 = off_1004F6220;
LABEL_5:
    id v5 = objc_alloc_init(*v4);
    return v5;
  }
  if (a3 == 1)
  {
    v4 = off_1004F6228;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (void)reset
{
  uint64_t v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[ADAuthenticator reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(ADAuthenticator *)self _setRequestData:0];
  deviceAuthSession = self->_deviceAuthSession;
  self->_deviceAuthSession = 0;

  self->_deviceAuthSessionState = 0;
}

- (double)sessionInfoDuration
{
  return self->_duration;
}

- (id)signedDataForData:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[ADAuthenticator signedDataForData:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_deviceAuthSessionState == 2)
  {
    id v6 = 0;
  }
  else
  {
    v7 = [(ADAuthenticator *)self deviceAuthSession];
    id v12 = 0;
    v8 = [v7 signData:v4 error:&v12];
    id v9 = v12;

    if (v9)
    {
      v10 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[ADAuthenticator signedDataForData:]";
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Error signing data: %@", buf, 0x16u);
      }
      id v6 = 0;
    }
    else
    {
      id v6 = v8;
    }
  }
  return v6;
}

- (void)setSessionInfo:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v15 = "-[ADAuthenticator setSessionInfo:duration:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_deviceAuthSessionState != 2)
  {
    if (v6)
    {
      v8 = [(ADAuthenticator *)self deviceAuthSession];
      id v13 = 0;
      unsigned int v9 = [v8 completeWithHandshakeResponse:v6 error:&v13];
      id v10 = v13;

      if (v9)
      {
        self->_duration = a4;
      }
      else
      {
        id v12 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v15 = "-[ADAuthenticator setSessionInfo:duration:]";
          __int16 v16 = 2112;
          id v17 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s completeWithHandshakeResponse failed with %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v11 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v15 = "-[ADAuthenticator setSessionInfo:duration:]";
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Attempted to init with nil sessionInfo", buf, 0xCu);
      }
    }
  }
}

- (id)requestData
{
  return [(ADAuthenticator *)self _requestData];
}

- (void)prepareWithCertificateData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ADAuthenticator prepareWithCertificateData:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_deviceAuthSessionState != 2)
  {
    unsigned int v9 = [(ADAuthenticator *)self deviceAuthSession];
    id v10 = [v9 sessionState];
    if (!v6 || v10)
    {
      v18 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[ADAuthenticator prepareWithCertificateData:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Ignoring request to prepare", buf, 0xCu);
      }
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      goto LABEL_23;
    }
    id v21 = 0;
    v11 = [v9 handshakeRequestWithCertificateData:v6 error:&v21];
    id v12 = v21;
    if (v12 && (id v13 = (void *)AFSiriLogContextSession, os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR)))
    {
      v19 = v13;
      unsigned int v20 = [v12 code];
      *(_DWORD *)buf = 136315394;
      v23 = "-[ADAuthenticator prepareWithCertificateData:completion:]";
      __int16 v24 = 1026;
      unsigned int v25 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Error during handshakeRequestWithCertificateData: %{public}d", buf, 0x12u);

      if (v7) {
        goto LABEL_10;
      }
    }
    else if (v7)
    {
LABEL_10:
      if (v12) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v11 == 0;
      }
      uint64_t v15 = !v14;
      __int16 v16 = [v12 domain];
      id v17 = [v16 isEqualToString:@"com.apple.assistant.deviceAuth.session.badCertificateError"];

      if (v15 == 1) {
        [(ADAuthenticator *)self _setRequestData:v11];
      }
      (*((void (**)(id, uint64_t, id))v7 + 2))(v7, v15, v17);
    }

LABEL_23:
    goto LABEL_24;
  }
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
LABEL_24:
}

- (unint64_t)authenticationStrategyVersion
{
  return self->_authStrategyVersion;
}

- (int)state
{
  uint64_t v3 = [(ADAuthenticator *)self deviceAuthSession];
  id v4 = v3;
  if (self->_deviceAuthSessionState == 2)
  {
    int v5 = 4;
  }
  else
  {
    id v6 = [v3 sessionState];
    if (v6 == (id)2) {
      int v5 = 3;
    }
    else {
      int v5 = 2 * (v6 == (id)1);
    }
  }

  return v5;
}

- (id)deviceAuthSession
{
  if (!self->_deviceAuthSessionState)
  {
    uint64_t v3 = [(ADAuthenticator *)self _createDeviceAuthenticationSessionForVersion:[(ADAuthenticator *)self authenticationStrategyVersion]];
    deviceAuthSession = self->_deviceAuthSession;
    self->_deviceAuthSession = v3;

    if (self->_deviceAuthSession)
    {
      unint64_t v5 = 1;
    }
    else
    {
      id v6 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        id v10 = "-[ADAuthenticator deviceAuthSession]";
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Failed to init device authentication session.", (uint8_t *)&v9, 0xCu);
      }
      unint64_t v5 = 2;
    }
    self->_deviceAuthSessionState = v5;
  }
  id v7 = self->_deviceAuthSession;
  return v7;
}

- (ADAuthenticator)initWithTargetQueue:(id)a3 authenticationStrategyVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADAuthenticator;
  int v9 = [(ADAuthenticator *)&v12 init];
  if (v9)
  {
    if (v8) {
      uint64_t v10 = (uint64_t)[v8 unsignedIntegerValue];
    }
    else {
      uint64_t v10 = 1;
    }
    v9->_authStrategyVersion = v10;
    objc_storeStrong((id *)&v9->_queue, a3);
  }

  return v9;
}

+ (BOOL)authenticationAvailable
{
  return 1;
}

@end