@interface AKLAContextValidator
+ (BOOL)validateExternalizedContext:(id)a3 error:(id *)a4;
@end

@implementation AKLAContextValidator

+ (BOOL)validateExternalizedContext:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F30B58];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithExternalizedContext:v6];

  id v13 = 0;
  v8 = [v7 evaluatePolicy:4 options:MEMORY[0x1E4F1CC08] error:&v13];
  id v9 = v13;
  v10 = _AKLogSiwa();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[AKLAContextValidator validateExternalizedContext:error:]((uint64_t)v8, (uint64_t)v9, v10);
  }

  if (v9)
  {
    v11 = _AKLogSiwa();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[AKLAContextValidator validateExternalizedContext:error:]((uint64_t)v9, v11);
    }

    if (a4) {
      *a4 = v9;
    }
  }

  return v9 == 0;
}

+ (void)validateExternalizedContext:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Failed to validate externalized Context data with error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)validateExternalizedContext:(os_log_t)log error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Biometric validation of externalizedContext completed with result: %@ and error: %@", (uint8_t *)&v3, 0x16u);
}

@end