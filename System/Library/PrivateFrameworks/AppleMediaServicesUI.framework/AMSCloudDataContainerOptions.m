@interface AMSCloudDataContainerOptions
- (BOOL)recordZoneEncryption;
- (void)setRecordZoneEncryption:(BOOL)a3;
@end

@implementation AMSCloudDataContainerOptions

- (BOOL)recordZoneEncryption
{
  return self->_recordZoneEncryption;
}

- (void)setRecordZoneEncryption:(BOOL)a3
{
  self->_recordZoneEncryption = a3;
}

@end