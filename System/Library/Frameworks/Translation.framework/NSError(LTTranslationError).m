@interface NSError(LTTranslationError)
+ (id)lt_errorWithCode:()LTTranslationError description:userInfo:;
+ (id)lt_offlineNotImplementedError;
+ (id)lt_onlineNotImplementedError;
+ (id)lt_speechLimitExceeded;
+ (id)lt_speechTranslationOngoing;
+ (id)lt_translationTimeout;
+ (id)lt_unsupportedLanguageError:()LTTranslationError;
+ (id)lt_unsupportedPairingErrorWithSource:()LTTranslationError target:;
+ (id)lt_unsupportedSourceLanguageError:()LTTranslationError;
+ (id)lt_unsupportedTargetLanguageError:()LTTranslationError;
+ (uint64_t)lt_invalidRequestErrorWithDescription:()LTTranslationError;
@end

@implementation NSError(LTTranslationError)

+ (id)lt_errorWithCode:()LTTranslationError description:userInfo:
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)[v8 mutableCopy];
  }
  else
  {
    v10 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v11 = v10;
  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  v12 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:a3 userInfo:v11];

  return v12;
}

+ (id)lt_onlineNotImplementedError
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"ONLINE_TRANSLATION_NOT_IMPLEMENTED_ERROR_DESCRIPTION" value:&stru_26FAADE68 table:0];
  v4 = objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 1, v3, 0);

  return v4;
}

+ (id)lt_offlineNotImplementedError
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"OFFLINE_TRANSLATION_NOT_IMPLEMENTED_ERROR_DESCRIPTION" value:&stru_26FAADE68 table:0];
  v4 = objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 1, v3, 0);

  return v4;
}

+ (uint64_t)lt_invalidRequestErrorWithDescription:()LTTranslationError
{
  return objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 8, a3, 0);
}

+ (id)lt_speechTranslationOngoing
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"ONGOING_SPEECH_TRANSLATION_ERROR_DESCRIPTION" value:&stru_26FAADE68 table:0];
  v4 = objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 7, v3, 0);

  return v4;
}

+ (id)lt_speechLimitExceeded
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"SPEECH_DURATION_EXCEEDED_ERROR_DESCRIPTION" value:&stru_26FAADE68 table:0];
  v4 = objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 6, v3, 0);

  return v4;
}

+ (id)lt_translationTimeout
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"SERVER_TIMEOUT_ERROR_DESCRIPTION" value:&stru_26FAADE68 table:0];
  v4 = objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 9, v3, 0);

  return v4;
}

+ (id)lt_unsupportedLanguageError:()LTTranslationError
{
  v4 = [a3 _ltLocaleIdentifier];
  v5 = NSString;
  v6 = [MEMORY[0x263F086E0] mainBundle];
  id v7 = [v6 localizedStringForKey:@"UNSUPPORTED_LANGUAGE_ERROR_DESCRIPTION" value:&stru_26FAADE68 table:0];
  id v8 = @"nil";
  if (v4) {
    id v8 = v4;
  }
  v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8);

  v10 = objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 18, v9, 0);

  return v10;
}

+ (id)lt_unsupportedPairingErrorWithSource:()LTTranslationError target:
{
  v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  [v8 setObject:v7 forKeyedSubscript:@"sourceLocale"];

  [v8 setObject:v6 forKeyedSubscript:@"targetLocale"];
  v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:11 userInfo:v8];

  return v9;
}

+ (id)lt_unsupportedSourceLanguageError:()LTTranslationError
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  v5 = [v3 dictionary];
  [v5 setObject:v4 forKeyedSubscript:@"sourceLocale"];

  id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:18 userInfo:v5];

  return v6;
}

+ (id)lt_unsupportedTargetLanguageError:()LTTranslationError
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  v5 = [v3 dictionary];
  [v5 setObject:v4 forKeyedSubscript:@"targetLocale"];

  id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:19 userInfo:v5];

  return v6;
}

@end