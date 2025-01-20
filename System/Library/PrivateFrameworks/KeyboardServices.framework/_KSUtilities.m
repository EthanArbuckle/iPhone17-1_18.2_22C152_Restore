@interface _KSUtilities
+ (id)findAllDbsInDirectory:(id)a3;
+ (id)keyboardDirectory;
+ (id)keyboardServicesDirectory;
+ (id)machServiceNameTextReplacement;
+ (id)userDefaultsSuiteName;
+ (id)userDictionaryWordKeyPairsFilePathLegacy;
+ (void)createFileIfDoesNotExist:(id)a3;
@end

@implementation _KSUtilities

+ (void)createFileIfDoesNotExist:(id)a3
{
  id v3 = a3;
  char v7 = 0;
  v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3 isDirectory:&v7];

  if ((v5 & 1) == 0)
  {
    v6 = [MEMORY[0x263F08850] defaultManager];
    [v6 createFileAtPath:v3 contents:0 attributes:0];
  }
}

+ (id)userDefaultsSuiteName
{
  return @"com.apple.textInput.keyboardServices.textReplacement";
}

+ (id)machServiceNameTextReplacement
{
  return @"com.apple.TextInput.shortcuts";
}

+ (id)keyboardDirectory
{
  if (keyboardDirectory_onceToken != -1) {
    dispatch_once(&keyboardDirectory_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)keyboardDirectory_dir;
  return v2;
}

+ (id)userDictionaryWordKeyPairsFilePathLegacy
{
  v2 = [a1 keyboardDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"UserDictionaryWordKeyPairs.plist"];

  return v3;
}

+ (id)keyboardServicesDirectory
{
  if (keyboardServicesDirectory_onceToken != -1) {
    dispatch_once(&keyboardServicesDirectory_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)keyboardServicesDirectory_dir;
  return v2;
}

+ (id)findAllDbsInDirectory:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  char v5 = (void *)MEMORY[0x230F44DF0]();
  v6 = [MEMORY[0x263F08850] defaultManager];
  char v7 = [v6 enumeratorAtPath:v3];

  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      if (([v9 hasSuffix:@"UserDictionary.db"] & 1) != 0
        || [v9 hasSuffix:@"CloudUserDictionary.sqlite"])
      {
        v10 = [v3 stringByAppendingPathComponent:v9];
        [v4 addObject:v10];
      }
      uint64_t v11 = [v7 nextObject];

      v9 = (void *)v11;
    }
    while (v11);
  }

  return v4;
}

@end