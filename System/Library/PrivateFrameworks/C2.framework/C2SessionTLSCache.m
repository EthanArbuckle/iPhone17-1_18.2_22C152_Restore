@interface C2SessionTLSCache
- (C2Session)pinnedSession;
- (C2Session)unpinnedSession;
- (C2SessionTLSCache)init;
- (id)_createSessionWithTLSPinning:(BOOL)a3;
- (id)sessionForOptions:(id)a3;
- (id)underlyingDelegateQueue;
- (void)C2Session:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)C2Session:(id)a3 originalHost:(id)a4 updatedRoute:(id)a5;
- (void)setPinnedSession:(id)a3;
- (void)setUnpinnedSession:(id)a3;
@end

@implementation C2SessionTLSCache

- (id)sessionForOptions:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ([v4 tlsPinning])
  {
    p_pinnedSession = (void **)&v5->_pinnedSession;
    pinnedSession = v5->_pinnedSession;
    if (pinnedSession) {
      goto LABEL_7;
    }
    uint64_t v8 = [(C2SessionTLSCache *)v5 _createSessionWithTLSPinning:1];
  }
  else
  {
    p_pinnedSession = (void **)&v5->_unpinnedSession;
    pinnedSession = v5->_unpinnedSession;
    if (pinnedSession) {
      goto LABEL_7;
    }
    uint64_t v8 = [(C2SessionTLSCache *)v5 _createSessionWithTLSPinning:0];
  }
  v9 = *p_pinnedSession;
  *p_pinnedSession = (void *)v8;

  pinnedSession = *p_pinnedSession;
LABEL_7:
  id v10 = pinnedSession;
  objc_sync_exit(v5);

  v11 = [v10 session];

  return v11;
}

- (C2SessionTLSCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)C2SessionTLSCache;
  v2 = [(C2SessionTLSCache *)&v7 init];
  v3 = v2;
  if (v2)
  {
    pinnedSession = v2->_pinnedSession;
    v2->_pinnedSession = 0;

    unpinnedSession = v3->_unpinnedSession;
    v3->_unpinnedSession = 0;
  }
  return v3;
}

- (id)_createSessionWithTLSPinning:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(C2RequestOptions);
  [(C2RequestOptions *)v5 setTlsPinning:v3];
  v6 = [C2Session alloc];
  objc_super v7 = [(C2RequestOptions *)v5 sessionConfigurationNameWithRouteHost:@"Unknown"];
  uint64_t v8 = [(C2Session *)v6 initWithSessionConfigurationName:v7 routeHost:@"Unknown" options:v5 sessionDelegate:self];

  return v8;
}

- (id)underlyingDelegateQueue
{
  return 0;
}

- (void)C2Session:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (C2_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_1, &__block_literal_global_6);
  }
  v9 = C2_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_1DD523000, v9, OS_LOG_TYPE_ERROR, "Expected NSURLSession for TLS Cache to never become invalid but did with error %@", (uint8_t *)&v11, 0xCu);
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"C2SessionTLSCache.m" lineNumber:57 description:@"Expected NSURLSession for TLS Cache to never become invalid"];
}

uint64_t __57__C2SessionTLSCache_C2Session_didBecomeInvalidWithError___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)C2Session:(id)a3 originalHost:(id)a4 updatedRoute:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2 object:self file:@"C2SessionTLSCache.m" lineNumber:61 description:@"Unexpected callback for task-less NSURLSession"];
}

- (C2Session)pinnedSession
{
  return self->_pinnedSession;
}

- (void)setPinnedSession:(id)a3
{
}

- (C2Session)unpinnedSession
{
  return self->_unpinnedSession;
}

- (void)setUnpinnedSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpinnedSession, 0);
  objc_storeStrong((id *)&self->_pinnedSession, 0);
}

@end