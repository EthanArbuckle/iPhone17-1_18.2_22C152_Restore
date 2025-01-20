@interface MTRAccessControlClusterAccessControlExtensionChangedEvent
- (MTRAccessControlClusterAccessControlExtensionChangedEvent)init;
- (MTRAccessControlClusterAccessControlExtensionStruct)latestValue;
- (NSNumber)adminNodeID;
- (NSNumber)adminPasscodeID;
- (NSNumber)changeType;
- (NSNumber)fabricIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAdminNodeID:(NSNumber *)adminNodeID;
- (void)setAdminPasscodeID:(NSNumber *)adminPasscodeID;
- (void)setChangeType:(NSNumber *)changeType;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setLatestValue:(MTRAccessControlClusterAccessControlExtensionStruct *)latestValue;
@end

@implementation MTRAccessControlClusterAccessControlExtensionChangedEvent

- (MTRAccessControlClusterAccessControlExtensionChangedEvent)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRAccessControlClusterAccessControlExtensionChangedEvent;
  v2 = [(MTRAccessControlClusterAccessControlExtensionChangedEvent *)&v10 init];
  v3 = v2;
  if (v2)
  {
    adminNodeID = v2->_adminNodeID;
    v2->_adminNodeID = 0;

    adminPasscodeID = v3->_adminPasscodeID;
    v3->_adminPasscodeID = 0;

    changeType = v3->_changeType;
    v3->_changeType = (NSNumber *)&unk_26F9C8620;

    latestValue = v3->_latestValue;
    v3->_latestValue = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccessControlClusterAccessControlExtensionChangedEvent);
  v7 = objc_msgSend_adminNodeID(self, v5, v6);
  objc_msgSend_setAdminNodeID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_adminPasscodeID(self, v9, v10);
  objc_msgSend_setAdminPasscodeID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_changeType(self, v13, v14);
  objc_msgSend_setChangeType_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_latestValue(self, v17, v18);
  objc_msgSend_setLatestValue_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_fabricIndex(self, v21, v22);
  objc_msgSend_setFabricIndex_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: adminNodeID:%@; adminPasscodeID:%@; changeType:%@; latestValue:%@; fabricIndex:%@; >",
    v5,
    self->_adminNodeID,
    self->_adminPasscodeID,
    self->_changeType,
    self->_latestValue,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)adminNodeID
{
  return self->_adminNodeID;
}

- (void)setAdminNodeID:(NSNumber *)adminNodeID
{
}

- (NSNumber)adminPasscodeID
{
  return self->_adminPasscodeID;
}

- (void)setAdminPasscodeID:(NSNumber *)adminPasscodeID
{
}

- (NSNumber)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(NSNumber *)changeType
{
}

- (MTRAccessControlClusterAccessControlExtensionStruct)latestValue
{
  return self->_latestValue;
}

- (void)setLatestValue:(MTRAccessControlClusterAccessControlExtensionStruct *)latestValue
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_latestValue, 0);
  objc_storeStrong((id *)&self->_changeType, 0);
  objc_storeStrong((id *)&self->_adminPasscodeID, 0);

  objc_storeStrong((id *)&self->_adminNodeID, 0);
}

@end