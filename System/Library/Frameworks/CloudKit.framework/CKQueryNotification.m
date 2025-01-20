@interface CKQueryNotification
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isPublicDatabase;
- (CKDatabaseScope)databaseScope;
- (CKQueryNotification)initWithCoder:(id)a3;
- (CKQueryNotification)initWithRemoteNotificationDictionary:(id)a3;
- (CKQueryNotificationReason)queryNotificationReason;
- (CKRecordID)recordID;
- (NSDictionary)recordFields;
- (NSString)description;
- (id)CKPropertiesDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setQueryNotificationReason:(int64_t)a3;
- (void)setRecordFields:(id)a3;
- (void)setRecordID:(id)a3;
@end

@implementation CKQueryNotification

- (CKQueryNotification)initWithRemoteNotificationDictionary:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)CKQueryNotification;
  v5 = [(CKNotification *)&v60 initWithRemoteNotificationDictionary:v4];
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setNotificationType_(v5, v6, 1, v7);
    v11 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"ck", v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"qry", v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"fo", v16);
        if (objc_opt_respondsToSelector())
        {
          int v21 = objc_msgSend_intValue(v17, v18, v19, v20);
          uint64_t v24 = 1;
          if (v21 == 2) {
            uint64_t v24 = 2;
          }
          if (v21 == 3) {
            objc_msgSend_setQueryNotificationReason_(v8, v22, 3, v23);
          }
          else {
            objc_msgSend_setQueryNotificationReason_(v8, v22, v24, v23);
          }
        }
        v59 = v17;
        v25 = objc_msgSend_objectForKeyedSubscript_(v14, v18, @"af", v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_setRecordFields_(v8, v26, (uint64_t)v25, v27);
        }
        v28 = objc_msgSend_objectForKeyedSubscript_(v14, v26, @"rid", v27);
        v31 = objc_msgSend_objectForKeyedSubscript_(v14, v29, @"zid", v30);
        objc_msgSend_objectForKeyedSubscript_(v14, v32, @"zoid", v33);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v37 = CKCurrentProcessLinkCheck908c3403f5370f9fc0f790c790ce4de0669132c0();
              v38 = @"__defaultOwner__";
              if (v37) {
                v38 = v34;
              }
              v58 = v38;

              v39 = [CKRecordZoneID alloc];
              v41 = objc_msgSend_initWithZoneName_ownerName_(v39, v40, (uint64_t)v31, (uint64_t)v58);
              v42 = [CKRecordID alloc];
              v44 = objc_msgSend_initWithRecordName_zoneID_(v42, v43, (uint64_t)v28, (uint64_t)v41);
              objc_msgSend_setRecordID_(v8, v45, (uint64_t)v44, v46);

              v34 = v58;
            }
          }
        }
        v47 = objc_msgSend_objectForKeyedSubscript_(v14, v35, @"dbs", v36);
        if (objc_opt_respondsToSelector())
        {
          unsigned int v53 = objc_msgSend_intValue(v47, v48, v49, v50) - 1;
          if (v53 > 3) {
            objc_msgSend_setDatabaseScope_(v8, v51, 0, v52);
          }
          else {
            objc_msgSend_setDatabaseScope_(v8, v51, qword_18B1F3BE0[v53], v52);
          }
        }
        v54 = objc_msgSend_objectForKeyedSubscript_(v14, v48, @"sid", v50);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_setSubscriptionID_(v8, v55, (uint64_t)v54, v56);
        }
      }
    }
  }
  return v8;
}

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (id)CKPropertiesDescription
{
  uint64_t v3 = NSString;
  v30.receiver = self;
  v30.super_class = (Class)CKQueryNotification;
  id v4 = [(CKNotification *)&v30 CKPropertiesDescription];
  uint64_t NotificationReason = objc_msgSend_queryNotificationReason(self, v5, v6, v7);
  v12 = objc_msgSend_recordFields(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_recordID(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_ckShortDescription(v16, v17, v18, v19);
  unint64_t v24 = objc_msgSend_databaseScope(self, v21, v22, v23);
  v25 = CKDatabaseScopeString(v24);
  v28 = objc_msgSend_stringWithFormat_(v3, v26, @"%@, queryNotificationReason=%ld, recordFields=%@, recordID=%@, database=%@", v27, v4, NotificationReason, v12, v20, v25);

  return v28;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKQueryNotification *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v26.receiver = self;
  v26.super_class = (Class)CKQueryNotification;
  [(CKNotification *)&v26 encodeWithCoder:v4];
  uint64_t NotificationReason = objc_msgSend_queryNotificationReason(self, v6, v7, v8);
  objc_msgSend_encodeInt64_forKey_(v4, v10, NotificationReason, @"Reason");
  uint64_t v14 = objc_msgSend_recordFields(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"RecordFields");

  uint64_t v19 = objc_msgSend_recordID(self, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"RecordID");

  uint64_t v24 = objc_msgSend_databaseScope(self, v21, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v4, v25, v24, @"DatabaseScope");
}

- (CKQueryNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKQueryNotification;
  v5 = [(CKNotification *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    v5->_queryuint64_t NotificationReason = objc_msgSend_decodeInt64ForKey_(v4, v7, @"Reason", v8);
    v9 = CKAcceptableValueClasses();
    uint64_t v10 = objc_opt_class();
    uint64_t v13 = objc_msgSend_setByAddingObject_(v9, v11, v10, v12);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, @"RecordFields");
    recordFields = v5->_recordFields;
    v5->_recordFields = (NSDictionary *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"RecordID");
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v19;

    v5->_databaseScope = objc_msgSend_decodeInt64ForKey_(v4, v21, @"DatabaseScope", v22);
  }

  return v5;
}

- (NSDictionary)recordFields
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_recordFields;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRecordFields:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  recordFields = v4->_recordFields;
  v4->_recordFields = (NSDictionary *)v8;

  objc_sync_exit(v4);
}

- (CKQueryNotificationReason)queryNotificationReason
{
  return self->_queryNotificationReason;
}

- (void)setQueryNotificationReason:(int64_t)a3
{
  self->_queryuint64_t NotificationReason = a3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (CKDatabaseScope)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);

  objc_storeStrong((id *)&self->_recordFields, 0);
}

- (BOOL)isPublicDatabase
{
  return objc_msgSend_databaseScope(self, a2, v2, v3) == 1;
}

@end