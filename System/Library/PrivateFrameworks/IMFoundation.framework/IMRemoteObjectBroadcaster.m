@interface IMRemoteObjectBroadcaster
+ (id)defaultBroadcaster;
- (IMRemoteObjectBroadcaster)init;
- (id)_queue;
- (id)broadcastProxyForTarget:(id)a3 messageContext:(id)a4 protocol:(id)a5;
- (id)broadcastProxyForTarget:(id)a3 messageContext:(id)a4 protocol:(id)a5 priority:(int)a6;
- (id)broadcastProxyForTarget:(id)a3 messageContext:(id)a4 protocol:(id)a5 priority:(int)a6 completion:(id)a7;
- (id)broadcastProxyForTargets:(id)a3 messageContext:(id)a4 protocol:(id)a5;
- (void)blockUntilSendQueueIsEmpty;
- (void)dealloc;
- (void)flushProxy:(id)a3;
@end

@implementation IMRemoteObjectBroadcaster

- (IMRemoteObjectBroadcaster)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMRemoteObjectBroadcaster;
  v2 = [(IMRemoteObjectBroadcaster *)&v5 init];
  if (v2)
  {
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.IMRemoteObjectBroadcasterQueue", v3);
  }
  return v2;
}

- (id)broadcastProxyForTarget:(id)a3 messageContext:(id)a4 protocol:(id)a5 priority:(int)a6 completion:(id)a7
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = *(void *)&a6;
  v13 = [Broadcaster alloc];
  uint64_t v16 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v14, (uint64_t)a3, v15);
  v18 = objc_msgSend_initWithNotifier_messageContext_protocol_targets_priority_completion_(v13, v17, (uint64_t)self, (uint64_t)a4, a5, v16, v8, a7);
  return v18;
}

+ (id)defaultBroadcaster
{
  if (qword_1EB273BE0 != -1) {
    dispatch_once(&qword_1EB273BE0, &unk_1EE230BB8);
  }
  return (id)qword_1EB273BE8;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IMRemoteObjectBroadcaster;
  [(IMRemoteObjectBroadcaster *)&v4 dealloc];
}

- (id)_queue
{
  return self->_queue;
}

- (id)broadcastProxyForTarget:(id)a3 messageContext:(id)a4 protocol:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_broadcastProxyForTarget_messageContext_protocol_priority_, a3, a4);
}

- (id)broadcastProxyForTarget:(id)a3 messageContext:(id)a4 protocol:(id)a5 priority:(int)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_broadcastProxyForTarget_messageContext_protocol_priority_completion_, a3, a4);
}

- (id)broadcastProxyForTargets:(id)a3 messageContext:(id)a4 protocol:(id)a5
{
  id result = (id)objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (result)
  {
    v10 = [Broadcaster alloc];
    v12 = objc_msgSend_initWithNotifier_messageContext_protocol_targets_(v10, v11, (uint64_t)self, (uint64_t)a4, a5, a3);
    return v12;
  }
  return result;
}

- (void)blockUntilSendQueueIsEmpty
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  objc_super v4 = objc_msgSend__remoteObjects(IMRemoteObject, a2, v2, v3);
  uint64_t v8 = objc_msgSend__copyForEnumerating(v4, v5, v6, v7);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v8);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend__queue(v17, v11, v12, v13))
        {
          v18 = objc_msgSend__queue(v17, v11, v12, v13);
          dispatch_sync(v18, &unk_1EE230BD8);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v14);
  }
  v19 = objc_msgSend_defaultBroadcaster(IMRemoteObjectBroadcaster, v11, v12, v13);
  v23 = objc_msgSend__queue(v19, v20, v21, v22);
  dispatch_sync(v23, &unk_1EE230BF8);
}

- (void)flushProxy:(id)a3
{
  id v3 = a3;
  objc_msgSend__cleanupMachBitsCanPost_locked_(a3, v4, 1, 0);
}

@end