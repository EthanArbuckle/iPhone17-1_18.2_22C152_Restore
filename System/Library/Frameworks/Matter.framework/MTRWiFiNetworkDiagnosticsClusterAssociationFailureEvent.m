@interface MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent
- (MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent)init;
- (NSNumber)associationFailureCause;
- (NSNumber)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAssociationFailureCause:(id)a3;
- (void)setStatus:(NSNumber *)status;
@end

@implementation MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent

- (MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent;
  v2 = [(MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    associationFailureCause = v2->_associationFailureCause;
    v2->_associationFailureCause = (NSNumber *)&unk_26F9C8620;

    status = v3->_status;
    v3->_status = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent);
  objc_super v7 = objc_msgSend_associationFailureCause(self, v5, v6);
  objc_msgSend_setAssociationFailureCause_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_status(self, v9, v10);
  objc_msgSend_setStatus_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: associationFailureCause:%@; status:%@; >",
    v5,
    self->_associationFailureCause,
  objc_super v7 = self->_status);

  return v7;
}

- (NSNumber)associationFailureCause
{
  return self->_associationFailureCause;
}

- (void)setAssociationFailureCause:(id)a3
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_associationFailureCause, 0);
}

@end