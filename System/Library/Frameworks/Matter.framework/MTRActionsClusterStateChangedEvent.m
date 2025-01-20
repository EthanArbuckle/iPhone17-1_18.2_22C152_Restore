@interface MTRActionsClusterStateChangedEvent
- (MTRActionsClusterStateChangedEvent)init;
- (NSNumber)actionID;
- (NSNumber)getNewState;
- (NSNumber)invokeID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActionID:(NSNumber *)actionID;
- (void)setInvokeID:(NSNumber *)invokeID;
- (void)setNewState:(NSNumber *)newState;
@end

@implementation MTRActionsClusterStateChangedEvent

- (MTRActionsClusterStateChangedEvent)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRActionsClusterStateChangedEvent;
  v2 = [(MTRActionsClusterStateChangedEvent *)&v8 init];
  v3 = v2;
  if (v2)
  {
    actionID = v2->_actionID;
    v2->_actionID = (NSNumber *)&unk_26F9C8620;

    invokeID = v3->_invokeID;
    v3->_invokeID = (NSNumber *)&unk_26F9C8620;

    newState = v3->_newState;
    v3->_newState = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRActionsClusterStateChangedEvent);
  v7 = objc_msgSend_actionID(self, v5, v6);
  objc_msgSend_setActionID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_invokeID(self, v9, v10);
  objc_msgSend_setInvokeID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_getNewState(self, v13, v14);
  objc_msgSend_setNewState_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: actionID:%@; invokeID:%@; newState:%@; >",
    v5,
    self->_actionID,
    self->_invokeID,
  v7 = self->_newState);

  return v7;
}

- (NSNumber)actionID
{
  return self->_actionID;
}

- (void)setActionID:(NSNumber *)actionID
{
}

- (NSNumber)invokeID
{
  return self->_invokeID;
}

- (void)setInvokeID:(NSNumber *)invokeID
{
}

- (NSNumber)getNewState
{
  return self->_newState;
}

- (void)setNewState:(NSNumber *)newState
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newState, 0);
  objc_storeStrong((id *)&self->_invokeID, 0);

  objc_storeStrong((id *)&self->_actionID, 0);
}

@end