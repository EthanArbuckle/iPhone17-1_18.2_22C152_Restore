@interface ExternalNotificationConfiguration
@end

@implementation ExternalNotificationConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
}

@end