@interface HMUserCloudShareWithOwnerOperation
+ (id)logCategory;
- (BOOL)allowWriteAccess;
- (CKContainer)container;
- (CKShare)share;
- (HMUser)currentUser;
- (HMUser)ownerUser;
- (HMUserCloudShareWithOwnerOperation)initWithShare:(id)a3 container:(id)a4 ownerUser:(id)a5 allowWriteAccess:(BOOL)a6 currentUser:(id)a7;
- (HMUserCloudShareWithOwnerOperation)initWithShare:(id)a3 container:(id)a4 ownerUser:(id)a5 allowWriteAccess:(BOOL)a6 currentUser:(id)a7 analyticsEventSender:(id)a8;
- (NSUUID)operationID;
- (id)analyticsEventSender;
- (id)completion;
- (id)logIdentifier;
- (void)fetchParticipantForLookupInfo:(id)a3 completion:(id)a4;
- (void)main;
- (void)removeOwnerAsParticipant:(id)a3 completion:(id)a4;
- (void)saveShareAndObtainSavedOwner:(id)a3 completion:(id)a4;
- (void)sendShareToOwner:(id)a3 from:(id)a4 savedOwnerAsParticipant:(id)a5 share:(id)a6 completion:(id)a7;
- (void)setCompletion:(id)a3;
- (void)setShare:(id)a3;
@end

@implementation HMUserCloudShareWithOwnerOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_analyticsEventSender, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_ownerUser, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

- (id)analyticsEventSender
{
  return objc_getProperty(self, a2, 312, 1);
}

- (BOOL)allowWriteAccess
{
  return self->_allowWriteAccess;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setShare:(id)a3
{
}

- (CKShare)share
{
  return self->_share;
}

- (HMUser)ownerUser
{
  return self->_ownerUser;
}

- (HMUser)currentUser
{
  return self->_currentUser;
}

- (NSUUID)operationID
{
  return self->_operationID;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (id)logIdentifier
{
  v2 = [(HMUserCloudShareWithOwnerOperation *)self currentUser];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)main
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)HMUserCloudShareWithOwnerOperation;
  [(HMUserCloudShareWithOwnerOperation *)&v28 main];
  v3 = [(HMUserCloudShareWithOwnerOperation *)self completion];
  BOOL v4 = v3 == 0;

  if (v4)
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Completion must be provided" userInfo:0];
    objc_exception_throw(v18);
  }
  v5 = [(HMUserCloudShareWithOwnerOperation *)self completion];
  [(HMUserCloudShareWithOwnerOperation *)self setCompletion:0];
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    v7 = logger;
    v8 = [(HMUserCloudShareWithOwnerOperation *)self operationID];
    v9 = [(HMUserCloudShareWithOwnerOperation *)self currentUser];
    v10 = [v9 uuid];
    v11 = [(HMUserCloudShareWithOwnerOperation *)self ownerUser];
    v12 = [v11 uuid];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v30 = v12;
    _os_signpost_emit_with_name_impl(&dword_19D1A8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MultiUser.Share.Operation", "OperationID=%{signpost.description:attribute}@ User=%{signpost.description:attribute}@ Owner=%{signpost.description:attribute}@ ", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__38136;
  v31 = __Block_byref_object_dispose__38137;
  id v32 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke;
  aBlock[3] = &unk_1E5942EF0;
  objc_copyWeak(v26, &location);
  v25 = buf;
  v26[1] = (id)0xEEEEB0B5B2B2EEEELL;
  id v13 = v5;
  id v24 = v13;
  v14 = _Block_copy(aBlock);
  v15 = self->_logger;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "Fetching lookup info for owner user.", v22, 2u);
  }
  [*(id *)(*(void *)&buf[8] + 40) setObject:&unk_1EEF07FF8 forKeyedSubscript:@"stage"];
  v16 = [(HMUserCloudShareWithOwnerOperation *)self ownerUser];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_77;
  v19[3] = &unk_1E5942F68;
  id v17 = v14;
  v19[4] = self;
  id v20 = v17;
  v21 = buf;
  [v16 fetchShareLookupInfo:v19];

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:&unk_1EEF07FF8 forKeyedSubscript:@"result"];
    if (v6)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:&unk_1EEF08010 forKeyedSubscript:@"result"];
      v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
      v9 = [v8 stringValue];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKeyedSubscript:@"errorCode"];

      uint64_t v10 = [v6 domain];
      v11 = (void *)v10;
      if (v10) {
        v12 = (__CFString *)v10;
      }
      else {
        v12 = @"<No Domain>";
      }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v12 forKeyedSubscript:@"errorDomain"];
    }
    id v13 = [WeakRetained share];
    v14 = [v13 containerID];
    v15 = [v14 containerIdentifier];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v15 forKeyedSubscript:@"client"];

    v16 = [WeakRetained analyticsEventSender];
    ((void (**)(void, __CFString *, void))v16)[2](v16, @"com.apple.HomeKit.MultiUserShareOperationResult", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

    id v17 = WeakRetained[31];
    id v18 = v17;
    os_signpost_id_t v19 = *(void *)(a1 + 56);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_signpost_emit_with_name_impl(&dword_19D1A8000, v18, OS_SIGNPOST_INTERVAL_END, v19, "MultiUser.Share.Operation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v20, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "Fetch CKParticipant for Owner User.", buf, 2u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:&unk_1EEF08010 forKeyedSubscript:@"stage"];
    v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_78;
    v11[3] = &unk_1E5942F40;
    v11[4] = v8;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v12 = v9;
    uint64_t v13 = v10;
    [v8 fetchParticipantForLookupInfo:v5 completion:v11];
  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) allowWriteAccess])
  {
    v7 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "Setting permission to read/write.", buf, 2u);
    }
    [v5 setPermission:3];
  }
  if (v6)
  {
    v8 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v6;
      _os_log_error_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "Got error while fetching participant: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v9 = [*(id *)(a1 + 32) share];
    uint64_t v10 = [v9 participants];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (!v11) {
      goto LABEL_17;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ([v15 isEqual:v5])
        {
          v16 = *(NSObject **)(*(void *)(a1 + 32) + 248);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v51 = v15;
            _os_log_debug_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_DEBUG, "Found owner in share. %@", buf, 0xCu);
          }
          id v17 = v15;

          if (!v17) {
            goto LABEL_25;
          }
          if ([v17 invitationTokenStatus] == 3)
          {
            id v18 = *(NSObject **)(*(void *)(a1 + 32) + 248);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "Owner needs a new token resending invite.", buf, 2u);
            }
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:&unk_1EEF08028 forKeyedSubscript:@"stage"];
            [v17 setWantsNewInvitationToken:1];
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_81;
            v42[3] = &unk_1E5942F40;
            os_signpost_id_t v19 = *(void **)(a1 + 32);
            id v20 = *(id *)(a1 + 40);
            v42[4] = *(void *)(a1 + 32);
            id v43 = v20;
            uint64_t v44 = *(void *)(a1 + 48);
            [v19 saveShareAndObtainSavedOwner:v5 completion:v42];
            id v21 = v43;
          }
          else
          {
            if ([v17 acceptanceStatus] == 2)
            {
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:&unk_1EEF08058 forKeyedSubscript:@"stage"];
              v27 = *(NSObject **)(*(void *)(a1 + 32) + 248);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "Owner has already accepted the share.", buf, 2u);
              }
              objc_super v28 = [HMHomeCloudShareResponse alloc];
              v29 = [*(id *)(a1 + 32) ownerUser];
              v30 = [(HMHomeCloudShareResponse *)v28 initWithOwnerUser:v29 pariticipant:v17 clientInfo:0];

              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
              goto LABEL_36;
            }
            v31 = *(NSObject **)(*(void *)(a1 + 32) + 248);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_INFO, "Owner exists in the share participants remove and re-invite.", buf, 2u);
            }
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:&unk_1EEF08070 forKeyedSubscript:@"stage"];
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_89;
            v38[3] = &unk_1E5942F18;
            id v32 = *(void **)(a1 + 32);
            id v33 = *(id *)(a1 + 40);
            v38[4] = *(void *)(a1 + 32);
            uint64_t v34 = *(void *)(a1 + 48);
            id v40 = v33;
            uint64_t v41 = v34;
            id v39 = v5;
            [v32 removeOwnerAsParticipant:v17 completion:v38];

            id v21 = v40;
          }

          goto LABEL_36;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v12) {
        continue;
      }
      break;
    }
LABEL_17:

LABEL_25:
    uint64_t v22 = *(void **)(a1 + 32);
    v23 = v22[31];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "Owner not present on the share inviting.", buf, 2u);
      uint64_t v22 = *(void **)(a1 + 32);
    }
    id v24 = [v22 share];
    [v24 addParticipant:v5];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:&unk_1EEF08088 forKeyedSubscript:@"stage"];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_95;
    v35[3] = &unk_1E5942F40;
    v25 = *(void **)(a1 + 32);
    id v26 = *(id *)(a1 + 40);
    v35[4] = *(void *)(a1 + 32);
    id v36 = v26;
    uint64_t v37 = *(void *)(a1 + 48);
    [v25 saveShareAndObtainSavedOwner:v5 completion:v35];
    id v17 = v36;
LABEL_36:
  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "Sending share after saving for token.", v12, 2u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:&unk_1EEF08040 forKeyedSubscript:@"stage"];
    v8 = *(void **)(a1 + 32);
    id v9 = [v8 ownerUser];
    uint64_t v10 = [*(id *)(a1 + 32) currentUser];
    uint64_t v11 = [*(id *)(a1 + 32) share];
    [v8 sendShareToOwner:v9 from:v10 savedOwnerAsParticipant:v5 share:v11 completion:*(void *)(a1 + 40)];
  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_89(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    BOOL v4 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "Adding owner again after removing.", buf, 2u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:&unk_1EEF08088 forKeyedSubscript:@"stage"];
    id v5 = [*(id *)(a1 + 32) share];
    [v5 addParticipant:*(void *)(a1 + 40)];

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_92;
    v9[3] = &unk_1E5942F40;
    id v8 = *(id *)(a1 + 48);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 56);
    [v6 saveShareAndObtainSavedOwner:v7 completion:v9];
  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "Sending share to owner.", v12, 2u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:&unk_1EEF080B8 forKeyedSubscript:@"stage"];
    id v8 = *(void **)(a1 + 32);
    id v9 = [v8 ownerUser];
    id v10 = [*(id *)(a1 + 32) currentUser];
    uint64_t v11 = [*(id *)(a1 + 32) share];
    [v8 sendShareToOwner:v9 from:v10 savedOwnerAsParticipant:v5 share:v11 completion:*(void *)(a1 + 40)];
  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "Sending share after adding owner again.", v12, 2u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:&unk_1EEF080A0 forKeyedSubscript:@"stage"];
    id v8 = *(void **)(a1 + 32);
    id v9 = [v8 ownerUser];
    id v10 = [*(id *)(a1 + 32) currentUser];
    uint64_t v11 = [*(id *)(a1 + 32) share];
    [v8 sendShareToOwner:v9 from:v10 savedOwnerAsParticipant:v5 share:v11 completion:*(void *)(a1 + 40)];
  }
}

- (void)sendShareToOwner:(id)a3 from:(id)a4 savedOwnerAsParticipant:(id)a5 share:(id)a6 completion:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, void, id))a7;
  id v16 = a6;
  id v17 = [v16 URL];
  id v18 = [v14 invitationToken];
  os_signpost_id_t v19 = [v16 containerID];

  id v20 = [v19 containerIdentifier];

  id v36 = 0;
  id v21 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v36];
  id v22 = v36;
  if (!v21)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v22;
      _os_log_error_impl(&dword_19D1A8000, logger, OS_LOG_TYPE_ERROR, "Unable to encode share token. %@", buf, 0xCu);
      if (v22) {
        goto LABEL_6;
      }
    }
    else if (v22)
    {
LABEL_6:
      v15[2](v15, 0, v22);
      goto LABEL_7;
    }
    id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Got back nil encoded token" reason:@"Expected encoded token" suggestion:&stru_1EEE9DD88];
    goto LABEL_6;
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __101__HMUserCloudShareWithOwnerOperation_sendShareToOwner_from_savedOwnerAsParticipant_share_completion___block_invoke;
  v31[3] = &unk_1E5942EC8;
  v31[4] = self;
  id v32 = v12;
  id v23 = v13;
  id v30 = v22;
  id v24 = v18;
  id v25 = v13;
  id v26 = v12;
  id v27 = v23;
  id v33 = v23;
  id v34 = v14;
  v35 = v15;
  id v28 = v27;
  id v12 = v26;
  id v13 = v25;
  id v18 = v24;
  id v22 = v30;
  [v32 sendClientShareURL:v17 shareToken:v21 containerID:v20 fromUser:v28 completion:v31];

LABEL_7:
}

void __101__HMUserCloudShareWithOwnerOperation_sendShareToOwner_from_savedOwnerAsParticipant_share_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_error_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "Unable to complete share to owner %@ from %@. Error %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (v5)
    {
      id v18 = 0;
      id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v18];
      id v9 = v18;
    }
    else
    {
      id v8 = 0;
      id v9 = 0;
    }
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "Completed share to owner %@ from %@ nonce %@.", buf, 0x20u);
    }
    if (v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      id v13 = [HMHomeCloudShareResponse alloc];
      id v14 = [*(id *)(a1 + 32) ownerUser];
      v15 = [(HMHomeCloudShareResponse *)v13 initWithOwnerUser:v14 pariticipant:*(void *)(a1 + 56) clientInfo:v8];

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

- (void)removeOwnerAsParticipant:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMUserCloudShareWithOwnerOperation *)self share];
  [v8 removeParticipant:v7];

  id v9 = objc_alloc(MEMORY[0x1E4F1A198]);
  id v10 = [(HMUserCloudShareWithOwnerOperation *)self share];
  v23[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  uint64_t v12 = (void *)[v9 initWithRecordsToSave:v11 recordIDsToDelete:0];

  id v13 = [v12 configuration];
  [v13 setQualityOfService:17];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  os_signpost_id_t v19 = __74__HMUserCloudShareWithOwnerOperation_removeOwnerAsParticipant_completion___block_invoke;
  uint64_t v20 = &unk_1E5942EA0;
  __int16 v21 = self;
  id v22 = v6;
  id v14 = v6;
  [v12 setModifyRecordsCompletionBlock:&v17];
  v15 = [(HMUserCloudShareWithOwnerOperation *)self container];
  uint64_t v16 = [v15 privateCloudDatabase];
  [v16 addOperation:v12];
}

void __74__HMUserCloudShareWithOwnerOperation_removeOwnerAsParticipant_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "Got error while saving share to remove owner.", (uint8_t *)&v18, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v11 = [v7 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    id v14 = *(void **)(a1 + 32);
    v15 = v14[31];
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "Successfully removed owner from share", (uint8_t *)&v18, 2u);
        id v14 = *(void **)(a1 + 32);
      }
      [v14 setShare:v13];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412290;
        id v19 = v7;
        _os_log_error_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "Unable to find share in saved records: %@", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Unexpected result after saving share" reason:@"Couldn't get CKShare" suggestion:0];
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
    }
  }
}

- (void)saveShareAndObtainSavedOwner:(id)a3 completion:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1A198]);
  id v9 = [(HMUserCloudShareWithOwnerOperation *)self share];
  v20[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v11 = (void *)[v8 initWithRecordsToSave:v10 recordIDsToDelete:0];

  uint64_t v12 = [v11 configuration];
  [v12 setQualityOfService:17];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__HMUserCloudShareWithOwnerOperation_saveShareAndObtainSavedOwner_completion___block_invoke;
  v17[3] = &unk_1E5942E78;
  id v18 = v6;
  id v19 = v7;
  v17[4] = self;
  id v13 = v6;
  id v14 = v7;
  [v11 setModifyRecordsCompletionBlock:v17];
  v15 = [(HMUserCloudShareWithOwnerOperation *)self container];
  uint64_t v16 = [v15 privateCloudDatabase];
  [v16 addOperation:v11];
}

void __78__HMUserCloudShareWithOwnerOperation_saveShareAndObtainSavedOwner_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    if ([v7 count] != 1)
    {
      uint64_t v20 = *(NSObject **)(*(void *)(a1 + 32) + 248);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v7;
        _os_log_error_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "Unexpected number of saved records: %@", buf, 0xCu);
      }
      __int16 v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Unexpected result after saving share" reason:@"Unexpected number of records" suggestion:0];
      id v22 = 0;
      if (!v21) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
    uint64_t v11 = [v7 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = objc_msgSend(v13, "participants", 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v33;
LABEL_12:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
          if ([v19 isEqual:*(void *)(a1 + 40)]) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v16) {
              goto LABEL_12;
            }
            goto LABEL_18;
          }
        }
        id v22 = v19;

        if (!v22) {
          goto LABEL_25;
        }
        [*(id *)(a1 + 32) setShare:v13];
        __int16 v21 = 0;
LABEL_32:

        if (!v21)
        {
LABEL_34:
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          goto LABEL_35;
        }
LABEL_33:

        id v22 = 0;
        goto LABEL_34;
      }
LABEL_18:

LABEL_25:
      __int16 v23 = *(NSObject **)(*(void *)(a1 + 32) + 248);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v29 = *(void **)(a1 + 40);
        id v30 = v23;
        v31 = [v13 participants];
        *(_DWORD *)buf = 138412546;
        id v37 = v29;
        __int16 v38 = 2112;
        uint64_t v39 = v31;
        _os_log_error_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "Couldn't find participant %@ in share: %@", buf, 0x16u);
      }
      id v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = @"Unable to find participant in saved share";
      id v26 = @"Couldn't find owner as participant";
      uint64_t v27 = 2;
    }
    else
    {
      id v28 = *(NSObject **)(*(void *)(a1 + 32) + 248);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v7;
        _os_log_error_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "Unable to find share in saved records: %@", buf, 0xCu);
      }
      id v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = @"Unexpected result after saving share";
      id v26 = @"Couldn't get CKShare";
      uint64_t v27 = 3;
    }
    __int16 v21 = [v24 hmErrorWithCode:v27 description:v25 reason:v26 suggestion:0];
    id v22 = 0;
    goto LABEL_32;
  }
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 248);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v9;
    _os_log_error_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "Got error while saving share to add owner. %@", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_35:
}

- (void)fetchParticipantForLookupInfo:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_19D1A8000, logger, OS_LOG_TYPE_DEFAULT, "Fetching Share Participant for %@", buf, 0xCu);
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1A0D8]);
  id v23 = v6;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  uint64_t v11 = (void *)[v9 initWithUserIdentityLookupInfos:v10];

  uint64_t v12 = [v11 configuration];
  [v12 setQualityOfService:17];

  id v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__HMUserCloudShareWithOwnerOperation_fetchParticipantForLookupInfo_completion___block_invoke;
  v21[3] = &unk_1E5942E50;
  id v14 = v13;
  id v22 = v14;
  [v11 setShareParticipantFetchedBlock:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__HMUserCloudShareWithOwnerOperation_fetchParticipantForLookupInfo_completion___block_invoke_2;
  v18[3] = &unk_1E59449F0;
  id v19 = v14;
  id v20 = v7;
  v18[4] = self;
  id v15 = v14;
  id v16 = v7;
  [v11 setFetchShareParticipantsCompletionBlock:v18];
  uint64_t v17 = [(HMUserCloudShareWithOwnerOperation *)self container];
  [v17 addOperation:v11];
}

uint64_t __79__HMUserCloudShareWithOwnerOperation_fetchParticipantForLookupInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __79__HMUserCloudShareWithOwnerOperation_fetchParticipantForLookupInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_error_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "Got error while fetching participant participant: %@", (uint8_t *)&v10, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if ([*(id *)(a1 + 40) count])
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 40) firstObject];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
  else
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "Could not find a single participant.", (uint8_t *)&v10, 2u);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Unable to determine participant" reason:@"Couldn't get participant for CKShare" suggestion:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
}

- (HMUserCloudShareWithOwnerOperation)initWithShare:(id)a3 container:(id)a4 ownerUser:(id)a5 allowWriteAccess:(BOOL)a6 currentUser:(id)a7 analyticsEventSender:(id)a8
{
  id v27 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HMUserCloudShareWithOwnerOperation;
  uint64_t v18 = [(HMUserCloudShareWithOwnerOperation *)&v28 init];
  if (v18)
  {
    uint64_t v19 = HMFGetOSLogHandle();
    logger = v18->_logger;
    v18->_logger = (OS_os_log *)v19;

    uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
    operationID = v18->_operationID;
    v18->_operationID = (NSUUID *)v21;

    objc_storeStrong((id *)&v18->_share, a3);
    objc_storeStrong((id *)&v18->_container, a4);
    objc_storeStrong((id *)&v18->_ownerUser, a5);
    objc_storeStrong((id *)&v18->_currentUser, a7);
    v18->_allowWriteAccess = a6;
    id v23 = _Block_copy(v17);
    id analyticsEventSender = v18->_analyticsEventSender;
    v18->_id analyticsEventSender = v23;
  }
  return v18;
}

- (HMUserCloudShareWithOwnerOperation)initWithShare:(id)a3 container:(id)a4 ownerUser:(id)a5 allowWriteAccess:(BOOL)a6 currentUser:(id)a7
{
  return [(HMUserCloudShareWithOwnerOperation *)self initWithShare:a3 container:a4 ownerUser:a5 allowWriteAccess:a6 currentUser:a7 analyticsEventSender:&__block_literal_global_38244];
}

void __101__HMUserCloudShareWithOwnerOperation_initWithShare_container_ownerUser_allowWriteAccess_currentUser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__HMUserCloudShareWithOwnerOperation_initWithShare_container_ownerUser_allowWriteAccess_currentUser___block_invoke_2;
  v11[3] = &unk_1E5942E28;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  uint64_t v8 = v11;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v9 = (void (*)(id, void *))getAnalyticsSendEventLazySymbolLoc_ptr_38246;
  id v17 = getAnalyticsSendEventLazySymbolLoc_ptr_38246;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr_38246)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke_38247;
    v13[3] = &unk_1E5943DD8;
    v13[4] = &v14;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke_38247((uint64_t)v13);
    id v9 = (void (*)(id, void *))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v9)
  {
    dlerror();
    int v10 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v10);
  }
  v9(v7, v8);
}

id __101__HMUserCloudShareWithOwnerOperation_initWithShare_container_ownerUser_allowWriteAccess_currentUser___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32 != -1) {
    dispatch_once(&logCategory__hmf_once_t32, &__block_literal_global_101_38257);
  }
  v2 = (void *)logCategory__hmf_once_v33;

  return v2;
}

uint64_t __49__HMUserCloudShareWithOwnerOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v33;
  logCategory__hmf_once_long long v33 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end