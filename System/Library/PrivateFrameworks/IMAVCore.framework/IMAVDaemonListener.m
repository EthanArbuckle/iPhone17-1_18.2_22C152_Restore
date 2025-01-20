@interface IMAVDaemonListener
- (BOOL)isSetupComplete;
- (IMAVDaemonListener)init;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_noteDisconnected;
- (void)addHandler:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)removeHandler:(id)a3;
- (void)setupComplete:(BOOL)a3 info:(id)a4;
@end

@implementation IMAVDaemonListener

- (IMAVDaemonListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMAVDaemonListener;
  v2 = [(IMAVDaemonListener *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_setupComplete = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_noteDisconnected
{
  *(_WORD *)&self->_setupComplete = 0;
}

- (void)addHandler:(id)a3
{
  id v13 = a3;
  if ((objc_msgSend_containsObjectIdenticalTo_(self->_handlers, v4, (uint64_t)v13, v5, v6) & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v12 = self->_handlers;
      self->_handlers = v11;

      handlers = self->_handlers;
    }
    objc_msgSend_addObject_(handlers, v7, (uint64_t)v13, v8, v9);
  }
}

- (void)removeHandler:(id)a3
{
  objc_msgSend_removeObjectIdenticalTo_(self->_handlers, a2, (uint64_t)a3, v3, v4);
  if (!objc_msgSend_count(self->_handlers, v6, v7, v8, v9))
  {
    handlers = self->_handlers;
    self->_handlers = 0;
  }
}

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  self->_setupComplete = 1;
  objc_msgSend_sharedInstance(IMAVDaemonController, a2, a3, (uint64_t)a4, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__noteSetupComplete(v9, v5, v6, v7, v8);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  types = protocol_getMethodDescription((Protocol *)&unk_26D8725D0, a3, 1, 1).types;
  uint64_t v6 = MEMORY[0x263EFF970];
  return (id)MEMORY[0x270F9A6D0](v6, sel_signatureWithObjCTypes_, types, v4, v5);
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x22A628890]();
  v10 = objc_msgSend__copyForEnumerating(self->_handlers, v6, v7, v8, v9);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v10;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend_selector(v4, v13, v14, v15, v16);
        if (objc_opt_respondsToSelector())
        {
          v21 = (void *)MEMORY[0x22A628890]();
          objc_msgSend_invokeWithTarget_(v4, v22, v20, v23, v24);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v17);
  }
}

- (BOOL)isSetupComplete
{
  return self->_setupComplete;
}

- (void).cxx_destruct
{
}

@end