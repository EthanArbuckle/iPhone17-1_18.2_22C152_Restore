@interface CMContinuityCaptureState
- (CMContinuityCaptureState)initWithAttributes:(id)a3 entryAction:(id)a4 exitAction:(id)a5;
- (NSMutableSet)pendingEvents;
- (NSString)name;
- (id)description;
- (id)entryAction;
- (id)exitAction;
- (void)setEntryAction:(id)a3;
- (void)setExitAction:(id)a3;
- (void)setName:(id)a3;
- (void)setPendingEvents:(id)a3;
@end

@implementation CMContinuityCaptureState

- (CMContinuityCaptureState)initWithAttributes:(id)a3 entryAction:(id)a4 exitAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CMContinuityCaptureState;
  v11 = [(CMContinuityCaptureState *)&v16 init];
  v12 = v11;
  if (v11)
  {
    [(CMContinuityCaptureState *)v11 setName:v8];
    [(CMContinuityCaptureState *)v12 setEntryAction:v9];
    [(CMContinuityCaptureState *)v12 setExitAction:v10];
    id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CMContinuityCaptureState *)v12 setPendingEvents:v13];

    v14 = [(CMContinuityCaptureState *)v12 pendingEvents];

    if (v14) {
      v14 = v12;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_name];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableSet)pendingEvents
{
  return self->_pendingEvents;
}

- (void)setPendingEvents:(id)a3
{
}

- (id)entryAction
{
  return self->_entryAction;
}

- (void)setEntryAction:(id)a3
{
}

- (id)exitAction
{
  return self->_exitAction;
}

- (void)setExitAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_exitAction, 0);
  objc_storeStrong(&self->_entryAction, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end