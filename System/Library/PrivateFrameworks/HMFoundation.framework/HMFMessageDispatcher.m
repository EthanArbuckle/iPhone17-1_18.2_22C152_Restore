@interface HMFMessageDispatcher
+ (id)logCategory;
- (HMFMessageDispatcher)init;
- (HMFMessageDispatcher)initWithTransport:(id)a3;
- (HMFMessageTransport)transport;
- (NSCache)bindingsCache;
- (NSCache)receiverCache;
- (NSSet)filterClasses;
- (OS_dispatch_queue)workQueue;
- (id)handlersForMessage:(id)a3;
- (id)messageBindingsForReceiver:(id)a3;
- (id)messageHandlerWithReceiver:(id)a3 name:(id)a4 policies:(id)a5 selector:(SEL)a6;
- (id)receiverForTarget:(id)a3;
- (id)resolveHook;
- (id)sendMessageExpectingResponse:(id)a3;
- (id)synthesizeHandlerForMessage:(id)a3;
- (void)deregisterForMessage:(id)a3 receiver:(id)a4;
- (void)deregisterReceiver:(id)a3;
- (void)dispatchMessage:(id)a3;
- (void)flushReceiverFromCache:(id)a3;
- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4;
- (void)registerForMessage:(id)a3 receiver:(id)a4 policies:(id)a5 selector:(SEL)a6;
- (void)registerForMessage:(id)a3 receiver:(id)a4 selector:(SEL)a5;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendMessage:(id)a3 target:(id)a4;
- (void)sendMessage:(id)a3 target:(id)a4 andInvokeCompletionHandler:(id)a5;
- (void)sendMessage:(id)a3 target:(id)a4 responseQueue:(id)a5 responseHandler:(id)a6;
- (void)sendMessage:(id)a3 target:(id)a4 responseQueue:(id)a5 responseHandler:(id)a6 completionHandler:(id)a7;
- (void)setFilterClasses:(id)a3;
- (void)setResolveHook:(id)a3;
@end

@implementation HMFMessageDispatcher

- (void)registerForMessage:(id)a3 receiver:(id)a4 selector:(SEL)a5
{
}

- (HMFMessageDispatcher)initWithTransport:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMFMessageDispatcher;
  v6 = [(HMFMessageDispatcher *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v8 = (const char *)HMFDispatchQueueName(v6, @"workQ");
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA70] orderedSet];
    handlers = v7->_handlers;
    v7->_handlers = (NSMutableOrderedSet *)v12;

    objc_storeStrong((id *)&v7->_transport, a3);
    [(HMFMessageTransport *)v7->_transport setDelegate:v7];
    uint64_t v14 = objc_opt_new();
    receiverCache = v7->_receiverCache;
    v7->_receiverCache = (NSCache *)v14;

    uint64_t v16 = objc_opt_new();
    bindingsCache = v7->_bindingsCache;
    v7->_bindingsCache = (NSCache *)v16;
  }
  return v7;
}

uint64_t __43__HMFMessageDispatcher_handlersForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 name];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    v6 = [v3 target];
    v7 = [*(id *)(a1 + 40) target];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = 1;
    }
    else
    {
      v9 = *(void **)(a1 + 40);
      dispatch_queue_t v10 = +[HMFMessageDestination allMessageDestinations];
      uint64_t v8 = [v9 isEqual:v10];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
}

- (void)registerForMessage:(id)a3 receiver:(id)a4 policies:(id)a5 selector:(SEL)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = MEMORY[0x19F3A87A0]();
  if (!v10) {
    _HMFPreconditionFailure(@"messageName");
  }
  if (!v12) {
    _HMFPreconditionFailure(@"policies");
  }
  if (!a6) {
    _HMFPreconditionFailure(@"selector");
  }
  uint64_t v14 = (void *)v13;
  v15 = +[__HMFMessageHandler handlerWithReceiver:v11 name:v10 policies:v12 selector:a6];
  if (v15)
  {
    uint64_t v16 = self;
    id v17 = v15;
    if (v16)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v18 = [(NSMutableOrderedSet *)v16->_handlers indexOfObject:v17];
      context = (void *)MEMORY[0x19F3A87A0]();
      objc_super v19 = v16;
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        HMFGetOSLogHandle();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = HMFGetLogIdentifier(v19);
          *(_DWORD *)buf = 138543618;
          uint64_t v26 = (uint64_t)v21;
          __int16 v27 = 2112;
          id v28 = v17;
          _os_log_impl(&dword_19D57B000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Registering handler: %@", buf, 0x16u);
        }
        [v19[2] addObject:v17];
      }
      else
      {
        HMFGetOSLogHandle();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier(v19);
          uint64_t v26 = *(_DWORD *)buf = 138543618;
          __int16 v27 = 2112;
          id v28 = v17;
          v23 = (void *)v26;
          _os_log_impl(&dword_19D57B000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Updating handler: %@", buf, 0x16u);
        }
        [v19[2] replaceObjectAtIndex:v18 withObject:v17];
      }
      os_unfair_lock_unlock(&v16->_lock.lock);
    }
  }
}

+ (id)logCategory
{
  if (_MergedGlobals_3_6 != -1) {
    dispatch_once(&_MergedGlobals_3_6, &__block_literal_global_22);
  }
  v2 = (void *)qword_1EB4EEAB0;
  return v2;
}

- (void)sendMessage:(id)a3 target:(id)a4 responseQueue:(id)a5 responseHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v18 = [v12 destination];
  objc_super v19 = [v18 target];
  char v20 = [v19 isEqual:v13];

  if ((v20 & 1) == 0)
  {
    v21 = [[HMFMessageDestination alloc] initWithTarget:v13];
    [v12 setDestination:v21];
  }
  v22 = [v12 responseHandler];

  if (v15 && v22)
  {
    v23 = (void *)MEMORY[0x19F3A87A0]();
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543362;
      v37 = v25;
      _os_log_impl(&dword_19D57B000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot send with response handler if the message already has a response handler", buf, 0xCu);
    }
  }
  uint64_t v26 = [v12 responseHandler];

  if (!v26)
  {
    if (v14 && v15)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke;
      v33[3] = &unk_1E5957F30;
      id v34 = v14;
      id v35 = v15;
      uint64_t v26 = (void *)MEMORY[0x19F3A8A20](v33);
    }
    [v12 setResponseHandler:v26];
  }
  __int16 v27 = self->_workQueue;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_3;
  v30[3] = &unk_1E5957F58;
  id v28 = v16;
  v31 = v27;
  id v32 = v28;
  uint64_t v29 = v27;
  [(HMFMessageDispatcher *)self sendMessage:v12 completionHandler:v30];
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A87A0]();
  if (v6)
  {
    v9 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8 reason:@"Requested to send nil message"];
    id v10 = (void *)MEMORY[0x19F3A87A0]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      id v13 = HMFGetLogIdentifier(v11);
      int v16 = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      objc_super v19 = @"Requested to send nil message";
      _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_FAULT, "%{public}@%@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v14 = [(HMFMessageDispatcher *)self transport];
  if (v14)
  {
    if (v9) {
      goto LABEL_8;
    }
LABEL_11:
    [v14 sendMessage:v6 completionHandler:v7];
    goto LABEL_12;
  }
  uint64_t v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3 reason:@"The dispatcher does not have a valid transport"];

  v9 = (void *)v15;
  if (!v15) {
    goto LABEL_11;
  }
LABEL_8:
  if (v7) {
    v7[2](v7, v9);
  }
LABEL_12:
}

- (HMFMessageTransport)transport
{
  return self->_transport;
}

- (void)dispatchMessage:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x19F3A87A0]();
  v55 = [v4 shortDescription];
  int v5 = (void *)MEMORY[0x19F3A87A0]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier(v6);
    *(_DWORD *)buf = 138543618;
    uint64_t v76 = (uint64_t)v8;
    __int16 v77 = 2112;
    v78 = v55;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Dispatching message: %@", buf, 0x16u);
  }
  v9 = [(HMFMessageDispatcher *)v6 handlersForMessage:v4];
  if ([v9 count])
  {
    id v10 = [(HMFMessageDispatcher *)v6 filterClasses];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v11 = v9;
    uint64_t v62 = [v11 countByEnumeratingWithState:&v71 objects:v84 count:16];
    if (v62)
    {
      int v56 = 0;
      v60 = 0;
      uint64_t v61 = *(void *)v72;
      v65 = v6;
      v58 = v10;
      v59 = v9;
      id v57 = v11;
      do
      {
        for (uint64_t i = 0; i != v62; ++i)
        {
          if (*(void *)v72 != v61) {
            objc_enumerationMutation(v11);
          }
          id v13 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          id v14 = [v13 receiver];
          if (v14)
          {
            id v63 = v14;
            uint64_t v64 = i;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v15 = v10;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v67 objects:v83 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v68;
              while (2)
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v68 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void **)(*((void *)&v67 + 1) + 8 * j);
                  v21 = [v13 policies];
                  id v66 = 0;
                  id v22 = v4;
                  uint64_t v23 = [v20 filterMessage:v4 withPolicies:v21 dispatcher:v6 error:&v66];
                  v24 = (__CFString *)v66;

                  if (v23 == -1)
                  {
                    id v32 = (void *)MEMORY[0x19F3A87A0]();
                    id v6 = v65;
                    v33 = v65;
                    id v34 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v35 = HMFGetLogIdentifier(v33);
                      v36 = (void *)v35;
                      *(_DWORD *)buf = 138544130;
                      v37 = @"(unspecified error)";
                      if (v24) {
                        v37 = v24;
                      }
                      uint64_t v76 = v35;
                      __int16 v77 = 2112;
                      v78 = v55;
                      __int16 v79 = 2112;
                      v80 = v20;
                      __int16 v81 = 2112;
                      v82 = v37;
                      _os_log_impl(&dword_19D57B000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Message %@ rejected by %@: %@", buf, 0x2Au);

                      id v6 = v65;
                    }

                    v9 = v59;
                    uint64_t v38 = v60;
                    uint64_t i = v64;
                    if (!v60) {
                      uint64_t v38 = v24;
                    }
                    v60 = v38;

                    id v4 = v22;
                    id v11 = v57;
                    id v10 = v58;
                    goto LABEL_30;
                  }

                  id v4 = v22;
                  id v6 = v65;
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v67 objects:v83 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }

            v25 = (void *)MEMORY[0x19F3A87A0]();
            uint64_t v26 = v6;
            __int16 v27 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              id v28 = HMFGetLogIdentifier(v26);
              uint64_t v29 = [v13 shortDescription];
              *(_DWORD *)buf = 138543618;
              uint64_t v76 = (uint64_t)v28;
              __int16 v77 = 2112;
              v78 = v29;
              _os_log_impl(&dword_19D57B000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Invoking handler: %@", buf, 0x16u);

              id v6 = v65;
            }

            int v30 = [v13 invokeWithMessage:v4];
            int v31 = v56;
            if (v30) {
              int v31 = 1;
            }
            int v56 = v31;
            id v10 = v58;
            v9 = v59;
            id v11 = v57;
            uint64_t i = v64;
LABEL_30:
            id v14 = v63;
          }
        }
        uint64_t v62 = [v11 countByEnumeratingWithState:&v71 objects:v84 count:16];
      }
      while (v62);

      if (v56)
      {
        v39 = (void *)MEMORY[0x19F3A87A0]();
        v40 = v6;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v42 = HMFGetLogIdentifier(v40);
          *(_DWORD *)buf = 138543618;
          uint64_t v76 = (uint64_t)v42;
          __int16 v77 = 2112;
          v78 = v55;
          _os_log_impl(&dword_19D57B000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Successfully dispatched message: %@", buf, 0x16u);
        }
        v43 = v60;
        goto LABEL_46;
      }
    }
    else
    {

      v60 = 0;
    }
  }
  else
  {
    v44 = (void *)MEMORY[0x19F3A87A0]();
    v45 = v6;
    v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = HMFGetLogIdentifier(v45);
      *(_DWORD *)buf = 138543618;
      uint64_t v76 = (uint64_t)v47;
      __int16 v77 = 2112;
      v78 = v55;
      _os_log_impl(&dword_19D57B000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@No handlers for message: %@", buf, 0x16u);
    }
    v60 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:14];
  }
  v48 = (void *)MEMORY[0x19F3A87A0]();
  v49 = v6;
  v50 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = HMFGetLogIdentifier(v49);
    v52 = [(__CFString *)v60 shortDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v76 = (uint64_t)v51;
    __int16 v77 = 2112;
    v78 = v55;
    __int16 v79 = 2112;
    v80 = v52;
    _os_log_impl(&dword_19D57B000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Message %@ was not handled with error: %@", buf, 0x20u);
  }
  v43 = v60;
  if (v60)
  {
    [v4 respondWithError:v60];
  }
  else
  {
    v53 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:14];
    [v4 respondWithError:v53];

    v43 = 0;
  }
LABEL_46:
}

- (id)handlersForMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 name];
    v7 = [v5 destination];
    os_unfair_lock_lock_with_options();
    handlers = self->_handlers;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __43__HMFMessageDispatcher_handlersForMessage___block_invoke;
    v21[3] = &unk_1E5957EB8;
    id v9 = v6;
    id v22 = v9;
    id v10 = v7;
    id v23 = v10;
    id v11 = [handlers indexesOfObjectsWithOptions:1 passingTest:v21];
    id v12 = v11;
    if (v11 && [v11 count])
    {
      handlers = [(NSMutableOrderedSet *)self->_handlers objectsAtIndexes:v12];
      char v13 = 0;
    }
    else
    {
      char v13 = 1;
    }

    os_unfair_lock_unlock(&self->_lock.lock);
    if (v13)
    {
      uint64_t v14 = [(HMFMessageDispatcher *)self synthesizeHandlerForMessage:v5];
      id v15 = (void *)v14;
      if (v14)
      {
        uint64_t v24 = v14;
        handlers = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      }
      else
      {
        handlers = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      objc_super v19 = HMFGetLogIdentifier(v17);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v19;
      _os_log_impl(&dword_19D57B000, v18, OS_LOG_TYPE_FAULT, "%{public}@Requested handlers for nil message", buf, 0xCu);
    }
    handlers = (void *)MEMORY[0x1E4F1CBF0];
  }

  return handlers;
}

- (NSSet)filterClasses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  filterClasses = self->_filterClasses;
  if (filterClasses)
  {
    int v5 = filterClasses;
  }
  else
  {
    int v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v6 = v5;
  os_unfair_lock_unlock(&p_lock->lock);
  return v6;
}

- (void)sendMessage:(id)a3
{
}

uint64_t __35__HMFMessageDispatcher_logCategory__block_invoke()
{
  qword_1EB4EEAB0 = HMFCreateOSLogHandle(@"Messaging.Dispatcher", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

- (void)sendMessage:(id)a3 target:(id)a4
{
}

void __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_4;
    block[3] = &unk_1E5957E40;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

- (id)sendMessageExpectingResponse:(id)a3
{
  id v4 = a3;
  if (!v4
    || (int v5 = v4,
        [v4 responseHandler],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    _HMFPreconditionFailure(@"message && !message.responseHandler");
  }
  id v14 = 0;
  v7 = +[HMFFuture futureWithPromise:&v14];
  uint64_t v8 = (void *)[v5 mutableCopy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__HMFMessageDispatcher_HMFFuture__sendMessageExpectingResponse___block_invoke;
  v12[3] = &unk_1E5957628;
  id v13 = v14;
  [v8 setResponseHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__HMFMessageDispatcher_HMFFuture__sendMessageExpectingResponse___block_invoke_2;
  v10[3] = &unk_1E5957650;
  id v11 = v14;
  [(HMFMessageDispatcher *)self sendMessage:v8 completionHandler:v10];

  return v7;
}

uint64_t __64__HMFMessageDispatcher_HMFFuture__sendMessageExpectingResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 rejectWithError:a2];
  }
  else {
    return objc_msgSend(v2, "fulfillWithValue:");
  }
}

uint64_t __64__HMFMessageDispatcher_HMFFuture__sendMessageExpectingResponse___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) rejectWithError:a2];
  }
  return result;
}

- (HMFMessageDispatcher)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  int v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)setFilterClasses:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (![v8 isSubclassOfClass:objc_opt_class()] || v8 == objc_opt_class())
        {
          [NSString stringWithFormat:@"Invalid filter class '%@', must be subclass of %@", v8, objc_opt_class(), (void)v12];
          id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
          objc_exception_throw(v11);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  os_unfair_lock_lock_with_options();
  if (v4)
  {
    id v9 = (void *)[v4 copy];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v10 = v9;
  objc_storeStrong((id *)&self->_filterClasses, v9);

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (id)resolveHook
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x19F3A8A20](self->_resolveHook);
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setResolveHook:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (void *)MEMORY[0x19F3A8A20](v5);

  id resolveHook = self->_resolveHook;
  self->_id resolveHook = v6;

  os_unfair_lock_unlock(&p_lock->lock);
}

- (id)receiverForTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(NSCache *)self->_receiverCache objectForKey:v4];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = [(HMFMessageDispatcher *)self resolveHook];
    uint64_t v8 = (void *)v7;
    if (v7)
    {
      id v9 = (*(void (**)(uint64_t, id))(v7 + 16))(v7, v4);
      if (v9) {
        [(NSCache *)self->_receiverCache setObject:v9 forKey:v4];
      }
    }
    else
    {
      id v9 = 0;
    }
    id v6 = v9;
  }
  return v6;
}

- (void)flushReceiverFromCache:(id)a3
{
  receiverCache = self->_receiverCache;
  id v4 = [a3 messageTargetUUID];
  [(NSCache *)receiverCache removeObjectForKey:v4];
}

- (id)messageBindingsForReceiver:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [(NSCache *)self->_bindingsCache objectForKey:v6];
  if (!v7)
  {
    objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = objc_opt_new();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v17 = self;
      id v9 = [(id)objc_opt_class() messageBindingsForDispatcher:self];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            long long v15 = [v14 name];
            [v8 setObject:v14 forKey:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      id v7 = v8;
      [(NSCache *)v17->_bindingsCache setObject:v7 forKey:v6];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)synthesizeHandlerForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 destination];
  id v6 = [v5 target];
  id v7 = [(HMFMessageDispatcher *)self receiverForTarget:v6];

  if (v7)
  {
    uint64_t v8 = [(HMFMessageDispatcher *)self messageBindingsForReceiver:v7];
    if (v8)
    {
      id v9 = [v4 name];
      uint64_t v10 = [v8 objectForKeyedSubscript:v9];

      if (v10)
      {
        uint64_t v11 = [v10 name];
        uint64_t v12 = [v10 policies];
        long long v13 = -[HMFMessageDispatcher messageHandlerWithReceiver:name:policies:selector:](self, "messageHandlerWithReceiver:name:policies:selector:", v7, v11, v12, [v10 selector]);
      }
      else
      {
        long long v13 = 0;
      }
    }
    else
    {
      long long v13 = 0;
    }
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (void)deregisterForMessage:(id)a3 receiver:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    _HMFPreconditionFailure(@"messageName");
  }
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = os_unfair_lock_lock_with_options();
    uint64_t v10 = MEMORY[0x19F3A87A0](v9);
    handlers = self->_handlers;
    context = (void *)v10;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __54__HMFMessageDispatcher_deregisterForMessage_receiver___block_invoke;
    v23[3] = &unk_1E5957EB8;
    id v24 = v8;
    id v25 = v6;
    uint64_t v12 = [(NSMutableOrderedSet *)handlers indexesOfObjectsWithOptions:1 passingTest:v23];
    if (v12)
    {
      long long v13 = (void *)MEMORY[0x19F3A87A0]();
      long long v14 = self;
      HMFGetOSLogHandle();
      long long v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier(v14);
        *(_DWORD *)buf = 138543618;
        id v27 = v16;
        __int16 v28 = 2112;
        uint64_t v29 = (uint64_t)v12;
        _os_log_impl(&dword_19D57B000, v15, OS_LOG_TYPE_INFO, "%{public}@Removing handlers at indexes: %@", buf, 0x16u);
      }
      uint64_t v17 = (void *)MEMORY[0x19F3A87A0]([(NSMutableOrderedSet *)self->_handlers removeObjectsAtIndexes:v12]);
      long long v18 = v14;
      HMFGetOSLogHandle();
      long long v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v18);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [(NSMutableOrderedSet *)self->_handlers count];
        *(_DWORD *)buf = 138543618;
        id v27 = v20;
        __int16 v28 = 2048;
        uint64_t v29 = v21;
        _os_log_impl(&dword_19D57B000, v19, OS_LOG_TYPE_INFO, "%{public}@_handlers: %lu", buf, 0x16u);
      }
    }

    os_unfair_lock_unlock(&self->_lock.lock);
  }
}

uint64_t __54__HMFMessageDispatcher_deregisterForMessage_receiver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasReceiver:*(void *)(a1 + 32)])
  {
    id v4 = [v3 name];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)deregisterReceiver:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = os_unfair_lock_lock_with_options();
    uint64_t v6 = MEMORY[0x19F3A87A0](v5);
    handlers = self->_handlers;
    context = (void *)v6;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __43__HMFMessageDispatcher_deregisterReceiver___block_invoke;
    id v24 = &unk_1E5957EE0;
    id v8 = v4;
    id v25 = v8;
    uint64_t v9 = [(NSMutableOrderedSet *)handlers indexesOfObjectsWithOptions:1 passingTest:&v21];
    long long v14 = (void *)v9;
    if (v9)
    {
      long long v15 = (void *)MEMORY[0x19F3A87A0](v9, v10, v11, v12, v13);
      uint64_t v16 = self;
      HMFGetOSLogHandle();
      uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        long long v18 = HMFGetLogIdentifier(v16);
        *(_DWORD *)buf = 138543618;
        id v27 = v18;
        __int16 v28 = 2112;
        uint64_t v29 = v14;
        _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_INFO, "%{public}@Removing handlers at indexes: %@", buf, 0x16u);
      }
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_handlers, "removeObjectsAtIndexes:", v14, context, v21, v22, v23, v24);
    }
    -[HMFMessageDispatcher flushReceiverFromCache:](self, "flushReceiverFromCache:", v8, context);

    os_unfair_lock_unlock(&self->_lock.lock);
  }
}

uint64_t __43__HMFMessageDispatcher_deregisterReceiver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasReceiver:*(void *)(a1 + 32)];
}

- (id)messageHandlerWithReceiver:(id)a3 name:(id)a4 policies:(id)a5 selector:(SEL)a6
{
  return +[__HMFMessageHandler handlerWithReceiver:a3 name:a4 policies:a5 selector:a6];
}

- (NSCache)receiverCache
{
  return self->_receiverCache;
}

- (NSCache)bindingsCache
{
  return self->_bindingsCache;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_bindingsCache, 0);
  objc_storeStrong((id *)&self->_receiverCache, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_filterClasses, 0);
  objc_storeStrong(&self->_resolveHook, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

- (void)sendMessage:(id)a3 target:(id)a4 responseQueue:(id)a5 responseHandler:(id)a6
{
}

- (void)sendMessage:(id)a3 target:(id)a4 andInvokeCompletionHandler:(id)a5
{
}

void __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_2;
  block[3] = &unk_1E5957F08;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end