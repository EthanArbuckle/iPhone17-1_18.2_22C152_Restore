@interface HMDHomeWalletKeyISOCredentialACWG
- (CIDCPayloadBuilder)credentialBuilder;
- (HMDHomeWalletKeyISOCredentialACWG)initWithIssuerKeyPairExternalRepresentation:(id)a3 deviceCredentialPublicKeyExternalRepresentation:(id)a4;
- (NSData)deviceCredentialPublicKeyExternalRepresentation;
- (NSData)issuerKeyPairExternalRepresentation;
- (void)encodeWithCompletion:(id)a3;
- (void)signPayloadWithBuilder:(id)a3 data:(id)a4 completion:(id)a5;
@end

@implementation HMDHomeWalletKeyISOCredentialACWG

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialBuilder, 0);
  objc_storeStrong((id *)&self->_deviceCredentialPublicKeyExternalRepresentation, 0);
  objc_storeStrong((id *)&self->_issuerKeyPairExternalRepresentation, 0);
}

- (CIDCPayloadBuilder)credentialBuilder
{
  return (CIDCPayloadBuilder *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)deviceCredentialPublicKeyExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)issuerKeyPairExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)signPayloadWithBuilder:(id)a3 data:(id)a4 completion:(id)a5
{
  v21[2] = *MEMORY[0x263EF8340];
  CFDataRef v7 = (const __CFData *)a4;
  v8 = (void (**)(id, void *, void))a5;
  v9 = [(HMDHomeWalletKeyISOCredentialACWG *)self issuerKeyPairExternalRepresentation];
  v10 = +[HMDNIST256Utilities publicKeyExternalRepresentationFromKeyPairExternalRepresentation:v9];

  CFErrorRef error = 0;
  uint64_t v11 = *MEMORY[0x263F16FA8];
  v20[0] = *MEMORY[0x263F16F68];
  v20[1] = v11;
  uint64_t v12 = *MEMORY[0x263F16FB8];
  v21[0] = *MEMORY[0x263F16F70];
  v21[1] = v12;
  CFDictionaryRef v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  CFDataRef v14 = [(HMDHomeWalletKeyISOCredentialACWG *)self issuerKeyPairExternalRepresentation];
  v15 = SecKeyCreateWithData(v14, v13, &error);

  if (v15)
  {
    CFErrorRef v18 = 0;
    CFDataRef v16 = SecKeyCreateSignature(v15, (SecKeyAlgorithm)*MEMORY[0x263F172C0], v7, &v18);
    if (v16)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x263F35CD8]) initWithSigningAlgorithm:-7 issuerKey:v10 signature:v16];
      v8[2](v8, v17, 0);
    }
    else
    {
      ((void (**)(id, void *, CFErrorRef))v8)[2](v8, 0, v18);
    }
  }
  else
  {
    ((void (**)(id, void *, CFErrorRef))v8)[2](v8, 0, error);
  }
}

- (void)encodeWithCompletion:(id)a3
{
  v49[1] = *MEMORY[0x263EF8340];
  id v37 = a3;
  v4 = [(HMDHomeWalletKeyISOCredentialACWG *)self deviceCredentialPublicKeyExternalRepresentation];
  v5 = +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:v4];

  v6 = objc_msgSend(v5, "subdataWithRange:", 0, 32);
  CFDataRef v7 = objc_msgSend(v5, "subdataWithRange:", 32, 32);
  v38 = v6;
  v36 = (void *)[objc_alloc(MEMORY[0x263F2BEC0]) initEC2WithAlgorithm:-7 curveIdentifier:1 x:v6 y:v7 d:0 keyOperations:0 keyIdentifier:0];
  v8 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithCOSEKey:");
  id v9 = objc_alloc(MEMORY[0x263F35CE0]);
  v48 = &unk_26E4734C8;
  v10 = (void *)[objc_alloc(MEMORY[0x263F35CE0]) initWithElementIdentifier:@"This string is ignored" numberValue:&unk_26E4734E0];
  v49[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
  uint64_t v12 = (void *)[v9 initWithElementIdentifier:@"matter1" integerKeyedDictionaryValue:v11];

  v45 = v12;
  v46 = @"aliro-a";
  CFDictionaryRef v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  v47 = v13;
  CFDataRef v14 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];

  v15 = (void *)MEMORY[0x230FBD990]();
  CFDataRef v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v42 = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@ISOCredentialEncode v0.9 is enabled (with issuer public key external representation)", buf, 0xCu);
  }
  CFErrorRef v18 = (void *)MEMORY[0x230FBD990]();
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    v21 = objc_msgSend(v6, "hmf_hexadecimalRepresentation");
    *(_DWORD *)buf = 138543618;
    v42 = v20;
    __int16 v43 = 2112;
    v44 = v21;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@ISOCredentialEncode deviceCredentialPublicKey x: %@", buf, 0x16u);
  }
  v22 = (void *)MEMORY[0x230FBD990]();
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = HMFGetLogIdentifier();
    v25 = objc_msgSend(v7, "hmf_hexadecimalRepresentation");
    *(_DWORD *)buf = 138543618;
    v42 = v24;
    __int16 v43 = 2112;
    v44 = v25;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@ISOCredentialEncode deviceCredentialPublicKey y: %@", buf, 0x16u);
  }
  v26 = (void *)MEMORY[0x230FBD990]();
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = HMFGetLogIdentifier();
    v29 = objc_msgSend(v8, "hmf_hexadecimalRepresentation");
    *(_DWORD *)buf = 138543618;
    v42 = v28;
    __int16 v43 = 2112;
    v44 = v29;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@ISOCredentialEncode dataWithCOSEKey: %@", buf, 0x16u);
  }
  id v30 = objc_alloc(MEMORY[0x263F35CF0]);
  v31 = [MEMORY[0x263EFF910] distantPast];
  v32 = [MEMORY[0x263EFF910] distantFuture];
  v33 = (void *)[v30 initWithFormat:1 docType:@"aliro-a" elements:v14 validFrom:v31 validUntil:v32 deviceKey:v8 signingAlgorithm:-7];

  v34 = [(HMDHomeWalletKeyISOCredentialACWG *)self credentialBuilder];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __58__HMDHomeWalletKeyISOCredentialACWG_encodeWithCompletion___block_invoke;
  v39[3] = &unk_264A29268;
  v39[4] = self;
  id v40 = v37;
  id v35 = v37;
  [v34 buildPayloadWithDetails:v33 completion:v39];
}

void __58__HMDHomeWalletKeyISOCredentialACWG_encodeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    CFDataRef v7 = [MEMORY[0x263F087E8] hmErrorWithCode:52 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (HMDHomeWalletKeyISOCredentialACWG)initWithIssuerKeyPairExternalRepresentation:(id)a3 deviceCredentialPublicKeyExternalRepresentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDHomeWalletKeyISOCredentialACWG;
  id v9 = [(HMDHomeWalletKeyISOCredentialACWG *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_issuerKeyPairExternalRepresentation, a3);
    objc_storeStrong((id *)&v10->_deviceCredentialPublicKeyExternalRepresentation, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F35CE8]) initWithDelegate:v10];
    credentialBuilder = v10->_credentialBuilder;
    v10->_credentialBuilder = (CIDCPayloadBuilder *)v11;
  }
  return v10;
}

@end