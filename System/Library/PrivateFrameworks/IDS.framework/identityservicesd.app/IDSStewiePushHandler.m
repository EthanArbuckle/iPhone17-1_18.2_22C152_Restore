@interface IDSStewiePushHandler
- (IDSPushHandler)pushHandler;
- (IDSServerBag)bag;
- (IDSStewieCTClient)ctClient;
- (IDSStewiePushHandler)initWithDelegate:(id)a3 pushHandler:(id)a4 bag:(id)a5 queue:(id)a6 ctClient:(id)a7;
- (IDSStewiePushHandler)initWithDelegate:(id)a3 queue:(id)a4 bag:(id)a5 ctClient:(id)a6;
- (IDSStewiePushHandlerDelegate)delegate;
- (void)_processRollKeysAndSMSConfigAction:(id)a3;
- (void)dealloc;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)setBag:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPushHandler:(id)a3;
@end

@implementation IDSStewiePushHandler

- (IDSStewiePushHandler)initWithDelegate:(id)a3 queue:(id)a4 bag:(id)a5 ctClient:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[IDSPushHandler sharedInstance];
  v15 = [(IDSStewiePushHandler *)self initWithDelegate:v13 pushHandler:v14 bag:v11 queue:v12 ctClient:v10];

  return v15;
}

- (IDSStewiePushHandler)initWithDelegate:(id)a3 pushHandler:(id)a4 bag:(id)a5 queue:(id)a6 ctClient:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)IDSStewiePushHandler;
  v17 = [(IDSStewiePushHandler *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v12);
    objc_storeStrong((id *)&v18->_pushHandler, a4);
    objc_storeStrong((id *)&v18->_bag, a5);
    objc_storeStrong((id *)&v18->_ctClient, a7);
    id v28 = v12;
    id v19 = v16;
    id v20 = v14;
    id v21 = v13;
    uint64_t v22 = IDSSPSPushTopic;
    v23 = +[NSSet setWithObject:IDSSPSPushTopic];
    v24 = +[NSSet setWithObject:&off_1009D0FA8];
    [(IDSPushHandler *)v18->_pushHandler addListener:v18 topics:v23 commands:v24 queue:v15];
    pushHandler = v18->_pushHandler;
    v26 = sub_1000D7634(v18);
    [(IDSPushHandler *)pushHandler subscribeToChannel:v26 forTopic:v22];

    id v13 = v21;
    id v14 = v20;
    id v16 = v19;
    id v12 = v28;
  }
  return v18;
}

- (void)dealloc
{
  v3 = [(IDSStewiePushHandler *)self pushHandler];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IDSStewiePushHandler;
  [(IDSStewiePushHandler *)&v4 dealloc];
}

- (void)_processRollKeysAndSMSConfigAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  sub_1000D7810(v5, v4, @"maxDelay");
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10)
  {
    double v7 = (double)arc4random_uniform(1000 * [v10 unsignedIntValue]) / 1000.0;
    v8 = [(IDSStewiePushHandler *)self delegate];
    [v8 pushHandler:self receivedRollKeysPushWithDelay:v7];

    v9 = [(IDSStewiePushHandler *)self delegate];
    [v9 pushHandler:self receivedRollSMSConfigPushWithDelay:v7];

    v6 = v10;
  }
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v10 = a4;
  id v11 = a7;
  if ([a5 isEqualToString:IDSSPSPushTopic])
  {
    id v12 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412290;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received stewie push %@", (uint8_t *)&v32, 0xCu);
    }

    id v13 = [v11 context];
    id v14 = [v13 channelID];

    if (v14)
    {
      id v15 = +[IDSFoundationLog stewieProvisioning];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v13 channelID];
        int v32 = 138412290;
        id v33 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Push came in via cloud channel : %@", (uint8_t *)&v32, 0xCu);
      }
    }
    uint64_t v17 = objc_opt_class();
    v18 = sub_1000D7810(v17, v10, IDSCommandKey);
    uint64_t v19 = objc_opt_class();
    id v20 = sub_1000D7810(v19, v10, @"test");
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = sub_1000D7810(v21, v10, @"test");
    unsigned int v23 = [v22 BOOLValue];

    if (v18)
    {
      switch((unint64_t)[v18 integerValue])
      {
        case 1uLL:
          v24 = +[IDSFoundationLog stewieProvisioning];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v32) = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received stewie roll keys push", (uint8_t *)&v32, 2u);
          }

          if (v23)
          {
            v25 = +[IDSFoundationLog stewieProvisioning];
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_28;
            }
            LOWORD(v32) = 0;
            v26 = "This message is just a test - not rolling keys";
            goto LABEL_27;
          }
          [(IDSStewiePushHandler *)self _processRollKeysAndSMSConfigAction:v10];
          break;
        case 2uLL:
          v27 = +[IDSFoundationLog stewieProvisioning];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v32) = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Received stewie block device push", (uint8_t *)&v32, 2u);
          }

          id v28 = [(IDSStewiePushHandler *)self ctClient];
          v25 = v28;
          uint64_t v29 = 1;
          goto LABEL_21;
        case 3uLL:
          v30 = +[IDSFoundationLog stewieProvisioning];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v32) = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Received stewie unblock device push", (uint8_t *)&v32, 2u);
          }

          id v28 = [(IDSStewiePushHandler *)self ctClient];
          v25 = v28;
          uint64_t v29 = 0;
LABEL_21:
          [v28 notifyAboutStewieBlocked:v29];
          goto LABEL_28;
        case 4uLL:
          v31 = +[IDSFoundationLog stewieProvisioning];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v32) = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Received stewie roll sms config push", (uint8_t *)&v32, 2u);
          }

          if (v23)
          {
            v25 = +[IDSFoundationLog stewieProvisioning];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v32) = 0;
              v26 = "This message is just a test - not rolling sms config";
LABEL_27:
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v32, 2u);
            }
LABEL_28:
          }
          else
          {
            sub_1000D78CC(self, v10);
          }
          break;
        default:
          break;
      }
    }
  }
}

- (IDSStewiePushHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSStewiePushHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSServerBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (IDSStewieCTClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end