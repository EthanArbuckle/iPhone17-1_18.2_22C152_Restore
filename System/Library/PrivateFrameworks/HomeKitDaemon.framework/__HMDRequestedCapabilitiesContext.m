@interface __HMDRequestedCapabilitiesContext
- (HMFTimerManagerTimerContext)timerContext;
- (NSDictionary)requestedCapabilities;
- (NSMutableArray)receivedResponses;
- (NSString)destinationAddress;
- (NSUUID)transactionID;
- (OS_dispatch_queue)responseQueue;
- (__HMDRequestedCapabilitiesContext)initWithTransactionID:(id)a3 requestedCapabilities:(id)a4 destinationAddress:(id)a5 responseQueue:(id)a6 completionHandler:(id)a7;
- (id)completionHandler;
- (void)setTimerContext:(id)a3;
@end

@implementation __HMDRequestedCapabilitiesContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerContext, 0);
  objc_storeStrong((id *)&self->_receivedResponses, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_requestedCapabilities, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
}

- (void)setTimerContext:(id)a3
{
}

- (HMFTimerManagerTimerContext)timerContext
{
  return self->_timerContext;
}

- (NSMutableArray)receivedResponses
{
  return self->_receivedResponses;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (NSDictionary)requestedCapabilities
{
  return self->_requestedCapabilities;
}

- (NSUUID)transactionID
{
  return self->_transactionID;
}

- (__HMDRequestedCapabilitiesContext)initWithTransactionID:(id)a3 requestedCapabilities:(id)a4 destinationAddress:(id)a5 responseQueue:(id)a6 completionHandler:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)__HMDRequestedCapabilitiesContext;
  v17 = [(__HMDRequestedCapabilitiesContext *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_transactionID, a3);
    objc_storeStrong((id *)&v18->_requestedCapabilities, a4);
    objc_storeStrong((id *)&v18->_destinationAddress, a5);
    objc_storeStrong((id *)&v18->_responseQueue, a6);
    v19 = _Block_copy(v16);
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    receivedResponses = v18->_receivedResponses;
    v18->_receivedResponses = v21;
  }
  return v18;
}

@end