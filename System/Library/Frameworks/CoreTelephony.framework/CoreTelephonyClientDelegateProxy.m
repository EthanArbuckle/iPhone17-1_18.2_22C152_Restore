@interface CoreTelephonyClientDelegateProxy
- (CoreTelephonyClientDelegateProxy)initWithQueue:(queue)a3;
- (id).cxx_construct;
- (id)delegate;
- (id)forwardInvocation:(dispatch_queue_s *);
- (id)forwardInvocation:(id *)a1;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CoreTelephonyClientDelegateProxy

- (CoreTelephonyClientDelegateProxy)initWithQueue:(queue)a3
{
  v4 = *(dispatch_object_s **)a3.fObj.fObj;
  if (*(void *)a3.fObj.fObj) {
    dispatch_retain(*(dispatch_object_t *)a3.fObj.fObj);
  }
  fObj = self->_userQueue.fObj.fObj;
  self->_userQueue.fObj.fObj = v4;
  if (fObj) {
    dispatch_release(fObj);
  }
  return self;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v6 = CTLogClient();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = NSStringFromSelector((SEL)[v4 selector]);
      -[CoreTelephonyClientDelegateProxy forwardInvocation:](v7, (uint64_t)WeakRetained, buf, v6);
    }
    [v4 retainArguments];
    v8 = self;
    id v9 = v4;
    operator new();
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = (BOOL *)&-[CoreTelephonyClientDelegateProxy methodSignatureForSelector:]::opts;
  while (1)
  {
    objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1ED021AE0, a3, *v4, v4[1]);
    if (MethodDescription.name) {
      break;
    }
    v4 += 2;
    if (v4 == (BOOL *)&qword_1845DC890)
    {
      v6 = 0;
      goto LABEL_6;
    }
  }
  v6 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodDescription.types];
LABEL_6:

  return v6;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  fObj = self->_userQueue.fObj.fObj;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (id)forwardInvocation:(id *)a1
{
  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    MEMORY[0x18531F680](v2, 0xC0C402DE288CCLL);
  }
  return a1;
}

- (id)forwardInvocation:(dispatch_queue_s *)
{
  v5 = a1;
  id v2 = a1[1];
  id WeakRetained = objc_loadWeakRetained((id *)*a1 + 2);
  [v2 setTarget:WeakRetained];

  [a1[1] invoke];
  return std::unique_ptr<-[CoreTelephonyClientDelegateProxy forwardInvocation:]::$_0>::~unique_ptr[abi:nn180100](&v5);
}

- (void)forwardInvocation:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_18444A000, log, OS_LOG_TYPE_DEBUG, "Invoking \"%@\" for delegate %@", buf, 0x16u);
}

@end