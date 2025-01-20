@interface DAKeySharingSession
+ (BOOL)supportsSecureCoding;
- (DAKeySharingSession)initWithCoder:(id)a3;
- (DAKeySharingSession)initWithDelegate:(id)a3;
- (id)cancelSharingInvitation:(id)a3;
- (void)acceptCrossPlatformInvitationWithIdentifier:(id)a3 passcode:(id)a4 productPlanIdentifier:(id)a5 completionHandler:(id)a6;
- (void)acceptInvitationWithIdentifier:(id)a3 passcode:(id)a4 completionHandler:(id)a5;
- (void)acceptSharingInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)acceptSharingInvitation:(id)a3 fromMailboxIdentifier:(id)a4 passcode:(id)a5 completionHandler:(id)a6;
- (void)acceptSharingInvitationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)acceptSharingInvitationWithIdentifier:(id)a3 passcode:(id)a4 completionHandler:(id)a5;
- (void)acceptSharingInvitationWithIdentifier:(id)a3 passcode:(id)a4 productPlanIdentifier:(id)a5 completionHandler:(id)a6;
- (void)authorizeSharingInvitationIdentifier:(id)a3 auth:(id)a4 completionHandler:(id)a5;
- (void)createSharingInvitationsForKeyIdentifier:(id)a3 friendIdentifier:(id)a4 auth:(id)a5 config:(id)a6 completionHandler:(id)a7;
- (void)createSharingInvitationsForKeyIdentifier:(id)a3 friendIdentifier:(id)a4 auth:(id)a5 ourBindingAttestation:(id)a6 config:(id)a7 completionHandler:(id)a8;
- (void)createSilentSharingInvitationWithGroupIdentifier:(id)a3 completionHandler:(id)a4;
- (void)didEnd:(id)a3;
- (void)didStart:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPreTrackRequestForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)handleInitiatorMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)ppidRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)ppidRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)readerInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4;
- (void)requestInviteWithConfig:(id)a3 completionHandler:(id)a4;
- (void)retryPasscode:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)retryPasscode:(id)a3 forKeyIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendSharingInvitationForKeyIdentifier:(id)a3 toIdsIdentifier:(id)a4 auth:(id)a5 config:(id)a6 completionHandler:(id)a7;
- (void)sendSilentSharingInvitationWithKeyIdentifier:(id)a3 config:(id)a4 groupIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setBindingAttestation:(id)a3 forKeyWithIdentifier:(id)a4 callback:(id)a5;
- (void)setMailboxIdentifier:(id)a3 forOwnerKeyIdentifier:(id)a4 forInvitationIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setProductPlanIdentifier:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation DAKeySharingSession

- (DAKeySharingSession)initWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DAKeySharingSession;
  return [(DASession *)&v4 initWithDelegate:a3];
}

- (void)sendSharingInvitationForKeyIdentifier:(id)a3 toIdsIdentifier:(id)a4 auth:(id)a5 config:(id)a6 completionHandler:(id)a7
{
  v46[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, uint64_t, uint64_t))a7;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession sendSharingInvitationForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:]", 54, @"KeyIdentifier : %@, remoteIdsId: %@", v17, v18, v19, v20, (uint64_t)v12);
  if (v12 && v13 && v14 && [v15 count])
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__4;
    v43 = __Block_byref_object_dispose__4;
    id v44 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__4;
    v37 = __Block_byref_object_dispose__4;
    id v38 = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __107__DAKeySharingSession_sendSharingInvitationForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler___block_invoke;
    v32[3] = &unk_26422CBD0;
    v32[4] = &v39;
    v25 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v32);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __107__DAKeySharingSession_sendSharingInvitationForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler___block_invoke_2;
    v31[3] = &unk_26422CD60;
    v31[4] = &v39;
    v31[5] = &v33;
    [v25 sendSharingInviteForKeyIdentifier:v12 toIdsIdentifier:v13 auth:v14 config:v15 completionHandler:v31];

    v16[2](v16, v34[5], v40[5]);
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession sendSharingInvitationForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:]", 56, @"Null argument provided", v21, v22, v23, v24, v30);
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = *MEMORY[0x263F08320];
    v27 = [NSString stringWithUTF8String:DAErrorString(217)];
    v46[0] = v27;
    v28 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
    v29 = [v26 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v28];
    v16[2](v16, 0, (uint64_t)v29);
  }
}

void __107__DAKeySharingSession_sendSharingInvitationForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession sendSharingInvitationForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:]_block_invoke", 65, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __107__DAKeySharingSession_sendSharingInvitationForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = kmlErrorToDAError(a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)sendSilentSharingInvitationWithKeyIdentifier:(id)a3 config:(id)a4 groupIdentifier:(id)a5 completionHandler:(id)a6
{
  v43[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, uint64_t))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession sendSilentSharingInvitationWithKeyIdentifier:config:groupIdentifier:completionHandler:]", 77, @"KeyIdentifier : %@, uuid: %@", v14, v15, v16, v17, (uint64_t)v10);
  if (v10 && v11 && v12)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__4;
    v40 = __Block_byref_object_dispose__4;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__4;
    v34 = __Block_byref_object_dispose__4;
    id v35 = 0;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __109__DAKeySharingSession_sendSilentSharingInvitationWithKeyIdentifier_config_groupIdentifier_completionHandler___block_invoke;
    v29[3] = &unk_26422CBD0;
    v29[4] = &v36;
    uint64_t v22 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v29);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __109__DAKeySharingSession_sendSilentSharingInvitationWithKeyIdentifier_config_groupIdentifier_completionHandler___block_invoke_2;
    v28[3] = &unk_26422D9F0;
    v28[4] = &v36;
    v28[5] = &v30;
    [v22 sendSilentSharingInviteForKeyIdentifier:v10 config:v11 groupIdentifier:v12 completionHandler:v28];

    v13[2](v13, v31[5], v37[5]);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession sendSilentSharingInvitationWithKeyIdentifier:config:groupIdentifier:completionHandler:]", 79, @"Null argument provided", v18, v19, v20, v21, v27);
    uint64_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    uint64_t v24 = [NSString stringWithUTF8String:DAErrorString(217)];
    v43[0] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v26 = [v23 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v25];
    v13[2](v13, 0, (uint64_t)v26);
  }
}

void __109__DAKeySharingSession_sendSilentSharingInvitationWithKeyIdentifier_config_groupIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession sendSilentSharingInvitationWithKeyIdentifier:config:groupIdentifier:completionHandler:]_block_invoke", 87, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __109__DAKeySharingSession_sendSilentSharingInvitationWithKeyIdentifier_config_groupIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)authorizeSharingInvitationIdentifier:(id)a3 auth:(id)a4 completionHandler:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession authorizeSharingInvitationIdentifier:auth:completionHandler:]", 101, @"InvitationId : %@", v11, v12, v13, v14, (uint64_t)v8);
  if (v8)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__4;
    v31 = __Block_byref_object_dispose__4;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __83__DAKeySharingSession_authorizeSharingInvitationIdentifier_auth_completionHandler___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v27;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __83__DAKeySharingSession_authorizeSharingInvitationIdentifier_auth_completionHandler___block_invoke_2;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v27;
    [v19 authorizeSharingInvitationIdentifier:v8 auth:v9 completionHandler:v25];

    v10[2](v10, v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession authorizeSharingInvitationIdentifier:auth:completionHandler:]", 103, @"Null argument provided", v15, v16, v17, v18, v24);
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithUTF8String:DAErrorString(217)];
    v34[0] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v23 = [v20 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v22];
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

void __83__DAKeySharingSession_authorizeSharingInvitationIdentifier_auth_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession authorizeSharingInvitationIdentifier:auth:completionHandler:]_block_invoke", 110, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __83__DAKeySharingSession_authorizeSharingInvitationIdentifier_auth_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (id)cancelSharingInvitation:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession cancelSharingInvitation:]", 121, @"InvitationId : %@", v5, v6, v7, v8, (uint64_t)v4);
  if (v4)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    id v27 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __47__DAKeySharingSession_cancelSharingInvitation___block_invoke;
    v21[3] = &unk_26422CBD0;
    v21[4] = &v22;
    uint64_t v13 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v21);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __47__DAKeySharingSession_cancelSharingInvitation___block_invoke_2;
    v20[3] = &unk_26422CBD0;
    v20[4] = &v22;
    [v13 cancelSharingInvitation:v4 completionHandler:v20];

    id v14 = (id)v23[5];
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession cancelSharingInvitation:]", 123, @"Null argument provided", v9, v10, v11, v12, v19);
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    uint64_t v16 = [NSString stringWithUTF8String:DAErrorString(217)];
    v29[0] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v14 = [v15 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v17];
  }

  return v14;
}

void __47__DAKeySharingSession_cancelSharingInvitation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession cancelSharingInvitation:]_block_invoke", 130, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __47__DAKeySharingSession_cancelSharingInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession cancelSharingInvitation:]_block_invoke_2", 133, @"Result: %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = kmlErrorToDAError(v3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)acceptSharingInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v12 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:completionHandler:]", 143, @"This method will be deprecated soon. Start using acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler", v7, v8, v9, v10, v11);
  [(DAKeySharingSession *)self acceptSharingInvitationWithIdentifier:v12 passcode:0 productPlanIdentifier:0 completionHandler:v6];
}

- (void)acceptSharingInvitationWithIdentifier:(id)a3 passcode:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v15 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:completionHandler:]", 151, @"This method will be deprecated soon. Start using acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler", v10, v11, v12, v13, v14);
  [(DAKeySharingSession *)self acceptSharingInvitationWithIdentifier:v15 passcode:v9 productPlanIdentifier:0 completionHandler:v8];
}

- (void)acceptSharingInvitationWithIdentifier:(id)a3 passcode:(id)a4 productPlanIdentifier:(id)a5 completionHandler:(id)a6
{
  v43[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, uint64_t, uint64_t))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]", 160, @"Invitation Id %@", v14, v15, v16, v17, (uint64_t)v10);
  if (v10)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__4;
    v40 = __Block_byref_object_dispose__4;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__4;
    v34 = __Block_byref_object_dispose__4;
    id v35 = 0;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    void v29[2] = __110__DAKeySharingSession_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke;
    v29[3] = &unk_26422CBD0;
    v29[4] = &v36;
    uint64_t v22 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v29);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __110__DAKeySharingSession_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke_2;
    v28[3] = &unk_26422DA18;
    v28[4] = &v36;
    v28[5] = &v30;
    [v22 acceptSharingInvitationWithIdentifier:v10 passcode:v11 productPlanIdentifier:v12 completionHandler:v28];

    v13[2](v13, v31[5], v37[5]);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]", 162, @"Null argument provided", v18, v19, v20, v21, v27);
    uint64_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    uint64_t v24 = [NSString stringWithUTF8String:DAErrorString(217)];
    v43[0] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v26 = [v23 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v25];
    v13[2](v13, 0, (uint64_t)v26);
  }
}

void __110__DAKeySharingSession_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]_block_invoke", 171, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __110__DAKeySharingSession_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)requestInviteWithConfig:(id)a3 completionHandler:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession requestInviteWithConfig:completionHandler:]", 186, &stru_26C5B7750, v8, v9, v10, v11, v21);
  if (v6)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy__4;
    uint64_t v29 = __Block_byref_object_dispose__4;
    id v30 = 0;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __65__DAKeySharingSession_requestInviteWithConfig_completionHandler___block_invoke;
    v24[3] = &unk_26422CBD0;
    v24[4] = &v25;
    uint64_t v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__DAKeySharingSession_requestInviteWithConfig_completionHandler___block_invoke_2;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v25;
    [v16 requestInviteWithConfig:v6 completionHandler:v23];

    v7[2](v7, v26[5]);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession requestInviteWithConfig:completionHandler:]", 188, @"Null argument provided", v12, v13, v14, v15, v22);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v32[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    ((void (**)(id, void *))v7)[2](v7, v20);
  }
}

void __65__DAKeySharingSession_requestInviteWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession requestInviteWithConfig:completionHandler:]_block_invoke", 196, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __65__DAKeySharingSession_requestInviteWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)createSharingInvitationsForKeyIdentifier:(id)a3 friendIdentifier:(id)a4 auth:(id)a5 config:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v21 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeySharingSession createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:config:completionHandler:]", 213, @"Deprecated function", v16, v17, v18, v19, v20);
  [(DAKeySharingSession *)self createSharingInvitationsForKeyIdentifier:v21 friendIdentifier:v15 auth:v14 ourBindingAttestation:0 config:v13 completionHandler:v12];
}

- (void)createSharingInvitationsForKeyIdentifier:(id)a3 friendIdentifier:(id)a4 auth:(id)a5 ourBindingAttestation:(id)a6 config:(id)a7 completionHandler:(id)a8
{
  v49[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = (void (**)(id, uint64_t, uint64_t))a8;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:]", 229, @"KeyIdentifier : %@, friendIdentifier: %@", v20, v21, v22, v23, (uint64_t)v14);
  if (v14 && [v18 count])
  {
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    uint64_t v45 = __Block_byref_object_copy__4;
    v46 = __Block_byref_object_dispose__4;
    id v47 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__4;
    v40 = __Block_byref_object_dispose__4;
    id v41 = 0;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __133__DAKeySharingSession_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler___block_invoke;
    v35[3] = &unk_26422CBD0;
    v35[4] = &v42;
    uint64_t v28 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v35);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    void v34[2] = __133__DAKeySharingSession_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler___block_invoke_2;
    v34[3] = &unk_26422CD60;
    v34[4] = &v42;
    v34[5] = &v36;
    [v28 createSharingInvitationsForKeyIdentifier:v14 friendIdentifier:v15 auth:v16 ourBindingAttestation:v17 config:v18 completionHandler:v34];

    v19[2](v19, v37[5], v43[5]);
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:]", 231, @"Null argument provided", v24, v25, v26, v27, v33);
    uint64_t v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F08320];
    id v30 = [NSString stringWithUTF8String:DAErrorString(217)];
    v49[0] = v30;
    uint64_t v31 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
    uint64_t v32 = [v29 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v31];
    v19[2](v19, 0, (uint64_t)v32);
  }
}

void __133__DAKeySharingSession_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:]_block_invoke", 240, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __133__DAKeySharingSession_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)createSilentSharingInvitationWithGroupIdentifier:(id)a3 completionHandler:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession createSilentSharingInvitationWithGroupIdentifier:completionHandler:]", 258, @"groupIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__4;
    v34 = __Block_byref_object_dispose__4;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__4;
    uint64_t v28 = __Block_byref_object_dispose__4;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __90__DAKeySharingSession_createSilentSharingInvitationWithGroupIdentifier_completionHandler___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    id v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __90__DAKeySharingSession_createSilentSharingInvitationWithGroupIdentifier_completionHandler___block_invoke_2;
    v22[3] = &unk_26422CDD0;
    v22[4] = &v30;
    v22[5] = &v24;
    [v16 createSilentSharingInvitationWithGroupIdentifier:v6 completionHandler:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession createSilentSharingInvitationWithGroupIdentifier:completionHandler:]", 260, @"Null argument provided", v12, v13, v14, v15, v21);
    id v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    id v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __90__DAKeySharingSession_createSilentSharingInvitationWithGroupIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession createSilentSharingInvitationWithGroupIdentifier:completionHandler:]_block_invoke", 269, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __90__DAKeySharingSession_createSilentSharingInvitationWithGroupIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)setMailboxIdentifier:(id)a3 forOwnerKeyIdentifier:(id)a4 forInvitationIdentifier:(id)a5 completionHandler:(id)a6
{
  v41[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:]", 286, @"OwnerKeyIdentifier - %@, InvitationIdentifier - %@", v14, v15, v16, v17, (uint64_t)v11);
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:]", 287, @"mailboxIdentifier - %@", v18, v19, v20, v21, (uint64_t)v10);
  if (v10 && v11 && v12)
  {
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__4;
    uint64_t v38 = __Block_byref_object_dispose__4;
    id v39 = 0;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __108__DAKeySharingSession_setMailboxIdentifier_forOwnerKeyIdentifier_forInvitationIdentifier_completionHandler___block_invoke;
    v33[3] = &unk_26422CBD0;
    v33[4] = &v34;
    uint64_t v26 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v33);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    void v32[2] = __108__DAKeySharingSession_setMailboxIdentifier_forOwnerKeyIdentifier_forInvitationIdentifier_completionHandler___block_invoke_2;
    v32[3] = &unk_26422CBD0;
    v32[4] = &v34;
    [v26 setMailboxIdentifier:v10 forOwnerKeyIdentifier:v11 forInvitationIdentifier:v12 completionHandler:v32];

    v13[2](v13, v35[5]);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:]", 289, @"Null argument provided", v22, v23, v24, v25, v31);
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    uint64_t v28 = [NSString stringWithUTF8String:DAErrorString(217)];
    v41[0] = v28;
    id v29 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v30 = [v27 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v29];
    ((void (**)(id, void *))v13)[2](v13, v30);
  }
}

void __108__DAKeySharingSession_setMailboxIdentifier_forOwnerKeyIdentifier_forInvitationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:]_block_invoke", 297, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __108__DAKeySharingSession_setMailboxIdentifier_forOwnerKeyIdentifier_forInvitationIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completionHandler:]", 310, @"MailboxIdentifier - %@", v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__4;
    uint64_t v31 = __Block_byref_object_dispose__4;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __102__DAKeySharingSession_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completionHandler___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v27;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __102__DAKeySharingSession_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v27;
    [v19 startShareAcceptanceFlowWithInvitation:v8 fromMailboxIdentifier:v9 completionHandler:v25];

    v10[2](v10, v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completionHandler:]", 312, @"Null argument provided", v15, v16, v17, v18, v24);
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithUTF8String:DAErrorString(217)];
    v34[0] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v23 = [v20 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v22];
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

void __102__DAKeySharingSession_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completionHandler:]_block_invoke", 320, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __102__DAKeySharingSession_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)acceptSharingInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v15 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:completionHandler:]", 333, @"This method will be deprecated soon. Start using acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler", v10, v11, v12, v13, v14);
  [(DAKeySharingSession *)self acceptSharingInvitation:v15 fromMailboxIdentifier:v9 passcode:0 completionHandler:v8];
}

- (void)acceptSharingInvitation:(id)a3 fromMailboxIdentifier:(id)a4 passcode:(id)a5 completionHandler:(id)a6
{
  v50[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, uint64_t, uint64_t))a6;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:]", 342, @"This method will be deprecated soon. Start using acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler", v14, v15, v16, v17, v33);
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:]", 344, @"MailboxIdentifier - %@", v18, v19, v20, v21, (uint64_t)v11);
  if (v10 && v11)
  {
    uint64_t v43 = 0;
    uint64_t v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__4;
    id v47 = __Block_byref_object_dispose__4;
    id v48 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__4;
    id v41 = __Block_byref_object_dispose__4;
    id v42 = 0;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __96__DAKeySharingSession_acceptSharingInvitation_fromMailboxIdentifier_passcode_completionHandler___block_invoke;
    v36[3] = &unk_26422CBD0;
    v36[4] = &v43;
    uint64_t v26 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v36);
    uint64_t v27 = [v10 genericData];
    uint64_t v28 = [v27 sharingIdentifier];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __96__DAKeySharingSession_acceptSharingInvitation_fromMailboxIdentifier_passcode_completionHandler___block_invoke_2;
    v35[3] = &unk_26422DA40;
    v35[4] = &v37;
    void v35[5] = &v43;
    [v26 acceptSharingInvitation:v10 withIdentifier:v28 fromMailboxIdentifier:v11 passcode:v12 productPlanIdentifier:0 completionHandler:v35];

    v13[2](v13, v38[5], v44[5]);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:]", 346, @"Null argument provided", v22, v23, v24, v25, v34);
    uint64_t v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F08320];
    uint64_t v30 = [NSString stringWithUTF8String:DAErrorString(217)];
    v50[0] = v30;
    uint64_t v31 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
    id v32 = [v29 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v31];
    v13[2](v13, 0, (uint64_t)v32);
  }
}

void __96__DAKeySharingSession_acceptSharingInvitation_fromMailboxIdentifier_passcode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:]_block_invoke", 354, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __96__DAKeySharingSession_acceptSharingInvitation_fromMailboxIdentifier_passcode_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v11 = a2;
  id v7 = a4;
  uint64_t v8 = kmlErrorToDAError(v7);

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)acceptCrossPlatformInvitationWithIdentifier:(id)a3 passcode:(id)a4 productPlanIdentifier:(id)a5 completionHandler:(id)a6
{
  v43[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, uint64_t, uint64_t))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]", 374, @"InvitationIdentifier - %@", v14, v15, v16, v17, (uint64_t)v10);
  if (v10)
  {
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__4;
    uint64_t v40 = __Block_byref_object_dispose__4;
    id v41 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__4;
    uint64_t v34 = __Block_byref_object_dispose__4;
    id v35 = 0;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    void v29[2] = __116__DAKeySharingSession_acceptCrossPlatformInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke;
    v29[3] = &unk_26422CBD0;
    v29[4] = &v36;
    uint64_t v22 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v29);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __116__DAKeySharingSession_acceptCrossPlatformInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke_2;
    v28[3] = &unk_26422DA40;
    v28[4] = &v30;
    v28[5] = &v36;
    [v22 acceptSharingInvitation:0 withIdentifier:v10 fromMailboxIdentifier:0 passcode:v11 productPlanIdentifier:v12 completionHandler:v28];

    v13[2](v13, v31[5], v37[5]);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]", 376, @"Null argument provided", v18, v19, v20, v21, v27);
    uint64_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    uint64_t v24 = [NSString stringWithUTF8String:DAErrorString(217)];
    v43[0] = v24;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    uint64_t v26 = [v23 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v25];
    v13[2](v13, 0, (uint64_t)v26);
  }
}

void __116__DAKeySharingSession_acceptCrossPlatformInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]_block_invoke", 384, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __116__DAKeySharingSession_acceptCrossPlatformInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v11 = a2;
  id v7 = a4;
  uint64_t v8 = kmlErrorToDAError(v7);

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)acceptInvitationWithIdentifier:(id)a3 passcode:(id)a4 completionHandler:(id)a5
{
  v64[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptInvitationWithIdentifier:passcode:completionHandler:]", 404, @"InvitationIdentifier - %@", v11, v12, v13, v14, (uint64_t)v8);
  if (v8)
  {
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__4;
    v59 = __Block_byref_object_dispose__4;
    id v60 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__4;
    v53 = __Block_byref_object_dispose__4;
    id v54 = 0;
    uint64_t v43 = 0;
    uint64_t v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__4;
    id v47 = __Block_byref_object_dispose__4;
    id v48 = 0;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __81__DAKeySharingSession_acceptInvitationWithIdentifier_passcode_completionHandler___block_invoke;
    v42[3] = &unk_26422CBD0;
    v42[4] = &v55;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v42);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    void v41[2] = __81__DAKeySharingSession_acceptInvitationWithIdentifier_passcode_completionHandler___block_invoke_2;
    v41[3] = &unk_26422DA68;
    v41[4] = &v49;
    v41[5] = &v55;
    v41[6] = &v43;
    [v19 acceptSharingInvitation:0 withIdentifier:v8 fromMailboxIdentifier:0 passcode:v9 productPlanIdentifier:0 completionHandler:v41];

    if (v50[5])
    {
      uint64_t v20 = [DAShareRecipientResult alloc];
      uint64_t v21 = [(id)v44[5] publicKeyIdentifier];
      uint64_t v22 = [(DAShareRecipientResult *)v20 initDataRequiredResultWithCredentialIdentifier:v21 response:v50[5] keyInformation:v44[5]];
    }
    else
    {
      if (!v56[5])
      {
        uint64_t v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v61 = *MEMORY[0x263F08320];
        uint64_t v30 = [NSString stringWithUTF8String:DAErrorString(109)];
        v62 = v30;
        uint64_t v31 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        uint64_t v32 = [v29 errorWithDomain:@"DigitalAccessError" code:109 userInfo:v31];
        uint64_t v33 = (void *)v56[5];
        v56[5] = v32;
      }
      uint64_t v34 = [DAShareRecipientResult alloc];
      uint64_t v21 = [(id)v44[5] publicKeyIdentifier];
      uint64_t v22 = [(DAShareRecipientResult *)v34 initFailureResultWithCrdentialIdentifier:v21 error:v56[5]];
    }
    id v35 = (void *)v22;

    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptInvitationWithIdentifier:passcode:completionHandler:]", 440, @"Result : %@", v36, v37, v38, v39, (uint64_t)v35);
    v10[2](v10, v35);

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v55, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptInvitationWithIdentifier:passcode:completionHandler:]", 406, @"Null argument provided", v15, v16, v17, v18, v40);
    uint64_t v23 = [DAShareRecipientResult alloc];
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v63 = *MEMORY[0x263F08320];
    uint64_t v25 = [NSString stringWithUTF8String:DAErrorString(217)];
    v64[0] = v25;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
    uint64_t v27 = [v24 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v26];
    id v28 = [(DAShareRecipientResult *)v23 initFailureResultWithCrdentialIdentifier:0 error:v27];

    v10[2](v10, v28);
  }
}

void __81__DAKeySharingSession_acceptInvitationWithIdentifier_passcode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptInvitationWithIdentifier:passcode:completionHandler:]_block_invoke", 416, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __81__DAKeySharingSession_acceptInvitationWithIdentifier_passcode_completionHandler___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1[4] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v17 = v7;
  id v11 = a4;

  uint64_t v12 = kmlErrorToDAError(v11);

  uint64_t v13 = *(void *)(a1[5] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v8;
}

- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession handleRecipientMessage:forInvitationIdentifier:completionHandler:]", 449, @"InvitationIdentifier - %@", v11, v12, v13, v14, (uint64_t)v9);
  if (v9)
  {
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = __Block_byref_object_copy__4;
    uint64_t v37 = __Block_byref_object_dispose__4;
    id v38 = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    void v32[2] = __88__DAKeySharingSession_handleRecipientMessage_forInvitationIdentifier_completionHandler___block_invoke;
    v32[3] = &unk_26422CBD0;
    v32[4] = &v33;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v32);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __88__DAKeySharingSession_handleRecipientMessage_forInvitationIdentifier_completionHandler___block_invoke_2;
    v31[3] = &unk_26422DA90;
    v31[4] = &v33;
    [v19 handleRecipientMessage:v8 forInvitationIdentifier:v9 completionHandler:v31];

    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession handleRecipientMessage:forInvitationIdentifier:completionHandler:]", 468, @"Result : %@", v20, v21, v22, v23, v34[5]);
    v10[2](v10, v34[5]);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession handleRecipientMessage:forInvitationIdentifier:completionHandler:]", 451, @"Null argument provided", v15, v16, v17, v18, v30);
    uint64_t v24 = [DAShareRecipientResult alloc];
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    uint64_t v26 = [NSString stringWithUTF8String:DAErrorString(217)];
    v40[0] = v26;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    id v28 = [v25 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v27];
    id v29 = [(DAShareRecipientResult *)v24 initFailureResultWithCrdentialIdentifier:0 error:v28];

    ((void (**)(id, id))v10)[2](v10, v29);
  }
}

void __88__DAKeySharingSession_handleRecipientMessage_forInvitationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession handleRecipientMessage:forInvitationIdentifier:completionHandler:]_block_invoke", 460, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  id v8 = [[DAShareRecipientResult alloc] initFailureResultWithCrdentialIdentifier:0 error:v3];

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __88__DAKeySharingSession_handleRecipientMessage_forInvitationIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)handleInitiatorMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession handleInitiatorMessage:forInvitationIdentifier:completionHandler:]", 476, @"InvitationIdentifier - %@", v11, v12, v13, v14, (uint64_t)v9);
  if (v9)
  {
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = __Block_byref_object_copy__4;
    uint64_t v37 = __Block_byref_object_dispose__4;
    id v38 = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    void v32[2] = __88__DAKeySharingSession_handleInitiatorMessage_forInvitationIdentifier_completionHandler___block_invoke;
    v32[3] = &unk_26422CBD0;
    v32[4] = &v33;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v32);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __88__DAKeySharingSession_handleInitiatorMessage_forInvitationIdentifier_completionHandler___block_invoke_2;
    v31[3] = &unk_26422DAB8;
    v31[4] = &v33;
    [v19 handleInitiatorMessage:v8 forInvitationIdentifier:v9 completionHandler:v31];

    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession handleInitiatorMessage:forInvitationIdentifier:completionHandler:]", 496, @"Result : %@", v20, v21, v22, v23, v34[5]);
    v10[2](v10, v34[5]);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession handleInitiatorMessage:forInvitationIdentifier:completionHandler:]", 478, @"Null argument provided", v15, v16, v17, v18, v30);
    uint64_t v24 = [DAShareInitiatorResult alloc];
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    uint64_t v26 = [NSString stringWithUTF8String:DAErrorString(217)];
    v40[0] = v26;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    id v28 = [v25 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v27];
    id v29 = [(DAShareInitiatorResult *)v24 initFailureResultWithResponse:0 error:v28];

    ((void (**)(id, id))v10)[2](v10, v29);
  }
}

void __88__DAKeySharingSession_handleInitiatorMessage_forInvitationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession handleInitiatorMessage:forInvitationIdentifier:completionHandler:]_block_invoke", 488, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  id v8 = [[DAShareInitiatorResult alloc] initFailureResultWithResponse:0 error:v3];

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __88__DAKeySharingSession_handleInitiatorMessage_forInvitationIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)retryPasscode:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
{
  v51[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession retryPasscode:forInvitationIdentifier:completionHandler:]", 506, @"Invitation Identifier : %@", v11, v12, v13, v14, (uint64_t)v9);
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy__4;
  id v48 = __Block_byref_object_dispose__4;
  id v49 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__4;
  uint64_t v42 = __Block_byref_object_dispose__4;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__4;
  uint64_t v36 = __Block_byref_object_dispose__4;
  id v37 = 0;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __79__DAKeySharingSession_retryPasscode_forInvitationIdentifier_completionHandler___block_invoke;
  v31[3] = &unk_26422CBD0;
  v31[4] = &v44;
  uint64_t v15 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v31);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __79__DAKeySharingSession_retryPasscode_forInvitationIdentifier_completionHandler___block_invoke_2;
  v30[3] = &unk_26422DA68;
  v30[4] = &v38;
  v30[5] = &v44;
  v30[6] = &v32;
  [v15 retryPasscode:v8 forInvitationIdentifier:v9 completionHandler:v30];

  if (v39[5])
  {
    uint64_t v16 = [DAShareRecipientResult alloc];
    uint64_t v17 = [(id)v33[5] publicKeyIdentifier];
    uint64_t v18 = [(DAShareRecipientResult *)v16 initDataRequiredResultWithCredentialIdentifier:v17 response:v39[5] keyInformation:v33[5]];
  }
  else
  {
    if (!v45[5])
    {
      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v50 = *MEMORY[0x263F08320];
      uint64_t v20 = [NSString stringWithUTF8String:DAErrorString(114)];
      v51[0] = v20;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
      uint64_t v22 = [v19 errorWithDomain:@"DigitalAccessError" code:114 userInfo:v21];
      uint64_t v23 = (void *)v45[5];
      v45[5] = v22;
    }
    uint64_t v24 = [DAShareRecipientResult alloc];
    uint64_t v17 = [(id)v33[5] publicKeyIdentifier];
    uint64_t v18 = [(DAShareRecipientResult *)v24 initFailureResultWithCrdentialIdentifier:v17 error:v45[5]];
  }
  uint64_t v25 = (void *)v18;

  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession retryPasscode:forInvitationIdentifier:completionHandler:]", 531, @"Result: %@", v26, v27, v28, v29, (uint64_t)v25);
  v10[2](v10, v25);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
}

void __79__DAKeySharingSession_retryPasscode_forInvitationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession retryPasscode:forInvitationIdentifier:completionHandler:]_block_invoke", 512, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __79__DAKeySharingSession_retryPasscode_forInvitationIdentifier_completionHandler___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1[4] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v17 = v7;
  id v11 = a4;

  uint64_t v12 = kmlErrorToDAError(v11);

  uint64_t v13 = *(void *)(a1[5] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v8;
}

- (void)retryPasscode:(id)a3 forKeyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession retryPasscode:forKeyIdentifier:completionHandler:]", 539, @"KeyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v9);
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__4;
  uint64_t v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__DAKeySharingSession_retryPasscode_forKeyIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_26422CBD0;
  v17[4] = &v18;
  uint64_t v15 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v17);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __72__DAKeySharingSession_retryPasscode_forKeyIdentifier_completionHandler___block_invoke_2;
  v16[3] = &unk_26422CBD0;
  v16[4] = &v18;
  [v15 retryPasscode:v8 forKeyIdentifier:v9 completionHandler:v16];

  v10[2](v10, v19[5]);
  _Block_object_dispose(&v18, 8);
}

void __72__DAKeySharingSession_retryPasscode_forKeyIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession retryPasscode:forKeyIdentifier:completionHandler:]_block_invoke", 543, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __72__DAKeySharingSession_retryPasscode_forKeyIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession requestBindingAttestationDataForKeyWithIdentifier:callback:]", 556, @"keyIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__4;
    uint64_t v34 = __Block_byref_object_dispose__4;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__4;
    uint64_t v28 = __Block_byref_object_dispose__4;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __82__DAKeySharingSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    uint64_t v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __82__DAKeySharingSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke_2;
    v22[3] = &unk_26422CE48;
    v22[4] = &v30;
    v22[5] = &v24;
    [v16 requestBindingAttestationDataForKeyWithIdentifier:v6 callback:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession requestBindingAttestationDataForKeyWithIdentifier:callback:]", 558, @"Null argument provided", v12, v13, v14, v15, v21);
    id v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __82__DAKeySharingSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession requestBindingAttestationDataForKeyWithIdentifier:callback:]_block_invoke", 567, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __82__DAKeySharingSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession setBindingAttestation:forKeyWithIdentifier:callback:]", 579, @"keyIdentifier: %@", v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__4;
    uint64_t v31 = __Block_byref_object_dispose__4;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __75__DAKeySharingSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v27;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __75__DAKeySharingSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke_2;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v27;
    [v19 setBindingAttestation:v8 forKeyWithIdentifier:v9 callback:v25];

    v10[2](v10, v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setBindingAttestation:forKeyWithIdentifier:callback:]", 581, @"Null argument provided", v15, v16, v17, v18, v24);
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithUTF8String:DAErrorString(217)];
    v34[0] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v23 = [v20 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v22];
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

void __75__DAKeySharingSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setBindingAttestation:forKeyWithIdentifier:callback:]_block_invoke", 588, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __75__DAKeySharingSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = kmlErrorToDAError(a2);

  return MEMORY[0x270F9A758]();
}

- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]", 600, @"invitationIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if ([v6 length])
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__4;
    uint64_t v34 = __Block_byref_object_dispose__4;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__4;
    uint64_t v28 = __Block_byref_object_dispose__4;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __87__DAKeySharingSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    uint64_t v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __87__DAKeySharingSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke_2;
    v22[3] = &unk_26422CDF8;
    v22[4] = &v24;
    v22[5] = &v30;
    [v16 getPreTrackRequestForInvitationWithIdentifier:v6 completionHandler:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]", 602, @"Null argument provided", v12, v13, v14, v15, v21);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __87__DAKeySharingSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]_block_invoke", 611, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __87__DAKeySharingSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForKeyWithIdentifier:callback:]", 626, @"keyIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__4;
    uint64_t v34 = __Block_byref_object_dispose__4;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__4;
    uint64_t v28 = __Block_byref_object_dispose__4;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __71__DAKeySharingSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    uint64_t v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __71__DAKeySharingSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke_2;
    v22[3] = &unk_26422CDF8;
    v22[4] = &v24;
    v22[5] = &v30;
    [v16 getPreTrackRequestForKeyWithIdentifier:v6 callback:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForKeyWithIdentifier:callback:]", 628, @"Null argument provided", v12, v13, v14, v15, v21);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __71__DAKeySharingSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForKeyWithIdentifier:callback:]_block_invoke", 637, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __71__DAKeySharingSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:completionHandler:]", 650, @"invitationIdentifier: %@", v8, v9, v10, v11, (uint64_t)v6);
  if ([v6 length])
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__4;
    uint64_t v34 = __Block_byref_object_dispose__4;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__4;
    uint64_t v28 = __Block_byref_object_dispose__4;
    id v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __80__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke;
    v23[3] = &unk_26422CBD0;
    v23[4] = &v30;
    uint64_t v16 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v23);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __80__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke_2;
    v22[3] = &unk_26422CDF8;
    v22[4] = &v24;
    v22[5] = &v30;
    [v16 ppidRequestForInvitationWithIdentifier:v6 fromMailboxIdentifier:0 completionHandler:v22];

    v7[2](v7, v25[5], v31[5]);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:completionHandler:]", 652, @"Null arguments provided", v12, v13, v14, v15, v21);
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    uint64_t v18 = [NSString stringWithUTF8String:DAErrorString(217)];
    v37[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v20 = [v17 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v19];
    v7[2](v7, 0, (uint64_t)v20);
  }
}

void __80__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:completionHandler:]_block_invoke", 661, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __80__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 677, @"invitationIdentifier: %@", v11, v12, v13, v14, v8);
  if (v8 | v9)
  {
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = __Block_byref_object_copy__4;
    id v37 = __Block_byref_object_dispose__4;
    id v38 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__4;
    uint64_t v31 = __Block_byref_object_dispose__4;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __102__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v33;
    id v23 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __102__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
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
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 679, @"Null arguments provided", v15, v16, v17, v18, v24);
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    uint64_t v20 = [NSString stringWithUTF8String:DAErrorString(217)];
    v40[0] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v22 = [v19 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v21];
    v10[2](v10, 0, (uint64_t)v22);
  }
}

void __102__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 688, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __102__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession setProductPlanIdentifier:forInvitationIdentifier:completion:]", 702, @"invitationIdentifier: %@", v11, v12, v13, v14, (uint64_t)v9);
  if ([v9 length])
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__4;
    uint64_t v31 = __Block_byref_object_dispose__4;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __83__DAKeySharingSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v27;
    uint64_t v19 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __83__DAKeySharingSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke_2;
    v25[3] = &unk_26422CBD0;
    v25[4] = &v27;
    [v19 setProductPlanIdentifier:v8 forInvitationIdentifier:v9 completion:v25];

    v10[2](v10, v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setProductPlanIdentifier:forInvitationIdentifier:completion:]", 704, @"Null arguments provided", v15, v16, v17, v18, v24);
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithUTF8String:DAErrorString(217)];
    v34[0] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v23 = [v20 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v22];
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

void __83__DAKeySharingSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setProductPlanIdentifier:forInvitationIdentifier:completion:]_block_invoke", 713, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

uint64_t __83__DAKeySharingSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 726, @"invitationIdentifier: %@", v11, v12, v13, v14, v8);
  if (v8 | v9)
  {
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = __Block_byref_object_copy__4;
    id v37 = __Block_byref_object_dispose__4;
    id v38 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__4;
    uint64_t v31 = __Block_byref_object_dispose__4;
    id v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __108__DAKeySharingSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v26[3] = &unk_26422CBD0;
    v26[4] = &v33;
    id v23 = -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __108__DAKeySharingSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
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
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 728, @"Null arguments provided", v15, v16, v17, v18, v24);
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    uint64_t v20 = [NSString stringWithUTF8String:DAErrorString(217)];
    v40[0] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v22 = [v19 errorWithDomain:@"DigitalAccessError" code:217 userInfo:v21];
    v10[2](v10, 0, (uint64_t)v22);
  }
}

void __108__DAKeySharingSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 737, @"XPC Proxy error %@", v4, v5, v6, v7, (uint64_t)v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __108__DAKeySharingSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = kmlErrorToDAError(v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)didStart:(BOOL)a3
{
  BOOL v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession didStart:]", 754, &stru_26C5B7750, v3, v4, v5, v6, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeySharingSession;
  [(DASession *)&v9 didStart:v7];
}

- (void)didEnd:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession didEnd:]", 760, &stru_26C5B7750, v5, v6, v7, v8, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeySharingSession;
  [(DASession *)&v9 didEnd:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DAKeySharingSession;
  [(DASession *)&v3 encodeWithCoder:a3];
}

- (DAKeySharingSession)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DAKeySharingSession;
  return [(DASession *)&v4 initWithCoder:a3];
}

@end