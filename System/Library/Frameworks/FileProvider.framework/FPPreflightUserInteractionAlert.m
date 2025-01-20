@interface FPPreflightUserInteractionAlert
+ (id)alertFromDictionary:(id)a3 localizationLookup:(id)a4;
- (BOOL)continueIsDestructive;
- (BOOL)enableContinue;
- (FPStringFormat)cancelCaptionFormat;
- (FPStringFormat)continueCaptionFormat;
- (FPStringFormat)subtitleFormat;
- (FPStringFormat)titleFormat;
- (void)setCancelCaptionFormat:(id)a3;
- (void)setContinueCaptionFormat:(id)a3;
- (void)setContinueIsDestructive:(BOOL)a3;
- (void)setEnableContinue:(BOOL)a3;
- (void)setSubtitleFormat:(id)a3;
- (void)setTitleFormat:(id)a3;
@end

@implementation FPPreflightUserInteractionAlert

+ (id)alertFromDictionary:(id)a3 localizationLookup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_opt_new();
    v8 = [v5 objectForKeyedSubscript:@"LocalizedTitle"];
    v9 = +[FPStringFormat formatForPlistObject:v8 localizationLookup:v6];
    [v7 setTitleFormat:v9];

    v10 = [v5 objectForKeyedSubscript:@"LocalizedSubTitle"];
    v11 = +[FPStringFormat formatForPlistObject:v10 localizationLookup:v6];
    [v7 setSubtitleFormat:v11];

    v12 = [v7 titleFormat];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      v14 = [v5 objectForKeyedSubscript:@"LocalizedRecoveryOptions"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v14 = 0;
      }
      v15 = [v14 objectForKeyedSubscript:@"Continue"];
      v16 = +[FPStringFormat formatForPlistObject:v15 localizationLookup:v6];
      [v7 setContinueCaptionFormat:v16];

      v17 = [v14 objectForKeyedSubscript:@"Cancel"];
      v18 = +[FPStringFormat formatForPlistObject:v17 localizationLookup:v6];
      [v7 setCancelCaptionFormat:v18];

      [v7 setEnableContinue:1];
      [v7 setContinueIsDestructive:0];
      v19 = [v5 objectForKeyedSubscript:@"RecoveryOptions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [v19 objectForKeyedSubscript:@"Continue"];
        v21 = [v19 objectForKeyedSubscript:@"Destructive"];
        if (v20)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v7, "setEnableContinue:", objc_msgSend(v20, "BOOLValue"));
          }
        }
        if (v21)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v7, "setContinueIsDestructive:", objc_msgSend(v21, "BOOLValue"));
          }
        }
      }
      id v22 = v7;
    }
    else
    {
      v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        +[FPPreflightUserInteractionAlert alertFromDictionary:localizationLookup:]();
      }

      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (FPStringFormat)titleFormat
{
  return self->_titleFormat;
}

- (void)setTitleFormat:(id)a3
{
}

- (FPStringFormat)subtitleFormat
{
  return self->_subtitleFormat;
}

- (void)setSubtitleFormat:(id)a3
{
}

- (FPStringFormat)continueCaptionFormat
{
  return self->_continueCaptionFormat;
}

- (void)setContinueCaptionFormat:(id)a3
{
}

- (FPStringFormat)cancelCaptionFormat
{
  return self->_cancelCaptionFormat;
}

- (void)setCancelCaptionFormat:(id)a3
{
}

- (BOOL)enableContinue
{
  return self->_enableContinue;
}

- (void)setEnableContinue:(BOOL)a3
{
  self->_enableContinue = a3;
}

- (BOOL)continueIsDestructive
{
  return self->_continueIsDestructive;
}

- (void)setContinueIsDestructive:(BOOL)a3
{
  self->_continueIsDestructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelCaptionFormat, 0);
  objc_storeStrong((id *)&self->_continueCaptionFormat, 0);
  objc_storeStrong((id *)&self->_subtitleFormat, 0);

  objc_storeStrong((id *)&self->_titleFormat, 0);
}

+ (void)alertFromDictionary:localizationLookup:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] Alert %@ doesn't have a title defined", v2);
}

@end