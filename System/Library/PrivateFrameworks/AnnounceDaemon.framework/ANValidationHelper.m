@interface ANValidationHelper
+ (id)_runValidationCheck:(id)a3 isRetry:(BOOL)a4;
+ (id)performBasicValidationForAnnouncement:(id)a3 type:(unint64_t)a4;
+ (id)performPreflightChecksForSendingContent:(id)a3 toHome:(id)a4 rooms:(id)a5 zones:(id)a6;
@end

@implementation ANValidationHelper

+ (id)performBasicValidationForAnnouncement:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__ANValidationHelper_performBasicValidationForAnnouncement_type___block_invoke;
  v10[3] = &unk_1E6BCEE98;
  id v11 = v6;
  unint64_t v12 = a4;
  id v7 = v6;
  v8 = [a1 _runValidationCheck:v10 isRetry:0];

  return v8;
}

id __65__ANValidationHelper_performBasicValidationForAnnouncement_type___block_invoke(uint64_t a1)
{
  return +[ANMessenger performBasicValidationForAnnouncement:*(void *)(a1 + 32) type:*(void *)(a1 + 40)];
}

+ (id)performPreflightChecksForSendingContent:(id)a3 toHome:(id)a4 rooms:(id)a5 zones:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__ANValidationHelper_performPreflightChecksForSendingContent_toHome_rooms_zones___block_invoke;
  v20[3] = &unk_1E6BCEEC0;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  v18 = [a1 _runValidationCheck:v20 isRetry:0];

  return v18;
}

id __81__ANValidationHelper_performPreflightChecksForSendingContent_toHome_rooms_zones___block_invoke(void *a1)
{
  return +[ANMessenger performPreflightChecksForSendingContent:a1[4] toHome:a1[5] rooms:a1[6] zones:a1[7]];
}

+ (id)_runValidationCheck:(id)a3 isRetry:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a3;
  id v7 = ANLogHandleValidationHelper();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    v20 = &stru_1F34A0E10;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@Starting validation check (is retry = %d)", (uint8_t *)&v19, 0x12u);
  }

  v8 = v6[2](v6);
  v9 = v8;
  if (v8)
  {
    if ([v8 isHomeError]) {
      BOOL v10 = !v4;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      id v13 = ANLogHandleValidationHelper();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        v20 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@Validation check failed with Home error - requesting HomeManager refresh", (uint8_t *)&v19, 0xCu);
      }

      id v14 = +[ANHomeManager shared];
      id v15 = [v14 refreshHomeSynchronous];

      if (v15)
      {
        id v16 = ANLogHandleValidationHelper();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          v20 = &stru_1F34A0E10;
          _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "%@Validation check failed - HomeManager refresh error", (uint8_t *)&v19, 0xCu);
        }

        id v17 = v15;
      }
      else
      {
        id v17 = [a1 _runValidationCheck:v6 isRetry:1];
      }
      id v11 = v17;
    }
    else
    {
      id v11 = v9;
    }
  }
  else
  {
    id v12 = ANLogHandleValidationHelper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      v20 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_DEFAULT, "%@Validation check success", (uint8_t *)&v19, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

@end