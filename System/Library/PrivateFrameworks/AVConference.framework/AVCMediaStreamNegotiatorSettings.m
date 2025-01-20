@interface AVCMediaStreamNegotiatorSettings
+ (id)negotiatorSettingsForMode:(int64_t)a3 deviceRole:(unsigned __int8)a4 options:(id)a5 errorString:(id *)a6;
+ (unint64_t)hdrModeWithNegotiatorInitOptions:(id)a3;
- (AVCMediaStreamNegotiatorSettings)init;
- (BOOL)blackFrameOnClearScreenEnabled;
- (BOOL)blackFrameOnClearScreenEnabledDefault;
- (BOOL)foveationIsSupported;
- (BOOL)rtcpTimeOutEnabled;
- (BOOL)shouldApply16AlignedAdjustment;
- (BOOL)shouldSetJitterBufferMode;
- (NSArray)hdrModePixelFormats;
- (NSDictionary)featureListString;
- (NSSet)hdrModesSupported;
- (NSString)audioDeviceUID;
- (VCMediaNegotiatorAudioConfiguration)audioConfiguration;
- (VCVideoRuleCollections)screenRuleCollections;
- (VCVideoRuleCollections)videoRuleCollections;
- (double)rtcpSendInterval;
- (double)rtcpTimeOutInterval;
- (int)connectionType;
- (int)operatingMode;
- (int)preferredAudioCodec;
- (int64_t)accessNetworkType;
- (int64_t)audioStreamMode;
- (int64_t)captureSource;
- (int64_t)mediaStreamDirection;
- (int64_t)tilesPerFrame;
- (int64_t)videoStreamMode;
- (unint64_t)audioChannelCount;
- (unint64_t)maxBandwidth;
- (unint64_t)minBandwidth;
- (unint64_t)preferredMediaBitRate;
- (unint64_t)ptime;
- (unsigned)featureListStringType;
- (unsigned)jitterBufferMode;
- (unsigned)localSSRC;
- (void)dealloc;
- (void)setAccessNetworkType:(int64_t)a3;
@end

@implementation AVCMediaStreamNegotiatorSettings

- (AVCMediaStreamNegotiatorSettings)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AVCMediaStreamNegotiatorSettings;
  v2 = [(AVCMediaStreamNegotiatorSettings *)&v4 init];
  if (v2)
  {
    v2->_localSSRC = RTPGenerateSSRC();
    v2->_tilesPerFrame = 1;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCMediaStreamNegotiatorSettings;
  [(AVCMediaStreamNegotiatorSettings *)&v3 dealloc];
}

- (int64_t)videoStreamMode
{
  return -1;
}

- (int64_t)audioStreamMode
{
  return -1;
}

- (int64_t)captureSource
{
  return 2;
}

- (int)operatingMode
{
}

- (int)preferredAudioCodec
{
  return 128;
}

- (unint64_t)ptime
{
  return 20;
}

- (unint64_t)minBandwidth
{
  return 20000000;
}

- (unint64_t)maxBandwidth
{
  return 20000000;
}

- (BOOL)rtcpTimeOutEnabled
{
  return 0;
}

- (double)rtcpTimeOutInterval
{
  return 0.0;
}

- (double)rtcpSendInterval
{
  return 5.0;
}

- (unsigned)jitterBufferMode
{
  return 0;
}

- (unint64_t)audioChannelCount
{
  return 1;
}

- (unint64_t)preferredMediaBitRate
{
  return 128000;
}

- (unsigned)featureListStringType
{
  return 0;
}

- (NSDictionary)featureListString
{
  id v2 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:[(AVCMediaStreamNegotiatorSettings *)self featureListStringType]];

  return (NSDictionary *)v2;
}

- (int)connectionType
{
  return 4;
}

+ (id)negotiatorSettingsForMode:(int64_t)a3 deviceRole:(unsigned __int8)a4 options:(id)a5 errorString:(id *)a6
{
  if ((unint64_t)(a3 - 1) >= 0xA)
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to init AVCMediaStreamNegotiatorSettings for mode=%ld", a4, a5, a3);
  }
  else
  {
    v8 = (void *)[objc_alloc(*off_1E6DB8050[a3 - 1]) initWithOptions:a5 deviceRole:a4 error:a6];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to init AVCMediaStreamNegotiatorSettings for mode=%ld", a3);
    if (v8) {
      goto LABEL_6;
    }
  }
  v8 = 0;
  *a6 = v9;
LABEL_6:

  return v8;
}

+ (unint64_t)hdrModeWithNegotiatorInitOptions:(id)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t result = [a3 objectForKeyedSubscript:@"AVCMediaStreamNegotiatorHDRMode"];
  if (result) {
    return objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCMediaStreamNegotiatorHDRMode"), "unsignedIntValue");
  }
  return result;
}

- (VCVideoRuleCollections)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (VCVideoRuleCollections)screenRuleCollections
{
  return self->_screenRuleCollections;
}

- (VCMediaNegotiatorAudioConfiguration)audioConfiguration
{
  return self->_audioConfiguration;
}

- (unsigned)localSSRC
{
  return self->_localSSRC;
}

- (NSSet)hdrModesSupported
{
  return &self->_hdrModesSupported->super;
}

- (int64_t)mediaStreamDirection
{
  return self->_mediaStreamDirection;
}

- (BOOL)shouldSetJitterBufferMode
{
  return self->_shouldSetJitterBufferMode;
}

- (int64_t)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int64_t)a3
{
  self->_accessNetworkType = a3;
}

- (NSArray)hdrModePixelFormats
{
  return self->_hdrModePixelFormats;
}

- (int64_t)tilesPerFrame
{
  return self->_tilesPerFrame;
}

- (BOOL)shouldApply16AlignedAdjustment
{
  return self->_shouldApply16AlignedAdjustment;
}

- (BOOL)blackFrameOnClearScreenEnabled
{
  return self->_blackFrameOnClearScreenEnabled;
}

- (BOOL)blackFrameOnClearScreenEnabledDefault
{
  return self->_blackFrameOnClearScreenEnabledDefault;
}

- (BOOL)foveationIsSupported
{
  return self->_foveationIsSupported;
}

- (NSString)audioDeviceUID
{
  return self->_audioDeviceUID;
}

@end