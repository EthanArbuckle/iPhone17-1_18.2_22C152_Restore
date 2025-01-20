@interface ATXActionPredictionTypes
+ (id)actionExperienceToString:(unint64_t)a3;
+ (id)actionFeedbackStageToString:(unint64_t)a3;
+ (id)actionFeedbackTypeToString:(unint64_t)a3;
+ (id)actionTypeToPETString:(unint64_t)a3;
+ (id)actionTypeToString:(unint64_t)a3;
+ (id)engagementTypeToString:(unint64_t)a3;
+ (id)inverseActionFeedbackTypeMapping;
+ (unint64_t)stringToActionExperience:(id)a3 found:(BOOL *)a4;
+ (unint64_t)stringToActionFeedbackStage:(id)a3 found:(BOOL *)a4;
@end

@implementation ATXActionPredictionTypes

+ (id)engagementTypeToString:(unint64_t)a3
{
  if (a3 < 0xB) {
    return off_1E5D058A8[a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXActionPredictionTypes engagementTypeToString:]();
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Invalid value of %lu passed to engagementTypeToString", a3);
  return @"Error";
}

+ (id)actionExperienceToString:(unint64_t)a3
{
  if (a3 < 5) {
    return off_1E5D05900[a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXActionPredictionTypes actionExperienceToString:]();
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Invalid value of %lu passed to actionExperienceToString", a3);
  return @"Error";
}

+ (id)actionTypeToString:(unint64_t)a3
{
  if (a3 < 7) {
    return off_1E5D05928[a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXActionPredictionTypes actionTypeToString:]();
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Invalid value of %lu passed to actionTypeToString", a3);
  return @"Error";
}

+ (id)actionFeedbackStageToString:(unint64_t)a3
{
  if (a3 < 9) {
    return off_1E5D05960[a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXActionPredictionTypes actionFeedbackStageToString:]();
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Invalid value of %lu passed to actionFeedbackStageString", a3);
  return @"Error";
}

+ (id)actionFeedbackTypeToString:(unint64_t)a3
{
  if (a3 < 4) {
    return off_1E5D059A8[a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXActionPredictionTypes actionFeedbackTypeToString:]();
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Invalid value of %lu passed to actionFeedbackTypeToString", a3);
  return @"Error";
}

+ (unint64_t)stringToActionExperience:(id)a3 found:(BOOL *)a4
{
  id v5 = a3;
  unint64_t v6 = 0;
  while (1)
  {
    v7 = [(id)objc_opt_class() actionExperienceToString:v6];
    int v8 = [v7 isEqualToString:v5];

    if (v8) {
      break;
    }
    if (++v6 == 4)
    {
      unint64_t v6 = 0;
      if (!a4) {
        goto LABEL_9;
      }
      BOOL v9 = 0;
      goto LABEL_8;
    }
  }
  if (!a4) {
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_8:
  *a4 = v9;
LABEL_9:

  return v6;
}

+ (unint64_t)stringToActionFeedbackStage:(id)a3 found:(BOOL *)a4
{
  id v6 = a3;
  unint64_t v7 = 0;
  while (1)
  {
    int v8 = [a1 actionFeedbackStageToString:v7];
    int v9 = [v8 isEqualToString:v6];

    if (v9) {
      break;
    }
    if (++v7 == 8)
    {
      unint64_t v7 = 0;
      if (!a4) {
        goto LABEL_9;
      }
      BOOL v10 = 0;
      goto LABEL_8;
    }
  }
  if (!a4) {
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_8:
  *a4 = v10;
LABEL_9:

  return v7;
}

+ (id)inverseActionFeedbackTypeMapping
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v5 = [NSNumber numberWithUnsignedInteger:i];
    id v6 = [a1 actionFeedbackTypeToString:i];
    [v3 setObject:v5 forKeyedSubscript:v6];
  }

  return v3;
}

+ (id)actionTypeToPETString:(unint64_t)a3
{
  if (a3 > 5) {
    return @"other";
  }
  else {
    return off_1E5D059C8[a3];
  }
}

+ (void)engagementTypeToString:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Invalid value of %lu passed to engagementTypeToString", v2, v3, v4, v5, v6);
}

+ (void)actionExperienceToString:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Invalid value of %lu passed to actionExperienceToString", v2, v3, v4, v5, v6);
}

+ (void)actionTypeToString:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Invalid value of %lu passed to actionTypeToString", v2, v3, v4, v5, v6);
}

+ (void)actionFeedbackStageToString:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Invalid value of %lu passed to actionFeedbackStageString", v2, v3, v4, v5, v6);
}

+ (void)actionFeedbackTypeToString:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Invalid value of %lu passed to actionFeedbackTypeToString", v2, v3, v4, v5, v6);
}

@end