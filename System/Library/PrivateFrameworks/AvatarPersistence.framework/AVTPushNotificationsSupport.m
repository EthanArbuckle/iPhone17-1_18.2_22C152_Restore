@interface AVTPushNotificationsSupport
+ (id)topic;
- (APSConnection)pushConnection;
- (AVTCoreEnvironment)environment;
- (AVTPushNotificationsConnectionFactory)connectionFactory;
- (AVTPushNotificationsSupport)initWithEnvironment:(id)a3 connectionFactory:(id)a4;
- (AVTPushNotificationsSupportDelegate)delegate;
- (AVTUILogger)logger;
- (OS_dispatch_queue)connectionQueue;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)getAPSEnvironmentString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPushConnection:(id)a3;
- (void)setupConnectionWithCompletionHandler:(id)a3;
- (void)startListeningToPushNotifications;
- (void)stopListeningToPushNotifications;
@end

@implementation AVTPushNotificationsSupport

- (AVTPushNotificationsSupport)initWithEnvironment:(id)a3 connectionFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTPushNotificationsSupport;
  v9 = [(AVTPushNotificationsSupport *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    v11 = [v7 serialQueueProvider];
    uint64_t v12 = ((void (**)(void, const char *))v11)[2](v11, "com.apple.AvatarUI.AVTPushNotificationSupport.connectionQueue");
    connectionQueue = v10->_connectionQueue;
    v10->_connectionQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [v7 logger];
    logger = v10->_logger;
    v10->_logger = (AVTUILogger *)v14;

    objc_storeStrong((id *)&v10->_connectionFactory, a4);
  }

  return v10;
}

- (void)getAPSEnvironmentString:(id)a3
{
}

- (void)setupConnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__AVTPushNotificationsSupport_setupConnectionWithCompletionHandler___block_invoke;
  v6[3] = &unk_2647C4508;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTPushNotificationsSupport *)self getAPSEnvironmentString:v6];
}

void __68__AVTPushNotificationsSupport_setupConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) connectionFactory];
    id v8 = [*(id *)(a1 + 32) connectionQueue];
    v9 = [v7 connectionWithEnvironmentName:v5 namedDelegatePort:@"com.apple.aps.avatar.service" queue:v8];

    uint64_t v10 = *(void *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v9, 0);
    }
    else
    {
      uint64_t v14 = *MEMORY[0x263F08338];
      v15[0] = @"Unable to create an APSConnection";
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v13 = +[AVTError errorWithCode:1 userInfo:v12];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v13);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v6);
    }
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  id v7 = [(AVTPushNotificationsSupport *)self logger];
  id v6 = [v5 base64EncodedStringWithOptions:0];

  [v7 logPushConnectionReceivedPublicToken:v6];
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v13 = [(AVTPushNotificationsSupport *)self logger];
  uint64_t v12 = [v11 base64EncodedStringWithOptions:0];

  [v13 logPushConnectionReceivedToken:v12 topic:v10 identifier:v9];
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v11 = [v5 userInfo];
  id v6 = [MEMORY[0x263EFD760] notificationFromRemoteNotificationDictionary:v11];
  id v7 = [(AVTPushNotificationsSupport *)self logger];
  id v8 = [v5 topic];

  id v9 = [v6 description];
  [v7 logPushNotificationReceivedForTopic:v8 payload:v9];

  id v10 = [(AVTPushNotificationsSupport *)self delegate];
  [v10 didReceivePushNotification:self];
}

+ (id)topic
{
  return (id)[@"com.apple.icloud-container." stringByAppendingString:@"com.apple.avatarsd"];
}

- (void)startListeningToPushNotifications
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __64__AVTPushNotificationsSupport_startListeningToPushNotifications__block_invoke;
  v2[3] = &unk_2647C4530;
  v2[4] = self;
  [(AVTPushNotificationsSupport *)self setupConnectionWithCompletionHandler:v2];
}

void __64__AVTPushNotificationsSupport_startListeningToPushNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setPushConnection:v5];
    id v7 = [(id)objc_opt_class() topic];
    v12[0] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v9 = [*(id *)(a1 + 32) pushConnection];
    [v9 _setEnabledTopics:v8];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) logger];
    id v11 = [v6 description];
    [v10 logUnableToCreatePushConnection:v11];
  }
}

- (void)stopListeningToPushNotifications
{
  id v2 = [(AVTPushNotificationsSupport *)self pushConnection];
  [v2 _setEnabledTopics:0];
}

- (AVTPushNotificationsSupportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVTPushNotificationsSupportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (APSConnection)pushConnection
{
  return self->_pushConnection;
}

- (void)setPushConnection:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTPushNotificationsConnectionFactory)connectionFactory
{
  return self->_connectionFactory;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end