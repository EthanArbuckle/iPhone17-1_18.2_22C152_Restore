@interface DCBiometricStore
- (DCBiometricStore)init;
- (DCBiometricStoreClient)client;
- (void)bioBindingUnboundACL:(id)a3;
- (void)boundAppletPresentmentACL:(id)a3;
- (void)clearProgenitorKeyDesignationsWithCompletion:(id)a3;
- (void)credentialAuthenticationTokenStatus:(id)a3;
- (void)deleteGlobalAuthACLWithCompletion:(id)a3;
- (void)deleteGlobalAuthACLWithOutcomeCompletion:(id)a3;
- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4;
- (void)generatePhoneTokenWithNonce:(id)a3 keyBlob:(id)a4 pairingID:(id)a5 completion:(id)a6;
- (void)generatePrearmTrustCertificateWithNonce:(id)a3 pairingID:(id)a4 completion:(id)a5;
- (void)getCASDCertificate:(id)a3;
- (void)getGlobalProgenitorKeyAttestation:(id)a3;
- (void)getGlobalThirdPartyProgenitorKeyAttestation:(id)a3;
- (void)globalAuthACLTemplateUUIDsAndCredentialCountWithCompletion:(id)a3;
- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3;
- (void)globalAuthACLWithCompletion:(id)a3;
- (void)migratePrearmTrustBlob:(id)a3 completion:(id)a4;
- (void)nonceForAuthorizationTokenWithCompletion:(id)a3;
- (void)passcodeBindingUnboundACL:(id)a3;
- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4;
- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:(id)a3 onlyIfNeeded:(BOOL)a4 completion:(id)a5;
- (void)revokeCredentialAuthorizationToken:(id)a3;
- (void)setGlobalAuthACL:(id)a3 ofType:(unint64_t)a4 completion:(id)a5;
- (void)setModifiedGlobalAuthACL:(id)a3 externalizedLAContext:(id)a4 completion:(id)a5;
@end

@implementation DCBiometricStore

- (DCBiometricStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)DCBiometricStore;
  v2 = [(DCBiometricStore *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(DCBiometricStoreClient);
    client = v2->_client;
    v2->_client = v3;
  }
  return v2;
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 nonceForAuthorizationTokenWithCompletion:v4];
}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DCBiometricStore *)self client];
  [v8 prearmCredentialWithAuthorizationToken:v7 completion:v6];
}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DCBiometricStore *)self client];
  [v8 establishPrearmTrustV2:v7 completion:v6];
}

- (void)revokeCredentialAuthorizationToken:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 revokeCredentialAuthorizationToken:v4];
}

- (void)bioBindingUnboundACL:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 bioBindingUnboundACL:v4];
}

- (void)passcodeBindingUnboundACL:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 passcodeBindingUnboundACL:v4];
}

- (void)setGlobalAuthACL:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(DCBiometricStore *)self client];
  [v10 setGlobalAuthACL:v9 ofType:a4 completion:v8];
}

- (void)setModifiedGlobalAuthACL:(id)a3 externalizedLAContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DCBiometricStore *)self client];
  [v11 setModifiedGlobalAuthACL:v10 externalizedLAContext:v9 completion:v8];
}

- (void)globalAuthACLWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 globalAuthACLWithCompletion:v4];
}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__DCBiometricStore_deleteGlobalAuthACLWithCompletion___block_invoke;
  v6[3] = &unk_264228C40;
  id v7 = v4;
  id v5 = v4;
  [(DCBiometricStore *)self deleteGlobalAuthACLWithOutcomeCompletion:v6];
}

uint64_t __54__DCBiometricStore_deleteGlobalAuthACLWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteGlobalAuthACLWithOutcomeCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 deleteGlobalAuthACLWithCompletion:v4];
}

- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__DCBiometricStore_globalAuthACLTemplateUUIDsWithCompletion___block_invoke;
  v7[3] = &unk_264228C68;
  id v8 = v4;
  id v6 = v4;
  [v5 globalAuthACLTemplateUUIDsWithCompletion:v7];
}

uint64_t __61__DCBiometricStore_globalAuthACLTemplateUUIDsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)globalAuthACLTemplateUUIDsAndCredentialCountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 globalAuthACLTemplateUUIDsWithCompletion:v4];
}

- (void)generatePhoneTokenWithNonce:(id)a3 keyBlob:(id)a4 pairingID:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(DCBiometricStore *)self client];
  [v14 generatePhoneTokenWithNonce:v13 keyBlob:v12 pairingID:v11 completion:v10];
}

- (void)generatePrearmTrustCertificateWithNonce:(id)a3 pairingID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DCBiometricStore *)self client];
  [v11 generatePrearmTrustCertificateWithNonce:v10 pairingID:v9 completion:v8];
}

- (void)migratePrearmTrustBlob:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DCBiometricStore *)self client];
  [v8 migratePrearmTrustBlob:v7 completion:v6];
}

- (void)credentialAuthenticationTokenStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 credentialAuthenticationTokenStatus:v4];
}

- (void)getCASDCertificate:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 getCASDCertificate:v4];
}

- (void)getGlobalProgenitorKeyAttestation:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 getGlobalProgenitorKeyAttestation:v4];
}

- (void)getGlobalThirdPartyProgenitorKeyAttestation:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 getGlobalThirdPartyProgenitorKeyAttestation:v4];
}

- (void)boundAppletPresentmentACL:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 boundAppletPresentmentACL:v4];
}

- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:(id)a3 onlyIfNeeded:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(DCBiometricStore *)self client];
  [v10 refreshProgenitorKeyDesignationsWithSessionHandoffToken:v9 onlyIfNeeded:v5 completion:v8];
}

- (void)clearProgenitorKeyDesignationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DCBiometricStore *)self client];
  [v5 clearProgenitorKeyDesignationsWithCompletion:v4];
}

- (DCBiometricStoreClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end