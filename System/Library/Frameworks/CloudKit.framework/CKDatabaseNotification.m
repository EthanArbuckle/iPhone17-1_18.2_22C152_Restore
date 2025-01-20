@interface CKDatabaseNotification
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (CKDatabaseNotification)initWithCoder:(id)a3;
- (CKDatabaseNotification)initWithRemoteNotificationDictionary:(id)a3;
- (CKDatabaseScope)databaseScope;
- (CKRecordZoneID)recordZoneID;
- (NSString)description;
- (id)CKPropertiesDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setRecordZoneID:(id)a3;
@end

@implementation CKDatabaseNotification

- (CKDatabaseNotification)initWithRemoteNotificationDictionary:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CKDatabaseNotification;
  v5 = [(CKNotification *)&v45 initWithRemoteNotificationDictionary:v4];
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setNotificationType_(v5, v6, 4, v7);
    v11 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"ck", v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"met", v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"dbs", v16);
        if (objc_opt_respondsToSelector())
        {
          unsigned int v23 = objc_msgSend_intValue(v17, v18, v19, v20) - 1;
          if (v23 > 3) {
            objc_msgSend_setDatabaseScope_(v8, v21, 0, v22);
          }
          else {
            objc_msgSend_setDatabaseScope_(v8, v21, qword_18B1F3BE0[v23], v22);
          }
        }
        v24 = objc_msgSend_objectForKeyedSubscript_(v14, v18, @"sid", v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_setSubscriptionID_(v8, v25, (uint64_t)v24, v26);
        }
        objc_msgSend_objectForKeyedSubscript_(v14, v25, @"zoid", v26);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_objectForKeyedSubscript_(v14, v28, @"zid", v29);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = v30;
            uint64_t v35 = objc_msgSend_databaseScope(v8, v32, v33, v34);
            v36 = v27;
            switch(v35)
            {
              case 0:
              case 3:
                goto LABEL_14;
              case 1:
              case 2:
              case 4:
                v36 = @"__defaultOwner__";
LABEL_14:
                v37 = v36;
                if (v37 && v31)
                {
                  v38 = [CKRecordZoneID alloc];
                  id v44 = v31;
                  v40 = objc_msgSend_initWithZoneName_ownerName_(v38, v39, (uint64_t)v31, (uint64_t)v37);
                  objc_msgSend_setRecordZoneID_(v8, v41, (uint64_t)v40, v42);

                  id v31 = v44;
                }
                break;
              default:
                v37 = 0;
                break;
            }
          }
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
  v22.super_class = (Class)CKDatabaseNotification;
  id v4 = [(CKNotification *)&v22 CKPropertiesDescription];
  unint64_t v8 = objc_msgSend_databaseScope(self, v5, v6, v7);
  v9 = CKDatabaseScopeString(v8);
  uint64_t v13 = objc_msgSend_recordZoneID(self, v10, v11, v12);
  v17 = objc_msgSend_ckShortDescription(v13, v14, v15, v16);
  uint64_t v20 = objc_msgSend_stringWithFormat_(v3, v18, @"%@, database=%@, zoneID=%@", v19, v4, v9, v17);

  return v20;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDatabaseNotification *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v11.receiver = self;
  v11.super_class = (Class)CKDatabaseNotification;
  [(CKNotification *)&v11 encodeWithCoder:v4];
  uint64_t v9 = objc_msgSend_databaseScope(self, v6, v7, v8);
  objc_msgSend_encodeInt64_forKey_(v4, v10, v9, @"DatabaseScope");
}

- (CKDatabaseNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDatabaseNotification;
  v5 = [(CKNotification *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    v5->_databaseScope = objc_msgSend_decodeInt64ForKey_(v4, v7, @"DatabaseScope", v8);
  }

  return v5;
}

- (CKDatabaseScope)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end