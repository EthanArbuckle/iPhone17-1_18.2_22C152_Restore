@interface MTRGroupKeyManagementClusterGroupKeyMapStruct
- (MTRGroupKeyManagementClusterGroupKeyMapStruct)init;
- (NSNumber)fabricIndex;
- (NSNumber)groupId;
- (NSNumber)groupKeySetID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setGroupId:(NSNumber *)groupId;
- (void)setGroupKeySetID:(NSNumber *)groupKeySetID;
@end

@implementation MTRGroupKeyManagementClusterGroupKeyMapStruct

- (MTRGroupKeyManagementClusterGroupKeyMapStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRGroupKeyManagementClusterGroupKeyMapStruct;
  v2 = [(MTRGroupKeyManagementClusterGroupKeyMapStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    groupId = v2->_groupId;
    v2->_groupId = (NSNumber *)&unk_26F9C8620;

    groupKeySetID = v3->_groupKeySetID;
    v3->_groupKeySetID = (NSNumber *)&unk_26F9C8620;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGroupKeyManagementClusterGroupKeyMapStruct);
  v7 = objc_msgSend_groupId(self, v5, v6);
  objc_msgSend_setGroupId_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_groupKeySetID(self, v9, v10);
  objc_msgSend_setGroupKeySetID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_fabricIndex(self, v13, v14);
  objc_msgSend_setFabricIndex_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: groupId:%@; groupKeySetID:%@; fabricIndex:%@; >",
    v5,
    self->_groupId,
    self->_groupKeySetID,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(NSNumber *)groupId
{
}

- (NSNumber)groupKeySetID
{
  return self->_groupKeySetID;
}

- (void)setGroupKeySetID:(NSNumber *)groupKeySetID
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
  objc_storeStrong((id *)&self->_groupKeySetID, 0);

  objc_storeStrong((id *)&self->_groupId, 0);
}

@end