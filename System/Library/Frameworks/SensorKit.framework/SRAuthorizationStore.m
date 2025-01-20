@interface SRAuthorizationStore
+ (SRAuthorizationStore)allSensorsStore;
+ (id)sharedAuthorizationStoreForSensors:(id)a3;
+ (void)initialize;
- (BOOL)checkAccessForService:(id)a3 auditToken:(id *)a4;
- (BOOL)sensorHasReaderAuthorization:(id)a3;
- (BOOL)sensorHasReaderAuthorization:(id)a3 forBundleId:(id)a4;
- (BOOL)sensorKitActive;
- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5;
- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5 setOverride:(BOOL)a6;
- (NSDictionary)readerAuthorizationGroups;
- (NSDictionary)readerAuthorizationValues;
- (NSDictionary)readerLastModifiedAuthorizationTimes;
- (NSDictionary)writerAuthorizationGroups;
- (NSDictionary)writerAuthorizationValues;
- (OS_dispatch_queue)updateQueue;
- (SRAuthorizationStore)initWithSensors:(id)a3;
- (id)readerAuthorizationBundleIdValues;
- (uint64_t)updateOverrideOnAuthorizationChangeForService:(int)a3 withPendingValue:(uint64_t)a4 forBundleId:;
- (uint64_t)updateToNewAuthorizations:(void *)a3 fromOldAuthorizations:(void *)a4 delegates:;
- (void)addReaderAuthorizationDelegate:(id)a3;
- (void)addWriterAuthorizationDelegate:(id)a3;
- (void)dealloc;
- (void)listenForAuthorizationUpdates:(BOOL)a3;
- (void)removeReaderAuthorizationDelegate:(id)a3;
- (void)removeWriterAuthorizationDelegate:(id)a3;
- (void)resetAllAuthorizations;
- (void)resetAllAuthorizationsForBundleId:(id)a3;
- (void)resetAuthorizationForService:(id)a3 bundleId:(id)a4;
- (void)setReaderAuthorizationGroups:(id)a3;
- (void)setReaderAuthorizationValues:(id)a3;
- (void)setReaderLastModifiedAuthorizationTimes:(id)a3;
- (void)setSensorKitActive:(BOOL)a3;
- (void)setUpdateQueue:(id)a3;
- (void)setWriterAuthorizationGroups:(id)a3;
- (void)setWriterAuthorizationValues:(id)a3;
- (void)updateAuthorizations;
@end

@implementation SRAuthorizationStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogAuthorizationStore = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationStore");
  }
}

- (SRAuthorizationStore)initWithSensors:(id)a3
{
  block[16] = *MEMORY[0x263EF8340];
  v5 = objc_alloc_init(SRTCCStorePassThrough);
  if (self)
  {
    v32.receiver = self;
    v32.super_class = (Class)SRAuthorizationStore;
    v6 = [(SRAuthorizationStore *)&v32 init];
    if (v6)
    {
      v7 = v6;
      v6->_tccStore = (SRTCCStore *)v5;
      v7->_sensors = (NSSet *)a3;
      v8 = (void *)[MEMORY[0x263F088B0] weakObjectsHashTable];
      objc_setProperty_nonatomic(v7, v9, v8, 16);
      v10 = (void *)[MEMORY[0x263F088B0] weakObjectsHashTable];
      objc_setProperty_nonatomic(v7, v11, v10, 24);
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7->_updateQueue = (OS_dispatch_queue *)dispatch_queue_create("SRAuthorizationStore.updateQueue", v12);
      v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSSet count](v7->_sensors, "count"));
      v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSSet count](v7->_sensors, "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v30 = v7;
      sensors = v7->_sensors;
      uint64_t v15 = [(NSSet *)sensors countByEnumeratingWithState:&v33 objects:block count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(sensors);
            }
            uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x223C5D6B0]();
            id v21 = +[SRSensorDescription sensorDescriptionForSensor:v19];
            if (v21)
            {
              v22 = v21;
              uint64_t v23 = [v21 authorizationService];
              v24 = (void *)[v13 objectForKeyedSubscript:v23];
              if (!v24)
              {
                id v25 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                [v13 setObject:v25 forKeyedSubscript:v23];

                v24 = (void *)[v13 objectForKeyedSubscript:v23];
              }
              objc_msgSend(v24, "addObject:", objc_msgSend(v22, "name"));
              uint64_t v26 = [v22 writerAuthorizationService];
              if (v26) {
                objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(v22, "name"), v26);
              }
            }
            else
            {
              v27 = SRLogAuthorizationStore;
              if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v38 = v19;
                _os_log_fault_impl(&dword_21FCA3000, v27, OS_LOG_TYPE_FAULT, "No sensor description found for %{public}@", buf, 0xCu);
              }
            }
          }
          uint64_t v16 = [(NSSet *)sensors countByEnumeratingWithState:&v33 objects:block count:16];
        }
        while (v16);
      }
      self = v30;
      [(SRAuthorizationStore *)v30 setReaderAuthorizationGroups:v13];

      [(SRAuthorizationStore *)v30 setWriterAuthorizationGroups:v31];
      [(SRAuthorizationStore *)v30 listenForAuthorizationUpdates:1];
      v28 = [(SRAuthorizationStore *)v30 updateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__SRAuthorizationStore_startUpdatingAuthorizations__block_invoke;
      block[3] = &unk_26452E2C0;
      block[4] = v30;
      dispatch_sync(v28, block);
    }
    else
    {
      self = 0;
    }
  }

  return self;
}

+ (id)sharedAuthorizationStoreForSensors:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SRAuthorizationStore_sharedAuthorizationStoreForSensors___block_invoke;
  block[3] = &unk_26452E2C0;
  block[4] = a3;
  if (qword_26AB1A0B8 != -1) {
    dispatch_once(&qword_26AB1A0B8, block);
  }
  return (id)_MergedGlobals_2;
}

SRAuthorizationStore *__59__SRAuthorizationStore_sharedAuthorizationStoreForSensors___block_invoke(uint64_t a1)
{
  result = [[SRAuthorizationStore alloc] initWithSensors:*(void *)(a1 + 32)];
  _MergedGlobals_2 = (uint64_t)result;
  return result;
}

+ (SRAuthorizationStore)allSensorsStore
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v3 = (void *)MEMORY[0x223C5D6B0]();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = (void *)+[SRSensorsCache defaultCache]();
  v5 = -[SRSensorsCache allSensorDescriptions](v4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9++), "name", (void)v12));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  v10 = [[SRAuthorizationStore alloc] initWithSensors:v2];

  return v10;
}

- (void)dealloc
{
  [(SRAuthorizationStore *)self setReaderAuthorizationValues:0];
  [(SRAuthorizationStore *)self setWriterAuthorizationValues:0];
  [(SRAuthorizationStore *)self setReaderLastModifiedAuthorizationTimes:0];
  [(SRAuthorizationStore *)self setUpdateQueue:0];
  objc_setProperty_nonatomic(self, v3, 0, 16);
  objc_setProperty_nonatomic(self, v4, 0, 24);
  [(SRAuthorizationStore *)self listenForAuthorizationUpdates:0];
  objc_setProperty_nonatomic(self, v5, 0, 32);
  [(SRAuthorizationStore *)self setReaderAuthorizationGroups:0];
  [(SRAuthorizationStore *)self setWriterAuthorizationGroups:0];
  v6.receiver = self;
  v6.super_class = (Class)SRAuthorizationStore;
  [(SRAuthorizationStore *)&v6 dealloc];
}

- (void)listenForAuthorizationUpdates:(BOOL)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  p_int notifyToken = &self->_notifyToken;
  int notifyToken = self->_notifyToken;
  uint64_t v7 = SRLogAuthorizationStore;
  BOOL v8 = os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_INFO);
  if (a3)
  {
    if (notifyToken)
    {
      if (!v8) {
        return;
      }
      LOWORD(buf[0]) = 0;
      uint64_t v9 = "Asked to listen for TCC updates but we're already listening";
LABEL_36:
      _os_log_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)buf, 2u);
      return;
    }
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_INFO, "Registering for TCC updates", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    v10 = [(SRAuthorizationStore *)self updateQueue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __54__SRAuthorizationStore_listenForAuthorizationUpdates___block_invoke;
    handler[3] = &unk_26452E270;
    objc_copyWeak(&v34, buf);
    uint32_t v11 = notify_register_dispatch("com.apple.tcc.access.changed", p_notifyToken, (dispatch_queue_t)v10, handler);
    if (v11)
    {
      long long v12 = SRLogAuthorizationStore;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t v38 = 67240192;
        uint32_t v39 = v11;
        _os_log_fault_impl(&dword_21FCA3000, v12, OS_LOG_TYPE_FAULT, "Failed to register for TCC notifications.  Got status %{public}d", v38, 8u);
      }
      -[SRAuthorizationStore setReaderAuthorizationValues:](self, "setReaderAuthorizationValues:", [NSDictionary dictionary]);
      -[SRAuthorizationStore setReaderLastModifiedAuthorizationTimes:](self, "setReaderLastModifiedAuthorizationTimes:", [NSDictionary dictionary]);
      -[SRAuthorizationStore setWriterAuthorizationValues:](self, "setWriterAuthorizationValues:", [NSDictionary dictionary]);
      readerAuthorizationDelegates = self->_readerAuthorizationDelegates;
      objc_sync_enter(readerAuthorizationDelegates);
      long long v14 = (void *)[(NSHashTable *)self->_readerAuthorizationDelegates copy];
      objc_sync_exit(readerAuthorizationDelegates);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v18, "authorizationStore:didDetermineInitialAuthorizationValues:", self, -[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues"));
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v15);
      }

      writerAuthorizationDelegates = self->_writerAuthorizationDelegates;
      objc_sync_enter(writerAuthorizationDelegates);
      v20 = (void *)[(NSHashTable *)self->_writerAuthorizationDelegates copy];
      objc_sync_exit(writerAuthorizationDelegates);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v36 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(void **)(*((void *)&v25 + 1) + 8 * j);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v24, "authorizationStore:didDetermineInitialAuthorizationValues:", self, -[SRAuthorizationStore writerAuthorizationValues](self, "writerAuthorizationValues"));
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v36 count:16];
        }
        while (v21);
      }
    }
    objc_destroyWeak(&v34);
    objc_destroyWeak(buf);
  }
  else
  {
    if (!notifyToken)
    {
      if (!v8) {
        return;
      }
      LOWORD(buf[0]) = 0;
      uint64_t v9 = "Asked to stop listen for TCC updates but we are already not listening";
      goto LABEL_36;
    }
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_INFO, "Unregistering for TCC updates", (uint8_t *)buf, 2u);
      int notifyToken = *p_notifyToken;
    }
    notify_cancel(notifyToken);
    int *p_notifyToken = 0;
  }
}

void __54__SRAuthorizationStore_listenForAuthorizationUpdates___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  -[SRAuthorizationStore updateAuthorizations](Weak);
}

- (void)updateAuthorizations
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)[a1 updateQueue]);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v2 = _os_activity_create(&dword_21FCA3000, "Retrieving fresh authorizations from TCC", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);
  SEL v3 = SRLogAuthorizationStore;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_INFO, "Retrieving fresh authorizations from TCC", buf, 2u);
  }
  v96 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v133[0] = MEMORY[0x263EF8330];
  v133[1] = 3221225472;
  v134 = __64__SRAuthorizationStore_readerAuthorizationInformationForSensors__block_invoke;
  v135 = &unk_26452E330;
  v136 = v96;
  SEL v4 = (void *)[a1 readerAuthorizationGroups];
  long long v159 = 0u;
  long long v160 = 0u;
  memset(v158, 0, sizeof(v158));
  uint64_t v5 = [v4 countByEnumeratingWithState:v158 objects:buf count:16];
  v115 = (id *)a1;
  if (v5)
  {
    uint64_t v93 = **(void **)&v158[16];
    uint64_t v6 = MEMORY[0x263EFFA80];
    uint64_t v7 = MEMORY[0x263EFFA88];
    obuint64_t j = v4;
    do
    {
      uint64_t v99 = 0;
      uint64_t v88 = v5;
      do
      {
        if (**(void **)&v158[16] != v93) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*(void *)&v158[8] + 8 * v99);
        context = (void *)MEMORY[0x223C5D6B0]();
        id v103 = (id)[v115[4] bundleIdentifiersForService:v8];
        uint64_t v9 = [v115[4] bundleIdentifiersDisabledForService:v8];
        id v100 = (id)v9;
        if (v103) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
          uint32_t v11 = SRLogAuthorizationStore;
          if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v152 = 138543362;
            uint64_t v153 = v8;
            _os_log_impl(&dword_21FCA3000, v11, OS_LOG_TYPE_INFO, "Could not retrieve authorization information for TCC service %{public}@", v152, 0xCu);
          }
        }
        int v12 = [v115[4] isOverriddenForService:v8];
        long long v13 = SRLogAuthorizationStore;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v152 = 138543874;
          uint64_t v153 = v8;
          __int16 v154 = 1026;
          int v155 = v12;
          __int16 v156 = 2114;
          id v157 = v103;
          _os_log_impl(&dword_21FCA3000, v13, OS_LOG_TYPE_DEFAULT, "Authorized Bundle Ids for %{public}@, overridden %{public, BOOL}d, %{public}@", v152, 0x1Cu);
          long long v13 = SRLogAuthorizationStore;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v152 = 138543874;
          uint64_t v153 = v8;
          __int16 v154 = 1026;
          int v155 = v12;
          __int16 v156 = 2114;
          id v157 = v100;
          _os_log_impl(&dword_21FCA3000, v13, OS_LOG_TYPE_DEFAULT, "Deauthorized Bundle Ids for %{public}@, overridden %{public, BOOL}d, %{public}@", v152, 0x1Cu);
        }
        long long v14 = (void *)[obj objectForKeyedSubscript:v8];
        long long v150 = 0u;
        long long v151 = 0u;
        memset(v149, 0, sizeof(v149));
        uint64_t v15 = [v14 countByEnumeratingWithState:v149 objects:v165 count:16];
        if (v15)
        {
          uint64_t v16 = **(void **)&v149[16];
          if (v12) {
            uint64_t v17 = v7;
          }
          else {
            uint64_t v17 = v6;
          }
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (**(void **)&v149[16] != v16) {
                objc_enumerationMutation(v14);
              }
              objc_msgSend((id)v134((uint64_t)v133, @"com.apple.sensorkit.dummy-bundle-id"), "setObject:forKeyedSubscript:", v17, *(void *)(*(void *)&v149[8] + 8 * i));
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:v149 objects:v165 count:16];
          }
          while (v15);
        }
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        uint64_t v19 = [v103 countByEnumeratingWithState:&v129 objects:&v161 count:16];
        if (v19)
        {
          id v106 = *(id *)v130;
          do
          {
            v20 = 0;
            id v110 = (id)v19;
            do
            {
              if (*(id *)v130 != v106) {
                objc_enumerationMutation(v103);
              }
              uint64_t v21 = *(void *)(*((void *)&v129 + 1) + 8 * (void)v20);
              long long v125 = 0u;
              long long v126 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              uint64_t v22 = [v14 countByEnumeratingWithState:&v125 objects:&v145 count:16];
              if (v22)
              {
                uint64_t v23 = *(void *)v126;
                do
                {
                  for (uint64_t j = 0; j != v22; ++j)
                  {
                    if (*(void *)v126 != v23) {
                      objc_enumerationMutation(v14);
                    }
                    objc_msgSend((id)v134((uint64_t)v133, v21), "setObject:forKeyedSubscript:", v7, *(void *)(*((void *)&v125 + 1) + 8 * j));
                  }
                  uint64_t v22 = [v14 countByEnumeratingWithState:&v125 objects:&v145 count:16];
                }
                while (v22);
              }
              v20 = (char *)v20 + 1;
            }
            while (v20 != v110);
            uint64_t v19 = [v103 countByEnumeratingWithState:&v129 objects:&v161 count:16];
          }
          while (v19);
        }
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        uint64_t v25 = [v100 countByEnumeratingWithState:&v121 objects:&v141 count:16];
        if (v25)
        {
          id v107 = *(id *)v122;
          do
          {
            long long v26 = 0;
            id v111 = (id)v25;
            do
            {
              if (*(id *)v122 != v107) {
                objc_enumerationMutation(v100);
              }
              uint64_t v27 = *(void *)(*((void *)&v121 + 1) + 8 * (void)v26);
              long long v117 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v120 = 0u;
              uint64_t v28 = [v14 countByEnumeratingWithState:&v117 objects:&v137 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v118;
                do
                {
                  for (uint64_t k = 0; k != v28; ++k)
                  {
                    if (*(void *)v118 != v29) {
                      objc_enumerationMutation(v14);
                    }
                    objc_msgSend((id)v134((uint64_t)v133, v27), "setObject:forKeyedSubscript:", v6, *(void *)(*((void *)&v117 + 1) + 8 * k));
                  }
                  uint64_t v28 = [v14 countByEnumeratingWithState:&v117 objects:&v137 count:16];
                }
                while (v28);
              }
              long long v26 = (char *)v26 + 1;
            }
            while (v26 != v111);
            uint64_t v25 = [v100 countByEnumeratingWithState:&v121 objects:&v141 count:16];
          }
          while (v25);
        }
        ++v99;
      }
      while (v99 != v88);
      uint64_t v5 = [obj countByEnumeratingWithState:v158 objects:buf count:16];
    }
    while (v5);
  }
  v86 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:", objc_msgSend(v115, "readerAuthorizationValues"));
  [v115 setReaderAuthorizationValues:v96];
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v31 = (void *)[v115 readerAuthorizationValues];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v161 objects:buf count:16];
  if (v32)
  {
    id v112 = v31;
    char v33 = 0;
    uint64_t v34 = *(void *)v162;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v162 != v34) {
          objc_enumerationMutation(v112);
        }
        uint64_t v36 = *(void *)(*((void *)&v161 + 1) + 8 * m);
        long long v145 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        v37 = objc_msgSend((id)objc_msgSend(v115, "readerAuthorizationValues"), "objectForKeyedSubscript:", v36);
        uint64_t v38 = [v37 countByEnumeratingWithState:&v145 objects:v165 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v146;
          while (2)
          {
            for (uint64_t n = 0; n != v38; ++n)
            {
              if (*(void *)v146 != v39) {
                objc_enumerationMutation(v37);
              }
              if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v115, "readerAuthorizationValues"), "objectForKeyedSubscript:", v36), "objectForKeyedSubscript:", *(void *)(*((void *)&v145 + 1) + 8 * n)), "BOOLValue"))
              {
                char v33 = 1;
                goto LABEL_74;
              }
            }
            uint64_t v38 = [v37 countByEnumeratingWithState:&v145 objects:v165 count:16];
            if (v38) {
              continue;
            }
            break;
          }
        }
LABEL_74:
        ;
      }
      uint64_t v32 = [v112 countByEnumeratingWithState:&v161 objects:buf count:16];
    }
    while (v32);
  }
  else
  {
    char v33 = 0;
  }
  v41 = v115;
  [v115 setSensorKitActive:v33 & 1];
  id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  v43 = (void *)[v115 readerAuthorizationValues];
  uint64_t v89 = [v43 countByEnumeratingWithState:&v145 objects:buf count:16];
  if (!v89) {
    goto LABEL_110;
  }
  contexta = *(void **)v146;
  v87 = v43;
  do
  {
    for (iuint64_t i = 0; ii != v89; ++ii)
    {
      if (*(void **)v146 != contexta) {
        objc_enumerationMutation(v87);
      }
      uint64_t v44 = *(void *)(*((void *)&v145 + 1) + 8 * ii);
      v92 = (void *)MEMORY[0x223C5D6B0]();
      v45 = (void *)[v115[4] informationForBundleId:v44];
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v141 objects:v165 count:16];
      if (v46)
      {
        id v101 = v45;
        id v104 = *(id *)v142;
        do
        {
          v108 = (char *)v46;
          v47 = 0;
          do
          {
            if (*(id *)v142 != v104) {
              objc_enumerationMutation(v45);
            }
            v48 = *(void **)(*((void *)&v141 + 1) + 8 * (void)v47);
            uint64_t v49 = [v48 objectForKeyedSubscript:*MEMORY[0x263F7C4E8]];
            v113 = v47;
            if (!v49)
            {
              uint64_t v58 = SRLogAuthorizationStore;
              if (!os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_ERROR)) {
                goto LABEL_103;
              }
              *(_DWORD *)v158 = 138543362;
              *(void *)&v158[4] = v48;
              v59 = v58;
              v60 = "Couldn't find a TCC service in the TCC access dictionary %{public}@";
              uint32_t v61 = 12;
LABEL_106:
              _os_log_error_impl(&dword_21FCA3000, v59, OS_LOG_TYPE_ERROR, v60, v158, v61);
              goto LABEL_103;
            }
            v50 = (void *)[v48 objectForKeyedSubscript:*MEMORY[0x263F7C4E0]];
            if (!v50)
            {
              uint64_t v62 = SRLogAuthorizationStore;
              if (!os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_ERROR)) {
                goto LABEL_103;
              }
              *(_DWORD *)v158 = 138543618;
              *(void *)&v158[4] = v44;
              *(_WORD *)&v158[12] = 2114;
              *(void *)&v158[14] = v49;
              v59 = v62;
              v60 = "No last modified date for authorization of bundle %{public}@, service: %{public}@";
              uint32_t v61 = 22;
              goto LABEL_106;
            }
            if (![v42 objectForKeyedSubscript:v44])
            {
              id v51 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              [v42 setObject:v51 forKeyedSubscript:v44];
            }
            long long v139 = 0u;
            long long v140 = 0u;
            long long v137 = 0u;
            long long v138 = 0u;
            v52 = objc_msgSend((id)objc_msgSend(v115, "readerAuthorizationGroups"), "objectForKeyedSubscript:", v49);
            uint64_t v53 = [v52 countByEnumeratingWithState:&v137 objects:&v161 count:16];
            if (v53)
            {
              uint64_t v54 = *(void *)v138;
              do
              {
                for (juint64_t j = 0; jj != v53; ++jj)
                {
                  if (*(void *)v138 != v54) {
                    objc_enumerationMutation(v52);
                  }
                  uint64_t v56 = *(void *)(*((void *)&v137 + 1) + 8 * jj);
                  v57 = NSNumber;
                  [v50 timeIntervalSinceReferenceDate];
                  objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", v44), "setObject:forKeyedSubscript:", objc_msgSend(v57, "numberWithDouble:"), v56);
                }
                uint64_t v53 = [v52 countByEnumeratingWithState:&v137 objects:&v161 count:16];
              }
              while (v53);
            }
LABEL_103:
            v47 = v113 + 1;
            v45 = v101;
          }
          while (v113 + 1 != v108);
          uint64_t v46 = [v101 countByEnumeratingWithState:&v141 objects:v165 count:16];
        }
        while (v46);
      }
    }
    v41 = v115;
    uint64_t v89 = [v87 countByEnumeratingWithState:&v145 objects:buf count:16];
  }
  while (v89);
LABEL_110:
  [v41 setReaderLastModifiedAuthorizationTimes:v42];

  id v63 = v41[2];
  objc_sync_enter(v63);
  v64 = (void *)[v41[2] copy];
  objc_sync_exit(v63);
  -[SRAuthorizationStore updateToNewAuthorizations:fromOldAuthorizations:delegates:]((uint64_t)v41, v96, v86, v64);

  id v65 = v41[3];
  objc_sync_enter(v65);
  v97 = (void *)[v41[3] copy];
  objc_sync_exit(v65);
  uint64_t v66 = [MEMORY[0x263EFF9A0] dictionary];
  *(void *)v158 = MEMORY[0x263EF8330];
  *(void *)&v158[8] = 3221225472;
  *(void *)&v158[16] = __64__SRAuthorizationStore_writerAuthorizationInformationForSensors__block_invoke;
  *(void *)&v158[24] = &unk_26452E330;
  *(void *)&long long v159 = v66;
  v67 = (void *)[v41 writerAuthorizationGroups];
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v145 objects:buf count:16];
  v95 = (void *)v66;
  if (v68)
  {
    id v102 = *(id *)v146;
    uint64_t v69 = MEMORY[0x263EFFA80];
    uint64_t v70 = MEMORY[0x263EFFA88];
    id v109 = v67;
    do
    {
      v71 = 0;
      id v105 = (id)v68;
      do
      {
        if (*(id *)v146 != v102) {
          objc_enumerationMutation(v109);
        }
        uint64_t v72 = *(void *)(*((void *)&v145 + 1) + 8 * (void)v71);
        id v114 = (id)MEMORY[0x223C5D6B0]();
        v73 = (void *)[v115[4] bundleIdentifiersForService:v72];
        uint64_t v74 = [v115[4] bundleIdentifiersDisabledForService:v72];
        v75 = (void *)v74;
        v76 = SRLogAuthorizationStore;
        if (v73) {
          BOOL v77 = v74 == 0;
        }
        else {
          BOOL v77 = 1;
        }
        if (v77 && os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v149 = 138543362;
          *(void *)&v149[4] = v72;
          _os_log_impl(&dword_21FCA3000, v76, OS_LOG_TYPE_INFO, "Could not retrieve authorization information for TCC service %{public}@", v149, 0xCu);
          v76 = SRLogAuthorizationStore;
        }
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v149 = 138543618;
          *(void *)&v149[4] = v72;
          *(_WORD *)&v149[12] = 2114;
          *(void *)&v149[14] = v73;
          _os_log_impl(&dword_21FCA3000, v76, OS_LOG_TYPE_DEFAULT, "Authorized Bundle Ids for %{public}@, %{public}@", v149, 0x16u);
          v76 = SRLogAuthorizationStore;
        }
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v149 = 138543618;
          *(void *)&v149[4] = v72;
          *(_WORD *)&v149[12] = 2114;
          *(void *)&v149[14] = v75;
          _os_log_impl(&dword_21FCA3000, v76, OS_LOG_TYPE_DEFAULT, "Deauthorized Bundle Ids for %{public}@, %{public}@", v149, 0x16u);
        }
        uint64_t v78 = [v109 objectForKeyedSubscript:v72];
        long long v143 = 0u;
        long long v144 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        uint64_t v79 = [v73 countByEnumeratingWithState:&v141 objects:v165 count:16];
        if (v79)
        {
          uint64_t v80 = *(void *)v142;
          do
          {
            for (kuint64_t k = 0; kk != v79; ++kk)
            {
              if (*(void *)v142 != v80) {
                objc_enumerationMutation(v73);
              }
              objc_msgSend((id)(*(uint64_t (**)(uint8_t *, void))&v158[16])(v158, *(void *)(*((void *)&v141 + 1) + 8 * kk)), "setObject:forKeyedSubscript:", v70, v78);
            }
            uint64_t v79 = [v73 countByEnumeratingWithState:&v141 objects:v165 count:16];
          }
          while (v79);
        }
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        uint64_t v82 = [v75 countByEnumeratingWithState:&v137 objects:&v161 count:16];
        if (v82)
        {
          uint64_t v83 = *(void *)v138;
          do
          {
            for (muint64_t m = 0; mm != v82; ++mm)
            {
              if (*(void *)v138 != v83) {
                objc_enumerationMutation(v75);
              }
              objc_msgSend((id)(*(uint64_t (**)(uint8_t *, void))&v158[16])(v158, *(void *)(*((void *)&v137 + 1) + 8 * mm)), "setObject:forKeyedSubscript:", v69, v78);
            }
            uint64_t v82 = [v75 countByEnumeratingWithState:&v137 objects:&v161 count:16];
          }
          while (v82);
        }
        v71 = (char *)v71 + 1;
      }
      while (v71 != v105);
      uint64_t v68 = [v109 countByEnumeratingWithState:&v145 objects:buf count:16];
    }
    while (v68);
  }
  v85 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:", objc_msgSend(v115, "writerAuthorizationValues"));
  [v115 setWriterAuthorizationValues:v95];
  -[SRAuthorizationStore updateToNewAuthorizations:fromOldAuthorizations:delegates:]((uint64_t)v115, v95, v85, v97);

  os_activity_scope_leave(&state);
}

void __51__SRAuthorizationStore_startUpdatingAuthorizations__block_invoke(uint64_t a1)
{
}

- (uint64_t)updateToNewAuthorizations:(void *)a3 fromOldAuthorizations:(void *)a4 delegates:
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = a3;
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithArray:", objc_msgSend(a3, "allKeys"));
    objc_msgSend(v7, "unionSet:", objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend(a2, "allKeys")));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = v7;
    uint64_t result = [v7 countByEnumeratingWithState:&v60 objects:v75 count:16];
    uint64_t v45 = result;
    if (result)
    {
      uint64_t v41 = *(void *)v61;
      *(void *)&long long v9 = 138543618;
      long long v39 = v9;
      v43 = a2;
      uint64_t v44 = a4;
      id v42 = v6;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v61 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v47 = v10;
          uint64_t v11 = *(void *)(*((void *)&v60 + 1) + 8 * v10);
          int v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, v39);
          long long v13 = (void *)[a2 objectForKeyedSubscript:v11];
          id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          uint64_t v15 = [v13 countByEnumeratingWithState:&v56 objects:v74 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v57;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v57 != v17) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v19 = *(void *)(*((void *)&v56 + 1) + 8 * i);
                v20 = (void *)[v13 objectForKeyedSubscript:v19];
                uint64_t v21 = (void *)[v12 objectForKeyedSubscript:v19];
                if ([v20 BOOLValue] && !objc_msgSend(v21, "BOOLValue")
                  || v20 && ([v20 BOOLValue] & 1) == 0 && !v21)
                {
                  [v14 addObject:v19];
                }
              }
              uint64_t v16 = [v13 countByEnumeratingWithState:&v56 objects:v74 count:16];
            }
            while (v16);
          }
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v22 = [v12 countByEnumeratingWithState:&v52 objects:v73 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v53 != v24) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v26 = *(void *)(*((void *)&v52 + 1) + 8 * j);
                uint64_t v27 = [v13 objectForKeyedSubscript:v26];
                if (v27)
                {
                  uint64_t v28 = (void *)v27;
                  if ((objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v26), "BOOLValue") & 1) == 0)
                  {
                    if ([v12 objectForKeyedSubscript:v26]) {
                      continue;
                    }
                  }
                  if ([v28 BOOLValue]) {
                    continue;
                  }
                }
                [v14 addObject:v26];
              }
              uint64_t v23 = [v12 countByEnumeratingWithState:&v52 objects:v73 count:16];
            }
            while (v23);
          }
          a2 = v43;
          if ([v14 count])
          {
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            uint64_t v29 = [v44 countByEnumeratingWithState:&v48 objects:v72 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v49;
              do
              {
                for (uint64_t k = 0; k != v30; ++k)
                {
                  if (*(void *)v49 != v31) {
                    objc_enumerationMutation(v44);
                  }
                  char v33 = *(void **)(*((void *)&v48 + 1) + 8 * k);
                  if (objc_opt_respondsToSelector()) {
                    [v33 authorizationStore:a1 didUpdateAuthorizationsForBundleId:v11 sensors:v14];
                  }
                }
                uint64_t v30 = [v44 countByEnumeratingWithState:&v48 objects:v72 count:16];
              }
              while (v30);
            }
            uint64_t v34 = SRLogAuthorizationStore;
            if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v39;
              uint64_t v69 = v11;
              __int16 v70 = 2114;
              id v71 = v14;
              _os_log_impl(&dword_21FCA3000, v34, OS_LOG_TYPE_DEFAULT, "Authorization Changed for bundle id %{public}@ for sensors %{public}@", buf, 0x16u);
            }
          }

          uint64_t v10 = v47 + 1;
          uint64_t v6 = v42;
        }
        while (v47 + 1 != v45);
        uint64_t result = [obj countByEnumeratingWithState:&v60 objects:v75 count:16];
        uint64_t v45 = result;
      }
      while (result);
    }
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t result = [a4 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (result)
    {
      uint64_t v35 = result;
      uint64_t v36 = *(void *)v65;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v65 != v36) {
            objc_enumerationMutation(a4);
          }
          uint64_t v38 = *(void **)(*((void *)&v64 + 1) + 8 * v37);
          if (objc_opt_respondsToSelector()) {
            [v38 authorizationStore:a1 didDetermineInitialAuthorizationValues:a2];
          }
          ++v37;
        }
        while (v35 != v37);
        uint64_t result = [a4 countByEnumeratingWithState:&v64 objects:v76 count:16];
        uint64_t v35 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)addReaderAuthorizationDelegate:(id)a3
{
  if (self)
  {
    readerAuthorizationDelegates = self->_readerAuthorizationDelegates;
    objc_sync_enter(readerAuthorizationDelegates);
    uint64_t v6 = self->_readerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    readerAuthorizationDelegates = 0;
    uint64_t v6 = 0;
  }
  [(NSHashTable *)v6 addObject:a3];
  if ([(SRAuthorizationStore *)self readerAuthorizationValues]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "authorizationStore:didDetermineInitialAuthorizationValues:", self, -[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues"));
  }

  objc_sync_exit(readerAuthorizationDelegates);
}

- (void)removeReaderAuthorizationDelegate:(id)a3
{
  if (self)
  {
    readerAuthorizationDelegates = self->_readerAuthorizationDelegates;
    objc_sync_enter(readerAuthorizationDelegates);
    uint64_t v6 = self->_readerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    readerAuthorizationDelegates = 0;
    uint64_t v6 = 0;
  }
  [(NSHashTable *)v6 removeObject:a3];

  objc_sync_exit(readerAuthorizationDelegates);
}

- (void)addWriterAuthorizationDelegate:(id)a3
{
  if (self)
  {
    writerAuthorizationDelegates = self->_writerAuthorizationDelegates;
    objc_sync_enter(writerAuthorizationDelegates);
    uint64_t v6 = self->_writerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    writerAuthorizationDelegates = 0;
    uint64_t v6 = 0;
  }
  [(NSHashTable *)v6 addObject:a3];
  if ([(SRAuthorizationStore *)self writerAuthorizationValues]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "authorizationStore:didDetermineInitialAuthorizationValues:", self, -[SRAuthorizationStore writerAuthorizationValues](self, "writerAuthorizationValues"));
  }

  objc_sync_exit(writerAuthorizationDelegates);
}

- (void)removeWriterAuthorizationDelegate:(id)a3
{
  if (self)
  {
    writerAuthorizationDelegates = self->_writerAuthorizationDelegates;
    objc_sync_enter(writerAuthorizationDelegates);
    uint64_t v6 = self->_writerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    writerAuthorizationDelegates = 0;
    uint64_t v6 = 0;
  }
  [(NSHashTable *)v6 removeObject:a3];

  objc_sync_exit(writerAuthorizationDelegates);
}

- (BOOL)sensorHasReaderAuthorization:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(SRAuthorizationStore *)self readerAuthorizationBundleIdValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([(SRAuthorizationStore *)self sensorHasReaderAuthorization:a3 forBundleId:*(void *)(*((void *)&v11 + 1) + 8 * v9)])
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (BOOL)sensorHasReaderAuthorization:(id)a3 forBundleId:(id)a4
{
  SEL v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues"), "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", a3);

  return [v4 BOOLValue];
}

- (uint64_t)updateOverrideOnAuthorizationChangeForService:(int)a3 withPendingValue:(uint64_t)a4 forBundleId:
{
  uint64_t result = 0;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v6 = a2;
    if (a2)
    {
      if (a3)
      {
        uint64_t v7 = (void *)a1[4];
        return [v7 setOverride:1 forService:a2];
      }
      else
      {
        uint64_t v22 = a1;
        uint64_t v9 = (void *)[a1 readerAuthorizationBundleIdValues];
        id v10 = +[SRSensorDescription sensorDescriptionsForAuthorizationService:v6];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (!v11) {
          return [(id)v22[4] setOverride:0 forService:v6];
        }
        uint64_t v12 = v11;
        uint64_t v21 = v6;
        char v23 = 0;
        uint64_t v13 = *(void *)v31;
        uint64_t v24 = *(void *)v31;
        do
        {
          uint64_t v14 = 0;
          uint64_t v25 = v12;
          do
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
            if (([v15 isEqualToString:a4] & 1) == 0)
            {
              long long v28 = 0u;
              long long v29 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              uint64_t v16 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = a4;
                uint64_t v19 = *(void *)v27;
                while (2)
                {
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v27 != v19) {
                      objc_enumerationMutation(v10);
                    }
                    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v15), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "name")), "BOOLValue"))
                    {
                      char v23 = 1;
                      goto LABEL_23;
                    }
                  }
                  uint64_t v17 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
                  if (v17) {
                    continue;
                  }
                  break;
                }
LABEL_23:
                a4 = v18;
                uint64_t v13 = v24;
                uint64_t v12 = v25;
              }
            }
            ++v14;
          }
          while (v14 != v12);
          uint64_t v12 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v12);
        uint64_t v6 = v21;
        if (v23) {
          return 1;
        }
        else {
          return [(id)v22[4] setOverride:0 forService:v6];
        }
      }
    }
  }
  return result;
}

- (void)resetAllAuthorizationsForBundleId:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = [(NSDictionary *)[(SRAuthorizationStore *)self readerAuthorizationValues] objectForKeyedSubscript:a3];
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 138412546;
    long long v14 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x223C5D6B0]();
        uint64_t v12 = objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v10), "authorizationService");
        uint64_t v13 = SRLogAuthorizationStore;
        if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          id v21 = a3;
          __int16 v22 = 2112;
          uint64_t v23 = v12;
          _os_log_impl(&dword_21FCA3000, v13, OS_LOG_TYPE_DEFAULT, "reset reader authorization for bundle %@ service %@", buf, 0x16u);
        }
        -[SRTCCStore resetService:forBundleId:](self->_tccStore, "resetService:forBundleId:", v12, a3, v14);
        -[SRAuthorizationStore updateOverrideOnAuthorizationChangeForService:withPendingValue:forBundleId:](self, v12, 0, (uint64_t)a3);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)resetAllAuthorizations
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  SEL v3 = (void *)[MEMORY[0x263EFF9C0] set];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  long long v16 = __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke;
  long long v17 = &unk_26452E2E8;
  long long v18 = v3;
  __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke((uint64_t)v15, [(SRAuthorizationStore *)self readerAuthorizationBundleIdValues], (uint64_t)&__block_literal_global_2);
  SEL v4 = [(SRAuthorizationStore *)self writerAuthorizationValues];
  v16((uint64_t)v15, v4, (uint64_t)&__block_literal_global_25);
  uint64_t v5 = SRLogAuthorizationStore;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v3;
    _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_DEFAULT, "reset authorization for services %@", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [(SRTCCStore *)self->_tccStore resetService:v10];
        [(SRTCCStore *)self->_tccStore setOverride:0 forService:v10];
      }
      uint64_t v7 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  uint64_t v17 = result;
  if (result)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(a2);
        }
        uint64_t v19 = v6;
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * v6);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v8 = objc_msgSend(a2, "objectForKeyedSubscript:", v7, v16);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v21;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
              long long v14 = (void *)MEMORY[0x223C5D6B0]();
              id v15 = +[SRSensorDescription sensorDescriptionForSensor:v13];
              if (v15) {
                objc_msgSend(*(id *)(a1 + 32), "addObject:", (*(uint64_t (**)(uint64_t, id))(a3 + 16))(a3, v15));
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v10);
        }
        uint64_t v6 = v19 + 1;
      }
      while (v19 + 1 != v17);
      uint64_t result = [a2 countByEnumeratingWithState:&v24 objects:v29 count:16];
      uint64_t v17 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 authorizationService];
}

uint64_t __46__SRAuthorizationStore_resetAllAuthorizations__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 writerAuthorizationService];
}

- (void)resetAuthorizationForService:(id)a3 bundleId:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v7 = SRLogAuthorizationStore;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = a3;
    __int16 v10 = 2114;
    id v11 = a4;
    _os_log_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_DEFAULT, "Reset authorization for service %@ and bundle id: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(SRTCCStore *)self->_tccStore resetService:a3 forBundleId:a4];
  -[SRAuthorizationStore updateOverrideOnAuthorizationChangeForService:withPendingValue:forBundleId:](self, (uint64_t)a3, 0, (uint64_t)a4);
}

- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5
{
  return [(SRAuthorizationStore *)self setAuthorizationForBundleId:a3 service:a4 value:a5 setOverride:1];
}

- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5 setOverride:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v11 = [a3 length];
  if (v11)
  {
    uint64_t v11 = [a4 length];
    if (v11)
    {
      if ([a3 isEqualToString:@"com.apple.private.SensorKit._compositeBundle"])
      {
        uint64_t v12 = SRLogAuthorizationStore;
        LODWORD(v11) = os_log_type_enabled((os_log_t)SRLogAuthorizationStore, OS_LOG_TYPE_FAULT);
        if (v11)
        {
          int v15 = 138543362;
          uint64_t v16 = @"com.apple.private.SensorKit._compositeBundle";
          _os_log_fault_impl(&dword_21FCA3000, v12, OS_LOG_TYPE_FAULT, "Setting authorization for %{public}@ is not allowed", (uint8_t *)&v15, 0xCu);
          LOBYTE(v11) = 0;
        }
      }
      else
      {
        int v13 = [(SRTCCStore *)self->_tccStore setValue:v7 forService:a4 bundleId:a3];
        LOBYTE(v11) = !a6 & v13;
        if (a6 && v13)
        {
          LOBYTE(v11) = -[SRAuthorizationStore updateOverrideOnAuthorizationChangeForService:withPendingValue:forBundleId:](self, (uint64_t)a4, v7, (uint64_t)a3);
        }
      }
    }
  }
  return v11;
}

uint64_t __64__SRAuthorizationStore_readerAuthorizationInformationForSensors__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:a2];
  }
  return v4;
}

uint64_t __64__SRAuthorizationStore_writerAuthorizationInformationForSensors__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:a2];
  }
  return v4;
}

- (id)readerAuthorizationBundleIdValues
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [(SRAuthorizationStore *)self readerAuthorizationValues];
  SEL v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](v2, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(NSDictionary *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 isEqualToString:@"com.apple.sensorkit.dummy-bundle-id"] & 1) == 0) {
          objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v8), v8);
        }
      }
      uint64_t v5 = [(NSDictionary *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return (id)[NSDictionary dictionaryWithDictionary:v3];
}

- (BOOL)checkAccessForService:(id)a3 auditToken:(id *)a4
{
  tccStore = self->_tccStore;
  long long v5 = *(_OWORD *)&a4->var0[4];
  v7[0] = *(_OWORD *)a4->var0;
  v7[1] = v5;
  return [(SRTCCStore *)tccStore checkAccessForService:a3 auditToken:v7];
}

- (NSDictionary)readerAuthorizationValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReaderAuthorizationValues:(id)a3
{
}

- (NSDictionary)readerLastModifiedAuthorizationTimes
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setReaderLastModifiedAuthorizationTimes:(id)a3
{
}

- (NSDictionary)writerAuthorizationValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWriterAuthorizationValues:(id)a3
{
}

- (BOOL)sensorKitActive
{
  return self->_sensorKitActive;
}

- (void)setSensorKitActive:(BOOL)a3
{
  self->_sensorKitActive = a3;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (NSDictionary)readerAuthorizationGroups
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReaderAuthorizationGroups:(id)a3
{
}

- (NSDictionary)writerAuthorizationGroups
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWriterAuthorizationGroups:(id)a3
{
}

@end