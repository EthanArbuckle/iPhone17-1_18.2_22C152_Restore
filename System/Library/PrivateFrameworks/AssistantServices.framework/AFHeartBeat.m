@interface AFHeartBeat
- (AFHeartBeat)initWithIdentifier:(id)a3 queue:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 heartBeatInterval:(double)a7 heartBeatHandler:(id)a8 invalidationHandler:(id)a9;
- (NSDate)effectiveDate;
- (NSString)description;
- (NSString)identifier;
- (double)expirationDuration;
- (double)heartBeatInterval;
- (unint64_t)numberOfHeartBeats;
- (void)_fire;
- (void)_invalidate;
- (void)dealloc;
- (void)invalidate;
@end

@implementation AFHeartBeat

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_heartBeatHandler, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_heartBeatTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (double)heartBeatInterval
{
  return self->_heartBeatInterval;
}

- (double)expirationDuration
{
  return self->_expirationDuration;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = atomic_load(&self->_numberOfHeartBeats);
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    identifier = self->_identifier;
    int v12 = 136315906;
    v13 = "-[AFHeartBeat _invalidate]";
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2112;
    v17 = identifier;
    __int16 v18 = 2048;
    unint64_t v19 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s %p identifier = %@, count = %llu", (uint8_t *)&v12, 0x2Au);
  }
  heartBeatTimer = self->_heartBeatTimer;
  if (heartBeatTimer)
  {
    dispatch_source_cancel(heartBeatTimer);
    v6 = self->_heartBeatTimer;
    self->_heartBeatTimer = 0;
  }
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel(expirationTimer);
    v8 = self->_expirationTimer;
    self->_expirationTimer = 0;
  }
  invalidationHandler = (void (**)(id, unint64_t))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, v3);
    id v10 = self->_invalidationHandler;
    self->_invalidationHandler = 0;
  }
}

- (void)_fire
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&self->_numberOfHeartBeats, 1uLL);
  if (0xCCCCCCCCCCCCCCCDLL * add <= 0x3333333333333333)
  {
    v4 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      int v7 = 136315906;
      v8 = "-[AFHeartBeat _fire]";
      __int16 v9 = 2048;
      id v10 = self;
      __int16 v11 = 2112;
      int v12 = identifier;
      __int16 v13 = 2048;
      unint64_t v14 = add;
      _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s %p identifier = %@, index = %llu", (uint8_t *)&v7, 0x2Au);
    }
  }
  heartBeatHandler = (void (**)(id, unint64_t))self->_heartBeatHandler;
  if (heartBeatHandler) {
    heartBeatHandler[2](heartBeatHandler, add);
  }
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v7 = "-[AFHeartBeat invalidate]";
    __int16 v8 = 2048;
    __int16 v9 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__AFHeartBeat_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __25__AFHeartBeat_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (unint64_t)numberOfHeartBeats
{
  return atomic_load(&self->_numberOfHeartBeats);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v12.receiver = self;
  v12.super_class = (Class)AFHeartBeat;
  v4 = [(AFHeartBeat *)&v12 description];
  identifier = self->_identifier;
  effectiveDate = self->_effectiveDate;
  [(NSDate *)effectiveDate timeIntervalSinceNow];
  double expirationDuration = self->_expirationDuration;
  unint64_t v8 = atomic_load(&self->_numberOfHeartBeats);
  uint64_t v10 = (void *)[v3 initWithFormat:@"%@ {identifier = %@, effectiveDate = %@ (%f seconds), expirationDuration = %f, numberOfHeartBeats = %llu}", v4, identifier, effectiveDate, v9, *(void *)&expirationDuration, v8];

  return (NSString *)v10;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    int v7 = "-[AFHeartBeat dealloc]";
    __int16 v8 = 2048;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = identifier;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p identifier = %@", buf, 0x20u);
  }
  [(AFHeartBeat *)self _invalidate];
  v5.receiver = self;
  v5.super_class = (Class)AFHeartBeat;
  [(AFHeartBeat *)&v5 dealloc];
}

- (AFHeartBeat)initWithIdentifier:(id)a3 queue:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 heartBeatInterval:(double)a7 heartBeatHandler:(id)a8 invalidationHandler:(id)a9
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  v68.receiver = self;
  v68.super_class = (Class)AFHeartBeat;
  id v21 = [(AFHeartBeat *)&v68 init];
  if (!v21) {
    goto LABEL_24;
  }
  v22 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v70 = "-[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler:inv"
          "alidationHandler:]";
    __int16 v71 = 2048;
    id v72 = v21;
    __int16 v73 = 2112;
    double v74 = *(double *)&v16;
    __int16 v75 = 2112;
    double v76 = *(double *)&v18;
    __int16 v77 = 2048;
    double v78 = a6;
    __int16 v79 = 2048;
    double v80 = a7;
    _os_log_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_INFO, "%s %p identifier = %@, effectiveDate = %@, double expirationDuration = %f, heartBeatInterval = %f", buf, 0x3Eu);
  }
  uint64_t v23 = [v16 copy];
  v24 = (void *)*((void *)v21 + 7);
  *((void *)v21 + 7) = v23;

  objc_storeStrong((id *)v21 + 1, a4);
  v25 = (void *)[v18 copy];
  v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = [MEMORY[0x1E4F1C9C8] date];
  }
  v28 = (void *)*((void *)v21 + 8);
  *((void *)v21 + 8) = v27;

  *((double *)v21 + 9) = a6;
  *((double *)v21 + 10) = a7;
  uint64_t v29 = MEMORY[0x19F3A50D0](v19);
  v30 = (void *)*((void *)v21 + 4);
  *((void *)v21 + 4) = v29;

  uint64_t v31 = MEMORY[0x19F3A50D0](v20);
  v32 = (void *)*((void *)v21 + 5);
  *((void *)v21 + 5) = v31;

  if (a7 > 0.0)
  {
    if (a6 < 0.0)
    {
      v33 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v70 = "-[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler"
              ":invalidationHandler:]";
        __int16 v71 = 2048;
        id v72 = v21;
        __int16 v73 = 2048;
        double v74 = a6;
        _os_log_error_impl(&dword_19CF1D000, v33, OS_LOG_TYPE_ERROR, "%s %p Expiration duration %f is invalid.", buf, 0x20u);
      }
      v34 = *((void *)v21 + 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_1;
      block[3] = &unk_1E592C678;
      id v35 = v21;
      id v65 = v35;
      dispatch_async(v34, block);
      id v36 = v35;

      goto LABEL_25;
    }
    [v18 timeIntervalSinceNow];
    if (a6 > 0.0 && v41 < 0.0 && v41 + a6 < 0.0)
    {
      v42 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v70 = "-[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler"
              ":invalidationHandler:]";
        __int16 v71 = 2048;
        id v72 = v21;
        __int16 v73 = 2112;
        double v74 = *(double *)&v18;
        __int16 v75 = 2048;
        double v76 = a6;
        _os_log_error_impl(&dword_19CF1D000, v42, OS_LOG_TYPE_ERROR, "%s %p Effective date %@ and expiration duration %f are in the past.", buf, 0x2Au);
      }
      v43 = *((void *)v21 + 1);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_2;
      v62[3] = &unk_1E592C678;
      id v44 = v21;
      id v63 = v44;
      dispatch_async(v43, v62);
      id v45 = v44;

      goto LABEL_25;
    }
    objc_initWeak((id *)buf, v21);
    dispatch_source_t v46 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v17);
    v47 = (void *)*((void *)v21 + 2);
    *((void *)v21 + 2) = v46;

    v48 = *((void *)v21 + 2);
    dispatch_time_t v49 = AFDispatchTimeGetFromDateAndOffset(v18, 0.0);
    dispatch_source_set_timer(v48, v49, (unint64_t)(a7 * 1000000000.0), 0);
    v50 = *((void *)v21 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_2;
    handler[3] = &unk_1E592B978;
    objc_copyWeak(&v61, (id *)buf);
    dispatch_source_set_event_handler(v50, handler);
    dispatch_resume(*((dispatch_object_t *)v21 + 2));
    if (a6 > 0.0)
    {
      dispatch_source_t v51 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v17);
      v52 = (void *)*((void *)v21 + 3);
      *((void *)v21 + 3) = v51;

      v53 = *((void *)v21 + 3);
      dispatch_time_t v54 = AFDispatchTimeGetFromDateAndOffset(v18, a6);
      dispatch_source_set_timer(v53, v54, 0xFFFFFFFFFFFFFFFFLL, 0);
      v55 = *((void *)v21 + 3);
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_3;
      v58[3] = &unk_1E592B978;
      objc_copyWeak(&v59, (id *)buf);
      dispatch_source_set_event_handler(v55, v58);
      dispatch_resume(*((dispatch_object_t *)v21 + 3));
      objc_destroyWeak(&v59);
    }
    objc_destroyWeak(&v61);
    objc_destroyWeak((id *)buf);
LABEL_24:
    id v56 = v21;
    goto LABEL_25;
  }
  v37 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v70 = "-[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler:inv"
          "alidationHandler:]";
    __int16 v71 = 2048;
    id v72 = v21;
    __int16 v73 = 2048;
    double v74 = a7;
    _os_log_error_impl(&dword_19CF1D000, v37, OS_LOG_TYPE_ERROR, "%s %p Heart beat interval %f is invalid.", buf, 0x20u);
  }
  v38 = *((void *)v21 + 1);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke;
  v66[3] = &unk_1E592C678;
  id v39 = v21;
  id v67 = v39;
  dispatch_async(v38, v66);
  id v40 = v39;

LABEL_25:
  return (AFHeartBeat *)v21;
}

uint64_t __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_1(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fire];
}

void __128__AFHeartBeat_initWithIdentifier_queue_effectiveDate_expirationDuration_heartBeatInterval_heartBeatHandler_invalidationHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidate];
}

@end