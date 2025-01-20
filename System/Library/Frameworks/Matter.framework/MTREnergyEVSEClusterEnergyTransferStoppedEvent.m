@interface MTREnergyEVSEClusterEnergyTransferStoppedEvent
- (MTREnergyEVSEClusterEnergyTransferStoppedEvent)init;
- (NSNumber)energyDischarged;
- (NSNumber)energyTransferred;
- (NSNumber)reason;
- (NSNumber)sessionID;
- (NSNumber)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEnergyDischarged:(id)a3;
- (void)setEnergyTransferred:(id)a3;
- (void)setReason:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setState:(id)a3;
@end

@implementation MTREnergyEVSEClusterEnergyTransferStoppedEvent

- (MTREnergyEVSEClusterEnergyTransferStoppedEvent)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTREnergyEVSEClusterEnergyTransferStoppedEvent;
  v2 = [(MTREnergyEVSEClusterEnergyTransferStoppedEvent *)&v10 init];
  v3 = v2;
  if (v2)
  {
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSNumber *)&unk_26F9C8620;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_26F9C8620;

    reason = v3->_reason;
    v3->_reason = (NSNumber *)&unk_26F9C8620;

    energyTransferred = v3->_energyTransferred;
    v3->_energyTransferred = (NSNumber *)&unk_26F9C8620;

    energyDischarged = v3->_energyDischarged;
    v3->_energyDischarged = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterEnergyTransferStoppedEvent);
  v7 = objc_msgSend_sessionID(self, v5, v6);
  objc_msgSend_setSessionID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_state(self, v9, v10);
  objc_msgSend_setState_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_reason(self, v13, v14);
  objc_msgSend_setReason_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_energyTransferred(self, v17, v18);
  objc_msgSend_setEnergyTransferred_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_energyDischarged(self, v21, v22);
  objc_msgSend_setEnergyDischarged_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: sessionID:%@; state:%@; reason:%@; energyTransferred:%@; energyDischarged:%@; >",
    v5,
    self->_sessionID,
    self->_state,
    self->_reason,
    self->_energyTransferred,
  v7 = self->_energyDischarged);

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

- (NSNumber)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSNumber)energyTransferred
{
  return self->_energyTransferred;
}

- (void)setEnergyTransferred:(id)a3
{
}

- (NSNumber)energyDischarged
{
  return self->_energyDischarged;
}

- (void)setEnergyDischarged:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyDischarged, 0);
  objc_storeStrong((id *)&self->_energyTransferred, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end