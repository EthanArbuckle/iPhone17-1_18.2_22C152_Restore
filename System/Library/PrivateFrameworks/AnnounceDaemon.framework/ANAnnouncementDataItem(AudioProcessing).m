@interface ANAnnouncementDataItem(AudioProcessing)
- (uint64_t)processAudioWithEffects:()AudioProcessing error:;
@end

@implementation ANAnnouncementDataItem(AudioProcessing)

- (uint64_t)processAudioWithEffects:()AudioProcessing error:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ([a1 type] == 1)
    {
      v7 = [a1 data];

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E4F4A8F8];
        v9 = [a1 data];
        uint64_t v10 = *MEMORY[0x1E4F4A748];
        v11 = objc_opt_new();
        v12 = [v11 UUIDString];
        v13 = [v8 createTemporaryFileWithData:v9 extension:v10 directory:v12];

        if (v13)
        {
          v14 = (void *)MEMORY[0x1E4F4A8F8];
          v15 = objc_opt_new();
          v16 = [v15 UUIDString];
          v17 = [v14 createTemporaryURLWithFileExtension:v10 directory:v16];

          if (!v17)
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1041, *MEMORY[0x1E4F4A718]);
              BOOL v28 = 0;
              *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              BOOL v28 = 0;
            }
LABEL_44:

            return v28;
          }
          v18 = ANLogHandleAnnouncementDataItem_AudioProcessing();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = NSNumber;
            [v13 audioDuration];
            objc_msgSend(v19, "numberWithDouble:");
            double v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            int v43 = 138412802;
            v44 = &stru_1F34A0E10;
            __int16 v45 = 2112;
            v46 = v13;
            __int16 v47 = 2112;
            double v48 = v20;
            _os_log_impl(&dword_1DA5ED000, v18, OS_LOG_TYPE_DEFAULT, "%@Process Audio Input File: %@, Duration: %@", (uint8_t *)&v43, 0x20u);
          }
          char v21 = [MEMORY[0x1E4F4A920] process:v13 to:v17 withOptions:a3 error:a4];
          v22 = ANLogHandleAnnouncementDataItem_AudioProcessing();
          v23 = v22;
          if (v21)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              int v43 = 138412290;
              v44 = &stru_1F34A0E10;
              _os_log_impl(&dword_1DA5ED000, v23, OS_LOG_TYPE_DEFAULT, "%@Audio Processed Succesfully", (uint8_t *)&v43, 0xCu);
            }

            [v17 audioDuration];
            double v25 = v24;
            v26 = ANLogHandleAnnouncementDataItem_AudioProcessing();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              int v43 = 138412802;
              v44 = &stru_1F34A0E10;
              __int16 v45 = 2112;
              v46 = v17;
              __int16 v47 = 2048;
              double v48 = v25;
              _os_log_impl(&dword_1DA5ED000, v26, OS_LOG_TYPE_DEFAULT, "%@Process Audio Output File: %@, Duration = %f seconds", (uint8_t *)&v43, 0x20u);
            }

            if (v25 > 0.0)
            {
              v27 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v17 options:2 error:a4];
              BOOL v28 = v27 != 0;
              if (v27)
              {
                [a1 setData:v27];
              }
              else
              {
                v38 = ANLogHandleAnnouncementDataItem_AudioProcessing();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  double v39 = *a4;
                  int v43 = 138412802;
                  v44 = &stru_1F34A0E10;
                  __int16 v45 = 2112;
                  v46 = v17;
                  __int16 v47 = 2112;
                  double v48 = v39;
                  _os_log_impl(&dword_1DA5ED000, v38, OS_LOG_TYPE_ERROR, "%@Failed to load data from file: URL = %@, Error = %@", (uint8_t *)&v43, 0x20u);
                }
              }
              goto LABEL_42;
            }
            v35 = [MEMORY[0x1E4F4A8E0] sharedInstance];
            int v36 = [v35 BOOLForDefault:*MEMORY[0x1E4F4A6E8]];

            if (v36)
            {
              v37 = ANLogHandleAnnouncementDataItem_AudioProcessing();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                int v43 = 138412290;
                v44 = &stru_1F34A0E10;
                _os_log_impl(&dword_1DA5ED000, v37, OS_LOG_TYPE_ERROR, "%@Processed audio file is empty. Using original file.", (uint8_t *)&v43, 0xCu);
              }

              BOOL v28 = 1;
              goto LABEL_42;
            }
            if (a4)
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1044, *MEMORY[0x1E4F4A718]);
              BOOL v28 = 0;
              *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
              v40 = [MEMORY[0x1E4F4A8E0] sharedInstance];
              char v41 = [v40 BOOLForDefault:*MEMORY[0x1E4F4A678]];

              if ((v41 & 1) == 0)
              {
                [MEMORY[0x1E4F4A8F8] removeItem:v13];
                [MEMORY[0x1E4F4A8F8] removeItem:v17];
              }
              goto LABEL_44;
            }
          }
          else
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v33 = *(void **)a4;
              int v43 = 138412546;
              v44 = &stru_1F34A0E10;
              __int16 v45 = 2112;
              v46 = v33;
              _os_log_impl(&dword_1DA5ED000, v23, OS_LOG_TYPE_ERROR, "%@Failed to process audio data. Error = %@", (uint8_t *)&v43, 0x16u);
            }

            v34 = +[ANAnalytics shared];
            [v34 error:5019];
          }
          BOOL v28 = 0;
          goto LABEL_42;
        }
      }
      if (a4)
      {
        v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v31 = *MEMORY[0x1E4F4A718];
        uint64_t v32 = 5016;
        goto LABEL_23;
      }
    }
    else if (a4)
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F4A718];
      uint64_t v32 = 1042;
LABEL_23:
      objc_msgSend(v30, "an_errorWithCode:component:", v32, v31);
      BOOL v28 = 0;
      *(void *)a4 = (id)objc_claimAutoreleasedReturnValue();
      return v28;
    }
    return 0;
  }
  v29 = ANLogHandleAnnouncementDataItem_AudioProcessing();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = 138412290;
    v44 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v29, OS_LOG_TYPE_DEFAULT, "%@No effects set. Skipping Audio Processing.", (uint8_t *)&v43, 0xCu);
  }

  return 1;
}

@end