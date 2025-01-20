@interface CSUtils
+ (BOOL)extractArchiveFromDirectory:(id)a3 toDir:(id)a4;
+ (BOOL)readAudioChunksFrom:(id)a3 block:(id)a4;
+ (id)distributionDictionary:(id)a3;
+ (id)getInputoriginFromRecordType:(id)a3 withAsset:(id)a4;
+ (id)timeStampString;
+ (unint64_t)getAssetTypeForNamespace:(id)a3;
+ (void)getTrialIdsForAssetType:(unint64_t)a3 withCompletion:(id)a4;
+ (void)logMitigationFeatures:(id)a3 forTask:(id)a4 withModelOutput:(id)a5 forMHRequestId:(id)a6 forRequestId:(id)a7;
@end

@implementation CSUtils

+ (id)getInputoriginFromRecordType:(id)a3 withAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isRequestFromTriggerless]) {
    unsigned int v7 = +[CSUtils supportMedocAnnounce];
  }
  else {
    unsigned int v7 = 0;
  }
  if (([v5 isBuiltInVoiceTriggered] & 1) != 0
    || [v5 isHearstVoiceTriggered]
    && ([v5 isRequestFromSpokenNotification] | v7) != 1
    || [v5 isDarwinVoiceTriggered])
  {
    v8 = [v5 activationMetadata];
    unsigned int v9 = [v6 isJSVoiceTrigger:v8];

    if (v9) {
      v10 = &off_10025D7B0;
    }
    else {
      v10 = &off_10025D798;
    }
  }
  else if ([v5 isUIButtonPress])
  {
    v10 = &off_10025D7C8;
  }
  else if (([v5 isHomePressed] & 1) != 0 {
         || ([v5 isHearstDoubleTapTriggered] & 1) != 0
  }
         || ([v5 isRTSTriggered] & 1) != 0)
  {
    v10 = &off_10025D7E0;
  }
  else if ([v5 isContinuousConversation] | v7)
  {
    v10 = &off_10025D7F8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)timeStampString
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  v4 = +[NSDate date];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

+ (void)logMitigationFeatures:(id)a3 forTask:(id)a4 withModelOutput:(id)a5 forMHRequestId:(id)a6 forRequestId:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  v16 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
    __int16 v82 = 2112;
    v83 = v14;
    __int16 v84 = 2112;
    v85 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s mhId:%@ requestId:%@", buf, 0x20u);
  }
  v17 = +[CSFPreferences sharedPreferences];
  unsigned __int8 v18 = [v17 isAttentiveSiriAudioLoggingEnabled];

  if (v18)
  {
    v19 = +[NSFileManager defaultManager];
    v20 = +[CSFPreferences sharedPreferences];
    v21 = [v20 mhLogDirectory];

    v69 = v19;
    if ([v19 fileExistsAtPath:v21])
    {
      id v74 = 0;
    }
    else
    {
      id v77 = 0;
      unsigned __int8 v23 = [v19 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v77];
      id v74 = v77;
      if ((v23 & 1) == 0)
      {
        v24 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v57 = v24;
          v58 = [v74 localizedDescription];
          *(_DWORD *)buf = 136315650;
          v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
          __int16 v82 = 2114;
          v83 = v21;
          __int16 v84 = 2114;
          v85 = v58;
          _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%s Couldn't create Ures slogging directory at path %{public}@ %{public}@", buf, 0x20u);
        }
        v21 = @"/tmp";
      }
    }
    v70 = v15;
    v71 = v14;
    if (v15) {
      v25 = v15;
    }
    else {
      v25 = v14;
    }
    uint64_t v61 = +[NSString stringWithFormat:@"%@-%@.json", v25, v12];
    v62 = v21;
    uint64_t v60 = -[__CFString stringByAppendingPathComponent:](v21, "stringByAppendingPathComponent:");
    v26 = [v11 speechPackage];
    v27 = +[SLUresMitigator getTranscriptionForSpeechPackage:v26];

    v28 = @"N/A";
    if (v27) {
      v28 = v27;
    }
    v29 = v28;

    v78[0] = @"Task";
    v78[1] = @"Transcript";
    id v72 = v13;
    id v73 = v12;
    v79[0] = v12;
    v79[1] = v29;
    v59 = v29;
    v79[2] = v13;
    v78[2] = @"DetailedModelResult";
    v78[3] = @"AcousticFTMScore";
    v68 = [v11 acousticFTMScores];
    v79[3] = v68;
    v78[4] = @"InputOrigin";
    v67 = [v11 inputOrigin];
    v79[4] = v67;
    v78[5] = @"gazeSignal";
    v66 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 didDetectGazeAtOrb]);
    v79[5] = v66;
    v78[6] = @"visualVadSignal";
    v65 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 didDetectVisualActivity]);
    v79[6] = v65;
    v78[7] = @"attentionSignal";
    v64 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 didDetectAttention]);
    v79[7] = v64;
    v78[8] = @"osdSignal";
    v63 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 didDetectSpeechActivity]);
    v79[8] = v63;
    v78[9] = @"timeSinceLastQuery";
    [v11 timeSinceLastQuery];
    v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v79[9] = v30;
    v78[10] = @"airpodsConnected";
    v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isAirpodsConnected]);
    v79[10] = v31;
    v78[11] = @"boronSignal";
    v32 = [v11 boronScore];
    v79[11] = v32;
    v78[12] = @"decisionStage";
    v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 decisionStage]);
    v79[12] = v33;
    v78[13] = @"prevInputLevel";
    v34 = [v11 prevStageOutput];
    v79[13] = v34;
    v78[14] = @"speakerIDScore";
    v35 = [v11 speakerIDScore];
    v79[14] = v35;
    v78[15] = @"eosLikelihood";
    v36 = [v11 eosLikelihood];
    v79[15] = v36;
    v78[16] = @"timestamp";
    v37 = +[CSUtils timeStampString];
    v79[16] = v37;
    v38 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:17];

    v39 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
      __int16 v82 = 2112;
      v83 = v38;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s Mitigation Dict :%@", buf, 0x16u);
    }
    v40 = [v11 speechPackage];
    v41 = [v40 dictionaryRepresentation];

    if (v41)
    {
      v42 = +[NSMutableDictionary dictionary];
      v43 = v38;
      [v42 addEntriesFromDictionary:v38];
      [v42 setObject:v41 forKey:@"RawASRRecogCandidate"];
      v44 = [v11 speechPackage];
      v45 = [v44 latticeMitigatorResult];
      v46 = [v45 dictionaryRepresentation];

      id v12 = v73;
      if (v46) {
        [v42 setObject:v46 forKey:@"LatticeRNNResult"];
      }
      v47 = [v11 nldaScore];
      if (v47) {
        [v42 setObject:v47 forKey:@"NLDAScore"];
      }
      v38 = (__CFString *)[v42 copy];
    }
    else
    {
      id v12 = v73;
    }
    id v76 = v74;
    v48 = +[NSJSONSerialization dataWithJSONObject:v38 options:1 error:&v76];
    id v49 = v76;

    if (!v48 || v49)
    {
      v50 = v38;
      v54 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v55 = v54;
        v56 = [v49 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
        __int16 v82 = 2114;
        v83 = v56;
        _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%s Failed to serialize data with err: %{public}@", buf, 0x16u);
      }
      v53 = (void *)v61;
      v52 = v62;
      v51 = (void *)v60;
    }
    else
    {
      v50 = v38;
      id v75 = 0;
      v51 = (void *)v60;
      [v48 writeToFile:v60 options:0 error:&v75];
      id v49 = v75;
      v53 = (void *)v61;
      v52 = v62;
    }

    v15 = v70;
    v14 = v71;
    id v13 = v72;
  }
  else
  {
    v22 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s AttSiri logging not enabled", buf, 0xCu);
    }
  }
}

+ (void)getTrialIdsForAssetType:(unint64_t)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void *))a4;
  if (a3 == 3)
  {
    uint64_t v6 = 114;
    uint64_t v7 = 322;
  }
  else if (a3 == 4)
  {
    uint64_t v6 = 117;
    uint64_t v7 = 404;
  }
  else
  {
    v8 = CSLogContextFacilityCoreSpeech;
    BOOL v9 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    if (v9)
    {
      int v11 = 136315394;
      id v12 = "+[CSUtils(Trial) getTrialIdsForAssetType:withCompletion:]";
      __int16 v13 = 2050;
      unint64_t v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Unknown namespaceId for assetType %{public}lu ", (uint8_t *)&v11, 0x16u);
      uint64_t v7 = 0;
      uint64_t v6 = 0;
    }
  }
  if (v5)
  {
    v10 = +[TRINamespace namespaceNameFromId:v7];
    v5[2](v5, v6, v10);
  }
}

+ (unint64_t)getAssetTypeForNamespace:(id)a3
{
  id v3 = a3;
  v4 = +[TRINamespace namespaceNameFromId:322];
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    unint64_t v6 = 3;
  }
  else
  {
    uint64_t v7 = +[TRINamespace namespaceNameFromId:404];
    unsigned int v8 = [v3 isEqualToString:v7];

    if (v8) {
      unint64_t v6 = 4;
    }
    else {
      unint64_t v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)extractArchiveFromDirectory:(id)a3 toDir:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315650;
    v10 = "+[CSUtils(Compression) extractArchiveFromDirectory:toDir:]";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Unable to expand archive %{public}@ to directory %{public}@", (uint8_t *)&v9, 0x20u);
  }

  return 0;
}

+ (id)distributionDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v30[0] = @"Max";
    v30[1] = @"Min";
    v31[0] = &off_10025E248;
    v31[1] = &off_10025E248;
    v30[2] = @"P95";
    v30[3] = @"Median";
    v31[2] = &off_10025E248;
    v31[3] = &off_10025E248;
    v30[4] = @"Avg";
    v30[5] = @"Std";
    v31[4] = &off_10025E248;
    v31[5] = &off_10025E248;
    v30[6] = @"Num";
    v31[6] = &off_10025E248;
    v4 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:7];
    id v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];

    unint64_t v6 = (unint64_t)[v3 count];
    if (v6)
    {
      uint64_t v7 = +[NSNumber numberWithUnsignedInteger:v6];
      [v5 setObject:v7 forKeyedSubscript:@"Num"];

      unsigned int v8 = +[NSExpression expressionForConstantValue:v3];
      v29 = v8;
      int v9 = +[NSArray arrayWithObjects:&v29 count:1];
      v10 = +[NSExpression expressionForFunction:@"average:" arguments:v9];

      __int16 v11 = [v10 expressionValueWithObject:0 context:0];
      [v5 setObject:v11 forKeyedSubscript:@"Avg"];

      id v12 = +[NSExpression expressionForConstantValue:v3];
      v28 = v12;
      __int16 v13 = +[NSArray arrayWithObjects:&v28 count:1];
      id v14 = +[NSExpression expressionForFunction:@"stddev:" arguments:v13];

      v15 = [v14 expressionValueWithObject:0 context:0];
      [v5 setObject:v15 forKeyedSubscript:@"Std"];

      [v3 sortUsingComparator:&stru_100252838];
      v16 = [v3 objectAtIndexedSubscript:v6 >> 1];
      [v16 doubleValue];
      double v18 = v17;

      if ((v6 & 1) == 0)
      {
        v19 = [v3 objectAtIndexedSubscript:(v6 >> 1) - 1];
        [v19 doubleValue];
        double v21 = v20;

        double v18 = (v18 + v21) * 0.5;
      }
      v22 = +[NSNumber numberWithDouble:v18];
      [v5 setObject:v22 forKeyedSubscript:@"Median"];

      unsigned __int8 v23 = [v3 objectAtIndexedSubscript:0];
      [v5 setObject:v23 forKeyedSubscript:@"Min"];

      v24 = [v3 objectAtIndexedSubscript:v6 - 1];
      [v5 setObject:v24 forKeyedSubscript:@"Max"];

      v25 = [v3 objectAtIndexedSubscript:vcvtmd_u64_f64((double)v6 * 0.95)];
      [v5 setObject:v25 forKeyedSubscript:@"P95"];

      unint64_t v6 = v5;
    }
  }
  else
  {
    v26 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "+[CSUtils(Statistics) distributionDictionary:]";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s input dictionary is nil", buf, 0xCu);
    }
    unint64_t v6 = 0;
  }

  return (id)v6;
}

+ (BOOL)readAudioChunksFrom:(id)a3 block:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (void (**)(id, void *, void))a4;
  inPropertyData[0] = xmmword_1001AC800;
  inPropertyData[1] = unk_1001AC810;
  uint64_t v21 = 16;
  ExtAudioFileRef outExtAudioFile = 0;
  AudioFileID outAudioFile = 0;
  if (!AudioFileOpenURL((CFURLRef)+[NSURL URLWithString:v5], kAudioFileReadPermission, 0, &outAudioFile))
  {
    if (!ExtAudioFileWrapAudioFileID(outAudioFile, 0, &outExtAudioFile)) {
      goto LABEL_5;
    }
    AudioFileClose(outAudioFile);
  }
  AudioFileID outAudioFile = 0;
LABEL_5:
  if (outExtAudioFile)
  {
    uint64_t v17 = 0;
    memset(outPropertyData, 0, sizeof(outPropertyData));
    UInt32 ioPropertyDataSize = 40;
    ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, outPropertyData);
    ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
    id v7 = +[NSMutableData dataWithLength:2048];
    *(void *)&ioData.mNumberBuffers = 1;
    *(void *)&ioData.mBuffers[0].mNumberChannels = 0x80000000001;
    ioData.mBuffers[0].mData = [v7 mutableBytes];
    while (1)
    {
      UInt32 ioNumberFrames = 1024;
      OSStatus v8 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
      BOOL v9 = v8 == 0;
      if (v8) {
        break;
      }
      if (!ioNumberFrames) {
        goto LABEL_14;
      }
      if (v6) {
        v6[2](v6, ioData.mBuffers[0].mData, ioData.mBuffers[0].mDataByteSize >> 1);
      }
    }
    OSStatus v10 = v8;
    __int16 v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v23 = "+[CSUtils(AudioFile) readAudioChunksFrom:block:]";
      __int16 v24 = 1026;
      OSStatus v25 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Error reading audio file: %{public}d, skipping...", buf, 0x12u);
    }
LABEL_14:
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end