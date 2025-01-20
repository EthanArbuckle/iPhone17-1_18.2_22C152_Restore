@interface MTREnergyEVSEClusterFaultEvent
- (MTREnergyEVSEClusterFaultEvent)init;
- (NSNumber)faultStateCurrentState;
- (NSNumber)faultStatePreviousState;
- (NSNumber)sessionID;
- (NSNumber)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFaultStateCurrentState:(id)a3;
- (void)setFaultStatePreviousState:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setState:(id)a3;
@end

@implementation MTREnergyEVSEClusterFaultEvent

- (MTREnergyEVSEClusterFaultEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTREnergyEVSEClusterFaultEvent;
  v2 = [(MTREnergyEVSEClusterFaultEvent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    sessionID = v2->_sessionID;
    v2->_sessionID = 0;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_26F9C8620;

    faultStatePreviousState = v3->_faultStatePreviousState;
    v3->_faultStatePreviousState = (NSNumber *)&unk_26F9C8620;

    faultStateCurrentState = v3->_faultStateCurrentState;
    v3->_faultStateCurrentState = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterFaultEvent);
  v7 = objc_msgSend_sessionID(self, v5, v6);
  objc_msgSend_setSessionID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_state(self, v9, v10);
  objc_msgSend_setState_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_faultStatePreviousState(self, v13, v14);
  objc_msgSend_setFaultStatePreviousState_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_faultStateCurrentState(self, v17, v18);
  objc_msgSend_setFaultStateCurrentState_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: sessionID:%@; state:%@; faultStatePreviousState:%@; faultStateCurrentState:%@; >",
    v5,
    self->_sessionID,
    self->_state,
    self->_faultStatePreviousState,
  v7 = self->_faultStateCurrentState);

  return v7;
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSNumber)faultStatePreviousState
{
  return self->_faultStatePreviousState;
}

- (void)setFaultStatePreviousState:(id)a3
{
}

- (NSNumber)faultStateCurrentState
{
  return self->_faultStateCurrentState;
}

- (void)setFaultStateCurrentState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faultStateCurrentState, 0);
  objc_storeStrong((id *)&self->_faultStatePreviousState, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end