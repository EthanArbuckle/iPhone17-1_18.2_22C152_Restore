@interface SWBackgroundSendUtility
- (OS_dispatch_queue)queue;
- (SFCollaborationCompositionDictionaryProvider)compositionDictionaryProvider;
- (SLDServiceProxy)serviceProxy;
- (SWBackgroundSendUtility)initWithItemProvider:(id)a3 faceTimeConversation:(id)a4 queue:(id)a5 completion:(id)a6;
- (TUConversation)faceTimeConversation;
- (id)completion;
- (id)pendingCollaborationRequest;
- (id)remoteService;
- (void)_addCollaborationRequest:(id)a3;
- (void)_processPendingCollaborationRequest;
- (void)dictionaryDidBecomeAvailable:(id)a3 forProvider:(id)a4;
- (void)sendCollaboration:(id)a3 faceTimeConversationUUID:(id)a4 completionHandler:(id)a5;
- (void)serviceProxyDidConnect:(id)a3;
- (void)serviceProxyDidDisconnect:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCompositionDictionaryProvider:(id)a3;
- (void)setFaceTimeConversation:(id)a3;
- (void)setPendingCollaborationRequest:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceProxy:(id)a3;
@end

@implementation SWBackgroundSendUtility

- (SWBackgroundSendUtility)initWithItemProvider:(id)a3 faceTimeConversation:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SWBackgroundSendUtility;
  v14 = [(SWBackgroundSendUtility *)&v22 init];
  if (v14)
  {
    v15 = (objc_class *)CUTWeakLinkClass();
    if (v15)
    {
      v16 = v15;
      if ([(objc_class *)v15 instancesRespondToSelector:sel_initWithItemProvider_delegate_])
      {
        uint64_t v17 = [[v16 alloc] initWithItemProvider:v10 delegate:v14];
        compositionDictionaryProvider = v14->_compositionDictionaryProvider;
        v14->_compositionDictionaryProvider = (SFCollaborationCompositionDictionaryProvider *)v17;
      }
    }
    objc_storeStrong((id *)&v14->_queue, a5);
    objc_storeStrong((id *)&v14->_faceTimeConversation, a4);
    v19 = _Block_copy(v13);
    id completion = v14->_completion;
    v14->_id completion = v19;
  }
  return v14;
}

- (void)dictionaryDidBecomeAvailable:(id)a3 forProvider:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v14 = 0;
    v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v14];
    v7 = v14;
    v8 = SWFrameworkLogHandle();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "Asking to initiate collaboration for dictionary %@", buf, 0xCu);
      }

      id v10 = SWFrameworkLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(SWBackgroundSendUtility *)self faceTimeConversation];
        *(_DWORD *)buf = 138412290;
        id v16 = v11;
        _os_log_impl(&dword_18FB18000, v10, OS_LOG_TYPE_DEFAULT, "Asking to initiate collaboration for tuconversation: %@", buf, 0xCu);
      }
      v8 = [(SWBackgroundSendUtility *)self faceTimeConversation];
      id v12 = [v8 UUID];
      id v13 = [(SWBackgroundSendUtility *)self completion];
      [(SWBackgroundSendUtility *)self sendCollaboration:v6 faceTimeConversationUUID:v12 completionHandler:v13];
    }
    else if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "Info dictionary could not be archived, so not sending collaboration", buf, 2u);
    }
  }
  else
  {
    v7 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEFAULT, "Received a nil collaboration composition dictionary so cannot send collaboration", buf, 2u);
    }
  }
}

- (void)_addCollaborationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SWBackgroundSendUtility *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SWBackgroundSendUtility__addCollaborationRequest___block_invoke;
  v7[3] = &unk_1E5665840;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__SWBackgroundSendUtility__addCollaborationRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) serviceProxy];
  int v3 = [v2 connectionActive];

  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    id v5 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "Not currently connected to shareable content service. We'll wait for the connection before servicing this request.", v7, 2u);
    }

    [*(id *)(a1 + 32) setPendingCollaborationRequest:*(void *)(a1 + 40)];
    id v6 = [*(id *)(a1 + 32) serviceProxy];
    [v6 connect];
  }
}

- (void)_processPendingCollaborationRequest
{
  int v3 = [(SWBackgroundSendUtility *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SWBackgroundSendUtility__processPendingCollaborationRequest__block_invoke;
  block[3] = &unk_1E5665868;
  block[4] = self;
  dispatch_async(v3, block);
}

void __62__SWBackgroundSendUtility__processPendingCollaborationRequest__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingCollaborationRequest];

  if (v2)
  {
    int v3 = [*(id *)(a1 + 32) pendingCollaborationRequest];
    v3[2]();

    id v4 = *(void **)(a1 + 32);
    [v4 setPendingCollaborationRequest:0];
  }
}

- (void)sendCollaboration:(id)a3 faceTimeConversationUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __88__SWBackgroundSendUtility_sendCollaboration_faceTimeConversationUUID_completionHandler___block_invoke;
  v18 = &unk_1E5665890;
  v19 = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = _Block_copy(&v15);
  -[SWBackgroundSendUtility _addCollaborationRequest:](self, "_addCollaborationRequest:", v14, v15, v16, v17, v18, v19);
}

void __88__SWBackgroundSendUtility_sendCollaboration_faceTimeConversationUUID_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteService];
  [v2 shareCollaborationData:*(void *)(a1 + 40) faceTimeConversationUUID:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (SLDServiceProxy)serviceProxy
{
  serviceProxy = self->_serviceProxy;
  if (!serviceProxy)
  {
    id v4 = (void *)MEMORY[0x1E4FA5640];
    uint64_t v5 = objc_opt_class();
    id v6 = [(SWBackgroundSendUtility *)self queue];
    v7 = [v4 proxyForServiceClass:v5 targetSerialQueue:v6 delegate:self];
    id v8 = self->_serviceProxy;
    self->_serviceProxy = v7;

    serviceProxy = self->_serviceProxy;
  }

  return serviceProxy;
}

- (id)remoteService
{
  id v2 = [(SWBackgroundSendUtility *)self serviceProxy];
  int v3 = [v2 remoteService];

  return v3;
}

- (void)serviceProxyDidConnect:(id)a3
{
  id v4 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_INFO, "Service proxy connected background send utility", v5, 2u);
  }

  [(SWBackgroundSendUtility *)self _processPendingCollaborationRequest];
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = SWFrameworkLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_INFO, "Service proxy disconnected for background send utility: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)setServiceProxy:(id)a3
{
}

- (SFCollaborationCompositionDictionaryProvider)compositionDictionaryProvider
{
  return self->_compositionDictionaryProvider;
}

- (void)setCompositionDictionaryProvider:(id)a3
{
}

- (TUConversation)faceTimeConversation
{
  return self->_faceTimeConversation;
}

- (void)setFaceTimeConversation:(id)a3
{
}

- (id)pendingCollaborationRequest
{
  return self->_pendingCollaborationRequest;
}

- (void)setPendingCollaborationRequest:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_pendingCollaborationRequest, 0);
  objc_storeStrong((id *)&self->_faceTimeConversation, 0);
  objc_storeStrong((id *)&self->_compositionDictionaryProvider, 0);

  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end