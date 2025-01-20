@interface AMSDCloudDataContainerOptions
- (BOOL)recordZoneEncryption;
- (void)setRecordZoneEncryption:(BOOL)a3;
@end

@implementation AMSDCloudDataContainerOptions

- (BOOL)recordZoneEncryption
{
  return self->_recordZoneEncryption;
}

- (void)setRecordZoneEncryption:(BOOL)a3
{
  self->_recordZoneEncryption = a3;
}

@end