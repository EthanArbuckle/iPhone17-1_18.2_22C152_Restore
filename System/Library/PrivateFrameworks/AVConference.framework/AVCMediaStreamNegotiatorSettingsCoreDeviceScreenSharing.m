@interface AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing
- (AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5;
- (id)featureListString;
- (int)connectionType;
- (int)operatingMode;
- (int64_t)captureSource;
- (int64_t)videoStreamMode;
- (unint64_t)maxBandwidth;
- (unint64_t)minBandwidth;
- (unsigned)jitterBufferMode;
- (void)featureListString;
@end

@implementation AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing

- (AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing;
  v8 = [(AVCMediaStreamNegotiatorSettings *)&v14 init];
  if (!v8) {
    return v8;
  }
  if (v6 == 1 && [a3 objectForKey:@"AVCMediaStreamNegotiatorAccessNetworkType"])
  {
    v9 = (void *)[a3 objectForKeyedSubscript:@"AVCMediaStreamNegotiatorAccessNetworkType"];
    if (!v9)
    {
      v13 = @"cannot get accessNetworkType from Init options";
      goto LABEL_14;
    }
    v8->super._accessNetworkType = (int)[v9 intValue];
  }
  v10 = +[VCVideoRuleCollectionsScreenAirplay sharedInstance];
  v8->super._screenRuleCollections = &v10->super;
  if (v10)
  {
    if (v6 == 1) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    v8->super._mediaStreamDirection = v11;
    v8->super._shouldSetJitterBufferMode = 1;
    v8->super._shouldApply16AlignedAdjustment = 1;
    v8->super._blackFrameOnClearScreenEnabledDefault = 1;
    v8->super._blackFrameOnClearScreenEnabled = 1;
    return v8;
  }
  v13 = @"no _screenRuleCollections is created";
LABEL_14:
  if (a5) {
    *a5 = v13;
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
  return 6;
}

- (unint64_t)minBandwidth
{
  return 333000;
}

- (unint64_t)maxBandwidth
{
  return 6000000;
}

- (int)connectionType
{
  return 3;
}

- (unsigned)jitterBufferMode
{
  return [(AVCMediaStreamNegotiatorSettings *)self accessNetworkType] != 1;
}

- (id)featureListString
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8 = 0;
  if (VCPCodecCopyProperties())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing featureListString](v6);
      }
    }
    goto LABEL_14;
  }
  uint64_t v3 = objc_opt_new();
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing featureListString](v7);
      }
    }
LABEL_14:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = (void *)v3;
  if (-[NSMutableArray containsObject:](-[VCVideoRuleCollections supportedPayloads](self->super._screenRuleCollections, "supportedPayloads"), "containsObject:", &unk_1F3DC4608))objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(0, "objectForKey:", @"VCPCodec_AVC1"), &unk_1F3DC4608); {
  if (-[NSMutableArray containsObject:](-[VCVideoRuleCollections supportedPayloads](self->super._screenRuleCollections, "supportedPayloads", 0, v9), "containsObject:", &unk_1F3DC4620))objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKey:", @"VCPCodec_LRP"), &unk_1F3DC4620);
  }
LABEL_7:

  return v4;
}

- (void)featureListString
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 85;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to get feature list string from VCP", (uint8_t *)&v2, 0x1Cu);
}

@end