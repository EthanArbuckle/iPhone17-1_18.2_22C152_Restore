@interface GTServiceProviderReplyStream
- (GTServiceProviderReplyStream)initWithObserver:(id)a3;
- (void)notifyServiceListChanged_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTServiceProviderReplyStream

- (GTServiceProviderReplyStream)initWithObserver:(id)a3
{
  id v5 = a3;
  v6 = +[GTServiceProperties protocolMethods:&unk_26EFBECA8];
  v9.receiver = self;
  v9.super_class = (Class)GTServiceProviderReplyStream;
  v7 = [(GTXPCDispatcher *)&v9 initWithProtocolMethods:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_observer, a3);
  }

  return v7;
}

- (void)notifyServiceListChanged_:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id nsarray = (id)xpc_dictionary_get_nsarray(v5, "serviceList", v6);

  [(GTServiceProviderObserver *)self->_observer notifyServiceListChanged:nsarray];
}

- (void).cxx_destruct
{
}

@end