@interface CSVoiceTriggerSecondPassConfigDecoder
+ (BOOL)decodeUseKeywordSpotting:(id)a3 fromCategory:(id)a4;
+ (BOOL)decodeUseRecognizerCombination:(id)a3 fromCategory:(id)a4;
+ (BOOL)decodeuseTimeBasedTriggerLength:(id)a3 fromCategory:(id)a4;
+ (float)decodePreTriggerAudioTime:(id)a3 fromCategory:(id)a4;
+ (float)decodePrependingAudioTime:(id)a3 fromCategory:(id)a4;
+ (float)decodeTrailingAudioTime:(id)a3 fromCategory:(id)a4;
+ (id)categoryForFirstPass:(unint64_t)a3;
+ (id)decodeConfigFileNDAPI:(id)a3 fromCategory:(id)a4;
+ (id)decodeConfigFileRecognizer:(id)a3 fromCategory:(id)a4;
+ (id)decodeConfigFrom:(id)a3 forFirstPassSource:(unint64_t)a4;
+ (id)decodeQuasarCheckerResultCutOffCount:(id)a3 fromCategory:(id)a4;
+ (id)decodeWearerDetectionConfig:(id)a3 fromCategory:(id)a4;
+ (id)fetchAllVoiceTriggerSecondPassRecognizer:(id)a3;
+ (id)getDefaultRecognizerForB238;
+ (id)getDefaultRecognizerNameForB238;
@end

@implementation CSVoiceTriggerSecondPassConfigDecoder

+ (id)getDefaultRecognizerNameForB238
{
  return @"recognizerB238.json";
}

+ (id)getDefaultRecognizerForB238
{
  return @"configFileRecognizerB238";
}

+ (id)fetchAllVoiceTriggerSecondPassRecognizer:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [a3 resourcePath];
  v4 = +[CSAsset getConfigFileNameForAssetType:0];
  v5 = [v3 stringByAppendingPathComponent:v4];
  v6 = 0;
  if (+[CSUtils horsemanDeviceType] != 1
    || (+[CSUtils readValuesFromJsonFile:keyword:](CSUtils, "readValuesFromJsonFile:keyword:", v5, @"configFileRecognizerB238"), v7 = objc_claimAutoreleasedReturnValue(), (v6 = v7) == 0)|| (v8 = v7, ![v7 count]))
  {
    v8 = +[CSUtils readValuesFromJsonFile:v5 keyword:@"configFileRecognizer"];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(v3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        v16 = [v15 stringByStandardizingPath];
        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  v17 = (void *)[v9 copy];
  return v17;
}

+ (id)decodeWearerDetectionConfig:(id)a3 fromCategory:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 getNumberForKey:@"remoteVADThreshold" category:v5 default:&unk_1F13B8668];
  [v7 floatValue];
  int v9 = v8;

  id v10 = [v6 getNumberForKey:@"minimumPhraseLengthForVADGating" category:v5 default:&unk_1F13B8678];
  [v10 floatValue];
  int v12 = v11;

  uint64_t v13 = [v6 getNumberForKey:@"secondPassShadowMicScoreThresholdForVADGating" category:v5 default:&unk_1F13B8688];
  [v13 floatValue];
  int v15 = v14;

  v16 = [v6 getNumberForKey:@"remoteVADMyriadThreshold" category:v5 default:&unk_1F13B8668];
  [v16 floatValue];
  int v18 = v17;

  long long v19 = [v6 getValueForKey:v5 category:@"phrasesToSkipBoronDecisionMaking"];

  long long v20 = [CSVoiceTriggerAirPodWearerDetectionConfig alloc];
  LODWORD(v21) = v9;
  LODWORD(v22) = v12;
  LODWORD(v23) = v15;
  LODWORD(v24) = v18;
  v25 = [(CSVoiceTriggerAirPodWearerDetectionConfig *)v20 initWithThreshold:v19 minimumPhraseLength:v21 shadowMicScoreThreshold:v22 myriadThreshold:v23 phrasesToSkipBoronDecisionMaking:v24];

  return v25;
}

+ (BOOL)decodeUseKeywordSpotting:(id)a3 fromCategory:(id)a4
{
  v4 = [a3 getNumberForKey:@"useKeywordSpotting" category:a4 default:MEMORY[0x1E4F1CC28]];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (id)decodeConfigFileRecognizer:(id)a3 fromCategory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 resourcePath];
  if (+[CSUtils horsemanDeviceType] != 1
    || ([v5 getStringForKey:@"configFileRecognizerB238" category:v6 default:0],
        (int v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v8 = [v5 getStringForKey:@"configFileRecognizer" category:v6 default:@"recognizer.json"];
  }
  int v9 = [v7 stringByAppendingPathComponent:v8];

  return v9;
}

+ (BOOL)decodeUseRecognizerCombination:(id)a3 fromCategory:(id)a4
{
  return [a3 containsKey:@"configFileRecognizer" category:a4];
}

+ (id)decodeConfigFileNDAPI:(id)a3 fromCategory:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 resourcePath];
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    int v8 = @"config_marsh.txt";
  }
  else {
    int v8 = @"config.txt";
  }
  int v9 = [v6 getStringForKey:@"configFileNDAPI" category:v5 default:v8];

  id v10 = [v7 stringByAppendingPathComponent:v9];

  return v10;
}

+ (float)decodeTrailingAudioTime:(id)a3 fromCategory:(id)a4
{
  v4 = [a3 getNumberForKey:@"analyzerTrailingAudioTime" category:a4 default:&unk_1F13B8658];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

+ (float)decodePrependingAudioTime:(id)a3 fromCategory:(id)a4
{
  v4 = [a3 getNumberForKey:@"analyzerPrependingAudioTime" category:a4 default:&unk_1F13B8648];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

+ (float)decodePreTriggerAudioTime:(id)a3 fromCategory:(id)a4
{
  v4 = [a3 getNumberForKey:@"preTriggerAudioTime" category:a4 default:&unk_1F13B8648];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

+ (id)decodeQuasarCheckerResultCutOffCount:(id)a3 fromCategory:(id)a4
{
  v4 = [a3 getNumberForKey:@"quasarCheckerResultCutOffTime" category:a4 default:&unk_1F13B8638];
  [v4 floatValue];
  float v6 = v5;

  v7 = NSNumber;
  +[CSConfig inputRecordingSampleRate];
  *(float *)&double v8 = v6 * *(float *)&v8;
  return (id)[v7 numberWithFloat:v8];
}

+ (BOOL)decodeuseTimeBasedTriggerLength:(id)a3 fromCategory:(id)a4
{
  return [a3 getBoolForKey:@"useTimeBaseTriggerLength" category:a4 default:0];
}

+ (id)decodeConfigFrom:(id)a3 forFirstPassSource:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 categoryForFirstPass:a4];
  if (([v6 containsCategory:v7] & 1) == 0)
  {

    double v8 = CSLogCategoryVT;
    v7 = @"voiceTriggerSecondPass";
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "+[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:forFirstPassSource:]";
      __int16 v31 = 2114;
      v32 = @"voiceTriggerSecondPass";
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s CategoryKey %{public}@ not found, falling back to default", buf, 0x16u);
    }
  }
  int v9 = [CSVoiceTriggerSecondPassConfig alloc];
  [a1 decodePreTriggerAudioTime:v6 fromCategory:v7];
  int v11 = v10;
  [a1 decodePrependingAudioTime:v6 fromCategory:v7];
  int v13 = v12;
  [a1 decodeTrailingAudioTime:v6 fromCategory:v7];
  int v15 = v14;
  v28 = [v6 resourcePath];
  v16 = [a1 decodeConfigFileNDAPI:v6 fromCategory:v7];
  HIDWORD(v27) = [a1 decodeUseRecognizerCombination:v6 fromCategory:v7];
  int v17 = [a1 decodeConfigFileRecognizer:v6 fromCategory:v7];
  uint64_t v18 = [a1 decodeUseKeywordSpotting:v6 fromCategory:v7];
  long long v19 = +[CSVoiceTriggerPhraseConfigDecoder decodeConfigFrom:v6 category:v7];
  long long v20 = [a1 decodeWearerDetectionConfig:v6 fromCategory:v7];
  double v21 = [a1 decodeQuasarCheckerResultCutOffCount:v6 fromCategory:v7];
  LOBYTE(v27) = [a1 decodeuseTimeBasedTriggerLength:v6 fromCategory:v7];
  LODWORD(v22) = v11;
  LODWORD(v23) = v13;
  LODWORD(v24) = v15;
  v25 = [(CSVoiceTriggerSecondPassConfig *)v9 initWithPreTriggerAudioTime:v28 prependingAudioTime:v16 trailingAudioTime:HIDWORD(v27) resourcePath:v17 configPathNDAPI:v18 useRecognizerCombination:v19 configPathRecognizer:v22 useKeywordSpotting:v23 phraseConfigs:v24 wearerDetectionConfig:v20 quasarCheckerResultCutOffCount:v21 useTimeBasedTriggerLength:v27];

  return v25;
}

+ (id)categoryForFirstPass:(unint64_t)a3
{
  id result = @"voiceTriggerSecondPassAP";
  switch(a3)
  {
    case 1uLL:
      return result;
    case 2uLL:
      id result = @"voiceTriggerSecondPassAOP";
      break;
    case 3uLL:
    case 6uLL:
      id result = @"voiceTriggerSecondPassHearst";
      break;
    case 4uLL:
      id result = @"voiceTriggerSecondPassJarvis";
      break;
    case 5uLL:
      if (+[CSUtils supportCompactPlus]) {
        id result = @"voiceTriggerSecondPassPlus";
      }
      else {
        id result = @"voiceTriggerSecondPass";
      }
      break;
    case 7uLL:
      id result = @"voiceTriggerSecondPassRemora";
      break;
    case 8uLL:
      id result = @"voiceTriggerSecondPassDuringRingtone";
      break;
    case 9uLL:
      id result = @"voiceTriggerSecondPassDuringConnectedCall";
      break;
    case 0xAuLL:
      id result = @"voiceTriggerSecondPassEnrollment";
      break;
    default:
      id result = @"voiceTriggerSecondPass";
      break;
  }
  return result;
}

@end