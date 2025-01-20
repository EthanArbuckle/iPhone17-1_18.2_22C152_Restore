@interface CDPDSecureChannelContext
- (BOOL)initialize:(id *)a3;
- (BOOL)initializePiggybackingChannel:(id *)a3;
- (CDPContext)context;
- (CDPDCircleProxy)circleProxy;
- (CDPDSecureChannelContext)initWithContext:(id)a3 channel:(id)a4 dataProvider:(id)a5 circleProxy:(id)a6;
- (CDPDSecureChannelContext)initWithContext:(id)a3 circleProxy:(id)a4;
- (CDPKeychainCircleProxy)keychainCircleProxy;
- (CDPSecureChannelProxy)secureChannelProxy;
- (unint64_t)secureChannelType;
- (void)dealloc;
- (void)initializeTTSUChannel;
- (void)setCircleProxy:(id)a3;
- (void)setFlowIDFromRequester:(id)a3;
- (void)setKeychainCircleProxy:(id)a3;
- (void)setSecureChannelProxy:(id)a3;
- (void)setSecureChannelType:(unint64_t)a3;
@end

@implementation CDPDSecureChannelContext

- (CDPDSecureChannelContext)initWithContext:(id)a3 circleProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CDPDSecureChannelContext *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_circleProxy, a4);
  }

  return v10;
}

- (CDPDSecureChannelContext)initWithContext:(id)a3 channel:(id)a4 dataProvider:(id)a5 circleProxy:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(CDPDSecureChannelContext *)self init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_keychainCircleProxy, a5);
    objc_storeStrong((id *)&v16->_secureChannelProxy, a4);
    objc_storeStrong((id *)&v16->_circleProxy, a6);
  }

  return v16;
}

- (BOOL)initialize:(id *)a3
{
  if (self->_keychainCircleProxy && self->_secureChannelProxy)
  {
    v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Context already initialized, returning...", buf, 2u);
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    v5 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:*MEMORY[0x263F34748] category:*MEMORY[0x263F34830]];
    if ([(CDPContext *)self->_context isPiggybackingRecovery])
    {
      id v7 = _CDPLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Initializing piggybacking channel", v17, 2u);
      }

      self->_secureChannelType = 1;
      id v16 = 0;
      BOOL v6 = [(CDPDSecureChannelContext *)self initializePiggybackingChannel:&v16];
      id v8 = v16;
    }
    else if ([(CDPContext *)self->_context isTTSURecovery])
    {
      v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Initializing TTSU channel", v15, 2u);
      }

      self->_secureChannelType = 2;
      [(CDPDSecureChannelContext *)self initializeTTSUChannel];
      id v8 = 0;
      BOOL v6 = 1;
    }
    else
    {
      _CDPStateError();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v6 = 0;
    }
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self, "secureChannelType"));
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F34770]];

    id v11 = [NSNumber numberWithBool:v6];
    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x263F34558]];

    [v5 populateUnderlyingErrorsStartingWithRootError:v8];
    id v12 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v12 sendEvent:v5];

    if (v8)
    {
      id v13 = _CDPLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureChannelContext initialize:]((uint64_t)v8, v13);
      }

      if (a3) {
        *a3 = v8;
      }
    }
  }
  return v6;
}

- (BOOL)initializePiggybackingChannel:(id *)a3
{
  v5 = [(CDPContext *)self->_context duplexSession];
  id v12 = 0;
  BOOL v6 = +[CDPPiggybackingPayloadProvider proxyWithSession:v5 error:&v12];
  id v7 = v12;
  keychainCircleProxy = self->_keychainCircleProxy;
  self->_keychainCircleProxy = v6;

  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
  }
  else
  {
    v9 = [[CDPPiggybackingChannel alloc] initWithContext:self->_context];
    secureChannelProxy = self->_secureChannelProxy;
    self->_secureChannelProxy = (CDPSecureChannelProxy *)v9;
  }
  return v7 == 0;
}

- (void)initializeTTSUChannel
{
  v3 = [[CDPTTSUPayloadProvider alloc] initWithCircleProxy:self->_circleProxy];
  keychainCircleProxy = self->_keychainCircleProxy;
  self->_keychainCircleProxy = (CDPKeychainCircleProxy *)v3;

  self->_secureChannelProxy = (CDPSecureChannelProxy *)[[CDPTTSUChannel alloc] initWithContext:self->_context];
  MEMORY[0x270F9A758]();
}

- (void)setFlowIDFromRequester:(id)a3
{
  circleProxy = self->_circleProxy;
  id v4 = a3;
  id v5 = [(CDPDCircleProxy *)circleProxy cdpContext];
  [v5 setTelemetryFlowID:v4];
}

- (void)dealloc
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v3, OS_LOG_TYPE_DEFAULT, "Secure channel proxy going away...", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CDPDSecureChannelContext;
  [(CDPDSecureChannelContext *)&v4 dealloc];
}

- (CDPKeychainCircleProxy)keychainCircleProxy
{
  return self->_keychainCircleProxy;
}

- (void)setKeychainCircleProxy:(id)a3
{
}

- (CDPSecureChannelProxy)secureChannelProxy
{
  return self->_secureChannelProxy;
}

- (void)setSecureChannelProxy:(id)a3
{
}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (void)setCircleProxy:(id)a3
{
}

- (CDPContext)context
{
  return self->_context;
}

- (unint64_t)secureChannelType
{
  return self->_secureChannelType;
}

- (void)setSecureChannelType:(unint64_t)a3
{
  self->_secureChannelType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_secureChannelProxy, 0);
  objc_storeStrong((id *)&self->_keychainCircleProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initialize:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to initialize a channel %@", (uint8_t *)&v2, 0xCu);
}

@end