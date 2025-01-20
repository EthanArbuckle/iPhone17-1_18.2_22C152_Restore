@interface CRSUIVolumeNotificationAssertionData
- (BOOL)blockNotification;
- (NSString)identifier;
- (void)setBlockNotification:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CRSUIVolumeNotificationAssertionData

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)blockNotification
{
  return self->_blockNotification;
}

- (void)setBlockNotification:(BOOL)a3
{
  self->_blockNotification = a3;
}

- (void).cxx_destruct
{
}

@end