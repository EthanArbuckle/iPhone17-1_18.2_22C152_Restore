@interface _EARSpeakerCodeWriter
- (void)setTrainingSpeakerCode:(id)a3 inferenceSpeakerCode:(id)a4 accumulatedGradient:(id)a5 nnetVersion:(unint64_t)a6 numFrames:(unint64_t)a7 trainingOffset:(unint64_t)a8 recognitionOffset:(unint64_t)a9 language:(id)a10;
@end

@implementation _EARSpeakerCodeWriter

- (void)setTrainingSpeakerCode:(id)a3 inferenceSpeakerCode:(id)a4 accumulatedGradient:(id)a5 nnetVersion:(unint64_t)a6 numFrames:(unint64_t)a7 trainingOffset:(unint64_t)a8 recognitionOffset:(unint64_t)a9 language:(id)a10
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v18 = (NSString *)a10;
  if (![v15 length])
  {
    v19 = EARLogger::QuasarOSLogger(0);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v34 = "Failed to write speaker code file, training speaker code is null or empty";
LABEL_21:
    _os_log_impl(&dword_1B1A86000, v19, OS_LOG_TYPE_INFO, v34, buf, 2u);
    goto LABEL_32;
  }
  if (![v16 length])
  {
    v19 = EARLogger::QuasarOSLogger(0);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v34 = "Failed to write speaker code file, inference speaker code is null or empty";
    goto LABEL_21;
  }
  if (![v17 length])
  {
    v19 = EARLogger::QuasarOSLogger(0);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v34 = "Failed to write speaker code file, accumulated gradient is null or empty";
    goto LABEL_21;
  }
  if ([(NSString *)v18 length])
  {
    v19 = getSpeakerCodeFilePath(v18);
    if (![v19 length])
    {
      v35 = EARLogger::QuasarOSLogger(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B1A86000, v35, OS_LOG_TYPE_INFO, "Failed to write speaker code file, path is null or empty", buf, 2u);
      }
      goto LABEL_31;
    }
    v39 = [MEMORY[0x1E4F1CA60] dictionary];
    [v39 setObject:v15 forKey:@"trainingSpeakerCode"];
    [v39 setObject:v16 forKey:@"inferenceSpeakerCode"];
    [v39 setObject:v17 forKey:@"accumulatedGradient"];
    v20 = [NSNumber numberWithUnsignedInteger:a7];
    [v39 setObject:v20 forKey:@"numTrainedFrames"];

    v21 = [NSNumber numberWithUnsignedInteger:a6];
    [v39 setObject:v21 forKey:@"trainingNnetVersion"];

    v22 = [NSNumber numberWithUnsignedInteger:a8];
    [v39 setObject:v22 forKey:@"trainingOffset"];

    v23 = [NSNumber numberWithUnsignedInteger:a9];
    [v39 setObject:v23 forKey:@"recognitionOffset"];

    v25 = EARLogger::QuasarOSLogger(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v38 = [v15 substringToIndex:64];
      v37 = [v16 substringToIndex:64];
      v26 = [v17 substringToIndex:64];
      *(_DWORD *)buf = 138413826;
      v43 = v19;
      __int16 v44 = 2048;
      unint64_t v45 = a7;
      __int16 v46 = 2048;
      unint64_t v47 = a8;
      __int16 v48 = 2048;
      unint64_t v49 = a9;
      __int16 v50 = 2112;
      id v51 = v38;
      __int16 v52 = 2112;
      v53 = v37;
      __int16 v54 = 2112;
      v55 = v26;
      _os_log_impl(&dword_1B1A86000, v25, OS_LOG_TYPE_INFO, "Saving speaker code file on disk, full path: %@, num trained frames: %zu, training offset: %zu, recognition offset: %zu, training speaker code: %@, inference speaker code: %@, accumulated gradient: %@", buf, 0x48u);
    }
    id v41 = 0;
    v27 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v39 format:200 options:0 error:&v41];
    v28 = (EARLogger *)v41;
    v29 = v28;
    if (v27)
    {
      v30 = EARLogger::QuasarOSLogger(v28);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[_EARSpeakerCodeWriter setTrainingSpeakerCode:inferenceSpeakerCode:accumulatedGradient:nnetVersion:numFrames:trainingOffset:recognitionOffset:language:]((uint64_t)v19, v30);
      }

      v40 = v29;
      char v31 = [v27 writeToFile:v19 options:1073741825 error:&v40];
      v32 = v40;

      if (v31)
      {
        v29 = v32;
LABEL_30:

        v35 = v39;
LABEL_31:

        goto LABEL_32;
      }
      v36 = EARLogger::QuasarOSLogger(v33);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v32;
        _os_log_impl(&dword_1B1A86000, v36, OS_LOG_TYPE_INFO, "Failed to write speaker code data, error: %@", buf, 0xCu);
      }
      v29 = v32;
    }
    else
    {
      v36 = EARLogger::QuasarOSLogger(v28);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v29;
        _os_log_impl(&dword_1B1A86000, v36, OS_LOG_TYPE_INFO, "Failed to serialize speaker code data, error: %@", buf, 0xCu);
      }
    }

    goto LABEL_30;
  }
  v19 = EARLogger::QuasarOSLogger(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v34 = "Failed to write speaker code file, language is null or empty";
    goto LABEL_21;
  }
LABEL_32:
}

- (void)setTrainingSpeakerCode:(uint64_t)a1 inferenceSpeakerCode:(NSObject *)a2 accumulatedGradient:nnetVersion:numFrames:trainingOffset:recognitionOffset:language:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_DEBUG, "Speaker code data is serialized, writing to file: %@", (uint8_t *)&v2, 0xCu);
}

@end