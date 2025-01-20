@interface HMDXPCMessageReportingSession
- (HMDXPCClientConnection)xpcClientConnection;
- (HMDXPCMessageReportingSession)initWithUUID:(id)a3 reportContext:(id)a4 xpcClientConnection:(id)a5;
- (HMFTimer)consumeSessionResultsTimer;
- (HMFTimer)endSessionTimer;
- (HMReportContext)reportContext;
- (NSMutableArray)responseMessagePayloads;
- (NSUUID)UUID;
- (void)setConsumeSessionResultsTimer:(id)a3;
- (void)setEndSessionTimer:(id)a3;
- (void)setXpcClientConnection:(id)a3;
@end

@implementation HMDXPCMessageReportingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumeSessionResultsTimer, 0);
  objc_storeStrong((id *)&self->_endSessionTimer, 0);
  objc_storeStrong((id *)&self->_responseMessagePayloads, 0);
  objc_destroyWeak((id *)&self->_xpcClientConnection);
  objc_storeStrong((id *)&self->_reportContext, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setConsumeSessionResultsTimer:(id)a3
{
}

- (HMFTimer)consumeSessionResultsTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEndSessionTimer:(id)a3
{
}

- (HMFTimer)endSessionTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableArray)responseMessagePayloads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setXpcClientConnection:(id)a3
{
}

- (HMDXPCClientConnection)xpcClientConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcClientConnection);
  return (HMDXPCClientConnection *)WeakRetained;
}

- (HMReportContext)reportContext
{
  return (HMReportContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDXPCMessageReportingSession)initWithUUID:(id)a3 reportContext:(id)a4 xpcClientConnection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v20 = (HMDXPCMessageReportingSessionManager *)_HMFPreconditionFailure();
    [(HMDXPCMessageReportingSessionManager *)v20 .cxx_destruct];
    return result;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDXPCMessageReportingSession;
  v12 = [(HMDXPCMessageReportingSession *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    uint64_t v15 = [v9 copy];
    reportContext = v12->_reportContext;
    v12->_reportContext = (HMReportContext *)v15;

    objc_storeWeak((id *)&v12->_xpcClientConnection, v11);
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    responseMessagePayloads = v12->_responseMessagePayloads;
    v12->_responseMessagePayloads = (NSMutableArray *)v17;
  }
  return v12;
}

@end