@interface CKSQLiteTableGroupEntry
+ (double)expirationTime;
- (BOOL)isExpired;
- (CKSQLiteTableGroupEntry)initWithName:(id)a3;
- (NSDate)lastUsed;
- (NSDictionary)groupData;
- (NSNumber)groupID;
- (NSString)creatingClass;
- (NSString)name;
- (id)description;
- (void)deleteTables:(id)a3;
- (void)setCreatingClass:(id)a3;
- (void)setGroupData:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setLastUsed:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CKSQLiteTableGroupEntry

- (CKSQLiteTableGroupEntry)initWithName:(id)a3
{
  id v4 = a3;
  v11 = (CKSQLiteTableGroupEntry *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    name = v11->_name;
    v11->_name = (NSString *)v12;
  }
  return v11;
}

- (id)description
{
  return (id)objc_msgSend_descriptionOfEntry_(CKSQLiteTOCTableGroupTable, a2, (uint64_t)self, v2);
}

- (void)deleteTables:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_tocTableGroup(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_tocTable(v8, v9, v10, v11);
  v16 = objc_msgSend_tocTableGroupTable(v8, v13, v14, v15);
  v20 = objc_msgSend_groupID(self, v17, v18, v19);
  v22 = objc_msgSend_tocEntriesWithGroupID_error_(v12, v21, (uint64_t)v20, 0);

  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_18B054F08;
  v32[3] = &unk_1E5462260;
  id v33 = v22;
  id v34 = v4;
  id v35 = v23;
  v36 = self;
  id v37 = v12;
  id v38 = v16;
  id v24 = v16;
  id v25 = v12;
  id v26 = v23;
  id v27 = v4;
  id v28 = v22;
  id v31 = (id)objc_msgSend_performDatabaseTransaction_(v27, v29, (uint64_t)v32, v30);
}

+ (double)expirationTime
{
  return 2592000.0;
}

- (BOOL)isExpired
{
  objc_msgSend_creatingClass(self, a2, v2, v3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  Class v6 = NSClassFromString(v5);
  objc_msgSend_expirationTime(v6, v7, v8, v9);
  if (v6)
  {
    double v14 = v13 * 1.05;
    if (v13 * 1.05 <= 0.0)
    {
      BOOL v20 = 0;
    }
    else
    {
      uint64_t v15 = objc_msgSend_lastUsed(self, v10, v11, v12);
      objc_msgSend_timeIntervalSinceNow(v15, v16, v17, v18);
      BOOL v20 = v14 + v19 < 0.0;
    }
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)creatingClass
{
  return self->_creatingClass;
}

- (void)setCreatingClass:(id)a3
{
}

- (NSDictionary)groupData
{
  return self->_groupData;
}

- (void)setGroupData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupData, 0);
  objc_storeStrong((id *)&self->_creatingClass, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end