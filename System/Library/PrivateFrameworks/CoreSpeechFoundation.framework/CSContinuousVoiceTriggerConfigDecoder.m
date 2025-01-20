@interface CSContinuousVoiceTriggerConfigDecoder
+ (id)decodeConfigFrom:(id)a3;
@end

@implementation CSContinuousVoiceTriggerConfigDecoder

+ (id)decodeConfigFrom:(id)a3
{
  id v3 = a3;
  v4 = [v3 resourcePath];
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    v5 = @"config_marsh.txt";
  }
  else {
    v5 = @"config.txt";
  }
  v6 = [v3 getStringForKey:@"configFileNDAPI" category:@"continuousVoiceTrigger" default:v5];
  v7 = [v3 getNumberForKey:@"threshold" category:@"continuousVoiceTrigger" default:&unk_1F13B8588];
  [v7 floatValue];
  int v9 = v8;

  v10 = [v3 getNumberForKey:@"loggingThreshold" category:@"continuousVoiceTrigger" default:&unk_1F13B8588];
  [v10 floatValue];
  int v12 = v11;

  v13 = [v3 getNumberForKey:@"twoShotThreshold" category:@"continuousVoiceTrigger" default:&unk_1F13B8598];
  [v13 floatValue];
  int v15 = v14;

  v16 = [v3 getNumberForKey:@"twoShotDecisionWaitTime" category:@"continuousVoiceTrigger" default:&unk_1F13B85A8];
  [v16 floatValue];
  int v18 = v17;

  v19 = [v3 getStringForKey:@"voiceTriggerPhraseIds" category:@"continuousVoiceTrigger" default:@"0"];
  v20 = [v3 getStringForKey:@"silencePhraseIds" category:@"continuousVoiceTrigger" default:@"1"];

  v21 = [v19 componentsSeparatedByString:@","];
  v22 = [v21 valueForKeyPath:@"self.integerValue"];

  if (v22 && [v22 count])
  {
    if (+[CSUtils supportMph])
    {
      id v23 = v22;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F1C978];
      v25 = [v22 firstObject];
      id v23 = [v24 arrayWithObject:v25];
    }
  }
  else
  {
    id v23 = 0;
  }
  v26 = [v20 componentsSeparatedByString:@","];
  v27 = [v26 valueForKeyPath:@"self.integerValue"];

  v28 = [CSContinuousVoiceTriggerConfig alloc];
  v29 = [v4 stringByAppendingPathComponent:v6];
  LODWORD(v30) = v9;
  LODWORD(v31) = v12;
  LODWORD(v32) = v15;
  LODWORD(v33) = v18;
  v34 = [(CSContinuousVoiceTriggerConfig *)v28 initWithConfigPathNDAPI:v29 threshold:v23 loggingThreshold:v27 twoShotThreshold:v30 twoShotDecisionWaitTime:v31 voiceTriggerPhIds:v32 silencePhIds:v33];

  return v34;
}

@end