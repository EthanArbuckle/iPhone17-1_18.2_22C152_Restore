@interface CKSQLiteDatabaseActivityEntry
- (BOOL)isEqual:(id)a3;
- (NSDate)activityEarliestDate;
- (NSDate)activityLatestDate;
- (NSDate)activityNotBeforeDate;
- (NSDate)activityStartDate;
- (NSNumber)activityID;
- (NSNumber)coalescingInterval;
- (NSNumber)databaseID;
- (NSNumber)groupID;
- (NSNumber)separationInterval;
- (NSString)groupName;
- (NSString)tableName;
- (id)targetDescription;
- (unint64_t)hash;
- (void)setActivityEarliestDate:(id)a3;
- (void)setActivityID:(id)a3;
- (void)setActivityLatestDate:(id)a3;
- (void)setActivityNotBeforeDate:(id)a3;
- (void)setActivityStartDate:(id)a3;
- (void)setCoalescingInterval:(id)a3;
- (void)setDatabaseID:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setSeparationInterval:(id)a3;
- (void)setTableName:(id)a3;
@end

@implementation CKSQLiteDatabaseActivityEntry

- (unint64_t)hash
{
  v5 = objc_msgSend_groupID(self, a2, v2, v3);
  int v9 = objc_msgSend_unsignedIntValue(v5, v6, v7, v8);
  v13 = objc_msgSend_databaseID(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_unsignedIntValue(v13, v14, v15, v16) | (v9 << 16);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_databaseID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_databaseID(v4, v9, v10, v11);
  uint64_t v15 = (void *)v12;
  char isEqualToString = 0;
  if (v8 && v12)
  {
    if (objc_msgSend_isEqualToNumber_(v8, v13, v12, v14))
    {
      v20 = objc_msgSend_groupID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_groupID(v4, v21, v22, v23);
      v27 = (void *)v24;
      char isEqualToString = 0;
      if (v20 && v24)
      {
        if (objc_msgSend_isEqualToNumber_(v20, v25, v24, v26))
        {
          v31 = objc_msgSend_tableName(self, v28, v29, v30);
          uint64_t v35 = objc_msgSend_tableName(v4, v32, v33, v34);
          v38 = (void *)v35;
          if (v31 == (void *)v35)
          {
            char isEqualToString = 1;
          }
          else
          {
            char isEqualToString = 0;
            if (v31 && v35) {
              char isEqualToString = objc_msgSend_isEqualToString_(v31, v36, v35, v37);
            }
          }
        }
        else
        {
          char isEqualToString = 0;
        }
      }
    }
    else
    {
      char isEqualToString = 0;
    }
  }

  return isEqualToString;
}

- (id)targetDescription
{
  v5 = objc_msgSend_tableName(self, a2, v2, v3);
  uint64_t v6 = NSString;
  uint64_t v10 = objc_msgSend_groupName(self, v7, v8, v9);
  v13 = (void *)v10;
  if (v5) {
    objc_msgSend_stringWithFormat_(v6, v11, @"group=%@%@%@", v12, v10, @" table=", v5);
  }
  else {
  uint64_t v14 = objc_msgSend_stringWithFormat_(v6, v11, @"group=%@%@%@", v12, v10, &stru_1ED7F5C98, &stru_1ED7F5C98);
  }

  return v14;
}

- (NSNumber)activityID
{
  return self->_activityID;
}

- (void)setActivityID:(id)a3
{
}

- (NSNumber)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(id)a3
{
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
}

- (NSDate)activityEarliestDate
{
  return self->_activityEarliestDate;
}

- (void)setActivityEarliestDate:(id)a3
{
}

- (NSNumber)coalescingInterval
{
  return self->_coalescingInterval;
}

- (void)setCoalescingInterval:(id)a3
{
}

- (NSNumber)separationInterval
{
  return self->_separationInterval;
}

- (void)setSeparationInterval:(id)a3
{
}

- (NSDate)activityLatestDate
{
  return self->_activityLatestDate;
}

- (void)setActivityLatestDate:(id)a3
{
}

- (NSDate)activityNotBeforeDate
{
  return self->_activityNotBeforeDate;
}

- (void)setActivityNotBeforeDate:(id)a3
{
}

- (NSDate)activityStartDate
{
  return self->_activityStartDate;
}

- (void)setActivityStartDate:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_activityStartDate, 0);
  objc_storeStrong((id *)&self->_activityNotBeforeDate, 0);
  objc_storeStrong((id *)&self->_activityLatestDate, 0);
  objc_storeStrong((id *)&self->_separationInterval, 0);
  objc_storeStrong((id *)&self->_coalescingInterval, 0);
  objc_storeStrong((id *)&self->_activityEarliestDate, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);

  objc_storeStrong((id *)&self->_activityID, 0);
}

@end