@interface BCCloudKitRecordZone
- (BCCloudKitRecordZone)initWithRecordZone:(id)a3;
- (CKRecordZone)recordZone;
- (id)description;
@end

@implementation BCCloudKitRecordZone

- (BCCloudKitRecordZone)initWithRecordZone:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCCloudKitRecordZone;
  v6 = [(BCCloudKitRecordZone *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recordZone, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v12 = objc_msgSend_recordZone(self, v5, v6, v7, v8, v9, v10, v11);
  v19 = objc_msgSend_stringWithFormat_(v3, v13, @"<%@: %p recordZone:%@>", v14, v15, v16, v17, v18, v4, self, v12);

  return v19;
}

- (CKRecordZone)recordZone
{
  return self->_recordZone;
}

- (void).cxx_destruct
{
}

@end