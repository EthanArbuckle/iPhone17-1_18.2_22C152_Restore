@interface CKSyncEngineAccountChangeEvent
- (CKRecordID)currentUser;
- (CKRecordID)previousUser;
- (CKSyncEngineAccountChangeEvent)initWithPreviousUser:(id)a3 currentUser:(id)a4;
- (CKSyncEngineAccountChangeType)changeType;
- (int64_t)type;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineAccountChangeEvent

- (CKSyncEngineAccountChangeEvent)initWithPreviousUser:(id)a3 currentUser:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKSyncEngineAccountChangeEvent;
  v9 = [(CKSyncEngineEvent *)&v21 initInternal];
  v10 = (CKSyncEngineAccountChangeEvent *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong((id *)&v10->_currentUser, a4);
    if (v8)
    {
      if (!v7)
      {
        v10->_changeType = 0;
        goto LABEL_9;
      }
      uint64_t v11 = 2;
    }
    else
    {
      if (!v7)
      {
        if (ck_log_initialization_predicate != -1) {
          goto LABEL_14;
        }
        while (1)
        {
          v13 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v20 = 0;
            _os_log_error_impl(&dword_18AF10000, v13, OS_LOG_TYPE_ERROR, "BUG IN CLOUDKIT: Tried to create an account change event with no current user and no previous user", v20, 2u);
          }
          v16 = objc_msgSend_stringWithFormat_(NSString, v14, @"BUG IN CLOUDKIT: Tried to create an account change event with no current user and no previous user", v15);
          objc_msgSend_UTF8String(v16, v17, v18, v19);
          _os_crash();
          __break(1u);
LABEL_14:
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
      }
      uint64_t v11 = 1;
    }
    v10->_changeType = v11;
  }
LABEL_9:

  return v10;
}

- (int64_t)type
{
  return 1;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CKSyncEngineAccountChangeEvent;
  id v4 = a3;
  [(CKSyncEngineEvent *)&v20 CKDescribePropertiesUsing:v4];
  unint64_t v8 = objc_msgSend_changeType(self, v5, v6, v7, v20.receiver, v20.super_class);
  if (v8 > 2) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"changeType", @"Unknown", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"changeType", (uint64_t)off_1E54604D8[v8], 0);
  }
  v13 = objc_msgSend_previousUser(self, v10, v11, v12);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, @"previousUser", (uint64_t)v13, 0);

  uint64_t v18 = objc_msgSend_currentUser(self, v15, v16, v17);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v19, @"currentUser", (uint64_t)v18, 0);
}

- (CKSyncEngineAccountChangeType)changeType
{
  return self->_changeType;
}

- (CKRecordID)previousUser
{
  return self->_previousUser;
}

- (CKRecordID)currentUser
{
  return self->_currentUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUser, 0);

  objc_storeStrong((id *)&self->_previousUser, 0);
}

@end