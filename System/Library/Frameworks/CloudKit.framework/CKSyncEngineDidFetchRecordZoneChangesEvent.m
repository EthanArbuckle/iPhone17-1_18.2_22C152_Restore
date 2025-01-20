@interface CKSyncEngineDidFetchRecordZoneChangesEvent
- (CKRecordZoneID)zoneID;
- (CKSyncEngineDidFetchRecordZoneChangesEvent)initWithZoneID:(id)a3 error:(id)a4;
- (NSError)error;
- (int64_t)type;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineDidFetchRecordZoneChangesEvent

- (CKSyncEngineDidFetchRecordZoneChangesEvent)initWithZoneID:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v27 = 0;
  char v9 = _CKCheckArgument((uint64_t)"zoneID", v7, 0, 0, 0, &v27);
  id v10 = v27;
  if ((v9 & 1) == 0)
  {
    v14 = v10;
    v15 = [CKException alloc];
    uint64_t v19 = objc_msgSend_code(v14, v16, v17, v18);
    v23 = objc_msgSend_localizedDescription(v14, v20, v21, v22);
    id v25 = (id)objc_msgSend_initWithCode_format_(v15, v24, v19, @"%@", v23);

    objc_exception_throw(v25);
  }

  v26.receiver = self;
  v26.super_class = (Class)CKSyncEngineDidFetchRecordZoneChangesEvent;
  v11 = [(CKSyncEngineEvent *)&v26 initInternal];
  v12 = (CKSyncEngineDidFetchRecordZoneChangesEvent *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 1, a3);
    objc_storeStrong((id *)&v12->_error, a4);
  }

  return v12;
}

- (int64_t)type
{
  return 8;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKSyncEngineDidFetchRecordZoneChangesEvent;
  id v4 = a3;
  [(CKSyncEngineEvent *)&v15 CKDescribePropertiesUsing:v4];
  id v8 = objc_msgSend_zoneID(self, v5, v6, v7, v15.receiver, v15.super_class);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"zoneID", (uint64_t)v8, 0);

  v13 = objc_msgSend_error(self, v10, v11, v12);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, @"error", (uint64_t)v13, 0);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end