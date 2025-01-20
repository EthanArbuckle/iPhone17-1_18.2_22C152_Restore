@interface DTTapLocal
- (BOOL)_canFetchWhileArchiving;
- (DTTapLocal)initWithConfig:(id)a3 memoHandler:(id)a4 delegate:(id)a5;
- (DTTapLocalDelegate)delegate;
- (id)_fetchDataForReason:(unint64_t)a3;
- (void)_handleStatusMemo:(id)a3;
- (void)_pause;
- (void)_start;
- (void)_stop;
- (void)_unpause;
@end

@implementation DTTapLocal

- (DTTapLocal)initWithConfig:(id)a3 memoHandler:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DTTapLocal;
  v11 = [(DTTap *)&v17 initWithConfig:v8 memoHandler:v9];
  v12 = v11;
  if (v11)
  {
    if (!v10) {
      sub_23093E0F0();
    }
    p_delegate = (id *)&v11->_delegate;
    objc_storeStrong((id *)&v11->_delegate, a5);
    [*p_delegate setTap:v12];
    v14 = [*p_delegate validateConfig];
    if (v14)
    {
      [(DTTapLocal *)v12 _handleStatusMemo:v14];
      char v15 = 0;
    }
    else
    {
      char v15 = 1;
    }
    v12->_validConfig = v15;
  }
  return v12;
}

- (void)_start
{
  if (self->_validConfig)
  {
    v4 = [(DTTap *)self config];
    uint64_t v5 = [v4 pollingInterval];

    if (v5)
    {
      v6 = [(DTTap *)self serialQueue];
      if (self->_pollTimer)
      {
        v13 = [MEMORY[0x263F08690] currentHandler];
        [v13 handleFailureInMethod:a2 object:self file:@"DTTapLocal.m" lineNumber:57 description:@"Seems like the timer is still running"];
      }
      v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v6);
      pollTimer = self->_pollTimer;
      self->_pollTimer = v7;

      id v9 = self->_pollTimer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = sub_2308DCC18;
      handler[3] = &unk_264B8D590;
      handler[4] = self;
      dispatch_source_set_event_handler(v9, handler);
      id v10 = self->_pollTimer;
      dispatch_time_t v11 = dispatch_time(0, v5);
      dispatch_source_set_timer(v10, v11, v5, 0x4C4B40uLL);
      dispatch_resume((dispatch_object_t)self->_pollTimer);
    }
    v12 = [(DTTapLocal *)self delegate];
    [v12 start];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      sub_23093E11C(self);
    }
  }
}

- (void)_stop
{
  if (self->_validConfig)
  {
    pollTimer = self->_pollTimer;
    if (pollTimer)
    {
      dispatch_source_cancel(pollTimer);
      v4 = self->_pollTimer;
      self->_pollTimer = 0;
    }
    uint64_t v5 = [(DTTapLocal *)self delegate];
    [v5 stop];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      sub_23093E1A4(self);
    }
  }
}

- (void)_pause
{
  if (self->_validConfig)
  {
    v3 = [(DTTapLocal *)self delegate];
    [v3 pause];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      sub_23093E22C(self);
    }
  }
}

- (void)_unpause
{
  if (self->_validConfig)
  {
    v3 = [(DTTapLocal *)self delegate];
    [v3 unpause];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      sub_23093E2B4(self);
    }
  }
}

- (BOOL)_canFetchWhileArchiving
{
  v2 = [(DTTapLocal *)self delegate];
  char v3 = [v2 canFetchWhileArchiving];

  return v3;
}

- (id)_fetchDataForReason:(unint64_t)a3
{
  if (self->_validConfig)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_2308DCFA4;
    v19 = sub_2308DCFB4;
    id v20 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    int v14 = 0;
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    uint64_t v5 = [(DTTapLocal *)self delegate];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_2308DCFBC;
    v8[3] = &unk_264B8F7E0;
    v8[7] = &v15;
    v8[8] = a3;
    v8[4] = self;
    v8[5] = v13;
    v8[6] = &v9;
    [v5 fetchDataForReason:a3 block:v8];

    if (!*((unsigned char *)v10 + 24)) {
      __assert_rtn("-[DTTapLocal _fetchDataForReason:]", "DTTapLocal.m", 157, "sawLastMemo");
    }
    id v6 = (id)v16[5];
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)_handleStatusMemo:(id)a3
{
  id v8 = a3;
  v4 = [(DTTap *)self config];
  uint64_t v5 = [v4 statusHandler];

  if (v5)
  {
    id v6 = [(DTTap *)self memoHandler];
    id v7 = (id)[v6 handleMemo:v8];
  }
}

- (DTTapLocalDelegate)delegate
{
  return (DTTapLocalDelegate *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
}

@end