@interface CSOpportuneSpeakListenerDeviceManager
+ (id)sharedManager;
- (NSString)deviceId;
- (void)setDeviceId:(id)a3;
@end

@implementation CSOpportuneSpeakListenerDeviceManager

- (void).cxx_destruct
{
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

+ (id)sharedManager
{
  if (qword_1002A3AD0 != -1) {
    dispatch_once(&qword_1002A3AD0, &stru_1002520D8);
  }
  v2 = (void *)qword_1002A3AC8;
  return v2;
}

@end