@interface ANAnnouncement(AudioProcessing)
+ (uint64_t)defaultAudioEffects;
- (uint64_t)processAudioWithEffects:()AudioProcessing error:;
@end

@implementation ANAnnouncement(AudioProcessing)

- (uint64_t)processAudioWithEffects:()AudioProcessing error:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v7 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  char v8 = [v7 BOOLForDefault:*MEMORY[0x1E4F4A680]];

  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = objc_msgSend(a1, "dataItems", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v14 type] == 1 && (objc_msgSend(v14, "flags") & 1) != 0)
          {
            if (![v14 processAudioWithEffects:a3 error:a4])
            {
              uint64_t v15 = 0;
              goto LABEL_20;
            }
            objc_msgSend(v14, "setFlags:", objc_msgSend(v14, "flags") & 0xFFFFFFFFFFFFFFFELL);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    if (ANLogHandleAudioProcessing_once != -1) {
      dispatch_once(&ANLogHandleAudioProcessing_once, &__block_literal_global_9);
    }
    v9 = (id)ANLogHandleAudioProcessing_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@Audio Normalization is Disabled", buf, 0xCu);
    }
  }
  uint64_t v15 = 1;
LABEL_20:

  return v15;
}

+ (uint64_t)defaultAudioEffects
{
  return 1;
}

@end