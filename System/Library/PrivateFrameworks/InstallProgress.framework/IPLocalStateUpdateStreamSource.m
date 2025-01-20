@interface IPLocalStateUpdateStreamSource
- (IPLocalStateUpdateStreamSource)initWithUpdateStream:(id)a3;
- (IPStateUpdateStreamSourceDelegate)delegate;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)stream:(id)a3 receiveMessage:(id)a4;
@end

@implementation IPLocalStateUpdateStreamSource

- (IPLocalStateUpdateStreamSource)initWithUpdateStream:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IPLocalStateUpdateStreamSource;
  v5 = [(IPLocalStateUpdateStreamSource *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weakStream, v4);
    v6->_resumed = 0;
  }

  return v6;
}

- (void)resume
{
  self->_resumed = 1;
}

- (void)stream:(id)a3 receiveMessage:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (self->_resumed)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stateUpdateStreamSource:self updateMessageReceived:v5];
  }
  else
  {
    v7 = _IPDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_252AA9000, v7, OS_LOG_TYPE_DEFAULT, "unresumed local source ignoring incoming message %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (IPStateUpdateStreamSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IPStateUpdateStreamSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_weakStream);
}

@end