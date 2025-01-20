@interface NLTelemetry
+ (id)sharedInstance;
- (NLTelemetry)init;
- (void)_registerPayload:(id)a3 forEvent:(id)a4;
- (void)reportEmbeddingLoadedWithIdentifier:(id)a3 localeIdentifier:(id)a4 useANE:(BOOL)a5 status:(int64_t)a6;
@end

@implementation NLTelemetry

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __29__NLTelemetry_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(NLTelemetry);

  return MEMORY[0x1F41817F8]();
}

- (NLTelemetry)init
{
  v6.receiver = self;
  v6.super_class = (Class)NLTelemetry;
  v2 = [(NLTelemetry *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.NaturalLanguage.NLTelemetry", 0);
    analyticsQueue = v2->_analyticsQueue;
    v2->_analyticsQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_registerPayload:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  analyticsQueue = self->_analyticsQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__NLTelemetry__registerPayload_forEvent___block_invoke;
  v11[3] = &unk_1E5C54028;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(analyticsQueue, v11);
}

uint64_t __41__NLTelemetry__registerPayload_forEvent___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F41138A0](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)reportEmbeddingLoadedWithIdentifier:(id)a3 localeIdentifier:(id)a4 useANE:(BOOL)a5 status:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a4;
  id v12 = a3;
  id v18 = [v10 dictionary];
  [v18 setObject:v12 forKeyedSubscript:@"identifier"];

  [v18 setObject:v11 forKeyedSubscript:@"locale"];
  if (v7) {
    id v13 = @"ane";
  }
  else {
    id v13 = @"cpu";
  }
  [v18 setObject:v13 forKeyedSubscript:@"engine"];
  v14 = [NSNumber numberWithInteger:a6];
  [v18 setObject:v14 forKeyedSubscript:@"status"];

  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = [v15 bundleIdentifier];

  if (v16) {
    v17 = v16;
  }
  else {
    v17 = @"unknown";
  }
  [v18 setObject:v17 forKeyedSubscript:@"app_bundle"];
  [(NLTelemetry *)self _registerPayload:v18 forEvent:@"com.apple.NaturalLanguage.EmbeddingStatus"];
}

- (void).cxx_destruct
{
}

@end