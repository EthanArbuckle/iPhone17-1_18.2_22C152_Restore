@interface _EARSpeakerCodeReader
- (void)getTrainingSpeakerCode:(id *)a3 inferenceSpeakerCode:(id *)a4 accumulatedGradient:(id *)a5 nnetVersion:(id *)a6 numFrames:(id *)a7 trainingOffset:(id *)a8 recognitionOffset:(id *)a9 language:(id)a10;
@end

@implementation _EARSpeakerCodeReader

- (void)getTrainingSpeakerCode:(id *)a3 inferenceSpeakerCode:(id *)a4 accumulatedGradient:(id *)a5 nnetVersion:(id *)a6 numFrames:(id *)a7 trainingOffset:(id *)a8 recognitionOffset:(id *)a9 language:(id)a10
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v16 = (NSString *)a10;
  if ([(NSString *)v16 length])
  {
    v17 = getSpeakerCodeFilePath(v16);
    v18 = (EARLogger *)[v17 length];
    if (!v18)
    {
      v24 = EARLogger::QuasarOSLogger(0);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B1A86000, v24, OS_LOG_TYPE_INFO, "Failed to read speaker code file, path is null or empty", buf, 2u);
      }
      goto LABEL_39;
    }
    v19 = EARLogger::QuasarOSLogger(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v17;
      _os_log_impl(&dword_1B1A86000, v19, OS_LOG_TYPE_INFO, "Reading speaker code file from disk, full path: %@", buf, 0xCu);
    }

    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v21 = [v20 fileExistsAtPath:v17];

    if (v21)
    {
      id v44 = 0;
      uint64_t v22 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v17 options:0 error:&v44];
      v23 = (EARLogger *)v44;
      v24 = v23;
      v42 = (void *)v22;
      if (v22)
      {
        id v43 = 0;
        v25 = [MEMORY[0x1E4F28F98] propertyListWithData:v22 options:0 format:0 error:&v43];
        v41 = v43;

        if (v25)
        {
          v27 = [v25 valueForKey:@"trainingSpeakerCode"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = [v25 valueForKey:@"trainingSpeakerCode"];
            *a3 = v28;
          }
          else
          {
            *a3 = 0;
          }

          v30 = [v25 valueForKey:@"inferenceSpeakerCode"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = [v25 valueForKey:@"inferenceSpeakerCode"];
            *a4 = v31;
          }
          else
          {
            *a4 = 0;
          }

          v32 = [v25 valueForKey:@"accumulatedGradient"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v33 = [v25 valueForKey:@"accumulatedGradient"];
            *a5 = v33;
          }
          else
          {
            *a5 = 0;
          }

          v34 = [v25 valueForKey:@"numTrainedFrames"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v35 = [v25 valueForKey:@"numTrainedFrames"];
            *a7 = v35;
          }
          else
          {
            *a7 = 0;
          }

          v36 = [v25 valueForKey:@"trainingNnetVersion"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v37 = [v25 valueForKey:@"trainingNnetVersion"];
            *a6 = v37;
          }
          else
          {
            *a6 = 0;
          }

          v38 = [v25 valueForKey:@"trainingOffset"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v39 = [v25 valueForKey:@"trainingOffset"];
            *a8 = v39;
          }
          else
          {
            *a8 = 0;
          }

          v29 = [v25 valueForKey:@"recognitionOffset"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v40 = [v25 valueForKey:@"recognitionOffset"];
            *a9 = v40;
          }
          else
          {
            *a9 = 0;
          }
        }
        else
        {
          v29 = EARLogger::QuasarOSLogger(v26);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v41;
            _os_log_impl(&dword_1B1A86000, v29, OS_LOG_TYPE_INFO, "Failed to deserialize speaker code file, error: %@", buf, 0xCu);
          }
        }

        v24 = v41;
      }
      else
      {
        v25 = EARLogger::QuasarOSLogger(v23);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v24;
          _os_log_impl(&dword_1B1A86000, v25, OS_LOG_TYPE_INFO, "Failed to read speaker code file, error: %@", buf, 0xCu);
        }
      }

LABEL_39:
    }
  }
  else
  {
    v17 = EARLogger::QuasarOSLogger(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v17, OS_LOG_TYPE_INFO, "Failed to read speaker code file, language is null or empty", buf, 2u);
    }
  }
}

@end