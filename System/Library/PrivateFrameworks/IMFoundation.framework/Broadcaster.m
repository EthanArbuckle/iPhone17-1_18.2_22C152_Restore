@interface Broadcaster
- (Broadcaster)initWithNotifier:(id)a3 messageContext:(id)a4 protocol:(id)a5 targets:(id)a6;
- (Broadcaster)initWithNotifier:(id)a3 messageContext:(id)a4 protocol:(id)a5 targets:(id)a6 priority:(int)a7;
- (Broadcaster)initWithNotifier:(id)a3 messageContext:(id)a4 protocol:(id)a5 targets:(id)a6 priority:(int)a7 completion:(id)a8;
- (id)methodSignatureForSelector:(SEL)a3;
- (int)curXPCMessagePriority;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)sendXPCObject:(id)a3;
- (void)setCurXPCMessagePriority:(int)a3;
@end

@implementation Broadcaster

- (Broadcaster)initWithNotifier:(id)a3 messageContext:(id)a4 protocol:(id)a5 targets:(id)a6 priority:(int)a7 completion:(id)a8
{
  if (!a5 || !objc_msgSend_count(a6, a2, (uint64_t)a3, (uint64_t)a4)) {
    return 0;
  }
  self->_parent = (IMRemoteObjectBroadcaster *)a3;
  self->_targets = (NSArray *)a6;
  self->_messageContext = (IMMessageContext *)a4;
  self->_protocol = (Protocol *)a5;
  self->_curXPCMessagePriority = a7;
  self->_completion = _Block_copy(a8);
  return self;
}

- (void)dealloc
{
  messageContext = self->_messageContext;
  if (messageContext) {
    CFRelease(messageContext);
  }
  targets = self->_targets;
  if (targets) {
    CFRelease(targets);
  }
  _Block_release(self->_completion);
  v5.receiver = self;
  v5.super_class = (Class)Broadcaster;
  [(Broadcaster *)&v5 dealloc];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  protocol = self->_protocol;
  objc_method_description MethodDescription = protocol_getMethodDescription(protocol, a3, 1, 1);
  types = MethodDescription.types;
  if (!MethodDescription.name)
  {
    types = protocol_getMethodDescription(protocol, a3, 0, 1).types;
    if (types) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!MethodDescription.types) {
    return 0;
  }
LABEL_3:
  v8 = (void *)MEMORY[0x1E4F1CA38];
  return (id)objc_msgSend_signatureWithObjCTypes_(v8, types, (uint64_t)types, v6);
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_count(self->_targets, a2, (uint64_t)a3, v3)) {
    return;
  }
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    if (dword_1EB273738 <= 0) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (dword_1EB273738)
  {
LABEL_4:
    v9 = (const char *)objc_msgSend_selector(a3, v6, v7, v8);
    v10 = NSStringFromSelector(v9);
    messageContext = self->_messageContext;
    int shouldBoost = objc_msgSend_shouldBoost(messageContext, v12, v13, v14);
    v16 = @"NO";
    if (shouldBoost) {
      v16 = @"YES";
    }
    NSLog(&cfstr_ForwardingHeld.isa, v10, messageContext, v16);
  }
LABEL_7:
  int v17 = objc_msgSend_curXPCMessagePriority(self, v6, v7, v8);
  objc_msgSend_setCurXPCMessagePriority_(self, v18, 0, v19);
  kdebug_trace();
  targets = self->_targets;
  v21 = self->_messageContext;
  id completion = self->_completion;
  uint64_t v22 = IMCreateXPCObjectFromInvocation((uint64_t)a3);
  if (!v22) {
    return;
  }
  v23 = (void *)v22;
  xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v24, "invocation", v23);
  xpc_dictionary_set_int64(v24, "priority", v17);
  xpc_release(v23);
  if (!v24) {
    goto LABEL_41;
  }
  if (objc_msgSend_count(targets, v25, v26, v27)) {
    v31 = objc_msgSend__copyForEnumerating(targets, v28, v29, v30);
  }
  else {
    v31 = 0;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v28, (uint64_t)&v68, (uint64_t)v72, 16);
  if (!v32) {
    goto LABEL_40;
  }
  uint64_t v36 = v32;
  uint64_t v37 = *(void *)v69;
  while (2)
  {
    for (uint64_t i = 0; i != v36; ++i)
    {
      if (*(void *)v69 != v37) {
        objc_enumerationMutation(v31);
      }
      v39 = *(void **)(*((void *)&v68 + 1) + 8 * i);
      if ((objc_msgSend_isValid(v39, v33, v34, v35) & 1) == 0)
      {
        if (dword_1EB273738 < 0)
        {
          if (qword_1EB273BF0 != -1) {
            dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
          }
          if (dword_1EB273738 <= 0) {
            goto LABEL_40;
          }
        }
        else if (!dword_1EB273738)
        {
          goto LABEL_40;
        }
        _IMLog(@"* Object is no longer valid, skipping this enqueue: %@", (uint64_t)v40, v41, v42, v43, v44, v45, v46, (char)v39);
        goto LABEL_40;
      }
      v47 = objc_msgSend__queue(v39, v40, v41, v42);
      if (v47)
      {
        v48 = v47;
        dispatch_retain(v47);
        xpc_retain(v24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_191894540;
        block[3] = &unk_1E5723FA8;
        block[4] = v39;
        block[5] = v24;
        block[7] = v48;
        block[8] = completion;
        block[6] = v21;
        v52 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        if (v21
          && ((objc_msgSend_isReply(v21, v49, v50, v51) & 1) != 0
           || objc_msgSend_isSync(v21, v53, v54, v55)))
        {
          if ((_os_feature_enabled_impl() & 1) != 0
            || (v59 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v56, v57, v58),
                v63 = objc_msgSend_threadDictionary(v59, v60, v61, v62),
                objc_msgSend_objectForKey_(v63, v64, @"com.apple.IMRemoteObjectDeliveringMessageKey", v65) == v39))
          {
            v52[2](v52);
LABEL_33:
            _Block_release(v52);
            continue;
          }
          dispatch_sync(v48, v52);
        }
        else
        {
          dispatch_async(v48, v52);
        }
        if (v52) {
          goto LABEL_33;
        }
      }
    }
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v33, (uint64_t)&v68, (uint64_t)v72, 16);
    if (v36) {
      continue;
    }
    break;
  }
LABEL_40:

LABEL_41:
  xpc_release(v24);
}

- (void)setCurXPCMessagePriority:(int)a3
{
  self->_curXPCMessagePriority = a3;
}

- (int)curXPCMessagePriority
{
  return self->_curXPCMessagePriority;
}

- (Broadcaster)initWithNotifier:(id)a3 messageContext:(id)a4 protocol:(id)a5 targets:(id)a6
{
  return (Broadcaster *)MEMORY[0x1F4181798](self, sel_initWithNotifier_messageContext_protocol_targets_priority_, a3, a4);
}

- (Broadcaster)initWithNotifier:(id)a3 messageContext:(id)a4 protocol:(id)a5 targets:(id)a6 priority:(int)a7
{
  return (Broadcaster *)objc_msgSend_initWithNotifier_messageContext_protocol_targets_priority_completion_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, 0, 0);
}

- (void)sendXPCObject:(id)a3
{
  if (a3)
  {
    if (objc_msgSend_count(self->_targets, a2, (uint64_t)a3, v3))
    {
      v9 = objc_msgSend_defaultBroadcaster(IMRemoteObjectBroadcaster, v6, v7, v8);
      uint64_t v13 = objc_msgSend__queue(v9, v10, v11, v12);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_1918C297C;
      v14[3] = &unk_1E5723F80;
      v14[4] = a3;
      v14[5] = self;
      dispatch_sync(v13, v14);
    }
  }
}

@end