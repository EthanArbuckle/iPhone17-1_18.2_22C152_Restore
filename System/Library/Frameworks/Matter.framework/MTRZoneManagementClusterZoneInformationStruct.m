@interface MTRZoneManagementClusterZoneInformationStruct
- (MTRZoneManagementClusterZoneInformationStruct)init;
- (NSNumber)zoneID;
- (NSNumber)zoneSource;
- (NSNumber)zoneType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setZoneID:(id)a3;
- (void)setZoneSource:(id)a3;
- (void)setZoneType:(id)a3;
@end

@implementation MTRZoneManagementClusterZoneInformationStruct

- (MTRZoneManagementClusterZoneInformationStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRZoneManagementClusterZoneInformationStruct;
  v2 = [(MTRZoneManagementClusterZoneInformationStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    zoneID = v2->_zoneID;
    v2->_zoneID = (NSNumber *)&unk_26F9C8620;

    zoneType = v3->_zoneType;
    v3->_zoneType = (NSNumber *)&unk_26F9C8620;

    zoneSource = v3->_zoneSource;
    v3->_zoneSource = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRZoneManagementClusterZoneInformationStruct);
  v7 = objc_msgSend_zoneID(self, v5, v6);
  objc_msgSend_setZoneID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_zoneType(self, v9, v10);
  objc_msgSend_setZoneType_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_zoneSource(self, v13, v14);
  objc_msgSend_setZoneSource_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: zoneID:%@; zoneType:%@; zoneSource:%@; >",
    v5,
    self->_zoneID,
    self->_zoneType,
  v7 = self->_zoneSource);

  return v7;
}

- (NSNumber)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (NSNumber)zoneType
{
  return self->_zoneType;
}

- (void)setZoneType:(id)a3
{
}

- (NSNumber)zoneSource
{
  return self->_zoneSource;
}

- (void)setZoneSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSource, 0);
  objc_storeStrong((id *)&self->_zoneType, 0);

  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end