@interface IMOffGridModeInvitationManager
+ (id)sharedInstance;
- (BOOL)_isHandleAlreadyInvited:(id)a3 idsInvitedHandles:(id)a4;
- (BOOL)_isHandleIDEligibleToReceiveAutomaticInvitation:(id)a3;
- (BOOL)_isHandleIDEligibleToReceiveAutomaticInvitation:(id)a3 isContact:(id)a4;
- (IDSOffGridStateManager)offGridStateManager;
- (IMOffGridModeInvitationManager)init;
- (NSCache)dateAttemptedInvitationByHandleCache;
- (OS_dispatch_queue)offGridBackgroundQueue;
- (id)_invitationCacheKeyForHandleID:(id)a3 fromHandleID:(id)a4;
- (void)_inviteHandleID:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5;
- (void)_invitedHandlesContainHandleID:(id)a3 completion:(id)a4;
- (void)attemptIfNecessaryToAutomaticallyShareOffGridModeWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5;
- (void)batchShareOffGridModeToHandleIDs:(id)a3 fromHandleID:(id)a4 isContact:(id)a5 completion:(id)a6;
- (void)removeAllInvitedHandlesWithCompletion:(id)a3;
- (void)repairOffGridStatusWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5;
- (void)setDateAttemptedInvitationByHandleCache:(id)a3;
- (void)setOffGridBackgroundQueue:(id)a3;
- (void)setOffGridStateManager:(id)a3;
@end

@implementation IMOffGridModeInvitationManager

+ (id)sharedInstance
{
  if (qword_1EB4A6580 != -1) {
    dispatch_once(&qword_1EB4A6580, &unk_1EF2BF680);
  }
  v2 = (void *)qword_1EB4A6010;

  return v2;
}

- (IMOffGridModeInvitationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMOffGridModeInvitationManager;
  v2 = [(IMOffGridModeInvitationManager *)&v8 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    dateAttemptedInvitationByHandleCache = v2->_dateAttemptedInvitationByHandleCache;
    v2->_dateAttemptedInvitationByHandleCache = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.messages.IMOffGridModeInvitationManager", 0);
    offGridBackgroundQueue = v2->_offGridBackgroundQueue;
    v2->_offGridBackgroundQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (IDSOffGridStateManager)offGridStateManager
{
  offGridStateManager = self->_offGridStateManager;
  if (!offGridStateManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6AB58]);
    offGridBackgroundQueue = self->_offGridBackgroundQueue;
    id v11 = 0;
    v6 = (IDSOffGridStateManager *)[v4 initWithQueue:offGridBackgroundQueue error:&v11];
    id v7 = v11;
    objc_super v8 = self->_offGridStateManager;
    self->_offGridStateManager = v6;

    if (v7)
    {
      v9 = IMLogHandleForCategory("IMOffGridModeInvitationManager");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1A09F0CE4(v9);
      }
    }
    offGridStateManager = self->_offGridStateManager;
  }

  return offGridStateManager;
}

- (void)attemptIfNecessaryToAutomaticallyShareOffGridModeWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(IMOffGridModeInvitationManager *)self _isHandleIDEligibleToReceiveAutomaticInvitation:v8])
  {
    id v11 = [(IMOffGridModeInvitationManager *)self _invitationCacheKeyForHandleID:v8 fromHandleID:v9];
    v12 = [(NSCache *)self->_dateAttemptedInvitationByHandleCache objectForKey:v11];
    v13 = v12;
    if (v12 && ([v12 timeIntervalSinceNow], fabs(v14) < 300.0))
    {
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v11;
          _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Not attempting to check or share invitation for personal off grid mode, have attempted recently for cache key: %@", buf, 0xCu);
        }
      }
      if (v10) {
        (*((void (**)(id, void, void, void, void))v10 + 2))(v10, 0, 0, 0, 0);
      }
    }
    else
    {
      dateAttemptedInvitationByHandleCache = self->_dateAttemptedInvitationByHandleCache;
      v16 = [MEMORY[0x1E4F1C9C8] date];
      [(NSCache *)dateAttemptedInvitationByHandleCache setObject:v16 forKey:v11];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1A080F0B4;
      v19[3] = &unk_1E5A12A58;
      id v23 = v10;
      id v20 = v8;
      v21 = self;
      id v22 = v9;
      [(IMOffGridModeInvitationManager *)self _invitedHandlesContainHandleID:v20 completion:v19];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Not attempting to share off grid mode, recipient is not eligible (e.g. not a contact)", buf, 2u);
      }
    }
    if (v10) {
      (*((void (**)(id, void, void, void, void))v10 + 2))(v10, 0, 0, 0, 0);
    }
  }
}

- (void)batchShareOffGridModeToHandleIDs:(id)a3 fromHandleID:(id)a4 isContact:(id)a5 completion:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v35 = a4;
  id v11 = a5;
  id v33 = a6;
  v34 = [MEMORY[0x1E4F1CA80] set];
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v48 = [v10 count];
      _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Attempting to batch invite %lu handles", buf, 0xCu);
    }
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v43;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * v15);
        if ([(IMOffGridModeInvitationManager *)self _isHandleIDEligibleToReceiveAutomaticInvitation:v16 isContact:v11])
        {
          v17 = [(IMOffGridModeInvitationManager *)self _invitationCacheKeyForHandleID:v16 fromHandleID:v35];
          v18 = [(NSCache *)self->_dateAttemptedInvitationByHandleCache objectForKey:v17];
          v19 = v18;
          if (v18 && ([v18 timeIntervalSinceNow], fabs(v20) < 300.0))
          {
            if (IMOSLoggingEnabled())
            {
              v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v48 = v16;
                _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Not attempting to check or share invitation for personal off grid mode for handle: %@, have attempted recently", buf, 0xCu);
              }
            }
          }
          else
          {
            dateAttemptedInvitationByHandleCache = self->_dateAttemptedInvitationByHandleCache;
            id v22 = [MEMORY[0x1E4F1C9C8] date];
            [(NSCache *)dateAttemptedInvitationByHandleCache setObject:v22 forKey:v17];

            id v23 = (void *)[objc_alloc(MEMORY[0x1E4F6B5C8]) initWithPrefixedURI:v16];
            [v34 addObject:v23];
          }
        }
        else if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v48 = v16;
            _os_log_impl(&dword_1A0772000, v24, OS_LOG_TYPE_INFO, "Not attempting to share off grid mode for handle %@, recipient is not eligible (e.g. not a contact)", buf, 0xCu);
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v26 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      uint64_t v13 = v26;
    }
    while (v26);
  }

  if (IMOSLoggingEnabled())
  {
    v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = [v34 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v48 = v28;
      _os_log_impl(&dword_1A0772000, v27, OS_LOG_TYPE_INFO, "%lu handles are eligible for invitation and not rate limited, checking how many are not invited", buf, 0xCu);
    }
  }
  v29 = [(IMOffGridModeInvitationManager *)self offGridStateManager];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1A080F778;
  v37[3] = &unk_1E5A12AC8;
  id v38 = v34;
  v39 = self;
  id v40 = v35;
  id v41 = v33;
  id v30 = v35;
  id v31 = v34;
  id v32 = v33;
  [v29 invitedHandlesWithCompletion:v37];
}

- (void)repairOffGridStatusWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1A080FD80;
  v14[3] = &unk_1E5A12A58;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(IMOffGridModeInvitationManager *)self _invitedHandlesContainHandleID:v12 completion:v14];
}

- (void)_inviteHandleID:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F6B5C8];
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v9 alloc] initWithUnprefixedURI:v11];

  id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F6B5C8]) initWithUnprefixedURI:v10];

  id v15 = [(IMOffGridModeInvitationManager *)self offGridStateManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1A08100D8;
  v17[3] = &unk_1E5A12AA0;
  id v18 = v8;
  id v16 = v8;
  [v15 inviteHandles:v13 fromSenderHandle:v14 withDictionaryPayload:MEMORY[0x1E4F1CC08] completion:v17];
}

- (void)_invitedHandlesContainHandleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMOffGridModeInvitationManager *)self offGridStateManager];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(IMOffGridModeInvitationManager *)self offGridStateManager];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1A08103E8;
    v14[3] = &unk_1E5A12AF0;
    id v16 = v7;
    v14[4] = self;
    id v15 = v6;
    [v10 invitedHandlesWithCompletion:v14];

    id v11 = v16;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "invitedHandlesWithCompletion: not supported", v13, 2u);
      }
    }
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMOffGridModeInvitationManagerErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (id)_invitationCacheKeyForHandleID:(id)a3 fromHandleID:(id)a4
{
  id v4 = &stru_1EF2CAD28;
  if (a3) {
    dispatch_queue_t v5 = (__CFString *)a3;
  }
  else {
    dispatch_queue_t v5 = &stru_1EF2CAD28;
  }
  if (a4) {
    id v4 = (__CFString *)a4;
  }
  return (id)[NSString stringWithFormat:@"%@;%@", v5, v4];
}

- (BOOL)_isHandleIDEligibleToReceiveAutomaticInvitation:(id)a3
{
  return [(IMOffGridModeInvitationManager *)self _isHandleIDEligibleToReceiveAutomaticInvitation:a3 isContact:&unk_1EF2BD858];
}

- (BOOL)_isHandleIDEligibleToReceiveAutomaticInvitation:(id)a3 isContact:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (uint64_t (**)(id, id))a4;
  if (+[IMAppleStoreHelper isInAppleStoreDemoMode])
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Not automatically off grid mode while in Apple Store Demo mode.", (uint8_t *)&v10, 2u);
      }
LABEL_21:

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (MEMORY[0x1A62278A0](v5))
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Handle \"%@\" is a business ID, not eligible to receive off grid subscription invitation.", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_21;
    }
LABEL_22:
    BOOL v8 = 0;
    goto LABEL_23;
  }
  if (MEMORY[0x1A62278D0](v5))
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Handle \"%@\" is a stewie ID, not eligible to receive off grid mode subscription invitation.", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if ((v6[2](v6, v5) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Handle \"%@\" is not in the users contacts, not eligible to receive off grid mode subscription invitation.", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  BOOL v8 = 1;
LABEL_23:

  return v8;
}

- (BOOL)_isHandleAlreadyInvited:(id)a3 idsInvitedHandles:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "unprefixedURI", (void)v13);
        char v11 = [v10 isEqualToString:v5];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IMOffGridModeInvitationManager *)self offGridStateManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A081096C;
  v7[3] = &unk_1E5A12B18;
  id v8 = v4;
  id v6 = v4;
  [v5 removeAllInvitedHandlesWithCompletion:v7];
}

- (void)setOffGridStateManager:(id)a3
{
}

- (NSCache)dateAttemptedInvitationByHandleCache
{
  return self->_dateAttemptedInvitationByHandleCache;
}

- (void)setDateAttemptedInvitationByHandleCache:(id)a3
{
}

- (OS_dispatch_queue)offGridBackgroundQueue
{
  return self->_offGridBackgroundQueue;
}

- (void)setOffGridBackgroundQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offGridBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_dateAttemptedInvitationByHandleCache, 0);

  objc_storeStrong((id *)&self->_offGridStateManager, 0);
}

@end