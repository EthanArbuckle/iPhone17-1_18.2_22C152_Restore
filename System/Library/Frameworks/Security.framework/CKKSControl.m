@interface CKKSControl
+ (id)CKKSControlObject:(BOOL)a3 error:(id *)a4;
+ (id)controlObject:(id *)a3;
- (BOOL)synchronous;
- (CKKSControl)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (id)objectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)deleteSEView:(id)a3 reply:(id)a4;
- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5;
- (void)fetchSEViewKeyHierarchy:(id)a3 reply:(id)a4;
- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6;
- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4;
- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5;
- (void)rpcFastStatus:(id)a3 reply:(id)a4;
- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6;
- (void)rpcFetchAndProcessChanges:(id)a3 reply:(id)a4;
- (void)rpcFetchAndProcessChangesIfNoRecentFetch:(id)a3 reply:(id)a4;
- (void)rpcFetchAndProcessClassAChanges:(id)a3 reply:(id)a4;
- (void)rpcGetCKDeviceIDWithReply:(id)a3;
- (void)rpcKnownBadState:(id)a3 reply:(id)a4;
- (void)rpcPerformanceCounters:(id)a3;
- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4;
- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5;
- (void)rpcResetLocal:(id)a3 reply:(id)a4;
- (void)rpcResync:(id)a3 reply:(id)a4;
- (void)rpcResyncLocal:(id)a3 reply:(id)a4;
- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6;
- (void)rpcStatus:(id)a3 reply:(id)a4;
- (void)rpcTLKMissing:(id)a3 reply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)toggleHavoc:(id)a3;
@end

@implementation CKKSControl

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  v9 = [(CKKSControl *)self objectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke_2;
  v11[3] = &unk_1E54774D8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 pcsMirrorKeysForServices:v8 reply:v11];
}

uint64_t __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)toggleHavoc:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__CKKSControl_toggleHavoc___block_invoke;
  v10[3] = &unk_1E547F618;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(CKKSControl *)self objectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27__CKKSControl_toggleHavoc___block_invoke_2;
  v8[3] = &unk_1E5475A00;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 toggleHavoc:v8];
}

uint64_t __27__CKKSControl_toggleHavoc___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __27__CKKSControl_toggleHavoc___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteSEView:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__CKKSControl_deleteSEView_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(CKKSControl *)self objectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__CKKSControl_deleteSEView_reply___block_invoke_2;
  v11[3] = &unk_1E5475960;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 deleteSEView:v8 reply:v11];
}

uint64_t __34__CKKSControl_deleteSEView_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __34__CKKSControl_deleteSEView_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6
{
  id v10 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke;
  v19[3] = &unk_1E547F618;
  id v11 = v10;
  id v20 = v11;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(CKKSControl *)self objectProxyWithErrorHandler:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke_2;
  v17[3] = &unk_1E5475960;
  v17[4] = self;
  id v18 = v11;
  id v16 = v11;
  [v15 modifyTLKSharesForSEView:v14 adding:v13 deleting:v12 reply:v17];
}

uint64_t __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke;
  v15[3] = &unk_1E547F618;
  id v9 = v8;
  id v16 = v9;
  id v10 = a3;
  id v11 = [(CKKSControl *)self objectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke_2;
  v13[3] = &unk_1E54759D8;
  void v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [v11 fetchSEViewKeyHierarchy:v10 forceFetch:v5 reply:v13];
}

uint64_t __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSEViewKeyHierarchy:(id)a3 reply:(id)a4
{
}

- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke;
  v22[3] = &unk_1E547F618;
  id v13 = v12;
  id v23 = v13;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(CKKSControl *)self objectProxyWithErrorHandler:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke_2;
  v20[3] = &unk_1E5475960;
  v20[4] = self;
  id v21 = v13;
  id v19 = v13;
  [v18 proposeTLKForSEView:v17 proposedTLK:v16 wrappedOldTLK:v15 tlkShares:v14 reply:v20];
}

uint64_t __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)rpcKnownBadState:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CKKSControl_rpcKnownBadState_reply___block_invoke;
  v8[3] = &unk_1E547E908;
  id v9 = v6;
  id v7 = v6;
  [(CKKSControl *)self rpcFastStatus:a3 reply:v8];
}

void __38__CKKSControl_rpcKnownBadState_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v16 = a1;
    char v5 = 0;
    int v18 = 0;
    uint64_t v6 = *(void *)v20;
    id v7 = @"view";
    id v8 = @"keystate";
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "objectForKeyedSubscript:", v7, v16);
        id v12 = [v10 objectForKeyedSubscript:v8];
        if (([v11 isEqualToString:@"global"] & 1) == 0)
        {
          id v13 = v8;
          id v14 = v7;
          if (([v12 isEqualToString:@"waitfortlk"] & 1) == 0) {
            [v12 isEqualToString:@"error"];
          }
          char v15 = [v12 isEqualToString:@"waitforunlock"];
          if (([v12 isEqualToString:@"waitfortlkcreation"] & 1) == 0
            && ([v12 isEqualToString:@"waitfortlkupload"] & 1) == 0)
          {
            [v12 isEqualToString:@"waitfortrust"];
          }
          v5 |= v15;
          v18 |= [v12 isEqualToString:@"loggedout"];
          id v7 = v14;
          id v8 = v13;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
    a1 = v16;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rpcTLKMissing:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__CKKSControl_rpcTLKMissing_reply___block_invoke;
  v8[3] = &unk_1E547E908;
  id v9 = v6;
  id v7 = v6;
  [(CKKSControl *)self rpcFastStatus:a3 reply:v8];
}

void __35__CKKSControl_rpcTLKMissing_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = [v7 objectForKeyedSubscript:@"view"];
        id v9 = [v7 objectForKeyedSubscript:@"keystate"];
        if (([v8 isEqualToString:@"global"] & 1) == 0
          && ([v9 isEqualToString:@"waitfortlk"] & 1) == 0)
        {
          [v9 isEqualToString:@"error"];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rpcGetCKDeviceIDWithReply:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(CKKSControl *)self objectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke_2;
  v8[3] = &unk_1E54759B0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 rpcGetCKDeviceIDWithReply:v8];
}

uint64_t __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)rpcPerformanceCounters:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__CKKSControl_rpcPerformanceCounters___block_invoke;
  v10[3] = &unk_1E547F618;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(CKKSControl *)self objectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CKKSControl_rpcPerformanceCounters___block_invoke_2;
  v8[3] = &unk_1E5475988;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performanceCounters:v8];
}

uint64_t __38__CKKSControl_rpcPerformanceCounters___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __38__CKKSControl_rpcPerformanceCounters___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke;
  v16[3] = &unk_1E547F618;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  long long v12 = [(CKKSControl *)self objectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke_2;
  v14[3] = &unk_1E5475960;
  v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [v12 rpcCKMetric:v11 attributes:v10 reply:v14];
}

uint64_t __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = secLogObjForScope("ckkscontrol");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a push for view %@", buf, 0xCu);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke;
  v14[3] = &unk_1E547F618;
  id v9 = v7;
  id v15 = v9;
  id v10 = [(CKKSControl *)self objectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke_2;
  v12[3] = &unk_1E5475960;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 rpcPushOutgoingChanges:v6 reply:v12];
}

uint64_t __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("ckkscontrol");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      id v6 = "Push finished with error: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "Push finished successfully";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)rpcFetchAndProcessClassAChanges:(id)a3 reply:(id)a4
{
}

- (void)rpcFetchAndProcessChangesIfNoRecentFetch:(id)a3 reply:(id)a4
{
}

- (void)rpcFetchAndProcessChanges:(id)a3 reply:(id)a4
{
}

- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  long long v12 = secLogObjForScope("ckkscontrol");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v10;
    _os_log_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEFAULT, "Requesting a fetch for view %@", buf, 0xCu);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke;
  v18[3] = &unk_1E547F618;
  id v13 = v11;
  id v19 = v13;
  long long v14 = [(CKKSControl *)self objectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke_2;
  v16[3] = &unk_1E5475960;
  void v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 rpcFetchAndProcessChanges:v10 classA:v8 onlyIfNoRecentFetch:v7 reply:v16];
}

uint64_t __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("ckkscontrol");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      id v6 = "Fetch finished with error: %@";
      BOOL v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "Fetch finished successfully";
    BOOL v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)rpcResync:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint32_t v8 = secLogObjForScope("ckkscontrol");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a resync for view %@", buf, 0xCu);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __31__CKKSControl_rpcResync_reply___block_invoke;
  v14[3] = &unk_1E547F618;
  id v9 = v7;
  id v15 = v9;
  id v10 = [(CKKSControl *)self objectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__CKKSControl_rpcResync_reply___block_invoke_2;
  v12[3] = &unk_1E5475960;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 rpcResync:v6 reply:v12];
}

uint64_t __31__CKKSControl_rpcResync_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __31__CKKSControl_rpcResync_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("ckkscontrol");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      id v6 = "Resync finished with error: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "Resync finished successfully";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)rpcResyncLocal:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint32_t v8 = secLogObjForScope("ckkscontrol");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a local resync for view %@", buf, 0xCu);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__CKKSControl_rpcResyncLocal_reply___block_invoke;
  v14[3] = &unk_1E547F618;
  id v9 = v7;
  id v15 = v9;
  id v10 = [(CKKSControl *)self objectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__CKKSControl_rpcResyncLocal_reply___block_invoke_2;
  v12[3] = &unk_1E5475960;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 rpcResyncLocal:v6 reply:v12];
}

uint64_t __36__CKKSControl_rpcResyncLocal_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __36__CKKSControl_rpcResyncLocal_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("ckkscontrol");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      id v6 = "Local resync finished with error: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "Local resync finished successfully";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = secLogObjForScope("ckkscontrol");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "Requesting a CloudKit reset for view %@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke;
  v17[3] = &unk_1E547F618;
  id v12 = v9;
  id v18 = v12;
  id v13 = [(CKKSControl *)self objectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke_2;
  v15[3] = &unk_1E5475960;
  void v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 rpcResetCloudKit:v8 reason:v10 reply:v15];
}

uint64_t __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("ckkscontrol");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      id v6 = "CloudKit reset finished with error: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "CloudKit reset finished successfully";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)rpcResetLocal:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint32_t v8 = secLogObjForScope("ckkscontrol");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a local reset for view %@", buf, 0xCu);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __35__CKKSControl_rpcResetLocal_reply___block_invoke;
  v14[3] = &unk_1E547F618;
  id v9 = v7;
  id v15 = v9;
  id v10 = [(CKKSControl *)self objectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__CKKSControl_rpcResetLocal_reply___block_invoke_2;
  v12[3] = &unk_1E5475960;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 rpcResetLocal:v6 reply:v12];
}

uint64_t __35__CKKSControl_rpcResetLocal_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __35__CKKSControl_rpcResetLocal_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = secLogObjForScope("ckkscontrol");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      id v6 = "Local reset finished with error: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "Local reset finished successfully";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke;
  v17[3] = &unk_1E547F618;
  id v11 = v10;
  id v18 = v11;
  id v12 = a3;
  id v13 = [(CKKSControl *)self objectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke_2;
  v15[3] = &unk_1E5475938;
  void v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  [v13 rpcStatus:v12 fast:v7 waitForNonTransientState:a5 reply:v15];
}

uint64_t __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)rpcFastStatus:(id)a3 reply:(id)a4
{
}

- (void)rpcStatus:(id)a3 reply:(id)a4
{
}

- (id)objectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKKSControl *)self synchronous];
  id v6 = [(CKKSControl *)self connection];
  BOOL v7 = v6;
  if (v5) {
    [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else {
  uint32_t v8 = [v6 remoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

- (void)dealloc
{
  id v3 = [(CKKSControl *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CKKSControl;
  [(CKKSControl *)&v4 dealloc];
}

- (CKKSControl)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSControl;
  id v6 = [(CKKSControl *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

+ (id)CKKSControlObject:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.securityd.ckks" options:0];
  if (v6)
  {
    BOOL v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED87A510];
    CKKSSetupControlProtocol(v7);
    objc_claimAutoreleasedReturnValue();

    [v6 setRemoteObjectInterface:v7];
    [v6 resume];
    a4 = [[CKKSControl alloc] initWithConnection:v6];
    [a4 setSynchronous:v5];
  }
  else if (a4)
  {
    uint32_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Couldn't create connection (no reason given)";
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    *a4 = [v8 errorWithDomain:@"securityd" code:-1 userInfo:v9];

    a4 = 0;
  }

  return a4;
}

+ (id)controlObject:(id *)a3
{
  return +[CKKSControl CKKSControlObject:0 error:a3];
}

@end