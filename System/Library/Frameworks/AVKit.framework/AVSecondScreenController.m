@interface AVSecondScreenController
+ (id)sharedInstance;
- (AVObservationController)observationController;
- (AVSecondScreenController)init;
- (BOOL)allowsUpdatingActiveConnection;
- (NSMutableOrderedSet)connections;
- (NSMutableOrderedSet)secondScreens;
- (id)_connectionForPlayer:(id)a3;
- (id)_targetScreen;
- (id)activeConnection;
- (id)addConnectionForPlayer:(id)a3 playerLayer:(id)a4;
- (id)connectionPassingTest:(id)a3;
- (id)preferredConnection;
- (void)_insertConnection:(id)a3 atIndex:(unint64_t)a4;
- (void)_updateActiveConnection;
- (void)addConnection:(id)a3;
- (void)addSecondScreen:(id)a3;
- (void)dealloc;
- (void)removeConnection:(id)a3;
- (void)removeSecondScreen:(id)a3;
- (void)setAllowsUpdatingActiveConnection:(BOOL)a3;
- (void)setPreferredConnection:(id)a3;
@end

@implementation AVSecondScreenController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_secondScreens, 0);

  objc_storeStrong((id *)&self->_observationController, 0);
}

- (void)setAllowsUpdatingActiveConnection:(BOOL)a3
{
  self->_allowsUpdatingActiveConnection = a3;
}

- (BOOL)allowsUpdatingActiveConnection
{
  return self->_allowsUpdatingActiveConnection;
}

- (NSMutableOrderedSet)connections
{
  return self->_connections;
}

- (NSMutableOrderedSet)secondScreens
{
  return self->_secondScreens;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)_insertConnection:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    v10 = "-[AVSecondScreenController _insertConnection:atIndex:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2048;
    unint64_t v14 = a4;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %ld", (uint8_t *)&v9, 0x20u);
  }

  v8 = [(AVSecondScreenController *)self connections];
  [v8 insertObject:v6 atIndex:a4];
}

- (void)_updateActiveConnection
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(AVSecondScreenController *)self allowsUpdatingActiveConnection])
  {
    v3 = [(AVSecondScreenController *)self _targetScreen];
    v4 = v3;
    if (v3)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__AVSecondScreenController__updateActiveConnection__block_invoke;
      v18[3] = &unk_1E5FC2298;
      id v5 = v3;
      id v19 = v5;
      id v6 = [(AVSecondScreenController *)self connectionPassingTest:v18];
      v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "-[AVSecondScreenController _updateActiveConnection]";
        __int16 v23 = 2112;
        id v24 = v5;
        __int16 v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@", buf, 0x20u);
      }

      [v5 connectWithSecondScreenConnection:v6];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = [(AVSecondScreenController *)self secondScreens];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (v13 != v4) {
            [v13 connectWithSecondScreenConnection:0];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

uint64_t __51__AVSecondScreenController__updateActiveConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isReadyToConnect])
  {
    if ([*(id *)(a1 + 32) isTVOutScreen]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [v3 requiresTVOutScreen] ^ 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_targetScreen
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(AVSecondScreenController *)self secondScreens];
  id v3 = [v2 reverseObjectEnumerator];

  id v4 = (id)[v3 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isAvailable])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v10 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v15 = "-[AVSecondScreenController _targetScreen]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  return v4;
}

- (id)_connectionForPlayer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(AVSecondScreenController *)self connections];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 player];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)activeConnection
{
  return [(AVSecondScreenController *)self connectionPassingTest:&__block_literal_global_27];
}

uint64_t __44__AVSecondScreenController_activeConnection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

- (void)removeSecondScreen:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[AVSecondScreenController removeSecondScreen:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(AVSecondScreenController *)self secondScreens];
  [v6 removeObject:v4];

  [(AVSecondScreenController *)self _updateActiveConnection];
}

- (void)addSecondScreen:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[AVSecondScreenController addSecondScreen:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
    }

    int v6 = [v4 isTVOutScreen];
    int v7 = [(AVSecondScreenController *)self secondScreens];
    v8 = v7;
    if (v6) {
      [v7 addObject:v4];
    }
    else {
      [v7 insertObject:v4 atIndex:0];
    }

    [(AVSecondScreenController *)self _updateActiveConnection];
  }
}

- (void)setPreferredConnection:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AVSecondScreenController *)self preferredConnection];
  if ([v4 isEqual:v5])
  {
  }
  else
  {
    int v6 = [(AVSecondScreenController *)self connections];
    int v7 = [v6 containsObject:v4];

    if (v7)
    {
      v8 = _AVLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315394;
        __int16 v16 = "-[AVSecondScreenController setPreferredConnection:]";
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v15, 0x16u);
      }

      int v9 = [(AVSecondScreenController *)self connections];
      uint64_t v10 = [v9 indexOfObject:v4];

      __int16 v11 = [(AVSecondScreenController *)self connections];
      uint64_t v12 = [v11 count] - 1;

      if (v10 != v12)
      {
        uint64_t v13 = [(AVSecondScreenController *)self connections];
        long long v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v10];
        [v13 moveObjectsAtIndexes:v14 toIndex:v12];

        [(AVSecondScreenController *)self _updateActiveConnection];
      }
    }
  }
}

- (id)preferredConnection
{
  v2 = [(AVSecondScreenController *)self connections];
  id v3 = [v2 lastObject];

  return v3;
}

- (id)connectionPassingTest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(AVSecondScreenController *)self connections];
  int v6 = [v5 reverseObjectEnumerator];

  id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v10 && v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * i)))
        {
          id v7 = v10;
          goto LABEL_12;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (void)removeConnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AVSecondScreenController removeConnection:]";
    __int16 v9 = 1024;
    int v10 = 153;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  int v6 = [(AVSecondScreenController *)self connections];
  [v6 removeObject:v4];

  [v4 connectWithScreen:0 active:0];
  [(AVSecondScreenController *)self _updateActiveConnection];
}

- (void)addConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    __int16 v9 = "-[AVSecondScreenController addConnection:]";
    __int16 v10 = 1024;
    int v11 = 138;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v8, 0x12u);
  }

  if ([v4 isReadyToConnect]
    && (([v4 isPlaying] & 1) != 0
     || ([(AVSecondScreenController *)self activeConnection],
         int v6 = objc_claimAutoreleasedReturnValue(),
         v6,
         !v6)))
  {
    int v7 = [(AVSecondScreenController *)self connections];
    -[AVSecondScreenController _insertConnection:atIndex:](self, "_insertConnection:atIndex:", v4, [v7 count]);
  }
  else
  {
    [(AVSecondScreenController *)self _insertConnection:v4 atIndex:0];
  }
  [(AVSecondScreenController *)self _updateActiveConnection];
}

- (id)addConnectionForPlayer:(id)a3 playerLayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (AVSecondScreenTVSupportEnabled_onceToken != -1) {
    dispatch_once(&AVSecondScreenTVSupportEnabled_onceToken, &__block_literal_global_125);
  }
  if (AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled
    && ([(AVSecondScreenController *)self _connectionForPlayer:v6],
        int v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    __int16 v9 = [[AVSecondScreenConnection alloc] initWithPlayer:v6 playerLayer:v7];
    [(AVSecondScreenController *)self addConnection:v9];
    [(AVSecondScreenConnection *)v9 startUpdates];
  }
  else
  {
    __int16 v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  [(AVSecondScreenController *)self setAllowsUpdatingActiveConnection:0];
  [(AVObservationController *)self->_observationController stopAllObservation];
  v3.receiver = self;
  v3.super_class = (Class)AVSecondScreenController;
  [(AVSecondScreenController *)&v3 dealloc];
}

- (AVSecondScreenController)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)AVSecondScreenController;
  v2 = [(AVSecondScreenController *)&v23 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
    connections = v2->_connections;
    v2->_connections = (NSMutableOrderedSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
    secondScreens = v2->_secondScreens;
    v2->_secondScreens = (NSMutableOrderedSet *)v5;

    id v7 = [[AVObservationController alloc] initWithOwner:v2];
    observationController = v2->_observationController;
    v2->_observationController = v7;

    [(AVObservationController *)v2->_observationController startObservingNotificationForName:*MEMORY[0x1E4FB2ED0] object:0 notificationCenter:0 observationHandler:&__block_literal_global_3748];
    [(AVObservationController *)v2->_observationController startObservingNotificationForName:*MEMORY[0x1E4FB2628] object:0 notificationCenter:0 observationHandler:&__block_literal_global_3748];
    [(AVObservationController *)v2->_observationController startObservingNotificationForName:*MEMORY[0x1E4FB2EA0] object:0 notificationCenter:0 observationHandler:&__block_literal_global_6];
    [(AVObservationController *)v2->_observationController startObservingNotificationForName:@"AVSecondScreenDidDisconnectNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_10];
    [(AVObservationController *)v2->_observationController startObservingNotificationForName:@"AVSecondScreenConnectionDidBecomePossibleNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_13];
    [(AVObservationController *)v2->_observationController startObservingNotificationForName:@"AVSecondScreenConnectionReadyDidChangeNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_16];
    [(AVObservationController *)v2->_observationController startObservingNotificationForName:@"AVSecondScreenConnectionPlayingDidChangeNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_19];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    __int16 v9 = objc_msgSend(MEMORY[0x1E4FB1B70], "avkit_secondScreenScenes");
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [[AVSecondScreen alloc] initWithScene:*(void *)(*((void *)&v19 + 1) + 8 * v13)];
          [(AVSecondScreenController *)v2 addSecondScreen:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }

    [(AVSecondScreenController *)v2 setAllowsUpdatingActiveConnection:1];
    objc_initWeak(&location, v2);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __32__AVSecondScreenController_init__block_invoke_2;
    v16[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v17, &location);
    dispatch_async(MEMORY[0x1E4F14428], v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__AVSecondScreenController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateActiveConnection];
}

void __32__AVSecondScreenController_init__block_invoke_17(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  uint64_t v5 = [a4 object];
  if ([v5 isPlaying] && objc_msgSend(v5, "isReadyToConnect")) {
    [v6 setPreferredConnection:v5];
  }
}

void __32__AVSecondScreenController_init__block_invoke_14(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  __int16 v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[AVSecondScreenController init]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v10, 0x20u);
  }

  [v8 _updateActiveConnection];
}

void __32__AVSecondScreenController_init__block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  __int16 v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[AVSecondScreenController init]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v10, 0x20u);
  }

  [v8 _updateActiveConnection];
}

void __32__AVSecondScreenController_init__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a2;
  id v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[AVSecondScreenController init]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [v5 object];
  [v6 removeSecondScreen:v8];
}

void __32__AVSecondScreenController_init__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a2;
  id v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[AVSecondScreenController init]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  id v8 = [AVSecondScreen alloc];
  int v9 = [v5 object];
  int v10 = [(AVSecondScreen *)v8 initWithScene:v9];
  [v6 addSecondScreen:v10];
}

void __32__AVSecondScreenController_init__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  id v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[AVSecondScreenController init]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [v5 activeConnection];

  if (!v8) {
    [v5 _updateActiveConnection];
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVSecondScreenController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __42__AVSecondScreenController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

@end