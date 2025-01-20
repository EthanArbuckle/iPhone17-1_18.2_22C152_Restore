@interface CSVoiceTriggerFirstPassConfigDecoder
+ (id)decodeConfigFrom:(id)a3;
@end

@implementation CSVoiceTriggerFirstPassConfigDecoder

+ (id)decodeConfigFrom:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 resourcePath];
  v5 = [v3 getStringForKey:@"configFileNDAPI" category:@"voiceTriggerFirstPass" default:@"config.txt"];
  v6 = CSLogCategoryVT;
  if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 136315394;
    v37 = "+[CSVoiceTriggerFirstPassConfigDecoder decodeConfigFrom:]";
    __int16 v38 = 2112;
    v39 = v5;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Loading 1stPass-config=%@", (uint8_t *)&v36, 0x16u);
  }
  v7 = [v3 getNumberForKey:@"threshold" category:@"voiceTriggerFirstPass" default:&unk_1F13B85C8];
  [v7 floatValue];
  int v9 = v8;

  v10 = [v3 getNumberForKey:@"delaySecondsForChannelSelection" category:@"voiceTriggerFirstPass" default:&unk_1F13B85D8];
  [v10 floatValue];
  int v12 = v11;

  v13 = [v3 getNumberForKey:@"masterChannelScoreBoost" category:@"voiceTriggerFirstPass" default:&unk_1F13B85D8];
  [v13 floatValue];
  int v15 = v14;

  v16 = [v3 getNumberForKey:@"voiceIsolationChannelScoreBoost" category:@"voiceTriggerFirstPass" default:&unk_1F13B85D8];
  [v16 floatValue];
  int v18 = v17;

  v19 = [v3 getNumberForKey:@"processingChunkSeconds" category:@"voiceTriggerFirstPass" default:&unk_1F13B85E8];
  [v19 floatValue];
  int v21 = v20;

  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  uint64_t v22 = (CSIsHorseman_isHorseman - 1);
  if (CSIsHorseman_isHorseman) {
    uint64_t v23 = 15;
  }
  else {
    uint64_t v23 = 1;
  }
  v24 = [NSNumber numberWithUnsignedLongLong:v23];
  v25 = [v3 getNumberForKey:@"processingChannelsBitset" category:@"voiceTriggerFirstPass" default:v24];
  uint64_t v26 = [v25 unsignedLongLongValue];

  v27 = [CSVoiceTriggerFirstPassConfig alloc];
  v28 = [v4 stringByAppendingPathComponent:v5];
  LODWORD(v29) = v9;
  LODWORD(v30) = v12;
  LODWORD(v31) = v15;
  LODWORD(v32) = v18;
  LODWORD(v33) = v21;
  v34 = [(CSVoiceTriggerFirstPassConfig *)v27 initWithConfigPathNDAPI:v28 threshold:v26 delaySecondsForChannelSelection:v22 masterChannelScoreBoost:0xFFFFFFFFLL voiceIsolationChannelScoreBoost:v29 processingChunkSeconds:v30 processingChannelsBitset:v31 masterChannel:v32 voiceIsolationChannel:v33];

  return v34;
}

@end