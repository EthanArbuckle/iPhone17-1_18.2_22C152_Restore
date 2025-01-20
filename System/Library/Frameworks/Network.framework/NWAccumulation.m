@interface NWAccumulation
- (BOOL)isSnapshot;
- (NSMutableDictionary)durations;
- (NSString)currentState;
- (NSString)name;
- (NWAccumulation)initWithName:(id)a3;
- (double)lastUpdateTime;
- (id)description;
- (id)snapshot;
- (void)dealloc;
- (void)reset;
- (void)setCurrentState:(id)a3;
- (void)setDurations:(id)a3;
- (void)setIsSnapshot:(BOOL)a3;
- (void)setLastUpdateTime:(double)a3;
- (void)setName:(id)a3;
- (void)updateWithState:(id)a3 atTime:(double)a4;
@end

@implementation NWAccumulation

void __41__NWAccumulation_updateWithState_atTime___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(char **)(a1 + 32);
    double v4 = *(double *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136446978;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    __int16 v46 = 2112;
    v47 = v3;
    __int16 v48 = 2112;
    double v49 = v4;
    __int16 v50 = 2048;
    uint64_t v51 = v5;
    _os_log_impl(&dword_1830D4000, v2, OS_LOG_TYPE_DEBUG, "%{public}s %@ new state: %@ at time %f", buf, 0x2Au);
  }

  if (!*(void *)(a1 + 40))
  {
    v32 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    v33 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v42 = 0;
    if (!__nwlog_fault(v33, &type, &v42)) {
      goto LABEL_54;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v34 = __nwlog_obj();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null state";
LABEL_52:
        _os_log_impl(&dword_1830D4000, v34, v35, v36, buf, 0xCu);
      }
    }
    else if (v42)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v34 = __nwlog_obj();
      os_log_type_t v35 = type;
      BOOL v39 = os_log_type_enabled(v34, type);
      if (backtrace_string)
      {
        if (v39)
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
          __int16 v46 = 2082;
          v47 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v34, v35, "%{public}s called with null state, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_54:
        if (!v33) {
          return;
        }
        goto LABEL_55;
      }
      if (v39)
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null state, no backtrace";
        goto LABEL_52;
      }
    }
    else
    {
      v34 = __nwlog_obj();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null state, backtrace limit exceeded";
        goto LABEL_52;
      }
    }
LABEL_53:

    goto LABEL_54;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  if (!v7)
  {
    v37 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    v33 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v42 = 0;
    if (!__nwlog_fault(v33, &type, &v42)) {
      goto LABEL_54;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v34 = __nwlog_obj();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null _durations";
        goto LABEL_52;
      }
    }
    else
    {
      if (v42)
      {
        v40 = (char *)__nw_create_backtrace_string();
        v34 = __nwlog_obj();
        os_log_type_t v35 = type;
        BOOL v41 = os_log_type_enabled(v34, type);
        if (v40)
        {
          if (v41)
          {
            *(_DWORD *)buf = 136446466;
            v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
            __int16 v46 = 2082;
            v47 = v40;
            _os_log_impl(&dword_1830D4000, v34, v35, "%{public}s called with null _durations, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v40);
          if (!v33) {
            return;
          }
LABEL_55:
          free(v33);
          return;
        }
        if (!v41) {
          goto LABEL_53;
        }
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null _durations, no backtrace";
        goto LABEL_52;
      }
      v34 = __nwlog_obj();
      os_log_type_t v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null _durations, backtrace limit exceeded";
        goto LABEL_52;
      }
    }
    goto LABEL_53;
  }
  if (!*(void *)(v6 + 32) || (double v8 = *(double *)(v6 + 40), v8 == 0.0))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(char **)(a1 + 32);
      double v14 = *(double *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136446978;
      v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
      __int16 v46 = 2112;
      v47 = v13;
      __int16 v48 = 2112;
      double v49 = v14;
      __int16 v50 = 2048;
      uint64_t v51 = v15;
      _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_DEBUG, "%{public}s %@ initial update, state: %@ at time %f", buf, 0x2Au);
    }

    v10 = [NSNumber numberWithUnsignedLongLong:0];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];
    goto LABEL_13;
  }
  double v9 = *(double *)(a1 + 48) - v8;
  if (v9 < 0.0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(char **)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
      __int16 v46 = 2112;
      v47 = v11;
      __int16 v48 = 2048;
      double v49 = v9;
      _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_ERROR, "%{public}s %@ negative time delta: %f", buf, 0x20u);
    }
LABEL_13:

LABEL_14:
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
    *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 48);
    return;
  }
  v16 = objc_msgSend(v7, "objectForKeyedSubscript:");
  uint64_t v17 = [v16 unsignedLongLongValue];

  v18 = [NSNumber numberWithUnsignedLongLong:v17 + (unint64_t)v9];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v18 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];

  char v19 = [*(id *)(*(void *)(a1 + 32) + 32) isEqualToString:*(void *)(a1 + 40)];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v20 = (id)gLogObj;
  v10 = v20;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      uint64_t v29 = *(void *)(a1 + 40);
      double v30 = *(double *)(v28 + 32);
      uint64_t v31 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136447746;
      v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
      __int16 v46 = 2112;
      v47 = (char *)v28;
      __int16 v48 = 2112;
      double v49 = v30;
      __int16 v50 = 2048;
      uint64_t v51 = v17;
      __int16 v52 = 2048;
      unint64_t v53 = v17 + (unint64_t)v9;
      __int16 v54 = 2112;
      uint64_t v55 = v29;
      __int16 v56 = 2048;
      uint64_t v57 = v31;
      _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_INFO, "%{public}s %@ exiting state: %@, previous duration %llu, new duration %llu, entering state: %@ at time %f", buf, 0x48u);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    double v23 = *(double *)(v21 + 32);
    uint64_t v24 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136447746;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    __int16 v46 = 2112;
    v47 = (char *)v21;
    __int16 v48 = 2112;
    double v49 = v23;
    __int16 v50 = 2048;
    uint64_t v51 = v17;
    __int16 v52 = 2048;
    unint64_t v53 = v17 + (unint64_t)v9;
    __int16 v54 = 2112;
    uint64_t v55 = v22;
    __int16 v56 = 2048;
    uint64_t v57 = v24;
    _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_DEBUG, "%{public}s %@ exiting state: %@, previous duration %llu, new duration %llu, entering state: %@ at time %f", buf, 0x48u);
  }

  if (v9 >= 1.0) {
    goto LABEL_14;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v25 = (id)gLogObj;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = *(char **)(*(void *)(a1 + 32) + 40);
    double v27 = *(double *)(a1 + 48);
    *(_DWORD *)buf = 136446722;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    __int16 v46 = 2048;
    v47 = v26;
    __int16 v48 = 2048;
    double v49 = v27;
    _os_log_impl(&dword_1830D4000, v25, OS_LOG_TYPE_DEBUG, "%{public}s delta is less than one second, not updating timestamp from %f (ignoring new timestamp %f)", buf, 0x20u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (NSString)name
{
  return self->_name;
}

- (NSMutableDictionary)durations
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1674;
  char v19 = __Block_byref_object_dispose__1675;
  id v20 = 0;
  p_lock = &self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__NWAccumulation_durations__block_invoke;
  v14[3] = &unk_1E524B978;
  v14[4] = self;
  v14[5] = &v15;
  os_unfair_lock_lock(&self->_lock);
  __27__NWAccumulation_durations__block_invoke((uint64_t)v14);
  os_unfair_lock_unlock(p_lock);
  if (v16[5] && ![(NWAccumulation *)self isSnapshot])
  {
    uint64_t v4 = v16[5];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[NWAccumulation updateWithState:atTime:](self, "updateWithState:atTime:", v4);
  }
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1674;
  v12 = __Block_byref_object_dispose__1675;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__NWAccumulation_durations__block_invoke_2;
  v7[3] = &unk_1E524B978;
  v7[4] = self;
  v7[5] = &v8;
  os_unfair_lock_lock(p_lock);
  __27__NWAccumulation_durations__block_invoke_2((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);

  return (NSMutableDictionary *)v5;
}

- (void)updateWithState:(id)a3 atTime:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NWAccumulation *)self isSnapshot])
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "-[NWAccumulation updateWithState:atTime:]";
      __int16 v13 = 2112;
      double v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2048;
      double v18 = a4;
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_DEBUG, "%{public}s %@ skipping update for snapshot (state: %@ at time %f)", buf, 0x2Au);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__NWAccumulation_updateWithState_atTime___block_invoke;
    v8[3] = &unk_1E5249FB0;
    v8[4] = self;
    id v9 = v6;
    double v10 = a4;
    os_unfair_lock_lock(&self->_lock);
    __41__NWAccumulation_updateWithState_atTime___block_invoke((uint64_t)v8);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)isSnapshot
{
  return self->_isSnapshot;
}

void __27__NWAccumulation_durations__block_invoke_2(uint64_t a1)
{
}

void __27__NWAccumulation_durations__block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_durations, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setIsSnapshot:(BOOL)a3
{
  self->_isSnapshot = a3;
}

- (void)setLastUpdateTime:(double)a3
{
  self->_lastUpdateTime = a3;
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setCurrentState:(id)a3
{
}

- (NSString)currentState
{
  return self->_currentState;
}

- (void)setDurations:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (id)snapshot
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [NWAccumulation alloc];
  uint64_t v4 = [(NWAccumulation *)self name];
  id v5 = [(NWAccumulation *)v3 initWithName:v4];

  [(NWAccumulation *)v5 setIsSnapshot:1];
  id v6 = [(NWAccumulation *)self durations];
  v7 = (void *)[v6 mutableCopy];
  [(NWAccumulation *)v5 setDurations:v7];

  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1674;
  id v20 = __Block_byref_object_dispose__1675;
  id v21 = 0;
  uint64_t v12 = 0;
  __int16 v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __26__NWAccumulation_snapshot__block_invoke;
  v11[3] = &unk_1E5244950;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  os_unfair_lock_lock(&self->_lock);
  __26__NWAccumulation_snapshot__block_invoke(v11);
  os_unfair_lock_unlock(&self->_lock);
  [(NWAccumulation *)v5 setCurrentState:v17[5]];
  [(NWAccumulation *)v5 setLastUpdateTime:v13[3]];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v8 = (id)gLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    double v23 = "-[NWAccumulation snapshot]";
    __int16 v24 = 2112;
    v25 = self;
    __int16 v26 = 2112;
    double v27 = v5;
    _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEBUG, "%{public}s %@ created snapshot: %@", buf, 0x20u);
  }

  id v9 = v5;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

double __26__NWAccumulation_snapshot__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 32));
  double result = *(double *)(a1[4] + 40);
  *(double *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)reset
{
  p_lock = &self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __23__NWAccumulation_reset__block_invoke;
  v3[3] = &unk_1E524BAA8;
  v3[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __23__NWAccumulation_reset__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __23__NWAccumulation_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v4 removeAllObjects];
}

- (id)description
{
  v3 = NSString;
  if ([(NWAccumulation *)self isSnapshot]) {
    uint64_t v4 = " [Snapshot]";
  }
  else {
    uint64_t v4 = "";
  }
  id v5 = [(NWAccumulation *)self name];
  id v6 = [v3 stringWithFormat:@"<NWAccumulation%s %@, states: %@>", v4, v5, self->_durations];

  return v6;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__NWAccumulation_dealloc__block_invoke;
  v5[3] = &unk_1E524BAA8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __25__NWAccumulation_dealloc__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)NWAccumulation;
  [(NWAccumulation *)&v4 dealloc];
}

void __25__NWAccumulation_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (NWAccumulation)initWithName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NWAccumulation;
  id v6 = [(NWAccumulation *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    durations = v7->_durations;
    v7->_durations = v8;

    currentState = v7->_currentState;
    v7->_currentState = 0;

    v7->_lastUpdateTime = 0.0;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [(NWAccumulation *)v7 name];
      *(_DWORD *)buf = 136446466;
      uint64_t v16 = "-[NWAccumulation initWithName:]";
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1830D4000, v11, OS_LOG_TYPE_DEBUG, "%{public}s NWAccumulation init %@", buf, 0x16u);
    }
  }

  return v7;
}

@end