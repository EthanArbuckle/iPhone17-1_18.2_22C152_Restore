@interface IDSURIEncrypter
- (BOOL)_isNGMKeyType;
- (BOOL)_isReplayError:(id)a3;
- (BOOL)_isSecKeyType;
- (BOOL)avoidMainQueue;
- (BOOL)forceLegacy;
- (IDSCertifiedDeliveryReplayCommitter)replayCommitter;
- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter;
- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner;
- (IDSPeerIDManager)peerIDManager;
- (IDSPublicIdentityCache)publicIdentityCache;
- (IDSRateLimiter)rateLimiter;
- (IDSSigningKeyDiversifier)keyDiversifier;
- (IDSURI)localURI;
- (IDSURI)remoteURI;
- (IDSURIEncrypter)initWithPeerIDManager:(id)a3 fullDeviceIdentityContainerEncrypter:(id)a4 rateLimiter:(id)a5 replayCommitter:(id)a6 publicIdentityCache:(id)a7 avoidMainQueue:(BOOL)a8;
- (IDSURIEncrypter)initWithPeerIDManager:(id)a3 fullDeviceIdentitySigner:(id)a4 rateLimiter:(id)a5 publicIdentityCache:(id)a6 avoidMainQueue:(BOOL)a7;
- (NSData)cert;
- (NSData)pushToken;
- (NSString)service;
- (__SecKey)_copyLookupSecVerificationIdentity;
- (id)_lookupEndpoint;
- (id)_lookupIdentityWithLastResortFallback:(BOOL *)a3;
- (id)_lookupNGMVerificationIdentityShouldUseLastResort:(BOOL)a3 usedLastResort:(BOOL *)a4;
- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 usedIdentifier:(id *)a5 error:(id *)a6;
- (unsigned)keyType;
- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9;
- (void)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 withCompletion:(id)a6;
- (void)setForceLegacy:(BOOL)a3;
- (void)setupWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7;
- (void)setupWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7 keyType:(unsigned int)a8 keyDiversifier:(id)obj;
- (void)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 onQueue:(id)a6 withCompletion:(id)a7;
@end

@implementation IDSURIEncrypter

- (IDSURIEncrypter)initWithPeerIDManager:(id)a3 fullDeviceIdentityContainerEncrypter:(id)a4 rateLimiter:(id)a5 replayCommitter:(id)a6 publicIdentityCache:(id)a7 avoidMainQueue:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)IDSURIEncrypter;
  v18 = [(IDSURIEncrypter *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerIDManager, a3);
    objc_storeStrong((id *)&v19->_fullDeviceIdentityContainerEncrypter, a4);
    objc_storeStrong((id *)&v19->_rateLimiter, a5);
    objc_storeStrong((id *)&v19->_replayCommitter, a6);
    objc_storeStrong((id *)&v19->_publicIdentityCache, a7);
    v19->_avoidMainQueue = a8;
    v19->_forceLegacy = 0;
  }

  return v19;
}

- (IDSURIEncrypter)initWithPeerIDManager:(id)a3 fullDeviceIdentitySigner:(id)a4 rateLimiter:(id)a5 publicIdentityCache:(id)a6 avoidMainQueue:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IDSURIEncrypter;
  id v17 = [(IDSURIEncrypter *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_peerIDManager, a3);
    objc_storeStrong((id *)&v18->_fullDeviceIdentitySigner, a4);
    objc_storeStrong((id *)&v18->_rateLimiter, a5);
    objc_storeStrong((id *)&v18->_publicIdentityCache, a6);
    v18->_avoidMainQueue = a7;
  }

  return v18;
}

- (void)setupWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7
{
  v12 = (IDSURI *)a3;
  id v13 = (IDSURI *)a4;
  id v14 = (NSData *)a5;
  id v15 = (NSString *)a6;
  id v16 = (NSData *)a7;
  localURI = self->_localURI;
  self->_localURI = v12;
  v25 = v12;

  remoteURI = self->_remoteURI;
  self->_remoteURI = v13;
  v19 = v13;

  pushToken = self->_pushToken;
  self->_pushToken = v14;
  v21 = v14;

  service = self->_service;
  self->_service = v15;
  objc_super v23 = v15;

  cert = self->_cert;
  self->_cert = v16;
}

- (void)setupWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7 keyType:(unsigned int)a8 keyDiversifier:(id)obj
{
  self->_keyType = a8;
  objc_storeStrong((id *)&self->_keyDiversifier, obj);
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  [(IDSURIEncrypter *)self setupWithLocalURI:v19 remoteURI:v18 pushToken:v17 service:v16 cert:v15];
}

- (id)_lookupEndpoint
{
  v3 = [(IDSURIEncrypter *)self peerIDManager];
  v4 = [(IDSURIEncrypter *)self pushToken];
  v5 = +[IDSPushToken pushTokenWithData:v4 withServiceLoggingHint:self->_service];
  v6 = [(IDSURIEncrypter *)self remoteURI];
  v7 = [(IDSURIEncrypter *)self service];
  v8 = [(IDSURIEncrypter *)self localURI];
  v9 = [v3 endpointForPushToken:v5 URI:v6 service:v7 fromURI:v8];

  return v9;
}

- (id)_lookupIdentityWithLastResortFallback:(BOOL *)a3
{
  v5 = [(IDSURIEncrypter *)self _lookupEndpoint];
  v6 = [v5 publicDeviceIdentityContainer];
  if (v5)
  {
    BOOL v7 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = [(IDSURIEncrypter *)self publicIdentityCache];
  v10 = [(IDSURIEncrypter *)self pushToken];
  v11 = [(IDSURIEncrypter *)self remoteURI];
  v12 = [(IDSURIEncrypter *)self service];
  id v16 = 0;
  uint64_t v13 = [v9 identityForToken:v10 uri:v11 service:v12 error:&v16];
  id v14 = v16;

  if (v14)
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Error retrieving data from last resort cache: { error: %@ }", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled()) {
      _IDSLogEventV();
    }
  }
  BOOL v7 = v13 != 0;

  v6 = (void *)v13;
  if (a3) {
LABEL_3:
  }
    *a3 = v7;
LABEL_4:

  return v6;
}

- (BOOL)_isReplayError:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:NSUnderlyingErrorKey];

  v6 = [v3 domain];
  uint64_t v7 = IDSDecryptionErrorDomain;
  if ([v6 isEqualToString:IDSDecryptionErrorDomain]
    && [v3 code] == (id)15)
  {
    v8 = [v5 domain];
    if ([v8 isEqualToString:@"com.apple.messageprotection"]) {
      BOOL v9 = [v5 code] == (id)5;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  v10 = [v3 domain];
  if ([v10 isEqualToString:v7]) {
    BOOL v11 = [v3 code] == (id)5;
  }
  else {
    BOOL v11 = 0;
  }

  return v9 || v11;
}

- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 usedIdentifier:(id *)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [(IDSURIEncrypter *)self _lookupEndpoint];
  if (a5) {
    *a5 = IDSMPLegacyIdentityIdentifier;
  }
  fullDeviceIdentityContainerEncrypter = self->_fullDeviceIdentityContainerEncrypter;
  id v14 = [v12 publicDeviceIdentityContainer];
  id v15 = [(IDSMPFullDeviceIdentityContainerEncrypter *)fullDeviceIdentityContainerEncrypter legacyEncryptData:v11 withEncryptedAttributes:v10 withPublicDeviceIdentityContainer:v14 error:a6];

  return v15;
}

- (void)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007D658;
  v16[3] = &unk_100980950;
  v16[4] = self;
  id v17 = v10;
  id v19 = a5;
  id v20 = a6;
  id v18 = v11;
  id v12 = v19;
  id v13 = v20;
  id v14 = v11;
  id v15 = v10;
  [v12 performAsyncBlock:v16];
}

- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10007E3C8;
  v26[3] = &unk_100980AE0;
  v26[4] = self;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  BOOL v33 = a7;
  id v31 = v18;
  id v32 = a9;
  id v30 = v19;
  id v20 = v18;
  id v21 = v32;
  id v22 = v19;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  [v20 performAsyncBlock:v26];
}

- (void)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 onQueue:(id)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007FBB8;
  v19[3] = &unk_100980BF8;
  v19[4] = self;
  id v20 = v12;
  id v23 = a7;
  int64_t v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v23;
  [v15 performAsyncBlock:v19];
}

- (BOOL)_isNGMKeyType
{
  return [(IDSURIEncrypter *)self keyType] == 0;
}

- (BOOL)_isSecKeyType
{
  return [(IDSURIEncrypter *)self keyType] == 1;
}

- (id)_lookupNGMVerificationIdentityShouldUseLastResort:(BOOL)a3 usedLastResort:(BOOL *)a4
{
  if ([(IDSURIEncrypter *)self keyType])
  {
    uint64_t v7 = 0;
  }
  else
  {
    if (a3)
    {
      v8 = [(IDSURIEncrypter *)self _lookupIdentityWithLastResortFallback:a4];
      uint64_t v7 = [v8 ngmPublicDeviceIdentity];
    }
    else
    {
      v8 = [(IDSURIEncrypter *)self _lookupEndpoint];
      BOOL v9 = [v8 publicDeviceIdentityContainer];
      uint64_t v7 = [v9 ngmPublicDeviceIdentity];
    }
  }

  return v7;
}

- (__SecKey)_copyLookupSecVerificationIdentity
{
  if ([(IDSURIEncrypter *)self keyType] != 1) {
    return 0;
  }
  id v3 = [(IDSURIEncrypter *)self _lookupEndpoint];
  if ([v3 applicationPublicDeviceIdentity])
  {
    v4 = [(IDSURIEncrypter *)self _lookupEndpoint];
    v5 = (__SecKey *)CFRetain([v4 applicationPublicDeviceIdentity]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (IDSRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (IDSCertifiedDeliveryReplayCommitter)replayCommitter
{
  return self->_replayCommitter;
}

- (IDSPublicIdentityCache)publicIdentityCache
{
  return self->_publicIdentityCache;
}

- (BOOL)avoidMainQueue
{
  return self->_avoidMainQueue;
}

- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter
{
  return self->_fullDeviceIdentityContainerEncrypter;
}

- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner
{
  return self->_fullDeviceIdentitySigner;
}

- (IDSURI)localURI
{
  return self->_localURI;
}

- (IDSURI)remoteURI
{
  return self->_remoteURI;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (NSString)service
{
  return self->_service;
}

- (NSData)cert
{
  return self->_cert;
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (IDSSigningKeyDiversifier)keyDiversifier
{
  return self->_keyDiversifier;
}

- (BOOL)forceLegacy
{
  return self->_forceLegacy;
}

- (void)setForceLegacy:(BOOL)a3
{
  self->_forceLegacy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDiversifier, 0);
  objc_storeStrong((id *)&self->_cert, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_remoteURI, 0);
  objc_storeStrong((id *)&self->_localURI, 0);
  objc_storeStrong((id *)&self->_fullDeviceIdentitySigner, 0);
  objc_storeStrong((id *)&self->_fullDeviceIdentityContainerEncrypter, 0);
  objc_storeStrong((id *)&self->_publicIdentityCache, 0);
  objc_storeStrong((id *)&self->_replayCommitter, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);

  objc_storeStrong((id *)&self->_peerIDManager, 0);
}

@end