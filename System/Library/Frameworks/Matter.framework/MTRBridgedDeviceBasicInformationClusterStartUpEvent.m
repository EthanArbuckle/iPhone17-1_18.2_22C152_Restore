@interface MTRBridgedDeviceBasicInformationClusterStartUpEvent
- (MTRBridgedDeviceBasicInformationClusterStartUpEvent)init;
- (NSNumber)softwareVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setSoftwareVersion:(NSNumber *)softwareVersion;
@end

@implementation MTRBridgedDeviceBasicInformationClusterStartUpEvent

- (MTRBridgedDeviceBasicInformationClusterStartUpEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRBridgedDeviceBasicInformationClusterStartUpEvent;
  v2 = [(MTRBridgedDeviceBasicInformationClusterStartUpEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    softwareVersion = v2->_softwareVersion;
    v2->_softwareVersion = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRBridgedDeviceBasicInformationClusterStartUpEvent);
  v7 = objc_msgSend_softwareVersion(self, v5, v6);
  objc_msgSend_setSoftwareVersion_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: softwareVersion:%@ >", v5, self->_softwareVersion);;

  return v7;
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
}

- (void).cxx_destruct
{
}

@end