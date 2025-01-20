@interface MTRWiFiNetworkDiagnosticsClusterDisconnectionEvent
- (MTRWiFiNetworkDiagnosticsClusterDisconnectionEvent)init;
- (NSNumber)reasonCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setReasonCode:(NSNumber *)reasonCode;
@end

@implementation MTRWiFiNetworkDiagnosticsClusterDisconnectionEvent

- (MTRWiFiNetworkDiagnosticsClusterDisconnectionEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRWiFiNetworkDiagnosticsClusterDisconnectionEvent;
  v2 = [(MTRWiFiNetworkDiagnosticsClusterDisconnectionEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    reasonCode = v2->_reasonCode;
    v2->_reasonCode = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWiFiNetworkDiagnosticsClusterDisconnectionEvent);
  v7 = objc_msgSend_reasonCode(self, v5, v6);
  objc_msgSend_setReasonCode_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: reasonCode:%@ >", v5, self->_reasonCode);;

  return v7;
}

- (NSNumber)reasonCode
{
  return self->_reasonCode;
}

- (void)setReasonCode:(NSNumber *)reasonCode
{
}

- (void).cxx_destruct
{
}

@end