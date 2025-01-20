@interface COMessagingClientInfo
- (COCoordinationServiceClient)client;
- (COMessagingClientInfo)initWithTopic:(id)a3 cluster:(id)a4 handledClasses:(id)a5 client:(id)a6 activateCompletionHanlder:(id)a7;
- (NSMutableDictionary)sessions;
- (NSSet)handledClasses;
- (NSString)topic;
- (id)cluster;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
@end

@implementation COMessagingClientInfo

- (COMessagingClientInfo)initWithTopic:(id)a3 cluster:(id)a4 handledClasses:(id)a5 client:(id)a6 activateCompletionHanlder:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)COMessagingClientInfo;
  v18 = [(COMessagingClientInfo *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_topic, a3);
    objc_storeStrong(&v19->_cluster, a4);
    objc_storeStrong((id *)&v19->_handledClasses, a5);
    uint64_t v20 = MEMORY[0x223C8B4A0](v17);
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = (id)v20;

    objc_storeWeak((id *)&v19->_client, v16);
    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    sessions = v19->_sessions;
    v19->_sessions = (NSMutableDictionary *)v22;
  }
  return v19;
}

- (NSString)topic
{
  return self->_topic;
}

- (id)cluster
{
  return self->_cluster;
}

- (NSSet)handledClasses
{
  return self->_handledClasses;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (COCoordinationServiceClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (COCoordinationServiceClient *)WeakRetained;
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_handledClasses, 0);
  objc_storeStrong(&self->_cluster, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end