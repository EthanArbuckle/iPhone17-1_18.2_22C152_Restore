@interface GTMTLCaptureServiceReplyStream
- (GTMTLCaptureServiceReplyStream)initWithObserver:(id)a3;
- (void)notifyCaptureObjectsChanged_:(id)a3 replyConnection:(id)a4;
- (void)notifyCaptureProgress_:(id)a3 replyConnection:(id)a4;
- (void)notifyCaptureRequest_:(id)a3 replyConnection:(id)a4;
- (void)notifyUnsupportedFenum_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTMTLCaptureServiceReplyStream

- (GTMTLCaptureServiceReplyStream)initWithObserver:(id)a3
{
  id v5 = a3;
  v6 = +[GTServiceProperties protocolMethods:&unk_26EFBC298];
  v9.receiver = self;
  v9.super_class = (Class)GTMTLCaptureServiceReplyStream;
  v7 = [(GTXPCDispatcher *)&v9 initWithProtocolMethods:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_observer, a3);
  }

  return v7;
}

- (void)notifyCaptureObjectsChanged_:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id nsobject = xpc_dictionary_get_nsobject(v5, "captureObjects", v6);

  [(GTMTLCaptureServiceObserver *)self->_observer notifyCaptureObjectsChanged:nsobject];
}

- (void)notifyCaptureProgress_:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id nsobject = xpc_dictionary_get_nsobject(v5, "progress", v6);

  [(GTMTLCaptureServiceObserver *)self->_observer notifyCaptureProgress:nsobject];
}

- (void)notifyUnsupportedFenum_:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id nsobject = xpc_dictionary_get_nsobject(v5, "info", v6);

  [(GTMTLCaptureServiceObserver *)self->_observer notifyUnsupportedFenum:nsobject];
}

- (void)notifyCaptureRequest_:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id nsobject = xpc_dictionary_get_nsobject(v5, "descriptor", v6);

  [(GTMTLCaptureServiceObserver *)self->_observer notifyCaptureRequest:nsobject];
}

- (void).cxx_destruct
{
}

@end