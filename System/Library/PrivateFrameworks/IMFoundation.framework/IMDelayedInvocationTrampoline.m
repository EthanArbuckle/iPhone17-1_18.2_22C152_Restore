@interface IMDelayedInvocationTrampoline
- (IMDelayedInvocationTrampoline)initWithTarget:(id)a3 delay:(double)a4 modes:(id)a5;
- (void)forwardInvocation:(id)a3;
@end

@implementation IMDelayedInvocationTrampoline

- (IMDelayedInvocationTrampoline)initWithTarget:(id)a3 delay:(double)a4 modes:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMDelayedInvocationTrampoline;
  v10 = [(IMDelayedInvocationTrampoline *)&v15 init];
  v13 = v10;
  if (v10)
  {
    objc_msgSend_setTarget_(v10, v11, (uint64_t)v8, v12);
    objc_storeStrong((id *)&v13->_modes, a5);
    v13->_delay = a4;
  }

  return v13;
}

- (void)forwardInvocation:(id)a3
{
  id v9 = a3;
  objc_msgSend_retainArguments(v9, v4, v5, v6);
  double delay = self->_delay;
  if (self->_modes) {
    objc_msgSend_performSelector_withObject_afterDelay_inModes_(self, v7, (uint64_t)sel_performInvocation_, (uint64_t)v9, delay);
  }
  else {
    objc_msgSend_performSelector_withObject_afterDelay_(self, v7, (uint64_t)sel_performInvocation_, (uint64_t)v9, delay);
  }
}

- (void).cxx_destruct
{
}

@end