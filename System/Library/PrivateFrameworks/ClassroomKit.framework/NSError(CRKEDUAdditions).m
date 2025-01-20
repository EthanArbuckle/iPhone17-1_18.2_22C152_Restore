@interface NSError(CRKEDUAdditions)
+ (id)crk_EDUProfileErrorWithCode:()CRKEDUAdditions errorField:andValue:;
+ (id)crk_allOrNoneKeysErrorWithProvidedKeys:()CRKEDUAdditions allOrNoneKeys:;
+ (id)crk_badFieldTypeErrorWithField:()CRKEDUAdditions;
+ (id)crk_missingFieldErrorWithField:()CRKEDUAdditions;
+ (id)crk_topLevelUserIsBothLeaderAndMemberErrorWithUserIdentifier:()CRKEDUAdditions;
+ (id)crk_topLevelUserIsNeitherLeaderNorMemberErrorWithUserIdentifier:()CRKEDUAdditions;
+ (uint64_t)crk_EDUProfileErrorWithCode:()CRKEDUAdditions errorDictionary:;
+ (uint64_t)crk_malformedProfileErrorWithField:()CRKEDUAdditions value:;
+ (uint64_t)crk_unsupportedValueErrorWithField:()CRKEDUAdditions value:;
+ (uint64_t)crk_valueNotUniqueErrorWithField:()CRKEDUAdditions value:;
@end

@implementation NSError(CRKEDUAdditions)

+ (uint64_t)crk_EDUProfileErrorWithCode:()CRKEDUAdditions errorDictionary:
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"ClassroomKit.profileError" code:a3 userInfo:a4];
}

+ (id)crk_badFieldTypeErrorWithField:()CRKEDUAdditions
{
  v10[1] = *MEMORY[0x263EF8340];
  v9 = @"CRKEDUProfileErrorField";
  v10[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 2, v6);

  return v7;
}

+ (id)crk_missingFieldErrorWithField:()CRKEDUAdditions
{
  v10[1] = *MEMORY[0x263EF8340];
  v9 = @"CRKEDUProfileErrorField";
  v10[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 1, v6);

  return v7;
}

+ (uint64_t)crk_valueNotUniqueErrorWithField:()CRKEDUAdditions value:
{
  return objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorField:andValue:", 4, a3, a4);
}

+ (uint64_t)crk_unsupportedValueErrorWithField:()CRKEDUAdditions value:
{
  return objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorField:andValue:", 3, a3, a4);
}

+ (uint64_t)crk_malformedProfileErrorWithField:()CRKEDUAdditions value:
{
  return objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorField:andValue:", 0, a3, a4);
}

+ (id)crk_allOrNoneKeysErrorWithProvidedKeys:()CRKEDUAdditions allOrNoneKeys:
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"ProvidedKeys";
  v12[1] = @"AllOrNoneKeys";
  v13[0] = a3;
  v13[1] = a4;
  v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v13 forKeys:v12 count:2];

  v10 = objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 5, v9);

  return v10;
}

+ (id)crk_topLevelUserIsBothLeaderAndMemberErrorWithUserIdentifier:()CRKEDUAdditions
{
  v10[1] = *MEMORY[0x263EF8340];
  v9 = @"TopLevelUserIdentifier";
  v10[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 7, v6);

  return v7;
}

+ (id)crk_topLevelUserIsNeitherLeaderNorMemberErrorWithUserIdentifier:()CRKEDUAdditions
{
  v10[1] = *MEMORY[0x263EF8340];
  v9 = @"TopLevelUserIdentifier";
  v10[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", 6, v6);

  return v7;
}

+ (id)crk_EDUProfileErrorWithCode:()CRKEDUAdditions errorField:andValue:
{
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = @"CRKEDUProfileErrorField";
  v14[1] = @"CRKEDUProfileErrorValue";
  v15[0] = a4;
  v15[1] = a5;
  id v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 dictionaryWithObjects:v15 forKeys:v14 count:2];

  v12 = objc_msgSend(a1, "crk_EDUProfileErrorWithCode:errorDictionary:", a3, v11);

  return v12;
}

@end