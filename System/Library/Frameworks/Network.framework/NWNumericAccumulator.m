@interface NWNumericAccumulator
- (NSMutableArray)kvoWatchers;
- (NSMutableArray)overriddenStates;
- (NSMutableDictionary)accumulations;
- (NSString)name;
- (NWNumericAccumulator)initWithName:(id)a3;
- (id)aggregatedStates;
- (id)description;
- (id)dictionaryRepresentation;
- (id)overrideStateWithName:(id)a3;
- (id)watcherForObject:(id)a3 andKeyPath:(id)a4;
- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5;
- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6;
- (void)addCount:(id)a3 toAccumulation:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerObserverForKeyPath:(id)a3 ofObject:(id)a4 alreadyRegistered:(BOOL)a5;
- (void)reset;
- (void)setAccumulations:(id)a3;
- (void)setKvoWatchers:(id)a3;
- (void)setName:(id)a3;
- (void)setOverriddenStates:(id)a3;
- (void)updateState:(id)a3 forName:(id)a4;
@end

@implementation NWNumericAccumulator

void __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v10 = [v7 componentsSeparatedByString:@","];
  uint64_t v11 = [v10 count];
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (v11 == [*(id *)(*(void *)(a1 + 32) + 40) count] + v12)
  {
    v37 = a4;
    id v38 = v7;
    if (![v10 count])
    {
LABEL_15:
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_172;
      v39[3] = &unk_1E523ABA8;
      id v28 = v9;
      id v40 = v28;
      [v8 enumerateKeysAndObjectsUsingBlock:v39];
      [*(id *)(a1 + 40) addObject:v28];

      id v7 = v38;
      goto LABEL_35;
    }
    unint64_t v13 = 0;
    while (1)
    {
      unint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 32) count];
      uint64_t v15 = *(void *)(a1 + 32);
      if (v13 >= v14)
      {
        v18 = *(void **)(v15 + 40);
        unint64_t v17 = v13 - [*(id *)(v15 + 32) count];
        v16 = v18;
      }
      else
      {
        v16 = *(void **)(v15 + 32);
        unint64_t v17 = v13;
      }
      v19 = [v16 objectAtIndex:v17];
      v20 = [v19 name];

      v21 = [v10 objectAtIndex:v13];
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v22 = (id)gLogObj;
      v23 = v22;
      if (!v20) {
        break;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446722;
        v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
        __int16 v45 = 2112;
        uint64_t v46 = (uint64_t)v20;
        __int16 v47 = 2112;
        uint64_t v48 = (uint64_t)v21;
        _os_log_impl(&dword_1830D4000, v23, OS_LOG_TYPE_DEBUG, "%{public}s Processing name %@ state %@", buf, 0x20u);
      }

      [v9 setObject:v21 forKeyedSubscript:v20];
      if (++v13 >= [v10 count]) {
        goto LABEL_15;
      }
    }
    *(_DWORD *)buf = 136446466;
    v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
    __int16 v45 = 2112;
    uint64_t v46 = (uint64_t)v21;
    v29 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v41 = 0;
    id v7 = v38;
    if (!__nwlog_fault((const char *)v29, &type, &v41))
    {
LABEL_30:
      if (!v29)
      {
LABEL_32:
        if (v37) {
          unsigned char *v37 = 1;
        }

        goto LABEL_35;
      }
LABEL_31:
      free(v29);
      goto LABEL_32;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v30 = (id)gLogObj;
      os_log_type_t v31 = type;
      if (!os_log_type_enabled(v30, type))
      {
LABEL_29:

        goto LABEL_30;
      }
      *(_DWORD *)buf = 136446466;
      v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
      __int16 v45 = 2112;
      uint64_t v46 = (uint64_t)v21;
      v32 = "%{public}s failed to get name for state: %@";
    }
    else
    {
      if (v41)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v34 = (id)gLogObj;
        os_log_type_t v35 = type;
        BOOL v36 = os_log_type_enabled(v34, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446722;
            v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
            __int16 v45 = 2112;
            uint64_t v46 = (uint64_t)v21;
            __int16 v47 = 2082;
            uint64_t v48 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_1830D4000, v34, v35, "%{public}s failed to get name for state: %@, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
          if (!v29) {
            goto LABEL_32;
          }
        }
        else
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
            __int16 v45 = 2112;
            uint64_t v46 = (uint64_t)v21;
            _os_log_impl(&dword_1830D4000, v34, v35, "%{public}s failed to get name for state: %@, no backtrace", buf, 0x16u);
          }

          if (!v29) {
            goto LABEL_32;
          }
        }
        goto LABEL_31;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v30 = (id)gLogObj;
      os_log_type_t v31 = type;
      if (!os_log_type_enabled(v30, type)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 136446466;
      v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
      __int16 v45 = 2112;
      uint64_t v46 = (uint64_t)v21;
      v32 = "%{public}s failed to get name for state: %@, backtrace limit exceeded";
    }
    _os_log_impl(&dword_1830D4000, v30, v31, v32, buf, 0x16u);
    goto LABEL_29;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v24 = (id)gLogObj;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = [v10 count];
    uint64_t v26 = [*(id *)(*(void *)(a1 + 32) + 32) count];
    uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 40) count];
    *(_DWORD *)buf = 136446978;
    v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke_2";
    __int16 v45 = 2048;
    uint64_t v46 = v25;
    __int16 v47 = 2048;
    uint64_t v48 = v26;
    __int16 v49 = 2048;
    uint64_t v50 = v27;
    _os_log_impl(&dword_1830D4000, v24, OS_LOG_TYPE_ERROR, "%{public}s Components count (%zu) != kvoWatchers count (%zu) + overriddenStates count (%zu)", buf, 0x2Au);
  }

  if (a4) {
    *a4 = 1;
  }
LABEL_35:
}

uint64_t __78__NWNumericAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48)];
  }
  return [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40) forKeyPath:*(void *)(a1 + 48) options:5 context:0];
}

- (void)registerObserverForKeyPath:(id)a3 ofObject:(id)a4 alreadyRegistered:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    uint64_t v11 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (!__nwlog_fault(v12, &v27, &v26)) {
      goto LABEL_34;
    }
    if (v27 == OS_LOG_TYPE_FAULT)
    {
      unint64_t v13 = __nwlog_obj();
      os_log_type_t v14 = v27;
      if (os_log_type_enabled(v13, v27))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        uint64_t v15 = "%{public}s called with null keyPath";
LABEL_32:
        _os_log_impl(&dword_1830D4000, v13, v14, v15, buf, 0xCu);
      }
    }
    else if (v26)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      unint64_t v13 = __nwlog_obj();
      os_log_type_t v14 = v27;
      BOOL v18 = os_log_type_enabled(v13, v27);
      if (backtrace_string)
      {
        if (v18)
        {
          *(_DWORD *)buf = 136446466;
          v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
          __int16 v30 = 2082;
          os_log_type_t v31 = backtrace_string;
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
        v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        uint64_t v15 = "%{public}s called with null keyPath, no backtrace";
        goto LABEL_32;
      }
    }
    else
    {
      unint64_t v13 = __nwlog_obj();
      os_log_type_t v14 = v27;
      if (os_log_type_enabled(v13, v27))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        uint64_t v15 = "%{public}s called with null keyPath, backtrace limit exceeded";
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
    v21[2] = __78__NWNumericAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke;
    v21[3] = &unk_1E523F668;
    BOOL v25 = a5;
    id v22 = v9;
    v23 = self;
    id v24 = v8;
    os_unfair_lock_lock(&self->_kvo_lock);
    __78__NWNumericAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke((uint64_t)v21);
    os_unfair_lock_unlock(&self->_kvo_lock);

    goto LABEL_4;
  }
  v16 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
  uint64_t v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v27 = OS_LOG_TYPE_ERROR;
  char v26 = 0;
  if (!__nwlog_fault(v12, &v27, &v26)) {
    goto LABEL_34;
  }
  if (v27 == OS_LOG_TYPE_FAULT)
  {
    unint64_t v13 = __nwlog_obj();
    os_log_type_t v14 = v27;
    if (os_log_type_enabled(v13, v27))
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      uint64_t v15 = "%{public}s called with null object";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (!v26)
  {
    unint64_t v13 = __nwlog_obj();
    os_log_type_t v14 = v27;
    if (os_log_type_enabled(v13, v27))
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      uint64_t v15 = "%{public}s called with null object, backtrace limit exceeded";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  v19 = (char *)__nw_create_backtrace_string();
  unint64_t v13 = __nwlog_obj();
  os_log_type_t v14 = v27;
  BOOL v20 = os_log_type_enabled(v13, v27);
  if (!v19)
  {
    if (v20)
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      uint64_t v15 = "%{public}s called with null object, no backtrace";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (v20)
  {
    *(_DWORD *)buf = 136446466;
    v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
    __int16 v30 = 2082;
    os_log_type_t v31 = v19;
    _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s called with null object, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v19);
  if (v12) {
    goto LABEL_35;
  }
LABEL_4:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenStates, 0);
  objc_storeStrong((id *)&self->_kvoWatchers, 0);
  objc_storeStrong((id *)&self->_accumulations, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setOverriddenStates:(id)a3
{
}

- (NSMutableArray)overriddenStates
{
  return self->_overriddenStates;
}

- (void)setKvoWatchers:(id)a3
{
}

- (NSMutableArray)kvoWatchers
{
  return self->_kvoWatchers;
}

- (void)setAccumulations:(id)a3
{
}

- (NSMutableDictionary)accumulations
{
  return self->_accumulations;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(NWNumericAccumulator *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke;
  uint64_t v12 = &unk_1E524B9A0;
  p_lock = &self->_lock;
  unint64_t v13 = self;
  id v14 = v5;
  id v7 = v5;
  os_unfair_lock_lock(p_lock);
  __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke((uint64_t)&v9);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, @"states", v9, v10);

  return v3;
}

void __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_2;
  v3[3] = &unk_1E523ABD0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_172(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (void)reset
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1674;
  BOOL v20 = __Block_byref_object_dispose__1675;
  id v21 = 0;
  p_lock = &self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __29__NWNumericAccumulator_reset__block_invoke;
  v15[3] = &unk_1E524B978;
  v15[4] = self;
  v15[5] = &v16;
  os_unfair_lock_lock(&self->_lock);
  __29__NWNumericAccumulator_reset__block_invoke((uint64_t)v15);
  os_unfair_lock_unlock(p_lock);
  [(NSMutableDictionary *)self->_accumulations removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)v17[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "keyPath", (void)v11);
        uint64_t v10 = [v8 object];
        [(NWNumericAccumulator *)self registerObserverForKeyPath:v9 ofObject:v10 alreadyRegistered:1];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v16, 8);
}

void __29__NWNumericAccumulator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) mutableCopy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)updateState:(id)a3 forName:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    long long v13 = __nwlog_obj();
    *(_DWORD *)char v41 = 136446210;
    *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
    long long v14 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    char v32 = 0;
    if (!__nwlog_fault(v14, buf, &v32)) {
      goto LABEL_42;
    }
    if (buf[0] == 17)
    {
      uint64_t v15 = __nwlog_obj();
      os_log_type_t v16 = buf[0];
      if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
      {
        *(_DWORD *)char v41 = 136446210;
        *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
        _os_log_impl(&dword_1830D4000, v15, v16, "%{public}s called with null state", v41, 0xCu);
      }
    }
    else if (v32)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      uint64_t v15 = __nwlog_obj();
      os_log_type_t v20 = buf[0];
      BOOL v21 = os_log_type_enabled(v15, (os_log_type_t)buf[0]);
      if (backtrace_string)
      {
        if (v21)
        {
          *(_DWORD *)char v41 = 136446466;
          *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
          *(_WORD *)&v41[12] = 2082;
          *(void *)&v41[14] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v15, v20, "%{public}s called with null state, dumping backtrace:%{public}s", v41, 0x16u);
        }

        free(backtrace_string);
LABEL_42:
        if (!v14) {
          goto LABEL_8;
        }
LABEL_43:
        free(v14);
        goto LABEL_8;
      }
      if (v21)
      {
        *(_DWORD *)char v41 = 136446210;
        *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
        _os_log_impl(&dword_1830D4000, v15, v20, "%{public}s called with null state, no backtrace", v41, 0xCu);
      }
    }
    else
    {
      uint64_t v15 = __nwlog_obj();
      os_log_type_t v25 = buf[0];
      if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
      {
        *(_DWORD *)char v41 = 136446210;
        *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
        _os_log_impl(&dword_1830D4000, v15, v25, "%{public}s called with null state, backtrace limit exceeded", v41, 0xCu);
      }
    }
LABEL_41:

    goto LABEL_42;
  }
  if (v7)
  {
    *(void *)char v41 = 0;
    *(void *)&v41[8] = v41;
    *(void *)&v41[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__1674;
    v43 = __Block_byref_object_dispose__1675;
    id v44 = [(NWNumericAccumulator *)self overrideStateWithName:v7];
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [*(id *)(*(void *)&v41[8] + 40) state];
      *(_DWORD *)buf = 136446978;
      v34 = "-[NWNumericAccumulator updateState:forName:]";
      __int16 v35 = 2112;
      BOOL v36 = v8;
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      id v40 = v6;
      _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_INFO, "%{public}s Updating state of %@ from %@ to %@", buf, 0x2Au);
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    long long v11 = (id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      long long v12 = [*(id *)(*(void *)&v41[8] + 40) state];
      *(_DWORD *)buf = 136446978;
      v34 = "-[NWNumericAccumulator updateState:forName:]";
      __int16 v35 = 2112;
      BOOL v36 = v8;
      __int16 v37 = 2112;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v6;
      _os_log_impl(&dword_1830D4000, v11, OS_LOG_TYPE_DEBUG, "%{public}s Updating state of %@ from %@ to %@", buf, 0x2Au);
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __44__NWNumericAccumulator_updateState_forName___block_invoke;
    v27[3] = &unk_1E5241D28;
    os_log_type_t v31 = v41;
    id v28 = v8;
    id v29 = v6;
    __int16 v30 = self;
    os_unfair_lock_lock(&self->_lock);
    __44__NWNumericAccumulator_updateState_forName___block_invoke(v27);
    os_unfair_lock_unlock(&self->_lock);

    _Block_object_dispose(v41, 8);
    goto LABEL_8;
  }
  unint64_t v17 = __nwlog_obj();
  *(_DWORD *)char v41 = 136446210;
  *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
  long long v14 = (char *)_os_log_send_and_compose_impl();

  buf[0] = 16;
  char v32 = 0;
  if (!__nwlog_fault(v14, buf, &v32)) {
    goto LABEL_42;
  }
  if (buf[0] == 17)
  {
    uint64_t v15 = __nwlog_obj();
    os_log_type_t v18 = buf[0];
    if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
    {
      *(_DWORD *)char v41 = 136446210;
      *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
      _os_log_impl(&dword_1830D4000, v15, v18, "%{public}s called with null name", v41, 0xCu);
    }
    goto LABEL_41;
  }
  if (!v32)
  {
    uint64_t v15 = __nwlog_obj();
    os_log_type_t v26 = buf[0];
    if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
    {
      *(_DWORD *)char v41 = 136446210;
      *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
      _os_log_impl(&dword_1830D4000, v15, v26, "%{public}s called with null name, backtrace limit exceeded", v41, 0xCu);
    }
    goto LABEL_41;
  }
  id v22 = (char *)__nw_create_backtrace_string();
  uint64_t v15 = __nwlog_obj();
  os_log_type_t v23 = buf[0];
  BOOL v24 = os_log_type_enabled(v15, (os_log_type_t)buf[0]);
  if (!v22)
  {
    if (v24)
    {
      *(_DWORD *)char v41 = 136446210;
      *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
      _os_log_impl(&dword_1830D4000, v15, v23, "%{public}s called with null name, no backtrace", v41, 0xCu);
    }
    goto LABEL_41;
  }
  if (v24)
  {
    *(_DWORD *)char v41 = 136446466;
    *(void *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
    *(_WORD *)&v41[12] = 2082;
    *(void *)&v41[14] = v22;
    _os_log_impl(&dword_1830D4000, v15, v23, "%{public}s called with null name, dumping backtrace:%{public}s", v41, 0x16u);
  }

  free(v22);
  if (v14) {
    goto LABEL_43;
  }
LABEL_8:
}

uint64_t __44__NWNumericAccumulator_updateState_forName___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (v2)
  {
    uint64_t v3 = a1[5];
    return [v2 setState:v3];
  }
  else
  {
    uint64_t v5 = objc_alloc_init(NWAccumulatorOverrideState);
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(a1[7] + 8) + 40) setName:a1[4]];
    [*(id *)(*(void *)(a1[7] + 8) + 40) setState:a1[5]];
    id v8 = *(void **)(a1[6] + 40);
    uint64_t v9 = *(void *)(*(void *)(a1[7] + 8) + 40);
    return [v8 addObject:v9];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = a4;
  id v11 = a5;
  long long v12 = [(NWNumericAccumulator *)self watcherForObject:v10 andKeyPath:v9];
  if (v12)
  {
    long long v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    long long v14 = [v12 callback];
    uint64_t v15 = ((void (**)(void, NSObject *))v14)[2](v14, v13);

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    os_log_type_t v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136447490;
      os_log_type_t v18 = "-[NWNumericAccumulator observeValueForKeyPath:ofObject:change:context:]";
      __int16 v19 = 2112;
      os_log_type_t v20 = self;
      __int16 v21 = 2112;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      os_log_type_t v26 = v10;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEBUG, "%{public}s %@ observing value %@ for keyPath %@ of object %@, state: %@", (uint8_t *)&v17, 0x3Eu);
    }

    if (v15) {
      [v12 updateWithState:v15];
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    long long v13 = (id)gLogObj;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446722;
      os_log_type_t v18 = "-[NWNumericAccumulator observeValueForKeyPath:ofObject:change:context:]";
      __int16 v19 = 2112;
      os_log_type_t v20 = self;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_ERROR, "%{public}s %@ did not find value for object: %@", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (NWNumericAccumulator *)a3;
  id v11 = a4;
  long long v12 = (NWNumericAccumulator *)a5;
  id v13 = a6;
  long long v14 = v13;
  if (v10 && v12 && v13)
  {
    uint64_t v15 = [(NWNumericAccumulator *)self watcherForObject:v10 andKeyPath:v12];
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    os_log_type_t v16 = (id)gLogObj;
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)buf = 136447234;
        id v28 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]";
        __int16 v29 = 2112;
        __int16 v30 = v10;
        __int16 v31 = 2112;
        char v32 = v12;
        __int16 v33 = 2112;
        p_super = v15;
        __int16 v35 = 2112;
        BOOL v36 = v12;
        _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_INFO, "%{public}s Existing NWAccumulatorKVOWatcher for object: %@ and keyPath: %@: %@, resetting %@", buf, 0x34u);
      }

      [v15 setCallback:v14];
      [(NWNumericAccumulator *)self registerObserverForKeyPath:v12 ofObject:v10 alreadyRegistered:1];
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136446722;
        id v28 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]";
        __int16 v29 = 2112;
        __int16 v30 = v10;
        __int16 v31 = 2112;
        char v32 = v12;
        _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_INFO, "%{public}s Adding new NWAccumulatorKVOWatcher for object: %@ and keyPath: %@", buf, 0x20u);
      }

      __int16 v19 = objc_alloc_init(NWAccumulatorKVOWatcher);
      [(NWAccumulatorKVOWatcher *)v19 setName:v11];
      [(NWAccumulatorKVOWatcher *)v19 setObject:v10];
      [(NWAccumulatorKVOWatcher *)v19 setKeyPath:v12];
      [(NWAccumulatorKVOWatcher *)v19 setCallback:v14];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      __int16 v23 = __70__NWNumericAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke;
      id v24 = &unk_1E524B9A0;
      __int16 v25 = self;
      os_log_type_t v26 = v19;
      os_log_type_t v20 = v19;
      os_unfair_lock_lock(&self->_lock);
      __70__NWNumericAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke((uint64_t)&v21);
      os_unfair_lock_unlock(&self->_lock);
      -[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:](self, "registerObserverForKeyPath:ofObject:alreadyRegistered:", v12, v10, 0, v21, v22);

      uint64_t v15 = 0;
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v15 = (id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v18 = (NWNumericAccumulator *)_Block_copy(v14);
      *(_DWORD *)buf = 136447234;
      id v28 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]";
      __int16 v29 = 2112;
      __int16 v30 = self;
      __int16 v31 = 2112;
      char v32 = v10;
      __int16 v33 = 2112;
      p_super = &v12->super;
      __int16 v35 = 2112;
      BOOL v36 = v18;
      _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_ERROR, "%{public}s %@ invalid value passed to addAccumulation: object (%@), key (%@), callback (%@)", buf, 0x34u);
    }
  }
}

void __70__NWNumericAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v2 = (id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) count];
    int v4 = 136446466;
    uint64_t v5 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]_block_invoke";
    __int16 v6 = 2048;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1830D4000, v2, OS_LOG_TYPE_DEBUG, "%{public}s Now have %zu watchers", (uint8_t *)&v4, 0x16u);
  }
}

- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5
{
}

- (void)addCount:(id)a3 toAccumulation:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    long long v12 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
    id v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (!__nwlog_fault(v13, &v27, &v26)) {
      goto LABEL_34;
    }
    if (v27 == OS_LOG_TYPE_FAULT)
    {
      long long v14 = __nwlog_obj();
      os_log_type_t v15 = v27;
      if (os_log_type_enabled(v14, v27))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
        os_log_type_t v16 = "%{public}s called with null count";
LABEL_32:
        _os_log_impl(&dword_1830D4000, v14, v15, v16, buf, 0xCu);
      }
    }
    else if (v26)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      long long v14 = __nwlog_obj();
      os_log_type_t v15 = v27;
      BOOL v19 = os_log_type_enabled(v14, v27);
      if (backtrace_string)
      {
        if (v19)
        {
          *(_DWORD *)buf = 136446466;
          __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
          __int16 v30 = 2082;
          __int16 v31 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s called with null count, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_34:
        if (!v13) {
          goto LABEL_4;
        }
LABEL_35:
        free(v13);
        goto LABEL_4;
      }
      if (v19)
      {
        *(_DWORD *)buf = 136446210;
        __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
        os_log_type_t v16 = "%{public}s called with null count, no backtrace";
        goto LABEL_32;
      }
    }
    else
    {
      long long v14 = __nwlog_obj();
      os_log_type_t v15 = v27;
      if (os_log_type_enabled(v14, v27))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
        os_log_type_t v16 = "%{public}s called with null count, backtrace limit exceeded";
        goto LABEL_32;
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v7)
  {
    id v9 = [(NWNumericAccumulator *)self aggregatedStates];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __48__NWNumericAccumulator_addCount_toAccumulation___block_invoke;
    v22[3] = &unk_1E524A1D0;
    p_lock = &self->_lock;
    v22[4] = self;
    id v23 = v9;
    id v24 = v8;
    id v25 = v6;
    id v11 = v9;
    os_unfair_lock_lock(p_lock);
    __48__NWNumericAccumulator_addCount_toAccumulation___block_invoke((uint64_t)v22);
    os_unfair_lock_unlock(p_lock);

    goto LABEL_4;
  }
  BOOL v17 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
  id v13 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v27 = OS_LOG_TYPE_ERROR;
  char v26 = 0;
  if (!__nwlog_fault(v13, &v27, &v26)) {
    goto LABEL_34;
  }
  if (v27 == OS_LOG_TYPE_FAULT)
  {
    long long v14 = __nwlog_obj();
    os_log_type_t v15 = v27;
    if (os_log_type_enabled(v14, v27))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
      os_log_type_t v16 = "%{public}s called with null name";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (!v26)
  {
    long long v14 = __nwlog_obj();
    os_log_type_t v15 = v27;
    if (os_log_type_enabled(v14, v27))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
      os_log_type_t v16 = "%{public}s called with null name, backtrace limit exceeded";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  os_log_type_t v20 = (char *)__nw_create_backtrace_string();
  long long v14 = __nwlog_obj();
  os_log_type_t v15 = v27;
  BOOL v21 = os_log_type_enabled(v14, v27);
  if (!v20)
  {
    if (v21)
    {
      *(_DWORD *)buf = 136446210;
      __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
      os_log_type_t v16 = "%{public}s called with null name, no backtrace";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (v21)
  {
    *(_DWORD *)buf = 136446466;
    __int16 v29 = "-[NWNumericAccumulator addCount:toAccumulation:]";
    __int16 v30 = 2082;
    __int16 v31 = v20;
    _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s called with null name, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v20);
  if (v13) {
    goto LABEL_35;
  }
LABEL_4:
}

void __48__NWNumericAccumulator_addCount_toAccumulation___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2) {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = [v3 unsignedLongLongValue];
    uint64_t v6 = [*(id *)(a1 + 56) unsignedLongLongValue];
    BOOL v7 = __CFADD__(v5, v6);
    uint64_t v8 = v5 + v6;
    if (v7)
    {
      if (gLogDatapath)
      {
        long long v14 = __nwlog_obj();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = [*(id *)(a1 + 56) unsignedLongLongValue];
          int v16 = 136446978;
          BOOL v17 = "-[NWNumericAccumulator addCount:toAccumulation:]_block_invoke";
          __int16 v18 = 2082;
          BOOL v19 = "longValue";
          __int16 v20 = 2048;
          uint64_t v21 = v15;
          __int16 v22 = 2048;
          uint64_t v23 = v8;
          _os_log_impl(&dword_1830D4000, v14, OS_LOG_TYPE_DEBUG, "%{public}s Overflow: %{public}s, increment %llu, result %llu", (uint8_t *)&v16, 0x2Au);
        }
      }
      uint64_t v8 = -1;
    }
    id v9 = [NSNumber numberWithUnsignedLongLong:v8];
  }
  else
  {
    id v9 = *(id *)(a1 + 56);
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v10 = (id)gLogObj;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    long long v12 = *(const char **)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 40);
    int v16 = 136447234;
    BOOL v17 = "-[NWNumericAccumulator addCount:toAccumulation:]_block_invoke";
    __int16 v18 = 2112;
    BOOL v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v9;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_DEBUG, "%{public}s New value for %@: %@ (+%@), states: %@", (uint8_t *)&v16, 0x34u);
  }

  [v2 setObject:v9 forKeyedSubscript:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)aggregatedStates
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1674;
  uint64_t v10 = __Block_byref_object_dispose__1675;
  id v11 = objc_alloc_init(NSString);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__NWNumericAccumulator_aggregatedStates__block_invoke;
  v5[3] = &unk_1E524B978;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->_lock);
  __40__NWNumericAccumulator_aggregatedStates__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(&self->_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__NWNumericAccumulator_aggregatedStates__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v8 = [*(id *)(*((void *)&v29 + 1) + 8 * v6) state];
        uint64_t v9 = [v7 stringByAppendingFormat:@"%@,", v8];
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v4);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        __int16 v18 = [*(id *)(*((void *)&v25 + 1) + 8 * v16) state];
        uint64_t v19 = [v17 stringByAppendingFormat:@"%@,", v18];
        uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v14);
  }

  uint64_t v22 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "substringToIndex:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "length") - 1);
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

- (id)overrideStateWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1674;
  uint64_t v16 = __Block_byref_object_dispose__1675;
  id v17 = 0;
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__NWNumericAccumulator_overrideStateWithName___block_invoke;
  v9[3] = &unk_1E5242570;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  os_unfair_lock_lock(p_lock);
  __46__NWNumericAccumulator_overrideStateWithName___block_invoke(v9);
  os_unfair_lock_unlock(p_lock);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__NWNumericAccumulator_overrideStateWithName___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1[4] + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "name", (void)v10);
        int v9 = [v8 isEqualToString:a1[5]];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)watcherForObject:(id)a3 andKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1674;
  uint64_t v21 = __Block_byref_object_dispose__1675;
  id v22 = 0;
  p_lock = &self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__NWNumericAccumulator_watcherForObject_andKeyPath___block_invoke;
  v13[3] = &unk_1E5241D28;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  uint64_t v16 = &v17;
  os_unfair_lock_lock(p_lock);
  __52__NWNumericAccumulator_watcherForObject_andKeyPath___block_invoke(v13);
  os_unfair_lock_unlock(p_lock);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __52__NWNumericAccumulator_watcherForObject_andKeyPath___block_invoke(void *a1)
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
      uint64_t v8 = objc_msgSend(v7, "object", (void)v12);
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

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(NWNumericAccumulator *)self name];
  uint64_t v5 = [(NWNumericAccumulator *)self kvoWatchers];
  uint64_t v6 = [v3 stringWithFormat:@"<NWNumericAccumulator %@, NWAccumulatorKVOWatchers: %zu>", v4, objc_msgSend(v5, "count")];

  return v6;
}

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__1674;
  __int16 v24 = __Block_byref_object_dispose__1675;
  id v25 = 0;
  p_lock = &self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __31__NWNumericAccumulator_dealloc__block_invoke;
  v19[3] = &unk_1E524B978;
  v19[4] = self;
  v19[5] = &v20;
  os_unfair_lock_lock(&self->_lock);
  __31__NWNumericAccumulator_dealloc__block_invoke((uint64_t)v19);
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
        int v11 = __31__NWNumericAccumulator_dealloc__block_invoke_2;
        long long v12 = &unk_1E524B9A0;
        uint64_t v13 = v8;
        long long v14 = self;
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
  v9.super_class = (Class)NWNumericAccumulator;
  [(NWNumericAccumulator *)&v9 dealloc];
}

void __31__NWNumericAccumulator_dealloc__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;
}

void __31__NWNumericAccumulator_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v4 = [*(id *)(a1 + 32) object];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) keyPath];
  [v4 removeObserver:v2 forKeyPath:v3];
}

- (NWNumericAccumulator)initWithName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NWNumericAccumulator;
  uint64_t v6 = [(NWNumericAccumulator *)&v17 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    *(void *)&v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    kvoWatchers = v7->_kvoWatchers;
    v7->_kvoWatchers = v8;

    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    overriddenStates = v7->_overriddenStates;
    v7->_overriddenStates = v10;

    long long v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    accumulations = v7->_accumulations;
    v7->_accumulations = v12;

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    long long v14 = (id)gLogObj;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      long long v15 = [(NWNumericAccumulator *)v7 name];
      *(_DWORD *)buf = 136446466;
      uint64_t v19 = "-[NWNumericAccumulator initWithName:]";
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_1830D4000, v14, OS_LOG_TYPE_DEBUG, "%{public}s NWNumericAccumulator init %@", buf, 0x16u);
    }
  }

  return v7;
}

@end