@interface IMLocalObject
+ (id)_imLocalObjectQueue;
+ (id)_imLocalObjectQueueTargetingWorkloop;
+ (id)_registeredIMLocalObjectForPort:(unsigned int)a3;
+ (void)_registerIMLocalObject:(id)a3;
+ (void)_setExceptionHandlingDisabled:(BOOL)a3;
+ (void)_unregisterIMLocalObject:(id)a3;
+ (void)initialize;
- (BOOL)_handleInvocation:(id)a3;
- (BOOL)_handleInvocation:(id)a3 processingComponentQueue:(BOOL)a4;
- (BOOL)handleInvocation:(id)a3;
- (BOOL)isSameConnection:(id)a3;
- (BOOL)isValid;
- (BOOL)isValidSelector:(SEL)a3;
- (BOOL)wasInterrupted;
- (IMLocalObject)initWithTarget:(id)a3 connection:(id)a4 protocol:(id)a5;
- (IMLocalObject)initWithTarget:(id)a3 connection:(id)a4 protocol:(id)a5 forceSecureCoding:(BOOL)a6;
- (IMLocalObject)initWithTarget:(id)a3 connection:(id)a4 protocol:(id)a5 forceSecureCoding:(BOOL)a6 offMainThread:(BOOL)a7;
- (IMLocalObject)initWithTarget:(id)a3 portName:(id)a4 protocol:(id)a5;
- (IMLocalObject)initWithTarget:(id)a3 protocol:(id)a4;
- (NSArray)allowlistedClasses;
- (NSProtocolChecker)protocolChecker;
- (NSString)portName;
- (NSString)processName;
- (OS_xpc_object)connection;
- (id)_currentMessageContext;
- (id)_peekInvocation;
- (id)description;
- (id)target;
- (void)_clearPort:(BOOL)a3;
- (void)_clearPort:(BOOL)a3 signalRunLoopIfNeeded:(BOOL)a4;
- (void)_enqueueInvocation:(id)a3;
- (void)_enqueueInvocation:(id)a3 xpcMessage:(id)a4;
- (void)_enqueueInvocation:(id)a3 xpcMessage:(id)a4 submitToComponentQueue:(BOOL)a5 isSync:(BOOL)a6 isReply:(BOOL)a7;
- (void)_enqueueInvocationWithPriority:(id)a3 priority:(int)a4;
- (void)_enqueueInvocationWithPriority:(id)a3 xpcMessage:(id)a4 priority:(int)a5;
- (void)_enqueueInvocationWithSync:(id)a3;
- (void)_enqueueInvocationWithSync:(id)a3 xpcMessage:(id)a4;
- (void)_enqueueInvocationWithSync:(id)a3 xpcMessage:(id)a4 submitToComponentQueue:(BOOL)a5;
- (void)_enqueueInvocationWithSync:(id)a3 xpcMessage:(id)a4 submitToComponentQueue:(BOOL)a5 isReply:(BOOL)a6;
- (void)_handleNewInvocations;
- (void)_noteNewInvocation:(BOOL)a3;
- (void)_popInvocation;
- (void)_portDidBecomeInvalid;
- (void)_portInterrupted;
- (void)_systemShutdown:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setAllowlistedClasses:(id)a3;
- (void)setPortName:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setTarget:(id)a3;
- (void)setWhitelistedClasses:(id)a3;
- (void)terminated;
@end

@implementation IMLocalObject

- (BOOL)wasInterrupted
{
  LOBYTE(self) = *((unsigned char *)self->_internal + 103);
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setProcessName:(id)a3
{
  id v3 = (id)*((void *)self->_internal + 7);
  if (v3 != a3)
  {

    *((void *)self->_internal + 7) = a3;
  }
}

- (void)_enqueueInvocation:(id)a3 xpcMessage:(id)a4 submitToComponentQueue:(BOOL)a5 isSync:(BOOL)a6 isReply:(BOOL)a7
{
  if (a3)
  {
    BOOL v7 = a7;
    BOOL v8 = a6;
    BOOL v9 = a5;
    v32 = objc_alloc_init(IMMessageContext);
    kdebug_trace();
    if (a4) {
      objc_msgSend_setXpcMessage_(v32, v13, (uint64_t)a4, v14);
    }
    objc_msgSend_setLocalObject_(v32, v13, (uint64_t)self, v14);
    if (v7) {
      objc_msgSend_setReply_(v32, v15, 1, v17);
    }
    v18 = (char *)objc_msgSend_selector(a3, v15, v16, v17);
    if (v18 != sel_release
      && v18 != sel_retain
      && v18 != sel_init
      && v18 != sel_copy
      && v18 != sel_dealloc
      && v18 != sel_invalidate)
    {
      objc_msgSend_retainArguments(a3, v19, v20, v21);
      if (v9)
      {
        os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
        v24 = (void *)*((void *)self->_internal + 11);
        if (!v24)
        {
          *((void *)self->_internal + 11) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
          v24 = (void *)*((void *)self->_internal + 11);
        }
        uint64_t second = objc_msgSend_pairWithFirst_second_(IMPair, v23, (uint64_t)a3, (uint64_t)v32);
        objc_msgSend_addObject_(v24, v26, second, v27);
        os_unfair_lock_unlock((os_unfair_lock_t)self->_internal + 24);
        objc_msgSend__noteNewInvocation_(self, v28, v8, v29);
      }
      else
      {
        uint64_t v30 = objc_msgSend_pairWithFirst_second_(IMPair, v22, (uint64_t)a3, (uint64_t)v32);
        objc_msgSend__handleInvocation_processingComponentQueue_(self, v31, v30, 0);
      }
    }
  }
}

- (BOOL)isValidSelector:(SEL)a3
{
  if (sel_terminated == a3 || sel_respondsToSelector_ == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    BOOL v7 = (Protocol *)objc_msgSend_protocol(*((void **)self->_internal + 8), a2, (uint64_t)a3, v3);
    SEL name = protocol_getMethodDescription(v7, a3, 1, 1).name;
    if (name || (SEL v5 = protocol_getMethodDescription(v7, a3, 0, 1).name) != 0)
    {
      if ((unint64_t)protocol_getMethodDescription((Protocol *)&unk_1EE2456F0, a3, 1, 1).name) {
        LOBYTE(v5) = 0;
      }
      else {
        LOBYTE(v5) = (unint64_t)protocol_getMethodDescription((Protocol *)&unk_1EE2456F0, a3, 0, 1).name == 0;
      }
    }
  }
  return (char)v5;
}

- (BOOL)_handleInvocation:(id)a3 processingComponentQueue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3052000000;
  v57 = sub_1918C1098;
  v58 = sub_1918C10A8;
  uint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v59 = objc_msgSend_first(a3, a2, (uint64_t)a3, a4);
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3052000000;
  v51 = sub_1918C1098;
  v52 = sub_1918C10A8;
  uint64_t v53 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v53 = objc_msgSend_second(a3, v7, v8, v9);
  internal = self->_internal;
  if (!internal[3]) {
    goto LABEL_14;
  }
  if (!v4) {
    goto LABEL_6;
  }
  if (!*((unsigned char *)internal + 101))
  {
    if ((char *)objc_msgSend_selector((void *)v55[5], v10, v11, v12) != sel_terminated)
    {
LABEL_6:
      CFRetain(self);
      uint64_t v21 = objc_msgSend_selector((void *)v55[5], v18, v19, v20);
      if (objc_msgSend_isValidSelector_(self, v22, v21, v23)
        && objc_msgSend_isValid(self, v24, v25, v26))
      {
        if (v4)
        {
          *((unsigned char *)self->_internal + 101) = 1;
          *((void *)self->_internal + 1) = v49[5];
        }
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v42 = sub_191894D50;
        v43 = &unk_1E5723F30;
        v44 = self;
        v45 = &v54;
        v46 = &v48;
        BOOL v47 = v4;
        if (v4)
        {
          objc_msgSend_voucher((void *)v49[5], v24, v25, v26);
          voucher_adopt();
        }
        v42((uint64_t)v41);
        if (v4)
        {
          v37 = (void *)v49[5];
          uint64_t v38 = voucher_adopt();
          objc_msgSend_setVoucher_(v37, v39, v38, v40);
          *((unsigned char *)self->_internal + 101) = 0;
        }
      }
      else
      {
        uint64_t v27 = (void *)v55[5];
        v28 = (const char *)objc_msgSend_selector(v27, v24, v25, v26);
        NSStringFromSelector(v28);
        _IMLog(@"Incoming invocation [%@:%@] does not conform to protocol", v29, v30, v31, v32, v33, v34, v35, (char)v27);
      }
      CFRelease(self);
      goto LABEL_14;
    }
    objc_msgSend_terminated(self, v15, v16, v17);
LABEL_14:
    BOOL v14 = 1;
    goto LABEL_15;
  }
  BOOL v14 = 0;
LABEL_15:
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
  return v14;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    qword_1EB273BD0 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
    qword_1EB273C08 = (uint64_t)(id)objc_msgSend_nonRetainingArray(MEMORY[0x1E4F1CA48], v3, v4, v5);
    IMRemoteObjectsRunLoopModes = (uint64_t)(id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v6, *MEMORY[0x1E4F1C4B0], v7, *MEMORY[0x1E4F1C3A0], @"IMRemoteObjectsRunLoopMode", 0);
    objc_msgSend_sharedInstance(IMSystemMonitor, v8, v9, v10);
    if (qword_1EB273BF0 != -1)
    {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
  }
}

- (BOOL)isValid
{
  LOBYTE(self) = *((void *)self->_internal + 4) != 0;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (IMLocalObject)initWithTarget:(id)a3 connection:(id)a4 protocol:(id)a5 forceSecureCoding:(BOOL)a6 offMainThread:(BOOL)a7
{
  v13 = objc_msgSend_sharedInstance(IMSystemMonitor, a2, (uint64_t)a3, (uint64_t)a4);
  if (!objc_msgSend_systemIsShuttingDown(v13, v14, v15, v16))
  {
    if (!a6)
    {
      _IMWarn(@"IMLocalObject is created without forcing secure coding, RETURNING NIL! Please adopt NSSecureCoding for all arguments in the protocol, pass in YES for forceSecureCoding, and use this method instead [IMLocalObject initWithTarget:connection:protocol:forceSecureCoding:offMainThread:]", v17, v18, v19, v20, v21, v22, v23, v67);
      goto LABEL_11;
    }
    v69.receiver = self;
    v69.super_class = (Class)IMLocalObject;
    uint64_t v29 = [(IMLocalObject *)&v69 init];
    if (!v29)
    {
      objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v27, 0, v28);
      objc_msgSend_dealloc(0, v55, v56, v57);
      return v29;
    }
    objc_msgSend__registerIMLocalObject_(IMLocalObject, v27, (uint64_t)v29, v28);
    v29->_internal = objc_alloc_init(IMLocalObjectInternal);
    if (dword_1EB273738 < 0)
    {
      if (qword_1EB273BF0 != -1) {
        dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
      }
      if (dword_1EB273738 <= 0) {
        goto LABEL_8;
      }
    }
    else if (!dword_1EB273738)
    {
LABEL_8:
      *((unsigned char *)v29->_internal + 102) = a7;
      v37 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v41 = objc_msgSend_stringGUID(NSString, v38, v39, v40);
      v45 = (const char *)objc_msgSend_UTF8String(v41, v42, v43, v44);
      *((void *)v29->_internal + 5) = dispatch_queue_create(v45, v37);
      if (a4) {
        xpc_object_t v53 = xpc_retain(a4);
      }
      else {
        xpc_object_t v53 = 0;
      }
      *((void *)v29->_internal + 4) = v53;
      if (!a7)
      {
        context.version = 0;
        context.info = v29;
        memset(&context.retain, 0, 64);
        *((void *)v29->_internal + 10) = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &context);
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, *((CFRunLoopSourceRef *)v29->_internal + 10), @"IMRemoteObjectsRunLoopMode");
      }
      uint64_t v59 = (_xpc_connection_s *)*((void *)v29->_internal + 4);
      if (v59)
      {
        im_configure_connection_with_local_object(v59, (const char *)v29, v47, v48);
        *((void *)v29->_internal + 3) = a3;
        id v60 = objc_alloc(MEMORY[0x1E4F28FA8]);
        *((void *)v29->_internal + 8) = objc_msgSend_initWithProtocol_(v60, v61, (uint64_t)a5, v62);
        *((void *)v29->_internal + 6) = 0;
        *((void *)v29->_internal + 2) = 0;
        *((_DWORD *)v29->_internal + 24) = 0;
        os_unfair_lock_lock((os_unfair_lock_t)v29->_internal + 24);
        *((void *)v29->_internal + 11) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        os_unfair_lock_unlock((os_unfair_lock_t)v29->_internal + 24);
        return v29;
      }
      _IMWarn(@"IMLocalObject: Could not create server for listener: %@", v46, v47, v48, v49, v50, v51, v52, (char)a3);
      objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v63, (uint64_t)v29, v64);
      internal = v29->_internal;
      v66 = internal[5];
      if (v66)
      {
        dispatch_release(v66);
        internal = v29->_internal;
      }

      v29->_internal = 0;
      return 0;
    }
    NSStringFromProtocol((Protocol *)a5);
    _IMLog(@"* Creating IMLocalObject with target: %@  protocol: %@", v30, v31, v32, v33, v34, v35, v36, (char)a3);
    goto LABEL_8;
  }
  _IMWarn(@"System is shutting down, no listener will be created for: %@", v17, v18, v19, v20, v21, v22, v23, (char)a3);
LABEL_11:
  objc_msgSend_dealloc(self, v24, v25, v26);
  return 0;
}

+ (void)_registerIMLocalObject:(id)a3
{
  objc_msgSend_lock((void *)qword_1EB273BD0, a2, (uint64_t)a3, v3);
  objc_msgSend_addObject_((void *)qword_1EB273C08, v5, (uint64_t)a3, v6);
  uint64_t v10 = (void *)qword_1EB273BD0;
  objc_msgSend_unlock(v10, v7, v8, v9);
}

- (NSProtocolChecker)protocolChecker
{
  return (NSProtocolChecker *)*((void *)self->_internal + 8);
}

- (NSString)processName
{
  return (NSString *)*((void *)self->_internal + 7);
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)*((void *)self->_internal + 4);
}

- (void)_enqueueInvocationWithSync:(id)a3 xpcMessage:(id)a4 submitToComponentQueue:(BOOL)a5
{
}

- (void)_enqueueInvocationWithSync:(id)a3 xpcMessage:(id)a4
{
}

+ (id)_imLocalObjectQueue
{
  if (qword_1EB273B70 != -1) {
    dispatch_once(&qword_1EB273B70, &unk_1EE22FBD8);
  }
  return (id)qword_1EB273B68;
}

+ (id)_imLocalObjectQueueTargetingWorkloop
{
  if (qword_1E92DB610 != -1) {
    dispatch_once(&qword_1E92DB610, &unk_1EE230E78);
  }
  return (id)qword_1E92DB618;
}

+ (void)_setExceptionHandlingDisabled:(BOOL)a3
{
  byte_1E92DAE20 = a3;
}

+ (id)_registeredIMLocalObjectForPort:(unsigned int)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  objc_msgSend_lock((void *)qword_1EB273BD0, a2, *(uint64_t *)&a3, v3);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = (void *)qword_1EB273C08;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)qword_1EB273C08, v6, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v7)
  {
    uint64_t v15 = v7;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v5);
        }
        uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend__port(v18, v8, v9, v10) == a3)
        {
          id v22 = v18;
          goto LABEL_12;
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v24, (uint64_t)v28, 16);
      if (v15) {
        continue;
      }
      break;
    }
  }
  _IMWarn(@"No listener for port: %d     Candidates were: %@", (uint64_t)v8, v9, v10, v11, v12, v13, v14, a3);
  uint64_t v18 = 0;
LABEL_12:
  objc_msgSend_unlock((void *)qword_1EB273BD0, v19, v20, v21);
  return v18;
}

+ (void)_unregisterIMLocalObject:(id)a3
{
  objc_msgSend_lock((void *)qword_1EB273BD0, a2, (uint64_t)a3, v3);
  objc_msgSend_removeObjectIdenticalTo_((void *)qword_1EB273C08, v5, (uint64_t)a3, v6);
  uint64_t v10 = (void *)qword_1EB273BD0;
  objc_msgSend_unlock(v10, v7, v8, v9);
}

- (IMLocalObject)initWithTarget:(id)a3 protocol:(id)a4
{
  return (IMLocalObject *)MEMORY[0x1F4181798](self, sel_initWithTarget_portName_protocol_, a3, 0);
}

- (IMLocalObject)initWithTarget:(id)a3 connection:(id)a4 protocol:(id)a5
{
  return (IMLocalObject *)MEMORY[0x1F4181798](self, sel_initWithTarget_connection_protocol_forceSecureCoding_, a3, a4);
}

- (IMLocalObject)initWithTarget:(id)a3 connection:(id)a4 protocol:(id)a5 forceSecureCoding:(BOOL)a6
{
  return (IMLocalObject *)MEMORY[0x1F4181798](self, sel_initWithTarget_connection_protocol_forceSecureCoding_offMainThread_, a3, a4);
}

- (void)setWhitelistedClasses:(id)a3
{
}

- (IMLocalObject)initWithTarget:(id)a3 portName:(id)a4 protocol:(id)a5
{
  uint64_t v9 = objc_msgSend_sharedInstance(IMSystemMonitor, a2, (uint64_t)a3, (uint64_t)a4);
  if (objc_msgSend_systemIsShuttingDown(v9, v10, v11, v12))
  {
    _IMWarn(@"System is shutting down, no listener will be created for: %@", v13, v14, v15, v16, v17, v18, v19, (char)a3);
    goto LABEL_3;
  }
  v66.receiver = self;
  v66.super_class = (Class)IMLocalObject;
  self = [(IMLocalObject *)&v66 init];
  if (!self)
  {
    objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v23, 0, v24);
    objc_msgSend_dealloc(0, v56, v57, v58);
    return self;
  }
  objc_msgSend__registerIMLocalObject_(IMLocalObject, v23, (uint64_t)self, v24);
  self->_internal = objc_alloc_init(IMLocalObjectInternal);
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    if (dword_1EB273738 <= 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (dword_1EB273738)
  {
LABEL_7:
    NSStringFromProtocol((Protocol *)a5);
    _IMLog(@"* Creating IMLocalObject with target: %@  protocol: %@", v25, v26, v27, v28, v29, v30, v31, (char)a3);
  }
LABEL_8:
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = sub_1918C0628;
  v65[3] = &unk_1E5723EE0;
  v65[4] = self;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = sub_1918C0734;
  v64[3] = &unk_1E5723F08;
  v64[4] = self;
  uint64_t v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v36 = objc_msgSend_stringGUID(NSString, v33, v34, v35);
  uint64_t v40 = (const char *)objc_msgSend_UTF8String(v36, v37, v38, v39);
  *((void *)self->_internal + 5) = dispatch_queue_create(v40, v32);
  uint64_t v44 = (const char *)objc_msgSend_UTF8String(a4, v41, v42, v43);
  *((void *)self->_internal + 4) = IMXPCCreateServerConnection(v44, v65, 0, v64, *((void **)self->_internal + 5));
  uint64_t v52 = (_xpc_connection_s *)*((void *)self->_internal + 4);
  if (v52)
  {
    im_configure_connection_with_local_object(v52, (const char *)self, v46, v47);
    xpc_connection_resume(*((xpc_connection_t *)self->_internal + 4));
    *((void *)self->_internal + 3) = a3;
    id v53 = objc_alloc(MEMORY[0x1E4F28FA8]);
    *((void *)self->_internal + 8) = objc_msgSend_initWithProtocol_(v53, v54, (uint64_t)a5, v55);
    *((void *)self->_internal + 6) = a4;
    *((void *)self->_internal + 2) = 0;
    *((_DWORD *)self->_internal + 24) = 0;
    os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
    *((void *)self->_internal + 11) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)self->_internal + 24);
    return self;
  }
  _IMWarn(@"IMLocalObject: Could not create server for listener: %@", v45, v46, v47, v48, v49, v50, v51, (char)a3);
  objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v60, (uint64_t)self, v61);
  internal = self->_internal;
  v63 = internal[5];
  if (v63)
  {
    dispatch_release(v63);
    internal = self->_internal;
  }

  self->_internal = 0;
LABEL_3:
  objc_msgSend_dealloc(self, v20, v21, v22);
  return 0;
}

- (id)target
{
  return (id)*((void *)self->_internal + 3);
}

- (void)setTarget:(id)a3
{
  *((void *)self->_internal + 3) = a3;
}

- (void)_clearPort:(BOOL)a3
{
}

- (void)_clearPort:(BOOL)a3 signalRunLoopIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  *((void *)self->_internal + 3) = 0;
  internal = (unsigned __int8 *)self->_internal;
  uint64_t v8 = (_xpc_connection_s *)*((void *)internal + 4);
  if (!v8
    || (int v9 = internal[102],
        xpc_connection_cancel(v8),
        xpc_release(*((xpc_object_t *)self->_internal + 4)),
        *((void *)self->_internal + 4) = 0,
        objc_msgSend__unregisterIMLocalObject_(IMLocalObject, v10, (uint64_t)self, v11),
        v5))
  {
    os_unfair_recursive_lock_unlock();
    return;
  }
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    if (dword_1EB273738 <= 0) {
      goto LABEL_9;
    }
  }
  else if (!dword_1EB273738)
  {
    goto LABEL_9;
  }
  _IMLog(@"* IMLocalObject posting death notification: %@", v12, v13, v14, v15, v16, v17, v18, (char)self);
LABEL_9:
  os_unfair_recursive_lock_unlock();
  if (v9)
  {
    if (_os_feature_enabled_impl() && im_primary_base_queue())
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v23 = objc_msgSend__imLocalObjectQueueTargetingWorkloop(v19, v20, v21, v22);
    }
    else
    {
      uint64_t v24 = objc_opt_class();
      uint64_t v23 = objc_msgSend__imLocalObjectQueue(v24, v25, v26, v27);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1918C0B2C;
    block[3] = &unk_1E5723EE0;
    block[4] = self;
    dispatch_async(v23, block);
  }
  else
  {
    Main = CFRunLoopGetMain();
    if (v4
      && (uint64_t v32 = Main, CFRunLoopIsWaiting(Main))
      && (uint64_t v33 = (__CFString *)CFRunLoopCopyCurrentMode(v32),
          objc_msgSend_isEqualToString_(v33, v34, @"IMRemoteObjectsRunLoopMode", v35)))
    {
      qos_class_t v36 = qos_class_self();
      if (v36 <= QOS_CLASS_DEFAULT) {
        dispatch_qos_class_t v37 = QOS_CLASS_DEFAULT;
      }
      else {
        dispatch_qos_class_t v37 = v36;
      }
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = sub_1918C0B74;
      v45[3] = &unk_1E5723EE0;
      v45[4] = self;
      dispatch_block_t v38 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37, 0, v45);
      uint64_t v39 = OSLogHandleForIDSCategory("IMLocalObject");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191892000, v39, OS_LOG_TYPE_DEFAULT, "_clearPort trying to wake up main thread", buf, 2u);
      }
      uint64_t v40 = CFRunLoopGetMain();
      CFRunLoopPerformBlock(v40, (CFTypeRef)IMRemoteObjectsRunLoopModes, v38);
      CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)self->_internal + 10));
      v41 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v41);
    }
    else
    {
      uint64_t v42 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v29, v30, v31);
      objc_msgSend___mainThreadPostNotificationName_object_(v42, v43, @"IMLocalObjectDidDisconnect", (uint64_t)self);
    }
  }
}

- (void)dealloc
{
  BOOL v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, 0, 0);
  internal = self->_internal;
  if (!internal) {
    goto LABEL_18;
  }
  p_superclass = &OBJC_METACLASS____IMTimingInstance.superclass;
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1)
    {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
      p_superclass = (__objc2_class **)(&OBJC_METACLASS____IMTimingInstance + 8);
    }
    internal = self->_internal;
    if (*((int *)p_superclass + 462) <= 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (dword_1EB273738) {
LABEL_4:
  }
    _IMLog(@"* Dealloc IMLocalObject: %@", v7, v8, v9, v10, v11, v12, v13, internal[6]);
LABEL_5:
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend__clearPort_(self, v16, 0, v17);
  uint64_t v18 = self->_internal;
  uint64_t v19 = (const void *)v18[7];
  if (v19)
  {
    CFRelease(v19);
    uint64_t v18 = self->_internal;
  }
  uint64_t v20 = (const void *)v18[6];
  if (v20)
  {
    CFRelease(v20);
    uint64_t v18 = self->_internal;
  }
  uint64_t v21 = (const void *)v18[8];
  if (v21)
  {
    CFRelease(v21);
    uint64_t v18 = self->_internal;
  }
  uint64_t v22 = (const void *)v18[9];
  if (v22)
  {
    CFRelease(v22);
    uint64_t v18 = self->_internal;
  }
  uint64_t v23 = (__CFRunLoopSource *)v18[10];
  if (v23)
  {
    CFRunLoopSourceInvalidate(v23);
    CFRelease(*((CFTypeRef *)self->_internal + 10));
    uint64_t v18 = self->_internal;
  }
  uint64_t v24 = v18[5];
  if (v24) {
    dispatch_release(v24);
  }
  os_unfair_recursive_lock_unlock();

  self->_internal = 0;
LABEL_18:
  v25.receiver = self;
  v25.super_class = (Class)IMLocalObject;
  [(IMLocalObject *)&v25 dealloc];
}

- (void)_portInterrupted
{
  if ((dword_1EB273738 & 0x80000000) == 0)
  {
    if (!dword_1EB273738) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (qword_1EB273BF0 != -1) {
    dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
  }
  if (dword_1EB273738 > 0) {
LABEL_3:
  }
    _IMLog(@"* IMLocalObject interrupted callback: %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((void *)self->_internal + 6));
LABEL_4:
  os_unfair_recursive_lock_lock_with_options();
  *((unsigned char *)self->_internal + 103) = 1;
  objc_msgSend_invalidate(self, v9, v10, v11);
  os_unfair_recursive_lock_unlock();
}

- (void)_portDidBecomeInvalid
{
  if ((dword_1EB273738 & 0x80000000) == 0)
  {
    if (!dword_1EB273738) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (qword_1EB273BF0 != -1) {
    dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
  }
  if (dword_1EB273738 > 0) {
LABEL_3:
  }
    _IMLog(@"* IMLocalObject invalidation callback: %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((void *)self->_internal + 6));
LABEL_4:
  objc_msgSend__clearPort_(self, a2, 0, v3);
}

- (void)terminated
{
  if ((dword_1EB273738 & 0x80000000) == 0)
  {
    if (!dword_1EB273738) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (qword_1EB273BF0 != -1) {
    dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
  }
  if (dword_1EB273738 > 0) {
LABEL_3:
  }
    _IMLog(@"* Received termination notice for IMLocalObject: %@ (connection=%p) busy: %d", (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((void *)self->_internal + 6));
LABEL_4:
  objc_msgSend__clearPort_(self, a2, 0, v3);
}

- (void)_systemShutdown:(id)a3
{
  if ((dword_1EB273738 & 0x80000000) == 0)
  {
    if (!dword_1EB273738) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (qword_1EB273BF0 != -1) {
    dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
  }
  if (dword_1EB273738 > 0) {
LABEL_3:
  }
    _IMLog(@"* Received shutdown notice for IMLocalObject: %@ (connection=%p) busy: %d", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, *((void *)self->_internal + 6));
LABEL_4:
  objc_msgSend__clearPort_(self, a2, 1, v3);
}

- (NSString)portName
{
  return (NSString *)*((void *)self->_internal + 6);
}

- (void)setPortName:(id)a3
{
  id v3 = (id)*((void *)self->_internal + 6);
  if (v3 != a3)
  {

    *((void *)self->_internal + 6) = a3;
  }
}

- (id)_currentMessageContext
{
  return (id)*((void *)self->_internal + 1);
}

- (BOOL)_handleInvocation:(id)a3
{
  return objc_msgSend__handleInvocation_processingComponentQueue_(self, a2, (uint64_t)a3, 1);
}

- (BOOL)handleInvocation:(id)a3
{
  internal = self->_internal;
  int v5 = internal[101];
  if (!internal[101]) {
    objc_msgSend__handleInvocation_(self, a2, (uint64_t)a3, v3);
  }
  return v5 == 0;
}

- (void)_handleNewInvocations
{
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    if (dword_1EB273738 <= 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (dword_1EB273738) {
LABEL_3:
  }
    _IMLog(@"** Begin Handling available components (Local object: %@)", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (char)self);
LABEL_4:
  id v9 = (id)objc_msgSend__peekInvocation(self, a2, v2, v3);
  BOOL v17 = v9 == 0;
  if (!v9) {
    goto LABEL_23;
  }
  id v18 = v9;
  while (1)
  {
    objc_msgSend__popInvocation(self, v10, v11, v12);
    if ((dword_1EB273738 & 0x80000000) == 0)
    {
      if (!dword_1EB273738) {
        goto LABEL_9;
      }
LABEL_8:
      uint64_t v22 = objc_msgSend_first(v18, v19, v20, v21);
      uint64_t v26 = (const char *)objc_msgSend_selector(v22, v23, v24, v25);
      char v27 = NSStringFromSelector(v26);
      _IMLog(@"** Incoming Invocation: %@ (Local object: %@)", v28, v29, v30, v31, v32, v33, v34, v27);
      goto LABEL_9;
    }
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    if (dword_1EB273738 > 0) {
      goto LABEL_8;
    }
LABEL_9:
    if ((objc_msgSend_handleInvocation_(self, v19, (uint64_t)v18, v21) & 1) == 0) {
      break;
    }

    id v18 = (id)objc_msgSend__peekInvocation(self, v35, v36, v37);
    BOOL v17 = v18 == 0;
    if (!v18) {
      goto LABEL_23;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
  uint64_t v39 = (void *)*((void *)self->_internal + 11);
  if (!v39)
  {
    *((void *)self->_internal + 11) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    uint64_t v39 = (void *)*((void *)self->_internal + 11);
  }
  objc_msgSend_insertObject_atIndex_(v39, v38, (uint64_t)v18, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)self->_internal + 24);
  uint64_t v43 = objc_msgSend_first(v18, v40, v41, v42);
  uint64_t v47 = (const char *)objc_msgSend_selector(v43, v44, v45, v46);
  char v48 = NSStringFromSelector(v47);
  _IMLog(@"**** FAILED DELIVERY (Will retry) Incoming Invocation: %@ (Local object: %@)", v49, v50, v51, v52, v53, v54, v55, v48);

LABEL_23:
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    if (dword_1EB273738 > 0) {
LABEL_25:
    }
      _IMLog(@"** End Handling available components (Local object: %@)", (uint64_t)v10, v11, v12, v13, v14, v15, v16, (char)self);
  }
  else if (dword_1EB273738)
  {
    goto LABEL_25;
  }
  *((unsigned char *)self->_internal + 100) = 0;
  if (!v17)
  {
    objc_msgSend__noteNewInvocation_(self, v10, 0, v12);
  }
}

- (void)_noteNewInvocation:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    internal = self->_internal;
    if (internal[100]) {
      return;
    }
    internal[100] = 1;
  }
  qos_class_t v6 = qos_class_self();
  if (v6 <= QOS_CLASS_DEFAULT) {
    dispatch_qos_class_t v7 = QOS_CLASS_DEFAULT;
  }
  else {
    dispatch_qos_class_t v7 = v6;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918C14D8;
  block[3] = &unk_1E5723EE0;
  block[4] = self;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7, 0, block);
  id v9 = v8;
  if (*((unsigned char *)self->_internal + 102))
  {
    if (_os_feature_enabled_impl() && im_primary_base_queue())
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v14 = objc_msgSend__imLocalObjectQueueTargetingWorkloop(v10, v11, v12, v13);
    }
    else
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v14 = objc_msgSend__imLocalObjectQueue(v15, v16, v17, v18);
    }
    uint64_t v19 = v14;
    if (v3 && _os_feature_enabled_impl()) {
      dispatch_sync(v19, v9);
    }
    else {
      dispatch_async(v19, v9);
    }
  }
  else if (v3)
  {
    (*((void (**)(dispatch_block_t))v8 + 2))(v8);
  }
  else
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)IMRemoteObjectsRunLoopModes, v9);
    CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)self->_internal + 10));
    uint64_t v21 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v21);
  }
  _Block_release(v9);
}

- (id)_peekInvocation
{
  os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
  if (objc_msgSend_count(*((void **)self->_internal + 11), v3, v4, v5)) {
    id v8 = (id)objc_msgSend_objectAtIndex_(*((void **)self->_internal + 11), v6, 0, v7);
  }
  else {
    id v8 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)self->_internal + 24);
  return v8;
}

- (void)_popInvocation
{
  os_unfair_lock_lock((os_unfair_lock_t)self->_internal + 24);
  if (objc_msgSend_count(*((void **)self->_internal + 11), v3, v4, v5))
  {
    objc_msgSend_removeObjectAtIndex_(*((void **)self->_internal + 11), v6, 0, v7);
    if (!objc_msgSend_count(*((void **)self->_internal + 11), v8, v9, v10))
    {

      *((void *)self->_internal + 11) = 0;
    }
  }
  uint64_t v11 = (os_unfair_lock_s *)((char *)self->_internal + 96);
  os_unfair_lock_unlock(v11);
}

- (void)_enqueueInvocation:(id)a3
{
}

- (void)_enqueueInvocation:(id)a3 xpcMessage:(id)a4
{
}

- (void)_enqueueInvocationWithPriority:(id)a3 priority:(int)a4
{
}

- (void)_enqueueInvocationWithPriority:(id)a3 xpcMessage:(id)a4 priority:(int)a5
{
  if (a3)
  {
    if ((char *)objc_msgSend_selector(a3, a2, (uint64_t)a3, (uint64_t)a4, *(void *)&a5) != sel_sendMessageWithSendParameters_) {
      sub_1918E18F8();
    }
    MEMORY[0x1F4181798](self, sel__enqueueInvocation_xpcMessage_submitToComponentQueue_isSync_isReply_, a3, a4);
  }
}

- (void)_enqueueInvocationWithSync:(id)a3
{
}

- (void)_enqueueInvocationWithSync:(id)a3 xpcMessage:(id)a4 submitToComponentQueue:(BOOL)a5 isReply:(BOOL)a6
{
}

- (BOOL)isSameConnection:(id)a3
{
  LOBYTE(a3) = *((void *)self->_internal + 4) == (void)a3;
  os_unfair_recursive_lock_unlock();
  return (char)a3;
}

- (NSArray)allowlistedClasses
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = (NSArray *)*((void *)self->_internal + 9);
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setAllowlistedClasses:(id)a3
{
  os_unfair_recursive_lock_lock_with_options();
  id v5 = (id)*((void *)self->_internal + 9);
  if (v5 != a3)
  {

    *((void *)self->_internal + 9) = a3;
  }
  os_unfair_recursive_lock_unlock();
}

- (void)invalidate
{
  os_unfair_recursive_lock_lock_with_options();
  internal = self->_internal;
  if (*((_WORD *)internal + 50))
  {
    if (internal[102])
    {
      if (_os_feature_enabled_impl() && im_primary_base_queue())
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v15 = objc_msgSend__imLocalObjectQueueTargetingWorkloop(v11, v12, v13, v14);
      }
      else
      {
        uint64_t v16 = objc_opt_class();
        uint64_t v15 = objc_msgSend__imLocalObjectQueue(v16, v17, v18, v19);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1918C1A70;
      block[3] = &unk_1E5723EE0;
      block[4] = self;
      dispatch_async(v15, block);
    }
    else
    {
      qos_class_t v20 = qos_class_self();
      if (v20 <= QOS_CLASS_DEFAULT) {
        dispatch_qos_class_t v21 = QOS_CLASS_DEFAULT;
      }
      else {
        dispatch_qos_class_t v21 = v20;
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = sub_1918C1A78;
      v29[3] = &unk_1E5723EE0;
      v29[4] = self;
      dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v21, 0, v29);
      uint64_t v23 = OSLogHandleForIDSCategory("IMLocalObject");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191892000, v23, OS_LOG_TYPE_DEFAULT, "******* trying to invalidate connection. Let's signal the runloop in case there is a pending history query", buf, 2u);
      }
      Main = CFRunLoopGetMain();
      CFRunLoopPerformBlock(Main, (CFTypeRef)IMRemoteObjectsRunLoopModes, v22);
      CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)self->_internal + 10));
      uint64_t v25 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v25);
      objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v26, (uint64_t)self, (uint64_t)sel_invalidate, 0);
      objc_msgSend_performSelector_withObject_afterDelay_inModes_(self, v27, (uint64_t)sel_invalidate, 0, IMRemoteObjectsRunLoopModes, 0.0);
    }
    os_unfair_recursive_lock_unlock();
    return;
  }
  *((void *)internal + 3) = 0;
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    if (dword_1EB273738 <= 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (dword_1EB273738) {
LABEL_17:
  }
    _IMLog(@"* Invalidating IMLocalObject: %@ (connection=%p) busy: %d", (uint64_t)v3, v4, v5, v6, v7, v8, v9, *((void *)self->_internal + 6));
LABEL_18:
  objc_msgSend__clearPort_signalRunLoopIfNeeded_(self, v3, 0, 1);
  os_unfair_recursive_lock_unlock();
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_portName(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_processName(self, v10, v11, v12);
  return (id)objc_msgSend_stringWithFormat_(v3, v14, @"[%@] Port Name: %@ Process Name: %@", v15, v5, v9, v13);
}

@end