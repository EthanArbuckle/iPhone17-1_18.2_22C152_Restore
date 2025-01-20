@interface ANTonePlayerServiceListener
- (ANTonePlayer)player;
- (ANTonePlayerServiceListener)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (id)_fileURLForTone:(unint64_t)a3;
- (void)cleanForExit;
- (void)playTone:(unint64_t)a3 audioSessionID:(unsigned int)a4 endpointUUID:(id)a5 completionHandler:(id)a6;
- (void)setPlayer:(id)a3;
@end

@implementation ANTonePlayerServiceListener

- (ANTonePlayerServiceListener)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)ANTonePlayerServiceListener;
  v2 = [(ANTonePlayerServiceListener *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x1E4F4A7A0]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v6 = ANLogHandleTonePlayerServiceListener();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "%@Tone Player Service Listener Up!", buf, 0xCu);
    }
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = ANLogHandleTonePlayerServiceListener();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    v10 = [v7 serviceName];
    *(_DWORD *)buf = 138412802;
    v23 = &stru_1F34A0E10;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@New Connection Request From (PID = %@) For Service: (%@)", buf, 0x20u);
  }
  if (([MEMORY[0x1E4F4A898] isAnnounceEnabled] & 1) == 0)
  {
    v14 = ANLogHandleTonePlayerServiceListener();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_ERROR, "%@Rejecting connection. Announce not enabled.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (([v7 hasAnnounceEntitlement] & 1) == 0)
  {
    v14 = ANLogHandleTonePlayerServiceListener();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)*MEMORY[0x1E4F4A968];
      *(_DWORD *)buf = 138412546;
      v23 = &stru_1F34A0E10;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_ERROR, "%@Missing Announce Entitlement: %@", buf, 0x16u);
    }
LABEL_13:

    BOOL v13 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29280], "an_tonePlayerServiceInterface");
  [v7 setExportedInterface:v11];

  [v7 setExportedObject:self];
  objc_initWeak(&location, v7);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__ANTonePlayerServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  v19[3] = &unk_1E6BCDE80;
  objc_copyWeak(&v20, &location);
  [v7 setInterruptionHandler:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__ANTonePlayerServiceListener_listener_shouldAcceptNewConnection___block_invoke_5;
  v17[3] = &unk_1E6BCDE80;
  objc_copyWeak(&v18, &location);
  [v7 setInvalidationHandler:v17];
  [v7 resume];
  v12 = ANLogHandleTonePlayerServiceListener();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = &stru_1F34A0E10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_DEFAULT, "%@Connection Accepted: (%@)", buf, 0x16u);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  BOOL v13 = 1;
LABEL_14:

  return v13;
}

void __66__ANTonePlayerServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleTonePlayerServiceListener();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412546;
    v5 = &stru_1F34A0E10;
    __int16 v6 = 2112;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Interrupted: (%@)", (uint8_t *)&v4, 0x16u);
  }
}

void __66__ANTonePlayerServiceListener_listener_shouldAcceptNewConnection___block_invoke_5(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleTonePlayerServiceListener();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412546;
    v5 = &stru_1F34A0E10;
    __int16 v6 = 2112;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Invalidated: (%@)", (uint8_t *)&v4, 0x16u);
  }
}

- (void)cleanForExit
{
  id v2 = [(ANTonePlayerServiceListener *)self listener];
  [v2 invalidate];
}

- (void)playTone:(unint64_t)a3 audioSessionID:(unsigned int)a4 endpointUUID:(id)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void *))a6;
  v12 = [(ANTonePlayerServiceListener *)self player];
  [v12 stop];

  BOOL v13 = ANLogHandleTonePlayerServiceListener();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    v19 = &stru_1F34A0E10;
    __int16 v20 = 2112;
    unint64_t v21 = (unint64_t)v10;
    _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@Received Request to play tone. Endpoint ID = %@", (uint8_t *)&v18, 0x16u);
  }

  v14 = [(ANTonePlayerServiceListener *)self _fileURLForTone:a3];
  if (v14)
  {
    v15 = [[ANTonePlayer alloc] initWithAudioSessionID:v7 endpointUUID:v10];
    [(ANTonePlayerServiceListener *)self setPlayer:v15];

    v16 = [(ANTonePlayerServiceListener *)self player];
    [v16 playFileURL:v14 completionHandler:v11];
  }
  else
  {
    v17 = ANLogHandleTonePlayerServiceListener();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412546;
      v19 = &stru_1F34A0E10;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_ERROR, "%@Failed to find URL for tone: %lu", (uint8_t *)&v18, 0x16u);
    }

    v16 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1052, *MEMORY[0x1E4F4A740]);
    v11[2](v11, v16);
  }
}

- (id)_fileURLForTone:(unint64_t)a3
{
  if (a3)
  {
    id v3 = 0;
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F1CB10];
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    __int16 v6 = [v5 pathForResource:@"AnnounceSent" ofType:@"wav"];
    id v3 = [v4 fileURLWithPath:v6];
  }
  return v3;
}

- (ANTonePlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end