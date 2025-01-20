@interface MTROTASoftwareUpdateRequestorClusterStateTransitionEvent
- (MTROTASoftwareUpdateRequestorClusterStateTransitionEvent)init;
- (NSNumber)getNewState;
- (NSNumber)previousState;
- (NSNumber)reason;
- (NSNumber)targetSoftwareVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNewState:(NSNumber *)newState;
- (void)setPreviousState:(NSNumber *)previousState;
- (void)setReason:(NSNumber *)reason;
- (void)setTargetSoftwareVersion:(NSNumber *)targetSoftwareVersion;
@end

@implementation MTROTASoftwareUpdateRequestorClusterStateTransitionEvent

- (MTROTASoftwareUpdateRequestorClusterStateTransitionEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTROTASoftwareUpdateRequestorClusterStateTransitionEvent;
  v2 = [(MTROTASoftwareUpdateRequestorClusterStateTransitionEvent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    previousState = v2->_previousState;
    v2->_previousState = (NSNumber *)&unk_26F9C8620;

    newState = v3->_newState;
    v3->_newState = (NSNumber *)&unk_26F9C8620;

    reason = v3->_reason;
    v3->_reason = (NSNumber *)&unk_26F9C8620;

    targetSoftwareVersion = v3->_targetSoftwareVersion;
    v3->_targetSoftwareVersion = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROTASoftwareUpdateRequestorClusterStateTransitionEvent);
  v7 = objc_msgSend_previousState(self, v5, v6);
  objc_msgSend_setPreviousState_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_getNewState(self, v9, v10);
  objc_msgSend_setNewState_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_reason(self, v13, v14);
  objc_msgSend_setReason_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_targetSoftwareVersion(self, v17, v18);
  objc_msgSend_setTargetSoftwareVersion_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: previousState:%@; newState:%@; reason:%@; targetSoftwareVersion:%@; >",
    v5,
    self->_previousState,
    self->_newState,
    self->_reason,
  v7 = self->_targetSoftwareVersion);

  return v7;
}

- (NSNumber)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(NSNumber *)previousState
{
}

- (NSNumber)getNewState
{
  return self->_newState;
}

- (void)setNewState:(NSNumber *)newState
{
}

- (NSNumber)reason
{
  return self->_reason;
}

- (void)setReason:(NSNumber *)reason
{
}

- (NSNumber)targetSoftwareVersion
{
  return self->_targetSoftwareVersion;
}

- (void)setTargetSoftwareVersion:(NSNumber *)targetSoftwareVersion
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_newState, 0);

  objc_storeStrong((id *)&self->_previousState, 0);
}

@end