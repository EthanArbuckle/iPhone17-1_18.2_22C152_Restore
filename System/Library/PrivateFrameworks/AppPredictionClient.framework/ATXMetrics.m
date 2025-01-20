@interface ATXMetrics
+ (id)_sharedInstance;
+ (void)logActionExecuteForType:(int64_t)a3 inContext:(int64_t)a4;
+ (void)logActionViewForType:(int64_t)a3 inContext:(int64_t)a4;
+ (void)logError:(int64_t)a3 inContext:(int64_t)a4;
- (ATXMetrics)init;
- (void)_logActionExecuteForType:(int64_t)a3 inContext:(int64_t)a4;
- (void)_logActionViewForType:(int64_t)a3 inContext:(int64_t)a4;
- (void)_logError:(int64_t)a3 inContext:(int64_t)a4;
@end

@implementation ATXMetrics

+ (void)logError:(int64_t)a3 inContext:(int64_t)a4
{
  id v6 = [a1 _sharedInstance];
  [v6 _logError:a3 inContext:a4];
}

+ (void)logActionViewForType:(int64_t)a3 inContext:(int64_t)a4
{
  id v6 = [a1 _sharedInstance];
  [v6 _logActionViewForType:a3 inContext:a4];
}

+ (void)logActionExecuteForType:(int64_t)a3 inContext:(int64_t)a4
{
  id v6 = [a1 _sharedInstance];
  [v6 _logActionExecuteForType:a3 inContext:a4];
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_90);
  }
  v2 = (void *)_sharedInstance_sSharedInstance;

  return v2;
}

uint64_t __29__ATXMetrics__sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ATXMetrics);
  uint64_t v1 = _sharedInstance_sSharedInstance;
  _sharedInstance_sSharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXMetrics)init
{
  v33[6] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)ATXMetrics;
  v2 = [(ATXMetrics *)&v25 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create(v5, v7);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v8;

    v32[0] = &unk_1EFDF46C8;
    v32[1] = &unk_1EFDF46E0;
    v33[0] = @"unknown";
    v33[1] = @"atxnsua";
    v32[2] = &unk_1EFDF46F8;
    v32[3] = &unk_1EFDF4710;
    v33[2] = @"atxintent";
    v33[3] = @"nsua";
    v32[4] = &unk_1EFDF4728;
    v32[5] = &unk_1EFDF4740;
    v33[4] = @"intent";
    v33[5] = @"vs";
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:6];
    v23 = [MEMORY[0x1E4F93720] propertyWithName:@"type" enumMapping:v24];
    v30[0] = &unk_1EFDF46C8;
    v30[1] = &unk_1EFDF46F8;
    v31[0] = @"unknown";
    v31[1] = @"search";
    v30[2] = &unk_1EFDF46E0;
    v31[2] = @"notif";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
    v11 = [MEMORY[0x1E4F93720] propertyWithName:@"ctx" enumMapping:v10];
    v29[0] = v23;
    v29[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    v27[0] = &unk_1EFDF46C8;
    v27[1] = &unk_1EFDF46F8;
    v28[0] = @"unknown";
    v28[1] = @"other";
    v27[2] = &unk_1EFDF46E0;
    v27[3] = &unk_1EFDF4728;
    v28[2] = @"dump";
    v28[3] = @"cia";
    v27[4] = &unk_1EFDF4710;
    v27[5] = &unk_1EFDF4740;
    v28[4] = @"exttimeout";
    v28[5] = @"extint";
    v27[6] = &unk_1EFDF4758;
    v27[7] = &unk_1EFDF4770;
    v28[6] = @"proxyop";
    v28[7] = @"wfstop";
    v27[8] = &unk_1EFDF4788;
    v27[9] = &unk_1EFDF47A0;
    v28[8] = @"cardcom";
    v28[9] = @"cardreq";
    v27[10] = &unk_1EFDF47B8;
    v27[11] = &unk_1EFDF47D0;
    v28[10] = @"infail";
    v28[11] = @"nilapp";
    v27[12] = &unk_1EFDF47E8;
    v27[13] = &unk_1EFDF4800;
    v28[12] = @"deser";
    v28[13] = @"feedbk";
    v27[14] = &unk_1EFDF4818;
    v28[14] = @"noappname";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:15];
    v14 = [MEMORY[0x1E4F93720] propertyWithName:@"err" enumMapping:v13];
    v26[0] = v14;
    v26[1] = v11;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"AppPredictionUI" event:@"View" registerProperties:v12];
    viewTracker = v2->_viewTracker;
    v2->_viewTracker = (PETScalarEventTracker *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"AppPredictionUI" event:@"Execute" registerProperties:v12];
    executeTracker = v2->_executeTracker;
    v2->_executeTracker = (PETScalarEventTracker *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"AppPredictionUI" event:@"Error" registerProperties:v15];
    errorTracker = v2->_errorTracker;
    v2->_errorTracker = (PETScalarEventTracker *)v20;
  }
  return v2;
}

- (void)_logError:(int64_t)a3 inContext:(int64_t)a4
{
  loggingQueue = self->_loggingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ATXMetrics__logError_inContext___block_invoke;
  block[3] = &unk_1E5D05480;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(loggingQueue, block);
}

void __34__ATXMetrics__logError_inContext___block_invoke(void *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1[4] + 32);
  v3 = [NSNumber numberWithInteger:a1[5]];
  v6[0] = v3;
  id v4 = [NSNumber numberWithInteger:a1[6]];
  v6[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  [v2 trackEventWithPropertyValues:v5];
}

- (void)_logActionViewForType:(int64_t)a3 inContext:(int64_t)a4
{
  loggingQueue = self->_loggingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ATXMetrics__logActionViewForType_inContext___block_invoke;
  block[3] = &unk_1E5D05480;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(loggingQueue, block);
}

void __46__ATXMetrics__logActionViewForType_inContext___block_invoke(void *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1[4] + 16);
  v3 = [NSNumber numberWithInteger:a1[5]];
  v6[0] = v3;
  id v4 = [NSNumber numberWithInteger:a1[6]];
  v6[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  [v2 trackEventWithPropertyValues:v5];
}

- (void)_logActionExecuteForType:(int64_t)a3 inContext:(int64_t)a4
{
  loggingQueue = self->_loggingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ATXMetrics__logActionExecuteForType_inContext___block_invoke;
  block[3] = &unk_1E5D05480;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(loggingQueue, block);
}

void __49__ATXMetrics__logActionExecuteForType_inContext___block_invoke(void *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1[4] + 24);
  v3 = [NSNumber numberWithInteger:a1[5]];
  v6[0] = v3;
  id v4 = [NSNumber numberWithInteger:a1[6]];
  v6[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  [v2 trackEventWithPropertyValues:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorTracker, 0);
  objc_storeStrong((id *)&self->_executeTracker, 0);
  objc_storeStrong((id *)&self->_viewTracker, 0);

  objc_storeStrong((id *)&self->_loggingQueue, 0);
}

@end