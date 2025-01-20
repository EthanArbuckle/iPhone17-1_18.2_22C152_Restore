@interface RMConnectionClient
- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6;
- (void)endpoint:(id)a3 didReceiveStreamedData:(id)a4;
- (void)endpointWasInterrupted:(id)a3;
- (void)endpointWasInvalidated:(id)a3;
@end

@implementation RMConnectionClient

- (void)endpointWasInterrupted:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v7 = (RMConnectionEndpoint *)a3;
  if (!self) {
    goto LABEL_14;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  for (i = self->_endpoint; i != v7; i = 0)
  {
    v5 = sub_19047D10C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "endpoint == self.endpoint";
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v6 = sub_19047D10C();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "endpoint == self.endpoint";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Received interruption event for an unmanaged endpoint", "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_19047D10C();
    self = (RMConnectionClient *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "endpoint == self.endpoint";
      _os_log_impl(&dword_1902AF000, &self->super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
LABEL_14:
    dispatch_assert_queue_V2(0);
  }
  sub_19047D740((uint64_t)self);
  sub_19047CE5C((uint64_t)self);
}

- (void)endpointWasInvalidated:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    endpoint = self->_endpoint;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    endpoint = 0;
  }
  if (endpoint != (RMConnectionEndpoint *)v4)
  {
    v13 = sub_19047D10C();
    p_connectionTimer = (OS_dispatch_source **)"assert";
    self = (RMConnectionClient *)"endpoint == self.endpoint";
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2082;
      v21 = "assert";
      __int16 v22 = 2081;
      v23 = "endpoint == self.endpoint";
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    __int16 v14 = sub_19047D10C();
    if (os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2082;
      v21 = "assert";
      __int16 v22 = 2081;
      v23 = "endpoint == self.endpoint";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Received invalidation event for an unmanaged endpoint", "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v4 = sub_19047D10C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2082;
      v21 = "assert";
      __int16 v22 = 2081;
      v23 = "endpoint == self.endpoint";
      _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
    goto LABEL_21;
  }
  sub_19047D740((uint64_t)self);
  if (v4)
  {
    objc_storeWeak((id *)&v4[3].isa, 0);
    objc_storeWeak((id *)&v4[2].isa, 0);
  }
  if (self)
  {
    objc_storeStrong((id *)&self->_endpoint, 0);
    if (self->_valid)
    {
      p_connectionTimer = &self->_connectionTimer;
      if (!self->_connectionTimer)
      {
        if (qword_1E929DE08 == -1)
        {
LABEL_10:
          v7 = qword_1E929DE10;
          if (os_log_type_enabled((os_log_t)qword_1E929DE10, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEBUG, "Connection invalidated, setting up the reconnection timer", buf, 2u);
          }
          v8 = self->_queue;
          dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v8);
          objc_storeStrong((id *)p_connectionTimer, v9);

          self->_connectionTimerDelay = 4;
          __int16 v10 = self->_connectionTimer;
          dispatch_time_t v11 = dispatch_time(0, 4000000000);
          dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);

          connectionTimer = self->_connectionTimer;
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = sub_19047E1F4;
          handler[3] = &unk_1E568D980;
          handler[4] = self;
          dispatch_source_set_event_handler(connectionTimer, handler);
          dispatch_resume((dispatch_object_t)self->_connectionTimer);
          goto LABEL_13;
        }
LABEL_21:
        dispatch_once(&qword_1E929DE08, &unk_1EDFD1740);
        goto LABEL_10;
      }
    }
  }
LABEL_13:
}

- (void)endpoint:(id)a3 didReceiveStreamedData:(id)a4
{
  if (self) {
    self = (RMConnectionClient *)self->_streamingDataCallback;
  }
  ((void (*)(RMConnectionClient *, id, void))self->_endpoint)(self, a4, 0);
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  if (self) {
    self = (RMConnectionClient *)self->_messageHandler;
  }
  ((void (*)(RMConnectionClient *, id, id, id))self->_endpoint)(self, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_messageCache, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_streamingDataCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end