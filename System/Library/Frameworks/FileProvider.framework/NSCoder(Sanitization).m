@interface NSCoder(Sanitization)
- (id)fp_sanitizer;
- (uint64_t)fp_checkProviderIdentifier:()Sanitization;
@end

@implementation NSCoder(Sanitization)

- (uint64_t)fp_checkProviderIdentifier:()Sanitization
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "fp_sanitizer");
  if (!v5) {
    goto LABEL_3;
  }
  v6 = (void *)v5;
  v7 = objc_msgSend(v4, "fp_toProviderID");
  v8 = objc_msgSend(a1, "fp_sanitizer");
  v9 = [v8 providerIdentifier];
  v10 = objc_msgSend(v9, "fp_toProviderID");
  char v11 = [v7 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(NSCoder(Sanitization) *)(uint64_t)v4 fp_checkProviderIdentifier:v13];
    }

    v14 = NSString;
    v15 = objc_msgSend(a1, "fp_sanitizer");
    v16 = [v15 providerIdentifier];
    v17 = [v14 stringWithFormat:@"Got invalid provider identifier %@ from coder for extension %@", v4, v16];

    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F281F8];
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = v17;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v21 = [v18 errorWithDomain:v19 code:4101 userInfo:v20];
    [a1 failWithError:v21];

    uint64_t v12 = 0;
  }
  else
  {
LABEL_3:
    uint64_t v12 = 1;
  }

  return v12;
}

- (id)fp_sanitizer
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 userInfo];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = [v2 objectForKey:@"FPXPCSanitizerKey"];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)fp_checkProviderIdentifier:()Sanitization .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a2, "fp_sanitizer");
  v6 = [v5 providerIdentifier];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Got invalid provider identifier %@ from coder for extension %@", (uint8_t *)&v7, 0x16u);
}

@end