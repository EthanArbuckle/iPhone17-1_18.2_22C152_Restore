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
  uint64_t v3 = objc_opt_class();
  v4 = [(BCCloudKitRecordZone *)self recordZone];
  id v5 = +[NSString stringWithFormat:@"<%@: %p recordZone:%@>", v3, self, v4];

  return v5;
}

- (CKRecordZone)recordZone
{
  return self->_recordZone;
}

- (void).cxx_destruct
{
}

@end