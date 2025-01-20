@interface MTRDeviceEnergyManagementClusterResumedEvent
- (MTRDeviceEnergyManagementClusterResumedEvent)init;
- (NSNumber)cause;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCause:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterResumedEvent

- (MTRDeviceEnergyManagementClusterResumedEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRDeviceEnergyManagementClusterResumedEvent;
  v2 = [(MTRDeviceEnergyManagementClusterResumedEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    cause = v2->_cause;
    v2->_cause = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterResumedEvent);
  v7 = objc_msgSend_cause(self, v5, v6);
  objc_msgSend_setCause_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: cause:%@ >", v5, self->_cause);;

  return v7;
}

- (NSNumber)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
}

- (void).cxx_destruct
{
}

@end