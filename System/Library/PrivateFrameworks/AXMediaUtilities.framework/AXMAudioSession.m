@interface AXMAudioSession
- (AVAudioSession)session;
- (AXMAudioSession)init;
- (BOOL)activateSessionWithError:(id *)a3;
- (BOOL)deactivateSessionWithError:(id *)a3;
- (NSMutableArray)notificationObserverTokens;
- (id)_stringForRouteChangeReason:(unint64_t)a3;
- (void)_handleMediaServicesLost;
- (void)_handleMediaServicesReset;
- (void)_handleRouteChanged:(unint64_t)a3 previousRoute:(id)a4;
- (void)_handleSessionInterrupted:(unint64_t)a3 options:(unint64_t)a4;
- (void)_handleSilenceSecondaryAudio:(unint64_t)a3;
- (void)dealloc;
- (void)init;
- (void)setNotificationObserverTokens:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation AXMAudioSession

- (AXMAudioSession)init
{
  v42.receiver = self;
  v42.super_class = (Class)AXMAudioSession;
  v2 = [(AXMAudioSession *)&v42 init];
  if (!v2) {
    goto LABEL_7;
  }
  v3 = [MEMORY[0x1E4F1CA48] array];
  [(AXMAudioSession *)v2 setNotificationObserverTokens:v3];

  v4 = [MEMORY[0x1E4F153E0] auxiliarySession];
  [(AXMAudioSession *)v2 setSession:v4];

  v5 = [(AXMAudioSession *)v2 session];
  uint64_t v6 = *MEMORY[0x1E4F14F98];
  id v41 = 0;
  [v5 setCategory:v6 withOptions:1 error:&v41];
  id v7 = v41;

  if (!v7)
  {
    objc_initWeak(&location, v2);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v11 = [(AXMAudioSession *)v2 notificationObserverTokens];
    uint64_t v12 = *MEMORY[0x1E4F15000];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __23__AXMAudioSession_init__block_invoke;
    v38[3] = &unk_1E6117690;
    objc_copyWeak(&v39, &location);
    v13 = [v10 addObserverForName:v12 object:0 queue:0 usingBlock:v38];
    [v11 addObject:v13];

    v14 = [(AXMAudioSession *)v2 notificationObserverTokens];
    uint64_t v15 = *MEMORY[0x1E4F15168];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __23__AXMAudioSession_init__block_invoke_2;
    v36[3] = &unk_1E6117690;
    objc_copyWeak(&v37, &location);
    v16 = [v10 addObserverForName:v15 object:0 queue:0 usingBlock:v36];
    [v14 addObject:v16];

    v17 = [(AXMAudioSession *)v2 notificationObserverTokens];
    uint64_t v18 = *MEMORY[0x1E4F15030];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __23__AXMAudioSession_init__block_invoke_3;
    v34[3] = &unk_1E6117690;
    objc_copyWeak(&v35, &location);
    v19 = [v10 addObserverForName:v18 object:0 queue:0 usingBlock:v34];
    [v17 addObject:v19];

    v20 = [(AXMAudioSession *)v2 notificationObserverTokens];
    uint64_t v21 = *MEMORY[0x1E4F15048];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __23__AXMAudioSession_init__block_invoke_4;
    v32[3] = &unk_1E6117690;
    objc_copyWeak(&v33, &location);
    v22 = [v10 addObserverForName:v21 object:0 queue:0 usingBlock:v32];
    [v20 addObject:v22];

    v23 = [(AXMAudioSession *)v2 notificationObserverTokens];
    uint64_t v24 = *MEMORY[0x1E4F15188];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __23__AXMAudioSession_init__block_invoke_5;
    v30 = &unk_1E6117690;
    objc_copyWeak(&v31, &location);
    v25 = [v10 addObserverForName:v24 object:0 queue:0 usingBlock:&v27];
    objc_msgSend(v23, "addObject:", v25, v27, v28, v29, v30);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);

    objc_destroyWeak(&location);
LABEL_7:
    v9 = v2;
    goto LABEL_8;
  }
  v8 = AXMediaLogOutput();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(AXMAudioSession *)(uint64_t)v7 init];
  }

  v9 = 0;
LABEL_8:

  return v9;
}

void __23__AXMAudioSession_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F15020]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = [v3 userInfo];

  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F15008]];
  uint64_t v9 = [v8 unsignedIntegerValue];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSessionInterrupted:v6 options:v9];
}

void __23__AXMAudioSession_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F15178]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = [v3 userInfo];

  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F15170]];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRouteChanged:v6 previousRoute:v9];
}

void __23__AXMAudioSession_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMediaServicesLost];
}

void __23__AXMAudioSession_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMediaServicesReset];
}

void __23__AXMAudioSession_init__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F15190]];
  uint64_t v5 = [v4 unsignedIntegerValue];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSilenceSecondaryAudio:v5];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(AXMAudioSession *)self notificationObserverTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)AXMAudioSession;
  [(AXMAudioSession *)&v9 dealloc];
}

- (BOOL)deactivateSessionWithError:(id *)a3
{
  v4 = [(AXMAudioSession *)self session];
  id v7 = 0;
  [v4 setActive:0 error:&v7];
  id v5 = v7;

  if (a3) {
    *a3 = v5;
  }

  return v5 == 0;
}

- (BOOL)activateSessionWithError:(id *)a3
{
  id v5 = [(AXMAudioSession *)self session];
  uint64_t v6 = *MEMORY[0x1E4F14F98];
  id v13 = 0;
  [v5 setCategory:v6 withOptions:1 error:&v13];
  id v7 = v13;

  if (v7
    || ([(AXMAudioSession *)self session],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        id v12 = 0,
        BOOL v9 = 1,
        [v8 setActive:1 error:&v12],
        id v7 = v12,
        v8,
        v7))
  {
    long long v10 = AXMediaLogOutput();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AXMAudioSession activateSessionWithError:]((uint64_t)v7, v10);
    }

    BOOL v9 = 0;
  }
  if (a3) {
    *a3 = v7;
  }

  return v9;
}

- (void)_handleSessionInterrupted:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v6 = AXMediaLogOutput();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AXMAudioSession _handleSessionInterrupted:options:](a4, a3, v6);
  }
}

- (id)_stringForRouteChangeReason:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return @"Unknown";
  }
  else {
    return off_1E61176B0[a3 - 1];
  }
}

- (void)_handleRouteChanged:(unint64_t)a3 previousRoute:(id)a4
{
  uint64_t v6 = AXMediaLogOutput();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AXMAudioSession _handleRouteChanged:previousRoute:](self, a3, v6);
  }
}

- (void)_handleMediaServicesLost
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "Media services lost", v1, 2u);
}

- (void)_handleMediaServicesReset
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "Media services reset", v1, 2u);
}

- (void)_handleSilenceSecondaryAudio:(unint64_t)a3
{
  v4 = AXMediaLogOutput();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXMAudioSession _handleSilenceSecondaryAudio:](a3, v4);
  }
}

- (AVAudioSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSMutableArray)notificationObserverTokens
{
  return self->_notificationObserverTokens;
}

- (void)setNotificationObserverTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObserverTokens, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Failed to set session category with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)activateSessionWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Error updating audio session: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleSessionInterrupted:(os_log_t)log options:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"Ended";
  if (a2 == 1) {
    uint64_t v3 = @"Began";
  }
  int v4 = 138412546;
  id v5 = v3;
  __int16 v6 = 1024;
  BOOL v7 = a1 != 0;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "Session interruption (%@). Resume? %d", (uint8_t *)&v4, 0x12u);
}

- (void)_handleRouteChanged:(NSObject *)a3 previousRoute:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 _stringForRouteChangeReason:a2];
  int v5 = 138412290;
  __int16 v6 = v4;
  _os_log_debug_impl(&dword_1B57D5000, a3, OS_LOG_TYPE_DEBUG, "Route Changed. Reason: %@", (uint8_t *)&v5, 0xCu);
}

- (void)_handleSilenceSecondaryAudio:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = @"Ended";
  if (a1 == 1) {
    int v2 = @"Began";
  }
  int v3 = 138412290;
  int v4 = v2;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "Should silence secondary audio (%@)", (uint8_t *)&v3, 0xCu);
}

@end