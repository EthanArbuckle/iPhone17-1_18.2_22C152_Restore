@interface LSInstallProgressObserver
- (LSInstallProgressObserver)initWithConnection:(id)a3;
- (NSString)description;
- (NSXPCConnection)connection;
- (int)pid;
- (unint64_t)hash;
- (void)_lsPing:(id)a3 reply:(id)a4;
- (void)addObserver;
- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6;
- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4;
- (void)installationFailedForApplication:(id)a3 reply:(id)a4;
- (void)removeObserver;
- (void)sendNotification:(int)a3 forApplicationWithBundleIdentifier:(id)a4 completion:(id)a5;
- (void)sendNotification:(int)a3 forApplications:(id)a4 withPlugins:(BOOL)a5;
- (void)setConnection:(id)a3;
- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5;
@end

@implementation LSInstallProgressObserver

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)LSInstallProgressObserver;
  v4 = [(LSInstallProgressObserver *)&v8 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6 = [v3 stringWithFormat:@"%@ for pid: %d", v4, objc_msgSend(WeakRetained, "processIdentifier")];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v2 = [(LSInstallProgressObserver *)self connection];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (LSInstallProgressObserver)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LSInstallProgressObserver;
  v5 = [(LSInstallProgressObserver *)&v8 init];
  v6 = v5;
  if (v5) {
    [(LSInstallProgressObserver *)v5 setConnection:v4];
  }

  return v6;
}

- (void)setConnection:(id)a3
{
}

- (void)_lsPing:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id))a4;
  id v7 = a3;
  objc_super v8 = _LSProgressLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LSInstallProgressObserver _lsPing:reply:](self, v8);
  }

  v6[2](v6, v7);
}

- (void)addObserver
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = _LSProgressLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "LSInstallProgress: adding observer %{public}@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[_LSInstallProgressService sharedInstance];
  [v4 addObserver:self];
}

- (void)removeObserver
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = _LSProgressLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "LSInstallProgress: Removing observer %{public}@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[_LSInstallProgressService sharedInstance];
  [v4 removeObserver:self];
}

- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = +[_LSInstallProgressService sharedInstance];
  [v12 createInstallProgressForApplication:v11 withPhase:a4 andPublishingString:v10 reply:v9];
}

- (void)sendNotification:(int)a3 forApplications:(id)a4 withPlugins:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = _LSProgressLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(LSInstallProgressObserver *)self connection];
    v12[0] = 67109890;
    v12[1] = [v10 processIdentifier];
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v5;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEFAULT, "connection from %d sending notification %d for proxies (plugins %d) %@", (uint8_t *)v12, 0x1Eu);
  }
  id v11 = +[_LSInstallProgressService sharedInstance];
  [v11 sendNotification:v6 forAppProxies:v8 Plugins:v5 completion:0];
}

- (void)sendNotification:(int)a3 forApplicationWithBundleIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(LSInstallProgressObserver *)self connection];
  id v11 = [v10 _xpcConnection];

  if (_LSCheckEntitlementForXPCConnection(v11, @"com.apple.private.coreservices.can-send-install-notifications"))
  {
    id v12 = _LSProgressLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [(LSInstallProgressObserver *)self connection];
      *(_DWORD *)buf = 67109634;
      int v21 = [v13 processIdentifier];
      __int16 v22 = 1024;
      int v23 = v6;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "connection from %d sending notification %d for %@", buf, 0x18u);
    }
    int v14 = +[_LSInstallProgressService sharedInstance];
    id v19 = v8;
    __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __92__LSInstallProgressObserver_sendNotification_forApplicationWithBundleIdentifier_completion___block_invoke;
    v17[3] = &unk_1E522CF20;
    id v18 = v9;
    [v14 sendNotification:v6 forApps:v15 withPlugins:(v6 & 0xFFFFFFFE) == 4 completion:v17];
  }
  else
  {
    BOOL v16 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[LSInstallProgressObserver sendNotification:forApplicationWithBundleIdentifier:completion:]", 338, 0);
    (*((void (**)(id, void *))v9 + 2))(v9, v16);
  }
}

uint64_t __92__LSInstallProgressObserver_sendNotification_forApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = [(LSInstallProgressObserver *)self connection];
  id v12 = [v11 _xpcConnection];
  int v13 = _LSCheckEntitlementForXPCConnection(v12, @"com.apple.private.coreservices.can-send-install-notifications");

  if (!v13)
  {
    __int16 v17 = _LSProgressLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[LSInstallProgressObserver setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:](self, v17);
    }

    id v18 = (void *)*MEMORY[0x1E4F28760];
    uint64_t v19 = -54;
    uint64_t v20 = 353;
    goto LABEL_10;
  }
  int v14 = objc_opt_class();
  __int16 v15 = objc_opt_class();
  if (!_LSIsDictionaryWithKeysAndValuesOfClass(v8, v14, v15))
  {
    int v21 = _LSProgressLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[LSInstallProgressObserver setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:]();
    }

    id v18 = (void *)*MEMORY[0x1E4F28760];
    uint64_t v19 = -50;
    uint64_t v20 = 349;
LABEL_10:
    BOOL v16 = _LSMakeNSErrorImpl(v18, v19, (uint64_t)"-[LSInstallProgressObserver setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:]", v20, 0);
    v10[2](v10, v16);
    goto LABEL_11;
  }
  BOOL v16 = +[_LSInstallProgressService sharedInstance];
  [v16 setProgressProportionsByPhase:v8 forInstallOfApplicationWithIdentifier:v9 completion:v10];
LABEL_11:
}

- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[_LSInstallProgressService sharedInstance];
  [v6 installationEndedForApplication:v5 withState:a4];
}

- (void)installationFailedForApplication:(id)a3 reply:(id)a4
{
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  id v5 = a3;
  id v6 = +[_LSInstallProgressService sharedInstance];
  [v6 installationFailedForApplication:v5];

  v7[2](v7, 1);
}

- (int)pid
{
  v2 = [(LSInstallProgressObserver *)self connection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (void).cxx_destruct
{
}

- (void)_lsPing:(void *)a1 reply:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 connection];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_3(&dword_182959000, a2, v4, "Received connection ping from %@", v5);
}

- (void)setProgressProportionsByPhase:(void *)a1 forInstallOfApplicationWithIdentifier:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 connection];
  v4[0] = 67109120;
  v4[1] = [v3 processIdentifier];
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Refusing to set progress proportions for unentitled client %d", (uint8_t *)v4, 8u);
}

- (void)setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Refusing to set progress proportions: Bad input %@", v2, v3, v4, v5, v6);
}

@end