@interface GTMTLTelemetryServiceReplyStream
- (GTMTLTelemetryServiceReplyStream)initWithObserver:(id)a3;
- (void)notifyStatistics_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTMTLTelemetryServiceReplyStream

- (GTMTLTelemetryServiceReplyStream)initWithObserver:(id)a3
{
  id v5 = a3;
  v6 = +[GTServiceProperties protocolMethods:&unk_26EFBE370];
  v9.receiver = self;
  v9.super_class = (Class)GTMTLTelemetryServiceReplyStream;
  v7 = [(GTXPCDispatcher *)&v9 initWithProtocolMethods:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_observer, a3);
  }

  return v7;
}

- (void)notifyStatistics_:(id)a3 replyConnection:(id)a4
{
  v4 = (objc_class *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v16 = (id)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v5, "statistics", v16);

  [(GTMTLTelemetryServiceObserver *)self->_observer notifyStatistics:nsobject_classes];
}

- (void).cxx_destruct
{
}

@end