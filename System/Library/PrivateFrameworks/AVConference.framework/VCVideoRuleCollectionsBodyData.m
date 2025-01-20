@interface VCVideoRuleCollectionsBodyData
+ (void)addRulesForU1ToCollection:(id)a3;
@end

@implementation VCVideoRuleCollectionsBodyData

+ (void)addRulesForU1ToCollection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [&unk_1F3DC7890 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(&unk_1F3DC7890);
        }
        uint64_t v8 = [*(id *)(*((void *)&v17 + 1) + 8 * i) intValue];
        v9 = [VCVideoRule alloc];
        LODWORD(v10) = 30.0;
        uint64_t v11 = [(VCVideoRule *)v9 initWithFrameWidth:480 frameHeight:480 frameRate:v8 payload:v10];
        if (!v11)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              +[VCVideoRuleCollectionsBodyData addRulesForU1ToCollection:v15];
            }
          }
          return;
        }
        v12 = (void *)v11;
        uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
        [a3 addVideoRules:v13 transportType:1 payload:v8 encodingType:1];
        [a3 addVideoRules:v13 transportType:1 payload:v8 encodingType:2];
      }
      uint64_t v5 = [&unk_1F3DC7890 countByEnumeratingWithState:&v17 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
}

+ (void)addRulesForU1ToCollection:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = "+[VCVideoRuleCollectionsBodyData addRulesForU1ToCollection:]";
  __int16 v7 = 1024;
  int v8 = 19;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate rule for instance=%@", (uint8_t *)&v3, 0x26u);
}

@end