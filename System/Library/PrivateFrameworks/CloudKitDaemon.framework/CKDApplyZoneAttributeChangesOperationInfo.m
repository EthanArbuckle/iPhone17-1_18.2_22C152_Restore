@interface CKDApplyZoneAttributeChangesOperationInfo
- (CKDApplyZoneAttributeChangesOperationInfo)initWithZone:(id)a3;
- (CKRecordZone)zone;
- (void)setZone:(id)a3;
@end

@implementation CKDApplyZoneAttributeChangesOperationInfo

- (CKDApplyZoneAttributeChangesOperationInfo)initWithZone:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDApplyZoneAttributeChangesOperationInfo;
  v6 = [(CKOperationInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_zone, a3);
  }

  return v7;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
}

- (void).cxx_destruct
{
}

@end