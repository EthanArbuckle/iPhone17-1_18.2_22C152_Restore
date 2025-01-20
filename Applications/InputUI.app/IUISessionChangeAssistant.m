@interface IUISessionChangeAssistant
+ (id)_responseForCompletedChangeContext:(id)a3;
- (BOOL)_changeHasNonUIKeyInputInputSource;
- (IUIRTIInputSource)incomingInputSource;
- (IUIRTIInputSource)outgoingInputSource;
- (IUISessionChangeAssistant)initWithController:(id)a3 sessionChangeContext:(id)a4 outgoingInputSource:(id)a5 incomingInputSource:(id)a6;
- (IUISessionChangeContext)sessionChangeContext;
- (IUISessionChangeController)controller;
- (void)finalizeSessionChange;
- (void)handleSetupNewDelegate:(id)a3;
- (void)handleTeardownExistingDelegate:(id)a3;
@end

@implementation IUISessionChangeAssistant

- (IUISessionChangeAssistant)initWithController:(id)a3 sessionChangeContext:(id)a4 outgoingInputSource:(id)a5 incomingInputSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IUISessionChangeAssistant;
  v15 = [(IUISessionChangeAssistant *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_controller, a3);
    objc_storeStrong((id *)&v16->_sessionChangeContext, a4);
    objc_storeStrong((id *)&v16->_outgoingInputSource, a5);
    objc_storeStrong((id *)&v16->_incomingInputSource, a6);
  }

  return v16;
}

+ (id)_responseForCompletedChangeContext:(id)a3
{
  v3 = [[IUISessionChangeResponse alloc] initWithResponseState:2];

  return v3;
}

- (void)handleTeardownExistingDelegate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_handledOutgoingInputSource)
  {
    if (v4)
    {
      v6 = sub_100003290();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_10000D7DC(v5, v6);
      }
LABEL_23:
    }
  }
  else
  {
    v7 = [(IUISessionChangeAssistant *)self outgoingInputSource];

    if (v7 == v5)
    {
      self->_handledOutgoingInputSource = 1;
      v6 = v5;
      v8 = [(IUISessionChangeAssistant *)self sessionChangeContext];
      v9 = [v8 sessionChange];
      v10 = sub_100003290();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = sub_100004BA0(v6);
        int v23 = 136315650;
        v24 = "-[IUISessionChangeAssistant handleTeardownExistingDelegate:]";
        __int16 v25 = 2112;
        v26 = v11;
        __int16 v27 = 2112;
        v28 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s  outgoingInputSource: %@, sessionChange: %@", (uint8_t *)&v23, 0x20u);
      }
      id v12 = [(IUISessionChangeAssistant *)self controller];
      [v12 setCurrentSession:0];

      if (v6)
      {
        if ([v9 isEndingSession])
        {
          id v13 = [v9 endSessionID];
          id v14 = [v6 sourceSession];
          v15 = [v14 uuid];
          unsigned __int8 v16 = [v13 isEqual:v15];

          if ((v16 & 1) == 0)
          {
            v17 = sub_100003290();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_10000D66C();
            }
          }
        }
        if ([v6 isPlaceholder])
        {
          objc_super v18 = sub_100003290();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_10000D5E8(v18);
          }
        }
        [v6 setDataTransportDelegate:0];
        [v6 removeFromSuperview];
      }
      v19 = objc_opt_class();
      v20 = [(IUISessionChangeAssistant *)self sessionChangeContext];
      v21 = [v19 _responseForCompletedChangeContext:v20];

      v22 = [v8 completion];
      ((void (**)(void, void *))v22)[2](v22, v21);

      goto LABEL_23;
    }
    if (v5)
    {
      v6 = sub_100003290();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_10000D724();
      }
      goto LABEL_23;
    }
  }
}

- (void)handleSetupNewDelegate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_handledIncomingInputSource)
  {
    v5 = sub_100003290();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000DB34();
    }
  }
  else
  {
    if (!self->_handledOutgoingInputSource)
    {
      v6 = sub_100003290();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10000DA7C();
      }

      v7 = [(IUISessionChangeAssistant *)self outgoingInputSource];
      [(IUISessionChangeAssistant *)self handleTeardownExistingDelegate:v7];
    }
    id v8 = [(IUISessionChangeAssistant *)self incomingInputSource];

    if (v8 == v4)
    {
      self->_handledIncomingInputSource = 1;
      v5 = v4;
      v9 = [(IUISessionChangeAssistant *)self sessionChangeContext];
      v10 = [v9 sessionChange];
      id v11 = sub_100003290();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = sub_100004BA0(v5);
        int v24 = 136315650;
        __int16 v25 = "-[IUISessionChangeAssistant handleSetupNewDelegate:]";
        __int16 v26 = 2112;
        __int16 v27 = v12;
        __int16 v28 = 2112;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s  incomingInputSource: %@, sessionChange: %@", (uint8_t *)&v24, 0x20u);
      }
      if (v5)
      {
        if ([v10 isBeginningSession])
        {
          id v13 = [v10 beginSessionID];
          id v14 = [v5 sourceSession];
          v15 = [v14 uuid];
          unsigned __int8 v16 = [v13 isEqual:v15];

          if ((v16 & 1) == 0)
          {
            v17 = sub_100003290();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_10000D90C();
            }
          }
        }
        if ([v5 isPlaceholder])
        {
          objc_super v18 = sub_100003290();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_10000D888(v18);
          }
        }
        v19 = [(IUISessionChangeAssistant *)self controller];
        [v5 setDataTransportDelegate:v19];

        v20 = [(IUISessionChangeAssistant *)self controller];
        [v20 setTextInputSource:v5];

        if ([v10 isBeginningSession])
        {
          v21 = [v9 session];
        }
        else
        {
          v21 = 0;
        }
        int v23 = [(IUISessionChangeAssistant *)self controller];
        [v23 setCurrentSession:v21];
      }
      else
      {
        v22 = [(IUISessionChangeAssistant *)self controller];
        [v22 setTextInputSource:0];

        v21 = [(IUISessionChangeAssistant *)self controller];
        [v21 setCurrentSession:0];
      }
    }
    else
    {
      if (!v4) {
        goto LABEL_5;
      }
      v5 = sub_100003290();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_10000D9C4();
      }
    }
  }

LABEL_5:
}

- (BOOL)_changeHasNonUIKeyInputInputSource
{
  uint64_t v3 = [(IUISessionChangeAssistant *)self outgoingInputSource];
  if (v3
    && (id v4 = (void *)v3,
        [(IUISessionChangeAssistant *)self outgoingInputSource],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___UIKeyInput],
        v5,
        v4,
        !v6))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v7 = [(IUISessionChangeAssistant *)self incomingInputSource];
    if (v7)
    {
      id v8 = [(IUISessionChangeAssistant *)self incomingInputSource];
      unsigned int v9 = [v8 conformsToProtocol:&OBJC_PROTOCOL___UIKeyInput] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (void)finalizeSessionChange
{
  if (!self->_handledOutgoingInputSource || !self->_handledIncomingInputSource)
  {
    unsigned int v3 = [(IUISessionChangeAssistant *)self _changeHasNonUIKeyInputInputSource];
    id v4 = sub_100003290();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v6 = [(IUISessionChangeAssistant *)self sessionChangeContext];
        v7 = [v6 sessionChange];
        id v8 = [(IUISessionChangeAssistant *)self outgoingInputSource];
        unsigned int v9 = sub_100004BA0(v8);
        v10 = [(IUISessionChangeAssistant *)self incomingInputSource];
        id v11 = sub_100004BA0(v10);
        int v14 = 136315906;
        v15 = "-[IUISessionChangeAssistant finalizeSessionChange]";
        __int16 v16 = 2112;
        v17 = v7;
        __int16 v18 = 2112;
        v19 = v9;
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  Outgoing or incoming input source not handled during -become/resignFirstResponder due to non-UIKeyInput-conforming input source. Handling now. (sessionChange: %@, outgoingInputSource: %@, incomingInputSource: %@)", (uint8_t *)&v14, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      sub_10000DBEC(self, v5);
    }
  }
  if (!self->_handledOutgoingInputSource)
  {
    id v12 = [(IUISessionChangeAssistant *)self outgoingInputSource];
    [(IUISessionChangeAssistant *)self handleTeardownExistingDelegate:v12];
  }
  if (!self->_handledIncomingInputSource)
  {
    id v13 = [(IUISessionChangeAssistant *)self incomingInputSource];
    [(IUISessionChangeAssistant *)self handleSetupNewDelegate:v13];
  }
}

- (IUISessionChangeController)controller
{
  return self->_controller;
}

- (IUISessionChangeContext)sessionChangeContext
{
  return self->_sessionChangeContext;
}

- (IUIRTIInputSource)outgoingInputSource
{
  return self->_outgoingInputSource;
}

- (IUIRTIInputSource)incomingInputSource
{
  return self->_incomingInputSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingInputSource, 0);
  objc_storeStrong((id *)&self->_outgoingInputSource, 0);
  objc_storeStrong((id *)&self->_sessionChangeContext, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end