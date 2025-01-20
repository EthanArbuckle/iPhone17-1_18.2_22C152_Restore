@interface ADDeviceAuthenticationSessionV1
- (ADDeviceAuthenticationSessionV1)init;
- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4;
- (id)_exchangeData:(id)a3 error:(id *)a4;
- (id)handshakeRequestWithCertificateData:(id)a3 error:(id *)a4;
- (id)signData:(id)a3 error:(id *)a4;
- (unint64_t)sessionState;
- (unint64_t)strategyVersion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation ADDeviceAuthenticationSessionV1

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
    *(void *)&buf[4] = "-[ADDeviceAuthenticationSessionV1 signData:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_fairplayContext)
  {
    *(void *)buf = 0;
    unsigned int v16 = 0;
    id v8 = objc_alloc_init((Class)NSData);
    fairplayContext = self->_fairplayContext;
    id v10 = v8;
    sub_10002CCB8((uint64_t)fairplayContext, (uint64_t)[v10 bytes], (uint64_t)objc_msgSend(v10, "length"), (uint64_t)buf, (uint64_t)&v16);
    if (v11)
    {
      v12 = +[NSError errorWithDomain:@"com.apple.assistant.deviceAuth.session.GenericError" code:v11 userInfo:&off_100523C70];
      id v13 = v12;
      if (a4)
      {
        id v13 = v12;
        v14 = 0;
        *a4 = v13;
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = +[NSData dataWithBytes:*(void *)buf length:v16];
      sub_10002C178(*(uint64_t *)buf);
      id v13 = 0;
    }
  }
  else
  {
    v14 = 0;
    id v13 = 0;
  }

  return v14;
}

- (id)_exchangeData:(id)a3 error:(id *)a4
{
  fairplayContext = self->_fairplayContext;
  if (!fairplayContext)
  {
    v18 = 0;
LABEL_12:
    v19 = 0;
    goto LABEL_18;
  }
  uint64_t v24 = 0;
  unsigned int v23 = 0;
  char v22 = -1;
  p_hardwareInfo = &self->_hardwareInfo;
  id v8 = a3;
  id v9 = [v8 bytes];
  id v10 = [v8 length];

  sub_100047564(200, (uint64_t)p_hardwareInfo, (uint64_t)fairplayContext, (uint64_t)v9, (uint64_t)v10, (uint64_t)&v24, (uint64_t)&v23, (uint64_t)&v22);
  if (v11)
  {
    signed int v12 = v11;
    id v13 = AFSiriLogContextSession;
    uint64_t v14 = v11;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[ADDeviceAuthenticationSessionV1 _exchangeData:error:]";
      __int16 v27 = 2050;
      uint64_t v28 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s SAP exchange failed: %{public}li", buf, 0x16u);
    }
    [(ADDeviceAuthenticationSessionV1 *)self invalidate];
    if ((vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_s32(vdupq_n_s32(v12), (int32x4_t)xmmword_1003E29D0), (int8x16_t)xmmword_1003E29E0)) & 0xF) != 0)v15 = @"com.apple.assistant.deviceAuth.session.badCertificateError"; {
    else
    }
      v15 = @"com.apple.assistant.deviceAuth.session.GenericError";
    unsigned int v16 = v15;
    v17 = +[NSError errorWithDomain:v16 code:v14 userInfo:&off_100523C48];
    v18 = v17;
    if (a4) {
      *a4 = v17;
    }

    goto LABEL_12;
  }
  unint64_t v20 = v22;
  if (v20 == 1) {
    goto LABEL_16;
  }
  if (!v22)
  {
    unint64_t v20 = 2;
LABEL_16:
    self->_sessionState = v20;
  }
  v19 = +[NSData dataWithBytes:v24 length:v23];
  sub_10002C178(v24);
  v18 = 0;
LABEL_18:

  return v19;
}

- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    signed int v12 = "-[ADDeviceAuthenticationSessionV1 completeWithHandshakeResponse:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }
  id v8 = [(ADDeviceAuthenticationSessionV1 *)self _exchangeData:v6 error:a4];
  BOOL v9 = v8 != 0;

  return v9;
}

- (id)handshakeRequestWithCertificateData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int v11 = "-[ADDeviceAuthenticationSessionV1 handshakeRequestWithCertificateData:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [(ADDeviceAuthenticationSessionV1 *)self _exchangeData:v6 error:a4];

  return v8;
}

- (unint64_t)strategyVersion
{
  return 1;
}

- (void)dealloc
{
  [(ADDeviceAuthenticationSessionV1 *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ADDeviceAuthenticationSessionV1;
  [(ADDeviceAuthenticationSessionV1 *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADDeviceAuthenticationSessionV1 invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  self->_sessionState = 0;
  fairplayContext = self->_fairplayContext;
  if (fairplayContext)
  {
    sub_100013CFC((uint64_t)fairplayContext);
    self->_fairplayContext = 0;
  }
}

- (ADDeviceAuthenticationSessionV1)init
{
  v10.receiver = self;
  v10.super_class = (Class)ADDeviceAuthenticationSessionV1;
  v2 = [(ADDeviceAuthenticationSessionV1 *)&v10 init];
  if (v2)
  {
    sub_100042B60(0, 0, (uint64_t)&v2->_hardwareInfo);
    if (v3)
    {
      int v4 = v3;
      int v5 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        signed int v12 = "-[ADDeviceAuthenticationSessionV1 init]";
        __int16 v13 = 1026;
        int v14 = v4;
        id v6 = "%s Could not initialize hardware info: %{public}d";
LABEL_10:
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
    sub_10001BB54((uint64_t)&v2->_fairplayContext, (uint64_t)&v2->_hardwareInfo);
    if (v7)
    {
      int v8 = v7;
      int v5 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        signed int v12 = "-[ADDeviceAuthenticationSessionV1 init]";
        __int16 v13 = 1026;
        int v14 = v8;
        id v6 = "%s Could not create SAP session: %{public}d";
        goto LABEL_10;
      }
LABEL_7:

      return 0;
    }
  }
  return v2;
}

@end