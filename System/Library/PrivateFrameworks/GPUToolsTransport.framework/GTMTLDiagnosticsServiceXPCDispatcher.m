@interface GTMTLDiagnosticsServiceXPCDispatcher
- (GTMTLDiagnosticsServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4;
- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4;
- (void)raiseRuntimeIssue_:(id)a3 replyConnection:(id)a4;
- (void)registerObserver_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTMTLDiagnosticsServiceXPCDispatcher

- (GTMTLDiagnosticsServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = [a4 protocolMethods];
  v9 = (void *)[v8 mutableCopy];

  [v9 addObject:@"broadcastDisconnect"];
  v13.receiver = self;
  v13.super_class = (Class)GTMTLDiagnosticsServiceXPCDispatcher;
  v10 = [(GTXPCDispatcher *)&v13 initWithProtocolMethods:v9];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_service, a3);
  }

  return v11;
}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10 = [(GTServiceObserver *)[GTMTLDiagnosticsServiceObserver alloc] initWithMessage:v7 notifyConnection:v6];
  uint64_t v8 = [(GTMTLDiagnosticsService *)self->_service registerObserver:v10];
  v9 = gt_xpc_dictionary_create_reply(v7);

  xpc_dictionary_set_uint64(v9, "observerId", v8);
  [v6 sendMessage:v9];
}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GTMTLDiagnosticsService *)self->_service deregisterObserver:xpc_dictionary_get_uint64(v7, "observerId")];
  gt_xpc_dictionary_create_reply(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v6 sendMessage:v8];
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  xpc_dictionary_get_array(a3, "_pathHistory");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(GTMTLDiagnosticsService *)self->_service deregisterObserversForConnection:v6 path:v7];
}

- (void)raiseRuntimeIssue_:(id)a3 replyConnection:(id)a4
{
  string = xpc_dictionary_get_string(a3, "messagePrefix");
  if (string)
  {
    uint64_t v6 = [NSString stringWithUTF8String:string];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(GTMTLDiagnosticsService *)self->_service raiseRuntimeIssue:v6];
}

- (void).cxx_destruct
{
}

@end