@interface AFAnalytics
+ (id)sharedAnalytics;
- (AFAnalytics)init;
- (AFAnalytics)initWithInstanceContext:(id)a3;
- (id)_service:(BOOL)a3;
- (id)newTurnBasedInstrumentationContext;
- (void)_stageEvent:(id)a3;
- (void)_stageEvents:(id)a3;
- (void)barrier:(id)a3;
- (void)beginEventsGrouping;
- (void)boostQueuedEvents:(id)a3;
- (void)endEventsGrouping;
- (void)logClientFeedbackPresented:(id)a3;
- (void)logClientFeedbackPresented:(id)a3 dialogIdentifierProvider:(id)a4;
- (void)logEvent:(id)a3;
- (void)logEventWithType:(int64_t)a3 context:(id)a4;
- (void)logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5;
- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4;
- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4 contextProvidingQueue:(id)a5;
- (void)logEventWithType:(int64_t)a3 contextResolver:(id)a4;
- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5;
- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6;
- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextProvider:(id)a5 contextProvidingQueue:(id)a6;
- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextResolver:(id)a5;
- (void)logEvents:(id)a3;
- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnContext:(id)a5;
- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5;
- (void)logInstrumentation:(id)a3 turnContext:(id)a4;
- (void)logInstrumentationOfType:(Class)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5;
- (void)logInstrumentationOfType:(Class)a3 turnIdentifier:(id)a4;
- (void)setService:(id)a3;
@end

@implementation AFAnalytics

void __30__AFAnalytics_sharedAnalytics__block_invoke()
{
  v0 = [AFAnalytics alloc];
  id v3 = +[AFInstanceContext currentContext];
  uint64_t v1 = [(AFAnalytics *)v0 initWithInstanceContext:v3];
  v2 = (void *)sharedAnalytics_analytics;
  sharedAnalytics_analytics = v1;
}

- (AFAnalytics)initWithInstanceContext:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AFAnalytics;
  id v3 = [(AFAnalytics *)&v11 init];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.assistant.analytics.client", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    dispatch_group_t v8 = dispatch_group_create();
    group = v3->_group;
    v3->_group = (OS_dispatch_group *)v8;
  }
  return v3;
}

+ (id)sharedAnalytics
{
  if (sharedAnalytics_onceToken != -1) {
    dispatch_once(&sharedAnalytics_onceToken, &__block_literal_global_30180);
  }
  v2 = (void *)sharedAnalytics_analytics;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_service:(BOOL)a3
{
  p_service = &self->_service;
  service = self->_service;
  if (service) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    if (_AFAnalyticsServiceGetRemoteXPC_onceToken != -1) {
      dispatch_once(&_AFAnalyticsServiceGetRemoteXPC_onceToken, &__block_literal_global_71_30143);
    }
    objc_storeStrong((id *)p_service, (id)_AFAnalyticsServiceGetRemoteXPC_remoteXPCService);
    service = *p_service;
  }
  return service;
}

- (void)_stageEvents:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    v4 = [(AFAnalytics *)self _service:1];
    [v4 stageEvents:v5 completion:0];
  }
}

- (void)_stageEvent:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = [(AFAnalytics *)self _service:1];
    v7[0] = v4;
    dispatch_queue_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

    [v5 stageEvents:v6 completion:0];
  }
}

- (void)barrier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    p_queue = &self->_queue;
    queue = self->_queue;
    v7 = p_queue[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23__AFAnalytics_barrier___block_invoke;
    block[3] = &unk_1E592C360;
    id v10 = v4;
    dispatch_group_notify(v7, queue, block);
  }
}

uint64_t __23__AFAnalytics_barrier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logEvents:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __25__AFAnalytics_logEvents___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __25__AFAnalytics_logEvents___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stageEvents:*(void *)(a1 + 40)];
}

- (void)logEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __24__AFAnalytics_logEvent___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __24__AFAnalytics_logEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stageEvent:*(void *)(a1 + 40)];
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextResolver:(id)a5
{
  if (a5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke;
    v7[3] = &unk_1E5929410;
    v7[4] = self;
    void v7[5] = a3;
    v7[6] = a4;
    (*((void (**)(id, void *))a5 + 2))(a5, v7);
  }
  else
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke_3;
    v6[3] = &unk_1E5929438;
    v6[5] = a3;
    v6[6] = a4;
    v6[4] = self;
    dispatch_async(queue, v6);
  }
}

void __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke_2;
  v7[3] = &unk_1E592B1A8;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke_3(uint64_t a1)
{
  _AFAnalyticsEventCreate(*(void *)(a1 + 40), *(void *)(a1 + 48), 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _stageEvent:v2];
}

void __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke_2(uint64_t a1)
{
  _AFAnalyticsEventCreate(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) _stageEvent:v2];
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextProvider:(id)a5 contextProvidingQueue:(id)a6
{
  id v10 = a5;
  objc_super v11 = a6;
  if (v11)
  {
    dispatch_group_enter((dispatch_group_t)self->_group);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke;
    v18[3] = &unk_1E59293E8;
    v19[1] = a3;
    v19[2] = a4;
    v12 = (id *)v19;
    v18[4] = self;
    v19[0] = v10;
    v13 = v18;
    v14 = v11;
  }
  else
  {
    queue = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke_3;
    v16[3] = &unk_1E59293E8;
    v17[1] = a3;
    v17[2] = a4;
    v12 = (id *)v17;
    v16[4] = self;
    v17[0] = v10;
    v13 = v16;
    v14 = queue;
  }
  dispatch_async(v14, v13);
}

void __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke(uint64_t a1)
{
  id v2 = _AFAnalyticsEventGetContextGuarded(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke_2;
  v6[3] = &unk_1E592B1A8;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = v2;
  uint64_t v8 = v3;
  id v5 = v2;
  dispatch_async(v4, v6);
}

void __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke_3(uint64_t a1)
{
  _AFAnalyticsEventGetContextGuarded(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void **)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = _AFAnalyticsEventCreate(*(void *)(a1 + 48), *(void *)(a1 + 56), v3);
  [*(id *)(a1 + 32) _stageEvent:v2];
}

void __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke_2(uint64_t a1)
{
  _AFAnalyticsEventCreate(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) _stageEvent:v2];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 16));
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  objc_super v11 = v10;
  if (v6) {
    id v12 = v10;
  }
  else {
    id v12 = (id)[v10 copy];
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__AFAnalytics_logEventWithType_machAbsoluteTime_context_contextNoCopy___block_invoke;
  v15[3] = &unk_1E592B1A8;
  int64_t v18 = a3;
  unint64_t v19 = a4;
  id v16 = v12;
  v17 = self;
  id v14 = v12;
  dispatch_async(queue, v15);
}

void __71__AFAnalytics_logEventWithType_machAbsoluteTime_context_contextNoCopy___block_invoke(uint64_t a1)
{
  _AFAnalyticsEventCreate(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) _stageEvent:v2];
}

- (void)setService:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __26__AFAnalytics_setService___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __26__AFAnalytics_setService___block_invoke(uint64_t a1)
{
}

- (void)boostQueuedEvents:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v11 = "-[AFAnalytics boostQueuedEvents:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__AFAnalytics_boostQueuedEvents___block_invoke;
  v8[3] = &unk_1E592C6E8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v8);
  dispatch_async((dispatch_queue_t)self->_queue, v7);
}

uint64_t __33__AFAnalytics_boostQueuedEvents___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = 136315394;
    id v6 = "-[AFAnalytics boostQueuedEvents:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Completed boosting event producer queue %@", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)logInstrumentationOfType:(Class)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__AFAnalytics_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke;
  v11[3] = &unk_1E59293C0;
  Class v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __72__AFAnalytics_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 48));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) _service:1];
  [v2 logInstrumentationOfType:v3 machAbsoluteTime:*(void *)(a1 + 56) turnIdentifier:*(void *)(a1 + 40)];
}

- (void)logInstrumentationOfType:(Class)a3 turnIdentifier:(id)a4
{
  id v6 = a4;
  [(AFAnalytics *)self logInstrumentationOfType:a3 machAbsoluteTime:mach_absolute_time() turnIdentifier:v6];
}

- (void)endEventsGrouping
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AFAnalytics_endEventsGrouping__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __32__AFAnalytics_endEventsGrouping__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service:1];
  [v1 endEventsGrouping];
}

- (void)beginEventsGrouping
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AFAnalytics_beginEventsGrouping__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __34__AFAnalytics_beginEventsGrouping__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service:1];
  [v1 beginEventsGrouping];
}

- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnContext:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = +[AFPreferences sharedPreferences];
  int v11 = [v10 isDictationHIPAACompliant];

  if (v11)
  {
    id v12 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s Not logging instrumentation event %@ because we have HIPAA On-Device Dictation enabled: %@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if (!v8)
  {
    uint64_t v15 = AFSiriLogContextAnalytics;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    v30 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
    id v16 = "%s Attempted to log nil instrumentation event.";
    v17 = v15;
    uint32_t v18 = 12;
LABEL_12:
    _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_16;
  }
  if (!a4)
  {
    uint64_t v19 = AFSiriLogContextAnalytics;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315650;
    v30 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v9;
    id v16 = "%s Not logging instrumentation event %@ because it has no associated time. Turn context: %@";
    v17 = v19;
    uint32_t v18 = 32;
    goto LABEL_12;
  }
  objc_opt_class();
  Class v13 = SIReflectionInferEventTypeFromClass();
  if (v13)
  {
    queue = self->_queue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__AFAnalytics_logInstrumentation_machAbsoluteTime_turnContext___block_invoke;
    v24[3] = &unk_1E5929398;
    id v25 = v9;
    id v26 = v8;
    v27 = self;
    unint64_t v28 = a4;
    dispatch_async(queue, v24);
  }
  else
  {
    v20 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 136315650;
      v30 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
      __int16 v31 = 2112;
      id v32 = v23;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_error_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_ERROR, "%s Not logging instrumentation type %@ because it is of an unknown type. Context: %@", buf, 0x20u);
    }
  }

LABEL_16:
}

void __63__AFAnalytics_logInstrumentation_machAbsoluteTime_turnContext___block_invoke(uint64_t a1)
{
  id v7 = objc_alloc_init(MEMORY[0x1E4FA1280]);
  id v2 = [*(id *)(a1 + 32) turnID];
  id v3 = objc_alloc_init(MEMORY[0x1E4FA1288]);
  [v7 setEventMetadata:v3];

  id v4 = [v7 eventMetadata];
  [v4 setTurnID:v2];

  [v7 setEventType:*(void *)(a1 + 40)];
  int v5 = [*(id *)(a1 + 48) _service:1];
  id v6 = [v7 data];
  [v5 stageUEIEventData:v6 timestamp:*(void *)(a1 + 56) completion:0];
}

- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  int v11 = objc_alloc_init(SISchemaClientTurnContext);
  id v10 = AFTurnIdentifierGetBytes(v8);

  [(SISchemaClientTurnContext *)v11 setTurnID:v10];
  [(AFAnalytics *)self logInstrumentation:v9 machAbsoluteTime:a4 turnContext:v11];
}

- (void)logInstrumentation:(id)a3 turnContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AFAnalytics *)self logInstrumentation:v7 machAbsoluteTime:mach_absolute_time() turnContext:v6];
}

- (void)logEventWithType:(int64_t)a3 contextResolver:(id)a4
{
  id v7 = a4;
  uint64_t v6 = mach_absolute_time();
  kdebug_trace();
  [(AFAnalytics *)self logEventWithType:a3 machAbsoluteTime:v6 contextResolver:v7];
}

- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4 contextProvidingQueue:(id)a5
{
  id v8 = a5;
  id v10 = a4;
  uint64_t v9 = mach_absolute_time();
  kdebug_trace();
  [(AFAnalytics *)self logEventWithType:a3 machAbsoluteTime:v9 contextProvider:v10 contextProvidingQueue:v8];
}

- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4
{
  id v7 = a4;
  uint64_t v6 = mach_absolute_time();
  kdebug_trace();
  [(AFAnalytics *)self logEventWithType:a3 machAbsoluteTime:v6 contextProvider:v7 contextProvidingQueue:0];
}

- (void)logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  uint64_t v8 = mach_absolute_time();
  kdebug_trace();
  [(AFAnalytics *)self logEventWithType:a3 machAbsoluteTime:v8 context:v9 contextNoCopy:v5];
}

- (void)logEventWithType:(int64_t)a3 context:(id)a4
{
  id v7 = a4;
  uint64_t v6 = mach_absolute_time();
  kdebug_trace();
  [(AFAnalytics *)self logEventWithType:a3 machAbsoluteTime:v6 context:v7 contextNoCopy:0];
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a4)
  {
    [(AFAnalytics *)self logEventWithType:a3 machAbsoluteTime:a4 context:v8 contextNoCopy:0];
  }
  else
  {
    id v9 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      int v11 = AFAnalyticsEventTypeGetName(a3);
      int v12 = 136315650;
      Class v13 = "-[AFAnalytics logEventWithType:machAbsoluteTime:context:]";
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s Not logging event %@ because it has no associated time. Context: %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (AFAnalytics)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFAnalytics.m", 41, @"%s is marked as NS_UNAVAILABLE. Use the designated initializer instead.", "-[AFAnalytics init]");

  return 0;
}

- (void)logClientFeedbackPresented:(id)a3 dialogIdentifierProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 conformsToProtocol:&unk_1EEED6428])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __92__AFAnalytics_ClientFeedbackPresented__logClientFeedbackPresented_dialogIdentifierProvider___block_invoke;
    v8[3] = &unk_1E5929FE8;
    id v9 = v7;
    id v10 = self;
    objc_msgSend(v6, "_af_enumerateClientFeedbackDetails:", v8);
  }
}

void __92__AFAnalytics_ClientFeedbackPresented__logClientFeedbackPresented_dialogIdentifierProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v5 = v4;
  if (*(void *)a2) {
    [v4 setObject:*(void *)a2 forKey:@"aceId"];
  }
  uint64_t v6 = *(void *)(a2 + 8);
  if (v6) {
    [v5 setObject:v6 forKey:@"class"];
  }
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7) {
    [v5 setObject:v7 forKey:@"dialogPhase"];
  }
  uint64_t v8 = *(void *)(a2 + 24);
  if (v8)
  {
    [v5 setObject:v8 forKey:@"dialogIdentifier"];
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    if (v10 && *(void *)a2)
    {
      int v11 = objc_msgSend(v10, "associatedDialogIdentifiersForAceObjectIdentifier:");
      int v12 = [v11 firstObject];
      if (v12) {
        [v5 setObject:v12 forKey:@"dialogIdentifier"];
      }
    }
  }
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a2 + 32)];
  [v5 setObject:v9 forKey:@"listenAfterSpeaking"];

  [*(id *)(a1 + 40) logEventWithType:1924 context:v5];
  __destructor_8_s0_s8_s16_s24(a2);
}

- (void)logClientFeedbackPresented:(id)a3
{
}

- (id)newTurnBasedInstrumentationContext
{
  return +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:0 analytics:self];
}

@end