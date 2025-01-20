@interface VCSessionParticipantOneToOneConfig
- (AVCBasebandCongestionDetector)basebandCongestionDetector;
- (AVCRateControlFeedbackController)feedbackController;
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)initUsingWifiTiers;
- (BOOL)negotiatedScreenEnabled;
- (BOOL)negotiatedVideoEnabled;
- (VCNetworkFeedbackController)networkFeedbackController;
- (VCRateControlMediaController)mediaController;
- (VCSessionParticipantOneToOneConfig)init;
- (int)deviceRole;
- (int)operatingMode;
- (tagHANDLE)mediaQueue;
- (tagVCMediaQueue)vcMediaQueue;
- (unint64_t)idsParticipantID;
- (void)audioMediaControlInfoGenerator;
- (void)dealloc;
- (void)setAudioMediaControlInfoGenerator:(void *)a3;
- (void)setBasebandCongestionDetector:(id)a3;
- (void)setDeviceRole:(int)a3;
- (void)setFeedbackController:(id)a3;
- (void)setIdsParticipantID:(unint64_t)a3;
- (void)setInitUsingWifiTiers:(BOOL)a3;
- (void)setMediaController:(id)a3;
- (void)setMediaQueue:(tagHANDLE *)a3;
- (void)setNegotiatedScreenEnabled:(BOOL)a3;
- (void)setNegotiatedVideoEnabled:(BOOL)a3;
- (void)setNetworkFeedbackController:(id)a3;
- (void)setOperatingMode:(int)a3;
- (void)setStatisticsCollector:(id)a3;
- (void)setVcMediaQueue:(tagVCMediaQueue *)a3;
- (void)setVideoMediaControlInfoGenerator:(void *)a3;
- (void)videoMediaControlInfoGenerator;
@end

@implementation VCSessionParticipantOneToOneConfig

- (VCSessionParticipantOneToOneConfig)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCSessionParticipantOneToOneConfig;
  result = [(VCObject *)&v3 init];
  if (result) {
    result->_mediaQueue = (tagHANDLE *)0xFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  vcMediaQueue = self->_vcMediaQueue;
  if (vcMediaQueue) {
    CFRelease(vcMediaQueue);
  }
  audioMediaControlInfoGenerator = self->_audioMediaControlInfoGenerator;
  if (audioMediaControlInfoGenerator) {
    CFRelease(audioMediaControlInfoGenerator);
  }
  videoMediaControlInfoGenerator = self->_videoMediaControlInfoGenerator;
  if (videoMediaControlInfoGenerator) {
    CFRelease(videoMediaControlInfoGenerator);
  }

  v6.receiver = self;
  v6.super_class = (Class)VCSessionParticipantOneToOneConfig;
  [(VCObject *)&v6 dealloc];
}

- (void)setAudioMediaControlInfoGenerator:(void *)a3
{
  audioMediaControlInfoGenerator = self->_audioMediaControlInfoGenerator;
  if (audioMediaControlInfoGenerator != a3)
  {
    if (audioMediaControlInfoGenerator) {
      CFRelease(audioMediaControlInfoGenerator);
    }
    self->_audioMediaControlInfoGenerator = 0;
    if (a3) {
      self->_audioMediaControlInfoGenerator = (void *)CFRetain(a3);
    }
  }
}

- (void)setVideoMediaControlInfoGenerator:(void *)a3
{
  videoMediaControlInfoGenerator = self->_videoMediaControlInfoGenerator;
  if (videoMediaControlInfoGenerator != a3)
  {
    if (videoMediaControlInfoGenerator) {
      CFRelease(videoMediaControlInfoGenerator);
    }
    self->_videoMediaControlInfoGenerator = 0;
    if (a3) {
      self->_videoMediaControlInfoGenerator = (void *)CFRetain(a3);
    }
  }
}

- (void)setVcMediaQueue:(tagVCMediaQueue *)a3
{
  vcMediaQueue = self->_vcMediaQueue;
  if (vcMediaQueue != a3)
  {
    if (vcMediaQueue) {
      CFRelease(vcMediaQueue);
    }
    if (a3) {
      objc_super v6 = (tagVCMediaQueue *)CFRetain(a3);
    }
    else {
      objc_super v6 = 0;
    }
    self->_vcMediaQueue = v6;
  }
}

- (unint64_t)idsParticipantID
{
  return self->_idsParticipantID;
}

- (void)setIdsParticipantID:(unint64_t)a3
{
  self->_idsParticipantID = a3;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->_deviceRole = a3;
}

- (AVCRateControlFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (void)setFeedbackController:(id)a3
{
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (void)setBasebandCongestionDetector:(id)a3
{
}

- (void)audioMediaControlInfoGenerator
{
  return self->_audioMediaControlInfoGenerator;
}

- (void)videoMediaControlInfoGenerator
{
  return self->_videoMediaControlInfoGenerator;
}

- (VCRateControlMediaController)mediaController
{
  return self->_mediaController;
}

- (void)setMediaController:(id)a3
{
}

- (tagHANDLE)mediaQueue
{
  return self->_mediaQueue;
}

- (void)setMediaQueue:(tagHANDLE *)a3
{
  self->_mediaQueue = a3;
}

- (tagVCMediaQueue)vcMediaQueue
{
  return self->_vcMediaQueue;
}

- (VCNetworkFeedbackController)networkFeedbackController
{
  return self->_networkFeedbackController;
}

- (void)setNetworkFeedbackController:(id)a3
{
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_operatingMode = a3;
}

- (BOOL)negotiatedVideoEnabled
{
  return self->_negotiatedVideoEnabled;
}

- (void)setNegotiatedVideoEnabled:(BOOL)a3
{
  self->_negotiatedVideoEnabled = a3;
}

- (BOOL)negotiatedScreenEnabled
{
  return self->_negotiatedScreenEnabled;
}

- (void)setNegotiatedScreenEnabled:(BOOL)a3
{
  self->_negotiatedScreenEnabled = a3;
}

- (BOOL)initUsingWifiTiers
{
  return self->_initUsingWifiTiers;
}

- (void)setInitUsingWifiTiers:(BOOL)a3
{
  self->_initUsingWifiTiers = a3;
}

@end