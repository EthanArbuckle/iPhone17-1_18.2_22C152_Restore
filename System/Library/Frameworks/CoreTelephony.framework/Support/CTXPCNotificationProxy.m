@interface CTXPCNotificationProxy
- (BOOL)_resolvePlaceholders_sync:(id)a3;
- (CTXPCDataProviderInterface)dataProviderDelegate;
- (CTXPCNotificationProxy)initWithRegistry:(const void *)a3 queue:(queue)a4;
- (CTXPCNotificationSinkInterface)sinkDelegate;
- (Protocol)protocol;
- (id).cxx_construct;
- (id)_contextForSlotIDPlaceholder_sync:(id)a3;
- (id)_contextForUUIDPlaceholder_sync:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (queue)queue;
- (shared_ptr<const)registry;
- (void)anyClientRespondsToSelector:(SEL)a3 completion:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)setDataProviderDelegate:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setQueue:(queue)a3;
- (void)setRegistry:(shared_ptr<const Registry>)a3;
- (void)setSinkDelegate:(id)a3;
@end

@implementation CTXPCNotificationProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = (BOOL *)&byte_1015ECCE6;
  while (1)
  {
    objc_method_description MethodDescription = protocol_getMethodDescription(self->_protocol, a3, *v5, v5[1]);
    if (MethodDescription.name) {
      break;
    }
    v5 += 2;
    if (v5 == (BOOL *)&unk_1015ECCEE)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  v7 = +[NSMethodSignature signatureWithObjCTypes:MethodDescription.types];
LABEL_6:

  return v7;
}

- (CTXPCNotificationSinkInterface)sinkDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sinkDelegate);

  return (CTXPCNotificationSinkInterface *)WeakRetained;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 retainArguments];
  v5 = self;
  id v6 = v4;
  operator new();
}

- (BOOL)_resolvePlaceholders_sync:(id)a3
{
  id v4 = a3;
  v5 = [v4 methodSignature];
  id v6 = [v5 numberOfArguments];
  if ((unint64_t)v6 >= 3)
  {
    BOOL v7 = 0;
    uint64_t v9 = 2;
    while (1)
    {
      __p = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      sub_100058DB0(&__p, (char *)[v5 getArgumentTypeAtIndex:v9]);
      uint64_t v10 = HIBYTE(v17);
      if (v17 < 0) {
        uint64_t v10 = v16;
      }
      if (v10 != 1) {
        goto LABEL_18;
      }
      p_p = __p;
      if (v17 >= 0) {
        p_p = &__p;
      }
      if (*p_p != 64)
      {
LABEL_18:
        int v12 = 4;
        if ((v17 & 0x8000000000000000) == 0) {
          goto LABEL_20;
        }
LABEL_19:
        operator delete(__p);
        goto LABEL_20;
      }
      uint64_t v14 = 0;
      [v4 getArgument:&v14 atIndex:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = 0;
        id v13 = [(CTXPCNotificationProxy *)self _contextForSlotIDPlaceholder_sync:v14];
        if (!v13) {
          goto LABEL_23;
        }
        [v4 setArgument:&v13 atIndex:v9];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_17;
      }
      id v13 = 0;
      id v13 = [(CTXPCNotificationProxy *)self _contextForUUIDPlaceholder_sync:v14];
      if (v13)
      {
        [v4 setArgument:&v13 atIndex:v9];

LABEL_17:
        int v12 = 0;
        goto LABEL_24;
      }
LABEL_23:
      int v12 = 1;
LABEL_24:
      if (v17 < 0) {
        goto LABEL_19;
      }
LABEL_20:
      if ((v12 | 4) == 4)
      {
        BOOL v7 = ++v9 >= (unint64_t)v6;
        if (v6 != (id)v9) {
          continue;
        }
      }
      goto LABEL_3;
    }
  }
  BOOL v7 = 1;
LABEL_3:

  return v7;
}

- (id)_contextForSlotIDPlaceholder_sync:(id)a3
{
  id v4 = a3;
  v5 = [(CTXPCNotificationProxy *)self dataProviderDelegate];
  id v6 = objc_msgSend(v5, "contextForSlot:", objc_msgSend(v4, "slot"));

  return v6;
}

- (CTXPCDataProviderInterface)dataProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);

  return (CTXPCDataProviderInterface *)WeakRetained;
}

- (CTXPCNotificationProxy)initWithRegistry:(const void *)a3 queue:(queue)a4
{
  p_registry = &self->_registry;
  v8 = *(Registry **)a3;
  uint64_t v7 = *((void *)a3 + 1);
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_registry.__cntrl_;
  p_registry->__ptr_ = v8;
  p_registry->__cntrl_ = (__shared_weak_count *)v7;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  uint64_t v10 = *(dispatch_object_s **)a4.fObj.fObj;
  *(void *)a4.fObj.fObj = 0;
  fObj = self->_queue.fObj.fObj;
  self->_queue.fObj.fObj = v10;
  if (fObj) {
    dispatch_release(fObj);
  }
  objc_storeStrong((id *)&self->_protocol, &OBJC_PROTOCOL___CoreTelephonyClientDelegateProxyInterface);
  return self;
}

- (id)_contextForUUIDPlaceholder_sync:(id)a3
{
  id v4 = a3;
  v5 = [(CTXPCNotificationProxy *)self dataProviderDelegate];
  id v6 = [v4 uuid];
  uint64_t v7 = [v5 contextForUUID:v6];

  return v7;
}

- (void)anyClientRespondsToSelector:(SEL)a3 completion:(id)a4
{
  id v6 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1012E52B4;
  v9[3] = &unk_101AAC3F0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  fObj = self->_queue.fObj.fObj;
  id v8 = v6;
  dispatch_async(fObj, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)setSinkDelegate:(id)a3
{
}

- (void)setDataProviderDelegate:(id)a3
{
}

- (shared_ptr<const)registry
{
  cntrl = self->_registry.__cntrl_;
  *v2 = self->_registry.__ptr_;
  v2[1] = (Registry *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Registry *)self;
  return result;
}

- (void)setRegistry:(shared_ptr<const Registry>)a3
{
  p_registry = &self->_registry;
  v5 = *(Registry **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_registry.__cntrl_;
  p_registry->__ptr_ = v5;
  p_registry->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
}

- (queue)queue
{
  fObj = self->_queue.fObj.fObj;
  *v2 = fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  return (queue)fObj;
}

- (void)setQueue:(queue)a3
{
  uint64_t v4 = *(dispatch_object_s **)a3.fObj.fObj;
  if (*(void *)a3.fObj.fObj) {
    dispatch_retain(*(dispatch_object_t *)a3.fObj.fObj);
  }
  fObj = self->_queue.fObj.fObj;
  self->_queue.fObj.fObj = v4;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->_registry.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_protocol, 0);
  fObj = self->_queue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  objc_destroyWeak((id *)&self->_dataProviderDelegate);

  objc_destroyWeak((id *)&self->_sinkDelegate);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end