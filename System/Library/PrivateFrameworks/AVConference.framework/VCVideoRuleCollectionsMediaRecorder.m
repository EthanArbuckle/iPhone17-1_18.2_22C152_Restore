@interface VCVideoRuleCollectionsMediaRecorder
+ (id)sharedInstance;
- (VCVideoRuleCollectionsMediaRecorder)init;
- (id)mediaRecorderImageTypes;
- (id)mediaRecorderVideoCodecs;
- (unsigned)mediaRecorderCapabilities;
@end

@implementation VCVideoRuleCollectionsMediaRecorder

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsMediaRecorderEmbeded sharedInstance];
}

- (VCVideoRuleCollectionsMediaRecorder)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCVideoRuleCollectionsMediaRecorder;
  v2 = [(VCVideoRuleCollectionsMediaRecorder *)&v14 init];
  if (v2)
  {
    unsigned int v3 = +[GKSConnectivitySettings getAbTestMasterLocalSwitches] & 0x2000;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v5 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        v18 = "-[VCVideoRuleCollectionsMediaRecorder init]";
        __int16 v19 = 1024;
        int v20 = 35;
        __int16 v21 = 1024;
        unsigned int v22 = v3 >> 13;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch heifHevcLivePhotosEnabled %d", buf, 0x22u);
      }
    }
    BOOL v8 = [+[VCDefaults sharedInstance] enableHEIFAndHEVCForMoments];
    if (v3) {
      BOOL v9 = v8;
    }
    else {
      BOOL v9 = 0;
    }
    v2->_BOOL isHEIFAndHEVCFormatEnabled = v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isHEIFAndHEVCFormatEnabled = v2->_isHEIFAndHEVCFormatEnabled;
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        v18 = "-[VCVideoRuleCollectionsMediaRecorder init]";
        __int16 v19 = 1024;
        int v20 = 38;
        __int16 v21 = 1024;
        unsigned int v22 = isHEIFAndHEVCFormatEnabled;
        __int16 v23 = 1024;
        unsigned int v24 = v3 >> 13;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing media recorder rule collections with HEIF and HEVC enabled:%d and the storebag settings value was: %d", buf, 0x28u);
      }
    }
  }
  return v2;
}

- (unsigned)mediaRecorderCapabilities
{
  return 0;
}

- (id)mediaRecorderImageTypes
{
  return 0;
}

- (id)mediaRecorderVideoCodecs
{
  return 0;
}

@end