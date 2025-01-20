@interface VCVideoRuleCollectionsMediaRecorderEmbeded
+ (id)sharedInstance;
- (BOOL)isSupportedChipID;
- (BOOL)isSupportedDeviceClass;
- (VCVideoRuleCollectionsMediaRecorderEmbeded)initWithHardwareSettings:(id)a3;
- (id)mediaRecorderImageTypes;
- (id)mediaRecorderVideoCodecs;
- (unsigned)mediaRecorderCapabilities;
- (void)isSupportedDeviceClass;
@end

@implementation VCVideoRuleCollectionsMediaRecorderEmbeded

- (VCVideoRuleCollectionsMediaRecorderEmbeded)initWithHardwareSettings:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoRuleCollectionsMediaRecorderEmbeded;
  result = [(VCVideoRuleCollectionsMediaRecorder *)&v5 init];
  if (result) {
    result->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
  }
  return result;
}

+ (id)sharedInstance
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!sharedInstance__videoRulesCollections_28) {
    sharedInstance__videoRulesCollections_28 = [[VCVideoRuleCollectionsMediaRecorderEmbeded alloc] initWithHardwareSettings:+[VCHardwareSettingsEmbedded sharedInstance]];
  }
  objc_sync_exit(v2);
  return (id)sharedInstance__videoRulesCollections_28;
}

- (unsigned)mediaRecorderCapabilities
{
  if ([(VCVideoRuleCollectionsMediaRecorderEmbeded *)self isSupportedDeviceClass]
    && [(VCVideoRuleCollectionsMediaRecorderEmbeded *)self isSupportedChipID])
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (id)mediaRecorderImageTypes
{
  if (![(VCVideoRuleCollectionsMediaRecorderEmbeded *)self isSupportedDeviceClass]
    || ![(VCVideoRuleCollectionsMediaRecorderEmbeded *)self isSupportedChipID])
  {
    return 0;
  }
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", &unk_1F3DC4D28, 0);
  v4 = v3;
  if (self->super._isHEIFAndHEVCFormatEnabled) {
    [v3 addObject:&unk_1F3DC4D40];
  }
  return v4;
}

- (id)mediaRecorderVideoCodecs
{
  if (![(VCVideoRuleCollectionsMediaRecorderEmbeded *)self isSupportedDeviceClass]
    || ![(VCVideoRuleCollectionsMediaRecorderEmbeded *)self isSupportedChipID])
  {
    return 0;
  }
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", &unk_1F3DC4CF8, 0);
  if ([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings supportHEVC]
    && self->super._isHEIFAndHEVCFormatEnabled)
  {
    [v3 addObject:&unk_1F3DC4D10];
  }
  return v3;
}

- (BOOL)isSupportedDeviceClass
{
  p_hardwareSettings = &self->_hardwareSettings;
  uint64_t v3 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass];
  if (unint64_t)(v3 - 1) < 8 && ((0x8Fu >> (v3 - 1)))
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_6;
  }
  uint64_t v4 = VRTraceErrorLogLevelToCSTR();
  objc_super v5 = *MEMORY[0x1E4F47A50];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v6)
  {
    [(VCVideoRuleCollectionsMediaRecorderEmbeded *)v4 isSupportedDeviceClass];
LABEL_6:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isSupportedChipID
{
  uint64_t v2 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings chipId];
  return v2 != 35152 && v2 != 35157;
}

- (void)isSupportedDeviceClass
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = [*a2 deviceClass];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  v9 = "-[VCVideoRuleCollectionsMediaRecorderEmbeded isSupportedDeviceClass]";
  __int16 v10 = 1024;
  int v11 = 167;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d No media recorder supported for device class %d", (uint8_t *)&v6, 0x22u);
}

@end