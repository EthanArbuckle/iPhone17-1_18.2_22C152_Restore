@interface AVCMediaStreamNegotiatorSettingsRemoteDesktopScreenSharing
- (AVCMediaStreamNegotiatorSettingsRemoteDesktopScreenSharing)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)rtcpTimeOutEnabled;
- (double)rtcpSendInterval;
- (double)rtcpTimeOutInterval;
- (int)connectionType;
- (int)operatingMode;
- (int64_t)captureSource;
- (int64_t)videoStreamMode;
- (unint64_t)maxBandwidth;
- (unint64_t)minBandwidth;
- (unsigned)featureListStringType;
- (unsigned)jitterBufferMode;
@end

@implementation AVCMediaStreamNegotiatorSettingsRemoteDesktopScreenSharing

- (AVCMediaStreamNegotiatorSettingsRemoteDesktopScreenSharing)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)AVCMediaStreamNegotiatorSettingsRemoteDesktopScreenSharing;
  v8 = [(AVCMediaStreamNegotiatorSettings *)&v16 init];
  if (!v8) {
    return v8;
  }
  if (v6 == 1 && [a3 objectForKey:@"AVCMediaStreamNegotiatorAccessNetworkType"])
  {
    v9 = (void *)[a3 objectForKeyedSubscript:@"AVCMediaStreamNegotiatorAccessNetworkType"];
    if (!v9)
    {
      v15 = @"cannot get accessNetworkType from Init options";
      goto LABEL_16;
    }
    v8->super._accessNetworkType = (int)[v9 intValue];
  }
  v10 = +[VCVideoRuleCollectionsScreenAirplay sharedInstance];
  v8->super._screenRuleCollections = &v10->super;
  if (v10)
  {
    v8->super._tilesPerFrame = 4;
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8->super._hdrModesSupported = v11;
    if (v11)
    {
      [(NSMutableSet *)v11 addObject:&unk_1F3DC60F0];
      unint64_t v12 = +[AVCMediaStreamNegotiatorSettings hdrModeWithNegotiatorInitOptions:a3];
      -[NSMutableSet addObject:](v8->super._hdrModesSupported, "addObject:", [NSNumber numberWithUnsignedInteger:v12]);
      if (v6 == 1) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 1;
      }
      v8->super._mediaStreamDirection = v13;
      v8->super._shouldSetJitterBufferMode = 1;
      v8->super._blackFrameOnClearScreenEnabledDefault = 1;
      v8->super._blackFrameOnClearScreenEnabled = 1;
      return v8;
    }
    v15 = @"_hdrModesSupported creation failed";
  }
  else
  {
    v15 = @"no _screenRuleCollections is created";
  }
LABEL_16:
  if (a5) {
    *a5 = v15;
  }

  return 0;
}

- (int64_t)videoStreamMode
{
  return 4;
}

- (int64_t)captureSource
{
  return 1;
}

- (int)operatingMode
{
  return 9;
}

- (unint64_t)minBandwidth
{
  return 20000000;
}

- (unint64_t)maxBandwidth
{
  return 60000000;
}

- (BOOL)rtcpTimeOutEnabled
{
  return 1;
}

- (double)rtcpTimeOutInterval
{
  return 3.0;
}

- (double)rtcpSendInterval
{
  return 1.0;
}

- (int)connectionType
{
  return 7;
}

- (unsigned)jitterBufferMode
{
  return 0;
}

- (unsigned)featureListStringType
{
  return 4;
}

@end