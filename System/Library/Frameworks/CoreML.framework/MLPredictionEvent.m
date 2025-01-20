@interface MLPredictionEvent
- (MLPredictionEvent)init;
- (NSNumber)firstPartyExecutable;
- (NSNumber)modelType;
- (NSString)bundleIdentifier;
- (NSString)modelName;
- (id)lastReportedMetric;
- (void)maybeLogPredictionEvent:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFirstPartyExecutable:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelType:(id)a3;
@end

@implementation MLPredictionEvent

- (MLPredictionEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)MLPredictionEvent;
  v2 = [(MLPredictionEvent *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.CoreML.MLPredictionEvent", v3);
    predictionEventQueue = v2->_predictionEventQueue;
    v2->_predictionEventQueue = (OS_dispatch_queue *)v4;

    v2->_featuresPredictionCountSoFar = 0;
    v2->_epochIndex = 0;
    mach_timebase_info(&v2->_timebaseInfo);
  }
  return v2;
}

- (void)setModelType:(id)a3
{
}

- (void)setModelName:(id)a3
{
}

- (void)setFirstPartyExecutable:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)maybeLogPredictionEvent:(unint64_t)a3
{
  predictionEventQueue = self->_predictionEventQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MLPredictionEvent_maybeLogPredictionEvent___block_invoke;
  v4[3] = &unk_1E59A5080;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(predictionEventQueue, v4);
}

void __45__MLPredictionEvent_maybeLogPredictionEvent___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 24);
  if (predictionEventEpochs[v2] == *(void *)(v1 + 16))
  {
    *(void *)(v1 + 24) = v2 + 1;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v7 = *(unsigned int *)(v4 + 40);
    unint64_t v6 = *(unsigned int *)(v4 + 44);
    v8 = [MLPredictionEventMetric alloc];
    v9 = [*(id *)(a1 + 32) bundleIdentifier];
    v10 = [*(id *)(a1 + 32) modelName];
    v11 = [*(id *)(a1 + 32) firstPartyExecutable];
    v12 = [*(id *)(a1 + 32) modelType];
    obj = [(MLPredictionEventMetric *)v8 initWithBundleIdentifier:v9 modelName:v10 firstPartyExecutable:v11 modelType:v12 featuresPredictionDuration:*(void *)(*(void *)(a1 + 32) + 16) featuresPredictionCountSoFar:(double)(v5 * v7 / v6) / 1000000000.0];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), obj);
    v13 = +[MLReporter reporter];
    [v13 logMetric:obj];
  }
}

- (NSNumber)modelType
{
  return self->_modelType;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSNumber)firstPartyExecutable
{
  return self->_firstPartyExecutable;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_firstPartyExecutable, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastReportedMetric, 0);

  objc_storeStrong((id *)&self->_predictionEventQueue, 0);
}

- (id)lastReportedMetric
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23300;
  v10 = __Block_byref_object_dispose__23301;
  id v11 = 0;
  predictionEventQueue = self->_predictionEventQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MLPredictionEvent_lastReportedMetric__block_invoke;
  v5[3] = &unk_1E59A5300;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(predictionEventQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__MLPredictionEvent_lastReportedMetric__block_invoke(uint64_t a1)
{
}

@end