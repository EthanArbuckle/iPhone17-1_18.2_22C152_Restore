@interface DAKeyManagementSession
+ (BOOL)supportsSecureCoding;
- (DAKeyManagementSession)initWithCoder:(id)a3;
- (DAKeyManagementSession)initWithDelegate:(id)a3;
- (id)sendTrackingReceipt:(void *)a3 otherJSONData:(void *)a4 forKeyWithIdentifier:;
- (id)setTrackingReceipt:(id)a3 decryptedDeviceData:(id)a4 forKeyWithIdentifier:(id)a5;
- (id)setTrackingReceipt:(id)a3 forKeyWithIdentifier:(id)a4;
- (id)setTrackingReceipt:(id)a3 slotIdentifier:(id)a4 confidentialMailboxData:(id)a5 ephemeralPublicKey:(id)a6 forKeyWithIdentifier:(id)a7;
- (id)setTrackingReceipt:(id)a3 vehicleMobilizationData:(id)a4 forKeyWithIdentifier:(id)a5;
- (void)cancelAllFriendInvitationsWithCompletionHandler:(id)a3;
- (void)cancelInvitationWithIdentifier:(id)a3 reason:(unint64_t)a4 callback:(id)a5;
- (void)cancelInvitationsWithIdentifiers:(id)a3 sentByOwnerKeyWithIdentifier:(id)a4 callback:(id)a5;
- (void)commitUpgradeForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completionHandler:(id)a6;
- (void)countImmobilizerTokensForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)deleteKey:(id)a3 completionHandler:(id)a4;
- (void)didEnd:(id)a3;
- (void)didStart:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endPointPrivacyDecryption:(id)a3 encryptedData:(id)a4 publicKey:(id)a5 callback:(id)a6;
- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPreTrackRequestForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)handleActivationForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)hasUpgradeAvailableForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completionHandler:(id)a6;
- (void)listKeysWithHandler:(id)a3;
- (void)listKeysWithSession:(id)a3 seid:(id)a4 callback:(id)a5;
- (void)listReceivedSharingInvitationsWithCallback:(id)a3;
- (void)listSharingInvitationsForKeyIdentifier:(id)a3 callback:(id)a4;
- (void)localDeleteKey:(id)a3 completionHandler:(id)a4;
- (void)ppidRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)ppidRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)preWarmForManufacturer:(id)a3 callback:(id)a4;
- (void)readerInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeSharedKeysWithIdentifiers:(id)a3 ownerKeyWithIdentifier:(id)a4 callback:(id)a5;
- (void)removeSharingInvitationWithId:(id)a3 completionHandler:(id)a4;
- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)requestBindingAttestationDataForManufacturer:(id)a3 callback:(id)a4;
- (void)requestImmobilizerTokenRefillForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)revertUpgradeForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completionHandler:(id)a6;
- (void)revokeKeysWithIdentifiers:(id)a3 sharedByOwnerKeyWithIdentifier:(id)a4 callback:(id)a5;
- (void)revokeNodesWithGroupIdentifiers:(id)a3 treesWithGroupIdentifier:(id)a4 authorizedByKeyWithIdentifier:(id)a5 callback:(id)a6;
- (void)setBindingAttestation:(id)a3 forKeyWithIdentifier:(id)a4 callback:(id)a5;
- (void)setImmobilizerTokens:(id)a3 publicKey:(id)a4 forKeyWithIdentifier:(id)a5 callback:(id)a6;
- (void)setProductPlanIdentifier:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)signAppData:(id)a3 appBundleIdentifier:(id)a4 nonce:(id)a5 auth:(id)a6 keyIdentifier:(id)a7 callback:(id)a8;
- (void)updateConfiguration:(id)a3 forKeyWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)upgradeKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completionHandler:(id)a7;
@end

@implementation DAKeyManagementSession

- (DAKeyManagementSession)initWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DAKeyManagementSession;
  return [(DASession *)&v4 initWithDelegate:a3];
}

- (void)preWarmForManufacturer:(id)a3 callback:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession preWarmForManufacturer:callback:]", 55, @"%@", v7, v8, v9, v10, (uint64_t)v5);
  if ([v5 length])
  {
    id v20 = v6;
    SESEndPointPreWarm();
    v15 = v20;
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession preWarmForManufacturer:callback:]", 57, @"manufacturer is empty", v11, v12, v13, v14, v19);
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    v15 = [NSString stringWithUTF8String:DAErrorString(206)];
    v22[0] = v15;
    v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v18 = [v16 errorWithDomain:@"DigitalAccessError" code:206 userInfo:v17];
    (*((void (**)(id, void *))v6 + 2))(v6, v18);
  }
}

void __58__DAKeyManagementSession_preWarmForManufacturer_callback___block_invoke(uint64_t a1, void *a2)
{
  sesErrorToKmlError(a2, 0x13u);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = kmlErrorToDAError(v5);
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)requestBindingAttestationDataForManufacturer:(id)a3 callback:(id)a4
{
  id v5 = (void (**)(id, void *, void *))a4;
  id v6 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession requestBindingAttestationDataForManufacturer:callback:]", 74, @"Manufacturer: %@", v7, v8, v9, v10, (uint64_t)v6);
  uint64_t v11 = SESEndpointGetBindingAttestationRequestWithSession();

  id v12 = 0;
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    v15 = [v12 userInfo];
    v16 = [v14 errorWithDomain:@"DigitalAccessError" code:224 userInfo:v15];
    v17 = 0;
  }
  else
  {
    v18 = [DAKeyBindingAttestationRequestData alloc];
    v15 = [MEMORY[0x263F08C38] UUID];
    uint64_t v19 = [v11 subCAAttestation];
    id v20 = [v11 casdECDSACertificate];
    uint64_t v21 = [v11 casdRSACertificate];
    v17 = [(DAKeyBindingAttestationRequestData *)v18 initWithSharingSessionIdentifier:v15 subCaAttestation:v19 casd:v20 rsaCertData:v21];

    v16 = 0;
  }

  v5[2](v5, v17, v16);
}

- (void)deleteKey:(id)a3 completionHandler:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession deleteKey:completionHandler:]", 98, @"%@", v8, v9, v10, v11, (uint64_t)v6);
  if ([v6 length])
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __54__DAKeyManagementSession_deleteKey_completionHandler___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __54__DAKeyManagementSession_deleteKey_completionHandler___block_invoke_2;
    v22[3] = &unk_26422CD38;
    v22[4] = &v30;
    v22[5] = &v24;
    [v16 deleteKey:v6 callback:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession deleteKey:completionHandler:]", 100, @"keyIdentifier is empty", v12, v13, v14, v15, v21);
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v18 = [NSString stringWithUTF8String:DAErrorString(206)];
    v37[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    id v20 = [v17 errorWithDomain:@"DigitalAccessError" code:206 userInfo:v19];

    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __54__DAKeyManagementSession_deleteKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession deleteKey:completionHandler:]_block_invoke", 110, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __54__DAKeyManagementSession_deleteKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = kmlErrorToDAError(a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)listKeysWithHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = (void (**)(id, void, void *))a3;
  uint64_t v27 = 0;
  uint64_t v4 = SESEndPointList();
  id v5 = 0;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = [v5 userInfo];
    uint64_t v9 = [v7 errorWithDomain:@"DigitalAccessError" code:209 userInfo:v8];

    v3[2](v3, 0, v9);
  }
  else
  {
    v22 = v3;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v16 = [v15 publicKeyIdentifier];
          KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession listKeysWithHandler:]", 128, @"Key id = %@", v17, v18, v19, v20, (uint64_t)v16);

          uint64_t v21 = [[DAKeyInformation alloc] initWithEndpoint:v15];
          [v6 addObject:v21];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
    }

    id v3 = v22;
    ((void (**)(id, void *, void *))v22)[2](v22, v6, 0);
  }
}

- (void)listKeysWithSession:(id)a3 seid:(id)a4 callback:(id)a5
{
  v44[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = (void (**)(id, void, void *))a5;
  if (a3 && a4)
  {
    uint64_t v41 = 0;
    SESEndPointListWithSession();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = 0;
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v12, "count"));
    if (v13)
    {
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      v16 = [v13 userInfo];
      uint64_t v17 = [v15 errorWithDomain:@"DigitalAccessError" code:209 userInfo:v16];

      v11[2](v11, 0, v17);
    }
    else
    {
      uint64_t v36 = v11;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v12 = v12;
      uint64_t v20 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v12);
            }
            long long v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            long long v25 = [v24 publicKeyIdentifier];
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession listKeysWithSession:seid:callback:]", 153, @"Key id = %@", v26, v27, v28, v29, (uint64_t)v25);

            uint64_t v30 = [[DAKeyInformation alloc] initWithEndpoint:v24];
            [v14 addObject:v30];
          }
          uint64_t v21 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v21);
      }

      uint64_t v31 = [v14 count];
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession listKeysWithSession:seid:callback:]", 157, @"listKeysWithSession: key count = %lu", v32, v33, v34, v35, v31);
      uint64_t v11 = v36;
      ((void (**)(id, void *, void *))v36)[2](v36, v14, 0);
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession listKeysWithSession:seid:callback:]", 142, @"Null arguments provided. Session : %@, seid : %@", v7, v8, v9, v10, (uint64_t)a3);
    uint64_t v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithUTF8String:DAErrorString(217)];
    v44[0] = v12;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    uint64_t v19 = [v18 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v14];
    v11[2](v11, 0, v19);
  }
}

- (void)listSharingInvitationsForKeyIdentifier:(id)a3 callback:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession listSharingInvitationsForKeyIdentifier:callback:]", 167, @"keyIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__0;
    uint64_t v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__0;
    uint64_t v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __74__DAKeyManagementSession_listSharingInvitationsForKeyIdentifier_callback___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __74__DAKeyManagementSession_listSharingInvitationsForKeyIdentifier_callback___block_invoke_2;
    v22[3] = &unk_26422CD60;
    v22[4] = &v30;
    v22[5] = &v24;
    [v16 listSharingInvitationsForKeyIdentifier:v6 callback:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession listSharingInvitationsForKeyIdentifier:callback:]", 169, @"Null argument provided.", v12, v13, v14, v15, v21);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __74__DAKeyManagementSession_listSharingInvitationsForKeyIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession listSharingInvitationsForKeyIdentifier:callback:]_block_invoke", 178, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __74__DAKeyManagementSession_listSharingInvitationsForKeyIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = kmlErrorToDAError(a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)listReceivedSharingInvitationsWithCallback:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, uint64_t))a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession listReceivedSharingInvitationsWithCallback:]", 190, &stru_26C5B7750, v5, v6, v7, v8, v10);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  long long v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__DAKeyManagementSession_listReceivedSharingInvitationsWithCallback___block_invoke;
  v12[3] = &unk_26422CBD0;
  v12[4] = &v19;
  uint64_t v9 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v12);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__DAKeyManagementSession_listReceivedSharingInvitationsWithCallback___block_invoke_2;
  v11[3] = &unk_26422CD60;
  v11[4] = &v19;
  v11[5] = &v13;
  [v9 listReceivedSharingInvitationsWithCallback:v11];

  v4[2](v4, v14[5], v20[5]);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

void __69__DAKeyManagementSession_listReceivedSharingInvitationsWithCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession listReceivedSharingInvitationsWithCallback:]_block_invoke", 196, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __69__DAKeyManagementSession_listReceivedSharingInvitationsWithCallback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = kmlErrorToDAError(a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)localDeleteKey:(id)a3 completionHandler:(id)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession localDeleteKey:completionHandler:]", 208, @"%@", v8, v9, v10, v11, (uint64_t)v6);
  if ([v6 length])
  {
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__0;
    uint64_t v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __59__DAKeyManagementSession_localDeleteKey_completionHandler___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v24;
    v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __59__DAKeyManagementSession_localDeleteKey_completionHandler___block_invoke_2;
    v22[3] = &unk_26422CBD0;
    v22[4] = &v24;
    [v16 localDeleteKey:v6 callback:v22];

    v7[2](v7, v25[5]);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession localDeleteKey:completionHandler:]", 211, @"keyIdentifier is empty", v12, v13, v14, v15, v21);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    id v18 = [NSString stringWithUTF8String:DAErrorString(206)];
    v31[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:206 userInfo:v19];

    ((void (**)(id, void *))v7)[2](v7, v20);
  }
}

void __59__DAKeyManagementSession_localDeleteKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession localDeleteKey:completionHandler:]_block_invoke", 219, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __59__DAKeyManagementSession_localDeleteKey_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)cancelAllFriendInvitationsWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession cancelAllFriendInvitationsWithCompletionHandler:]", 230, &stru_26C5B7750, v5, v6, v7, v8, v10[0]);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__DAKeyManagementSession_cancelAllFriendInvitationsWithCompletionHandler___block_invoke;
  v11[3] = &unk_26422CBD0;
  v11[4] = &v12;
  uint64_t v9 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v11);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = (uint64_t)__74__DAKeyManagementSession_cancelAllFriendInvitationsWithCompletionHandler___block_invoke_2;
  v10[3] = (uint64_t)&unk_26422CBD0;
  v10[4] = (uint64_t)&v12;
  [v9 cancelAllFriendInvitationsWithCompletionHandler:v10];

  v4[2](v4, v13[5]);
  _Block_object_dispose(&v12, 8);
}

void __74__DAKeyManagementSession_cancelAllFriendInvitationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelAllFriendInvitationsWithCompletionHandler:]_block_invoke", 235, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __74__DAKeyManagementSession_cancelAllFriendInvitationsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)removeSharingInvitationWithId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession removeSharingInvitationWithId:completionHandler:]", 246, &stru_26C5B7750, v8, v9, v10, v11, v13[0]);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__DAKeyManagementSession_removeSharingInvitationWithId_completionHandler___block_invoke;
  v14[3] = &unk_26422CBD0;
  v14[4] = &v15;
  uint64_t v12 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v14);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = (uint64_t)__74__DAKeyManagementSession_removeSharingInvitationWithId_completionHandler___block_invoke_2;
  v13[3] = (uint64_t)&unk_26422CBD0;
  v13[4] = (uint64_t)&v15;
  [v12 removeSharingInvitationWithId:v6 completionHandler:v13];

  v7[2](v7, v16[5]);
  _Block_object_dispose(&v15, 8);
}

void __74__DAKeyManagementSession_removeSharingInvitationWithId_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession removeSharingInvitationWithId:completionHandler:]_block_invoke", 251, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __74__DAKeyManagementSession_removeSharingInvitationWithId_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)signAppData:(id)a3 appBundleIdentifier:(id)a4 nonce:(id)a5 auth:(id)a6 keyIdentifier:(id)a7 callback:(id)a8
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a8;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession signAppData:appBundleIdentifier:nonce:auth:keyIdentifier:callback:]", 262, @"Deprecated", v9, v10, v11, v12, v17);
  uint64_t v13 = (void *)MEMORY[0x263F087E8];
  uint64_t v18 = *MEMORY[0x263F08320];
  uint64_t v14 = [NSString stringWithUTF8String:DAErrorString(214)];
  v19[0] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v16 = [v13 errorWithDomain:@"DigitalAccessError" code:214 userInfo:v15];
  (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v16);
}

- (void)countImmobilizerTokensForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession countImmobilizerTokensForKeyWithIdentifier:callback:]", 269, @"KeyIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)&__block_literal_global_1);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __78__DAKeyManagementSession_countImmobilizerTokensForKeyWithIdentifier_callback___block_invoke_2;
    v18[3] = &unk_26422CDA8;
    v18[4] = &v23;
    v18[5] = &v19;
    [v16 countImmobilizerTokensForKeyWithIdentifier:v6 callback:v18];

    v7[2](v7, v24[3], v20[3]);
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession countImmobilizerTokensForKeyWithIdentifier:callback:]", 271, @"Null argument provided", v12, v13, v14, v15, v17);
    v7[2](v7, 0, 0);
  }
}

void __78__DAKeyManagementSession_countImmobilizerTokensForKeyWithIdentifier_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __78__DAKeyManagementSession_countImmobilizerTokensForKeyWithIdentifier_callback___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (void)cancelInvitationsWithIdentifiers:(id)a3 sentByOwnerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]", 292, @"OwnerKeyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__0;
    uint64_t v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __97__DAKeyManagementSession_cancelInvitationsWithIdentifiers_sentByOwnerKeyWithIdentifier_callback___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v27;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __97__DAKeyManagementSession_cancelInvitationsWithIdentifiers_sentByOwnerKeyWithIdentifier_callback___block_invoke_2;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v27;
    [v19 cancelInvitationsWithIdentifiers:v8 sentByOwnerKeyWithIdentifier:v9 callback:v25];

    v10[2](v10, v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]", 294, @"Null argument provided", v15, v16, v17, v18, v24);
    id v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithUTF8String:DAErrorString(217)];
    v34[0] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v23 = [v20 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v22];
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

void __97__DAKeyManagementSession_cancelInvitationsWithIdentifiers_sentByOwnerKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]_block_invoke", 302, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __97__DAKeyManagementSession_cancelInvitationsWithIdentifiers_sentByOwnerKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)cancelInvitationWithIdentifier:(id)a3 reason:(unint64_t)a4 callback:(id)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession cancelInvitationWithIdentifier:reason:callback:]", 315, @"invitationIdentifier: %@", v10, v11, v12, v13, (uint64_t)v8);
  if ([v8 length])
  {
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__0;
    uint64_t v36 = __Block_byref_object_dispose__0;
    id v37 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy__0;
    uint64_t v30 = __Block_byref_object_dispose__0;
    id v31 = 0;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __73__DAKeyManagementSession_cancelInvitationWithIdentifier_reason_callback___block_invoke;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v32;
    uint64_t v18 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v25);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __73__DAKeyManagementSession_cancelInvitationWithIdentifier_reason_callback___block_invoke_2;
    v24[3] = &unk_26422CDD0;
    v24[4] = &v26;
    v24[5] = &v32;
    [v18 cancelInvitationWithIdentifier:v8 reason:a4 callback:v24];

    v9[2](v9, v27[5], v33[5]);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelInvitationWithIdentifier:reason:callback:]", 317, @"Null argument provided", v14, v15, v16, v17, v23);
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08320];
    id v20 = [NSString stringWithUTF8String:DAErrorString(217)];
    v39[0] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    uint64_t v22 = [v19 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v21];
    v9[2](v9, 0, (uint64_t)v22);
  }
}

void __73__DAKeyManagementSession_cancelInvitationWithIdentifier_reason_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelInvitationWithIdentifier:reason:callback:]_block_invoke", 326, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __73__DAKeyManagementSession_cancelInvitationWithIdentifier_reason_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = kmlErrorToDAError(v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)removeSharedKeysWithIdentifiers:(id)a3 ownerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession removeSharedKeysWithIdentifiers:ownerKeyWithIdentifier:callback:]", 340, @"OwnerKeyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__0;
    id v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __90__DAKeyManagementSession_removeSharedKeysWithIdentifiers_ownerKeyWithIdentifier_callback___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v27;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __90__DAKeyManagementSession_removeSharedKeysWithIdentifiers_ownerKeyWithIdentifier_callback___block_invoke_2;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v27;
    [v19 removeSharedKeysWithIdentifiers:v8 ownerKeyWithIdentifier:v9 callback:v25];

    v10[2](v10, v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession removeSharedKeysWithIdentifiers:ownerKeyWithIdentifier:callback:]", 342, @"Null argument provided", v15, v16, v17, v18, v24);
    id v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithUTF8String:DAErrorString(217)];
    v34[0] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v23 = [v20 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v22];
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

void __90__DAKeyManagementSession_removeSharedKeysWithIdentifiers_ownerKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession removeSharedKeysWithIdentifiers:ownerKeyWithIdentifier:callback:]_block_invoke", 349, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __90__DAKeyManagementSession_removeSharedKeysWithIdentifiers_ownerKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)revokeKeysWithIdentifiers:(id)a3 sharedByOwnerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  v41[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession revokeKeysWithIdentifiers:sharedByOwnerKeyWithIdentifier:callback:]", 362, @"keyIdentifier List: %@", v11, v12, v13, v14, (uint64_t)v8);
  uint64_t v15 = [v8 count];
  if (v9 && v15)
  {
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy__0;
    uint64_t v38 = __Block_byref_object_dispose__0;
    id v39 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__0;
    id v32 = __Block_byref_object_dispose__0;
    id v33 = 0;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __92__DAKeyManagementSession_revokeKeysWithIdentifiers_sharedByOwnerKeyWithIdentifier_callback___block_invoke;
    v27[3] = &unk_26422CBD0;
    v27[4] = &v34;
    id v20 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __92__DAKeyManagementSession_revokeKeysWithIdentifiers_sharedByOwnerKeyWithIdentifier_callback___block_invoke_2;
    v26[3] = &unk_26422CDF8;
    v26[4] = &v34;
    void v26[5] = &v28;
    [v20 remoteTerminateKeys:v8 nodeGroupIdentifiers:0 treeGroupIdentifiers:0 adminKey:v9 callback:v26];

    v10[2](v10, v29[5], v35[5]);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revokeKeysWithIdentifiers:sharedByOwnerKeyWithIdentifier:callback:]", 364, @"Null argument provided", v16, v17, v18, v19, v25);
    uint64_t v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    uint64_t v22 = [NSString stringWithUTF8String:DAErrorString(217)];
    v41[0] = v22;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v24 = [v21 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v23];
    v10[2](v10, 0, (uint64_t)v24);
  }
}

void __92__DAKeyManagementSession_revokeKeysWithIdentifiers_sharedByOwnerKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revokeKeysWithIdentifiers:sharedByOwnerKeyWithIdentifier:callback:]_block_invoke", 373, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __92__DAKeyManagementSession_revokeKeysWithIdentifiers_sharedByOwnerKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = kmlErrorToDAError(a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)revokeNodesWithGroupIdentifiers:(id)a3 treesWithGroupIdentifier:(id)a4 authorizedByKeyWithIdentifier:(id)a5 callback:(id)a6
{
  v48[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, void *))a6;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession revokeNodesWithGroupIdentifiers:treesWithGroupIdentifier:authorizedByKeyWithIdentifier:callback:]", 392, @"keyGrouoIdentifier List: %@", v14, v15, v16, v17, (uint64_t)v10);
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession revokeNodesWithGroupIdentifiers:treesWithGroupIdentifier:authorizedByKeyWithIdentifier:callback:]", 393, @"treeGrouoIdentifier List: %@", v18, v19, v20, v21, (uint64_t)v11);
  if ([v10 count])
  {
    if (!v12)
    {
LABEL_7:
      KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revokeNodesWithGroupIdentifiers:treesWithGroupIdentifier:authorizedByKeyWithIdentifier:callback:]", 396, @"Null argument provided", v22, v23, v24, v25, v32);
      uint64_t v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v47 = *MEMORY[0x263F08320];
      uint64_t v29 = [NSString stringWithUTF8String:DAErrorString(217)];
      v48[0] = v29;
      uint64_t v30 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
      id v31 = [v28 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v30];
      v13[2](v13, 0, v31);

      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v26 = [v11 count];
    if (!v12 || !v26) {
      goto LABEL_7;
    }
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  id v46 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__0;
  id v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  void v34[2] = __122__DAKeyManagementSession_revokeNodesWithGroupIdentifiers_treesWithGroupIdentifier_authorizedByKeyWithIdentifier_callback___block_invoke;
  v34[3] = &unk_26422CBD0;
  v34[4] = &v41;
  uint64_t v27 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v34);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __122__DAKeyManagementSession_revokeNodesWithGroupIdentifiers_treesWithGroupIdentifier_authorizedByKeyWithIdentifier_callback___block_invoke_2;
  v33[3] = &unk_26422CDF8;
  v33[4] = &v41;
  v33[5] = &v35;
  [v27 remoteTerminateKeys:0 nodeGroupIdentifiers:v10 treeGroupIdentifiers:v11 adminKey:v12 callback:v33];

  v13[2](v13, v36[5], (void *)v42[5]);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
LABEL_8:
}

void __122__DAKeyManagementSession_revokeNodesWithGroupIdentifiers_treesWithGroupIdentifier_authorizedByKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revokeNodesWithGroupIdentifiers:treesWithGroupIdentifier:authorizedByKeyWithIdentifier:callback:]_block_invoke", 405, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __122__DAKeyManagementSession_revokeNodesWithGroupIdentifiers_treesWithGroupIdentifier_authorizedByKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = kmlErrorToDAError(a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)handleActivationForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession handleActivationForKeyWithIdentifier:callback:]", 422, @"%@", v7, v8, v9, v10, (uint64_t)v6);
  kmlUtilDataForHexString(v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v11 = SESEndpointNotifyPassAdded();
  v5[2](v5, v11);
}

- (void)hasUpgradeAvailableForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completionHandler:(id)a6
{
  v52[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x4010000000;
  id v46 = &unk_214D98A4D;
  unint64_t v47 = a4;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v48 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__0;
  uint64_t v41 = __Block_byref_object_dispose__0;
  id v42 = 0;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:]", 439, @"keyIdentifier: %@", v13, v14, v15, v16, (uint64_t)v10);
  if (v10 && [v11 count])
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    void v34[2] = __105__DAKeyManagementSession_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler___block_invoke;
    v34[3] = &unk_26422CBD0;
    v34[4] = &v37;
    uint64_t v21 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v34);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __105__DAKeyManagementSession_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler___block_invoke_2;
    v33[3] = &unk_26422CE20;
    v33[4] = &v37;
    v33[5] = &v43;
    [v21 hasUpgradeAvailableForKeyWithIdentifier:v10 versionType:a4 versions:v11 completionHandler:v33];

    uint64_t v22 = v38[5];
    uint64_t v23 = (void (*)(void *, long long *, uint64_t))v12[2];
    long long v24 = *((_OWORD *)v44 + 3);
    long long v35 = *((_OWORD *)v44 + 2);
    long long v36 = v24;
    v23(v12, &v35, v22);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:]", 441, @"Null argument provided", v17, v18, v19, v20, v32);
    uint64_t v25 = v44;
    uint64_t v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v51 = *MEMORY[0x263F08320];
    uint64_t v27 = [NSString stringWithUTF8String:DAErrorString(217)];
    v52[0] = v27;
    uint64_t v28 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
    uint64_t v29 = [v26 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v28];
    uint64_t v30 = (void (*)(void *, long long *, void *))v12[2];
    long long v31 = *((_OWORD *)v25 + 3);
    long long v35 = *((_OWORD *)v25 + 2);
    long long v36 = v31;
    v30(v12, &v35, v29);
  }
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

void __105__DAKeyManagementSession_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:]_block_invoke", 447, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

double __105__DAKeyManagementSession_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:]_block_invoke_2", 453, @"Result: %@", v7, v8, v9, v10, (uint64_t)v5);
  uint64_t v11 = kmlErrorToDAError(v5);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  [v6 availableVersionUpgradeValue];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v17;
  long long v16 = v18;
  *(_OWORD *)(v14 + 32) = v17;
  *(_OWORD *)(v14 + 48) = v16;
  return result;
}

- (void)upgradeKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completionHandler:(id)a7
{
  v38[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void))a7;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:]", 467, @"keyIdentifier: %@", v15, v16, v17, v18, (uint64_t)v12);
  if (v12)
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    uint64_t v34 = __Block_byref_object_copy__0;
    long long v35 = __Block_byref_object_dispose__0;
    id v36 = 0;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __108__DAKeyManagementSession_upgradeKeyWithIdentifier_versionType_version_upgradeInformation_completionHandler___block_invoke;
    v30[3] = &unk_26422CBD0;
    v30[4] = &v31;
    uint64_t v23 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v30);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __108__DAKeyManagementSession_upgradeKeyWithIdentifier_versionType_version_upgradeInformation_completionHandler___block_invoke_2;
    v29[3] = &unk_26422CBD0;
    v29[4] = &v31;
    [v23 upgradeKeyWithIdentifier:v12 versionType:a4 version:a5 upgradeInformation:v13 completionHandler:v29];

    v14[2](v14, v32[5]);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:]", 469, @"Null argument provided", v19, v20, v21, v22, v28);
    long long v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F08320];
    uint64_t v25 = [NSString stringWithUTF8String:DAErrorString(217)];
    v38[0] = v25;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    uint64_t v27 = [v24 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v26];
    ((void (**)(id, void *))v14)[2](v14, v27);
  }
}

void __108__DAKeyManagementSession_upgradeKeyWithIdentifier_versionType_version_upgradeInformation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:]_block_invoke", 476, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __108__DAKeyManagementSession_upgradeKeyWithIdentifier_versionType_version_upgradeInformation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:]_block_invoke_2", 483, @"Result: %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = kmlErrorToDAError(v3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)commitUpgradeForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completionHandler:(id)a6
{
  v35[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = (void (**)(id, void))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession commitUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]", 496, @"keyIdentifier: %@", v12, v13, v14, v15, (uint64_t)v10);
  if (v10)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__0;
    uint64_t v32 = __Block_byref_object_dispose__0;
    id v33 = 0;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __98__DAKeyManagementSession_commitUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke;
    v27[3] = &unk_26422CBD0;
    v27[4] = &v28;
    uint64_t v20 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __98__DAKeyManagementSession_commitUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke_2;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v28;
    [v20 finalizeUpgradeForKeyWithIdentifier:v10 versionType:a4 version:a5 revert:0 completionHandler:v26];

    v11[2](v11, v29[5]);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession commitUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]", 498, @"Null argument provided", v16, v17, v18, v19, v25);
    uint64_t v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    uint64_t v22 = [NSString stringWithUTF8String:DAErrorString(217)];
    v35[0] = v22;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    long long v24 = [v21 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v23];
    ((void (**)(id, void *))v11)[2](v11, v24);
  }
}

void __98__DAKeyManagementSession_commitUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession commitUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]_block_invoke", 505, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __98__DAKeyManagementSession_commitUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession commitUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]_block_invoke_2", 512, @"Result: %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = kmlErrorToDAError(v3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)revertUpgradeForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completionHandler:(id)a6
{
  v35[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = (void (**)(id, void))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession revertUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]", 524, @"keyIdentifier: %@", v12, v13, v14, v15, (uint64_t)v10);
  if (v10)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__0;
    uint64_t v32 = __Block_byref_object_dispose__0;
    id v33 = 0;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __98__DAKeyManagementSession_revertUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke;
    v27[3] = &unk_26422CBD0;
    v27[4] = &v28;
    uint64_t v20 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __98__DAKeyManagementSession_revertUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke_2;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v28;
    [v20 finalizeUpgradeForKeyWithIdentifier:v10 versionType:a4 version:a5 revert:1 completionHandler:v26];

    v11[2](v11, v29[5]);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revertUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]", 526, @"Null argument provided", v16, v17, v18, v19, v25);
    uint64_t v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    uint64_t v22 = [NSString stringWithUTF8String:DAErrorString(217)];
    v35[0] = v22;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    long long v24 = [v21 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v23];
    ((void (**)(id, void *))v11)[2](v11, v24);
  }
}

void __98__DAKeyManagementSession_revertUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revertUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]_block_invoke", 533, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __98__DAKeyManagementSession_revertUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession revertUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]_block_invoke_2", 540, @"Result: %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = kmlErrorToDAError(v3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)updateConfiguration:(id)a3 forKeyWithIdentifier:(id)a4 completionHandler:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession updateConfiguration:forKeyWithIdentifier:completionHandler:]", 553, @"keyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__0;
    uint64_t v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __85__DAKeyManagementSession_updateConfiguration_forKeyWithIdentifier_completionHandler___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v27;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __85__DAKeyManagementSession_updateConfiguration_forKeyWithIdentifier_completionHandler___block_invoke_2;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v27;
    [v19 updateConfiguration:v8 forKeyWithIdentifier:v9 completionHandler:v25];

    v10[2](v10, v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession updateConfiguration:forKeyWithIdentifier:completionHandler:]", 555, @"Null argument provided", v15, v16, v17, v18, v24);
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithUTF8String:DAErrorString(217)];
    v34[0] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v23 = [v20 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v22];
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

void __85__DAKeyManagementSession_updateConfiguration_forKeyWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession updateConfiguration:forKeyWithIdentifier:completionHandler:]_block_invoke", 562, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __85__DAKeyManagementSession_updateConfiguration_forKeyWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession updateConfiguration:forKeyWithIdentifier:completionHandler:]_block_invoke_2", 567, @"Result: %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = kmlErrorToDAError(v3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
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
      uint64_t v25 = __Block_byref_object_copy__0;
      uint64_t v26 = __Block_byref_object_dispose__0;
      id v27 = 0;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __81__DAKeyManagementSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke;
      v21[3] = &unk_26422CBD0;
      v21[4] = &v22;
      uint64_t v14 = [a1 getRemoteProxy:v21];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __81__DAKeyManagementSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke_2;
      v20[3] = &unk_26422CBD0;
      v20[4] = &v22;
      [v14 consumeTrackingReceipt:v7 otherJSONData:v8 forKeyWithIdentifier:v9 callback:v20];

      a1 = (id)v23[5];
      _Block_object_dispose(&v22, 8);
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]", 581, @"Null argument provided", v10, v11, v12, v13, v19);
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

void __81__DAKeyManagementSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]_block_invoke", 587, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __81__DAKeyManagementSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]_block_invoke_2", 593, @"Result: %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = kmlErrorToDAError(v3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)setTrackingReceipt:(id)a3 forKeyWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:forKeyWithIdentifier:]", 603, @"keyIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  uint64_t v12 = -[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v7, 0, v6);

  return v12;
}

- (id)setTrackingReceipt:(id)a3 vehicleMobilizationData:(id)a4 forKeyWithIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:vehicleMobilizationData:forKeyWithIdentifier:]", 613, @"keyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v8);
  uint64_t v15 = +[DAUtils decryptVehicleMobilizationData:v9 forKeyWithIdentifier:v8];

  uint64_t v16 = -[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, v15, v8);

  return v16;
}

- (id)setTrackingReceipt:(id)a3 slotIdentifier:(id)a4 confidentialMailboxData:(id)a5 ephemeralPublicKey:(id)a6 forKeyWithIdentifier:(id)a7
{
  id v9 = a7;
  id v10 = a3;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:slotIdentifier:confidentialMailboxData:ephemeralPublicKey:forKeyWithIdentifier:]", 628, @"Deprecated API", v11, v12, v13, v14, v21);
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:slotIdentifier:confidentialMailboxData:ephemeralPublicKey:forKeyWithIdentifier:]", 629, @"keyIdentifier: %@", v15, v16, v17, v18, (uint64_t)v9);
  uint64_t v19 = -[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, 0, v9);

  return v19;
}

- (id)setTrackingReceipt:(id)a3 decryptedDeviceData:(id)a4 forKeyWithIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:decryptedDeviceData:forKeyWithIdentifier:]", 639, @"keyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v8);
  uint64_t v15 = -[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, v9, v8);

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
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 664, @"endPointPrivacyDecryption: return error: %@", v20, v21, v22, v23, (uint64_t)v19);
      uint64_t v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = [v24 userInfo];
      id v27 = [v25 errorWithDomain:@"DigitalAccessError" code:204 userInfo:v26];

      v15[2](v15, 0, v27);
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 661, @"endPointPrivacyDecryption: got decrypted data: %@", v20, v21, v22, v23, (uint64_t)v18);
      ((void (**)(id, void *, void *))v15)[2](v15, v18, 0);
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 651, @"Null argument provided", v11, v12, v13, v14, v29);
    uint64_t v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    uint64_t v16 = [NSString stringWithUTF8String:DAErrorString(217)];
    v31[0] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v18 = [v28 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v17];
    v15[2](v15, 0, v18);
  }
}

- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession requestBindingAttestationDataForKeyWithIdentifier:callback:]", 676, @"keyIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__0;
    uint64_t v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__0;
    uint64_t v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __85__DAKeyManagementSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    uint64_t v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __85__DAKeyManagementSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke_2;
    v22[3] = &unk_26422CE48;
    v22[4] = &v30;
    void v22[5] = &v24;
    [v16 requestBindingAttestationDataForKeyWithIdentifier:v6 callback:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession requestBindingAttestationDataForKeyWithIdentifier:callback:]", 678, @"Null argument provided", v12, v13, v14, v15, v21);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __85__DAKeyManagementSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession requestBindingAttestationDataForKeyWithIdentifier:callback:]_block_invoke", 687, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __85__DAKeyManagementSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = kmlErrorToDAError(a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)setBindingAttestation:(id)a3 forKeyWithIdentifier:(id)a4 callback:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession setBindingAttestation:forKeyWithIdentifier:callback:]", 701, @"keyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__0;
    uint64_t v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __78__DAKeyManagementSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v27;
    id v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __78__DAKeyManagementSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke_2;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v27;
    [v19 setBindingAttestation:v8 forKeyWithIdentifier:v9 callback:v25];

    v10[2](v10, v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setBindingAttestation:forKeyWithIdentifier:callback:]", 703, @"Null argument provided", v15, v16, v17, v18, v24);
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithUTF8String:DAErrorString(217)];
    v34[0] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v23 = [v20 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v22];
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

void __78__DAKeyManagementSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setBindingAttestation:forKeyWithIdentifier:callback:]_block_invoke", 711, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __78__DAKeyManagementSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]", 723, @"invitationIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if ([v6 length])
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__0;
    uint64_t v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__0;
    uint64_t v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __90__DAKeyManagementSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    uint64_t v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __90__DAKeyManagementSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke_2;
    v22[3] = &unk_26422CDF8;
    v22[4] = &v24;
    void v22[5] = &v30;
    [v16 getPreTrackRequestForInvitationWithIdentifier:v6 completionHandler:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]", 725, @"Null argument provided", v12, v13, v14, v15, v21);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __90__DAKeyManagementSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]_block_invoke", 734, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __90__DAKeyManagementSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = kmlErrorToDAError(v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)getPreTrackRequestForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForKeyWithIdentifier:callback:]", 748, @"keyIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__0;
    uint64_t v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__0;
    uint64_t v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __74__DAKeyManagementSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    uint64_t v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __74__DAKeyManagementSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke_2;
    v22[3] = &unk_26422CDF8;
    v22[4] = &v24;
    void v22[5] = &v30;
    [v16 getPreTrackRequestForKeyWithIdentifier:v6 callback:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForKeyWithIdentifier:callback:]", 750, @"Null argument provided", v12, v13, v14, v15, v21);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __74__DAKeyManagementSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForKeyWithIdentifier:callback:]_block_invoke", 759, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __74__DAKeyManagementSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = kmlErrorToDAError(v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)ppidRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:completionHandler:]", 772, @"invitationIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if ([v6 length])
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__0;
    uint64_t v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__0;
    uint64_t v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __83__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    uint64_t v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __83__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke_2;
    v22[3] = &unk_26422CDF8;
    v22[4] = &v24;
    void v22[5] = &v30;
    [v16 ppidRequestForInvitationWithIdentifier:v6 fromMailboxIdentifier:0 completionHandler:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:completionHandler:]", 774, @"Null arguments provided", v12, v13, v14, v15, v21);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __83__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:completionHandler:]_block_invoke", 783, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __83__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = kmlErrorToDAError(v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)ppidRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = (uint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 799, @"invitationIdentifier: %@", v11, v12, v13, v14, v8);
  if (v8 | v9)
  {
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = __Block_byref_object_copy__0;
    uint64_t v37 = __Block_byref_object_dispose__0;
    id v38 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__0;
    uint64_t v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __105__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v33;
    uint64_t v23 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __105__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v25[3] = &unk_26422CDF8;
    v25[4] = &v27;
    void v25[5] = &v33;
    [v23 ppidRequestForInvitationWithIdentifier:v8 fromMailboxIdentifier:v9 completionHandler:v25];

    v10[2](v10, v28[5], v34[5]);
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 801, @"Null arguments provided", v15, v16, v17, v18, v24);
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    uint64_t v20 = [NSString stringWithUTF8String:DAErrorString(217)];
    v40[0] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v22 = [v19 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v21];
    v10[2](v10, 0, (uint64_t)v22);
  }
}

void __105__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 810, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __105__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = kmlErrorToDAError(v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)setProductPlanIdentifier:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setProductPlanIdentifier:forInvitationIdentifier:completion:]", 824, @"invitationIdentifier: %@", v11, v12, v13, v14, (uint64_t)v9);
  if ([v9 length])
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__0;
    uint64_t v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __86__DAKeyManagementSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v27;
    id v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __86__DAKeyManagementSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke_2;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v27;
    [v19 setProductPlanIdentifier:v8 forInvitationIdentifier:v9 completion:v25];

    v10[2](v10, v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setProductPlanIdentifier:forInvitationIdentifier:completion:]", 826, @"Null arguments provided", v15, v16, v17, v18, v24);
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithUTF8String:DAErrorString(217)];
    v34[0] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v23 = [v20 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v22];
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

void __86__DAKeyManagementSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setProductPlanIdentifier:forInvitationIdentifier:completion:]_block_invoke", 835, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __86__DAKeyManagementSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)readerInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = (uint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 848, @"invitationIdentifier: %@", v11, v12, v13, v14, v8);
  if (v8 | v9)
  {
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = __Block_byref_object_copy__0;
    uint64_t v37 = __Block_byref_object_dispose__0;
    id v38 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__0;
    uint64_t v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __111__DAKeyManagementSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v33;
    uint64_t v23 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __111__DAKeyManagementSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v25[3] = &unk_26422CE70;
    v25[4] = &v27;
    void v25[5] = &v33;
    [v23 readerInformationForInvitationWithIdentifier:v8 fromMailboxIdentifier:v9 completionHandler:v25];

    v10[2](v10, v28[5], v34[5]);
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 850, @"Null arguments provided", v15, v16, v17, v18, v24);
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    uint64_t v20 = [NSString stringWithUTF8String:DAErrorString(217)];
    v40[0] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v22 = [v19 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v21];
    v10[2](v10, 0, (uint64_t)v22);
  }
}

void __111__DAKeyManagementSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 859, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __111__DAKeyManagementSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = kmlErrorToDAError(v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)requestImmobilizerTokenRefillForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession requestImmobilizerTokenRefillForKeyWithIdentifier:callback:]", 874, @"This method is deprecated. Please stop use.", v5, v6, v7, v8, v13);
  unint64_t v9 = (void *)MEMORY[0x263F087E8];
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
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession setImmobilizerTokens:publicKey:forKeyWithIdentifier:callback:]", 884, @"This method is deprecated. Please stop use.", v7, v8, v9, v10, v15);
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession didStart:]", 893, &stru_26C5B7750, v3, v4, v5, v6, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeyManagementSession;
  [(DASession *)&v9 didStart:v7];
}

- (void)didEnd:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession didEnd:]", 899, &stru_26C5B7750, v5, v6, v7, v8, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeyManagementSession;
  [(DASession *)&v9 didEnd:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DAKeyManagementSession;
  [(DASession *)&v3 encodeWithCoder:a3];
}

- (DAKeyManagementSession)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DAKeyManagementSession;
  return [(DASession *)&v4 initWithCoder:a3];
}

@end