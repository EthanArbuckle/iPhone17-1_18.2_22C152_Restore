@interface IPProgressServerDefaultBehavior
- (BOOL)transport:(id)a3 shouldAcceptConnection:(id)a4;
- (IPProgressServerBehaviorDelegate)delegate;
- (IPProgressServerDefaultBehavior)initWithTransport:(id)a3 stateUpdateSink:(id)a4;
- (OS_dispatch_queue)queue;
- (id)activeInstallationsForClient:(id)a3;
- (id)allInstallableStatesForClient:(id)a3;
- (id)progressForIdentity:(id)a3 forClient:(id)a4 error:(id *)a5;
- (void)identityWasUninstalled:(id)a3;
- (void)progressForIdentity:(id)a3 changed:(id)a4;
- (void)progressForIdentity:(id)a3 finishedWithState:(unint64_t)a4;
- (void)progressForIdentityInitiated:(id)a3;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)transport:(id)a3 acceptedClient:(id)a4;
@end

@implementation IPProgressServerDefaultBehavior

- (IPProgressServerDefaultBehavior)initWithTransport:(id)a3 stateUpdateSink:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IPProgressServerDefaultBehavior;
  v9 = [(IPProgressServerDefaultBehavior *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transport, a3);
    [(IPServerXPCTransport *)v10->_transport setDelegate:v10];
    objc_storeStrong((id *)&v10->_stateSink, a4);
  }

  return v10;
}

- (void)resume
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    transport = self->_transport;
    int v5 = 138412290;
    v6 = transport;
    _os_log_impl(&dword_252AA9000, v3, OS_LOG_TYPE_DEFAULT, "resuming transport %@", (uint8_t *)&v5, 0xCu);
  }

  [(IPServerXPCTransport *)self->_transport resume];
  [(IPStateUpdateStreamSink *)self->_stateSink resume];
}

- (OS_dispatch_queue)queue
{
  return [(IPServerXPCTransport *)self->_transport serviceQueue];
}

- (void)progressForIdentity:(id)a3 changed:(id)a4
{
}

- (void)progressForIdentity:(id)a3 finishedWithState:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = 3;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
      v9 = _IPServerLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v22 = 138412546;
        *(void *)&v22[4] = v7;
        __int16 v23 = 2048;
        unint64_t v24 = a4;
        _os_log_impl(&dword_252AA9000, v9, OS_LOG_TYPE_DEFAULT, "Progress for %@ finished with strange install state %llu", v22, 0x16u);
      }

      goto LABEL_5;
    case 3uLL:
      uint64_t v8 = 2;
      goto LABEL_7;
    case 4uLL:
LABEL_7:
      id v10 = v6;
      *(void *)v22 = 0;
      v11 = [v10 findApplicationRecordWithError:v22];
      id v12 = *(id *)v22;
      v13 = v12;
      if (!v11)
      {
        v16 = [v12 domain];
        if ([v16 isEqual:*MEMORY[0x263F08410]])
        {
          uint64_t v17 = [v13 code];

          if (v17 == -10814)
          {
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {
        }
        v18 = _IPDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[IPProgressServerDefaultBehavior progressForIdentity:finishedWithState:]((uint64_t)v10, (uint64_t)v13, v18);
        }

        goto LABEL_18;
      }
      v14 = [v11 identities];
      char v15 = [v14 containsObject:v10];

      if (v15) {
        goto LABEL_22;
      }
LABEL_19:
      v19 = _IPServerLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v22 = 138412546;
        *(void *)&v22[4] = v10;
        __int16 v23 = 1024;
        LODWORD(v24) = v8;
        _os_log_impl(&dword_252AA9000, v19, OS_LOG_TYPE_DEFAULT, "Progress ended for identity %@ with reason %u and identity no longer exists; synthesizing identity unavailable event",
          v22,
          0x12u);
      }

      [(IPProgressServerDefaultBehavior *)self identityWasUninstalled:v10];
LABEL_22:
      [(IPServerXPCTransport *)self->_transport disseminateProgressEndForIdenitty:v7 reason:v8];
      stateSink = self->_stateSink;
      v21 = [[IPStateUpdateMessage alloc] initWithType:2 identity:v7];
      [(IPStateUpdateStreamSink *)stateSink sendUpdateMessage:v21];

      return;
    case 5uLL:
      uint64_t v8 = 1;
      goto LABEL_22;
    default:
LABEL_5:
      uint64_t v8 = 0;
      goto LABEL_22;
  }
}

- (void)progressForIdentityInitiated:(id)a3
{
  stateSink = self->_stateSink;
  id v4 = a3;
  int v5 = [[IPStateUpdateMessage alloc] initWithType:1 identity:v4];

  [(IPStateUpdateStreamSink *)stateSink sendUpdateMessage:v5];
}

- (void)identityWasUninstalled:(id)a3
{
  stateSink = self->_stateSink;
  id v4 = a3;
  int v5 = [[IPStateUpdateMessage alloc] initWithType:4 identity:v4];

  [(IPStateUpdateStreamSink *)stateSink sendUpdateMessage:v5];
}

- (id)activeInstallationsForClient:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v5 = [WeakRetained activeInstallationsForBehavior:self];
  id v6 = v5;
  if (!v5) {
    int v5 = (void *)MEMORY[0x263EFFA68];
  }
  id v7 = v5;

  return v7;
}

- (id)progressForIdentity:(id)a3 forClient:(id)a4 error:(id *)a5
{
  p_delegate = &self->_delegate;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v10 = [WeakRetained serverBehavior:self progressForIdentity:v8 error:a5];

  return v10;
}

- (id)allInstallableStatesForClient:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained activeInstallationsForBehavior:self];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 identity];
        [v4 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v13 = [MEMORY[0x263F018A0] sharedDatabaseContext];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__IPProgressServerDefaultBehavior_allInstallableStatesForClient___block_invoke;
  v17[3] = &unk_26538FBC8;
  id v18 = v4;
  id v14 = v4;
  [v13 accessUsingBlock:v17];

  char v15 = [v14 allValues];

  return v15;
}

void __65__IPProgressServerDefaultBehavior_allInstallableStatesForClient___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = [MEMORY[0x263F01860] enumeratorWithOptions:0];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v18 = v5;
      uint64_t v9 = *(void *)v21;
      while (1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v12 = [*(id *)(a1 + 32) objectForKey:v11];

          if (!v12)
          {
            id v19 = 0;
            v13 = [v11 findApplicationRecordWithError:&v19];
            id v14 = v19;
            if (v13)
            {
              id v15 = v13;
              if ([v15 isDeletable])
              {

                goto LABEL_14;
              }
              int v17 = [v15 isDeletableSystemApplication];

              if (v17)
              {
LABEL_14:
                v16 = [[IPInstallableStateData alloc] initWithIdentity:v11 isInstalling:0];
                [*(id *)(a1 + 32) setObject:v16 forKey:v11];
                goto LABEL_15;
              }
            }
            else
            {
              _IPDefaultLog();
              v16 = (IPInstallableStateData *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v25 = v11;
                __int16 v26 = 2112;
                id v27 = v14;
                _os_log_error_impl(&dword_252AA9000, &v16->super, OS_LOG_TYPE_ERROR, "could not load record for identity %@: %@", buf, 0x16u);
              }
LABEL_15:
            }
            continue;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (!v8)
        {
          id v5 = v18;
          break;
        }
      }
    }
  }
  else
  {
    id v6 = _IPDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v5;
      _os_log_impl(&dword_252AA9000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't access database: %@", buf, 0xCu);
    }
  }
}

- (BOOL)transport:(id)a3 shouldAcceptConnection:(id)a4
{
  id v4 = self;
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v4) = [WeakRetained serverBehavior:v4 shouldAcceptConnection:v6];

  return (char)v4;
}

- (void)transport:(id)a3 acceptedClient:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained serverBehavior:self acceptedClient:v6];
}

- (IPProgressServerBehaviorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IPProgressServerBehaviorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateSink, 0);

  objc_storeStrong((id *)&self->_transport, 0);
}

- (void)progressForIdentity:(os_log_t)log finishedWithState:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_252AA9000, log, OS_LOG_TYPE_ERROR, "unexpected error loading record for %@: %@", (uint8_t *)&v3, 0x16u);
}

@end