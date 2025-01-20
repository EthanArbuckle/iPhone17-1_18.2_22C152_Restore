@interface ADDeviceAuthenticationSessionV0
- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4;
- (id)handshakeRequestWithCertificateData:(id)a3 error:(id *)a4;
- (id)signData:(id)a3 error:(id *)a4;
- (unint64_t)sessionState;
- (unint64_t)strategyVersion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation ADDeviceAuthenticationSessionV0

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ADDeviceAuthenticationSessionV0 signData:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  unint64_t sessionState = self->_sessionState;
  if (sessionState != 2)
  {
    if (a4)
    {
      CFStringRef v14 = @"com.apple.assistant.deviceAuth.session.StateError";
      v15 = 0;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v21 = 0;
  nacContext = self->_nacContext;
  id v10 = v6;
  sub_100005D38((uint64_t)nacContext, (uint64_t)[v10 bytes], (uint64_t)objc_msgSend(v10, "length"), (uint64_t)&v21);
  if (v11)
  {
    int v12 = v11;
    v13 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[ADDeviceAuthenticationSessionV0 signData:error:]";
      __int16 v24 = 1026;
      int v25 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s NACSign error %{public}d", buf, 0x12u);
    }
    [(ADDeviceAuthenticationSessionV0 *)self invalidate];
    if (a4)
    {
      unint64_t sessionState = v12;
      CFStringRef v14 = @"com.apple.assistant.deviceAuth.session.GenericError";
      v15 = &off_100523E28;
LABEL_11:
      +[NSError errorWithDomain:v14 code:sessionState userInfo:v15];
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_12:
    v16 = 0;
    goto LABEL_16;
  }
  v16 = +[NSData dataWithBytes:v21 length:0];
  int v17 = sub_100004018(v21);
  if (v17)
  {
    int v18 = v17;
    v19 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[ADDeviceAuthenticationSessionV0 signData:error:]";
      __int16 v24 = 1026;
      int v25 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Error disposing validation data %{public}d", buf, 0x12u);
    }
  }
LABEL_16:

  return v16;
}

- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    v19 = "-[ADDeviceAuthenticationSessionV0 completeWithHandshakeResponse:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v18, 0xCu);
  }
  unint64_t sessionState = self->_sessionState;
  if (sessionState != 1)
  {
    if (a4)
    {
      CFStringRef v14 = @"com.apple.assistant.deviceAuth.session.StateError";
      v15 = 0;
      goto LABEL_11;
    }
LABEL_12:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  nacContext = self->_nacContext;
  id v10 = v6;
  sub_100004A08((uint64_t)nacContext, (uint64_t)[v10 bytes], (int)objc_msgSend(v10, "length"));
  if (!v11)
  {
    self->_unint64_t sessionState = 2;
    BOOL v16 = 1;
    goto LABEL_14;
  }
  int v12 = v11;
  v13 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315394;
    v19 = "-[ADDeviceAuthenticationSessionV0 completeWithHandshakeResponse:error:]";
    __int16 v20 = 1024;
    int v21 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s NACKeyEstablishment error %d", (uint8_t *)&v18, 0x12u);
  }
  [(ADDeviceAuthenticationSessionV0 *)self invalidate];
  if (!a4) {
    goto LABEL_12;
  }
  unint64_t sessionState = v12;
  CFStringRef v14 = @"com.apple.assistant.deviceAuth.session.GenericError";
  v15 = &off_100523E00;
LABEL_11:
  +[NSError errorWithDomain:v14 code:sessionState userInfo:v15];
  BOOL v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v16;
}

- (id)handshakeRequestWithCertificateData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ADDeviceAuthenticationSessionV0 handshakeRequestWithCertificateData:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_sessionState) {
    [(ADDeviceAuthenticationSessionV0 *)self invalidate];
  }
  id v8 = v6;
  sub_1000046C0((uint64_t)[v8 bytes], (int)objc_msgSend(v8, "length"));
  id v10 = AFSiriLogContextSession;
  if (v9)
  {
    int v11 = v9;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[ADDeviceAuthenticationSessionV0 handshakeRequestWithCertificateData:error:]";
      __int16 v24 = 1026;
      LODWORD(v25) = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Error during NACInit %{public}d", buf, 0x12u);
    }
    [(ADDeviceAuthenticationSessionV0 *)self invalidate];
    if (a4)
    {
      BOOL v12 = (v11 & 0xFFFFFFEE) == 0xFFFF540A || v11 == -44204;
      v13 = @"com.apple.assistant.deviceAuth.session.GenericError";
      if (v12) {
        v13 = @"com.apple.assistant.deviceAuth.session.badCertificateError";
      }
      CFStringRef v14 = v13;
      id v15 = +[NSError errorWithDomain:v14 code:v11 userInfo:&off_100523DD8];

      BOOL v16 = 0;
      *a4 = v15;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      nacContext = self->_nacContext;
      *(_DWORD *)buf = 136315394;
      v23 = "-[ADDeviceAuthenticationSessionV0 handshakeRequestWithCertificateData:error:]";
      __int16 v24 = 2048;
      int v25 = nacContext;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Got context %p from NACInit", buf, 0x16u);
    }
    self->_unint64_t sessionState = 1;
    BOOL v16 = +[NSData dataWithBytes:0 length:0];
    int v18 = sub_100004018(0);
    if (v18)
    {
      int v19 = v18;
      __int16 v20 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[ADDeviceAuthenticationSessionV0 handshakeRequestWithCertificateData:error:]";
        __int16 v24 = 1026;
        LODWORD(v25) = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Disposing request data failed %{public}d", buf, 0x12u);
      }
    }
  }

  return v16;
}

- (unint64_t)strategyVersion
{
  return 0;
}

- (void)invalidate
{
  nacContext = self->_nacContext;
  if (nacContext)
  {
    int v4 = sub_100004204((uint64_t)nacContext);
    if (v4)
    {
      int v5 = v4;
      id v6 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315394;
        id v8 = "-[ADDeviceAuthenticationSessionV0 invalidate]";
        __int16 v9 = 1026;
        int v10 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Error destroying NACContext %{public}d", (uint8_t *)&v7, 0x12u);
      }
    }
  }
  self->_unint64_t sessionState = 0;
}

- (void)dealloc
{
  [(ADDeviceAuthenticationSessionV0 *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ADDeviceAuthenticationSessionV0;
  [(ADDeviceAuthenticationSessionV0 *)&v3 dealloc];
}

@end