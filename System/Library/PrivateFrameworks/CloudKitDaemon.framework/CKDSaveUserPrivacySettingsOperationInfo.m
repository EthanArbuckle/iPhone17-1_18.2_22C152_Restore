@interface CKDSaveUserPrivacySettingsOperationInfo
- (CKDSaveUserPrivacySettingsOperationInfo)init;
- (int64_t)discoverable;
- (void)setDiscoverable:(int64_t)a3;
@end

@implementation CKDSaveUserPrivacySettingsOperationInfo

- (CKDSaveUserPrivacySettingsOperationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKDSaveUserPrivacySettingsOperationInfo;
  result = [(CKOperationInfo *)&v3 init];
  if (result) {
    result->_discoverable = 0;
  }
  return result;
}

- (int64_t)discoverable
{
  return self->_discoverable;
}

- (void)setDiscoverable:(int64_t)a3
{
  self->_discoverable = a3;
}

@end