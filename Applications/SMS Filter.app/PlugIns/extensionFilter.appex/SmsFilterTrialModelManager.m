@interface SmsFilterTrialModelManager
- (BOOL)newModelUpdateAvailable;
- (BOOL)updateAvailable;
- (MLModel)basicModel;
- (MLModel)mainModel;
- (MLModel)subClassificationModel;
- (NSString)regexFilePath;
- (OS_os_log)log;
- (SmsFilterTrialManager)trialManager;
- (SmsFilterTrialModelManager)init;
- (double)loadPromotionalThreshold;
- (double)loadTransactionalThreshold;
- (double)thresholdPromo;
- (double)thresholdTrans;
- (id)getLocalModel:(id)a3;
- (id)getRegexFilePath;
- (int64_t)loadTransitionTimer;
- (int64_t)transitionTimer;
- (os_unfair_lock_s)loadModelLock;
- (void)init;
- (void)initializeWithNamespace:(unsigned int)a3;
- (void)prepareForTrialParamsUpdate;
- (void)setLoadModelLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setNewModelUpdateAvailable:(BOOL)a3;
- (void)setRegexFilePath:(id)a3;
- (void)setThresholdPromo:(double)a3;
- (void)setThresholdTrans:(double)a3;
- (void)setTransitionTimer:(int64_t)a3;
- (void)setTrialManager:(id)a3;
@end

@implementation SmsFilterTrialModelManager

- (SmsFilterTrialModelManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SmsFilterTrialModelManager;
  v2 = [(SmsFilterTrialModelManager *)&v12 init];
  if (!v2) {
    -[SmsFilterTrialModelManager init]();
  }
  v3 = v2;
  uint64_t v4 = trialLogHandle();
  log = v3->_log;
  v3->_log = (OS_os_log *)v4;

  v3->_newModelUpdateAvailable = 0;
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)&v3->_thresholdTrans = _Q0;
  v3->_transitionTimer = 1440;
  return v3;
}

- (void)initializeWithNamespace:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_initWeak(&location, self);
  v5 = [[SmsFilterTrialManager alloc] initWithDefaultsDomain:v3];
  trialManager = self->_trialManager;
  self->_trialManager = v5;

  v7 = self->_trialManager;
  if (v7)
  {
    v8 = [(SmsFilterTrialManager *)v7 trialClient];
    v9 = [(SmsFilterTrialManager *)self->_trialManager trialNamespaceName];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __54__SmsFilterTrialModelManager_initializeWithNamespace___block_invoke;
    v12[3] = &unk_1000248E0;
    objc_copyWeak(&v13, &location);
    id v10 = [v8 addUpdateHandlerForNamespaceName:v9 usingBlock:v12];

    objc_destroyWeak(&v13);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "_trialManager is nil", buf, 2u);
    }
  }
  objc_destroyWeak(&location);
}

void __54__SmsFilterTrialModelManager_initializeWithNamespace___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    v6 = [v5 trialManager];
    [v6 loadTrialUpdates];

    id v7 = objc_loadWeakRetained(&to);
    [v7 prepareForTrialParamsUpdate];

    id v8 = objc_loadWeakRetained(&to);
    [v8 setNewModelUpdateAvailable:1];
  }
  objc_destroyWeak(&to);
}

- (MLModel)mainModel
{
  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_mainModel)
  {
    id v4 = [(SmsFilterTrialManager *)self->_trialManager loadTrialMainModelByDeletingExistingModel:1];
    mainModel = self->_mainModel;
    self->_mainModel = v4;

    if (!self->_mainModel)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Trial main model Not found!", v9, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_loadModelLock);
  id v7 = self->_mainModel;

  return v7;
}

- (MLModel)basicModel
{
  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_basicModel)
  {
    id v4 = [(SmsFilterTrialManager *)self->_trialManager loadTrialBasicModelByDeletingExistingModel:1];
    basicModel = self->_basicModel;
    self->_basicModel = v4;

    if (!self->_basicModel)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Trial basic model Not found!", v9, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_loadModelLock);
  id v7 = self->_basicModel;

  return v7;
}

- (MLModel)subClassificationModel
{
  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_subClassificationModel)
  {
    id v4 = [(SmsFilterTrialManager *)self->_trialManager loadTrialSubClassificationModelByDeletingExistingModel:1];
    subClassificationModel = self->_subClassificationModel;
    self->_subClassificationModel = v4;

    if (!self->_subClassificationModel)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Trial sub-classification model Not found!", v9, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_loadModelLock);
  id v7 = self->_subClassificationModel;

  return v7;
}

- (id)getLocalModel:(id)a3
{
  return [(SmsFilterTrialManager *)self->_trialManager loadTrialModelByDeletingExistingModel:a3];
}

- (void)prepareForTrialParamsUpdate
{
  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  mainModel = self->_mainModel;
  self->_mainModel = 0;

  basicModel = self->_basicModel;
  self->_basicModel = 0;

  subClassificationModel = self->_subClassificationModel;
  self->_subClassificationModel = 0;

  regexFilePath = self->_regexFilePath;
  self->_regexFilePath = 0;

  os_unfair_lock_unlock(p_loadModelLock);
}

- (id)getRegexFilePath
{
  id v3 = [(SmsFilterTrialManager *)self->_trialManager getRegexFileNameWithPath];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "regex filepath: %@", (uint8_t *)&v6, 0xCu);
    }
  }

  return v3;
}

- (double)loadTransactionalThreshold
{
  if (!self->_mainModel) {
    return self->_thresholdTrans;
  }
  [(SmsFilterTrialManager *)self->_trialManager loadTrialTransThreshold];
  double v4 = v3;
  if (v3 <= 0.0 || v3 >= 1.0)
  {
    log = self->_log;
    double v4 = 0.5;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = 0x3FE0000000000000;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial threshold. Falling back to default %lf", (uint8_t *)&v8, 0xCu);
    }
  }
  return v4;
}

- (double)loadPromotionalThreshold
{
  if (!self->_mainModel) {
    return self->_thresholdPromo;
  }
  [(SmsFilterTrialManager *)self->_trialManager loadTrialPromoThreshold];
  double v4 = v3;
  if (v3 <= 0.0 || v3 >= 1.0)
  {
    log = self->_log;
    double v4 = 0.5;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = 0x3FE0000000000000;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial threshold. Falling back to default %lf", (uint8_t *)&v8, 0xCu);
    }
  }
  return v4;
}

- (int64_t)loadTransitionTimer
{
  int64_t v3 = [(SmsFilterTrialManager *)self->_trialManager loadTrialModelTransitionTimer];
  if (v3 <= 0)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      int64_t v3 = 1440;
      uint64_t v7 = 1440;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial transition timer value. Falling back to default %ld", (uint8_t *)&v6, 0xCu);
    }
    else
    {
      return 1440;
    }
  }
  return v3;
}

- (BOOL)updateAvailable
{
  BOOL newModelUpdateAvailable = self->_newModelUpdateAvailable;
  if (self->_newModelUpdateAvailable) {
    self->_BOOL newModelUpdateAvailable = 0;
  }
  return newModelUpdateAvailable;
}

- (SmsFilterTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (os_unfair_lock_s)loadModelLock
{
  return self->_loadModelLock;
}

- (void)setLoadModelLock:(os_unfair_lock_s)a3
{
  self->_loadModelLock = a3;
}

- (NSString)regexFilePath
{
  return self->_regexFilePath;
}

- (void)setRegexFilePath:(id)a3
{
}

- (double)thresholdTrans
{
  return self->_thresholdTrans;
}

- (void)setThresholdTrans:(double)a3
{
  self->_thresholdTrans = a3;
}

- (double)thresholdPromo
{
  return self->_thresholdPromo;
}

- (void)setThresholdPromo:(double)a3
{
  self->_thresholdPromo = a3;
}

- (int64_t)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(int64_t)a3
{
  self->_transitionTimer = a3;
}

- (BOOL)newModelUpdateAvailable
{
  return self->_newModelUpdateAvailable;
}

- (void)setNewModelUpdateAvailable:(BOOL)a3
{
  self->_BOOL newModelUpdateAvailable = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_regexFilePath, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_subClassificationModel, 0);
  objc_storeStrong((id *)&self->_basicModel, 0);

  objc_storeStrong((id *)&self->_mainModel, 0);
}

- (void)init
{
}

@end