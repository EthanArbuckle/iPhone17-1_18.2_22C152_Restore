@interface MTRThreadNetworkDiagnosticsClusterConnectionStatusEvent
- (MTRThreadNetworkDiagnosticsClusterConnectionStatusEvent)init;
- (NSNumber)connectionStatus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setConnectionStatus:(NSNumber *)connectionStatus;
@end

@implementation MTRThreadNetworkDiagnosticsClusterConnectionStatusEvent

- (MTRThreadNetworkDiagnosticsClusterConnectionStatusEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRThreadNetworkDiagnosticsClusterConnectionStatusEvent;
  v2 = [(MTRThreadNetworkDiagnosticsClusterConnectionStatusEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    connectionStatus = v2->_connectionStatus;
    v2->_connectionStatus = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterConnectionStatusEvent);
  v7 = objc_msgSend_connectionStatus(self, v5, v6);
  objc_msgSend_setConnectionStatus_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: connectionStatus:%@ >", v5, self->_connectionStatus);;

  return v7;
}

- (NSNumber)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(NSNumber *)connectionStatus
{
}

- (void).cxx_destruct
{
}

@end