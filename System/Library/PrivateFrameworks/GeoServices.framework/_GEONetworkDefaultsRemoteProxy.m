@interface _GEONetworkDefaultsRemoteProxy
- (_GEONetworkDefaultsRemoteProxy)init;
- (_GEONetworkDefaultsServerProxyDelegate)delegate;
- (unint64_t)_updateReason;
- (void)_networkDefaultsDidChange;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)updateNetworkDefaults:(id)a3;
- (void)updateNetworkDefaultsWithReason:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation _GEONetworkDefaultsRemoteProxy

- (unint64_t)_updateReason
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = +[GEOFilePaths urlFor:23];
  v4 = [v3 path];
  int v5 = [v2 fileExistsAtPath:v4];

  if (v5) {
    return 0;
  }
  else {
    return 5;
  }
}

- (void)updateNetworkDefaultsWithReason:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = &__block_literal_global_95;
  if (v6) {
    v7 = v6;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v17[5] = MEMORY[0x1E4F143A8];
  v17[6] = 3221225472;
  v17[7] = __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_2;
  v17[8] = &unk_1E53E46C8;
  v19 = &v20;
  v17[9] = self;
  id v8 = v7;
  id v18 = v8;
  geo_isolate_sync_data();
  int v9 = *((unsigned __int8 *)v21 + 24);
  v10 = GEOGetNetworkDefaultsLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Already updating, not sending request.", buf, 2u);
    }
  }
  else
  {
    if (v11)
    {
      if (a3 > 5) {
        v12 = @"<invalid>";
      }
      else {
        v12 = off_1E53E4738[a3];
      }
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Requesting update for reason %@.", buf, 0xCu);
    }

    v10 = +[GEOXPCConnection createServerConnectionFor:2 debugIdentifier:@"NetworkDefaults" eventHandler:0];
    v27[0] = @"defaults.updateNetworkDefaults";
    v26[0] = @"message";
    v26[1] = @"userInfo";
    v24 = @"reason";
    v13 = [NSNumber numberWithUnsignedInteger:a3];
    v25 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v27[1] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

    global_queue = (void *)geo_get_global_queue();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_192;
    v17[3] = &unk_1E53E4718;
    v17[4] = self;
    [v10 sendDictionary:v15 withReply:global_queue handler:v17];
  }
  _Block_object_dispose(&v20, 8);
}

- (void)setDelegate:(id)a3
{
}

- (_GEONetworkDefaultsRemoteProxy)init
{
  v10.receiver = self;
  v10.super_class = (Class)_GEONetworkDefaultsRemoteProxy;
  v2 = [(_GEONetworkDefaultsRemoteProxy *)&v10 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    objc_initWeak(&location, v2);
    global_queue = geo_get_global_queue();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38___GEONetworkDefaultsRemoteProxy_init__block_invoke;
    v7[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("com.apple.GeoServices.internal.networkDefaultsChanged", &v2->_configChangedToken, global_queue, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_networkDefaultsDidChange
{
  uint64_t v3 = GEOGetNetworkDefaultsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Received network defaults change notification. Informing delegate.", buf, 2u);
  }

  uint64_t v6 = 0;
  v4 = readNetworkDefaultsFromFile(&v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serverProxy:self networkDefaultsDidChange:v4];
}

- (void)dealloc
{
  notify_cancel(self->_configChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)_GEONetworkDefaultsRemoteProxy;
  [(_GEONetworkDefaultsRemoteProxy *)&v3 dealloc];
}

- (void)updateNetworkDefaults:(id)a3
{
}

- (_GEONetworkDefaultsServerProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_GEONetworkDefaultsServerProxyDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_isolation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end