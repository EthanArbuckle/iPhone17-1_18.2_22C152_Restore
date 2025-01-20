@interface AVCMediaStreamNegotiatorSettingsiPadCompanion
- (AVCMediaStreamNegotiatorSettingsiPadCompanion)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5;
- (int)operatingMode;
- (int64_t)captureSource;
- (int64_t)videoStreamMode;
- (unint64_t)maxBandwidth;
- (unsigned)featureListStringType;
- (void)dealloc;
@end

@implementation AVCMediaStreamNegotiatorSettingsiPadCompanion

- (AVCMediaStreamNegotiatorSettingsiPadCompanion)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)AVCMediaStreamNegotiatorSettingsiPadCompanion;
  v8 = [(AVCMediaStreamNegotiatorSettings *)&v17 init];
  if (!v8) {
    return v8;
  }
  v9 = +[VCVideoRuleCollectionsScreenSecondary sharedInstance];
  v8->super._screenRuleCollections = &v9->super;
  if (v9)
  {
    v8->super._tilesPerFrame = +[VCVideoRuleCollectionsScreenSecondary tilesPerFrame];
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8->super._hdrModesSupported = v10;
    if (v10)
    {
      [(NSMutableSet *)v10 addObject:&unk_1F3DC4C08];
      int v11 = VCFeatureFlagManager_FoveationEnabled();
      if (v11) {
        LOBYTE(v11) = +[VCHardwareSettings supportsFoveation];
      }
      v8->super._foveationIsSupported = v11;
      if (v6 == 2)
      {
        v8->super._mediaStreamDirection = 2;
        if (+[AVCMediaStreamNegotiatorSettings hdrModeWithNegotiatorInitOptions:a3] == 3)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v19 = v12;
              __int16 v20 = 2080;
              v21 = "-[AVCMediaStreamNegotiatorSettingsiPadCompanion initWithOptions:deviceRole:error:]";
              __int16 v22 = 1024;
              int v23 = 371;
              _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HDR10Reference mode enabled on answerer", buf, 0x1Cu);
            }
          }
          [(NSMutableSet *)v8->super._hdrModesSupported addObject:&unk_1F3DC4C50];
          v8->super._hdrModePixelFormats = (NSArray *)&unk_1F3DC7848;
          id v14 = &unk_1F3DC7848;
        }
      }
      else if (v6 == 1)
      {
        v8->super._mediaStreamDirection = 1;
      }
      return v8;
    }
    v16 = @"no _hdrModesSupported ivar is created";
  }
  else
  {
    v16 = @"no _screenRuleCollections is created";
  }
  if (a5) {
    *a5 = v16;
  }

  return 0;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCMediaStreamNegotiatorSettingsiPadCompanion;
  [(AVCMediaStreamNegotiatorSettings *)&v3 dealloc];
}

- (int64_t)videoStreamMode
{
  return 1;
}

- (int64_t)captureSource
{
  return 1;
}

- (int)operatingMode
{
  return 8;
}

- (unint64_t)maxBandwidth
{
  if (self->super._foveationIsSupported) {
    return 60000000;
  }
  else {
    return 40000000;
  }
}

- (unsigned)featureListStringType
{
  return 3;
}

@end