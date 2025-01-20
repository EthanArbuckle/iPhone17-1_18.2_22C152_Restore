@interface VCMediaNegotiatorResultsFaceTimeSettings
- (BOOL)SIPDisabled;
- (BOOL)oneToOneModeSupported;
- (BOOL)remoteFaceTimeSwitchesAvailable;
- (BOOL)secureMessagingRequired;
- (unsigned)faceTimeSwitches;
- (unsigned)mediaControlInfoFECFeedbackVersion;
- (unsigned)remoteLinkProbingCapabilityVersion;
- (void)setFaceTimeSwitches:(unsigned int)a3;
- (void)setMediaControlInfoFECFeedbackVersion:(unsigned __int8)a3;
- (void)setOneToOneModeSupported:(BOOL)a3;
- (void)setRemoteFaceTimeSwitchesAvailable:(BOOL)a3;
- (void)setRemoteLinkProbingCapabilityVersion:(unsigned __int8)a3;
- (void)setSIPDisabled:(BOOL)a3;
- (void)setSecureMessagingRequired:(BOOL)a3;
@end

@implementation VCMediaNegotiatorResultsFaceTimeSettings

- (BOOL)SIPDisabled
{
  return self->_SIPDisabled;
}

- (void)setSIPDisabled:(BOOL)a3
{
  self->_SIPDisabled = a3;
}

- (BOOL)secureMessagingRequired
{
  return self->_secureMessagingRequired;
}

- (void)setSecureMessagingRequired:(BOOL)a3
{
  self->_secureMessagingRequired = a3;
}

- (unsigned)faceTimeSwitches
{
  return self->_faceTimeSwitches;
}

- (void)setFaceTimeSwitches:(unsigned int)a3
{
  self->_faceTimeSwitches = a3;
}

- (BOOL)oneToOneModeSupported
{
  return self->_oneToOneModeSupported;
}

- (void)setOneToOneModeSupported:(BOOL)a3
{
  self->_oneToOneModeSupported = a3;
}

- (unsigned)mediaControlInfoFECFeedbackVersion
{
  return self->_mediaControlInfoFECFeedbackVersion;
}

- (void)setMediaControlInfoFECFeedbackVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoFECFeedbackVersion = a3;
}

- (unsigned)remoteLinkProbingCapabilityVersion
{
  return self->_remoteLinkProbingCapabilityVersion;
}

- (void)setRemoteLinkProbingCapabilityVersion:(unsigned __int8)a3
{
  self->_remoteLinkProbingCapabilityVersion = a3;
}

- (BOOL)remoteFaceTimeSwitchesAvailable
{
  return self->_remoteFaceTimeSwitchesAvailable;
}

- (void)setRemoteFaceTimeSwitchesAvailable:(BOOL)a3
{
  self->_remoteFaceTimeSwitchesAvailable = a3;
}

@end