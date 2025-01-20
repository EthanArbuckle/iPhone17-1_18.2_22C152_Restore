@interface CKPendingConversation
+ (id)pendingConversationForHandle:(id)a3;
- (BOOL)isAppleConversation;
- (BOOL)isMakoConversation;
- (BOOL)noAvailableServices;
- (BOOL)pendingChat;
- (IMService)composeSendingService;
- (IMService)previousSendingService;
- (IMServiceReachabilityContext)serviceReachabilityContext;
- (id)deviceIndependentID;
- (id)sendingService;
- (id)serviceReachabilityContextForRefreshContext:(id)a3;
- (id)uniqueIdentifier;
- (void)refreshComposeSendingServiceForAddresses:(id)a3 context:(id)a4 withCompletionBlock:(id)a5;
- (void)refreshComposeSendingServiceForAddresses:(id)a3 withCompletionBlock:(id)a4;
- (void)refreshStatusForAddresses:(id)a3 context:(id)a4 withCompletionBlock:(id)a5;
- (void)refreshStatusForAddresses:(id)a3 withCompletionBlock:(id)a4;
- (void)setComposeSendingService:(id)a3;
- (void)setNoAvailableServices:(BOOL)a3;
- (void)setPendingChat:(BOOL)a3;
- (void)setPreviousSendingService:(id)a3;
@end

@implementation CKPendingConversation

- (void)refreshStatusForAddresses:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v8);
      }
      if (IMStringIsEmail()) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v12 = [(CKConversation *)self chat];
  [v12 shouldForceServerStatusRefresh];

  v13 = [(CKConversation *)self lastAddressedHandle];
  v14 = [v13 _stripFZIDPrefix];
  v15 = [v14 _bestGuessURI];

  v16 = [(CKConversation *)self lastAddressedSIMID];
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v15;
      __int16 v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Calling IMChatCalculateServiceForSendingNewComposeMaybeForce with last addressed handle %@ simID %@", buf, 0x16u);
    }
  }
  v18 = [(CKConversation *)self chat];
  [v18 receivedResponseForChat];

  v19 = [(CKConversation *)self chat];
  [(CKConversation *)self forceMMS];
  v20 = [(CKConversation *)self chat];
  [v20 isDowngraded];
  v22 = v7;
  id v21 = v7;
  IMChatCalculateServiceForSendingNewComposeMaybeForce();
}

- (id)sendingService
{
  v3 = [(CKConversation *)self chat];

  if (v3)
  {
    v12.receiver = self;
    v12.super_class = (Class)CKPendingConversation;
    uint64_t v4 = [(CKConversation *)&v12 sendingService];
LABEL_5:
    id v6 = (void *)v4;
    goto LABEL_6;
  }
  v5 = [(CKPendingConversation *)self composeSendingService];

  if (v5)
  {
    uint64_t v4 = [(CKPendingConversation *)self composeSendingService];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_6:
  id v7 = [(CKConversation *)self lastAddressedHandle];
  id v8 = [(CKConversation *)self lastAddressedSIMID];
  if (!v6)
  {
    uint64_t v9 = [(CKPendingConversation *)self previousSendingService];

    if (v9)
    {
      uint64_t v10 = [(CKPendingConversation *)self previousSendingService];
    }
    else
    {
      if ([MEMORY[0x1E4F6BDC0] iMessageEnabledForSenderLastAddressedHandle:v7 simID:v8]) {
        [MEMORY[0x1E4F6BDB8] iMessageService];
      }
      else {
      uint64_t v10 = [MEMORY[0x1E4F6BDB8] smsService];
      }
    }
    id v6 = (void *)v10;
  }

  return v6;
}

- (id)serviceReachabilityContextForRefreshContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 customContext];

  if (v5)
  {
    id v6 = [v4 customContext];
    id v7 = (id)[v6 copy];
  }
  else
  {
    id v8 = [(CKConversation *)self chat];

    if (v8)
    {
      id v6 = [MEMORY[0x1E4F6BDC8] sharedController];
      uint64_t v9 = [(CKConversation *)self chat];
      id v7 = [v6 reachabilityContextForChat:v9];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F6E970]);
      id v6 = [(CKConversation *)self handles];
      if ((unint64_t)[v6 count] <= 1) {
        uint64_t v10 = 45;
      }
      else {
        uint64_t v10 = 43;
      }
      [v7 setChatStyle:v10];
    }
  }

  uint64_t v11 = [(CKConversation *)self lastAddressedHandle];
  objc_super v12 = [v11 _stripFZIDPrefix];
  [v7 setSenderLastAddressedHandle:v12];

  v13 = [(CKConversation *)self lastAddressedSIMID];
  [v7 setSenderLastAddressedSIMID:v13];

  v14 = [v4 customContext];
  if (v14 || ([(CKConversation *)self chat], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else if (IMBagBoolValueWithDefault())
  {
    [v7 setIsForPendingConversation:1];
  }
  if ([v4 isForPendingConversation] && IMBagBoolValueWithDefault()) {
    [v7 setIsForPendingConversation:1];
  }
  v15 = [v7 preconditionsIgnoredForServices];
  v16 = (void *)[v15 mutableCopy];
  v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  v19 = v18;

  v20 = [v4 preconditionsIgnoredForServices];

  if (v20)
  {
    id v21 = [v4 preconditionsIgnoredForServices];
    [v19 unionSet:v21];
  }
  v22 = [(CKPendingConversation *)self sendingService];
  long long v23 = v22;
  if (v22)
  {
    long long v24 = [v22 internalName];
    [v19 addObject:v24];
  }
  long long v25 = (void *)[v19 copy];
  [v7 setPreconditionsIgnoredForServices:v25];

  return v7;
}

- (IMServiceReachabilityContext)serviceReachabilityContext
{
  return (IMServiceReachabilityContext *)[(CKPendingConversation *)self serviceReachabilityContextForRefreshContext:0];
}

uint64_t __71__CKPendingConversation_refreshStatusForAddresses_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4, a5, a6);
  }
  return result;
}

- (void)refreshStatusForAddresses:(id)a3 context:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CKPendingConversation *)self serviceReachabilityContextForRefreshContext:v9];
  objc_super v12 = [v9 availabilities];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__CKPendingConversation_refreshStatusForAddresses_context_withCompletionBlock___block_invoke;
  v16[3] = &unk_1E562C690;
  id v18 = v8;
  id v19 = v10;
  id v17 = v9;
  id v13 = v8;
  id v14 = v9;
  id v15 = v10;
  [v12 refreshAvailabilityForRecipients:v13 context:v11 resultHandler:v16];
}

void __79__CKPendingConversation_refreshStatusForAddresses_context_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (*(void *)(a1 + 48))
  {
    id v10 = [MEMORY[0x1E4F6BDB8] serviceWithName:a2];
    if (!v10)
    {
      id v10 = [MEMORY[0x1E4F6BDB8] smsService];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = objc_msgSend(v9, "resultsByAccountID", 0);
    objc_super v12 = [v11 allValues];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          if ([*(id *)(*((void *)&v18 + 1) + 8 * i) didCheckServer])
          {
            uint64_t v13 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    v16 = [*(id *)(a1 + 32) availabilities];
    id v17 = [v16 availabilitiesForRecipients:*(void *)(a1 + 40) service:*MEMORY[0x1E4F6E1B0]];

    (*(void (**)(void, void *, void *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v10, v17, v13, a4, [v9 isFinal], a5);
  }
}

- (void)refreshComposeSendingServiceForAddresses:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__CKPendingConversation_refreshComposeSendingServiceForAddresses_withCompletionBlock___block_invoke;
  v8[3] = &unk_1E5621748;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CKPendingConversation *)self refreshStatusForAddresses:a3 withCompletionBlock:v8];
}

void __86__CKPendingConversation_refreshComposeSendingServiceForAddresses_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = [*(id *)(a1 + 32) composeSendingService];

  if (v11 != v9)
  {
    [*(id *)(a1 + 32) setComposeSendingService:v9];
    if (IMOSLoggingEnabled())
    {
      objc_super v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v9 name];
        int v16 = 138412290;
        id v17 = v13;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "[Event] Updated composeSendingService to [%@] on CKPendingConversation.", (uint8_t *)&v16, 0xCu);
      }
    }
    uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"CKConversationPreferredServiceChangedNotification" object:*(void *)(a1 + 32) userInfo:0];
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, id, id, uint64_t, uint64_t))(v15 + 16))(v15, v9, v10, a4, a5);
  }
}

- (void)refreshComposeSendingServiceForAddresses:(id)a3 context:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__CKPendingConversation_refreshComposeSendingServiceForAddresses_context_withCompletionBlock___block_invoke;
  v10[3] = &unk_1E5621720;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(CKPendingConversation *)self refreshStatusForAddresses:a3 context:a4 withCompletionBlock:v10];
}

void __94__CKPendingConversation_refreshComposeSendingServiceForAddresses_context_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = [*(id *)(a1 + 32) composeSendingService];

  if (v15 != v13)
  {
    [*(id *)(a1 + 32) setComposeSendingService:v13];
    if (IMOSLoggingEnabled())
    {
      int v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = [v13 name];
        int v20 = 138412290;
        long long v21 = v17;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "[Event] Updated composeSendingService to [%@] on CKPendingConversation.", (uint8_t *)&v20, 0xCu);
      }
    }
    uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 postNotificationName:@"CKConversationPreferredServiceChangedNotification" object:*(void *)(a1 + 32) userInfo:0];
  }
  uint64_t v19 = *(void *)(a1 + 40);
  if (v19) {
    (*(void (**)(uint64_t, id, id, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 16))(v19, v13, v14, a4, a5, a6, a7);
  }
}

- (id)uniqueIdentifier
{
  return @"Pending";
}

- (id)deviceIndependentID
{
  v8.receiver = self;
  v8.super_class = (Class)CKPendingConversation;
  v3 = [(CKConversation *)&v8 deviceIndependentID];
  if (!v3)
  {
    id v4 = [(CKConversation *)self recipients];
    if ([v4 count] == 1)
    {
      v5 = [v4 firstObject];
      id v6 = [v5 defaultIMHandle];
      v3 = [v6 ID];
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

+ (id)pendingConversationForHandle:(id)a3
{
  id v3 = a3;
  id v4 = [CKPendingConversation alloc];
  v5 = [MEMORY[0x1E4F6BC28] pendingChatForHandle:v3];

  id v6 = [(CKConversation *)v4 initWithChat:v5];
  [(CKPendingConversation *)v6 setPendingChat:1];

  return v6;
}

- (BOOL)isAppleConversation
{
  v2 = [(CKConversation *)self businessHandle];
  char v3 = [v2 isApple];

  return v3;
}

- (BOOL)isMakoConversation
{
  v2 = [(CKConversation *)self businessHandle];
  char v3 = [v2 isMako];

  return v3;
}

- (BOOL)noAvailableServices
{
  return self->_noAvailableServices;
}

- (void)setNoAvailableServices:(BOOL)a3
{
  self->_noAvailableServices = a3;
}

- (IMService)previousSendingService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousSendingService);

  return (IMService *)WeakRetained;
}

- (void)setPreviousSendingService:(id)a3
{
}

- (BOOL)pendingChat
{
  return self->_pendingChat;
}

- (void)setPendingChat:(BOOL)a3
{
  self->_pendingChat = a3;
}

- (IMService)composeSendingService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeSendingService);

  return (IMService *)WeakRetained;
}

- (void)setComposeSendingService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_composeSendingService);

  objc_destroyWeak((id *)&self->_previousSendingService);
}

@end