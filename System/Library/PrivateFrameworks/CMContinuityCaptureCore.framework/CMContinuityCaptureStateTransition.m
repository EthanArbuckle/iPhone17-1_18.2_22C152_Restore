@interface CMContinuityCaptureStateTransition
- (CMContinuityCaptureState)dstState;
- (CMContinuityCaptureState)srcState;
- (CMContinuityCaptureStateMachineEvent)event;
- (CMContinuityCaptureStateTransition)initWithAttributes:(id)a3 dstState:(id)a4 event:(id)a5 guard:(id)a6 action:(id)a7;
- (id)action;
- (id)guard;
- (id)transactionFromStateOnEvent:(id)a3 event:(id)a4;
- (void)setAction:(id)a3;
- (void)setDstState:(id)a3;
- (void)setEvent:(id)a3;
- (void)setGuard:(id)a3;
- (void)setSrcState:(id)a3;
@end

@implementation CMContinuityCaptureStateTransition

- (CMContinuityCaptureStateTransition)initWithAttributes:(id)a3 dstState:(id)a4 event:(id)a5 guard:(id)a6 action:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CMContinuityCaptureStateTransition;
  v17 = [(CMContinuityCaptureStateTransition *)&v21 init];
  v18 = v17;
  if (v17)
  {
    [(CMContinuityCaptureStateTransition *)v17 setSrcState:v12];
    [(CMContinuityCaptureStateTransition *)v18 setDstState:v13];
    [(CMContinuityCaptureStateTransition *)v18 setEvent:v14];
    [(CMContinuityCaptureStateTransition *)v18 setGuard:v15];
    [(CMContinuityCaptureStateTransition *)v18 setAction:v16];
    v19 = v18;
  }

  return v18;
}

- (id)transactionFromStateOnEvent:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 name];
  v9 = [(CMContinuityCaptureStateTransition *)self event];
  v10 = [v9 name];
  if ([v8 isEqualToString:v10])
  {
    id v11 = [(CMContinuityCaptureStateTransition *)self srcState];

    if (v11 == v6)
    {
      id v12 = [(CMContinuityCaptureStateTransition *)self guard];

      if (!v12) {
        goto LABEL_5;
      }
      id v13 = [(CMContinuityCaptureStateTransition *)self guard];
      id v14 = [(CMContinuityCaptureStateTransition *)self srcState];
      id v15 = [(CMContinuityCaptureStateTransition *)self dstState];
      int v16 = ((uint64_t (**)(void, void *, void *, id))v13)[2](v13, v14, v15, v7);

      if (v16)
      {
LABEL_5:
        v17 = [(CMContinuityCaptureStateTransition *)self dstState];
        goto LABEL_8;
      }
    }
  }
  else
  {
  }
  v17 = 0;
LABEL_8:

  return v17;
}

- (CMContinuityCaptureState)srcState
{
  return self->_srcState;
}

- (void)setSrcState:(id)a3
{
}

- (CMContinuityCaptureState)dstState
{
  return self->_dstState;
}

- (void)setDstState:(id)a3
{
}

- (CMContinuityCaptureStateMachineEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (id)guard
{
  return self->_guard;
}

- (void)setGuard:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong(&self->_guard, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_dstState, 0);
  objc_storeStrong((id *)&self->_srcState, 0);
}

@end