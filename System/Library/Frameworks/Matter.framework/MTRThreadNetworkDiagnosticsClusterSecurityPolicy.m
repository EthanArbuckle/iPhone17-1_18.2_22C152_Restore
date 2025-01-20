@interface MTRThreadNetworkDiagnosticsClusterSecurityPolicy
- (MTRThreadNetworkDiagnosticsClusterSecurityPolicy)init;
- (NSNumber)flags;
- (NSNumber)rotationTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFlags:(NSNumber *)flags;
- (void)setRotationTime:(NSNumber *)rotationTime;
@end

@implementation MTRThreadNetworkDiagnosticsClusterSecurityPolicy

- (MTRThreadNetworkDiagnosticsClusterSecurityPolicy)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRThreadNetworkDiagnosticsClusterSecurityPolicy;
  v2 = [(MTRThreadNetworkDiagnosticsClusterSecurityPolicy *)&v7 init];
  v3 = v2;
  if (v2)
  {
    rotationTime = v2->_rotationTime;
    v2->_rotationTime = (NSNumber *)&unk_26F9C8620;

    flags = v3->_flags;
    v3->_flags = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterSecurityPolicy);
  objc_super v7 = objc_msgSend_rotationTime(self, v5, v6);
  objc_msgSend_setRotationTime_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_flags(self, v9, v10);
  objc_msgSend_setFlags_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: rotationTime:%@; flags:%@; >",
    v5,
    self->_rotationTime,
  objc_super v7 = self->_flags);

  return v7;
}

- (NSNumber)rotationTime
{
  return self->_rotationTime;
}

- (void)setRotationTime:(NSNumber *)rotationTime
{
}

- (NSNumber)flags
{
  return self->_flags;
}

- (void)setFlags:(NSNumber *)flags
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);

  objc_storeStrong((id *)&self->_rotationTime, 0);
}

@end