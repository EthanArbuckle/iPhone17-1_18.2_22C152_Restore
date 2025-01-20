@interface CSOpportuneSpeakListenerOption
- (NSString)deviceId;
- (unint64_t)opportuneSpeakListeningType;
- (void)setDeviceId:(id)a3;
- (void)setOpportuneSpeakListeningType:(unint64_t)a3;
@end

@implementation CSOpportuneSpeakListenerOption

- (void).cxx_destruct
{
}

- (void)setOpportuneSpeakListeningType:(unint64_t)a3
{
  self->_opportuneSpeakListeningType = a3;
}

- (unint64_t)opportuneSpeakListeningType
{
  return self->_opportuneSpeakListeningType;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

@end