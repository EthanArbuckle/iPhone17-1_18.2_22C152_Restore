@interface CSUtils(Trial)
+ (uint64_t)getAssetTypeForNamespace:()Trial;
+ (void)getTrialIdsForAssetType:()Trial withCompletion:;
@end

@implementation CSUtils(Trial)

+ (void)getTrialIdsForAssetType:()Trial withCompletion:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = a4;
  if (a3 == 3)
  {
    uint64_t v6 = 114;
    uint64_t v7 = 322;
  }
  else if (a3 == 4)
  {
    uint64_t v6 = 117;
    uint64_t v7 = 404;
  }
  else
  {
    v8 = *MEMORY[0x1E4F5D180];
    BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT);
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    if (v9)
    {
      int v11 = 136315394;
      v12 = "+[CSUtils(Trial) getTrialIdsForAssetType:withCompletion:]";
      __int16 v13 = 2050;
      uint64_t v14 = a3;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Unknown namespaceId for assetType %{public}lu ", (uint8_t *)&v11, 0x16u);
      uint64_t v7 = 0;
      uint64_t v6 = 0;
    }
  }
  if (v5)
  {
    v10 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:v7];
    v5[2](v5, v6, v10);
  }
}

+ (uint64_t)getAssetTypeForNamespace:()Trial
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:322];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:404];
    int v8 = [v3 isEqualToString:v7];

    if (v8) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

@end