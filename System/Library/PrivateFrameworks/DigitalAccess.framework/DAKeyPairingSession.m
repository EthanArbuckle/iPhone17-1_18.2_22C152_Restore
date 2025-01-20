@interface DAKeyPairingSession
+ (BOOL)supportsSecureCoding;
- (DAKeyPairingSession)initWithCoder:(id)a3;
- (DAKeyPairingSession)initWithDelegate:(id)a3;
- (id)getKeyPairingProxy:(void *)a1;
- (id)preWarmForManufacturer:(id)a3;
- (id)sendTrackingReceipt:(void *)a3 otherJSONData:(void *)a4 forKeyWithIdentifier:;
- (id)setTrackingReceipt:(id)a3 decryptedDeviceData:(id)a4 forKeyWithIdentifier:(id)a5;
- (id)setTrackingReceipt:(id)a3 forKeyWithIdentifier:(id)a4;
- (id)setTrackingReceipt:(id)a3 slotIdentifier:(id)a4 confidentialMailboxData:(id)a5 ephemeralPublicKey:(id)a6 forKeyWithIdentifier:(id)a7;
- (id)setTrackingReceipt:(id)a3 vehicleMobilizationData:(id)a4 forKeyWithIdentifier:(id)a5;
- (id)startKeyPairingWithPassword:(id)a3 displayName:(id)a4;
- (id)startKeyPairingWithPassword:(id)a3 displayName:(id)a4 transport:(int64_t)a5;
- (id)startKeyPairingWithPassword:(id)a3 displayName:(id)a4 transport:(int64_t)a5 bindingAttestation:(id)a6;
- (id)startProbing;
- (void)didEnd:(id)a3;
- (void)didStart:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endPointPrivacyDecryption:(id)a3 encryptedData:(id)a4 publicKey:(id)a5 callback:(id)a6;
- (void)handleFirstTransactionCompletionResult:(id)a3;
- (void)handleKeyPairingCompletionResult:(id)a3 keyInformation:(id)a4 trackingRequest:(id)a5;
- (void)handlePairingDidStart;
- (void)handlePreWarmCompletionResult:(id)a3;
- (void)handleProbingCompletionWithBrandCode:(unint64_t)a3 error:(id)a4;
- (void)requestBindingAttestationDataForManufacturer:(id)a3 callback:(id)a4;
- (void)requestImmobilizerTokenRefillForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)setImmobilizerTokens:(id)a3 publicKey:(id)a4 forKeyWithIdentifier:(id)a5 callback:(id)a6;
@end

@implementation DAKeyPairingSession

- (DAKeyPairingSession)initWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DAKeyPairingSession;
  return [(DASession *)&v4 initWithDelegate:a3];
}

- (id)getKeyPairingProxy:(void *)a1
{
  if (a1)
  {
    a1 = [a1 getRemoteProxy:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)preWarmForManufacturer:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession preWarmForManufacturer:]", 49, @"Manufacturer: %@", v5, v6, v7, v8, (uint64_t)v4);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__DAKeyPairingSession_preWarmForManufacturer___block_invoke;
  v13[3] = &unk_26422CBD0;
  v13[4] = &v14;
  v9 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v13);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__DAKeyPairingSession_preWarmForManufacturer___block_invoke_2;
  v12[3] = &unk_26422CBD0;
  v12[4] = &v14;
  [v9 preWarmForManufacturer:v4 callback:v12];

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __46__DAKeyPairingSession_preWarmForManufacturer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession preWarmForManufacturer:]_block_invoke", 51, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __46__DAKeyPairingSession_preWarmForManufacturer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession preWarmForManufacturer:]_block_invoke_2", 54, @"Result: %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

- (void)requestBindingAttestationDataForManufacturer:(id)a3 callback:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void *))a4;
  id v6 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession requestBindingAttestationDataForManufacturer:callback:]", 64, @"Manufacturer: %@", v7, v8, v9, v10, (uint64_t)v6);
  v11 = SESEndpointGetBindingAttestationRequestWithSession();

  id v12 = 0;
  v13 = v12;
  if (v12)
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    v15 = [v12 userInfo];
    uint64_t v16 = [v14 errorWithDomain:@"DigitalAccessError" code:224 userInfo:v15];
    v17 = 0;
  }
  else
  {
    v18 = [DAKeyBindingAttestationRequestData alloc];
    v15 = [MEMORY[0x263F08C38] UUID];
    id v19 = [v11 subCAAttestation];
    v20 = [v11 casdECDSACertificate];
    v21 = [v11 casdRSACertificate];
    v17 = [(DAKeyBindingAttestationRequestData *)v18 initWithSharingSessionIdentifier:v15 subCaAttestation:v19 casd:v20 rsaCertData:v21];

    uint64_t v16 = 0;
  }

  v5[2](v5, v17, v16);
}

- (id)startKeyPairingWithPassword:(id)a3 displayName:(id)a4 transport:(int64_t)a5 bindingAttestation:(id)a6
{
  v46[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  if ([v10 length])
  {
    if ([v11 length])
    {
      v21 = DAKeyTransportTypeAsString(a5);
      KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]", 104, @"Transport = %@, displayName: %@", v22, v23, v24, v25, (uint64_t)v21);

      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __92__DAKeyPairingSession_startKeyPairingWithPassword_displayName_transport_bindingAttestation___block_invoke;
      v36[3] = &unk_26422CBD0;
      v36[4] = &v37;
      v26 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v36);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __92__DAKeyPairingSession_startKeyPairingWithPassword_displayName_transport_bindingAttestation___block_invoke_2;
      v35[3] = &unk_26422CBD0;
      v35[4] = &v37;
      [v26 startKeyPairingWithPassword:v10 keyName:v11 transport:a5 bindingAttestation:v12 callback:v35];
      goto LABEL_7;
    }
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]", 99, @"displayName is empty", v17, v18, v19, v20, v34);
    v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    v26 = [NSString stringWithUTF8String:DAErrorString(203)];
    v44 = v26;
    v28 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    uint64_t v29 = [v30 errorWithDomain:@"DigitalAccessError" code:203 userInfo:v28];
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]", 94, @"password is empty", v13, v14, v15, v16, v34);
    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = *MEMORY[0x263F08320];
    v26 = [NSString stringWithUTF8String:DAErrorString(10)];
    v46[0] = v26;
    v28 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
    uint64_t v29 = [v27 errorWithDomain:@"DigitalAccessError" code:10 userInfo:v28];
  }
  v31 = (void *)v38[5];
  v38[5] = v29;

LABEL_7:
  id v32 = (id)v38[5];
  _Block_object_dispose(&v37, 8);

  return v32;
}

void __92__DAKeyPairingSession_startKeyPairingWithPassword_displayName_transport_bindingAttestation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]_block_invoke", 107, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __92__DAKeyPairingSession_startKeyPairingWithPassword_displayName_transport_bindingAttestation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]_block_invoke_2", 114, @"Result: %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = kmlErrorToDAError(v3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)startKeyPairingWithPassword:(id)a3 displayName:(id)a4 transport:(int64_t)a5
{
  uint64_t v8 = (void *)MEMORY[0x263F08C38];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 UUID];
  id v12 = kmlUtilUUIDToData(v11);
  uint64_t v13 = [(DAKeyPairingSession *)self startKeyPairingWithPassword:v10 displayName:v9 transport:a5 bindingAttestation:v12];

  return v13;
}

- (id)startKeyPairingWithPassword:(id)a3 displayName:(id)a4
{
  return [(DAKeyPairingSession *)self startKeyPairingWithPassword:a3 displayName:a4 transport:1];
}

- (id)startProbing
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__DAKeyPairingSession_startProbing__block_invoke;
  v6[3] = &unk_26422CBD0;
  v6[4] = &v7;
  uint64_t v2 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v6);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__DAKeyPairingSession_startProbing__block_invoke_2;
  v5[3] = &unk_26422CBF8;
  v5[4] = &v7;
  [v2 startProbingWithCallback:v5];

  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __35__DAKeyPairingSession_startProbing__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession startProbing]_block_invoke", 143, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __35__DAKeyPairingSession_startProbing__block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a2;
  v17[1] = *MEMORY[0x263EF8340];
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession startProbing]_block_invoke_2", 146, @"Result: %d", a5, a6, a7, a8, a2);
  if ((v8 & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    id v11 = [NSString stringWithUTF8String:DAErrorString(4)];
    v17[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v13 = [v10 errorWithDomain:@"DigitalAccessError" code:4 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (id)sendTrackingReceipt:(void *)a3 otherJSONData:(void *)a4 forKeyWithIdentifier:
{
  v29[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    kmlUtilLogLargeData(@"Tracking Receipt Data", v8);
    if (v9)
    {
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x3032000000;
      uint64_t v25 = __Block_byref_object_copy_;
      v26 = __Block_byref_object_dispose_;
      id v27 = 0;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __78__DAKeyPairingSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke;
      v21[3] = &unk_26422CBD0;
      v21[4] = &v22;
      uint64_t v14 = [a1 getRemoteProxy:v21];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __78__DAKeyPairingSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke_2;
      v20[3] = &unk_26422CBD0;
      v20[4] = &v22;
      [v14 consumeTrackingReceipt:v7 otherJSONData:v8 forKeyWithIdentifier:v9 callback:v20];

      a1 = (id)v23[5];
      _Block_object_dispose(&v22, 8);
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]", 163, @"Null argument provided", v10, v11, v12, v13, v19);
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08320];
      uint64_t v16 = [NSString stringWithUTF8String:DAErrorString(217)];
      v29[0] = v16;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      a1 = [v15 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v17];
    }
  }

  return a1;
}

void __78__DAKeyPairingSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]_block_invoke", 169, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __78__DAKeyPairingSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]_block_invoke_2", 175, @"Result: %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = kmlErrorToDAError(v3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)setTrackingReceipt:(id)a3 forKeyWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:forKeyWithIdentifier:]", 186, @"keyIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  uint64_t v12 = -[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v7, 0, v6);

  return v12;
}

- (id)setTrackingReceipt:(id)a3 vehicleMobilizationData:(id)a4 forKeyWithIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:vehicleMobilizationData:forKeyWithIdentifier:]", 196, @"keyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v8);
  uint64_t v15 = +[DAUtils decryptVehicleMobilizationData:v9 forKeyWithIdentifier:v8];

  uint64_t v16 = -[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, v15, v8);

  return v16;
}

- (id)setTrackingReceipt:(id)a3 slotIdentifier:(id)a4 confidentialMailboxData:(id)a5 ephemeralPublicKey:(id)a6 forKeyWithIdentifier:(id)a7
{
  id v9 = a7;
  id v10 = a3;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:slotIdentifier:confidentialMailboxData:ephemeralPublicKey:forKeyWithIdentifier:]", 210, @"Deprecated API", v11, v12, v13, v14, v21);
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:slotIdentifier:confidentialMailboxData:ephemeralPublicKey:forKeyWithIdentifier:]", 211, @"keyIdentifier: %@", v15, v16, v17, v18, (uint64_t)v9);
  uint64_t v19 = -[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, 0, v9);

  return v19;
}

- (id)setTrackingReceipt:(id)a3 decryptedDeviceData:(id)a4 forKeyWithIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:decryptedDeviceData:forKeyWithIdentifier:]", 221, @"keyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v8);
  uint64_t v15 = -[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, v9, v8);

  return v15;
}

- (void)endPointPrivacyDecryption:(id)a3 encryptedData:(id)a4 publicKey:(id)a5 callback:(id)a6
{
  v31[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v15 = (void (**)(id, void, void *))a6;
  if (v9 && v10 && a5)
  {
    uint64_t v16 = kmlUtilDataForHexString(a5);
    uint64_t v17 = kmlUtilDataForHexString(v10);
    uint64_t v18 = SESEndPointPrivacyDecryption();
    id v19 = 0;
    if (v19)
    {
      uint64_t v24 = v19;
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 246, @"endPointPrivacyDecryption: return error: %@", v20, v21, v22, v23, (uint64_t)v19);
      uint64_t v25 = (void *)MEMORY[0x263F087E8];
      v26 = [v24 userInfo];
      id v27 = [v25 errorWithDomain:@"DigitalAccessError" code:204 userInfo:v26];

      v15[2](v15, 0, v27);
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 243, @"endPointPrivacyDecryption: got decrypted data: %@", v20, v21, v22, v23, (uint64_t)v18);
      ((void (**)(id, void *, void *))v15)[2](v15, v18, 0);
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 233, @"Null argument provided", v11, v12, v13, v14, v29);
    uint64_t v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    uint64_t v16 = [NSString stringWithUTF8String:DAErrorString(217)];
    v31[0] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v18 = [v28 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v17];
    v15[2](v15, 0, v18);
  }
}

- (void)requestImmobilizerTokenRefillForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession requestImmobilizerTokenRefillForKeyWithIdentifier:callback:]", 258, @"This method is deprecated. Please stop use.", v5, v6, v7, v8, v13);
  id v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F08320];
  id v10 = [NSString stringWithUTF8String:DAErrorString(214)];
  v15[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v12 = [v9 errorWithDomain:@"DigitalAccessError" code:214 userInfo:v11];
  v4[2](v4, 0, v12);
}

- (void)setImmobilizerTokens:(id)a3 publicKey:(id)a4 forKeyWithIdentifier:(id)a5 callback:(id)a6
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a6;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession setImmobilizerTokens:publicKey:forKeyWithIdentifier:callback:]", 268, @"This method is deprecated. Please stop use.", v7, v8, v9, v10, v15);
  uint64_t v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v16 = *MEMORY[0x263F08320];
  uint64_t v12 = [NSString stringWithUTF8String:DAErrorString(214)];
  v17[0] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v14 = [v11 errorWithDomain:@"DigitalAccessError" code:214 userInfo:v13];
  v6[2](v6, v14);
}

- (void)didStart:(BOOL)a3
{
  BOOL v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession didStart:]", 276, &stru_26C5B7750, v3, v4, v5, v6, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeyPairingSession;
  [(DASession *)&v9 didStart:v7];
}

- (void)didEnd:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession didEnd:]", 282, &stru_26C5B7750, v5, v6, v7, v8, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeyPairingSession;
  [(DASession *)&v9 didEnd:v4];
}

- (void)handleKeyPairingCompletionResult:(id)a3 keyInformation:(id)a4 trackingRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(DASession *)self getDelegate];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__DAKeyPairingSession_handleKeyPairingCompletionResult_keyInformation_trackingRequest___block_invoke;
  v16[3] = &unk_26422CC20;
  id v17 = v8;
  id v18 = v11;
  id v19 = self;
  id v20 = v9;
  id v21 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v11;
  id v15 = v8;
  [(DASession *)self dispatchOnCallbackQueue:v16];
}

void __87__DAKeyPairingSession_handleKeyPairingCompletionResult_keyInformation_trackingRequest___block_invoke(uint64_t a1)
{
  kmlErrorToDAError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) keyPairingSession:*(void *)(a1 + 48) didFinishPairingWithKey:*(void *)(a1 + 56) trackingRequest:*(void *)(a1 + 64) error:v2];
}

- (void)handleFirstTransactionCompletionResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DASession *)self getDelegate];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__DAKeyPairingSession_handleFirstTransactionCompletionResult___block_invoke;
  v8[3] = &unk_26422CC48;
  id v9 = v4;
  id v10 = v5;
  uint64_t v11 = self;
  id v6 = v5;
  id v7 = v4;
  [(DASession *)self dispatchOnCallbackQueue:v8];
}

void __62__DAKeyPairingSession_handleFirstTransactionCompletionResult___block_invoke(uint64_t a1)
{
  kmlErrorToDAError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) didFinishFirstTransactionForSession:*(void *)(a1 + 48) error:v2];
}

- (void)handlePreWarmCompletionResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DASession *)self getDelegate];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__DAKeyPairingSession_handlePreWarmCompletionResult___block_invoke;
  v8[3] = &unk_26422CC70;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(DASession *)self dispatchOnCallbackQueue:v8];
}

void __53__DAKeyPairingSession_handlePreWarmCompletionResult___block_invoke(uint64_t a1)
{
  kmlErrorToDAError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) didFinishPreWarmWithResult:v2];
}

- (void)handleProbingCompletionWithBrandCode:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(DASession *)self getDelegate];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__DAKeyPairingSession_handleProbingCompletionWithBrandCode_error___block_invoke;
  v10[3] = &unk_26422CC98;
  id v12 = v6;
  unint64_t v13 = a3;
  id v11 = v7;
  id v8 = v6;
  id v9 = v7;
  [(DASession *)self dispatchOnCallbackQueue:v10];
}

void __66__DAKeyPairingSession_handleProbingCompletionWithBrandCode_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  kmlErrorToDAError(*(void **)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v1 didFinishProbingWithBrandCode:v2 error:v3];
}

- (void)handlePairingDidStart
{
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession handlePairingDidStart]", 325, &stru_26C5B7750, v2, v3, v4, v5, v9);
  id v7 = [(DASession *)self getDelegate];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__DAKeyPairingSession_handlePairingDidStart__block_invoke;
  v10[3] = &unk_26422CCC0;
  id v11 = v7;
  id v8 = v7;
  [(DASession *)self dispatchOnCallbackQueue:v10];
}

uint64_t __44__DAKeyPairingSession_handlePairingDidStart__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 didStartPairing];
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DAKeyPairingSession;
  [(DASession *)&v3 encodeWithCoder:a3];
}

- (DAKeyPairingSession)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DAKeyPairingSession;
  return [(DASession *)&v4 initWithCoder:a3];
}

@end