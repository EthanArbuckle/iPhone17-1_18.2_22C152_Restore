@interface NSError(HMUAdditions)
+ (id)hmu_errorWithDomain:()HMUAdditions code:description:;
+ (uint64_t)hmu_IDSValidationErrorWithCode:()HMUAdditions;
+ (uint64_t)hmu_IDSValidationErrorWithCode:()HMUAdditions description:;
+ (uint64_t)hmu_errorWithDomain:()HMUAdditions code:;
@end

@implementation NSError(HMUAdditions)

+ (uint64_t)hmu_errorWithDomain:()HMUAdditions code:
{
  return [MEMORY[0x263F087E8] errorWithDomain:a3 code:a4 userInfo:0];
}

+ (id)hmu_errorWithDomain:()HMUAdditions code:description:
{
  v15[1] = *MEMORY[0x263EF8340];
  v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F08320];
  v15[0] = a5;
  v8 = NSDictionary;
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12 = [v7 errorWithDomain:v10 code:a4 userInfo:v11];

  return v12;
}

+ (uint64_t)hmu_IDSValidationErrorWithCode:()HMUAdditions
{
  return objc_msgSend(MEMORY[0x263F087E8], "hmu_errorWithDomain:code:", @"com.apple.homeMessagingUtils.IDSValidation", a3);
}

+ (uint64_t)hmu_IDSValidationErrorWithCode:()HMUAdditions description:
{
  return objc_msgSend(MEMORY[0x263F087E8], "hmu_errorWithDomain:code:description:", @"com.apple.homeMessagingUtils.IDSValidation", a3, a4);
}

@end