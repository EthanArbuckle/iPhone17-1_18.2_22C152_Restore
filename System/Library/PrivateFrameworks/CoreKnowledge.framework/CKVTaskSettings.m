@interface CKVTaskSettings
+ (id)buildVersion;
+ (id)defaultSettings;
+ (id)projectNameAndSourceVersion;
- (BOOL)isEvaluationEnabled;
- (BOOL)isEvaluationWithProfile;
- (BOOL)isTaskCoalescenceDisabled;
- (BOOL)isTaskEnabled:(unsigned __int16)a3 reason:(unsigned __int16)a4;
- (CKVLocalization)localization;
- (CKVTaskSettings)init;
- (CKVTaskSettings)initWithLocalization:(id)a3;
- (void)refreshLocalization;
- (void)setEvaluationEnabled:(BOOL)a3;
- (void)setEvaluationWithProfile:(BOOL)a3;
- (void)setTaskCoalescenceDisabled:(BOOL)a3;
@end

@implementation CKVTaskSettings

- (CKVLocalization)localization
{
  return (CKVLocalization *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isTaskEnabled:(unsigned __int16)a3 reason:(unsigned __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    v9 = CKVTaskIdDescription(v5);
    uint64_t v10 = _BOOLValueForKey((const __CFString *)[NSString stringWithFormat:@"Task %@", @"*"]);
    if (v10)
    {
      v11 = (void *)v10;
    }
    else
    {
      v11 = _BOOLValueForKey((const __CFString *)[NSString stringWithFormat:@"Task %@", v9]);

      if (!v11) {
        goto LABEL_2;
      }
    }
    char v12 = [v11 BOOLValue];

    LOBYTE(v8) = v12;
    return v8;
  }
LABEL_2:
  if (v4 != 15 && v4 != 17 && [(CKVTaskSettings *)self isEvaluationWithProfile])
  {
    v7 = CKLogContextVocabulary;
    BOOL v8 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
    if (!v8) {
      return v8;
    }
    *(_DWORD *)buf = 136315138;
    v16 = "-[CKVTaskSettings isTaskEnabled:reason:]";
    _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s Evaluation with profile is enabled, blocking all real task events.", buf, 0xCu);
    goto LABEL_7;
  }
  if (v5 > 100)
  {
    if ((v5 - 101) >= 3)
    {
      if (v5 == 104)
      {
LABEL_22:
        if (!+[CKVAssistantSettingsBridge isSiriUODSupported])
        {
          LOBYTE(v8) = +[CKVAssistantSettingsBridge isASRSupported];
          return v8;
        }
      }
      else if (v5 != 105)
      {
LABEL_20:
        v13 = CKLogContextVocabulary;
        BOOL v8 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR);
        if (!v8) {
          return v8;
        }
        *(_DWORD *)buf = 136315394;
        v16 = "-[CKVTaskSettings isTaskEnabled:reason:]";
        __int16 v17 = 1024;
        int v18 = v5;
        _os_log_error_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_ERROR, "%s Unexpected taskId: %u", buf, 0x12u);
LABEL_7:
        LOBYTE(v8) = 0;
        return v8;
      }
    }
LABEL_23:
    LOBYTE(v8) = 1;
    return v8;
  }
  LOBYTE(v8) = 0;
  switch(v5)
  {
    case 0:
    case 5:
    case 7:
      return v8;
    case 1:
    case 2:
    case 10:
      goto LABEL_23;
    case 3:
    case 4:
    case 6:
      goto LABEL_22;
    case 8:
    case 9:
    case 11:
      LOBYTE(v8) = +[CKVAssistantSettingsBridge isSiriUODSupported];
      break;
    default:
      goto LABEL_20;
  }
  return v8;
}

- (BOOL)isTaskCoalescenceDisabled
{
  if (+[CKVAssistantSettingsBridge isCustomerInstall]) {
    return 0;
  }
  v3 = _BOOLValueForKey(@"Disable Coalescence");
  int v4 = v3;
  if (v3) {
    char v2 = [v3 BOOLValue];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

- (BOOL)isEvaluationWithProfile
{
  if (+[CKVAssistantSettingsBridge isCustomerInstall]) {
    return 0;
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_evaluationWithProfileEnabled);
  return v4 & 1;
}

- (void).cxx_destruct
{
}

- (void)setEvaluationWithProfile:(BOOL)a3
{
  if (!+[CKVAssistantSettingsBridge isCustomerInstall]) {
    atomic_store(a3, (unsigned __int8 *)&self->_evaluationWithProfileEnabled);
  }
}

- (void)setEvaluationEnabled:(BOOL)a3
{
  if (!+[CKVAssistantSettingsBridge isCustomerInstall]) {
    atomic_store(a3, (unsigned __int8 *)&self->_evaluationEnabled);
  }
}

- (BOOL)isEvaluationEnabled
{
  if (+[CKVAssistantSettingsBridge isCustomerInstall]) {
    return 0;
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_evaluationEnabled);
  return v4 & 1;
}

- (void)setTaskCoalescenceDisabled:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  unsigned __int8 v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    v6 = "_setValueForKey";
    __int16 v7 = 2112;
    BOOL v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = @"Disable Coalescence";
    _os_log_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_INFO, "%s Setting value: %@ for key: %@", (uint8_t *)&v5, 0x20u);
  }
  CFPreferencesSetAppValue(@"Disable Coalescence", v3, @"com.apple.IntelligenceTasks");
}

- (void)refreshLocalization
{
}

- (CKVTaskSettings)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVTaskSettings)initWithLocalization:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKVTaskSettings;
  v6 = [(CKVTaskSettings *)&v9 init];
  __int16 v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localization, a3);
  }

  return v7;
}

+ (id)defaultSettings
{
  id v2 = objc_alloc((Class)objc_opt_class());
  v3 = +[CKVLocalization defaultLocalization];
  unsigned __int8 v4 = (void *)[v2 initWithLocalization:v3];

  return v4;
}

+ (id)projectNameAndSourceVersion
{
  return @"GraphDB-3402.13.1";
}

+ (id)buildVersion
{
  return +[CKVAssistantSettingsBridge buildVersion];
}

@end