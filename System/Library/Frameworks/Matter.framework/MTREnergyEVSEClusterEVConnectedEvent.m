@interface MTREnergyEVSEClusterEVConnectedEvent
- (MTREnergyEVSEClusterEVConnectedEvent)init;
- (NSNumber)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setSessionID:(id)a3;
@end

@implementation MTREnergyEVSEClusterEVConnectedEvent

- (MTREnergyEVSEClusterEVConnectedEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTREnergyEVSEClusterEVConnectedEvent;
  v2 = [(MTREnergyEVSEClusterEVConnectedEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterEVConnectedEvent);
  v7 = objc_msgSend_sessionID(self, v5, v6);
  objc_msgSend_setSessionID_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: sessionID:%@ >", v5, self->_sessionID);;

  return v7;
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end