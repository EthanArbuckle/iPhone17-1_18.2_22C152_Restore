@interface DSCoreAnalyticsEventHandler
- (DSCoreAnalyticsEventHandler)init;
- (void)dsFirstListenerSessionSetUnsuccessful;
- (void)dsProviderAvailable;
- (void)dsProviderUnavailable;
- (void)dsSessionCompletedWithStopReason:(int)a3 numHeartbeats:(unint64_t)a4 numMotionStateMessages:(unint64_t)a5 activeProviderLostCount:(unint64_t)a6 dataLinkType:(int)a7 maxListenerClients:(unint64_t)a8 avgListenerStartInterval:(double)a9;
- (void)dsSessionStartedWithDeviceRole:(int)a3 numPotentialProviders:(unint64_t)a4 unterminatedSession:(BOOL)a5;
@end

@implementation DSCoreAnalyticsEventHandler

- (DSCoreAnalyticsEventHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)DSCoreAnalyticsEventHandler;
  v2 = [(DSCoreAnalyticsEventHandler *)&v6 init];
  v3 = v2;
  if (v2)
  {
    sessionMetric = v2->_sessionMetric;
    v2->_sessionMetric = 0;
  }
  return v3;
}

- (void)dsSessionStartedWithDeviceRole:(int)a3 numPotentialProviders:(unint64_t)a4 unterminatedSession:(BOOL)a5
{
  if (self->_sessionMetric)
  {
    v5 = +[DSLogging sharedInstance];
    objc_super v6 = [v5 dsLogger];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      v7 = "[DSCoreAnalytics] session metric already exists\n";
      v8 = (uint8_t *)&v17;
LABEL_6:
      _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    BOOL v9 = a5;
    uint64_t v11 = *(void *)&a3;
    v13 = objc_alloc_init(DSSessionMetric);
    sessionMetric = self->_sessionMetric;
    self->_sessionMetric = v13;

    [(DSSessionMetric *)self->_sessionMetric dsSessionStartedWithDeviceRole:v11 numPotentialProviders:a4 unterminatedSession:v9];
    v15 = +[DSLogging sharedInstance];
    objc_super v6 = [v15 dsLogger];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      v7 = "[DSCoreAnalytics] session metric collection started\n";
      v8 = (uint8_t *)&v16;
      goto LABEL_6;
    }
  }
}

- (void)dsProviderAvailable
{
  sessionMetric = self->_sessionMetric;
  if (sessionMetric)
  {
    [(DSSessionMetric *)sessionMetric dsProviderAvailable];
  }
  else
  {
    v3 = +[DSLogging sharedInstance];
    v4 = [v3 dsLogger];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] null metric during provider availability update\n", v5, 2u);
    }
  }
}

- (void)dsProviderUnavailable
{
  sessionMetric = self->_sessionMetric;
  if (sessionMetric)
  {
    [(DSSessionMetric *)sessionMetric dsProviderUnavailable];
  }
  else
  {
    v3 = +[DSLogging sharedInstance];
    v4 = [v3 dsLogger];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] null metric during provider unavailability update\n", v5, 2u);
    }
  }
}

- (void)dsFirstListenerSessionSetUnsuccessful
{
  sessionMetric = self->_sessionMetric;
  if (sessionMetric)
  {
    [(DSSessionMetric *)sessionMetric dsFirstListenerSessionSetUnsuccessful];
  }
  else
  {
    v3 = +[DSLogging sharedInstance];
    v4 = [v3 dsLogger];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] null metric during first listener session update\n", v5, 2u);
    }
  }
}

- (void)dsSessionCompletedWithStopReason:(int)a3 numHeartbeats:(unint64_t)a4 numMotionStateMessages:(unint64_t)a5 activeProviderLostCount:(unint64_t)a6 dataLinkType:(int)a7 maxListenerClients:(unint64_t)a8 avgListenerStartInterval:(double)a9
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  sessionMetric = self->_sessionMetric;
  if (sessionMetric)
  {
    [(DSSessionMetric *)sessionMetric dsSessionCompletedWithStopReason:*(void *)&a3 numHeartbeats:a4 numMotionStateMessages:a5 activeProviderLostCount:a6 dataLinkType:*(void *)&a7 maxListenerClients:a8 avgListenerStartInterval:a9];
    uint64_t v11 = [(DSSessionMetric *)self->_sessionMetric sessionMetricFinalize];
    v12 = [v11 copy];

    v13 = +[DSLogging sharedInstance];
    v14 = [v13 dsLogger];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v14, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] session metric collection completed\n", buf, 2u);
    }

    v15 = [(DSSessionMetric *)self->_sessionMetric eventName];
    __int16 v16 = (void *)[v15 copy];

    if (v12)
    {
      if (v16)
      {
        if (![v12 count])
        {
LABEL_11:

          goto LABEL_14;
        }
        __int16 v17 = +[DSLogging sharedInstance];
        v18 = [v17 dsLogger];

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v16;
          _os_log_impl(&dword_223BD6000, v18, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] submitting Event %@ to Core Analytics\n", buf, 0xCu);
        }

        v24 = v12;
        AnalyticsSendEventLazy();
        v19 = v24;
LABEL_10:

        goto LABEL_11;
      }
      v23 = +[DSLogging sharedInstance];
      v19 = [v23 dsLogger];

      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      v22 = "[DSCoreAnalytics] null event name\n";
    }
    else
    {
      v21 = +[DSLogging sharedInstance];
      v19 = [v21 dsLogger];

      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      v22 = "[DSCoreAnalytics] null event dictionary\n";
    }
    _os_log_impl(&dword_223BD6000, v19, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    goto LABEL_10;
  }
  v20 = +[DSLogging sharedInstance];
  v12 = [v20 dsLogger];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] null metric during session stop\n", buf, 2u);
  }
LABEL_14:
}

id __182__DSCoreAnalyticsEventHandler_dsSessionCompletedWithStopReason_numHeartbeats_numMotionStateMessages_activeProviderLostCount_dataLinkType_maxListenerClients_avgListenerStartInterval___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
}

@end