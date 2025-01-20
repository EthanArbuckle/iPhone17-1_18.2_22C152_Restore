@interface AKBiometricRatchetUtility
+ (id)ratchetIdentifier;
+ (id)resultForNonArmingFromError:(id)a3;
+ (id)resultForSuccessfulArmingFromResponse:(id)a3;
+ (id)stateFromLARatchetState:(id)a3;
+ (unint64_t)armingMethodFromRatchetResult:(id)a3;
+ (void)setRatchetIdentifier:(id)a3;
@end

@implementation AKBiometricRatchetUtility

+ (id)stateFromLARatchetState:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  switch([v3 rawValue])
  {
    case 0:
    case 1:
      v5 = [v3 value];
      char v6 = objc_opt_respondsToSelector();

      uint64_t v7 = 1;
      if (v6) {
        goto LABEL_10;
      }
      break;
    case 2:
      v8 = [v3 value];
      char v9 = objc_opt_respondsToSelector();

      uint64_t v7 = 2;
      if (v9) {
        goto LABEL_10;
      }
      break;
    case 3:
      v10 = [v3 value];
      char v11 = objc_opt_respondsToSelector();

      uint64_t v7 = 3;
      if (v11) {
        goto LABEL_10;
      }
      break;
    case 4:
      v12 = [v3 value];
      char v13 = objc_opt_respondsToSelector();

      uint64_t v7 = 4;
      if (v13)
      {
LABEL_10:
        v14 = [v3 value];
        [v14 duration];
        double v4 = v15;
      }
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F4F098]) initWithDuration:v4];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F4F090]) initWithRawState:v7 data:v16];

  return v17;
}

+ (unint64_t)armingMethodFromRatchetResult:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 objectForKeyedSubscript:&unk_1F1F036A8];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  objc_opt_class();
  id v6 = [v3 objectForKeyedSubscript:&unk_1F1F036C0];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if ([v5 BOOLValue])
  {
    unint64_t v8 = 3;
  }
  else if ([v7 BOOLValue])
  {
    unint64_t v8 = 2;
  }
  else
  {
    unint64_t v8 = 1;
  }

  return v8;
}

+ (id)ratchetIdentifier
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"AKBiometricRatchetIdentifierKey"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F47018] bundleIdentifier];
  }
  id v5 = v4;

  return v5;
}

+ (void)setRatchetIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[AKBiometricRatchetUtility setRatchetIdentifier:](v4);
  }

  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFPreferencesSetAppValue(@"AKBiometricRatchetIdentifierKey", v3, (CFStringRef)*MEMORY[0x1E4F1D3B8]);

  CFPreferencesSynchronize(v5, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
}

+ (id)resultForSuccessfulArmingFromResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:&unk_1F1F036D8];
  CFStringRef v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[AKBiometricRatchetUtility resultForSuccessfulArmingFromResponse:]((uint64_t)v4, v5);
  }

  unint64_t v6 = +[AKBiometricRatchetUtility armingMethodFromRatchetResult:v3];
  id v7 = +[AKBiometricRatchetUtility stateFromLARatchetState:v4];
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F4EFE0]) initWithRatchetState:v7 armingMethod:v6];

  return v8;
}

+ (id)resultForNonArmingFromError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  CFStringRef v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F30B48]];

  unint64_t v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[AKBiometricRatchetUtility resultForNonArmingFromError:v6];
  }

  if ([v3 code] || !v5)
  {
    if ([v3 code] == 3)
    {
      v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        +[AKBiometricRatchetUtility resultForNonArmingFromError:](v10);
      }

      exit(0);
    }
    unint64_t v8 = 0;
  }
  else
  {
    id v7 = +[AKBiometricRatchetUtility stateFromLARatchetState:v5];
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F4EFE0]) initWithRatchetState:v7 armingMethod:1];
  }

  return v8;
}

+ (void)setRatchetIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  v2 = "+[AKBiometricRatchetUtility setRatchetIdentifier:]";
  __int16 v3 = 1024;
  int v4 = 107;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "%s (%d) called", (uint8_t *)&v1, 0x12u);
}

+ (void)resultForSuccessfulArmingFromResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Ratchet is armed with state: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)resultForNonArmingFromError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "User selected Quick Exit, calling exit(0) on purpose", v1, 2u);
}

+ (void)resultForNonArmingFromError:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "Ratchet is not armed - error: %@, ratchet state: %@", (uint8_t *)&v3, 0x16u);
}

@end