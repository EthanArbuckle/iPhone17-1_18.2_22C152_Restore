@interface MTRGroupKeyManagementClusterGroupInfoMapStruct
- (MTRGroupKeyManagementClusterGroupInfoMapStruct)init;
- (NSArray)endpoints;
- (NSNumber)fabricIndex;
- (NSNumber)groupId;
- (NSString)groupName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEndpoints:(NSArray *)endpoints;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setGroupId:(NSNumber *)groupId;
- (void)setGroupName:(NSString *)groupName;
@end

@implementation MTRGroupKeyManagementClusterGroupInfoMapStruct

- (MTRGroupKeyManagementClusterGroupInfoMapStruct)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRGroupKeyManagementClusterGroupInfoMapStruct;
  v2 = [(MTRGroupKeyManagementClusterGroupInfoMapStruct *)&v12 init];
  v3 = v2;
  if (v2)
  {
    groupId = v2->_groupId;
    v2->_groupId = (NSNumber *)&unk_26F9C8620;

    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
    endpoints = v3->_endpoints;
    v3->_endpoints = (NSArray *)v7;

    groupName = v3->_groupName;
    v3->_groupName = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGroupKeyManagementClusterGroupInfoMapStruct);
  uint64_t v7 = objc_msgSend_groupId(self, v5, v6);
  objc_msgSend_setGroupId_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_endpoints(self, v9, v10);
  objc_msgSend_setEndpoints_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_groupName(self, v13, v14);
  objc_msgSend_setGroupName_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_fabricIndex(self, v17, v18);
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: groupId:%@; endpoints:%@; groupName:%@; fabricIndex:%@; >",
    v5,
    self->_groupId,
    self->_endpoints,
    self->_groupName,
  uint64_t v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(NSNumber *)groupId
{
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(NSArray *)endpoints
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(NSString *)groupName
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
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);

  objc_storeStrong((id *)&self->_groupId, 0);
}

@end