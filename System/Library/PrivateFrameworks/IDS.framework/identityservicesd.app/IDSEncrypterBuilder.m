@interface IDSEncrypterBuilder
+ (id)builderWithPublicKeyStorage:(id)a3 peerIDManager:(id)a4 accountController:(id)a5 registrationKeyManager:(id)a6 rateLimiter:(id)a7 OTRController:(id)a8 serviceController:(id)a9 avoidMainQueue:(BOOL)a10 forceEncryptionType:(int64_t)a11;
- (BOOL)avoidMainQueue;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSEncrypterBuilder)initWithPublicKeyStorage:(id)a3 peerIDManager:(id)a4 accountController:(id)a5 registrationKeyManager:(id)a6 rateLimiter:(id)a7 OTRController:(id)a8 serviceController:(id)a9 avoidMainQueue:(BOOL)a10 forceEncryptionType:(int64_t)a11;
- (IDSOTRController)OTRController;
- (IDSPeerIDManager)peerIDManager;
- (IDSPublicKeyStorage)publicKeyStorage;
- (IDSRateLimiter)rateLimiter;
- (IDSRegistrationKeyManager)registrationKeyManager;
- (id)_createHashingDeviceIdentityEncrypter;
- (id)encrypterWithDeviceID:(id)a3;
- (id)encrypterWithEndpoint:(id)a3;
- (id)encrypterWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7;
- (id)encrypterWithOTRToken:(id)a3;
- (id)signerWithKeyType:(unsigned int)a3 keyDiversifier:(id)a4 service:(id)a5;
- (id)verifierWithEndpoint:(id)a3 keyType:(unsigned int)a4 keyDiversifier:(id)a5;
- (id)verifierWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7 keyType:(unsigned int)a8 keyDiversifier:(id)a9;
- (int64_t)forceEncryptionType;
- (void)setAccountController:(id)a3;
- (void)setAvoidMainQueue:(BOOL)a3;
- (void)setForceEncryptionType:(int64_t)a3;
- (void)setOTRController:(id)a3;
- (void)setPeerIDManager:(id)a3;
- (void)setPublicKeyStorage:(id)a3;
- (void)setRateLimiter:(id)a3;
- (void)setRegistrationKeyManager:(id)a3;
- (void)setServiceController:(id)a3;
@end

@implementation IDSEncrypterBuilder

+ (id)builderWithPublicKeyStorage:(id)a3 peerIDManager:(id)a4 accountController:(id)a5 registrationKeyManager:(id)a6 rateLimiter:(id)a7 OTRController:(id)a8 serviceController:(id)a9 avoidMainQueue:(BOOL)a10 forceEncryptionType:(int64_t)a11
{
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  LOBYTE(v27) = a10;
  id v25 = [objc_alloc((Class)a1) initWithPublicKeyStorage:v24 peerIDManager:v23 accountController:v22 registrationKeyManager:v21 rateLimiter:v20 OTRController:v19 serviceController:v18 avoidMainQueue:v27 forceEncryptionType:a11];

  return v25;
}

- (IDSEncrypterBuilder)initWithPublicKeyStorage:(id)a3 peerIDManager:(id)a4 accountController:(id)a5 registrationKeyManager:(id)a6 rateLimiter:(id)a7 OTRController:(id)a8 serviceController:(id)a9 avoidMainQueue:(BOOL)a10 forceEncryptionType:(int64_t)a11
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v18 = a8;
  id v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)IDSEncrypterBuilder;
  id v20 = [(IDSEncrypterBuilder *)&v28 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_publicKeyStorage, a3);
    objc_storeStrong((id *)&v21->_peerIDManager, a4);
    objc_storeStrong((id *)&v21->_accountController, a5);
    objc_storeStrong((id *)&v21->_registrationKeyManager, a6);
    objc_storeStrong((id *)&v21->_rateLimiter, a7);
    objc_storeStrong((id *)&v21->_OTRController, a8);
    objc_storeStrong((id *)&v21->_serviceController, a9);
    v21->_avoidMainQueue = a10;
    v21->_forceEncryptionType = a11;
  }

  return v21;
}

- (id)_createHashingDeviceIdentityEncrypter
{
  v3 = [[IDSMPFullDeviceIdentityContainerEncrypter alloc] initWithRegistrationKeyManager:self->_registrationKeyManager];
  v4 = [[IDSMessageHashChecker alloc] initWithRegistrationKeyManager:self->_registrationKeyManager];
  v5 = [[IDSHashingDeviceIdentityEncrypter alloc] initWithDeviceIdentityContainerEncrypter:v3 messageHashChecker:v4];

  return v5;
}

- (id)encrypterWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7
{
  id v25 = a7;
  id v24 = a6;
  id v23 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(IDSEncrypterBuilder *)self _createHashingDeviceIdentityEncrypter];
  v15 = [IDSURIEncrypter alloc];
  peerIDManager = self->_peerIDManager;
  rateLimiter = self->_rateLimiter;
  id v18 = +[IDSDaemon sharedInstance];
  id v19 = [v18 replayStateCommitter];
  id v20 = +[IDSPublicIdentityCache sharedInstance];
  id v21 = [(IDSURIEncrypter *)v15 initWithPeerIDManager:peerIDManager fullDeviceIdentityContainerEncrypter:v14 rateLimiter:rateLimiter replayCommitter:v19 publicIdentityCache:v20 avoidMainQueue:self->_avoidMainQueue];

  [(IDSURIEncrypter *)v21 setForceLegacy:(id)[(IDSEncrypterBuilder *)self forceEncryptionType] == (id)1];
  [(IDSURIEncrypter *)v21 setupWithLocalURI:v13 remoteURI:v12 pushToken:v23 service:v24 cert:v25];

  return v21;
}

- (id)encrypterWithDeviceID:(id)a3
{
  id v4 = a3;
  v5 = [(IDSEncrypterBuilder *)self _createHashingDeviceIdentityEncrypter];
  v6 = [[IDSDeviceIDEncrypter alloc] initWithPublicKeyStorage:self->_publicKeyStorage accountController:self->_accountController fullDeviceIdentityContainerEncrypter:v5 rateLimiter:self->_rateLimiter forceLegacy:(id)[(IDSEncrypterBuilder *)self forceEncryptionType] == (id)1];
  [(IDSDeviceIDEncrypter *)v6 setDeviceID:v4];

  return v6;
}

- (id)encrypterWithEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [(IDSEncrypterBuilder *)self _createHashingDeviceIdentityEncrypter];
  v6 = [IDSEndpointEncrypter alloc];
  v7 = +[IDSDaemon sharedInstance];
  v8 = [v7 replayStateCommitter];
  v9 = [(IDSEndpointEncrypter *)v6 initWithEndpoint:v4 fullDeviceIdentityContainerEncrypter:v5 replayCommitter:v8 forceEncryptionType:[(IDSEncrypterBuilder *)self forceEncryptionType]];

  return v9;
}

- (id)encrypterWithOTRToken:(id)a3
{
  id v4 = a3;
  v5 = [[IDSOTREncrypter alloc] initWithOTRController:self->_OTRController OTRToken:v4];

  return v5;
}

- (id)signerWithKeyType:(unsigned int)a3 keyDiversifier:(id)a4 service:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [[IDSMPFullDeviceIdentityContainerEncrypter alloc] initWithRegistrationKeyManager:self->_registrationKeyManager];
  v11 = [[IDSSigningEncrypter alloc] initWithKeyType:v6 keyDiversifier:v9 service:v8 serviceController:self->_serviceController fullDeviceIdentitySigner:v10];

  return v11;
}

- (id)verifierWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7 keyType:(unsigned int)a8 keyDiversifier:(id)a9
{
  id v26 = a9;
  id v27 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [[IDSMPFullDeviceIdentityContainerEncrypter alloc] initWithRegistrationKeyManager:self->_registrationKeyManager];
  id v20 = [IDSURIEncrypter alloc];
  peerIDManager = self->_peerIDManager;
  rateLimiter = self->_rateLimiter;
  id v23 = +[IDSPublicIdentityCache sharedInstance];
  id v24 = [(IDSURIEncrypter *)v20 initWithPeerIDManager:peerIDManager fullDeviceIdentitySigner:v19 rateLimiter:rateLimiter publicIdentityCache:v23 avoidMainQueue:self->_avoidMainQueue];

  [(IDSURIEncrypter *)v24 setupWithLocalURI:v18 remoteURI:v17 pushToken:v16 service:v15 cert:v27 keyType:a8 keyDiversifier:v26];

  return v24;
}

- (id)verifierWithEndpoint:(id)a3 keyType:(unsigned int)a4 keyDiversifier:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [[IDSMPFullDeviceIdentityContainerEncrypter alloc] initWithRegistrationKeyManager:self->_registrationKeyManager];
  v11 = [[IDSEndpointEncrypter alloc] initWithEndpoint:v9 fullDeviceIdentitySigner:v10 keyType:v5 keyDiversifier:v8];

  return v11;
}

- (IDSPublicKeyStorage)publicKeyStorage
{
  return self->_publicKeyStorage;
}

- (void)setPublicKeyStorage:(id)a3
{
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSRegistrationKeyManager)registrationKeyManager
{
  return self->_registrationKeyManager;
}

- (void)setRegistrationKeyManager:(id)a3
{
}

- (IDSRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (IDSOTRController)OTRController
{
  return self->_OTRController;
}

- (void)setOTRController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (BOOL)avoidMainQueue
{
  return self->_avoidMainQueue;
}

- (void)setAvoidMainQueue:(BOOL)a3
{
  self->_avoidMainQueue = a3;
}

- (int64_t)forceEncryptionType
{
  return self->_forceEncryptionType;
}

- (void)setForceEncryptionType:(int64_t)a3
{
  self->_forceEncryptionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_OTRController, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_registrationKeyManager, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_peerIDManager, 0);

  objc_storeStrong((id *)&self->_publicKeyStorage, 0);
}

@end