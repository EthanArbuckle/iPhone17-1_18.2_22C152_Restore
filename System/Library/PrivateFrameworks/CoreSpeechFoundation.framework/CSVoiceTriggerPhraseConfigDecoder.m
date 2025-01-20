@interface CSVoiceTriggerPhraseConfigDecoder
+ (float)adjustTwoShotDelay:(float)a3;
+ (float)defaultRemoraTwoShotDelay;
+ (float)defaultTwoShotDelay;
+ (id)decodeConfigFrom:(id)a3 category:(id)a4;
+ (id)decodeConfigV1:(id)a3 category:(id)a4;
+ (id)decodeConfigV2:(id)a3 category:(id)a4;
+ (id)twoShotDelayConfigKey;
@end

@implementation CSVoiceTriggerPhraseConfigDecoder

+ (float)adjustTwoShotDelay:(float)a3
{
  float result = a3 + -0.5;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

+ (id)twoShotDelayConfigKey
{
  if (+[CSUtils isDarwinOS] || AFPreferencesStartAlertEnabled()) {
    return @"twoShotFeedbackDelayBeep";
  }
  else {
    return @"twoShotFeedbackDelayPhatic";
  }
}

+ (float)defaultTwoShotDelay
{
  if (!+[CSUtils isDarwinOS]) {
    AFPreferencesStartAlertEnabled();
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  float result = 2.0;
  if (!CSIsHorseman_isHorseman) {
    return 1.5;
  }
  return result;
}

+ (float)defaultRemoraTwoShotDelay
{
  return 2.0;
}

+ (id)decodeConfigV1:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 getNumberForKey:@"threshold" category:v6 default:&unk_1F13B8528];
  [v8 floatValue];
  int v10 = v9;

  LODWORD(v11) = v10;
  v12 = [NSNumber numberWithFloat:v11];
  v13 = [v7 getNumberForKey:@"2ndChanceThreshold" category:v6 default:v12];
  [v13 floatValue];
  int v57 = v14;

  v55 = [CSVoiceTriggerPhraseConfig alloc];
  v59 = [v7 getNumberForKey:@"loggingThreshold" category:v6 default:&unk_1F13B8528];
  [v59 floatValue];
  int v53 = v15;
  v58 = [v7 getNumberForKey:@"ndapiScaleFactor" category:v6 default:&unk_1F13B8538];
  [v58 floatValue];
  int v17 = v16;
  v56 = [v7 getNumberForKey:@"recognizerThresholdOffset" category:v6 default:&unk_1F13B8548];
  [v56 floatValue];
  int v19 = v18;
  v54 = [v7 getNumberForKey:@"recognizerScoreScaleFactor" category:v6 default:&unk_1F13B8538];
  [v54 floatValue];
  int v21 = v20;
  v52 = [v7 getStringForKey:@"recognizerToken" category:v6 default:@"hey_Siri"];
  v22 = [a1 twoShotDelayConfigKey];
  v23 = NSNumber;
  [a1 defaultTwoShotDelay];
  v24 = objc_msgSend(v23, "numberWithFloat:");
  v25 = [v7 getNumberForKey:v22 category:v6 default:v24];
  [v25 floatValue];
  objc_msgSend(a1, "adjustTwoShotDelay:");
  int v27 = v26;
  v28 = NSNumber;
  [a1 defaultRemoraTwoShotDelay];
  v29 = objc_msgSend(v28, "numberWithFloat:");
  v30 = [v7 getNumberForKey:@"twoShotFeedbackDelayPhaticRemora" category:v6 default:v29];
  [v30 floatValue];
  objc_msgSend(a1, "adjustTwoShotDelay:");
  int v32 = v31;
  v33 = [v7 getNumberForKey:@"rejectLoggingThreshold" category:v6 default:&unk_1F13B8528];
  [v33 floatValue];
  unsigned int v35 = v34;
  v36 = [v7 getNumberForKey:@"phsRejectLoggingThreshold" category:v6 default:&unk_1F13B8528];
  [v36 floatValue];
  unsigned int v38 = v37;
  v39 = [v7 getNumberForKey:@"preTriggerSilenceOffset" category:v6 default:&unk_1F13B8558];

  [v39 floatValue];
  LODWORD(v51) = v40;
  LODWORD(v41) = v10;
  LODWORD(v42) = v57;
  LODWORD(v43) = v53;
  LODWORD(v44) = v17;
  LODWORD(v45) = v19;
  LODWORD(v46) = v21;
  LODWORD(v47) = v27;
  LODWORD(v48) = v32;
  v49 = -[CSVoiceTriggerPhraseConfig initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:](v55, "initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:", @"Hey Siri", v52, v41, v42, v43, v44, v45, v46, v47, v48, __PAIR64__(v38, v35), v51);

  return v49;
}

+ (id)decodeConfigV2:(id)a3 category:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 getValueForKey:@"phrase" category:v7];
  if (v8)
  {
    id v69 = v7;
    id v70 = v6;
    id v74 = [MEMORY[0x1E4F1CA48] array];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v68 = v8;
    id obj = v8;
    uint64_t v75 = [obj countByEnumeratingWithState:&v95 objects:v99 count:16];
    if (v75)
    {
      uint64_t v72 = *(void *)v96;
      id v73 = a1;
      do
      {
        for (uint64_t i = 0; i != v75; ++i)
        {
          if (*(void *)v96 != v72) {
            objc_enumerationMutation(obj);
          }
          int v10 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          double v11 = [v10 objectForKeyedSubscript:@"threshold"];
          if (v11)
          {
            v12 = [v10 objectForKeyedSubscript:@"threshold"];
            [v12 floatValue];
            int v14 = v13;
          }
          else
          {
            int v14 = 2139095040;
          }

          int v15 = [v10 objectForKeyedSubscript:@"2ndChanceThreshold"];
          int v16 = v14;
          if (v15)
          {
            int v17 = [v10 objectForKeyedSubscript:@"2ndChanceThreshold"];
            [v17 floatValue];
            int v16 = v18;
          }
          int v19 = [CSVoiceTriggerPhraseConfig alloc];
          uint64_t v20 = [v10 objectForKeyedSubscript:@"name"];
          int v21 = (void *)v20;
          v22 = @"Hey Siri";
          if (v20) {
            v22 = (__CFString *)v20;
          }
          v89 = v22;
          v92 = [v10 objectForKeyedSubscript:@"loggingThreshold"];
          if (v92)
          {
            v84 = [v10 objectForKeyedSubscript:@"loggingThreshold"];
            [v84 floatValue];
            int v88 = v23;
          }
          else
          {
            int v88 = 2139095040;
          }
          v94 = [v10 objectForKeyedSubscript:@"ndapiScaleFactor"];
          if (v94)
          {
            v83 = [v10 objectForKeyedSubscript:@"ndapiScaleFactor"];
            [v83 floatValue];
          }
          else
          {
            float v24 = 1.0;
          }
          float v86 = v24;
          v91 = [v10 objectForKeyedSubscript:@"recognizerThresholdOffset"];
          if (v91)
          {
            v82 = [v10 objectForKeyedSubscript:@"recognizerThresholdOffset"];
            [v82 floatValue];
            float v26 = v25;
          }
          else
          {
            float v26 = 0.5;
          }
          int v27 = [v10 objectForKeyedSubscript:@"recognizerScoreScaleFactor"];
          if (v27)
          {
            v81 = [v10 objectForKeyedSubscript:@"recognizerScoreScaleFactor"];
            [v81 floatValue];
            float v29 = v28;
          }
          else
          {
            float v29 = 1.0;
          }
          uint64_t v30 = [v10 objectForKeyedSubscript:@"recognizerToken"];
          int v31 = (void *)v30;
          int v32 = @"hey_Siri";
          if (v30) {
            int v32 = (__CFString *)v30;
          }
          v85 = v32;
          v87 = [a1 twoShotDelayConfigKey];
          v33 = objc_msgSend(v10, "objectForKeyedSubscript:");
          v90 = v19;
          if (v33)
          {
            v80 = [a1 twoShotDelayConfigKey];
            v76 = objc_msgSend(v10, "objectForKeyedSubscript:");
            [v76 floatValue];
          }
          else
          {
            [a1 defaultTwoShotDelay];
          }
          objc_msgSend(a1, "adjustTwoShotDelay:");
          int v35 = v34;
          v36 = [v10 objectForKeyedSubscript:@"twoShotFeedbackDelayPhaticRemora"];
          if (v36)
          {
            v79 = [v10 objectForKeyedSubscript:@"twoShotFeedbackDelayPhaticRemora"];
            [v79 floatValue];
          }
          else
          {
            LODWORD(v37) = 2.0;
          }
          [a1 adjustTwoShotDelay:v37];
          int v39 = v38;
          int v40 = [v10 objectForKeyedSubscript:@"rejectLoggingThreshold"];
          if (v40)
          {
            v78 = [v10 objectForKeyedSubscript:@"rejectLoggingThreshold"];
            [v78 floatValue];
            int v42 = v41;
          }
          else
          {
            int v42 = 2139095040;
          }
          double v43 = [v10 objectForKeyedSubscript:@"phsRejectLoggingThreshold"];
          v93 = v21;
          if (v43)
          {
            v77 = [v10 objectForKeyedSubscript:@"phsRejectLoggingThreshold"];
            [v77 floatValue];
            int v45 = v44;
          }
          else
          {
            int v45 = 2139095040;
          }
          double v46 = [v10 objectForKeyedSubscript:@"preTriggerSilenceOffset"];
          if (v46)
          {
            v55 = [v10 objectForKeyedSubscript:@"preTriggerSilenceOffset"];
            [v55 floatValue];
            LODWORD(v67) = v56;
            LODWORD(v57) = v14;
            LODWORD(v58) = v16;
            LODWORD(v59) = v88;
            *(float *)&double v60 = v86;
            *(float *)&double v61 = v26;
            *(float *)&double v62 = v29;
            LODWORD(v63) = v35;
            LODWORD(v64) = v39;
            v65 = -[CSVoiceTriggerPhraseConfig initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:](v90, "initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:", v89, v85, v57, v58, v59, v60, v61, v62, v63, v64, __PAIR64__(v45, v42), v67);
          }
          else
          {
            LODWORD(v67) = 0;
            LODWORD(v47) = v14;
            LODWORD(v48) = v16;
            LODWORD(v49) = v88;
            *(float *)&double v50 = v86;
            *(float *)&double v51 = v26;
            *(float *)&double v52 = v29;
            LODWORD(v53) = v35;
            LODWORD(v54) = v39;
            v65 = -[CSVoiceTriggerPhraseConfig initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:](v90, "initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:", v89, v85, v47, v48, v49, v50, v51, v52, v53, v54, __PAIR64__(v45, v42), v67);
          }

          if (v43) {
          a1 = v73;
          }
          if (v40) {

          }
          if (v36) {
          if (v33)
          }
          {
          }
          if (v27) {

          }
          if (v91) {
          if (v94)
          }

          if (v92) {
          [v74 addObject:v65];
          }
        }
        uint64_t v75 = [obj countByEnumeratingWithState:&v95 objects:v99 count:16];
      }
      while (v75);
    }

    id v7 = v69;
    id v6 = v70;
    v8 = v68;
  }
  else
  {
    id v74 = 0;
  }

  return v74;
}

+ (id)decodeConfigFrom:(id)a3 category:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if ([v7 containsKey:@"phrase" category:v6])
  {
    v8 = [a1 decodeConfigV2:v7 category:v6];
  }
  else
  {
    int v9 = [a1 decodeConfigV1:v7 category:v6];

    v11[0] = v9;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  return v8;
}

@end