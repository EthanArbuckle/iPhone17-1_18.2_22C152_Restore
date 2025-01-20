@interface IDSCloudKitKeyElectionStoreItem
- (ENGroupID)groupID;
- (NSString)groupName;
- (id)description;
- (void)setGroupID:(id)a3;
- (void)setGroupName:(id)a3;
@end

@implementation IDSCloudKitKeyElectionStoreItem

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_groupName(self, v5, v6, v7);
  v12 = objc_msgSend_groupID(self, v9, v10, v11);
  v15 = objc_msgSend_stringWithFormat_(v3, v13, @"<%@ %p groupName: %@ groupID: %@>", v14, v4, self, v8, v12);

  return v15;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (ENGroupID)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end