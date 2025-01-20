@interface MTREnergyEVSEClusterEVNotDetectedEvent
- (MTREnergyEVSEClusterEVNotDetectedEvent)init;
- (NSNumber)sessionDuration;
- (NSNumber)sessionEnergyCharged;
- (NSNumber)sessionEnergyDischarged;
- (NSNumber)sessionID;
- (NSNumber)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setSessionDuration:(id)a3;
- (void)setSessionEnergyCharged:(id)a3;
- (void)setSessionEnergyDischarged:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setState:(id)a3;
@end

@implementation MTREnergyEVSEClusterEVNotDetectedEvent

- (MTREnergyEVSEClusterEVNotDetectedEvent)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTREnergyEVSEClusterEVNotDetectedEvent;
  v2 = [(MTREnergyEVSEClusterEVNotDetectedEvent *)&v10 init];
  v3 = v2;
  if (v2)
  {
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSNumber *)&unk_26F9C8620;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_26F9C8620;

    sessionDuration = v3->_sessionDuration;
    v3->_sessionDuration = (NSNumber *)&unk_26F9C8620;

    sessionEnergyCharged = v3->_sessionEnergyCharged;
    v3->_sessionEnergyCharged = (NSNumber *)&unk_26F9C8620;

    sessionEnergyDischarged = v3->_sessionEnergyDischarged;
    v3->_sessionEnergyDischarged = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterEVNotDetectedEvent);
  v7 = objc_msgSend_sessionID(self, v5, v6);
  objc_msgSend_setSessionID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_state(self, v9, v10);
  objc_msgSend_setState_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_sessionDuration(self, v13, v14);
  objc_msgSend_setSessionDuration_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_sessionEnergyCharged(self, v17, v18);
  objc_msgSend_setSessionEnergyCharged_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_sessionEnergyDischarged(self, v21, v22);
  objc_msgSend_setSessionEnergyDischarged_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: sessionID:%@; state:%@; sessionDuration:%@; sessionEnergyCharged:%@; sessionEnergyDischarged:%@; >",
    v5,
    self->_sessionID,
    self->_state,
    self->_sessionDuration,
    self->_sessionEnergyCharged,
  v7 = self->_sessionEnergyDischarged);

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

- (NSNumber)sessionDuration
{
  return self->_sessionDuration;
}

- (void)setSessionDuration:(id)a3
{
}

- (NSNumber)sessionEnergyCharged
{
  return self->_sessionEnergyCharged;
}

- (void)setSessionEnergyCharged:(id)a3
{
}

- (NSNumber)sessionEnergyDischarged
{
  return self->_sessionEnergyDischarged;
}

- (void)setSessionEnergyDischarged:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEnergyDischarged, 0);
  objc_storeStrong((id *)&self->_sessionEnergyCharged, 0);
  objc_storeStrong((id *)&self->_sessionDuration, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end