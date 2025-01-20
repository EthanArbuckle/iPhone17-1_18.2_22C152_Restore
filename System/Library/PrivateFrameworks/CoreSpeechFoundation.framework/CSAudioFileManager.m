@interface CSAudioFileManager
+ (id)_createAudioFileWriterForAdBlockerWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5 withAccessoryID:(id)a6;
+ (id)_createAudioFileWriterForOSDWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5;
+ (id)_createAudioFileWriterForOpportuneSpeakListenerWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5;
+ (id)_createAudioFileWriterForPHSTrainingWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5;
+ (id)_createAudioFileWriterWithLoggingDir:(id)a3 withLoggingUUID:(id)a4 inputFormat:(AudioStreamBasicDescription *)a5 outputFormat:(AudioStreamBasicDescription *)a6;
+ (id)_getDateLabel;
+ (id)_sharedAudioLoggingQueue;
+ (id)audioFileWriterForAttentiveSiri;
+ (id)createAudioFileWriterForAdBlockerWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withAccessoryID:(id)a5;
+ (id)createAudioFileWriterForOSDWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4;
+ (id)createAudioFileWriterForOpportuneSpeakListenerWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4;
+ (id)createAudioFileWriterForPHSTrainingWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4;
+ (id)createAudioFileWriterForRemoteVADWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withLoggingUUID:(id)a5;
+ (id)createAudioFileWriterWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withLoggingUUID:(id)a5;
+ (id)createSelectiveChannelAudioFileWriterWithChannelBitset:(unint64_t)a3;
+ (void)_readDataFromFileHandle:(id)a3 toFileHandle:(id)a4;
+ (void)cleanupOrphanedGradingFiles;
+ (void)generateDeviceAudioLogging:(id)a3 speechId:(id)a4;
+ (void)pruneLogFiles;
+ (void)pruneNumberOfGradingFilesTo:(unint64_t)a3;
+ (void)pruneNumberOfLogFilesTo:(unint64_t)a3;
+ (void)removeLogFilesOlderThanNDays:(float)a3;
+ (void)removeOpportunisticAudioLoggingOlderThanNDays:(float)a3;
+ (void)removeRemoteP2PLogFilesOlderThanNDays:(float)a3;
@end

@implementation CSAudioFileManager

+ (id)audioFileWriterForAttentiveSiri
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = +[CSFPreferences sharedPreferences];
  int v3 = [v2 isAttentiveSiriAudioLoggingEnabled];

  if (!v3)
  {
    v17 = 0;
    goto LABEL_24;
  }
  v4 = +[CSFPreferences sharedPreferences];
  v5 = [v4 assistantLogDirectory];

  v6 = [v5 stringByAppendingPathComponent:@"attsiri"];
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v31 = 0;
  int v8 = [v7 fileExistsAtPath:v6 isDirectory:&v31];
  if (v8) {
    BOOL v9 = v31 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    goto LABEL_22;
  }
  if (v8)
  {
    v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "+[CSAudioFileManager audioFileWriterForAttentiveSiri]";
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Removing non-dir at AttentiveSiri AudioLog dir: %@", buf, 0x16u);
    }
    id v30 = 0;
    char v11 = [v7 removeItemAtPath:v6 error:&v30];
    id v12 = v30;
    if ((v11 & 1) == 0)
    {
      uint64_t v13 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "+[CSAudioFileManager audioFileWriterForAttentiveSiri]";
        __int16 v34 = 2112;
        id v35 = v6;
        __int16 v36 = 2112;
        id v37 = v12;
        v14 = "%s Error removing %@: err: %@";
        v15 = v13;
        uint32_t v16 = 32;
LABEL_18:
        _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else
  {
    id v12 = 0;
  }
  v18 = v12;
  id v29 = v12;
  [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v12 = v29;

  v19 = CSLogCategoryAudio;
  BOOL v20 = os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v20)
    {
      *(_DWORD *)buf = 136315394;
      v33 = "+[CSAudioFileManager audioFileWriterForAttentiveSiri]";
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s Created AudioLogging dir for AttentiveSiri at: %@", buf, 0x16u);
    }
LABEL_22:
    v21 = NSString;
    v22 = +[CSAudioFileManager _getDateLabel];
    id v12 = [v21 stringWithFormat:@"%@.wav", v22];

    v23 = [v6 stringByAppendingPathComponent:v12];
    v24 = [CSPlainAudioFileWriter alloc];
    v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v23];
    +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD];
    +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD];
    v17 = [(CSPlainAudioFileWriter *)v24 initWithURL:v25 inputFormat:v28 outputFormat:v27];

    goto LABEL_23;
  }
  if (v20)
  {
    *(_DWORD *)buf = 136315394;
    v33 = "+[CSAudioFileManager audioFileWriterForAttentiveSiri]";
    __int16 v34 = 2112;
    id v35 = v12;
    v14 = "%s Failed to create AudioLogging directory for AttentiveSiri: %@";
    v15 = v19;
    uint32_t v16 = 22;
    goto LABEL_18;
  }
LABEL_19:
  v17 = 0;
LABEL_23:

LABEL_24:
  return v17;
}

+ (void)cleanupOrphanedGradingFiles
{
  v47[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CB10];
  int v3 = +[CSFPreferences sharedPreferences];
  v4 = [v3 assistantAudioFileLogDirectory];
  v27 = [v2 URLWithString:v4];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__11630;
  uint64_t v38 = __Block_byref_object_dispose__11631;
  id v39 = 0;
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [v27 path];
  int v8 = [v6 fileURLWithPath:v7];
  v47[0] = *MEMORY[0x1E4F1C6E8];
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  v10 = (id *)(v35 + 5);
  id obj = (id)v35[5];
  v26 = [v5 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v9 options:0 error:&obj];
  objc_storeStrong(v10, obj);

  char v11 = (void *)v35[5];
  if (v11)
  {
    id v12 = [v11 domain];
    if ([v12 isEqual:*MEMORY[0x1E4F281F8]])
    {
      BOOL v13 = [(id)v35[5] code] == 260;

      if (v13) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    v24 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v35[5];
      *(_DWORD *)buf = 136315650;
      v42 = "+[CSAudioFileManager cleanupOrphanedGradingFiles]";
      __int16 v43 = 2114;
      v44 = v27;
      __int16 v45 = 2114;
      uint64_t v46 = v25;
      _os_log_error_impl(&dword_1BA1A5000, v24, OS_LOG_TYPE_ERROR, "%s ERR: reading contents of gradingDir: %{public}@ with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v26;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          BOOL v20 = [v19 absoluteString];
          v21 = [v20 lastPathComponent];
          v22 = [v21 stringByDeletingPathExtension];

          v23 = [v14 objectForKeyedSubscript:v22];
          LODWORD(v20) = v23 == 0;

          if (v20) {
            [v14 setObject:v19 forKeyedSubscript:v22];
          }
          else {
            [v14 removeObjectForKey:v22];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v40 count:16];
      }
      while (v16);
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__CSAudioFileManager_cleanupOrphanedGradingFiles__block_invoke;
    v28[3] = &unk_1E6200E08;
    v28[4] = &v34;
    [v14 enumerateKeysAndObjectsUsingBlock:v28];
  }
LABEL_19:

  _Block_object_dispose(&v34, 8);
}

void __49__CSAudioFileManager_cleanupOrphanedGradingFiles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "+[CSAudioFileManager cleanupOrphanedGradingFiles]_block_invoke";
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleting orphaned grading file %{public}@", buf, 0x16u);
  }
  char v16 = 0;
  int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v5 isDirectory:&v16];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v11 + 40);
    char v12 = [v10 removeItemAtPath:v5 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);

    if ((v12 & 1) == 0)
    {
      BOOL v13 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        *(_DWORD *)buf = 136315650;
        v18 = "+[CSAudioFileManager cleanupOrphanedGradingFiles]_block_invoke";
        __int16 v19 = 2114;
        id v20 = v5;
        __int16 v21 = 2114;
        uint64_t v22 = v14;
        _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete %{public}@ with error %{public}@", buf, 0x20u);
      }
    }
  }
}

+ (void)pruneNumberOfGradingFilesTo:(unint64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = +[CSFPreferences sharedPreferences];
  id v6 = [v5 assistantAudioFileLogDirectory];
  v7 = [v4 URLWithString:v6];
  int v8 = [NSString stringWithFormat:@"%@(%@)?.wav$", @"CS-", @"-synced"];
  +[CSUtils clearLogFilesInDirectory:v7 matchingPattern:v8 exceedNumber:a3];

  +[CSAudioFileManager cleanupOrphanedGradingFiles];
}

+ (void)pruneNumberOfLogFilesTo:(unint64_t)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"PCM-", @"OPUS_", @"OPP-", @"Ads-", @"PHS-", @"OSD-", 0);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  int v3 = v38 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        int v9 = (void *)MEMORY[0x1E4F1CB10];
        v10 = +[CSFPreferences sharedPreferences];
        uint64_t v11 = [v10 assistantAudioFileLogDirectory];
        char v12 = [v9 URLWithString:v11];
        BOOL v13 = [NSString stringWithFormat:@"^%@*", v8];
        +[CSUtils clearLogFilesInDirectory:v12 matchingPattern:v13 exceedNumber:a3];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v5);
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"-triggered", @"-almost", @"-rejected", @"-activation", @"-selfTrigger", 0);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v14;
  uint64_t v29 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        uint64_t v17 = (void *)MEMORY[0x1E4F1CB10];
        v18 = +[CSFPreferences sharedPreferences];
        __int16 v19 = [v18 voiceTriggerAudioLogDirectory];
        id v20 = [v17 URLWithString:v19];
        __int16 v21 = [NSString stringWithFormat:@"%@(%@)?.wav$", v16, @"-synced"];
        +[CSUtils clearLogFilesInDirectory:v20 matchingPattern:v21 exceedNumber:a3];

        uint64_t v22 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v23 = +[CSFPreferences sharedPreferences];
        v24 = [v23 voiceTriggerAudioLogDirectory];
        uint64_t v25 = [v22 URLWithString:v24];
        v26 = [NSString stringWithFormat:@"%@(%@)?.json$", v16, @"-synced"];
        +[CSUtils clearLogFilesInDirectory:v25 matchingPattern:v26 exceedNumber:a3];
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v29);
  }
}

+ (void)pruneLogFiles
{
  v2 = +[CSFPreferences sharedPreferences];
  +[CSAudioFileManager pruneNumberOfGradingFilesTo:](CSAudioFileManager, "pruneNumberOfGradingFilesTo:", [v2 maxNumGradingFiles]);

  id v3 = +[CSFPreferences sharedPreferences];
  +[CSAudioFileManager pruneNumberOfLogFilesTo:](CSAudioFileManager, "pruneNumberOfLogFilesTo:", [v3 maxNumLoggingFiles]);
}

+ (void)removeRemoteP2PLogFilesOlderThanNDays:(float)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = +[CSFPreferences sharedPreferences];
  uint64_t v6 = [v5 remoteP2pLogDirectory];
  v7 = [v4 URLWithString:v6];
  *(float *)&double v8 = a3;
  +[CSUtils removeLogFilesInDirectory:v7 matchingPattern:@".*" beforeDays:v8];

  int v9 = (void *)MEMORY[0x1E4F1CB10];
  id v13 = +[CSFPreferences sharedPreferences];
  v10 = [v13 remoteGradingDataDirectory];
  uint64_t v11 = [v9 URLWithString:v10];
  *(float *)&double v12 = a3;
  +[CSUtils removeLogFilesInDirectory:v11 matchingPattern:@".*" beforeDays:v12];
}

+ (void)removeLogFilesOlderThanNDays:(float)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = +[CSFPreferences sharedPreferences];
  uint64_t v6 = [v5 assistantAudioFileLogDirectory];
  v7 = [v4 URLWithString:v6];
  *(float *)&double v8 = a3;
  +[CSUtils removeLogFilesInDirectory:v7 matchingPattern:@".*" beforeDays:v8];

  int v9 = (void *)MEMORY[0x1E4F1CB10];
  id v13 = +[CSFPreferences sharedPreferences];
  v10 = [v13 voiceTriggerAudioLogDirectory];
  uint64_t v11 = [v9 URLWithString:v10];
  *(float *)&double v12 = a3;
  +[CSUtils removeLogFilesInDirectory:v11 matchingPattern:@".*" beforeDays:v12];
}

+ (void)removeOpportunisticAudioLoggingOlderThanNDays:(float)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = +[CSFPreferences sharedPreferences];
  uint64_t v5 = [v9 assistantAudioFileLogDirectory];
  uint64_t v6 = [v4 URLWithString:v5];
  v7 = [NSString stringWithFormat:@"^%@*", @"OPP-"];
  *(float *)&double v8 = a3;
  +[CSUtils removeLogFilesInDirectory:v6 matchingPattern:v7 beforeDays:v8];
}

+ (id)_getDateLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v3 setLocale:v4];

  [v3 setDateFormat:@"yyyy_MM_dd-HHmmss.SSS"];
  uint64_t v5 = [v3 stringFromDate:v2];

  return v5;
}

+ (id)_createAudioFileWriterForOSDWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v8 = NSString;
  id v9 = a3;
  v10 = [a1 _getDateLabel];
  uint64_t v11 = [v8 stringWithFormat:@"%@/%@%@.wav", v9, @"OSD-", v10];

  double v12 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[CSAudioFileManager _createAudioFileWriterForOSDWithLoggingDir:inputFormat:outputFormat:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  id v13 = [CSPlainAudioFileWriter alloc];
  uint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
  long long v15 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&buf[16] = v15;
  uint64_t v22 = *(void *)&a4->mBitsPerChannel;
  long long v16 = *(_OWORD *)&a5->mBytesPerPacket;
  v19[0] = *(_OWORD *)&a5->mSampleRate;
  v19[1] = v16;
  uint64_t v20 = *(void *)&a5->mBitsPerChannel;
  uint64_t v17 = [(CSPlainAudioFileWriter *)v13 initWithURL:v14 inputFormat:buf outputFormat:v19];

  return v17;
}

+ (id)_createAudioFileWriterForPHSTrainingWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v8 = NSString;
  id v9 = a3;
  v10 = [a1 _getDateLabel];
  uint64_t v11 = [v8 stringWithFormat:@"%@/%@%@.wav", v9, @"PHS-", v10];

  double v12 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[CSAudioFileManager _createAudioFileWriterForPHSTrainingWithLoggingDir:inputFormat:outputFormat:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  id v13 = [CSPlainAudioFileWriter alloc];
  uint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
  long long v15 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&buf[16] = v15;
  uint64_t v22 = *(void *)&a4->mBitsPerChannel;
  long long v16 = *(_OWORD *)&a5->mBytesPerPacket;
  v19[0] = *(_OWORD *)&a5->mSampleRate;
  v19[1] = v16;
  uint64_t v20 = *(void *)&a5->mBitsPerChannel;
  uint64_t v17 = [(CSPlainAudioFileWriter *)v13 initWithURL:v14 inputFormat:buf outputFormat:v19];

  return v17;
}

+ (id)_createAudioFileWriterWithLoggingDir:(id)a3 withLoggingUUID:(id)a4 inputFormat:(AudioStreamBasicDescription *)a5 outputFormat:(AudioStreamBasicDescription *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v8 = [NSString stringWithFormat:@"%@/%@%@.wav", a3, @"CS-", a4];
  id v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[CSAudioFileManager _createAudioFileWriterWithLoggingDir:withLoggingUUID:inputFormat:outputFormat:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  +[CSAudioFileManager pruneLogFiles];
  v10 = [CSPlainAudioFileWriter alloc];
  uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  long long v12 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a5->mSampleRate;
  *(_OWORD *)&buf[16] = v12;
  uint64_t v19 = *(void *)&a5->mBitsPerChannel;
  long long v13 = *(_OWORD *)&a6->mBytesPerPacket;
  v16[0] = *(_OWORD *)&a6->mSampleRate;
  v16[1] = v13;
  uint64_t v17 = *(void *)&a6->mBitsPerChannel;
  uint64_t v14 = [(CSPlainAudioFileWriter *)v10 initWithURL:v11 inputFormat:buf outputFormat:v16];

  return v14;
}

+ (id)_createAudioFileWriterForOpportuneSpeakListenerWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v8 = NSString;
  id v9 = a3;
  v10 = [a1 _getDateLabel];
  uint64_t v11 = [v8 stringWithFormat:@"%@/%@%@.wav", v9, @"OPP-", v10];

  long long v12 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[CSAudioFileManager _createAudioFileWriterForOpportuneSpeakListenerWithLoggingDir:inputFormat:outputFormat:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  +[CSAudioFileManager pruneLogFiles];
  long long v13 = [CSPlainAudioFileWriter alloc];
  uint64_t v14 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
  long long v15 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&buf[16] = v15;
  uint64_t v22 = *(void *)&a4->mBitsPerChannel;
  long long v16 = *(_OWORD *)&a5->mBytesPerPacket;
  v19[0] = *(_OWORD *)&a5->mSampleRate;
  v19[1] = v16;
  uint64_t v20 = *(void *)&a5->mBitsPerChannel;
  uint64_t v17 = [(CSPlainAudioFileWriter *)v13 initWithURL:v14 inputFormat:buf outputFormat:v19];

  return v17;
}

+ (id)_createAudioFileWriterForAdBlockerWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5 withAccessoryID:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  long long v12 = NSString;
  uint64_t v13 = [a1 _getDateLabel];
  uint64_t v14 = (void *)v13;
  if (v11) {
    [v12 stringWithFormat:@"%@/%@%@%@.wav", v10, @"Ads-", v13, v11];
  }
  else {
  long long v15 = [v12 stringWithFormat:@"%@/%@%@.wav", v10, @"Ads-", v13, v23];
  }

  long long v16 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[CSAudioFileManager _createAudioFileWriterForAdBlockerWithLoggingDir:inputFormat:outputFormat:"
                         "withAccessoryID:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  +[CSAudioFileManager pruneLogFiles];
  uint64_t v17 = [CSPlainAudioFileWriter alloc];
  v18 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
  long long v19 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&buf[16] = v19;
  uint64_t v27 = *(void *)&a4->mBitsPerChannel;
  long long v20 = *(_OWORD *)&a5->mBytesPerPacket;
  v24[0] = *(_OWORD *)&a5->mSampleRate;
  v24[1] = v20;
  uint64_t v25 = *(void *)&a5->mBitsPerChannel;
  __int16 v21 = [(CSPlainAudioFileWriter *)v17 initWithURL:v18 inputFormat:buf outputFormat:v24];

  return v21;
}

+ (id)createAudioFileWriterForOSDWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4
{
  v7 = +[CSFPreferences sharedPreferences];
  int v8 = [v7 isEndpointEnhancedLoggingEnabled];

  if (v8)
  {
    id v9 = +[CSFPreferences sharedPreferences];
    id v10 = [v9 assistantAudioFileLogDirectory];
    long long v11 = *(_OWORD *)&a3->mBytesPerPacket;
    v17[0] = *(_OWORD *)&a3->mSampleRate;
    v17[1] = v11;
    uint64_t v18 = *(void *)&a3->mBitsPerChannel;
    long long v12 = *(_OWORD *)&a4->mBytesPerPacket;
    v15[0] = *(_OWORD *)&a4->mSampleRate;
    v15[1] = v12;
    uint64_t v16 = *(void *)&a4->mBitsPerChannel;
    uint64_t v13 = [a1 _createAudioFileWriterForOSDWithLoggingDir:v10 inputFormat:v17 outputFormat:v15];
  }
  else
  {
    uint64_t v13 = 0;
  }
  return v13;
}

+ (id)createAudioFileWriterForAdBlockerWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withAccessoryID:(id)a5
{
  id v8 = a5;
  id v9 = +[CSFPreferences sharedPreferences];
  int v10 = [v9 isAdBlockerAudioLoggingEnabled];

  if (v10)
  {
    long long v11 = +[CSFPreferences sharedPreferences];
    long long v12 = [v11 voiceTriggerAudioLogDirectory];
    long long v13 = *(_OWORD *)&a3->mBytesPerPacket;
    v19[0] = *(_OWORD *)&a3->mSampleRate;
    v19[1] = v13;
    uint64_t v20 = *(void *)&a3->mBitsPerChannel;
    long long v14 = *(_OWORD *)&a4->mBytesPerPacket;
    v17[0] = *(_OWORD *)&a4->mSampleRate;
    v17[1] = v14;
    uint64_t v18 = *(void *)&a4->mBitsPerChannel;
    long long v15 = [a1 _createAudioFileWriterForAdBlockerWithLoggingDir:v12 inputFormat:v19 outputFormat:v17 withAccessoryID:v8];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

+ (id)createSelectiveChannelAudioFileWriterWithChannelBitset:(unint64_t)a3
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman)
  {
    uint64_t v5 = +[CSFPreferences sharedPreferences];
    if ([v5 fileLoggingIsEnabled])
    {

LABEL_7:
      id v8 = NSString;
      id v9 = [a1 _getDateLabel];
      int v10 = [v8 stringWithFormat:@"%@%@.wav", @"CS-", v9];

      long long v11 = (void *)MEMORY[0x1E4F1CB10];
      long long v12 = NSTemporaryDirectory();
      long long v13 = [v12 stringByAppendingPathComponent:v10];
      long long v14 = [v11 fileURLWithPath:v13];

      uint64_t v15 = +[CSUtils getNumElementInBitset:a3];
      uint64_t v28 = 0;
      long long v26 = 0u;
      long long v27 = 0u;
      +[CSConfig inputRecordingSampleRate];
      +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:", v15);
      uint64_t v25 = 0;
      long long v23 = 0u;
      long long v24 = 0u;
      +[CSConfig inputRecordingSampleRate];
      +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", v15);
      uint64_t v16 = [CSSelectiveChannelAudioFileWriter alloc];
      v21[0] = v26;
      v21[1] = v27;
      uint64_t v22 = v28;
      v19[0] = v23;
      v19[1] = v24;
      uint64_t v20 = v25;
      uint64_t v17 = [(CSSelectiveChannelAudioFileWriter *)v16 initWithURL:v14 inputFormat:v21 outputFormat:v19 channelBitset:a3];

      goto LABEL_9;
    }
    uint64_t v6 = [MEMORY[0x1E4F4E540] sharedPreferences];
    int v7 = [v6 fileLoggingIsEnabled];

    if (v7) {
      goto LABEL_7;
    }
  }
  uint64_t v17 = 0;
LABEL_9:
  return v17;
}

+ (id)createAudioFileWriterWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withLoggingUUID:(id)a5
{
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F4E540] sharedPreferences];
  int v10 = [v9 fileLoggingIsEnabled];

  if (v10) {
    +[CSAudioFileManager pruneLogFiles];
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman)
  {
    long long v11 = [MEMORY[0x1E4F4E540] sharedPreferences];
    if ([v11 fileLoggingIsEnabled])
    {

LABEL_9:
      long long v14 = +[CSFPreferences sharedPreferences];
      uint64_t v15 = [v14 assistantAudioFileLogDirectory];
      long long v16 = *(_OWORD *)&a3->mBytesPerPacket;
      v22[0] = *(_OWORD *)&a3->mSampleRate;
      v22[1] = v16;
      uint64_t v23 = *(void *)&a3->mBitsPerChannel;
      long long v17 = *(_OWORD *)&a4->mBytesPerPacket;
      v20[0] = *(_OWORD *)&a4->mSampleRate;
      v20[1] = v17;
      uint64_t v21 = *(void *)&a4->mBitsPerChannel;
      uint64_t v18 = [a1 _createAudioFileWriterWithLoggingDir:v15 withLoggingUUID:v8 inputFormat:v22 outputFormat:v20];

      goto LABEL_11;
    }
    long long v12 = +[CSFPreferences sharedPreferences];
    int v13 = [v12 fileLoggingIsEnabled];

    if (v13) {
      goto LABEL_9;
    }
  }
  uint64_t v18 = 0;
LABEL_11:

  return v18;
}

+ (id)createAudioFileWriterForRemoteVADWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withLoggingUUID:(id)a5
{
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F4E540] sharedPreferences];
  int v10 = [v9 fileLoggingIsEnabled];

  if (v10)
  {
    long long v11 = +[CSFPreferences sharedPreferences];
    long long v12 = [v11 assistantAudioFileLogDirectory];
    long long v13 = *(_OWORD *)&a3->mBytesPerPacket;
    v19[0] = *(_OWORD *)&a3->mSampleRate;
    v19[1] = v13;
    uint64_t v20 = *(void *)&a3->mBitsPerChannel;
    long long v14 = *(_OWORD *)&a4->mBytesPerPacket;
    v17[0] = *(_OWORD *)&a4->mSampleRate;
    v17[1] = v14;
    uint64_t v18 = *(void *)&a4->mBitsPerChannel;
    uint64_t v15 = [a1 _createAudioFileWriterWithLoggingDir:v12 withLoggingUUID:v8 inputFormat:v19 outputFormat:v17];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

+ (id)createAudioFileWriterForPHSTrainingWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4
{
  int v7 = +[CSFPreferences sharedPreferences];
  int v8 = [v7 personalizedSiriEnrollmentAudioLoggingEnabled];

  if (v8)
  {
    id v9 = +[CSFPreferences sharedPreferences];
    int v10 = [v9 assistantAudioFileLogDirectory];
    long long v11 = *(_OWORD *)&a3->mBytesPerPacket;
    v17[0] = *(_OWORD *)&a3->mSampleRate;
    v17[1] = v11;
    uint64_t v18 = *(void *)&a3->mBitsPerChannel;
    long long v12 = *(_OWORD *)&a4->mBytesPerPacket;
    v15[0] = *(_OWORD *)&a4->mSampleRate;
    v15[1] = v12;
    uint64_t v16 = *(void *)&a4->mBitsPerChannel;
    long long v13 = [a1 _createAudioFileWriterForPHSTrainingWithLoggingDir:v10 inputFormat:v17 outputFormat:v15];
  }
  else
  {
    long long v13 = 0;
  }
  return v13;
}

+ (id)createAudioFileWriterForOpportuneSpeakListenerWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4
{
  int v7 = [MEMORY[0x1E4F4E540] sharedPreferences];
  int v8 = [v7 opportuneSpeakingFileLoggingIsEnabled];

  if (v8)
  {
    id v9 = +[CSFPreferences sharedPreferences];
    int v10 = [v9 assistantAudioFileLogDirectory];
    long long v11 = *(_OWORD *)&a3->mBytesPerPacket;
    v17[0] = *(_OWORD *)&a3->mSampleRate;
    v17[1] = v11;
    uint64_t v18 = *(void *)&a3->mBitsPerChannel;
    long long v12 = *(_OWORD *)&a4->mBytesPerPacket;
    v15[0] = *(_OWORD *)&a4->mSampleRate;
    v15[1] = v12;
    uint64_t v16 = *(void *)&a4->mBitsPerChannel;
    long long v13 = [a1 _createAudioFileWriterForOpportuneSpeakListenerWithLoggingDir:v10 inputFormat:v17 outputFormat:v15];
  }
  else
  {
    long long v13 = 0;
  }
  return v13;
}

+ (void)_readDataFromFileHandle:(id)a3 toFileHandle:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  float v7 = (float)(10
             * (unint64_t)+[CSConfig inputRecordingNumberOfChannels]);
  +[CSConfig inputRecordingSampleRate];
  unint64_t v9 = (unint64_t)(float)((float)(v8 * v7)
                               * (float)+[CSConfig inputRecordingSampleByteDepth]);
  uint64_t v10 = [v5 seekToEndOfFile];
  [v5 seekToFileOffset:16];
  uint64_t v32 = 0;
  long long v11 = [v5 readDataOfLength:4];
  [v11 getBytes:&v32 length:8];

  id v12 = (id)[v5 readDataOfLength:v32];
  id v13 = [NSString alloc];
  long long v14 = [v5 readDataOfLength:4];
  uint64_t v15 = (void *)[v13 initWithData:v14 encoding:4];

  if ([v15 isEqualToString:@"FLLR"])
  {
    *(_WORD *)buf = 0;
    uint64_t v16 = [v5 readDataOfLength:4];
    [v16 getBytes:buf length:2];

    id v17 = (id)[v5 readDataOfLength:*(unsigned __int16 *)buf];
  }
  id v18 = (id)[v5 readDataOfLength:8];
  uint64_t v19 = [v5 offsetInFile];
  if (v10 - v19 >= v9) {
    unint64_t v20 = v9;
  }
  else {
    unint64_t v20 = v10 - v19;
  }
  uint64_t v21 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v21;
    uint64_t v23 = [v5 offsetInFile];
    *(_DWORD *)buf = 136315650;
    long long v34 = "+[CSAudioFileManager _readDataFromFileHandle:toFileHandle:]";
    __int16 v35 = 1026;
    *(_DWORD *)long long v36 = v20;
    *(_WORD *)&v36[4] = 2050;
    *(void *)&v36[6] = v23;
    _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s Start copying %{public}u bytes of data to crashreporter with wav file header offset %{public}llu", buf, 0x1Cu);
  }
  long long v24 = [v5 readDataOfLength:v20];
  uint64_t v25 = v24;
  if (v24 && [v24 length])
  {
    id v31 = 0;
    [v6 writeData:v25 error:&v31];
    id v26 = v31;
    long long v27 = CSLogCategoryAudio;
    if (v26 && os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = v27;
      long long v30 = [v26 localizedDescription];
      *(_DWORD *)buf = 136315650;
      long long v34 = "+[CSAudioFileManager _readDataFromFileHandle:toFileHandle:]";
      __int16 v35 = 2114;
      *(void *)long long v36 = v6;
      *(_WORD *)&v36[8] = 2114;
      *(void *)&v36[10] = v30;
      _os_log_error_impl(&dword_1BA1A5000, v29, OS_LOG_TYPE_ERROR, "%s Unable to writeData to %{public}@ : %{public}@", buf, 0x20u);

      long long v27 = CSLogCategoryAudio;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v34 = "+[CSAudioFileManager _readDataFromFileHandle:toFileHandle:]";
      _os_log_impl(&dword_1BA1A5000, v27, OS_LOG_TYPE_DEFAULT, "%s Finished copying data to crashreporter.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v28 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v34 = "+[CSAudioFileManager _readDataFromFileHandle:toFileHandle:]";
      __int16 v35 = 2114;
      *(void *)long long v36 = v5;
      _os_log_error_impl(&dword_1BA1A5000, v28, OS_LOG_TYPE_ERROR, "%s Failed to read data from %{public}@", buf, 0x16u);
    }
  }
}

+ (void)generateDeviceAudioLogging:(id)a3 speechId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = [a1 _sharedAudioLoggingQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CSAudioFileManager_generateDeviceAudioLogging_speechId___block_invoke;
  v11[3] = &unk_1E6201030;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __58__CSAudioFileManager_generateDeviceAudioLogging_speechId___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman)
  {
    id v2 = *(void **)(a1 + 32);
    if (v2)
    {
      id v3 = [v2 fileURL];

      if (v3)
      {
        uint64_t v4 = CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          id v5 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 136315394;
          v49 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
          __int16 v50 = 2114;
          v51 = v5;
          _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Extracted SpeechIdentifier: %{public}@", buf, 0x16u);
        }
        id v6 = [*(id *)(a1 + 32) fileURL];
        id v7 = [v6 URLByDeletingPathExtension];
        float v8 = [v7 absoluteString];
        id v9 = [v8 lastPathComponent];

        id v10 = NSString;
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = [*(id *)(a1 + 32) numberOfChannels];
        id v13 = +[CSUtils deviceBuildVersion];
        long long v14 = +[CSUtils deviceHwRevision];
        uint64_t v15 = [v10 stringWithFormat:@"%@.speechId%@.chNum%02d.build%@.hwRev%@.", v9, v11, v12, v13, v14];

        uint64_t v16 = [v15 dataUsingEncoding:4];
        id v17 = (void *)MEMORY[0x1E4F28CB0];
        id v18 = [*(id *)(a1 + 32) fileURL];
        uint64_t v19 = [v18 path];
        unint64_t v20 = [v17 fileHandleForReadingAtPath:v19];

        v45[1] = (id)MEMORY[0x1E4F143A8];
        v45[2] = (id)3221225472;
        v45[3] = __58__CSAudioFileManager_generateDeviceAudioLogging_speechId___block_invoke_47;
        v45[4] = &unk_1E6200DE0;
        id v21 = v16;
        id v46 = v21;
        id v22 = v20;
        id v47 = v22;
        if (OSAWriteLogForSubmission())
        {
          uint64_t v23 = *(void **)(a1 + 32);
          if (!v23) {
            goto LABEL_21;
          }
          long long v24 = [v23 fileURL];

          if (!v24) {
            goto LABEL_21;
          }
          uint64_t v25 = [*(id *)(a1 + 32) fileURL];
          id v26 = [v25 URLByDeletingLastPathComponent];
          long long v27 = [v26 path];

          uint64_t v28 = +[CSFPreferences sharedPreferences];
          uint64_t v29 = [v28 assistantAudioFileLogDirectory];
          char v30 = [v27 containsString:v29];

          if ((v30 & 1) == 0)
          {
            id v31 = (void *)CSLogCategoryAudio;
            if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = *(void **)(a1 + 32);
              long long v33 = v31;
              long long v34 = [v32 fileURL];
              *(_DWORD *)buf = 136315394;
              v49 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
              __int16 v50 = 2114;
              v51 = v34;
              _os_log_impl(&dword_1BA1A5000, v33, OS_LOG_TYPE_DEFAULT, "%s Plan removing the temp file %{public}@", buf, 0x16u);
            }
            __int16 v35 = [MEMORY[0x1E4F28CB8] defaultManager];
            long long v36 = [*(id *)(a1 + 32) fileURL];
            v45[0] = 0;
            [v35 removeItemAtURL:v36 error:v45];
            id v37 = v45[0];

            if (v37)
            {
              long long v38 = (void *)CSLogCategoryAudio;
              if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
              {
                v42 = *(void **)(a1 + 32);
                __int16 v43 = v38;
                v44 = [v42 fileURL];
                *(_DWORD *)buf = 136315650;
                v49 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
                __int16 v50 = 2114;
                v51 = v44;
                __int16 v52 = 2114;
                id v53 = v37;
                _os_log_error_impl(&dword_1BA1A5000, v43, OS_LOG_TYPE_ERROR, "%s Failed to remove temp file %{public}@ reason: %{public}@", buf, 0x20u);
              }
            }
          }
        }
        else
        {
          id v39 = (void *)CSLogCategoryAudio;
          if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
LABEL_21:

            return;
          }
          v40 = *(void **)(a1 + 32);
          long long v27 = v39;
          uint64_t v41 = [v40 fileURL];
          *(_DWORD *)buf = 136315394;
          v49 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
          __int16 v50 = 2114;
          v51 = v41;
          _os_log_error_impl(&dword_1BA1A5000, v27, OS_LOG_TYPE_ERROR, "%s OSA write log failed for file %{public}@", buf, 0x16u);
        }
        goto LABEL_21;
      }
    }
  }
}

void __58__CSAudioFileManager_generateDeviceAudioLogging_speechId___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = 0;
  [v3 writeData:v4 error:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      float v8 = [v5 localizedDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
      __int16 v12 = 2114;
      id v13 = v3;
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Unable to writeData to %{public}@ : %{public}@", buf, 0x20u);
    }
  }
  +[CSAudioFileManager _readDataFromFileHandle:*(void *)(a1 + 40) toFileHandle:v3];
}

+ (id)_sharedAudioLoggingQueue
{
  if (_sharedAudioLoggingQueue_onceToken != -1) {
    dispatch_once(&_sharedAudioLoggingQueue_onceToken, &__block_literal_global_11726);
  }
  id v2 = (void *)_sharedAudioLoggingQueue_sharedQueue;
  return v2;
}

void __46__CSAudioFileManager__sharedAudioLoggingQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.CoreSpeech.AudioLogging", v2);
  v1 = (void *)_sharedAudioLoggingQueue_sharedQueue;
  _sharedAudioLoggingQueue_sharedQueue = (uint64_t)v0;
}

@end