@interface IMRemoteObject
+ (id)_remoteObjects;
+ (void)_registerIMRemoteObject:(id)a3;
+ (void)_unregisterIMRemoteObject:(id)a3;
+ (void)initialize;
- (BOOL)isValid;
- (IMRemoteObject)initWithConnection:(id)a3 protocol:(id)a4;
- (IMRemoteObject)initWithConnection:(id)a3 protocol:(id)a4 alreadyConfigured:(BOOL)a5;
- (IMRemoteObject)initWithConnection:(id)a3 protocol:(id)a4 alreadyConfigured:(BOOL)a5 forceSecureCoding:(BOOL)a6;
- (IMRemoteObject)initWithPortName:(id)a3 protocol:(id)a4;
- (NSString)portName;
- (NSString)processName;
- (OS_xpc_object)connection;
- (id)_initWithConnection:(id)a3 portName:(id)a4 protocol:(id)a5 alreadyConfigured:(BOOL)a6 forceSecureCoding:(BOOL)a7;
- (id)_queue;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (int)pid;
- (unint64_t)forwardXPCObject:(id)a3 messageContext:(id)a4 locked:(BOOL)a5;
- (void)_cleanupMachBitsCanPost:(BOOL)a3 locked:(BOOL)a4;
- (void)_portDidBecomeInvalid;
- (void)_systemShutdown:(id)a3;
- (void)blockUntilSendQueueIsEmpty;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)invalidate;
- (void)setPid:(int)a3;
- (void)setPortName:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation IMRemoteObject

- (void)setProcessName:(id)a3
{
  id v3 = (id)*((void *)self->_internal + 5);
  if (v3 != a3)
  {

    *((void *)self->_internal + 5) = a3;
  }
}

- (unint64_t)forwardXPCObject:(id)a3 messageContext:(id)a4 locked:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  if (!a5) {
    os_unfair_recursive_lock_lock_with_options();
  }
  v9 = (_xpc_connection_s *)*((void *)self->_internal + 1);
  if (!v9) {
    goto LABEL_12;
  }
  if (!a4 || !objc_msgSend_shouldBoost(a4, a2, (uint64_t)a3, (uint64_t)a4))
  {
    xpc_connection_send_notification();
LABEL_12:
    if (a5) {
      return 0;
    }
    goto LABEL_13;
  }
  if (objc_msgSend_isSync(a4, v10, v11, v12))
  {
    xpc_object_t v16 = xpc_connection_send_message_with_reply_sync(v9, a3);
    if (!a5) {
      os_unfair_recursive_lock_unlock();
    }
    im_local_object_peer_event_handler_is_syncReply(v9, v16, 1);
    xpc_release(v16);
    return 0;
  }
  if (objc_msgSend_needReply(a4, v13, v14, v15))
  {
    if (qword_1E92DB160 != -1) {
      dispatch_once(&qword_1E92DB160, &unk_1EE230AD8);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1918C2264;
    handler[3] = &unk_1E5723F58;
    handler[4] = v9;
    xpc_connection_send_message_with_reply(v9, a3, (dispatch_queue_t)qword_1E92DB168, handler);
  }
  else if (objc_msgSend_isReply(a4, v18, v19, v20) {
         && objc_msgSend_xpcMessage(a4, v21, v22, v23)
  }
         && (v27 = objc_msgSend_localObject(a4, v24, v25, v26),
             objc_msgSend_isSameConnection_(v27, v28, (uint64_t)v9, v29)))
  {
    v33 = objc_msgSend_xpcMessage(a4, v30, v31, v32);
    xpc_object_t reply = xpc_dictionary_create_reply(v33);
    if (reply)
    {
      v35 = reply;
      xpc_object_t value = xpc_dictionary_get_value(a3, "invocation");
      xpc_dictionary_set_value(v35, "invocation", value);
      int64_t int64 = xpc_dictionary_get_int64(a3, "priority");
      xpc_dictionary_set_int64(v35, "priority", int64);
      xpc_connection_send_message(v9, v35);
      xpc_release(v35);
    }
  }
  else
  {
    xpc_connection_send_message(v9, a3);
  }
  kdebug_trace();
  if (!a5) {
LABEL_13:
  }
    os_unfair_recursive_lock_unlock();
  return 0;
}

+ (void)initialize
{
  v2 = (void *)MEMORY[0x192FDE5A0]();
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    qword_1EB273BD8 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
    qword_1EB273BC8 = (uint64_t)(id)objc_msgSend_nonRetainingArray(MEMORY[0x1E4F1CA48], v4, v5, v6);
    objc_msgSend_sharedInstance(IMSystemMonitor, v7, v8, v9);
  }
}

- (BOOL)isValid
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = 0;
  internal = self->_internal;
  if (!*((unsigned char *)internal + 60)) {
    BOOL v3 = internal[1] != 0;
  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (int)pid
{
  LODWORD(self) = *((_DWORD *)self->_internal + 14);
  os_unfair_recursive_lock_unlock();
  return (int)self;
}

- (id)_initWithConnection:(id)a3 portName:(id)a4 protocol:(id)a5 alreadyConfigured:(BOOL)a6 forceSecureCoding:(BOOL)a7
{
  if (!a3 && !objc_msgSend_length(a4, a2, 0, (uint64_t)a4))
  {
    v38 = @"Empty connection passed to remote object, not creating";
    goto LABEL_15;
  }
  v17 = objc_msgSend_sharedInstance(IMSystemMonitor, a2, (uint64_t)a3, (uint64_t)a4);
  if (objc_msgSend_systemIsShuttingDown(v17, v18, v19, v20))
  {
    _IMWarn(@"System is shutting down, no listener will be created for: %p", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v13, v14, v15, v16, (char)a3);
LABEL_16:
    objc_msgSend_dealloc(self, v21, v22, v23);
    return 0;
  }
  if (!a7)
  {
    v38 = @"IMRemoteObject is created without forcing secure coding, RETURNING NIL! Please adopt NSSecureCoding for all arguments in the protocol, pass in YES for forceSecureCoding, and use this method instead [IMRemoteObject initWithConnection:protocol:alreadyConfigured:forceSecureCoding:]";
LABEL_15:
    _IMWarn(v38, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v13, v14, v15, v16, v51);
    goto LABEL_16;
  }
  v53.receiver = self;
  v53.super_class = (Class)IMRemoteObject;
  v27 = [(IMRemoteObject *)&v53 init];
  if (!v27)
  {
    objc_msgSend_dealloc(0, v24, v25, v26);
    return v27;
  }
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    if (dword_1EB273738 <= 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (dword_1EB273738)
  {
LABEL_9:
    NSStringFromProtocol((Protocol *)a5);
    _IMLog(@"* Creating IMRemoteObject with connection: %p  protocol: %@", v28, v29, v30, v31, v32, v33, v34, (char)a3);
  }
LABEL_10:
  v27->_internal = objc_alloc_init(IMRemoteObjectInternal);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = sub_1918C1CB4;
  v52[3] = &unk_1E5723EE0;
  v52[4] = v27;
  if (a3)
  {
    *((void *)v27->_internal + 1) = xpc_retain(a3);
    if (!a6) {
      IMXPCConfigureConnection(a3, v52, 0);
    }
  }
  else
  {
    v40 = (const char *)objc_msgSend_UTF8String(a4, v35, v36, v37);
    *((void *)v27->_internal + 1) = IMXPCCreateConnectionForService(1, v40, v52, 0);
  }
  *((void *)v27->_internal + 3) = a5;
  v41 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  if (_os_feature_enabled_impl() && im_primary_base_queue())
  {
    v42 = im_primary_base_queue();
    dispatch_queue_t v43 = dispatch_queue_create_with_target_V2(0, v41, v42);
  }
  else
  {
    dispatch_queue_t v43 = dispatch_queue_create(0, v41);
  }
  *((void *)v27->_internal + 2) = v43;
  *((void *)v27->_internal + 6) = 0;
  objc_msgSend__registerIMRemoteObject_(IMRemoteObject, v44, (uint64_t)v27, v45);
  v49 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v46, v47, v48);
  objc_msgSend_addObserver_selector_name_object_(v49, v50, (uint64_t)v27, (uint64_t)sel__systemShutdown_, @"IMSystemShuttingDownNotification", 0);
  return v27;
}

+ (void)_registerIMRemoteObject:(id)a3
{
  if (a3)
  {
    objc_msgSend_lock((void *)qword_1EB273BD8, a2, (uint64_t)a3, v3);
    objc_msgSend_addObject_((void *)qword_1EB273BC8, v5, (uint64_t)a3, v6);
    v10 = (void *)qword_1EB273BD8;
    objc_msgSend_unlock(v10, v7, v8, v9);
  }
}

- (void)setPid:(int)a3
{
  os_unfair_recursive_lock_lock_with_options();
  *((_DWORD *)self->_internal + 14) = a3;
  os_unfair_recursive_lock_unlock();
}

- (IMRemoteObject)initWithConnection:(id)a3 protocol:(id)a4 alreadyConfigured:(BOOL)a5 forceSecureCoding:(BOOL)a6
{
  return (IMRemoteObject *)MEMORY[0x1F4181798](self, sel__initWithConnection_portName_protocol_alreadyConfigured_forceSecureCoding_, a3, 0);
}

- (id)_queue
{
  return (id)*((void *)self->_internal + 2);
}

+ (id)_remoteObjects
{
  objc_msgSend_lock((void *)qword_1EB273BD8, a2, v2, v3);
  id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
  v7 = objc_msgSend_initWithArray_(v4, v5, qword_1EB273BC8, v6);
  objc_msgSend_unlock((void *)qword_1EB273BD8, v8, v9, v10);
  return v7;
}

+ (void)_unregisterIMRemoteObject:(id)a3
{
  if (a3)
  {
    objc_msgSend_lock((void *)qword_1EB273BD8, a2, (uint64_t)a3, v3);
    objc_msgSend_removeObjectIdenticalTo_((void *)qword_1EB273BC8, v5, (uint64_t)a3, v6);
    uint64_t v10 = (void *)qword_1EB273BD8;
    objc_msgSend_unlock(v10, v7, v8, v9);
  }
}

- (IMRemoteObject)initWithConnection:(id)a3 protocol:(id)a4
{
  return (IMRemoteObject *)MEMORY[0x1F4181798](self, sel__initWithConnection_portName_protocol_alreadyConfigured_forceSecureCoding_, a3, 0);
}

- (IMRemoteObject)initWithPortName:(id)a3 protocol:(id)a4
{
  return (IMRemoteObject *)MEMORY[0x1F4181798](self, sel__initWithConnection_portName_protocol_alreadyConfigured_forceSecureCoding_, 0, a3);
}

- (IMRemoteObject)initWithConnection:(id)a3 protocol:(id)a4 alreadyConfigured:(BOOL)a5
{
  return (IMRemoteObject *)MEMORY[0x1F4181798](self, sel__initWithConnection_portName_protocol_alreadyConfigured_forceSecureCoding_, a3, 0);
}

- (void)_cleanupMachBitsCanPost:(BOOL)a3 locked:(BOOL)a4
{
  BOOL v5 = a3;
  if (!a4) {
    os_unfair_recursive_lock_lock_with_options();
  }
  v7 = (void *)*((void *)self->_internal + 1);
  if (!v7) {
    goto LABEL_11;
  }
  xpc_release(v7);
  *((void *)self->_internal + 1) = 0;
  if (!v5)
  {
    if (a4) {
      goto LABEL_6;
    }
LABEL_14:
    os_unfair_recursive_lock_unlock();
    if (!v5) {
      return;
    }
    goto LABEL_7;
  }
  internal = self->_internal;
  if (!internal[61])
  {
    BOOL v5 = 1;
    internal[61] = 1;
    if (!a4) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_11:
    BOOL v5 = 0;
    if (!a4) {
      goto LABEL_14;
    }
  }
LABEL_6:
  if (!v5) {
    return;
  }
LABEL_7:
  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, a4);
  objc_msgSend___mainThreadPostNotificationName_object_(v8, v9, @"IMRemoteObjectDidDisconnect", (uint64_t)self);
}

- (void)dealloc
{
  objc_msgSend__unregisterIMRemoteObject_(IMRemoteObject, a2, (uint64_t)self, v2);
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
  if (dword_1EB273738 > 0)
  {
LABEL_3:
    v7 = (objc_class *)objc_opt_class();
    char v8 = NSStringFromClass(v7);
    _IMLog(@"* Dealloc %@ with name: %@", v9, v10, v11, v12, v13, v14, v15, v8);
  }
LABEL_4:
  uint64_t v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v4, v5, v6);
  objc_msgSend_removeObserver_name_object_(v16, v17, (uint64_t)self, 0, 0);
  id internal = self->_internal;
  if (internal)
  {
    os_unfair_recursive_lock_lock_with_options();
    objc_msgSend__cleanupMachBitsCanPost_locked_(self, v19, 0, 1);
    uint64_t v20 = self->_internal;
    v21 = (const void *)v20[3];
    if (v21)
    {
      CFRelease(v21);
      uint64_t v20 = self->_internal;
    }
    uint64_t v22 = (const void *)v20[4];
    if (v22)
    {
      CFRelease(v22);
      uint64_t v20 = self->_internal;
    }
    uint64_t v23 = (const void *)v20[5];
    if (v23)
    {
      CFRelease(v23);
      uint64_t v20 = self->_internal;
    }
    v24 = v20[2];
    if (v24)
    {
      dispatch_release(v24);
      *((void *)self->_internal + 2) = 0;
    }
    os_unfair_recursive_lock_unlock();
    id internal = self->_internal;
  }

  self->_id internal = 0;
  v25.receiver = self;
  v25.super_class = (Class)IMRemoteObject;
  [(IMRemoteObject *)&v25 dealloc];
}

- (void)_portDidBecomeInvalid
{
  uint64_t v10 = self;
  if ((dword_1EB273738 & 0x80000000) == 0)
  {
    if (!dword_1EB273738) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (qword_1EB273BF0 != -1)
  {
    dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    self = v10;
  }
  if (dword_1EB273738 > 0) {
LABEL_3:
  }
    _IMLog(@"* IMRemoteObject invalidation callback: %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((void *)self->_internal + 4));
LABEL_4:
  char v8 = v10;
  objc_msgSend__cleanupMachBitsCanPost_locked_(v10, v9, 1, 0);
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
    _IMLog(@"* Received shutdown notice for IMLocalObject: %@ (connection=%p)", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, *((void *)self->_internal + 4));
LABEL_4:
  objc_msgSend_invalidate(self, a2, (uint64_t)a3, v3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (sel_terminated != a3)
  {
    uint64_t v4 = (Protocol *)*((void *)self->_internal + 3);
    objc_method_description MethodDescription = protocol_getMethodDescription(v4, a3, 1, 1);
    types = MethodDescription.types;
    if (MethodDescription.name)
    {
      if (MethodDescription.types)
      {
LABEL_4:
        char v8 = (void *)MEMORY[0x1E4F1CA38];
        return (id)objc_msgSend_signatureWithObjCTypes_(v8, types, (uint64_t)types, v6);
      }
    }
    else
    {
      types = protocol_getMethodDescription(v4, a3, 0, 1).types;
      if (types) {
        goto LABEL_4;
      }
    }
    return 0;
  }
  return (id)((uint64_t (*)(__objc2_class *, char *, SEL))MEMORY[0x1F4181798])(IMLocalObject, sel_instanceMethodSignatureForSelector_, a3);
}

- (void)blockUntilSendQueueIsEmpty
{
  if (objc_msgSend__queue(self, a2, v2, v3))
  {
    char v8 = objc_msgSend__queue(self, v5, v6, v7);
    dispatch_sync(v8, &unk_1EE230A98);
  }
}

- (void)forwardInvocation:(id)a3
{
  if (!*((void *)self->_internal + 1))
  {
    if (dword_1EB273738 < 0)
    {
      if (qword_1EB273BF0 != -1) {
        dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
      }
      if (dword_1EB273738 <= 0) {
        goto LABEL_11;
      }
    }
    else if (!dword_1EB273738)
    {
LABEL_11:
      uint64_t v35 = objc_msgSend_callStackSymbols(MEMORY[0x1E4F29060], a2, (uint64_t)a3, v3);
      NSLog(&cfstr_Imremoteobject_5.isa, v35);
      return;
    }
    objc_super v25 = (const char *)objc_msgSend_selector(a3, a2, (uint64_t)a3, v3);
    char v26 = NSStringFromSelector(v25);
    _IMLog(@"Messaging invalid remote port: %@", v27, v28, v29, v30, v31, v32, v33, v26);
    goto LABEL_11;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1) {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    }
    if (dword_1EB273738 <= 0) {
      goto LABEL_5;
    }
  }
  else if (!dword_1EB273738)
  {
    goto LABEL_5;
  }
  uint64_t v9 = (const char *)objc_msgSend_selector(a3, v6, v7, v8);
  char v10 = NSStringFromSelector(v9);
  _IMLog(@"*** Forwarding invocation: %@", v11, v12, v13, v14, v15, v16, v17, v10);
LABEL_5:
  uint64_t v18 = IMCreateXPCObjectFromInvocation((uint64_t)a3);
  if (v18)
  {
    uint64_t v20 = (void *)v18;
    uint64_t v21 = objc_msgSend_forwardXPCObject_messageContext_locked_(self, v19, v18, 0, 1);
    xpc_release(v20);
    os_unfair_recursive_lock_unlock();
    if (v21 == 1)
    {
      uint64_t v34 = objc_msgSend_callStackSymbols(MEMORY[0x1E4F29060], v22, v23, v24);
      NSLog(&cfstr_Imremoteobject_6.isa, v34);
    }
  }
  else
  {
    os_unfair_recursive_lock_unlock();
  }
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)*((void *)self->_internal + 1);
}

- (NSString)processName
{
  return (NSString *)*((void *)self->_internal + 5);
}

- (NSString)portName
{
  return (NSString *)*((void *)self->_internal + 4);
}

- (void)setPortName:(id)a3
{
  id v3 = (id)*((void *)self->_internal + 4);
  if (v3 != a3)
  {

    *((void *)self->_internal + 4) = a3;
  }
}

- (void)invalidate
{
  uint64_t v16 = self;
  if ((dword_1EB273738 & 0x80000000) == 0)
  {
    if (!dword_1EB273738) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (qword_1EB273BF0 != -1)
  {
    dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
    self = v16;
  }
  if (dword_1EB273738 > 0) {
LABEL_3:
  }
    _IMLog(@"* Invalidating IMRemoteObject: %@ (connection=%p)", (uint64_t)a2, v2, v3, v4, v5, v6, v7, *((void *)self->_internal + 4));
LABEL_4:
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v8 = v16;
  uint64_t v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
  objc_msgSend_removeObserver_name_object_(v12, v13, (uint64_t)v16, @"IMSystemShuttingDownNotification", 0);
  uint64_t v14 = (_xpc_connection_s *)*((void *)v16->_internal + 1);
  if (v14)
  {
    xpc_connection_cancel(v14);
    xpc_release(*((xpc_object_t *)v16->_internal + 1));
    *((void *)v16->_internal + 1) = 0;
  }
  os_unfair_recursive_lock_unlock();
  objc_msgSend__cleanupMachBitsCanPost_locked_(v16, v15, 1, 0);
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_portName(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_pid(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_processName(self, v14, v15, v16);
  return (id)objc_msgSend_stringWithFormat_(v3, v18, @"[%@] Port Name: %@  Pid: %d   Process: %@", v19, v5, v9, v13, v17);
}

@end