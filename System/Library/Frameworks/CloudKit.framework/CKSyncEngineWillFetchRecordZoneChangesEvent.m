@interface CKSyncEngineWillFetchRecordZoneChangesEvent
- (CKRecordZoneID)zoneID;
- (CKSyncEngineWillFetchRecordZoneChangesEvent)initWithZoneID:(id)a3;
- (int64_t)type;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineWillFetchRecordZoneChangesEvent

- (CKSyncEngineWillFetchRecordZoneChangesEvent)initWithZoneID:(id)a3
{
  id v5 = a3;
  id v24 = 0;
  char v6 = _CKCheckArgument((uint64_t)"zoneID", v5, 0, 0, 0, &v24);
  id v7 = v24;
  if ((v6 & 1) == 0)
  {
    v11 = v7;
    v12 = [CKException alloc];
    uint64_t v16 = objc_msgSend_code(v11, v13, v14, v15);
    v20 = objc_msgSend_localizedDescription(v11, v17, v18, v19);
    id v22 = (id)objc_msgSend_initWithCode_format_(v12, v21, v16, @"%@", v20);

    objc_exception_throw(v22);
  }

  v23.receiver = self;
  v23.super_class = (Class)CKSyncEngineWillFetchRecordZoneChangesEvent;
  v8 = [(CKSyncEngineEvent *)&v23 initInternal];
  v9 = (CKSyncEngineWillFetchRecordZoneChangesEvent *)v8;
  if (v8) {
    objc_storeStrong(v8 + 1, a3);
  }

  return v9;
}

- (int64_t)type
{
  return 7;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKSyncEngineWillFetchRecordZoneChangesEvent;
  id v4 = a3;
  [(CKSyncEngineEvent *)&v10 CKDescribePropertiesUsing:v4];
  v8 = objc_msgSend_zoneID(self, v5, v6, v7, v10.receiver, v10.super_class);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"zoneID", (uint64_t)v8, 0);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void).cxx_destruct
{
}

@end