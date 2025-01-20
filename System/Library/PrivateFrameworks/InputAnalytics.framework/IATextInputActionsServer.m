@interface IATextInputActionsServer
- (IASServerAnalyticsDelegate)serverDelegate;
- (IASTextInputActionsAnalyzer)analyzer;
- (IATextInputActionsServer)initWithEventHandler:(id)a3;
- (NSMutableOrderedSet)recentActions;
- (OS_dispatch_queue)queue;
- (void)consumeAction:(id)a3;
- (void)dispatchEventToCoreAnalytics;
- (void)enumerateTextInputActionsAnalytics;
- (void)q_flushRecentActions;
- (void)setAnalyzer:(id)a3;
- (void)setKeyboardTrialParameters:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecentActions:(id)a3;
- (void)setServerDelegate:(id)a3;
@end

@implementation IATextInputActionsServer

- (IATextInputActionsServer)initWithEventHandler:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IATextInputActionsServer;
  v5 = [(IATextInputActionsServer *)&v20 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.inputAnalytics.IATextInputActionsServer", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc(MEMORY[0x263EFF9B0]);
    uint64_t v12 = objc_msgSend_initWithCapacity_(v9, v10, 20, v11);
    recentActions = v5->_recentActions;
    v5->_recentActions = (NSMutableOrderedSet *)v12;

    v14 = [IASTextInputActionsAnalyzer alloc];
    uint64_t v17 = objc_msgSend_initWithEventHandler_(v14, v15, (uint64_t)v4, v16);
    analyzer = v5->_analyzer;
    v5->_analyzer = (IASTextInputActionsAnalyzer *)v17;
  }
  return v5;
}

- (void)consumeAction:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_analyzer(self, v5, v6, v7);
  objc_msgSend_consumeAction_(v8, v9, (uint64_t)v4, v10);

  v14 = objc_msgSend_asEnd(v4, v11, v12, v13);

  if (v14)
  {
    MEMORY[0x270F9A6D0](self, sel_enumerateTextInputActionsAnalytics, v15, v16);
  }
}

- (void)enumerateTextInputActionsAnalytics
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2529F5A34;
  block[3] = &unk_265387408;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dispatchEventToCoreAnalytics
{
  objc_msgSend_analyzer(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateAnalytics(v7, v4, v5, v6);
}

- (void)q_flushRecentActions
{
  objc_msgSend_removeAllObjects(self->_recentActions, a2, v2, v3);
}

- (void)setKeyboardTrialParameters:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2529F5BE0;
  v7[3] = &unk_265387430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (IASServerAnalyticsDelegate)serverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  return (IASServerAnalyticsDelegate *)WeakRetained;
}

- (void)setServerDelegate:(id)a3
{
}

- (IASTextInputActionsAnalyzer)analyzer
{
  return self->_analyzer;
}

- (void)setAnalyzer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableOrderedSet)recentActions
{
  return self->_recentActions;
}

- (void)setRecentActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentActions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_destroyWeak((id *)&self->_serverDelegate);
}

@end