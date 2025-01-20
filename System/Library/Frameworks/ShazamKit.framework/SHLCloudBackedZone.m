@interface SHLCloudBackedZone
- (CKRecordZone)zone;
- (SHLCloudBackedZone)initWithZone:(id)a3;
@end

@implementation SHLCloudBackedZone

- (SHLCloudBackedZone)initWithZone:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLCloudBackedZone;
  v6 = [(SHLCloudBackedZone *)&v9 init];
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

- (void).cxx_destruct
{
}

@end