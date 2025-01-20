@interface _GCHapticServerManager
+ (id)sharedInstance;
- (BOOL)acceptNewConnection:(id)a3 fromHapticsEnabledApp:(id)a4;
- (BOOL)activeEvents;
- (BOOL)playersHaveImpendingCommandsForStartTime:(double)a3 endTime:(double)a4;
- (BOOL)readClientDataForStartTime:(double)a3 endTime:(double)a4;
- (NSMutableDictionary)clients;
- (OS_dispatch_queue)runloopQueue;
- (_GCHapticServerManager)init;
- (id)__onqueue_reserveChannels:(unint64_t)a3 forClient:(id)a4;
- (void)dealloc;
- (void)enterRunloop;
- (void)hapticClientProxyInitialized:(id)a3;
- (void)identifyCompletedClients;
- (void)logicalDeviceWasUnregistered:(id)a3;
- (void)notifyPlayerNoLongerRetained:(id)a3;
- (void)processActiveEventsForStartTime:(double)a3 endTime:(double)a4;
- (void)processScheduledCommandsForStartTime:(double)a3 endTime:(double)a4;
- (void)readListCommand:(HapticCommand *)a3 client:(id)a4 renderTime:(double)var2;
- (void)readParamCurveListCommand:(HapticCommand *)a3 client:(id)a4;
- (void)removeHapticClient:(id)a3;
- (void)scheduleCommand:(const void *)a3;
- (void)setActiveEvents:(BOOL)a3;
- (void)setClients:(id)a3;
- (void)spawnInputThread;
@end

@implementation _GCHapticServerManager

+ (id)sharedInstance
{
  if (+[_GCHapticServerManager sharedInstance]::onceToken != -1) {
    dispatch_once(&+[_GCHapticServerManager sharedInstance]::onceToken, &__block_literal_global_18);
  }
  v2 = (void *)+[_GCHapticServerManager sharedInstance]::hapticServerManager;

  return v2;
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_appMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_GCHapticServerManager;
  [(_GCHapticServerManager *)&v3 dealloc];
}

- (_GCHapticServerManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)_GCHapticServerManager;
  v2 = [(_GCHapticServerManager *)&v22 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    logicalHapticDevices = v2->_logicalHapticDevices;
    v2->_logicalHapticDevices = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    clientInvalidationHandlers = v2->_clientInvalidationHandlers;
    v2->_clientInvalidationHandlers = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    hapticPlayers = v2->_hapticPlayers;
    v2->_hapticPlayers = (NSMutableDictionary *)v9;

    v2->_nextClientID = 1;
    v2->_tickLengthSeconds = 0.06;
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.gamecontrollerd.haptics.runloop", v11);
    runloopQueue = v2->_runloopQueue;
    v2->_runloopQueue = (OS_dispatch_queue *)v12;

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:sel_logicalDeviceWasUnregistered_ name:@"GCLogicalDeviceWasUnregisteredNotification" object:0];

    objc_initWeak(&location, v2);
    v15 = (BKSApplicationStateMonitor *)objc_alloc_init((Class)&off_26D2C4EC8);
    appMonitor = v2->_appMonitor;
    v2->_appMonitor = v15;

    [(BKSApplicationStateMonitor *)v2->_appMonitor updateInterestedStates:14];
    v17 = v2->_appMonitor;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __30___GCHapticServerManager_init__block_invoke;
    v19[3] = &unk_26D22BC88;
    objc_copyWeak(&v20, &location);
    [(BKSApplicationStateMonitor *)v17 setHandler:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)acceptNewConnection:(id)a3 fromHapticsEnabledApp:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v17 = v6;
  if (gc_isInternalBuild())
  {
    v16 = getGCHapticsLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_INFO, "Accepting haptics-enabled app connection %@", (uint8_t *)location, 0xCu);
    }

    id v6 = v17;
  }
  uint64_t v7 = [[_GCHapticClientConnection alloc] initWithConnection:v19 fromProcess:v6];
  [v6 addConnection:v7];
  nextClientID = (void *)self->_nextClientID;
  self->_nextClientID = (unint64_t)nextClientID + 1;
  uint64_t v9 = +[_GCControllerManager sharedInstance];
  id val = +[_GCHapticClientProxy clientProxyWithConnection:v7 server:v9 clientID:nextClientID];

  [(_GCHapticClientConnection *)v7 setServer:val];
  [(GCIPCRemoteConnection *)v7 resume];
  objc_initWeak(location, self);
  objc_initWeak(&from, val);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke;
  v27[3] = &unk_26D22BCB0;
  objc_copyWeak(&v28, location);
  objc_copyWeak(&v29, &from);
  v10 = (void *)MEMORY[0x223C6E420](v27);
  appMonitor = self->_appMonitor;
  uint64_t v12 = [v19 processIdentifier];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_13;
  v24[3] = &unk_26D22BCD8;
  objc_copyWeak(&v25, location);
  objc_copyWeak(&v26, &from);
  [(BKSApplicationStateMonitor *)appMonitor applicationInfoForPID:v12 completion:v24];
  runloopQueue = self->_runloopQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_15;
  block[3] = &unk_26D22BD00;
  objc_copyWeak(&v22, location);
  objc_copyWeak(v23, &from);
  v23[1] = nextClientID;
  block[4] = self;
  id v21 = v10;
  id v14 = v10;
  dispatch_async(runloopQueue, block);

  objc_destroyWeak(v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return 1;
}

- (void)removeHapticClient:(id)a3
{
  id v4 = a3;
  runloopQueue = self->_runloopQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __45___GCHapticServerManager_removeHapticClient___block_invoke;
  v7[3] = &unk_26D22BC60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(runloopQueue, v7);
}

- (void)hapticClientProxyInitialized:(id)a3
{
  id v4 = a3;
  logicalHapticDevices = self->_logicalHapticDevices;
  id v12 = v4;
  id v6 = [v4 identifier];
  uint64_t v7 = [(NSMutableDictionary *)logicalHapticDevices objectForKey:v6];

  if (!v7)
  {
    id v8 = [_GCHapticLogicalDevice alloc];
    uint64_t v9 = [v12 identifier];
    uint64_t v7 = [(_GCHapticLogicalDevice *)v8 initWithIdentifier:v9 clientConnection:v12];

    v10 = self->_logicalHapticDevices;
    v11 = [v12 identifier];
    [(NSMutableDictionary *)v10 setObject:v7 forKey:v11];
  }
  [(_GCHapticLogicalDevice *)v7 registerHapticClient:v12];
  [(_GCHapticServerManager *)self spawnInputThread];
}

- (void)spawnInputThread
{
  if (!self->_running)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v3 = getGCHapticsLogger();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "First client connected, spawning input thread...", v4, 2u);
      }
    }
    +[NSThread detachNewThreadSelector:sel_enterRunloop toTarget:self withObject:0];
  }
}

- (void)logicalDeviceWasUnregistered:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  runloopQueue = self->_runloopQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __55___GCHapticServerManager_logicalDeviceWasUnregistered___block_invoke;
  block[3] = &unk_26D22BD50;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  id v12 = &v13;
  dispatch_sync(runloopQueue, block);
  if (v14[5])
  {
    uint64_t v7 = self->_runloopQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __55___GCHapticServerManager_logicalDeviceWasUnregistered___block_invoke_23;
    v8[3] = &unk_26D22BD78;
    v8[4] = self;
    v8[5] = &v13;
    dispatch_sync(v7, v8);
  }

  _Block_object_dispose(&v13, 8);
}

- (void)scheduleCommand:(const void *)a3
{
  hapticPlayers = self->_hapticPlayers;
  uint64_t v5 = +[NSNumber numberWithUnsignedLong:*((void *)a3 + 2)];
  id v6 = [(NSMutableDictionary *)hapticPlayers objectForKey:v5];

  [v6 scheduleCommand:a3];
}

- (BOOL)readClientDataForStartTime:(double)a3 endTime:(double)a4
{
  v34.var0 = (MessageHeader)168;
  v34.double var2 = 0.0;
  v34.int var3 = -1;
  v34.var4 = -1;
  memset(&v34.var5, 0, 76);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = self->_clients;
  char v7 = 0;
  uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v22 objects:v33 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v9 = 134218496;
    long long v21 = v9;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_clients, "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * v11), v21, (void)v22);
        logicalHapticDevices = self->_logicalHapticDevices;
        id v14 = [v12 identifier];
        uint64_t v15 = [(NSMutableDictionary *)logicalHapticDevices objectForKey:v14];
        LOBYTE(logicalHapticDevices) = v15 == 0;

        if ((logicalHapticDevices & 1) == 0
          && [v12 running]
          && ([v12 stopping] & 1) == 0)
        {
          while (HapticSharedMemory::readCommand((HapticSharedMemory *)[v12 sharedMemory], &v34))
          {
            if (v34.var0.var1 == 6)
            {
              if (gc_isInternalBuild())
              {
                v17 = getGCHapticsLogger();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_INFO, "", buf, 2u);
                }
              }
              if (gc_isInternalBuild())
              {
                id v18 = getGCHapticsLogger();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v21;
                  double var2 = v34.var2;
                  __int16 v29 = 1024;
                  int var1 = v34.var0.var1;
                  __int16 v31 = 1024;
                  int var3 = v34.var3;
                  _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_INFO, "StartEventList from client: time: %.3f type: %u chanID: %d", buf, 0x18u);
                }
              }
              HapticCommand v26 = v34;
              char v7 = 1;
              [(_GCHapticServerManager *)self readListCommand:&v26 client:v12 renderTime:a3];
            }
            else if (v34.var0.var1 == 9)
            {
              char v7 = 1;
              if (gc_isInternalBuild())
              {
                v16 = getGCHapticsLogger();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_INFO, "Found StartParamCurveList outside of event list!", buf, 2u);
                }
              }
            }
            else
            {
              char v7 = 1;
              [(_GCHapticServerManager *)self scheduleCommand:&v34];
            }
          }
        }

        ++v11;
      }
      while (v11 != v8);
      uint64_t v19 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v22 objects:v33 count:16];
      uint64_t v8 = v19;
    }
    while (v19);
  }

  return v7 & 1;
}

- (void)processScheduledCommandsForStartTime:(double)a3 endTime:(double)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_hapticPlayers;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        -[NSMutableDictionary objectForKey:](self->_hapticPlayers, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        uint64_t v10 = (id *)objc_claimAutoreleasedReturnValue();
        id v11 = v10[1];
        int v12 = [v11 count];
        if (v12 >= 1)
        {
          for (unint64_t j = v12 + 1; j > 1; --j)
          {
            id v14 = [v11 objectAtIndexedSubscript:(j - 2)];
            if ([v14 type] == 30)
            {
              [v11 removeLastObject];
            }
            else
            {
              [v14 time];
              if (v15 >= a4)
              {

                break;
              }
              [v11 removeLastObject];
              [v10 handleCommand:v14];
            }
          }
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (BOOL)playersHaveImpendingCommandsForStartTime:(double)a3 endTime:(double)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_hapticPlayers;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        -[NSMutableDictionary objectForKey:](self->_hapticPlayers, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        uint64_t v10 = (id *)objc_claimAutoreleasedReturnValue();
        if ([v10[1] count])
        {
          char v11 = [v10 hasScheduledEventsByTime:a4 + 1.0];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  char v11 = 0;
LABEL_11:

  return v11;
}

- (void)processActiveEventsForStartTime:(double)a3 endTime:(double)a4
{
  [(_GCHapticServerManager *)self setActiveEvents:0];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v77 = self;
  obuint64_t j = self->_logicalHapticDevices;
  uint64_t v67 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v94 objects:v124 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v95;
    uint64_t v8 = &OBJC_IVAR____GCHapticLogicalDevice__hapticPlayers;
    *(void *)&long long v7 = 138414338;
    long long v65 = v7;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v95 != v68) {
          objc_enumerationMutation(obj);
        }
        v66 = *(void **)(*((void *)&v94 + 1) + 8 * v70);
        v76 = [(NSMutableDictionary *)v77->_logicalHapticDevices objectForKeyedSubscript:v65];
        uint64_t v123 = 0;
        uint64_t v122 = 0;
        uint64_t v121 = 0;
        uint64_t v120 = 0;
        v71 = +[NSMutableArray array];
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v72 = *(id *)((char *)v76 + *v8);
        int v9 = 0;
        uint64_t v10 = [v72 countByEnumeratingWithState:&v90 objects:v119 count:16];
        if (v10)
        {
          uint64_t v73 = *(void *)v91;
          do
          {
            uint64_t v11 = 0;
            uint64_t v74 = v10;
            do
            {
              if (*(void *)v91 != v73) {
                objc_enumerationMutation(v72);
              }
              int v12 = *(void **)(*((void *)&v90 + 1) + 8 * v11);
              [v12 processSliceForLogicalDevice:v76 startTime:a3 endTime:a4];
              [v12 continuousIntensity];
              if (v13 > 0.0)
              {
                uint64_t v14 = v12[6];
                if (v14) {
                  *(unsigned char *)(v14 + 8) = 1;
                }
              }
              long long v88 = 0u;
              long long v89 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v15 = [v12 actuators];
              uint64_t v16 = [v15 countByEnumeratingWithState:&v86 objects:v118 count:16];
              int v75 = v9;
              long long v17 = v8;
              if (v16)
              {
                uint64_t v18 = *(void *)v87;
                do
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v87 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    id v20 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                    [v12 continuousIntensity];
                    float v22 = v21;
                    uint64_t v23 = [v20 index];
                    *((float *)&v122 + v23) = v22 + *((float *)&v122 + v23);
                    [v12 continuousSharpness];
                    float v25 = v24;
                    uint64_t v26 = [v20 index];
                    *((float *)&v120 + v26) = v25 + *((float *)&v120 + v26);
                  }
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v86 objects:v118 count:16];
                }
                while (v16);
              }

              uint64_t v8 = v17;
              int v9 = v75;
              if (![(_GCHapticServerManager *)v77 activeEvents]) {
                -[_GCHapticServerManager setActiveEvents:](v77, "setActiveEvents:", [v12 hasProcessedActiveEventsAfterTime:a4 + -1.0] | -[_GCHapticServerManager activeEvents](v77, "activeEvents"));
              }
              if ([v12 transientsEnqueuedSinceLastQuery])
              {
                uint64_t v27 = v12[6];
                int v9 = 1;
                if (v27) {
                  *(unsigned char *)(v27 + 8) = 1;
                }
              }
              if (([v12 isActiveAtTime:a3] & 1) == 0) {
                [v71 addObject:v12];
              }
              ++v11;
            }
            while (v11 != v74);
            uint64_t v10 = [v72 countByEnumeratingWithState:&v90 objects:v119 count:16];
          }
          while (v10);
        }

        uint64_t v28 = 0;
        char v29 = 0;
        do
        {
          while (1)
          {
            float v30 = fmin(fmax(*((float *)&v120 + v28), 0.0), 1.0);
            *((float *)&v120 + v28) = v30;
            float v31 = fmin(fmax(*((float *)&v122 + v28), 0.0), 1.0);
            *((float *)&v122 + v28) = v31;
            if (*((float *)v76 + v28 + 10) != v30)
            {
              *((float *)v76 + v28 + 10) = v30;
              char v29 = 1;
            }
            if (*((float *)v76 + v28 + 14) == v31) {
              break;
            }
            *((float *)v76 + v28++ + 14) = v31;
            char v29 = 1;
            if (v28 == 4) {
              goto LABEL_38;
            }
          }
          ++v28;
        }
        while (v28 != 4);
        if (v29)
        {
LABEL_38:
          if (gc_isInternalBuild())
          {
            v63 = getGCHapticsLogger();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v65;
              v101 = v66;
              __int16 v102 = 2048;
              double v103 = *(float *)&v122;
              __int16 v104 = 2048;
              double v105 = *((float *)&v122 + 1);
              __int16 v106 = 2048;
              double v107 = *(float *)&v123;
              __int16 v108 = 2048;
              double v109 = *((float *)&v123 + 1);
              __int16 v110 = 2048;
              double v111 = *(float *)&v120;
              __int16 v112 = 2048;
              double v113 = *((float *)&v120 + 1);
              __int16 v114 = 2048;
              double v115 = *(float *)&v121;
              __int16 v116 = 2048;
              double v117 = *((float *)&v121 + 1);
              _os_log_debug_impl(&dword_220998000, v63, OS_LOG_TYPE_DEBUG, "%@ I=(%.3f %.3f %.3f %.3f) S=(%.3f %.3f %.3f %.3f)", buf, 0x5Cu);
            }
          }
          v32 = [v76[10] actuators];
          v33 = [v32 firstObject];
          BOOL v34 = [v33 type] == 1;

          if (v34)
          {
            uint64_t v38 = v120;
            LODWORD(v37) = HIDWORD(v122);
            float v39 = *(float *)&v122;
            if (*(float *)&v120 >= 0.5) {
              *(float *)&double v36 = 0.0;
            }
            else {
              *(float *)&double v36 = *(float *)&v122;
            }
            if (*((float *)&v120 + 1) >= 0.5) {
              float v40 = 0.0;
            }
            else {
              float v40 = *((float *)&v122 + 1);
            }
            v41 = v76;
            LODWORD(v35) = 1047233823;
            objc_msgSend(v76[9], "setHapticMotor:frequency:amplitude:", 0, v35, v36, v37);
            if (*(float *)&v38 >= 0.5) {
              *(float *)&double v42 = v39;
            }
            else {
              *(float *)&double v42 = 0.0;
            }
            [v76[9] setHapticMotor:1 frequency:COERCE_DOUBLE(1035489772) amplitude:v42];
            LODWORD(v43) = 1047233823;
            *(float *)&double v44 = v40;
            [v76[9] setHapticMotor:2 frequency:v43 amplitude:v44];
            LODWORD(v45) = 1035489772;
            LODWORD(v46) = HIDWORD(v38);
            [v76[9] setHapticMotor:3 frequency:v45 amplitude:v46];
          }
          else
          {
            v41 = v76;
            LODWORD(v35) = v122;
            [v76[9] setHapticMotor:0 frequency:v35 amplitude:0.0];
            LODWORD(v47) = HIDWORD(v122);
            [v76[9] setHapticMotor:1 frequency:v47 amplitude:0.0];
            LODWORD(v48) = v123;
            [v76[9] setHapticMotor:2 frequency:v48 amplitude:0.0];
            LODWORD(v49) = HIDWORD(v123);
            [v76[9] setHapticMotor:3 frequency:v49 amplitude:0.0];
          }
LABEL_51:
          [v41[9] enableHaptics];
          goto LABEL_52;
        }
        v41 = v76;
        if (v9) {
          goto LABEL_51;
        }
LABEL_52:
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v50 = v71;
        uint64_t v51 = [v50 countByEnumeratingWithState:&v82 objects:v99 count:16];
        if (v51)
        {
          uint64_t v52 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v51; ++j)
            {
              if (*(void *)v83 != v52) {
                objc_enumerationMutation(v50);
              }
              [*(id *)((char *)v76 + *v8) removeObject:*(void *)(*((void *)&v82 + 1) + 8 * j)];
            }
            uint64_t v51 = [v50 countByEnumeratingWithState:&v82 objects:v99 count:16];
          }
          while (v51);
        }

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v54 = v50;
        uint64_t v55 = [v54 countByEnumeratingWithState:&v78 objects:v98 count:16];
        if (v55)
        {
          uint64_t v56 = *(void *)v79;
          do
          {
            uint64_t v57 = 0;
            do
            {
              if (*(void *)v79 != v56) {
                objc_enumerationMutation(v54);
              }
              v58 = *(void **)(*((void *)&v78 + 1) + 8 * v57);
              if (gc_isInternalBuild())
              {
                v61 = getGCHapticsLogger();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v101 = v58;
                  _os_log_debug_impl(&dword_220998000, v61, OS_LOG_TYPE_DEBUG, "Player %@ is no longer needed, deallocating...", buf, 0xCu);
                }
              }
              hapticPlayers = v77->_hapticPlayers;
              v60 = [v58 identifier];
              [(NSMutableDictionary *)hapticPlayers removeObjectForKey:v60];

              ++v57;
            }
            while (v55 != v57);
            uint64_t v62 = [v54 countByEnumeratingWithState:&v78 objects:v98 count:16];
            uint64_t v55 = v62;
          }
          while (v62);
        }

        ++v70;
      }
      while (v70 != v67);
      uint64_t v64 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v94 objects:v124 count:16];
      uint64_t v67 = v64;
    }
    while (v64);
  }
}

- (void)notifyPlayerNoLongerRetained:(id)a3
{
  id v4 = a3;
  runloopQueue = self->_runloopQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __55___GCHapticServerManager_notifyPlayerNoLongerRetained___block_invoke;
  v7[3] = &unk_26D22BC60;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(runloopQueue, v7);
}

- (void)identifyCompletedClients
{
  uint64_t v27 = +[NSMutableDictionary dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v3 = self->_clients;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v37 != v5) {
          objc_enumerationMutation(v3);
        }
        [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v4);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v7 = self->_hapticPlayers;
  uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v8; ++j)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [(NSMutableDictionary *)self->_hapticPlayers objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * j)];
        if (([v11[6] complete] & 1) == 0)
        {
          int v12 = +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [v11[6] clientID]);
          if ([v11 hasScheduledCommands]) {
            uint64_t v13 = 0;
          }
          else {
            uint64_t v13 = [v11 hasProcessedActiveEventsThisSlice] ^ 1;
          }
          uint64_t v14 = [v27 objectForKeyedSubscript:v12];
          BOOL v15 = v14 == 0;

          if (v15)
          {
            uint64_t v16 = +[NSNumber numberWithBool:v13];
            [v27 setObject:v16 forKeyedSubscript:v12];
          }
          else
          {
            uint64_t v16 = [v27 objectForKeyedSubscript:v12];
            long long v17 = +[NSNumber numberWithBool:](&off_26D2B68C8, "numberWithBool:", [v16 BOOLValue] & v13);
            [v27 setObject:v17 forKeyedSubscript:v12];
          }
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v8);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v27;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * k);
        uint64_t v23 = [v18 objectForKeyedSubscript:v22];
        int v24 = [v23 BOOLValue];

        float v25 = [(NSMutableDictionary *)self->_clients objectForKeyedSubscript:v22];
        uint64_t v26 = v25;
        if (v24) {
          [v25 setComplete:1];
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v19);
  }
}

- (void)enterRunloop
{
  if (self->_running) {
    return;
  }
  self->_running = 1;
  timespec v21 = (timespec)xmmword_220A91EE0;
  timespec __rqtp = (timespec)xmmword_220A91ED0;
  double v3 = (double)mach_absolute_time() * 0.0000000416666667;
  while (1)
  {
    uint64_t v4 = (void *)MEMORY[0x223C6E130]();
    ++self->_tickCount;
    double v5 = (double)mach_absolute_time() * 0.0000000416666667;
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    runloopQueue = self->_runloopQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __38___GCHapticServerManager_enterRunloop__block_invoke;
    block[3] = &unk_26D22BDA0;
    *(double *)&block[6] = v3;
    *(double *)&block[7] = v5;
    void block[4] = self;
    void block[5] = &v17;
    dispatch_sync(runloopQueue, block);
    if (!*((unsigned char *)v18 + 24))
    {
      if (self->_idle)
      {
        if (gc_isInternalBuild())
        {
          log = getGCHapticsLogger();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_220998000, log, OS_LOG_TYPE_DEFAULT, "Entering active state...", buf, 2u);
          }
        }
        self->_idle = 0;
      }
      long long v7 = self->_runloopQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __38___GCHapticServerManager_enterRunloop__block_invoke_24;
      v14[3] = &unk_26D22BDC8;
      v14[4] = self;
      *(double *)&v14[5] = v3;
      *(double *)&v14[6] = v5;
      dispatch_sync(v7, v14);
      uint64_t v8 = self->_runloopQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __38___GCHapticServerManager_enterRunloop__block_invoke_2;
      v13[3] = &unk_26D22BDC8;
      v13[4] = self;
      *(double *)&v13[5] = v3;
      *(double *)&v13[6] = v5;
      dispatch_sync(v8, v13);
      uint64_t v9 = self->_runloopQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = __38___GCHapticServerManager_enterRunloop__block_invoke_3;
      v12[3] = &unk_26D22BDF0;
      v12[4] = self;
      dispatch_sync(v9, v12);
      nanosleep(&v21, 0);
      goto LABEL_13;
    }
    if (!self->_running) {
      break;
    }
    if (!self->_idle)
    {
      if (gc_isInternalBuild())
      {
        log = getGCHapticsLogger();
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_220998000, log, OS_LOG_TYPE_DEFAULT, "Entering idle state...", buf, 2u);
        }
      }
      self->_idle = 1;
    }
    nanosleep(&__rqtp, 0);
LABEL_13:
    _Block_object_dispose(&v17, 8);
    double v3 = v5;
    if (!self->_running) {
      goto LABEL_23;
    }
  }
  if (gc_isInternalBuild())
  {
    uint64_t v10 = getGCHapticsLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "Destroying input thread...", buf, 2u);
    }
  }
  _Block_object_dispose(&v17, 8);
LABEL_23:
  +[NSThread exit];
}

- (void)readParamCurveListCommand:(HapticCommand *)a3 client:(id)a4
{
  id v6 = a4;
  double var2 = a3->var2;
  if (gc_isInternalBuild())
  {
    uint64_t v17 = getGCHapticsLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      double v21 = *(double *)&v6;
      __int16 v22 = 2048;
      double v23 = var2;
      _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_INFO, "Start of param curve command list for client %@, curve list time %f", buf, 0x16u);
    }
  }
  *(void *)&long long v8 = 134218240;
  long long v19 = v8;
  while (HapticSharedMemory::readCommand((HapticSharedMemory *)objc_msgSend(v6, "sharedMemory", v19), a3))
  {
    int var1 = a3->var0.var1;
    if (var1 != 10)
    {
      if (var1 == 9)
      {
        if (!gc_isInternalBuild()) {
          break;
        }
        uint64_t v13 = getGCHapticsLogger();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        uint64_t v14 = "Illegal StartParamCurveList within list!";
LABEL_18:
        BOOL v15 = v13;
        uint32_t v16 = 2;
      }
      else
      {
        if (var1 == 11)
        {
          if (!gc_isInternalBuild()) {
            break;
          }
          uint64_t v13 = getGCHapticsLogger();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            uint64_t v14 = "EndParamCurveList - breaking out";
            goto LABEL_18;
          }
LABEL_27:

          break;
        }
        if (!gc_isInternalBuild()) {
          break;
        }
        uint64_t v13 = getGCHapticsLogger();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
          goto LABEL_27;
        }
        int v18 = a3->var0.var1;
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = v18;
        uint64_t v14 = "Illegal HapticCommandType: %u";
        BOOL v15 = v13;
        uint32_t v16 = 8;
      }
      _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
      goto LABEL_27;
    }
    a3->double var2 = var2 + a3->var2;
    if (gc_isInternalBuild())
    {
      uint64_t v10 = getGCHapticsLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        double v11 = a3->var2;
        int v12 = a3->var0.var1;
        *(_DWORD *)buf = v19;
        double v21 = v11;
        __int16 v22 = 1024;
        LODWORD(v23) = v12;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "AddParamCurve - adjusted time: %.3f, type: %u", buf, 0x12u);
      }
    }
    [(_GCHapticServerManager *)self scheduleCommand:a3];
  }
}

- (void)readListCommand:(HapticCommand *)a3 client:(id)a4 renderTime:(double)var2
{
  id v8 = a4;
  if (a3->var2 > var2) {
    double var2 = a3->var2;
  }
  *(void *)&long long v9 = 67110144;
  long long v27 = v9;
  while (1)
  {
    while (1)
    {
      if (!HapticSharedMemory::readCommand((HapticSharedMemory *)objc_msgSend(v8, "sharedMemory", v27), a3))
      {
        if (!gc_isInternalBuild()) {
          goto LABEL_25;
        }
        int v24 = getGCHapticsLogger();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_32;
        }
        *(_WORD *)buf = 0;
        float v25 = "Reached end of queued commands";
        goto LABEL_31;
      }
      int var1 = a3->var0.var1;
      if (var1 != 9) {
        break;
      }
      a3->double var2 = var2 + a3->var2;
      if (gc_isInternalBuild())
      {
        __int16 v22 = getGCHapticsLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          double v23 = a3->var2;
          *(_DWORD *)buf = 134217984;
          *(double *)long long v29 = v23;
          _os_log_impl(&dword_220998000, v22, OS_LOG_TYPE_INFO, "StartParamCurveList - adjusted time: %.3f - descending into curve", buf, 0xCu);
        }
      }
      long long v17 = *(_OWORD *)&a3->var5.var5.var1[13].var1;
      v36[8] = *(_OWORD *)&a3->var5.var5.var1[11].var1;
      v36[9] = v17;
      uint64_t v37 = *(void *)&a3->var5.var5.var1[15].var1;
      long long v18 = *(_OWORD *)&a3->var5.var5.var1[5].var1;
      v36[4] = *(_OWORD *)&a3->var5.var5.var1[3].var1;
      v36[5] = v18;
      long long v19 = *(_OWORD *)&a3->var5.var5.var1[9].var1;
      v36[6] = *(_OWORD *)&a3->var5.var5.var1[7].var1;
      v36[7] = v19;
      long long v20 = *(_OWORD *)&a3->var3;
      v36[0] = *(_OWORD *)&a3->var0.var0;
      v36[1] = v20;
      long long v21 = *(_OWORD *)&a3->var5.var5.var1[1].var1;
      v36[2] = *(_OWORD *)&a3->var5.var0.var0;
      v36[3] = v21;
      [(_GCHapticServerManager *)self readParamCurveListCommand:v36 client:v8];
    }
    if (var1 == 6)
    {
      if (!gc_isInternalBuild()) {
        goto LABEL_25;
      }
      int v24 = getGCHapticsLogger();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
        goto LABEL_32;
      }
      *(_WORD *)buf = 0;
      float v25 = "Illegal StartEventList within list!";
      goto LABEL_31;
    }
    if (var1 == 7) {
      break;
    }
    a3->double var2 = var2 + a3->var2;
    [(_GCHapticServerManager *)self scheduleCommand:a3];
    if (gc_isInternalBuild())
    {
      double v11 = getGCHapticsLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = a3->var0.var1;
        unint64_t var4 = a3->var4;
        unint64_t var0 = a3->var5.var0.var0;
        double v15 = a3->var2;
        unint64_t var3 = a3->var3;
        *(_DWORD *)buf = v27;
        *(_DWORD *)long long v29 = v12;
        *(_WORD *)&v29[4] = 2048;
        *(void *)&v29[6] = var4;
        __int16 v30 = 2048;
        double v31 = v15;
        __int16 v32 = 1024;
        int v33 = var0;
        __int16 v34 = 2048;
        unint64_t v35 = var3;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "Start event type %u, event id %lu, time %.3f, token %u, channel %lu", buf, 0x2Cu);
      }
    }
  }
  if (gc_isInternalBuild())
  {
    uint64_t v26 = getGCHapticsLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v26, OS_LOG_TYPE_INFO, "EndEventList - breaking out", buf, 2u);
    }
  }
  if (gc_isInternalBuild())
  {
    int v24 = getGCHapticsLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
LABEL_32:

      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    float v25 = "";
LABEL_31:
    _os_log_impl(&dword_220998000, v24, OS_LOG_TYPE_INFO, v25, buf, 2u);
    goto LABEL_32;
  }
LABEL_25:
}

- (id)__onqueue_reserveChannels:(unint64_t)a3 forClient:(id)a4
{
  id v6 = a4;
  logicalHapticDevices = self->_logicalHapticDevices;
  id v8 = [v6 identifier];
  uint64_t v9 = [(NSMutableDictionary *)logicalHapticDevices objectForKey:v8];

  long long v29 = (id *)v9;
  if (v9)
  {
    uint64_t v10 = +[NSMutableArray array];
    double v11 = self;
    objc_sync_enter(v11);
    unint64_t channelID = v11->_channelID;
    unint64_t v13 = channelID + a3;
    v11->_unint64_t channelID = channelID + a3;
    objc_sync_exit(v11);

    if (gc_isInternalBuild())
    {
      float v25 = getGCHapticsLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        unint64_t v31 = a3;
        __int16 v32 = 2048;
        unint64_t v33 = channelID;
        __int16 v34 = 2048;
        unint64_t v35 = channelID + a3;
        _os_log_impl(&dword_220998000, v25, OS_LOG_TYPE_INFO, "reserving %lu channels, from [%lu - %lu)", buf, 0x20u);
      }
    }
    if (channelID < v13)
    {
      uint64_t v14 = 0;
      do
      {
        double v15 = [_GCHapticPlayer alloc];
        uint32_t v16 = [v6 actuators];
        long long v17 = [(_GCHapticPlayer *)v15 initWithIdentifier:channelID + v14 actuators:v16 client:v6];

        [v10 addObject:v17];
        ++v14;
      }
      while (a3 != v14);
      if (channelID < v13)
      {
        uint64_t v19 = 0;
        *(void *)&long long v18 = 134218242;
        long long v28 = v18;
        do
        {
          long long v20 = objc_msgSend(v10, "objectAtIndexedSubscript:", v19, v28);
          hapticPlayers = v11->_hapticPlayers;
          __int16 v22 = +[NSNumber numberWithUnsignedInteger:channelID + v19];
          [(NSMutableDictionary *)hapticPlayers setObject:v20 forKey:v22];

          if (gc_isInternalBuild())
          {
            double v23 = getGCHapticsLogger();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v28;
              unint64_t v31 = channelID + v19;
              __int16 v32 = 2112;
              unint64_t v33 = (unint64_t)v20;
              _os_log_impl(&dword_220998000, v23, OS_LOG_TYPE_INFO, "_hapticPlayers[%lu] = %@", buf, 0x16u);
            }
          }
          [v20 setHapticLogicalDevice:v29];
          [v29[4] addObject:v20];

          ++v19;
        }
        while (a3 != v19);
      }
    }
  }
  else
  {
    if (gc_isInternalBuild())
    {
      uint64_t v26 = getGCHapticsLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        long long v27 = [v6 identifier];
        [(_GCHapticServerManager *)v27 __onqueue_reserveChannels:a3 forClient:v26];
      }
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)activeEvents
{
  return self->_activeEvents;
}

- (void)setActiveEvents:(BOOL)a3
{
  self->_activeEvents = a3;
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (OS_dispatch_queue)runloopQueue
{
  return self->_runloopQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runloopQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_appMonitor, 0);
  objc_storeStrong((id *)&self->_hapticPlayers, 0);
  objc_storeStrong((id *)&self->_clientInvalidationHandlers, 0);
  objc_storeStrong((id *)&self->_logicalHapticDevices, 0);

  objc_storeStrong((id *)&self->queue, 0);
}

- (void)__onqueue_reserveChannels:(uint64_t)a3 forClient:(os_log_t)log .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_220998000, log, OS_LOG_TYPE_ERROR, "reserving %lu channels - unknown client: %@", buf, 0x16u);
}

@end