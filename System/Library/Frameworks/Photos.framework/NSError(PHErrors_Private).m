@interface NSError(PHErrors_Private)
+ (id)_ph_genericErrorWithUnderlyingError:()PHErrors_Private localizedDescription:;
+ (id)ph_errorWithCode:()PHErrors_Private localizedDescription:;
+ (id)ph_errorWithDomain:()PHErrors_Private code:userInfo:;
+ (id)ph_genericEntitlementError;
+ (id)ph_genericErrorWithLocalizedDescription:()PHErrors_Private;
+ (id)ph_genericErrorWithUnderlyingError:()PHErrors_Private localizedDescription:;
@end

@implementation NSError(PHErrors_Private)

+ (id)ph_genericEntitlementError
{
  if (ph_genericEntitlementError_onceToken != -1) {
    dispatch_once(&ph_genericEntitlementError_onceToken, &__block_literal_global_41892);
  }
  v0 = (void *)ph_genericEntitlementError_s_error;

  return v0;
}

+ (id)ph_genericErrorWithUnderlyingError:()PHErrors_Private localizedDescription:
{
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v12 = a3;
  v13 = (__CFString *)CFStringCreateWithFormatAndArguments(v11, 0, a4, &a9);
  v14 = objc_msgSend(a1, "_ph_genericErrorWithUnderlyingError:localizedDescription:", v12, v13);

  return v14;
}

+ (id)ph_genericErrorWithLocalizedDescription:()PHErrors_Private
{
  v10 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, a3, &a9);
  CFAllocatorRef v11 = objc_msgSend(a1, "_ph_genericErrorWithUnderlyingError:localizedDescription:", 0, v10);

  return v11;
}

+ (id)ph_errorWithCode:()PHErrors_Private localizedDescription:
{
  va_start(va, format);
  v6 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, format, va);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  v8 = objc_msgSend(a1, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", a3, v7);

  return v8;
}

+ (id)_ph_genericErrorWithUnderlyingError:()PHErrors_Private localizedDescription:
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];

  [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  v10 = objc_msgSend(a1, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v9);

  return v10;
}

+ (id)ph_errorWithDomain:()PHErrors_Private code:userInfo:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4F281F8];
  int v11 = [(__CFString *)v8 isEqualToString:*MEMORY[0x1E4F281F8]];
  if (a4 == 3072 && v11)
  {

    id v8 = @"PHPhotosErrorDomain";
  }
  if (PHErrorAllowsInternalErrors())
  {
    id v12 = a1;
    v13 = v8;
    uint64_t v14 = a4;
    id v15 = v9;
LABEL_39:
    v23 = [v12 errorWithDomain:v13 code:v14 userInfo:v15];
    goto LABEL_40;
  }
  if (dyld_program_sdk_at_least())
  {
    v16 = v8;
    if ([(__CFString *)v16 isEqualToString:@"PHPhotosErrorDomain"])
    {
      if (a4 > 3168)
      {
        if (((unint64_t)(a4 - 3300) > 0xB || ((1 << (a4 + 28)) & 0xC6F) == 0)
          && ((unint64_t)(a4 - 3169) > 0x29 || ((1 << (a4 - 97)) & 0x20300000001) == 0)
          && a4 != 5423)
        {
          goto LABEL_24;
        }
      }
      else if (((unint64_t)(a4 - 3105) > 0x3B || ((1 << (a4 - 33)) & 0x800006000000201) == 0) {
             && a4 != -1
      }
             && a4 != 3072)
      {
        goto LABEL_24;
      }

      id v15 = 0;
      goto LABEL_23;
    }
    if (([(__CFString *)v16 isEqualToString:*MEMORY[0x1E4F289A0]] & 1) == 0)
    {
LABEL_24:

      goto LABEL_25;
    }

    id v15 = v9;
    if (a4 == -1009)
    {
LABEL_23:
      id v12 = a1;
      v13 = v16;
      uint64_t v14 = a4;
      goto LABEL_39;
    }
  }
LABEL_25:
  uint64_t v17 = *MEMORY[0x1E4F59778];
  int v18 = [(__CFString *)v8 isEqualToString:*MEMORY[0x1E4F59778]];
  if ((unint64_t)(a4 - 1005) <= 1 && v18
    || (int v19 = [(__CFString *)v8 isEqualToString:v17], (unint64_t)(a4 - 80) <= 2)
    && v19
    && (dyld_program_sdk_at_least() & 1) == 0)
  {
    id v12 = a1;
    v13 = v8;
    uint64_t v14 = a4;
    id v15 = 0;
    goto LABEL_39;
  }
  v20 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
  if ([v20 length])
  {
    v21 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412290;
      v26 = v20;
      _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Sanitized PhotoKit Error: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  if (a4 == 3072) {
    uint64_t v22 = 3072;
  }
  else {
    uint64_t v22 = -1;
  }
  v23 = [a1 errorWithDomain:v10 code:v22 userInfo:0];

LABEL_40:

  return v23;
}

@end