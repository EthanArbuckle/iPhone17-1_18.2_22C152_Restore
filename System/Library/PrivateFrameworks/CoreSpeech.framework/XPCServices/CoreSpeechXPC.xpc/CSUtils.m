@interface CSUtils
+ (unint64_t)getAssetTypeForNamespace:(id)a3;
+ (void)getTrialIdsForAssetType:(unint64_t)a3 withCompletion:(id)a4;
@end

@implementation CSUtils

+ (void)getTrialIdsForAssetType:(unint64_t)a3 withCompletion:(id)a4
{
  v5 = (void (**)(id, uint64_t, void *))a4;
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
    v8 = CSLogContextFacilityCoreSpeech;
    BOOL v9 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    if (v9)
    {
      int v11 = 136315394;
      v12 = "+[CSUtils(Trial) getTrialIdsForAssetType:withCompletion:]";
      __int16 v13 = 2050;
      unint64_t v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Unknown namespaceId for assetType %{public}lu ", (uint8_t *)&v11, 0x16u);
      uint64_t v7 = 0;
      uint64_t v6 = 0;
    }
  }
  if (v5)
  {
    v10 = +[TRINamespace namespaceNameFromId:v7];
    v5[2](v5, v6, v10);
  }
}

+ (unint64_t)getAssetTypeForNamespace:(id)a3
{
  id v3 = a3;
  v4 = +[TRINamespace namespaceNameFromId:322];
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    unint64_t v6 = 3;
  }
  else
  {
    uint64_t v7 = +[TRINamespace namespaceNameFromId:404];
    unsigned int v8 = [v3 isEqualToString:v7];

    if (v8) {
      unint64_t v6 = 4;
    }
    else {
      unint64_t v6 = 0;
    }
  }

  return v6;
}

@end