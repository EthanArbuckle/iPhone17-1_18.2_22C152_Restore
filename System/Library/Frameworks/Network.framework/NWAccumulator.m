@interface NWAccumulator
- (NSArray)accumulations;
- (NSMutableArray)accumulatedValues;
- (NSString)name;
- (NWAccumulator)initWithName:(id)a3;
- (NWAccumulator)lastSnapshot;
- (id)accumulatedValueForObject:(id)a3 andKeyPath:(id)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (id)snapshot;
- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5;
- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerObserverForKeyPath:(id)a3 ofObject:(id)a4 alreadyRegistered:(BOOL)a5;
- (void)reset;
- (void)setAccumulatedValues:(id)a3;
- (void)setLastSnapshot:(id)a3;
- (void)setName:(id)a3;
@end

@implementation NWAccumulator

void __41__NWAccumulator_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v13 + 1) + 8 * v5);
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v8 = [v6 accumulation];
        v9 = [v8 name];
        [v7 setObject:v9 forKeyedSubscript:@"name"];

        v10 = [v6 accumulation];
        v11 = [v10 durations];
        [v7 setObject:v11 forKeyedSubscript:@"durations"];

        [*(id *)(a1 + 40) addObject:v7];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = a4;
  id v11 = a5;
  v12 = [(NWAccumulator *)self accumulatedValueForObject:v10 andKeyPath:v9];
  if (v12)
  {
    long long v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    long long v14 = [v12 callback];
    long long v15 = ((void (**)(void, NSObject *))v14)[2](v14, v13);

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    long long v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136447490;
      v19 = "-[NWAccumulator observeValueForKeyPath:ofObject:change:context:]";
      __int16 v20 = 2112;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v13;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      v27 = v10;
      __int16 v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEBUG, "%{public}s %@ observing value %@ for keyPath %@ of object %@, state: %@", (uint8_t *)&v18, 0x3Eu);
    }

    if (v15)
    {
      v17 = [v12 accumulation];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      objc_msgSend(v17, "updateWithState:atTime:", v15);
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    long long v13 = (id)gLogObj;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446722;
      v19 = "-[NWAccumulator observeValueForKeyPath:ofObject:change:context:]";
      __int16 v20 = 2112;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_ERROR, "%{public}s %@ did not find value for object: %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (id)accumulatedValueForObject:(id)a3 andKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__1674;
  v21 = __Block_byref_object_dispose__1675;
  id v22 = 0;
  p_lock = &self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__NWAccumulator_accumulatedValueForObject_andKeyPath___block_invoke;
  v13[3] = &unk_1E5241D28;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  long long v16 = &v17;
  os_unfair_lock_lock(p_lock);
  __54__NWAccumulator_accumulatedValueForObject_andKeyPath___block_invoke(v13);
  os_unfair_lock_unlock(p_lock);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __54__NWAccumulator_accumulatedValueForObject_andKeyPath___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_4:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
      v8 = objc_msgSend(v7, "object", (void)v12);
      id v9 = v8;
      if (v8 == (void *)a1[5])
      {
        id v10 = [v7 keyPath];
        int v11 = [v10 isEqualToString:a1[6]];

        if (v11)
        {
          objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v7);
          break;
        }
      }
      else
      {
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (!v4) {
          break;
        }
        goto LABEL_4;
      }
    }
  }
}

- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = (NWAccumulator *)a3;
  id v11 = a4;
  long long v12 = (NWAccumulator *)a5;
  id v13 = a6;
  long long v14 = v13;
  if (v10 && v12 && v13)
  {
    uint64_t v15 = [(NWAccumulator *)self accumulatedValueForObject:v10 andKeyPath:v12];
    if (v15)
    {
      long long v16 = v15;
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v17 = (id)gLogObj;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447234;
        uint64_t v30 = "-[NWAccumulator addAccumulation:withName:forKey:stateCallback:]";
        __int16 v31 = 2112;
        v32 = v10;
        __int16 v33 = 2112;
        v34 = v12;
        __int16 v35 = 2112;
        p_super = v16;
        __int16 v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_1830D4000, v17, OS_LOG_TYPE_INFO, "%{public}s Existing NWAccumulatedValue for object: %@ and keyPath: %@: %@, resetting %@", buf, 0x34u);
      }

      [v16 setCallback:v14];
      int v18 = [v16 accumulation];
      [v18 reset];

      [(NWAccumulator *)self registerObserverForKeyPath:v12 ofObject:v10 alreadyRegistered:1];
    }
    else
    {
      __int16 v20 = objc_alloc_init(NWAccumulatedValue);
      [(NWAccumulatedValue *)v20 setObject:v10];
      [(NWAccumulatedValue *)v20 setKeyPath:v12];
      [(NWAccumulatedValue *)v20 setCallback:v14];
      v21 = [[NWAccumulation alloc] initWithName:v11];
      [(NWAccumulatedValue *)v20 setAccumulation:v21];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      id v25 = __63__NWAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke;
      __int16 v26 = &unk_1E524B9A0;
      v27 = self;
      __int16 v28 = v20;
      id v22 = v20;
      os_unfair_lock_lock(&self->_lock);
      __63__NWAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke((uint64_t)&v23);
      os_unfair_lock_unlock(&self->_lock);
      -[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:](self, "registerObserverForKeyPath:ofObject:alreadyRegistered:", v12, v10, 0, v23, v24);

      long long v16 = 0;
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    long long v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (NWAccumulator *)_Block_copy(v14);
      *(_DWORD *)buf = 136447234;
      uint64_t v30 = "-[NWAccumulator addAccumulation:withName:forKey:stateCallback:]";
      __int16 v31 = 2112;
      v32 = self;
      __int16 v33 = 2112;
      v34 = v10;
      __int16 v35 = 2112;
      p_super = &v12->super;
      __int16 v37 = 2112;
      v38 = v19;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_ERROR, "%{public}s %@ invalid value passed to addAccumulation: object (%@), key (%@), callback (%@)", buf, 0x34u);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(NWAccumulator *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __41__NWAccumulator_dictionaryRepresentation__block_invoke;
  long long v12 = &unk_1E524B9A0;
  p_lock = &self->_lock;
  id v13 = self;
  id v14 = v5;
  id v7 = v5;
  os_unfair_lock_lock(p_lock);
  __41__NWAccumulator_dictionaryRepresentation__block_invoke((uint64_t)&v9);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, @"durations", v9, v10);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedValues, 0);
  objc_storeStrong((id *)&self->_lastSnapshot, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAccumulatedValues:(id)a3
{
}

- (NSMutableArray)accumulatedValues
{
  return self->_accumulatedValues;
}

- (void)setLastSnapshot:(id)a3
{
}

- (NWAccumulator)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setName:(id)a3
{
}

- (id)snapshot
{
  id v3 = [NWAccumulator alloc];
  uint64_t v4 = [(NWAccumulator *)self name];
  id v5 = [(NWAccumulator *)v3 initWithName:v4];

  p_lock = &self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __25__NWAccumulator_snapshot__block_invoke;
  v11[3] = &unk_1E524B9A0;
  v11[4] = self;
  id v7 = v5;
  long long v12 = v7;
  os_unfair_lock_lock(p_lock);
  __25__NWAccumulator_snapshot__block_invoke((uint64_t)v11);
  os_unfair_lock_unlock(p_lock);
  v8 = v12;
  uint64_t v9 = v7;

  return v9;
}

void __25__NWAccumulator_snapshot__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "snapshot", (void)v9);
        v8 = [*(id *)(a1 + 40) accumulatedValues];
        [v8 addObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)reset
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NWAccumulator *)self snapshot];
  [(NWAccumulator *)self setLastSnapshot:v3];

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v4 = (id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(NWAccumulator *)self lastSnapshot];
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[NWAccumulator reset]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_INFO, "%{public}s Reset, saved snapshot: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v21 = __Block_byref_object_copy__1674;
  id v22 = __Block_byref_object_dispose__1675;
  id v23 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __22__NWAccumulator_reset__block_invoke;
  v18[3] = &unk_1E524B978;
  v18[4] = self;
  v18[5] = buf;
  os_unfair_lock_lock(&self->_lock);
  __22__NWAccumulator_reset__block_invoke((uint64_t)v18);
  os_unfair_lock_unlock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(*(void *)&buf[8] + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "accumulation", (void)v14);
        [v11 reset];

        long long v12 = [v10 keyPath];
        id v13 = [v10 object];
        [(NWAccumulator *)self registerObserverForKeyPath:v12 ofObject:v13 alreadyRegistered:1];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(buf, 8);
}

void __22__NWAccumulator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) mutableCopy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)registerObserverForKeyPath:(id)a3 ofObject:(id)a4 alreadyRegistered:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v10 = v9;
  if (!v8)
  {
    long long v11 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
    long long v12 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (!__nwlog_fault(v12, &v27, &v26)) {
      goto LABEL_34;
    }
    if (v27 == OS_LOG_TYPE_FAULT)
    {
      id v13 = __nwlog_obj();
      os_log_type_t v14 = v27;
      if (os_log_type_enabled(v13, v27))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        long long v15 = "%{public}s called with null keyPath";
LABEL_32:
        _os_log_impl(&dword_1830D4000, v13, v14, v15, buf, 0xCu);
      }
    }
    else if (v26)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      id v13 = __nwlog_obj();
      os_log_type_t v14 = v27;
      BOOL v18 = os_log_type_enabled(v13, v27);
      if (backtrace_string)
      {
        if (v18)
        {
          *(_DWORD *)buf = 136446466;
          v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
          __int16 v30 = 2082;
          __int16 v31 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s called with null keyPath, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_34:
        if (!v12) {
          goto LABEL_4;
        }
LABEL_35:
        free(v12);
        goto LABEL_4;
      }
      if (v18)
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        long long v15 = "%{public}s called with null keyPath, no backtrace";
        goto LABEL_32;
      }
    }
    else
    {
      id v13 = __nwlog_obj();
      os_log_type_t v14 = v27;
      if (os_log_type_enabled(v13, v27))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        long long v15 = "%{public}s called with null keyPath, backtrace limit exceeded";
        goto LABEL_32;
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v9)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__NWAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke;
    v21[3] = &unk_1E523F668;
    BOOL v25 = a5;
    id v22 = v9;
    id v23 = self;
    id v24 = v8;
    os_unfair_lock_lock(&self->_kvo_lock);
    __71__NWAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke((uint64_t)v21);
    os_unfair_lock_unlock(&self->_kvo_lock);

    goto LABEL_4;
  }
  long long v16 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
  long long v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v27 = OS_LOG_TYPE_ERROR;
  char v26 = 0;
  if (!__nwlog_fault(v12, &v27, &v26)) {
    goto LABEL_34;
  }
  if (v27 == OS_LOG_TYPE_FAULT)
  {
    id v13 = __nwlog_obj();
    os_log_type_t v14 = v27;
    if (os_log_type_enabled(v13, v27))
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      long long v15 = "%{public}s called with null object";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (!v26)
  {
    id v13 = __nwlog_obj();
    os_log_type_t v14 = v27;
    if (os_log_type_enabled(v13, v27))
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      long long v15 = "%{public}s called with null object, backtrace limit exceeded";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  uint64_t v19 = (char *)__nw_create_backtrace_string();
  id v13 = __nwlog_obj();
  os_log_type_t v14 = v27;
  BOOL v20 = os_log_type_enabled(v13, v27);
  if (!v19)
  {
    if (v20)
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      long long v15 = "%{public}s called with null object, no backtrace";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (v20)
  {
    *(_DWORD *)buf = 136446466;
    v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
    __int16 v30 = 2082;
    __int16 v31 = v19;
    _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s called with null object, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v19);
  if (v12) {
    goto LABEL_35;
  }
LABEL_4:
}

uint64_t __71__NWAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48)];
  }
  return [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48) options:5 context:0];
}

uint64_t __63__NWAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5
{
}

- (NSArray)accumulations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __30__NWAccumulator_accumulations__block_invoke;
  long long v11 = &unk_1E524B9A0;
  p_lock = &self->_lock;
  long long v12 = self;
  id v13 = v3;
  id v5 = v3;
  os_unfair_lock_lock(p_lock);
  __30__NWAccumulator_accumulations__block_invoke((uint64_t)&v8);
  os_unfair_lock_unlock(p_lock);
  id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v5, v8, v9);

  return (NSArray *)v6;
}

void __30__NWAccumulator_accumulations__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "accumulation", (void)v9);
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(NWAccumulator *)self name];
  uint64_t v5 = [(NWAccumulator *)self accumulatedValues];
  uint64_t v6 = [v3 stringWithFormat:@"<NWAccumulator %@, NWAccumulations: %@>", v4, v5];

  return v6;
}

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__1674;
  id v24 = __Block_byref_object_dispose__1675;
  id v25 = 0;
  p_lock = &self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __24__NWAccumulator_dealloc__block_invoke;
  v19[3] = &unk_1E524B978;
  v19[4] = self;
  v19[5] = &v20;
  os_unfair_lock_lock(&self->_lock);
  __24__NWAccumulator_dealloc__block_invoke((uint64_t)v19);
  os_unfair_lock_unlock(p_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)v21[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        long long v11 = __24__NWAccumulator_dealloc__block_invoke_2;
        long long v12 = &unk_1E524B9A0;
        uint64_t v13 = v8;
        uint64_t v14 = self;
        os_unfair_lock_lock(&self->_kvo_lock);
        v11((uint64_t)v10);
        os_unfair_lock_unlock(&self->_kvo_lock);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v5);
  }

  [(id)v21[5] removeAllObjects];
  _Block_object_dispose(&v20, 8);

  v9.receiver = self;
  v9.super_class = (Class)NWAccumulator;
  [(NWAccumulator *)&v9 dealloc];
}

void __24__NWAccumulator_dealloc__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

void __24__NWAccumulator_dealloc__block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) object];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) keyPath];
  [v4 removeObserver:v2 forKeyPath:v3];
}

- (NWAccumulator)initWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NWAccumulator;
  uint64_t v6 = [(NWAccumulator *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    *(void *)&v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    accumulatedValues = v7->_accumulatedValues;
    v7->_accumulatedValues = v8;

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    long long v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      long long v11 = [(NWAccumulator *)v7 name];
      *(_DWORD *)buf = 136446466;
      long long v15 = "-[NWAccumulator initWithName:]";
      __int16 v16 = 2112;
      long long v17 = v11;
      _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_DEBUG, "%{public}s NWAccumulator init %@", buf, 0x16u);
    }
  }

  return v7;
}

@end