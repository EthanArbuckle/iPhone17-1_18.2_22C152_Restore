@interface CKRecordZoneNotification
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (CKDatabaseScope)databaseScope;
- (CKRecordZoneID)recordZoneID;
- (CKRecordZoneNotification)initWithCoder:(id)a3;
- (CKRecordZoneNotification)initWithRemoteNotificationDictionary:(id)a3;
- (NSString)description;
- (id)CKPropertiesDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setRecordZoneID:(id)a3;
@end

@implementation CKRecordZoneNotification

- (CKRecordZoneNotification)initWithRemoteNotificationDictionary:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CKRecordZoneNotification;
  v5 = [(CKNotification *)&v42 initWithRemoteNotificationDictionary:v4];
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setNotificationType_(v5, v6, 2, v7);
    v11 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"ck", v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"fet", v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"zid", v16);
        objc_msgSend_objectForKeyedSubscript_(v14, v18, @"zoid", v19);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v23 = CKCurrentProcessLinkCheck908c3403f5370f9fc0f790c790ce4de0669132c0();
            v24 = @"__defaultOwner__";
            if (v23) {
              v24 = v20;
            }
            v25 = v24;

            v26 = [CKRecordZoneID alloc];
            v28 = objc_msgSend_initWithZoneName_ownerName_(v26, v27, (uint64_t)v17, (uint64_t)v25);
            objc_msgSend_setRecordZoneID_(v8, v29, (uint64_t)v28, v30);

            v20 = v25;
          }
        }
        v31 = objc_msgSend_objectForKeyedSubscript_(v14, v21, @"dbs", v22);
        if (objc_opt_respondsToSelector())
        {
          unsigned int v37 = objc_msgSend_intValue(v31, v32, v33, v34) - 1;
          if (v37 > 3) {
            objc_msgSend_setDatabaseScope_(v8, v35, 0, v36);
          }
          else {
            objc_msgSend_setDatabaseScope_(v8, v35, qword_18B1F3BE0[v37], v36);
          }
        }
        v38 = objc_msgSend_objectForKeyedSubscript_(v14, v32, @"sid", v34);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_setSubscriptionID_(v8, v39, (uint64_t)v38, v40);
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
  v22.receiver = self;
  v22.super_class = (Class)CKRecordZoneNotification;
  id v4 = [(CKNotification *)&v22 CKPropertiesDescription];
  v8 = objc_msgSend_recordZoneID(self, v5, v6, v7);
  v12 = objc_msgSend_ckShortDescription(v8, v9, v10, v11);
  unint64_t v16 = objc_msgSend_databaseScope(self, v13, v14, v15);
  v17 = CKDatabaseScopeString(v16);
  v20 = objc_msgSend_stringWithFormat_(v3, v18, @"%@, recordZoneID=%@, database=%@", v19, v4, v12, v17);

  return v20;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecordZoneNotification *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v16.receiver = self;
  v16.super_class = (Class)CKRecordZoneNotification;
  [(CKNotification *)&v16 encodeWithCoder:v4];
  v9 = objc_msgSend_recordZoneID(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"RecordZoneID");

  uint64_t v14 = objc_msgSend_databaseScope(self, v11, v12, v13);
  objc_msgSend_encodeInt64_forKey_(v4, v15, v14, @"DatabaseScope");
}

- (CKRecordZoneNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKRecordZoneNotification;
  v5 = [(CKNotification *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"RecordZoneID");
    recordZoneID = v5->_recordZoneID;
    v5->_recordZoneID = (CKRecordZoneID *)v9;

    v5->_databaseScope = objc_msgSend_decodeInt64ForKey_(v4, v11, @"DatabaseScope", v12);
  }

  return v5;
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
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
}

@end