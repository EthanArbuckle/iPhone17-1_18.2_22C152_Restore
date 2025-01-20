@interface NSDictionary(CKMultiFrameImage)
- (NSObject)ckmfi_numberArrayForKey:()CKMultiFrameImage;
- (id)ckmfi_numberForKey:()CKMultiFrameImage;
@end

@implementation NSDictionary(CKMultiFrameImage)

- (NSObject)ckmfi_numberArrayForKey:()CKMultiFrameImage
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v12 = IMLogHandleForCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                -[NSDictionary(CKMultiFrameImage) ckmfi_numberArrayForKey:]();
              }

              goto LABEL_18;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      v11 = v6;
    }
    else
    {
      v6 = IMLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[NSDictionary(CKMultiFrameImage) ckmfi_numberArrayForKey:]();
      }
LABEL_18:
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)ckmfi_numberForKey:()CKMultiFrameImage
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      goto LABEL_8;
    }
    uint64_t v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(CKMultiFrameImage) ckmfi_numberForKey:]();
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (void)ckmfi_numberArrayForKey:()CKMultiFrameImage .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Object in array for key \"%@\" is of unexpected type, expected NSNumber, returning nil.", v2, v3, v4, v5, v6);
}

- (void)ckmfi_numberArrayForKey:()CKMultiFrameImage .cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Object for key \"%@\" is of unexpected type, expected NSArray, returning nil.", v2, v3, v4, v5, v6);
}

- (void)ckmfi_numberForKey:()CKMultiFrameImage .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Object for key \"%@\" is of unexpected type, expected NSNumber, returning nil.", v2, v3, v4, v5, v6);
}

@end