@interface EKEvent(Saving)
+ (uint64_t)updateVirtualConference:()Saving replacing:with:;
- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving error:;
- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving error:;
- (void)fixInvalidatedVirtualConferenceURLs:()Saving;
@end

@implementation EKEvent(Saving)

- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving error:
{
  objc_msgSend(a1, "fixInvalidatedVirtualConferenceURLs:");
  v7 = [a1 eventStore];
  uint64_t v8 = [v7 saveEvent:a1 span:a3 commit:0 error:a4];

  if (v8)
  {
    [a1 postModifiedNotification];
  }
  else
  {
    v9 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[EKEvent(Saving) CUIKEditingContext_saveWithSpan:error:]();
    }
  }
  return v8;
}

- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving error:
{
  v7 = [a1 eventStore];
  uint64_t v8 = [v7 removeEvent:a1 span:a3 commit:0 error:a4];

  if (v8)
  {
    [a1 postModifiedNotification];
    +[CUIKEditingContext postLiveEditNotificationForObject:a1];
  }
  else
  {
    v9 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[EKEvent(Saving) CUIKEditingContext_removeWithSpan:error:]();
    }
  }
  return v8;
}

- (void)fixInvalidatedVirtualConferenceURLs:()Saving
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [a1 virtualConference];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v22 = long long v32 = 0u;
  v5 = [v22 joinMethods];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (!v6) {
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v30;
  v24 = 0;
  id obj = v5;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) URL];
      v11 = (void *)MEMORY[0x1E4F25510];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke;
      v25[3] = &unk_1E636A680;
      id v12 = v10;
      id v26 = v12;
      v27 = a1;
      uint64_t v28 = a3;
      v13 = [v11 validURLForConferenceURL:v12 completion:v25];
      v14 = v13;
      if (v13)
      {
        int v15 = [v13 isEqual:v12];
        v16 = +[CUIKLogSubsystem editingContext];
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v17)
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v12;
            _os_log_impl(&dword_1BDF08000, v16, OS_LOG_TYPE_INFO, "URL %@ is still valid.", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v18 = v8;
          if (v17)
          {
            *(_DWORD *)buf = 138412546;
            id v34 = v12;
            __int16 v35 = 2112;
            v36 = v14;
            _os_log_impl(&dword_1BDF08000, v16, OS_LOG_TYPE_INFO, "Replacing URL %@ with %@.", buf, 0x16u);
          }
          uint64_t v19 = a3;

          uint64_t v20 = (uint64_t)v24;
          if (!v24) {
            uint64_t v20 = [v22 copy];
          }
          v21 = objc_opt_class();
          v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
          v24 = (void *)v20;
          [v21 updateVirtualConference:v20 replacing:v16 with:v14];
          a3 = v19;
          uint64_t v8 = v18;
        }
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  }
  while (v7);

  if (v24)
  {
    [a1 setVirtualConference:v24];
    v5 = v24;
LABEL_20:
  }
}

+ (uint64_t)updateVirtualConference:()Saving replacing:with:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v22 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [v7 joinMethods];
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    char v12 = 0;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v16 = [v15 URL];
        int v17 = [v8 containsObject:v16];

        if (v17)
        {
          uint64_t v18 = [v7 joinMethods];
          uint64_t v19 = (void *)[v18 mutableCopy];

          uint64_t v20 = (void *)[v15 copy];
          [v20 setURL:v22];
          [v19 setObject:v20 atIndexedSubscript:v11 + i];
          [v7 setJoinMethods:v19];

          char v12 = 1;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      v11 += i;
    }
    while (v10);
  }
  else
  {
    char v12 = 0;
  }

  return v12 & 1;
}

- (void)CUIKEditingContext_saveWithSpan:()Saving error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_1BDF08000, v0, v1, "Event %@ failed to save with error %@");
}

- (void)CUIKEditingContext_removeWithSpan:()Saving error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_1BDF08000, v0, v1, "Event %@ failed to remove with error %@");
}

@end