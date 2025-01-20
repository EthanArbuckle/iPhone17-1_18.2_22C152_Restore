@interface MSASPhoneInvitations
- (IDSService)idsService;
- (MSASAlbum)album;
- (MSASPhoneInvitations)init;
- (MSASStateMachine)stateMachine;
- (NSMutableDictionary)sendMessageIdentifierToPhone;
- (void)addPendingPhoneInvitations:(id)a3 toOwnedAlbum:(id)a4 inStateMachin:(id)a5;
- (void)removeSharingRelationships:(id)a3 forAlbum:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)setAlbum:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setSendMessageIdentifierToPhone:(id)a3;
- (void)setStateMachine:(id)a3;
@end

@implementation MSASPhoneInvitations

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendMessageIdentifierToPhone, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

- (void)setSendMessageIdentifierToPhone:(id)a3
{
}

- (NSMutableDictionary)sendMessageIdentifierToPhone
{
  return self->_sendMessageIdentifierToPhone;
}

- (void)setIdsService:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setAlbum:(id)a3
{
}

- (MSASAlbum)album
{
  return self->_album;
}

- (void)setStateMachine:(id)a3
{
}

- (MSASStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v12 = (MSASAlbum *)a3;
  v13 = (MSASAlbum *)a4;
  id v14 = a5;
  id v15 = a7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v23 = [v15 userInfo];
    *(_DWORD *)buf = 138544642;
    v25 = v12;
    __int16 v26 = 2112;
    v27 = v13;
    __int16 v28 = 2114;
    id v29 = v14;
    __int16 v30 = 1024;
    BOOL v31 = v8;
    __int16 v32 = 2114;
    id v33 = v15;
    __int16 v34 = 2114;
    v35 = v23;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "IDS: Get send message callback for service %{public}@ account %@ identifier %{public}@ success %d error %{public}@ info %{public}@", buf, 0x3Au);

    if (!v14) {
      goto LABEL_11;
    }
  }
  else if (!v14)
  {
    goto LABEL_11;
  }
  v16 = [(NSMutableDictionary *)self->_sendMessageIdentifierToPhone objectForKey:v14];
  if (v16)
  {
    [(NSMutableDictionary *)self->_sendMessageIdentifierToPhone removeObjectForKey:v14];
    v17 = [(MSASStateMachine *)self->_stateMachine delegate];
    [v17 MSASStateMachine:self->_stateMachine didFinishSendingInvitationByPhone:v16 toOwnedAlbum:self->_album info:0 error:v15];

    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        album = self->_album;
        *(_DWORD *)buf = 138412802;
        v25 = v13;
        __int16 v26 = 2114;
        v27 = album;
        __int16 v28 = 2114;
        id v29 = v14;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "IDS: Successfully send message from %@ for album %{public}@ with IDS identifier %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      v19 = NSString;
      v20 = self->_album;
      v21 = [v15 userInfo];
      v22 = [v19 stringWithFormat:@"IDS: Failed to send message from %@ for album %@ with identifier %@. Error: %@ Info: %@", v13, v20, v14, v15, v21];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v22;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
    }
  }

LABEL_11:
}

- (void)removeSharingRelationships:(id)a3 forAlbum:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = self;
  id v30 = a4;
  v7 = [(IDSService *)self->_idsService accounts];
  BOOL v31 = [v7 anyObject];

  BOOL v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v6;
  uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v59 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v43;
    v9 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v12 = [v11 phones];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v58 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v39 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v38 + 1) + 8 * j);
              v18 = (void *)MEMORY[0x1E019DF40](v17, 0, 1);
              if (v18)
              {
                [v8 addObject:v18];
              }
              else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v49 = v17;
                _os_log_error_impl(&dword_1DC434000, v9, OS_LOG_TYPE_ERROR, "IDS: Failed to create IDS identifier from %@", buf, 0xCu);
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v58 count:16];
          }
          while (v14);
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v59 count:16];
    }
    while (v34);
  }

  if ([v8 count])
  {
    v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v20 = [v19 valueForKey:@"MSASPhoneInvitationDebugFakeAlbumUUID"];

    if ([v20 length])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v20;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Using debugFakeAlbumGUID %@", buf, 0xCu);
      }
      [v30 setGUID:v20];
    }
    id v37 = 0;
    v21 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v30 requiringSecureCoding:1 error:&v37];
    id v22 = v37;
    if (v21)
    {
      v56[0] = @"albumData";
      v56[1] = @"type";
      v57[0] = v21;
      v57[1] = @"delete";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138544130;
        id v49 = v23;
        __int16 v50 = 2112;
        v51 = v31;
        __int16 v52 = 2112;
        v53 = v8;
        __int16 v54 = 2114;
        id v55 = v30;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "IDS: Send message %{public}@ from %@ to %@ for album %{public}@", buf, 0x2Au);
      }
      uint64_t v46 = *MEMORY[0x1E4F6AA10];
      v24 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6A8E0]];
      v47 = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];

      idsService = v29->_idsService;
      id v35 = 0;
      id v36 = 0;
      LODWORD(v24) = [(IDSService *)idsService sendMessage:v23 fromAccount:v31 toDestinations:v8 priority:300 options:v25 identifier:&v36 error:&v35];
      id v27 = v36;
      id v28 = v35;
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v49 = v27;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "IDS: Send message with identifier %{public}@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v28;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IDS: Failed to send message. Error: %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v22;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to archive an album object: %{public}@", buf, 0xCu);
    }
  }
}

- (void)addPendingPhoneInvitations:(id)a3 toOwnedAlbum:(id)a4 inStateMachin:(id)a5
{
  id v9 = a4;
  objc_storeStrong((id *)&self->_stateMachine, a5);
  id v10 = a5;
  id v11 = a3;
  objc_storeStrong((id *)&self->_album, a4);
  v12 = [(IDSService *)self->_idsService accounts];
  uint64_t v13 = [v12 anyObject];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__MSASPhoneInvitations_addPendingPhoneInvitations_toOwnedAlbum_inStateMachin___block_invoke;
  v16[3] = &unk_1E6C3B908;
  id v17 = v9;
  id v18 = v13;
  v19 = self;
  id v14 = v13;
  id v15 = v9;
  [v11 enumerateKeysAndObjectsUsingBlock:v16];
}

void __78__MSASPhoneInvitations_addPendingPhoneInvitations_toOwnedAlbum_inStateMachin___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) setMetadataValue:a3 forKey:@"phoneInvitationToken"];
    uint64_t v6 = *(void *)(a1 + 32);
    id v25 = 0;
    v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v25];
    id v8 = v25;
    if (v7)
    {
      id v9 = (void *)MEMORY[0x1E019DF40](v5, 0, 1);
      if (v9)
      {
        id v22 = v8;
        uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
        v36[0] = @"albumData";
        v36[1] = @"type";
        v37[0] = v7;
        v37[1] = @"new";
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138544130;
          id v29 = v11;
          __int16 v30 = 2112;
          uint64_t v31 = v12;
          __int16 v32 = 2112;
          uint64_t v33 = v10;
          __int16 v34 = 2114;
          uint64_t v35 = v13;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "IDS: Send message %{public}@ from %@ to %@ for album %{public}@", buf, 0x2Au);
        }
        v26[0] = *MEMORY[0x1E4F6AA10];
        id v14 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6A8E0]];
        v26[1] = *MEMORY[0x1E4F6A990];
        v27[0] = v14;
        v27[1] = MEMORY[0x1E4F1CC28];
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

        uint64_t v16 = *(void *)(a1 + 40);
        id v17 = *(void **)(*(void *)(a1 + 48) + 24);
        id v23 = 0;
        id v24 = 0;
        id v18 = (void *)v10;
        int v19 = [v17 sendMessage:v11 fromAccount:v16 toDestinations:v10 priority:300 options:v15 identifier:&v24 error:&v23];
        id v20 = v24;
        id v21 = v23;
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v20;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "IDS: Send message with identifier %{public}@", buf, 0xCu);
          }
          [*(id *)(*(void *)(a1 + 48) + 32) setObject:v5 forKey:v20];
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v29 = v21;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IDS: Failed to send message. Error: %{public}@", buf, 0xCu);
        }

        id v8 = v22;
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v5;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IDS: Failed to create IDS identifier from %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v8;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to archive an album object: %{public}@", buf, 0xCu);
    }
  }
}

- (MSASPhoneInvitations)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSASPhoneInvitations;
  v2 = [(MSASPhoneInvitations *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.photostream"];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v3;

    [(IDSService *)v2->_idsService addDelegate:v2 queue:MEMORY[0x1E4F14428]];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    sendMessageIdentifierToPhone = v2->_sendMessageIdentifierToPhone;
    v2->_sendMessageIdentifierToPhone = (NSMutableDictionary *)v5;
  }
  return v2;
}

@end