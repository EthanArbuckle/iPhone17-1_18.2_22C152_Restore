@interface NSDictionary(AppleMediaServices_EncryptionResult)
+ (id)ams_dictionaryWithEncryptionResult:()AppleMediaServices_EncryptionResult;
- (void)ams_encryptionResult;
@end

@implementation NSDictionary(AppleMediaServices_EncryptionResult)

- (void)ams_encryptionResult
{
  id v6 = [a1 objectForKeyedSubscript:@"data"];
  v4 = [a1 objectForKeyedSubscript:@"iv"];
  v5 = [a1 objectForKeyedSubscript:@"tag"];
  if (v6 && v4 && v5)
  {
    *a2 = v6;
    a2[1] = v4;
    a2[2] = v5;
  }
  else
  {
    __copy_constructor_8_8_s0_s8_s16(a2);
  }
}

+ (id)ams_dictionaryWithEncryptionResult:()AppleMediaServices_EncryptionResult
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v4, "ams_setNullableObject:forKey:", *a3, @"data");
  objc_msgSend(v4, "ams_setNullableObject:forKey:", a3[1], @"iv");
  objc_msgSend(v4, "ams_setNullableObject:forKey:", a3[2], @"tag");
  v5 = (void *)[v4 copy];

  __destructor_8_s0_s8_s16((uint64_t)a3);
  return v5;
}

@end