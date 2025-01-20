@interface CALNEKTravelEngine
- (BOOL)isActive;
- (CALNEKTravelEngine)initWithTravelEngine:(id)a3;
- (CALNTravelEngineDelegate)delegate;
- (EKTravelEngine)travelEngine;
- (id)_adviceReceivedBlock;
- (id)_authorizationChangedBlock;
- (id)_eventSignficantlyChangedBlock;
- (void)activate;
- (void)cancelHypothesisRefreshRequestForEventWithExternalURL:(id)a3;
- (void)ceaseMonitoringForEventWithExternalURL:(id)a3;
- (void)deactivate;
- (void)didRegisterForAlarms;
- (void)receivedAlarmNamed:(id)a3;
- (void)receivedNotificationNamed:(id)a3;
- (void)requestHypothesisRefreshAtDate:(id)a3 forEventWithExternalURL:(id)a4;
- (void)sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:(id)a3;
- (void)sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CALNEKTravelEngine

- (void)receivedNotificationNamed:(id)a3
{
  id v4 = a3;
  if ([(CALNEKTravelEngine *)self isActive])
  {
    v5 = [(CALNEKTravelEngine *)self travelEngine];
    [v5 handleDarwinNotification:v4];
  }
  else
  {
    v5 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CALNEKTravelEngine receivedNotificationNamed:]((uint64_t)v4, v5);
    }
  }
}

- (EKTravelEngine)travelEngine
{
  return self->_travelEngine;
}

- (BOOL)isActive
{
  return self->_active;
}

- (CALNEKTravelEngine)initWithTravelEngine:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNEKTravelEngine;
  v6 = [(CALNEKTravelEngine *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_travelEngine, a3);
  }

  return v7;
}

- (void)activate
{
  if ([MEMORY[0x263F04BA0] isTravelAdvisorySupported])
  {
    v3 = [(CALNEKTravelEngine *)self travelEngine];
    id v4 = [(CALNEKTravelEngine *)self _adviceReceivedBlock];
    [v3 setAdviceBlock:v4];

    id v5 = [(CALNEKTravelEngine *)self _eventSignficantlyChangedBlock];
    [v3 setEventSignificantlyChangedBlock:v5];

    objc_initWeak(location, self);
    objc_initWeak(&from, v3);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __30__CALNEKTravelEngine_activate__block_invoke;
    v6[3] = &unk_2645C1600;
    objc_copyWeak(&v7, location);
    objc_copyWeak(&v8, &from);
    [v3 setAuthorizationChangedBlock:v6];
    [(CALNEKTravelEngine *)self setActive:1];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    v3 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Travel advisories are not supported. Will not start travel engine.", (uint8_t *)location, 2u);
    }
  }
}

void __30__CALNEKTravelEngine_activate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [v2 authorized];
  id v4 = [WeakRetained _authorizationChangedBlock];
  v4[2](v4, v3);
}

- (void)deactivate
{
  if ([MEMORY[0x263F04BA0] isTravelAdvisorySupported])
  {
    [(CALNEKTravelEngine *)self setActive:0];
    id v4 = [(CALNEKTravelEngine *)self travelEngine];
    [v4 stop];
  }
  else
  {
    uint64_t v3 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Travel advisories are not supported. Will not stop travel engine.", buf, 2u);
    }
  }
}

- (void)didRegisterForAlarms
{
  OUTLINED_FUNCTION_1_4();
  _os_log_fault_impl(&dword_2216BB000, v0, OS_LOG_TYPE_FAULT, "Travel engine wrapper received did register for did register for alarms message but the travel engine wrapper is not active. Cannot start travel engine.", v1, 2u);
}

- (void)receivedAlarmNamed:(id)a3
{
  id v4 = a3;
  if ([(CALNEKTravelEngine *)self isActive])
  {
    id v5 = [(CALNEKTravelEngine *)self travelEngine];
    [v5 receivedAlarmNamed:v4];
  }
  else
  {
    id v5 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CALNEKTravelEngine receivedAlarmNamed:]((uint64_t)v4, v5);
    }
  }
}

- (void)requestHypothesisRefreshAtDate:(id)a3 forEventWithExternalURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CALNEKTravelEngine *)self travelEngine];
  [v8 requestHypothesisRefreshAtDate:v7 forEventWithExternalURL:v6];
}

- (void)cancelHypothesisRefreshRequestForEventWithExternalURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNEKTravelEngine *)self travelEngine];
  [v5 cancelHypothesisRefreshRequestForEventWithExternalURL:v4];
}

- (void)ceaseMonitoringForEventWithExternalURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNEKTravelEngine *)self travelEngine];
  [v5 ceaseMonitoringForEventWithExternalURL:v4];
}

- (void)sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNEKTravelEngine *)self travelEngine];
  [v5 sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:v4];
}

- (void)sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNEKTravelEngine *)self travelEngine];
  [v5 sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:v4];
}

- (id)_adviceReceivedBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__CALNEKTravelEngine__adviceReceivedBlock__block_invoke;
  v4[3] = &unk_2645C1628;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)MEMORY[0x223C88F20](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __42__CALNEKTravelEngine__adviceReceivedBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v9 = [WeakRetained delegate];
    v10 = v9;
    if (v9)
    {
      [v9 travelEngine:v8 receivedHypothesis:v6 eventExternalURL:v5];
    }
    else
    {
      v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __42__CALNEKTravelEngine__adviceReceivedBlock__block_invoke_cold_1();
      }
    }
  }
}

- (id)_eventSignficantlyChangedBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__CALNEKTravelEngine__eventSignficantlyChangedBlock__block_invoke;
  v4[3] = &unk_2645C1650;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)MEMORY[0x223C88F20](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __52__CALNEKTravelEngine__eventSignficantlyChangedBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained delegate];
    id v7 = v6;
    if (v6)
    {
      [v6 travelEngine:v5 eventSignificantlyChangedWithEventExternalURL:v3];
    }
    else
    {
      id v8 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __52__CALNEKTravelEngine__eventSignficantlyChangedBlock__block_invoke_cold_1();
      }
    }
  }
}

- (id)_authorizationChangedBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__CALNEKTravelEngine__authorizationChangedBlock__block_invoke;
  v4[3] = &unk_2645C1678;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)MEMORY[0x223C88F20](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __48__CALNEKTravelEngine__authorizationChangedBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained delegate];
    id v6 = v5;
    if (v5)
    {
      [v5 travelEngine:v4 authorizationChanged:a2];
    }
    else
    {
      id v7 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __48__CALNEKTravelEngine__authorizationChangedBlock__block_invoke_cold_1();
      }
    }
  }
}

- (CALNTravelEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CALNTravelEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelEngine, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)receivedNotificationNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Received notification but travel engine is not active. notification name = %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)receivedAlarmNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Received alarm but travel engine is not active. alarm name = %{public}@", (uint8_t *)&v2, 0xCu);
}

void __42__CALNEKTravelEngine__adviceReceivedBlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2(&dword_2216BB000, v0, v1, "No delegate exists to send travel advice received message", v2, v3, v4, v5, v6);
}

void __52__CALNEKTravelEngine__eventSignficantlyChangedBlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2(&dword_2216BB000, v0, v1, "No delegate exists to send event significantly changed message", v2, v3, v4, v5, v6);
}

void __48__CALNEKTravelEngine__authorizationChangedBlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2(&dword_2216BB000, v0, v1, "No delegate exists to send authorization changed message", v2, v3, v4, v5, v6);
}

@end