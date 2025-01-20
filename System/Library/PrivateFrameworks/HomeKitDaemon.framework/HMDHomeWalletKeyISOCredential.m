@interface HMDHomeWalletKeyISOCredential
- (CIDCPayloadBuilder)credentialBuilder;
- (HAPPairingIdentity)pairingIdentity;
- (HMDHomeWalletKeyISOCredential)initWithHAPPairingIdentity:(id)a3 deviceCredentialKeyExternalRepresentation:(id)a4;
- (NSData)deviceCredentialKeyExternalRepresentation;
- (void)encodeWithCompletion:(id)a3;
- (void)signPayloadWithBuilder:(id)a3 data:(id)a4 completion:(id)a5;
@end

@implementation HMDHomeWalletKeyISOCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialBuilder, 0);
  objc_storeStrong((id *)&self->_deviceCredentialKeyExternalRepresentation, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

- (CIDCPayloadBuilder)credentialBuilder
{
  return (CIDCPayloadBuilder *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)deviceCredentialKeyExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (HAPPairingIdentity)pairingIdentity
{
  return (HAPPairingIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (void)signPayloadWithBuilder:(id)a3 data:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  memset(v28, 0, sizeof(v28));
  v7 = (void (**)(id, void *, void))a5;
  id v8 = a4;
  v9 = [(HMDHomeWalletKeyISOCredential *)self pairingIdentity];
  v10 = [v9 publicKey];
  id v11 = [v10 data];
  v12 = (long long *)[v11 bytes];
  long long v26 = *v12;
  long long v27 = v12[1];

  v13 = [(HMDHomeWalletKeyISOCredential *)self pairingIdentity];
  v14 = [v13 privateKey];
  id v15 = [v14 data];
  v16 = (long long *)[v15 bytes];
  long long v24 = *v16;
  long long v25 = v16[1];

  id v17 = v8;
  objc_msgSend(v17, "bytes", v24, v25, v26, v27, 0, 0, 0, 0, 0, 0, 0, 0);
  [v17 length];

  cced25519_sign_compat();
  v18 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v28 length:64];
  id v19 = objc_alloc(MEMORY[0x263F35CD8]);
  v20 = [(HMDHomeWalletKeyISOCredential *)self pairingIdentity];
  v21 = [v20 publicKey];
  v22 = [v21 data];
  v23 = (void *)[v19 initWithSigningAlgorithm:-8 issuerKey:v22 signature:v18];

  v7[2](v7, v23, 0);
}

- (void)encodeWithCompletion:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v20 = a3;
  v4 = [(HMDHomeWalletKeyISOCredential *)self deviceCredentialKeyExternalRepresentation];
  v5 = +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:v4];

  v21 = objc_msgSend(v5, "subdataWithRange:", 0, 32);
  id v19 = objc_msgSend(v5, "subdataWithRange:", 32, 32);
  v6 = (void *)[objc_alloc(MEMORY[0x263F2BEC0]) initEC2WithAlgorithm:-7 curveIdentifier:1 x:v21 y:v19 d:0 keyOperations:0 keyIdentifier:0];
  v7 = [MEMORY[0x263EFF8F8] dataWithCOSEKey:v6];
  id v8 = [(HMDHomeWalletKeyISOCredential *)self pairingIdentity];
  v9 = +[HMDHome nfcIssuerKeyIdentifierWithPairingIdentity:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x263F35CE0]) initWithElementIdentifier:@"credential_id" dataValue:v9];
  long long v24 = v10;
  long long v25 = @"com.apple.HomeKit";
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v26[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];

  id v13 = objc_alloc(MEMORY[0x263F35CF0]);
  v14 = [MEMORY[0x263EFF910] distantPast];
  id v15 = [MEMORY[0x263EFF910] distantFuture];
  v16 = (void *)[v13 initWithFormat:0 docType:@"com.apple.HomeKit.1.credential" elements:v12 validFrom:v14 validUntil:v15 deviceKey:v7 signingAlgorithm:-8];

  id v17 = [(HMDHomeWalletKeyISOCredential *)self credentialBuilder];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __54__HMDHomeWalletKeyISOCredential_encodeWithCompletion___block_invoke;
  v22[3] = &unk_264A29268;
  v22[4] = self;
  id v23 = v20;
  id v18 = v20;
  [v17 buildPayloadWithDetails:v16 completion:v22];
}

void __54__HMDHomeWalletKeyISOCredential_encodeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08608]];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = [MEMORY[0x263F087E8] hmErrorWithCode:52 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (HMDHomeWalletKeyISOCredential)initWithHAPPairingIdentity:(id)a3 deviceCredentialKeyExternalRepresentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDHomeWalletKeyISOCredential;
  v9 = [(HMDHomeWalletKeyISOCredential *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pairingIdentity, a3);
    objc_storeStrong((id *)&v10->_deviceCredentialKeyExternalRepresentation, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F35CE8]) initWithDelegate:v10];
    credentialBuilder = v10->_credentialBuilder;
    v10->_credentialBuilder = (CIDCPayloadBuilder *)v11;
  }
  return v10;
}

@end