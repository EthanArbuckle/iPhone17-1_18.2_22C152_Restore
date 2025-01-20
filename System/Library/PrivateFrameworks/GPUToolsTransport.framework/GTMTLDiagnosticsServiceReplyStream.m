@interface GTMTLDiagnosticsServiceReplyStream
- (GTMTLDiagnosticsServiceReplyStream)initWithObserver:(id)a3;
- (void)notifyCommandBufferIssue_:(id)a3 replyConnection:(id)a4;
- (void)notifyDiagnosticsIssue_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTMTLDiagnosticsServiceReplyStream

- (GTMTLDiagnosticsServiceReplyStream)initWithObserver:(id)a3
{
  id v5 = a3;
  v6 = +[GTServiceProperties protocolMethods:&unk_26EFBD510];
  v9.receiver = self;
  v9.super_class = (Class)GTMTLDiagnosticsServiceReplyStream;
  v7 = [(GTXPCDispatcher *)&v9 initWithProtocolMethods:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_observer, a3);
  }

  return v7;
}

- (void)notifyCommandBufferIssue_:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id nsobject = xpc_dictionary_get_nsobject(v5, "issue", v6);

  [(GTMTLDiagnosticsServiceObserver *)self->_observer notifyCommandBufferIssue:nsobject];
}

- (void)notifyDiagnosticsIssue_:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id nsobject = xpc_dictionary_get_nsobject(v5, "issue", v6);

  [(GTMTLDiagnosticsServiceObserver *)self->_observer notifyDiagnosticsIssue:nsobject];
}

- (void).cxx_destruct
{
}

@end