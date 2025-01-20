@interface ASDTPMActionAnalyticsEvent
- (ASDTPMActionAnalyticsEvent)initWithConfig:(id)a3 forSequencer:(id)a4;
- (NSString)eventName;
- (id)deviceName;
- (id)eventData;
- (int)action;
- (void)sendEventNamed:(id)a3 withData:(id)a4;
- (void)setEventName:(id)a3;
@end

@implementation ASDTPMActionAnalyticsEvent

- (ASDTPMActionAnalyticsEvent)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDTPMActionAnalyticsEvent;
  v7 = [(ASDTPMAction *)&v13 initWithConfig:v6 forSequencer:a4];
  if (v7
    && ([v6 asdtPMActionAnalyticsEventName],
        v8 = objc_claimAutoreleasedReturnValue(),
        [(ASDTPMActionAnalyticsEvent *)v7 setEventName:v8],
        v8,
        [(ASDTPMActionAnalyticsEvent *)v7 eventName],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMActionAnalyticsEvent initWithConfig:forSequencer:](v7, (uint64_t)v6, v11);
    }

    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)deviceName
{
  v2 = NSString;
  v3 = [(ASDTPMActionAnalyticsEvent *)self eventName];
  v4 = [v2 stringWithFormat:@"AnalyticsEvent:%@", v3];

  return v4;
}

- (id)eventData
{
  return 0;
}

- (void)sendEventNamed:(id)a3 withData:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __54__ASDTPMActionAnalyticsEvent_sendEventNamed_withData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int)action
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(ASDTPMActionAnalyticsEvent *)self eventData];
  if (v3)
  {
    id v4 = ASDTBaseLogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(ASDTPMDevice *)self name];
      id v6 = [(ASDTPMActionAnalyticsEvent *)self eventName];
      int v9 = 138412802;
      v10 = v5;
      __int16 v11 = 2112;
      v12 = v6;
      __int16 v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2489BC000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@: %@", (uint8_t *)&v9, 0x20u);
    }
    v7 = [(ASDTPMActionAnalyticsEvent *)self eventName];
    [(ASDTPMActionAnalyticsEvent *)self sendEventNamed:v7 withData:v3];
  }
  return 0;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithConfig:(NSObject *)a3 forSequencer:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 name];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_2489BC000, a3, OS_LOG_TYPE_ERROR, "%@: Event name must be defined in config: %@", (uint8_t *)&v6, 0x16u);
}

@end