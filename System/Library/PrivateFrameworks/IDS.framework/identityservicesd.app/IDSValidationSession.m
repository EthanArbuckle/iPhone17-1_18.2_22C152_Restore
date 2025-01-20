@interface IDSValidationSession
+ (BOOL)_isAbsintheV3EnabledByServerBag;
+ (BOOL)_isBAAOptionEnabledByServerBag;
+ (BOOL)isSigningSupported;
+ (id)_BAACertTTLInMinutesFromServerBag;
+ (id)_BAAFetchTimeoutFromServerBag;
+ (id)retrieveLocalUDID;
+ (void)absintheValidationSessionOnQueue:(id)a3 withCompletion:(id)a4;
+ (void)baaOnlyValidationSessionOnQueue:(id)a3 withCompletion:(id)a4;
+ (void)validationSessionOnQueue:(id)a3 mechanism:(int64_t)a4 withCompletion:(id)a5;
- (BOOL)_shouldUseAbsintheV3;
- (BOOL)_shouldUseAbsintheV4;
- (BOOL)_shouldUseBAACertOption;
- (BOOL)_shouldUseDebugPiscoLogging;
- (BOOL)_shouldUsePSCBAA;
- (BOOL)isInitializedForSigning;
- (BOOL)isUsingAbsintheV3;
- (BOOL)isUsingAbsintheV4;
- (BOOL)isUsingBAA;
- (IDSBAASigner)baaSigner;
- (IDSValidationSession)initWithQueue:(id)a3 mechanism:(int64_t)a4;
- (NSData)BAACert;
- (NSData)helloMessage;
- (NSData)intermediateRootCert;
- (NSError)lastBAAError;
- (NSString)IMEI;
- (NSString)MEID;
- (NSString)UDID;
- (NSString)serialNumber;
- (OS_dispatch_queue)BAAQueue;
- (OS_dispatch_queue)queue;
- (PSCSessionInternal_)pscSession;
- (__SecKey)BIKKeyRef;
- (id)_deviceAbsintheIMEI;
- (id)_deviceAbsintheMEID;
- (id)_deviceAbsintheSerialNumber;
- (id)_deviceAbsintheUDID;
- (id)activateWithValidationData:(id)a3 serverKey:(id)a4;
- (id)description;
- (int64_t)mechanism;
- (int64_t)stateFlags;
- (void)_fetchDeviceIdentityIfNeededWithCompletion:(id)a3;
- (void)dealloc;
- (void)headersBySigningData:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)purgeCachedCertsForSubsystemMechanism:(int64_t)a3;
- (void)setBAACert:(id)a3;
- (void)setBAAQueue:(id)a3;
- (void)setBIKKeyRef:(__SecKey *)a3;
- (void)setHelloMessage:(id)a3;
- (void)setIMEI:(id)a3;
- (void)setIntermediateRootCert:(id)a3;
- (void)setLastBAAError:(id)a3;
- (void)setMEID:(id)a3;
- (void)setPscSession:(PSCSessionInternal_ *)a3;
- (void)setQueue:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStateFlags:(int64_t)a3;
- (void)setUDID:(id)a3;
- (void)signData:(id)a3 completion:(id)a4;
@end

@implementation IDSValidationSession

- (IDSValidationSession)initWithQueue:(id)a3 mechanism:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSValidationSession;
  v8 = [(IDSValidationSession *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_stateFlags = 0;
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_mechanism = a4;
    v10 = (IDSBAASigner *)[objc_alloc((Class)IDSBAASigner) initWithQueue:v7];
    baaSigner = v9->_baaSigner;
    v9->_baaSigner = v10;
  }
  return v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = [(IDSValidationSession *)self isInitializedForSigning];
  CFStringRef v5 = @"NO";
  if (v4) {
    CFStringRef v5 = @"YES";
  }
  return +[NSString stringWithFormat:@"<%@ %p isInitializedForSigning: %@>", v3, self, v5];
}

- (void)dealloc
{
  [(IDSValidationSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)IDSValidationSession;
  [(IDSValidationSession *)&v3 dealloc];
}

+ (void)validationSessionOnQueue:(id)a3 mechanism:(int64_t)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    [a1 baaOnlyValidationSessionOnQueue:v9 withCompletion:v8];
  }
  else if (!a4)
  {
    [a1 absintheValidationSessionOnQueue:v9 withCompletion:v8];
  }
}

+ (void)baaOnlyValidationSessionOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[IDSValidationSession alloc] initWithQueue:v6 mechanism:1];

  id v8 = [(IDSValidationSession *)v7 baaSigner];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015064C;
  v11[3] = &unk_100983C58;
  v12 = v7;
  id v13 = v5;
  id v9 = v5;
  v10 = v7;
  [v8 fetchBAAIdentityIfNeededWithCompletion:v11];
}

+ (void)absintheValidationSessionOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, IDSValidationSession *, void *))a4;
  id v7 = [[IDSValidationSession alloc] initWithQueue:v5 mechanism:0];
  id v8 = [(IDSValidationSession *)v7 queue];
  dispatch_assert_queue_V2(v8);

  id v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initializing validation session { self: %@ }", (uint8_t *)&buf, 0xCu);
  }

  [(IDSValidationSession *)v7 setHelloMessage:0];
  v10 = [(IDSValidationSession *)v7 _deviceAbsintheUDID];
  [(IDSValidationSession *)v7 setUDID:v10];

  v11 = [(IDSValidationSession *)v7 UDID];
  LODWORD(v10) = v11 == 0;

  if (v10)
  {
    v16 = +[IMRGLog warning];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_100713184(v16);
    }

    v17 = +[NSError errorWithDomain:@"IDSValidationSessionErrorDomain" code:-3000 userInfo:0];
    v6[2](v6, v7, v17);
  }
  else
  {
    v12 = [(IDSValidationSession *)v7 _deviceAbsintheSerialNumber];
    [(IDSValidationSession *)v7 setSerialNumber:v12];

    id v13 = [(IDSValidationSession *)v7 _deviceAbsintheIMEI];
    [(IDSValidationSession *)v7 setIMEI:v13];

    v14 = [(IDSValidationSession *)v7 _deviceAbsintheMEID];
    [(IDSValidationSession *)v7 setMEID:v14];

    if ([(IDSValidationSession *)v7 pscSession])
    {
      sub_10067B0D8((uint64_t)[(IDSValidationSession *)v7 pscSession]);
      [(IDSValidationSession *)v7 setPscSession:0];
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x2020000000;
    int v24 = 0;
    if ([(IDSValidationSession *)v7 _shouldUseAbsintheV3])
    {
      *(_DWORD *)(*((void *)&buf + 1) + 24) = 1;
      [(IDSValidationSession *)v7 setStateFlags:(unint64_t)[(IDSValidationSession *)v7 stateFlags] | 4];
      if ([(IDSValidationSession *)v7 _shouldUseAbsintheV4])
      {
        *(_DWORD *)(*((void *)&buf + 1) + 24) |= 2u;
        [(IDSValidationSession *)v7 setStateFlags:(unint64_t)[(IDSValidationSession *)v7 stateFlags] | 8];
      }
    }
    v15 = [(IDSValidationSession *)v7 baaSigner];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100150B40;
    v18[3] = &unk_100983C80;
    p_long long buf = &buf;
    v19 = v7;
    v20 = v6;
    [v15 fetchBAAIdentityIfNeededWithCompletion:v18];

    _Block_object_dispose(&buf, 8);
  }
}

- (void)purgeCachedCertsForSubsystemMechanism:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [(IDSValidationSession *)self baaSigner];
    [v4 purgeBAACertForTopic:0];
  }
}

- (id)activateWithValidationData:(id)a3 serverKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"YES";
    if (v6) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    *(_DWORD *)long long buf = 138412802;
    *(void *)&buf[4] = self;
    CFStringRef v38 = v10;
    __int16 v37 = 2112;
    if (!v7) {
      CFStringRef v9 = @"NO";
    }
    __int16 v39 = 2112;
    CFStringRef v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activating validation session { self: %@, validationData: %@, serverKey: %@ }", buf, 0x20u);
  }

  if ([(IDSValidationSession *)self _shouldUseDebugPiscoLogging])
  {
    v11 = +[IMRGLog sysdiagnose_oversized];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Pisco] {validationData: %@}", buf, 0xCu);
    }

    v12 = +[IMRGLog sysdiagnose_oversized];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Pisco] {serverKey: %@}", buf, 0xCu);
    }
  }
  id v13 = 0;
  if (v6 && v7)
  {
    if (![(IDSValidationSession *)self pscSession]
      || [(IDSValidationSession *)self _shouldUsePSCBAA])
    {
LABEL_18:
      id v13 = 0;
      goto LABEL_25;
    }
    v14 = [(IDSValidationSession *)self pscSession];
    id v15 = v6;
    id v16 = [v15 bytes];
    LODWORD(v15) = [v15 length];
    id v17 = v7;
    LODWORD(v15) = sub_1005CA19C((uint64_t)v14, (uint64_t)v16, (int)v15, (uint64_t)[v17 bytes], (int)objc_msgSend(v17, "length"));
    v18 = +[IMRGLog registration];
    v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_100713230();
      }

      if ([(IDSValidationSession *)self pscSession])
      {
        sub_10067B0D8((uint64_t)[(IDSValidationSession *)self pscSession]);
        [(IDSValidationSession *)self setPscSession:0];
      }
      id v13 = +[NSError errorWithDomain:@"IDSValidationSessionErrorDomain" code:-4000 userInfo:0];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Successfully activated validation session", buf, 2u);
      }

      [(IDSValidationSession *)self setStateFlags:(unint64_t)[(IDSValidationSession *)self stateFlags] | 1];
      id v13 = [(IDSValidationSession *)self BAACert];
      if (v13)
      {
        uint64_t v21 = [(IDSValidationSession *)self intermediateRootCert];
        if (v21)
        {
          v22 = (void *)v21;
          uint64_t v23 = [(IDSValidationSession *)self BIKKeyRef];

          if (v23)
          {
            int v24 = +[IMRGLog registration];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Adding option to validation session", buf, 2u);
            }

            *(void *)long long buf = [(IDSValidationSession *)self pscSession];
            v34 = [(IDSValidationSession *)self BIKKeyRef];
            id v25 = [(IDSValidationSession *)self BAACert];
            id v33 = [v25 bytes];
            v26 = [(IDSValidationSession *)self BAACert];
            int v27 = [v26 length];
            id v28 = [(IDSValidationSession *)self intermediateRootCert];
            id v29 = [v28 bytes];
            v30 = [(IDSValidationSession *)self intermediateRootCert];
            LODWORD(v29) = sub_100708170((uint64_t)buf, (uint64_t)v34, (uint64_t)v33, v27, (uint64_t)v29, (int)[v30 length]);

            if (v29 || !*(void *)buf)
            {
              v32 = +[IMRGLog warning];
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
                sub_1007131C8();
              }
            }
            else
            {
              v31 = +[IMRGLog registration];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v35 = 0;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully added option to validation session", v35, 2u);
              }

              [(IDSValidationSession *)self setPscSession:*(void *)buf];
              [(IDSValidationSession *)self setStateFlags:(unint64_t)[(IDSValidationSession *)self stateFlags] | 0x10];
            }
          }
        }
        else
        {
        }
        goto LABEL_18;
      }
    }
  }
LABEL_25:

  return v13;
}

- (void)signData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v40 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Signing data using validation session { self: %@ }", buf, 0xCu);
  }

  CFStringRef v9 = [v6 sha256Digest];
  if (([(IDSValidationSession *)self stateFlags] & 1) == 0 || !v9) {
    goto LABEL_12;
  }
  int64_t v10 = [(IDSValidationSession *)self mechanism];
  if (v10 == 1)
  {
    v19 = [(IDSValidationSession *)self baaSigner];
    v20 = [(IDSValidationSession *)self BIKKeyRef];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100151EDC;
    v28[3] = &unk_100983CD0;
    id v29 = v7;
    [v19 signData:v6 withKey:v20 completion:v28];

    id v17 = v29;
    goto LABEL_14;
  }
  if (!v10)
  {
    if ([(IDSValidationSession *)self pscSession])
    {
      uint64_t v38 = 0;
      unsigned int v37 = 0;
      uint64_t v36 = 0;
      unsigned int v35 = 0;
      v11 = [(IDSValidationSession *)self pscSession];
      v12 = v9;
      if (sub_1005E88E0((uint64_t)v11, (uint64_t)[(IDSValidationSession *)v12 bytes], (int)[(IDSValidationSession *)v12 length], (uint64_t)&v38, (uint64_t)&v37, (uint64_t)&v36, (uint64_t)&v35))
      {
        id v13 = +[IMRGLog warning];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_100713298();
        }

        v14 = +[NSError errorWithDomain:@"IDSValidationSessionErrorDomain" code:-5000 userInfo:0];
        id v15 = 0;
        id v16 = 0;
      }
      else
      {
        uint64_t v21 = +[IMRGLog registration];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Successfully signed data in validation session", buf, 2u);
        }

        id v15 = +[NSData dataWithBytes:v38 length:v37];
        id v16 = +[NSData dataWithBytes:v36 length:v35];
        if ([(IDSValidationSession *)self _shouldUseDebugPiscoLogging])
        {
          v22 = +[IMRGLog sysdiagnose_oversized];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            CFStringRef v40 = v12;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[Pisco] {dataToSign: %@}", buf, 0xCu);
          }

          uint64_t v23 = +[IMRGLog sysdiagnose_oversized];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            CFStringRef v40 = v15;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Pisco] {absintheSignature: %@}", buf, 0xCu);
          }

          int v24 = +[IMRGLog sysdiagnose_oversized];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            CFStringRef v40 = v16;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Pisco] {outServKey: %@}", buf, 0xCu);
          }
        }
        v14 = 0;
      }
      if (v38)
      {
        sub_1005CA308(v38);
        uint64_t v38 = 0;
      }
      if (v36)
      {
        sub_1005CA308(v36);
        uint64_t v36 = 0;
      }
      id v25 = [(IDSValidationSession *)self baaSigner];
      v26 = [(IDSValidationSession *)self BIKKeyRef];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100151E50;
      v30[3] = &unk_100983CA8;
      v31 = v15;
      v32 = v16;
      id v33 = v14;
      id v34 = v7;
      id v17 = v14;
      int v27 = v16;
      v18 = v15;
      [v25 signData:v6 withKey:v26 completion:v30];

      goto LABEL_13;
    }
LABEL_12:
    id v17 = +[NSError errorWithDomain:@"IDSValidationSessionErrorDomain" code:-6000 userInfo:0];
    v18 = [[IDSValidationSigningResult alloc] initWithAbsintheResultData:0 absintheServerKey:0 absintheError:v17 baaResult:0];
    (*((void (**)(id, IDSValidationSigningResult *))v7 + 2))(v7, v18);
LABEL_13:

LABEL_14:
  }
}

- (void)headersBySigningData:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015202C;
  v7[3] = &unk_100983CF8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(IDSValidationSession *)v8 signData:v6 completion:v7];
}

- (void)invalidate
{
  uint64_t v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating validation session { self: %@ }", (uint8_t *)&v4, 0xCu);
  }

  [(IDSValidationSession *)self setStateFlags:0];
  [(IDSValidationSession *)self setHelloMessage:0];
  [(IDSValidationSession *)self setUDID:0];
  [(IDSValidationSession *)self setSerialNumber:0];
  [(IDSValidationSession *)self setIMEI:0];
  [(IDSValidationSession *)self setMEID:0];
  [(IDSValidationSession *)self setBAACert:0];
  [(IDSValidationSession *)self setIntermediateRootCert:0];
  if ([(IDSValidationSession *)self pscSession])
  {
    sub_10067B0D8((uint64_t)[(IDSValidationSession *)self pscSession]);
    [(IDSValidationSession *)self setPscSession:0];
  }
  if ([(IDSValidationSession *)self BIKKeyRef])
  {
    CFRelease([(IDSValidationSession *)self BIKKeyRef]);
    [(IDSValidationSession *)self setBIKKeyRef:0];
  }
}

- (BOOL)isInitializedForSigning
{
  return [(IDSValidationSession *)self stateFlags] & 1;
}

- (BOOL)isUsingAbsintheV3
{
  return ((unint64_t)[(IDSValidationSession *)self stateFlags] >> 2) & 1;
}

- (BOOL)isUsingAbsintheV4
{
  return ((unint64_t)[(IDSValidationSession *)self stateFlags] >> 3) & 1;
}

- (BOOL)isUsingBAA
{
  return ((unint64_t)[(IDSValidationSession *)self stateFlags] >> 4) & 1;
}

+ (BOOL)isSigningSupported
{
  if ([a1 _isAbsintheV3EnabledByServerBag])
  {
    if (+[IMUserDefaults isPiscoDisabled])
    {
      v2 = +[IMLockdownManager sharedInstance];
      unsigned int v3 = [v2 isInternalInstall] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)_isAbsintheV3EnabledByServerBag
{
  v2 = +[IDSServerBag sharedInstanceForBagType:0];
  unsigned int v3 = [v2 objectForKey:@"absinthe-v3-enabled"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (BOOL)_isBAAOptionEnabledByServerBag
{
  v2 = +[IDSServerBag sharedInstanceForBagType:0];
  unsigned int v3 = [v2 objectForKey:@"absinthe-baa-option-enabled-ios13"];
  if ((v3
     || ([v2 objectForKey:@"absinthe-baa-option-enabled"],
         (unsigned int v3 = objc_claimAutoreleasedReturnValue()) != 0))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else
  {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (id)_BAAFetchTimeoutFromServerBag
{
  v2 = +[IDSServerBag sharedInstanceForBagType:0];
  unsigned int v3 = [v2 objectForKey:@"absinthe-baa-timeout"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_BAACertTTLInMinutesFromServerBag
{
  v2 = +[IDSServerBag sharedInstanceForBagType:0];
  unsigned int v3 = [v2 objectForKey:@"absinthe-baa-cert-ttl-minutes"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldUseAbsintheV3
{
  return 1;
}

- (BOOL)_shouldUseAbsintheV4
{
  if (![(IDSValidationSession *)self _shouldUseAbsintheV3]
    || !+[IMUserDefaults isAbsintheV4Enabled])
  {
    return 0;
  }
  v2 = +[IMLockdownManager sharedInstance];
  unsigned __int8 v3 = [v2 isInternalInstall];

  return v3;
}

- (BOOL)_shouldUsePSCBAA
{
  return 0;
}

- (BOOL)_shouldUseBAACertOption
{
  if ([(id)objc_opt_class() _isBAAOptionEnabledByServerBag])
  {
    if (+[IMUserDefaults isBAACertDisabled])
    {
      v2 = +[IMLockdownManager sharedInstance];
      unsigned int v3 = [v2 isInternalInstall] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_shouldUseDebugPiscoLogging
{
  BOOL v2 = +[IMUserDefaults isDebugPiscoLoggingEnabled];
  if (v2)
  {
    unsigned int v3 = +[IMLockdownManager sharedInstance];
    unsigned __int8 v4 = [v3 isInternalInstall];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)_fetchDeviceIdentityIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSValidationSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(IDSValidationSession *)self _shouldUseBAACertOption])
  {
    id v6 = [(IDSValidationSession *)self BAAQueue];

    if (!v6)
    {
      id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.IDS.IDSValidationSession.BAA", v7);
      [(IDSValidationSession *)self setBAAQueue:v8];
    }
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = sub_100153064;
    v39[4] = sub_100153074;
    id v40 = 0;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_100153064;
    v37[4] = sub_100153074;
    id v38 = 0;
    uint64_t v9 = [(id)objc_opt_class() _BAACertTTLInMinutesFromServerBag];
    id v10 = (void *)v9;
    v11 = &off_1009D2DE8;
    if (v9) {
      v11 = (_UNKNOWN **)v9;
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10015307C;
    v31[3] = &unk_100983D70;
    v12 = v11;
    id v32 = v12;
    id v33 = self;
    id v34 = v41;
    unsigned int v35 = v39;
    uint64_t v36 = v37;
    id v13 = objc_retainBlock(v31);
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    int v24 = sub_1001534D4;
    id v25 = &unk_100983DE8;
    v26 = self;
    id v28 = v41;
    id v29 = v39;
    v30 = v37;
    id v27 = v4;
    v14 = objc_retainBlock(&v22);
    id v15 = objc_msgSend((id)objc_opt_class(), "_BAAFetchTimeoutFromServerBag", v22, v23, v24, v25, v26);
    id v16 = v15;
    if (v15)
    {
      [v15 doubleValue];
      double v18 = v17;
    }
    else
    {
      double v18 = 60.0;
    }
    uint64_t v21 = +[IMRGLog registration];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v45 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Starting device identity fetch task with timeout {timeoutInSeconds: %f}", buf, 0xCu);
    }

    dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
    im_dispatch_async_with_timeout();

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(v41, 8);
  }
  else if (v4)
  {
    NSErrorUserInfoKey v42 = NSDebugDescriptionErrorKey;
    CFStringRef v43 = @"Device identity fetch disabled";
    v19 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v20 = +[NSError errorWithDomain:@"IDSValidationSessionInternalErrorDomain" code:-12000 userInfo:v19];

    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v20);
  }
}

+ (id)retrieveLocalUDID
{
  BOOL v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)_deviceAbsintheUDID
{
  return +[IDSValidationSession retrieveLocalUDID];
}

- (id)_deviceAbsintheSerialNumber
{
  BOOL v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)_deviceAbsintheIMEI
{
  BOOL v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)_deviceAbsintheMEID
{
  BOOL v2 = (void *)MGCopyAnswer();

  return v2;
}

- (NSData)helloMessage
{
  return self->_helloMessage;
}

- (void)setHelloMessage:(id)a3
{
}

- (NSString)UDID
{
  return self->_UDID;
}

- (void)setUDID:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (void)setIMEI:(id)a3
{
}

- (NSString)MEID
{
  return self->_MEID;
}

- (void)setMEID:(id)a3
{
}

- (PSCSessionInternal_)pscSession
{
  return self->_pscSession;
}

- (void)setPscSession:(PSCSessionInternal_ *)a3
{
  self->_pscSession = a3;
}

- (__SecKey)BIKKeyRef
{
  return self->_BIKKeyRef;
}

- (void)setBIKKeyRef:(__SecKey *)a3
{
  self->_BIKKeyRef = a3;
}

- (OS_dispatch_queue)BAAQueue
{
  return self->_BAAQueue;
}

- (void)setBAAQueue:(id)a3
{
}

- (NSError)lastBAAError
{
  return self->_lastBAAError;
}

- (void)setLastBAAError:(id)a3
{
}

- (IDSBAASigner)baaSigner
{
  return self->_baaSigner;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)stateFlags
{
  return self->_stateFlags;
}

- (void)setStateFlags:(int64_t)a3
{
  self->_stateFlags = a3;
}

- (NSData)BAACert
{
  return self->_BAACert;
}

- (void)setBAACert:(id)a3
{
}

- (NSData)intermediateRootCert
{
  return self->_intermediateRootCert;
}

- (void)setIntermediateRootCert:(id)a3
{
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intermediateRootCert, 0);
  objc_storeStrong((id *)&self->_BAACert, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_baaSigner, 0);
  objc_storeStrong((id *)&self->_lastBAAError, 0);
  objc_storeStrong((id *)&self->_BAAQueue, 0);
  objc_storeStrong((id *)&self->_MEID, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_UDID, 0);

  objc_storeStrong((id *)&self->_helloMessage, 0);
}

@end