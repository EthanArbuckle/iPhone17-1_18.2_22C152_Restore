@interface MTREcosystemInformationClusterDeviceTypeStruct
- (MTREcosystemInformationClusterDeviceTypeStruct)init;
- (NSNumber)deviceType;
- (NSNumber)revision;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDeviceType:(id)a3;
- (void)setRevision:(id)a3;
@end

@implementation MTREcosystemInformationClusterDeviceTypeStruct

- (MTREcosystemInformationClusterDeviceTypeStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTREcosystemInformationClusterDeviceTypeStruct;
  v2 = [(MTREcosystemInformationClusterDeviceTypeStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    deviceType = v2->_deviceType;
    v2->_deviceType = (NSNumber *)&unk_26F9C8620;

    revision = v3->_revision;
    v3->_revision = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREcosystemInformationClusterDeviceTypeStruct);
  objc_super v7 = objc_msgSend_deviceType(self, v5, v6);
  objc_msgSend_setDeviceType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_revision(self, v9, v10);
  objc_msgSend_setRevision_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: deviceType:%@; revision:%@; >",
    v5,
    self->_deviceType,
  objc_super v7 = self->_revision);

  return v7;
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSNumber)revision
{
  return self->_revision;
}

- (void)setRevision:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);

  objc_storeStrong((id *)&self->_deviceType, 0);
}

@end