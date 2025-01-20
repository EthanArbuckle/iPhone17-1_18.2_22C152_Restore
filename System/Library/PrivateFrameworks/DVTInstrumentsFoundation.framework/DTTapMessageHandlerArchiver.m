@interface DTTapMessageHandlerArchiver
- (DTTapMessageHandlerArchiver)initWithConfig:(id)a3 archiveURL:(id)a4;
- (id)messageReceived:(id)a3;
- (void)_helperConnectionError;
- (void)dealloc;
@end

@implementation DTTapMessageHandlerArchiver

- (DTTapMessageHandlerArchiver)initWithConfig:(id)a3 archiveURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)DTTapMessageHandlerArchiver;
  v8 = [(DTTapMessageHandler *)&v22 initWithConfig:v6];
  if (v8)
  {
    if (!v7) {
      sub_23093E954();
    }
    id v9 = objc_alloc(MEMORY[0x263F38C90]);
    v10 = [v7 path];
    id v21 = 0;
    v11 = (void *)[v9 initWithIncomingFilePath:0 outgoingFilePath:v10 error:&v21];
    id v12 = v21;

    if (v11
      && !v12
      && (uint64_t v13 = [objc_alloc(MEMORY[0x263F38C88]) initWithTransport:v11],
          v14 = v8->_helperConnection,
          v8->_helperConnection = (DTXConnection *)v13,
          v14,
          (v15 = v8->_helperConnection) != 0))
    {
      [(DTXConnection *)v15 setDispatchTarget:v8];
      [(DTXConnection *)v8->_helperConnection setCompressionHint:4 forChannel:0];
      objc_initWeak(&location, v8);
      helperConnection = v8->_helperConnection;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = sub_2308FDC2C;
      v18[3] = &unk_264B8F7B8;
      objc_copyWeak(&v19, &location);
      [(DTXConnection *)helperConnection setMessageHandler:v18];
      [(DTXConnection *)v8->_helperConnection setMaximumEnqueueSize:0x800000];
      [(DTXConnection *)v8->_helperConnection resume];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      id v12 = v11;
    }
    else
    {

      v8 = 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  [(DTXConnection *)self->_helperConnection sendMessageSync:*MEMORY[0x263F38CC0] replyHandler:&unk_26E515868];
  v3.receiver = self;
  v3.super_class = (Class)DTTapMessageHandlerArchiver;
  [(DTTapMessageHandlerArchiver *)&v3 dealloc];
}

- (id)messageReceived:(id)a3
{
  id v4 = a3;
  v5 = [(DTTapMessageHandler *)self config];
  id v6 = [v5 statusHandler];

  if (v6)
  {
    id v7 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    v8 = [v4 objectWithAllowedClasses:v7];

    if (v8)
    {
      id v9 = [(DTTapMessageHandler *)self config];
      v10 = [v9 statusHandler];
      uint64_t v11 = [v8 status];
      uint64_t v12 = [v8 timestamp];
      uint64_t v13 = [v8 notice];
      v14 = [v8 info];
      ((void (**)(void, uint64_t, uint64_t, void *, void *))v10)[2](v10, v11, v12, v13, v14);
    }
  }
  if (![v4 errorStatus]) {
    [(DTXConnection *)self->_helperConnection sendMessage:v4 replyHandler:0];
  }

  return 0;
}

- (void)_helperConnectionError
{
  [(DTXConnection *)self->_helperConnection cancel];
  helperConnection = self->_helperConnection;
  self->_helperConnection = 0;

  NSLog(&cfstr_AnUnexpectedEr.isa);
}

- (void).cxx_destruct
{
}

@end