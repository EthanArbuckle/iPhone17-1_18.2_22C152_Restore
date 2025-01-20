@interface SFAnalyticsSampler
- (BOOL)oncePerReport;
- (NSString)name;
- (SFAnalyticsSampler)initWithName:(id)a3 interval:(double)a4 block:(id)a5 clientClass:(Class)a6;
- (double)samplingInterval;
- (id)sampleNow;
- (void)dealloc;
- (void)newTimer;
- (void)pauseSampling;
- (void)setSamplingInterval:(double)a3;
- (void)setupOnceTimer;
- (void)setupPeriodicTimer;
@end

@implementation SFAnalyticsSampler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (BOOL)oncePerReport
{
  return self->_oncePerReport;
}

- (NSString)name
{
  return self->_name;
}

- (void)dealloc
{
  [(SFAnalyticsSampler *)self pauseSampling];
  v3.receiver = self;
  v3.super_class = (Class)SFAnalyticsSampler;
  [(SFAnalyticsSampler *)&v3 dealloc];
}

- (void)pauseSampling
{
  if (self->_activeTimer)
  {
    if (self->_oncePerReport)
    {
      notify_cancel(self->_notificationToken);
      self->_notificationToken = 0;
    }
    else
    {
      dispatch_source_cancel((dispatch_source_t)self->_timer);
    }
    self->_activeTimer = 0;
  }
}

- (id)sampleNow
{
  objc_super v3 = (*((void (**)(void))self->_block + 2))();
  v4 = [(objc_class *)self->_clientClass logger];
  [v4 logMetric:v3 withName:self->_name oncePerReport:self->_oncePerReport];

  return v3;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (void)setSamplingInterval:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 >= 1.0 || a3 == -1.0)
  {
    self->_samplingInterval = a3;
    [(SFAnalyticsSampler *)self newTimer];
  }
  else
  {
    v5 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      double v8 = a3;
      _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "SFAnalyticsSampler: interval %f is not supported", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)setupPeriodicTimer
{
  objc_super v3 = dispatch_get_global_queue(0, 0);
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  timer = self->_timer;
  self->_timer = v4;

  v6 = self->_timer;
  dispatch_time_t v7 = dispatch_walltime(0, (uint64_t)(self->_samplingInterval * 1000000000.0));
  dispatch_source_set_timer(v6, v7, (unint64_t)(self->_samplingInterval * 1000000000.0), (unint64_t)(self->_samplingInterval * 1000000000.0 / 50.0));
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  double v8 = self->_timer;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__SFAnalyticsSampler_setupPeriodicTimer__block_invoke;
  v9[3] = &unk_1E5481428;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume((dispatch_object_t)self->_timer);
  self->_activeTimer = 1;
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __40__SFAnalyticsSampler_setupPeriodicTimer__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained[6] logger];
    v4 = (*((void (**)(void))v2[4] + 2))();
    [v3 logMetric:v4 withName:v2[3] oncePerReport:*((unsigned __int8 *)v2 + 56)];
  }
  else
  {
    objc_super v3 = secLogObjForScope("SFAnalyticsSampler");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 0;
      _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, "sampler went away before we could run its once-per-report block", (uint8_t *)v5, 2u);
    }
  }
}

- (void)setupOnceTimer
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_super v3 = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SFAnalyticsSampler_setupOnceTimer__block_invoke;
  v4[3] = &unk_1E54777F8;
  objc_copyWeak(&v5, &location);
  notify_register_dispatch("com.apple.security.sfanalytics.samplers", &self->_notificationToken, v3, v4);

  self->_activeTimer = 1;
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __36__SFAnalyticsSampler_setupOnceTimer__block_invoke(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained[6] logger];
    v6 = (*((void (**)(void))v4[4] + 2))();
    [v5 logMetric:v6 withName:v4[3] oncePerReport:*((unsigned __int8 *)v4 + 56)];
  }
  else
  {
    dispatch_time_t v7 = secLogObjForScope("SFAnalyticsSampler");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 0;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "sampler went away before we could run its once-per-report block", (uint8_t *)v8, 2u);
    }

    notify_cancel(a2);
  }
}

- (void)newTimer
{
  if (self->_activeTimer) {
    [(SFAnalyticsSampler *)self pauseSampling];
  }
  double samplingInterval = self->_samplingInterval;
  self->_oncePerReport = samplingInterval == -1.0;
  if (samplingInterval == -1.0)
  {
    [(SFAnalyticsSampler *)self setupOnceTimer];
  }
  else
  {
    [(SFAnalyticsSampler *)self setupPeriodicTimer];
  }
}

- (SFAnalyticsSampler)initWithName:(id)a3 interval:(double)a4 block:(id)a5 clientClass:(Class)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFAnalyticsSampler;
  v13 = [(SFAnalyticsSampler *)&v20 init];
  if (!v13) {
    goto LABEL_16;
  }
  if (([(objc_class *)a6 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v15 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      Class v22 = a6;
      _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "SFAnalyticsSampler created without valid client class (%@)", buf, 0xCu);
    }

    goto LABEL_13;
  }
  if (v11)
  {
    if (a4 < 1.0)
    {
      if (!v12 || a4 != -1.0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
    if (v12)
    {
LABEL_15:
      v13->_clientClass = a6;
      v17 = _Block_copy(v12);
      id block = v13->_block;
      v13->_id block = v17;

      objc_storeStrong((id *)&v13->_name, a3);
      v13->_double samplingInterval = a4;
      [(SFAnalyticsSampler *)v13 newTimer];
LABEL_16:
      v16 = v13;
      goto LABEL_17;
    }
  }
LABEL_7:
  v14 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B299000, v14, OS_LOG_TYPE_DEFAULT, "SFAnalyticsSampler created without proper data", buf, 2u);
  }

LABEL_13:
  v16 = 0;
LABEL_17:

  return v16;
}

@end