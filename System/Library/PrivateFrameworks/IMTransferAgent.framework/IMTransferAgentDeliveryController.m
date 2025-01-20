@interface IMTransferAgentDeliveryController
+ (id)sharedInstance;
- (FTMessageDelivery)messageDelivery;
- (IMTransferAgentDeliveryController)init;
- (void)dealloc;
- (void)sendFTMessage:(id)a3 completionBlock:(id)a4;
- (void)setMessageDelivery:(id)a3;
@end

@implementation IMTransferAgentDeliveryController

+ (id)sharedInstance
{
  if (qword_26AF3FDC8 != -1) {
    dispatch_once(&qword_26AF3FDC8, &unk_26F0B8E68);
  }
  v2 = (void *)qword_26AF3FDF0;
  return v2;
}

- (IMTransferAgentDeliveryController)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMTransferAgentDeliveryController;
  v2 = [(IMTransferAgentDeliveryController *)&v6 init];
  if (v2)
  {
    v3 = (FTMessageDelivery *)objc_alloc_init((Class)[MEMORY[0x263F3BB28] APNSMessageDeliveryClass]);
    messageDelivery = v2->_messageDelivery;
    v2->_messageDelivery = v3;

    [(FTMessageDelivery *)v2->_messageDelivery setMaxConcurrentMessages:2];
  }
  return v2;
}

- (void)dealloc
{
  [(IMTransferAgentDeliveryController *)self setMessageDelivery:0];
  v3.receiver = self;
  v3.super_class = (Class)IMTransferAgentDeliveryController;
  [(IMTransferAgentDeliveryController *)&v3 dealloc];
}

- (void)sendFTMessage:(id)a3 completionBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_23CAED000, v8, OS_LOG_TYPE_INFO, "Sending FTMessage: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_23CAED000, v9, OS_LOG_TYPE_INFO, "send FTMessage: %@", buf, 0xCu);
    }
  }
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = sub_23CAFAB08;
  v14 = &unk_264E81010;
  v15 = self;
  id v16 = v7;
  id v10 = v7;
  [v6 setCompletionBlock:&v11];
  -[FTMessageDelivery sendMessage:](self->_messageDelivery, "sendMessage:", v6, v11, v12, v13, v14, v15);
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end