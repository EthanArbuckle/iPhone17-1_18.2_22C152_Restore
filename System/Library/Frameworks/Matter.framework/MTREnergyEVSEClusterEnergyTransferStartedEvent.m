@interface MTREnergyEVSEClusterEnergyTransferStartedEvent
- (MTREnergyEVSEClusterEnergyTransferStartedEvent)init;
- (NSNumber)maximumCurrent;
- (NSNumber)maximumDischargeCurrent;
- (NSNumber)sessionID;
- (NSNumber)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMaximumCurrent:(id)a3;
- (void)setMaximumDischargeCurrent:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setState:(id)a3;
@end

@implementation MTREnergyEVSEClusterEnergyTransferStartedEvent

- (MTREnergyEVSEClusterEnergyTransferStartedEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTREnergyEVSEClusterEnergyTransferStartedEvent;
  v2 = [(MTREnergyEVSEClusterEnergyTransferStartedEvent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSNumber *)&unk_26F9C8620;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_26F9C8620;

    maximumCurrent = v3->_maximumCurrent;
    v3->_maximumCurrent = (NSNumber *)&unk_26F9C8620;

    maximumDischargeCurrent = v3->_maximumDischargeCurrent;
    v3->_maximumDischargeCurrent = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterEnergyTransferStartedEvent);
  v7 = objc_msgSend_sessionID(self, v5, v6);
  objc_msgSend_setSessionID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_state(self, v9, v10);
  objc_msgSend_setState_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_maximumCurrent(self, v13, v14);
  objc_msgSend_setMaximumCurrent_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_maximumDischargeCurrent(self, v17, v18);
  objc_msgSend_setMaximumDischargeCurrent_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: sessionID:%@; state:%@; maximumCurrent:%@; maximumDischargeCurrent:%@; >",
    v5,
    self->_sessionID,
    self->_state,
    self->_maximumCurrent,
  v7 = self->_maximumDischargeCurrent);

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

- (NSNumber)maximumCurrent
{
  return self->_maximumCurrent;
}

- (void)setMaximumCurrent:(id)a3
{
}

- (NSNumber)maximumDischargeCurrent
{
  return self->_maximumDischargeCurrent;
}

- (void)setMaximumDischargeCurrent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumDischargeCurrent, 0);
  objc_storeStrong((id *)&self->_maximumCurrent, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end