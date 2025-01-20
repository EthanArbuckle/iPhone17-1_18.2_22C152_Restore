@interface _LTTextToSpeechSanitizer
+ (BOOL)stringContainsRedaction:(id)a3;
+ (id)_regularExpression;
+ (id)_stringReplacingRedactionsInString:(id)a3 withMarker:(id)a4;
+ (id)stringReplacingRedactionsWithBeepMarker:(id)a3;
@end

@implementation _LTTextToSpeechSanitizer

+ (id)stringReplacingRedactionsWithBeepMarker:(id)a3
{
  v3 = [a1 _stringReplacingRedactionsInString:a3 withMarker:@"_LT_Placeholder_##$#$#$"];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"_LT_Placeholder_##$#$#$" withString:@"\x1B\\mrk=play=beep.wav\\""];

  return v4;
}

+ (BOOL)stringContainsRedaction:(id)a3
{
  id v4 = a3;
  v5 = [a1 _regularExpression];
  if (v5)
  {
    BOOL v6 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = _LTOSLogTTS();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[_LTTextToSpeechSanitizer stringContainsRedaction:](v7);
    }
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)_stringReplacingRedactionsInString:(id)a3 withMarker:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 rangeOfString:@"*"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = _LTOSLogTTS();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_24639B000, v8, OS_LOG_TYPE_INFO, "Not attempting to sanitize string because it has no asterisks", (uint8_t *)&v17, 2u);
    }
    id v9 = v6;
  }
  else
  {
    v10 = [a1 _regularExpression];
    if (v10)
    {
      v11 = (void *)[v6 mutableCopy];
      uint64_t v12 = objc_msgSend(v10, "replaceMatchesInString:options:range:withTemplate:", v11, 0, 0, objc_msgSend(v11, "length"), v7);
      v13 = _LTOSLogTTS();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        int v17 = 134218240;
        uint64_t v18 = v12;
        __int16 v19 = 2048;
        uint64_t v20 = [v6 length];
        _os_log_impl(&dword_24639B000, v14, OS_LOG_TYPE_INFO, "Replaced %zu censored words with beep marker in TTS string of length %zu", (uint8_t *)&v17, 0x16u);
      }
      id v9 = (id)[v11 copy];
    }
    else
    {
      v15 = _LTOSLogTTS();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[_LTTextToSpeechSanitizer _stringReplacingRedactionsInString:withMarker:](v15);
      }
      id v9 = v6;
    }
  }

  return v9;
}

+ (id)_regularExpression
{
  if (_regularExpression_onceToken[0] != -1) {
    dispatch_once(_regularExpression_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)_regularExpression_regularExpression;

  return v2;
}

+ (void)stringContainsRedaction:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Failed to create regular expression to find censored speech, returning that no redactions were found", v1, 2u);
}

+ (void)_stringReplacingRedactionsInString:(os_log_t)log withMarker:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Failed to create regular expression to find censored speech, just returning original string", v1, 2u);
}

@end