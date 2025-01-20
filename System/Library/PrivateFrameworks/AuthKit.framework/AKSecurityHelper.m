@interface AKSecurityHelper
+ (id)signData:(id)a3 withKey:(__SecKey *)a4 error:(id *)a5;
@end

@implementation AKSecurityHelper

+ (id)signData:(id)a3 withKey:(__SecKey *)a4 error:(id *)a5
{
  CFErrorRef error = 0;
  CFDataRef v6 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], (CFDataRef)a3, &error);
  CFDataRef v7 = v6;
  CFErrorRef v8 = error;
  if (v6)
  {
    CFDataRef v9 = v6;
    goto LABEL_13;
  }
  v10 = _AKLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11) {
      +[AKSecurityHelper signData:withKey:error:]((uint64_t)v8, v10);
    }

    if (a5)
    {
      v12 = v8;
LABEL_12:
      *a5 = v12;
    }
  }
  else
  {
    if (v11) {
      +[AKSecurityHelper signData:withKey:error:](v10);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_generalErrorWithCode:errorDomain:underlyingError:", -17001, @"AKGenericError", 0);
      v12 = (__CFError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
LABEL_13:

  return v7;
}

+ (void)signData:(os_log_t)log withKey:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Failed to generate signature: unknown error!", v1, 2u);
}

+ (void)signData:(uint64_t)a1 withKey:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Failed to generate signature: %@", (uint8_t *)&v2, 0xCu);
}

@end