@interface IFPlistParser
+ (id)catalogAssetExcerptForAssetName:(id)a3 style:(unint64_t)a4;
+ (id)fileAssetsExcerptForFilenames:(id)a3 style:(unint64_t)a4;
+ (id)grahpicIconExcerptForConfigDictionary:(id)a3;
+ (id)topLevelAppBundleIconKeys;
- (BOOL)hasGraphicIconReturningPlistExcerpt:(id *)a3;
- (IFPlistParser)initWithInfoDictionary:(id)a3;
- (NSDictionary)iconContent;
- (NSDictionary)iconDictionary;
- (NSDictionary)infoDictionary;
- (NSString)catalogAssetName;
- (id)catalogAssetNamesReturningPlistExcerpt:(id *)a3;
- (id)iconContentForAlternateIconName:(id)a3 variants:(id)a4;
- (id)looseFilesNamesReturningPlistExcerpt:(id *)a3;
- (unint64_t)supportedPlatform;
@end

@implementation IFPlistParser

+ (id)topLevelAppBundleIconKeys
{
  if (topLevelAppBundleIconKeys_onceToken != -1) {
    dispatch_once(&topLevelAppBundleIconKeys_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)topLevelAppBundleIconKeys_keys;

  return v2;
}

void __42__IFPlistParser_topLevelAppBundleIconKeys__block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"CFBundleIcons";
  v2[1] = @"CFBundleIconFile";
  v2[2] = @"CFBundleIconFiles";
  v2[3] = @"CFBundleIconName";
  v2[4] = @"CFBundleIcons~ipad";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)topLevelAppBundleIconKeys_keys;
  topLevelAppBundleIconKeys_keys = v0;
}

- (IFPlistParser)initWithInfoDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFPlistParser;
  v5 = [(IFPlistParser *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    infoDictionary = v5->_infoDictionary;
    v5->_infoDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (NSDictionary)iconContent
{
  v2 = [(IFPlistParser *)self infoDictionary];
  v3 = +[IFPlistParser topLevelAppBundleIconKeys];
  id v4 = objc_msgSend(v2, "_IF_dictionarySubsetForKeys:", v3);

  return (NSDictionary *)v4;
}

- (NSDictionary)iconDictionary
{
  v2 = [(IFPlistParser *)self infoDictionary];
  v3 = objc_opt_new();
  id v4 = objc_msgSend(v2, "_IF_dictionaryForKey:", @"CFBundleIcons");
  v5 = objc_msgSend(v4, "_IF_dictionaryForKey:", @"CFBundlePrimaryIcon");

  if (v5) {
    [v3 addEntriesFromDictionary:v5];
  }
  if (![v3 count])
  {
    uint64_t v6 = objc_msgSend(v2, "_IF_dictionaryForKey:", @"CFBundleIcons");
    v7 = objc_msgSend(v6, "_IF_stringForKey:", @"CFBundlePrimaryIcon");

    if (v7) {
      [v3 setObject:v7 forKeyedSubscript:@"CFBundleIconName"];
    }
  }
  if (![v3 count])
  {
    v8 = objc_msgSend(v2, "_IF_stringForKey:", @"CFBundleIconFile");
    if (v8) {
      [v3 setObject:v8 forKeyedSubscript:@"CFBundleIconFile"];
    }
    objc_super v9 = objc_msgSend(v2, "_IF_arrayForKey:", @"CFBundleIconFiles");
    if (v9) {
      [v3 setObject:v9 forKeyedSubscript:@"CFBundleIconFiles"];
    }
    v10 = objc_msgSend(v2, "_IF_stringForKey:", @"CFBundleIconName");
    if (v10) {
      [v3 setObject:v10 forKeyedSubscript:@"CFBundleIconName"];
    }
  }
  v11 = objc_msgSend(v2, "_IF_dictionaryForKey:", @"CFBundleIcons");
  v12 = objc_msgSend(v11, "_IF_dictionaryForKey:", @"ISGraphicIconConfiguration");

  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"ISGraphicIconConfiguration"];
  }

  return (NSDictionary *)v3;
}

- (NSString)catalogAssetName
{
  v2 = [(IFPlistParser *)self iconDictionary];
  v3 = objc_msgSend(v2, "_IF_stringForKey:", @"CFBundleIconName");

  return (NSString *)v3;
}

- (unint64_t)supportedPlatform
{
  v2 = [(IFPlistParser *)self infoDictionary];
  v3 = objc_msgSend(v2, "_IF_arrayForKey:", @"CFBundleSupportedPlatforms");

  id v4 = +[IFPlatformInfo sharedInstance];
  unint64_t v5 = [v4 platformFromPlatformStrings:v3];

  return v5;
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (id)catalogAssetExcerptForAssetName:(id)a3 style:(unint64_t)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    switch(a4)
    {
      case 0uLL:
        v35 = @"CFBundleIcons";
        id v32 = v5;
        v33 = @"CFBundlePrimaryIcon";
        v31 = @"CFBundleIconName";
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        v34 = v7;
        v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v36[0] = v8;
        objc_super v9 = (void *)MEMORY[0x1E4F1C9E8];
        v10 = (void **)v36;
        v11 = &v35;
        goto LABEL_7;
      case 1uLL:
        id v22 = v5;
        v23 = @"CFBundleIcons";
        v21 = @"CFBundlePrimaryIcon";
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        v24 = v7;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        goto LABEL_8;
      case 2uLL:
        v19 = @"CFBundleIconName";
        id v20 = v5;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        break;
      case 3uLL:
        v29 = @"CFBundleIcons~ipad";
        id v26 = v5;
        v27 = @"CFBundlePrimaryIcon";
        v25 = @"CFBundleIconName";
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        v28 = v7;
        v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        v30 = v8;
        objc_super v9 = (void *)MEMORY[0x1E4F1C9E8];
        v10 = &v30;
        v11 = &v29;
LABEL_7:
        v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];

LABEL_8:
        break;
      default:
        v13 = IFDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 134218242;
          unint64_t v16 = a4;
          __int16 v17 = 2112;
          v18 = v6;
        }

        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  return v12;
}

+ (id)fileAssetsExcerptForFilenames:(id)a3 style:(unint64_t)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && [v5 count])
  {
    switch(a4)
    {
      case 0uLL:
        v35 = @"CFBundleIcons";
        id v32 = v6;
        v33 = @"CFBundlePrimaryIcon";
        v31 = @"CFBundleIconFiles";
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        v34 = v7;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v36[0] = v12;
        v13 = (void *)MEMORY[0x1E4F1C9E8];
        v14 = (void **)v36;
        int v15 = &v35;
        goto LABEL_11;
      case 2uLL:
      case 4uLL:
        v23 = @"CFBundleIconFile";
        v7 = [v6 firstObject];
        v24 = v7;
        v8 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v9 = &v24;
        v10 = &v23;
        goto LABEL_13;
      case 3uLL:
        v29 = @"CFBundleIcons~ipad";
        id v26 = v6;
        v27 = @"CFBundlePrimaryIcon";
        v25 = @"CFBundleIconFiles";
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        v28 = v7;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        v30 = v12;
        v13 = (void *)MEMORY[0x1E4F1C9E8];
        v14 = &v30;
        int v15 = &v29;
LABEL_11:
        v11 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];

        break;
      case 5uLL:
        v21 = @"CFBundleIconFile~ipad";
        v7 = [v6 firstObject];
        id v22 = v7;
        v8 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v9 = &v22;
        v10 = &v21;
LABEL_13:
        v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
        break;
      default:
        v7 = IFDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 134218242;
          unint64_t v18 = a4;
          __int16 v19 = 2112;
          id v20 = v6;
        }
        v11 = 0;
        break;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)grahpicIconExcerptForConfigDictionary:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    objc_super v9 = v4;
    v10 = @"CFBundleIcons";
    v8 = @"ISGraphicIconConfiguration";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v11[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)catalogAssetNamesReturningPlistExcerpt:(id *)a3
{
  id v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  v7 = [(IFPlistParser *)self infoDictionary];
  v8 = objc_msgSend(v7, "_IF_dictionaryForKey:", @"CFBundleIcons");
  objc_super v9 = objc_msgSend(v8, "_IF_dictionaryForKey:", @"CFBundlePrimaryIcon");
  v10 = objc_msgSend(v9, "_IF_stringForKey:", @"CFBundleIconName");

  if (v10)
  {
    [v6 addObject:v10];
    v11 = +[IFPlistParser catalogAssetExcerptForAssetName:v10 style:0];
    [v5 addEntriesFromDictionary:v11];
  }
  v12 = [(IFPlistParser *)self infoDictionary];
  v13 = objc_msgSend(v12, "_IF_dictionaryForKey:", @"CFBundleIcons~ipad");
  v14 = objc_msgSend(v13, "_IF_dictionaryForKey:", @"CFBundlePrimaryIcon");
  int v15 = objc_msgSend(v14, "_IF_stringForKey:", @"CFBundleIconName");

  if (v15)
  {
    [v6 addObject:v15];
    unint64_t v16 = +[IFPlistParser catalogAssetExcerptForAssetName:v15 style:3];
    [v5 addEntriesFromDictionary:v16];
  }
  int v17 = [(IFPlistParser *)self infoDictionary];
  unint64_t v18 = objc_msgSend(v17, "_IF_dictionaryForKey:", @"CFBundleIcons");
  __int16 v19 = objc_msgSend(v18, "_IF_stringForKey:", @"CFBundlePrimaryIcon");

  if (v19)
  {
    [v6 addObject:v19];
    id v20 = +[IFPlistParser catalogAssetExcerptForAssetName:v19 style:1];
    [v5 addEntriesFromDictionary:v20];
  }
  v21 = [(IFPlistParser *)self infoDictionary];
  id v22 = objc_msgSend(v21, "_IF_stringForKey:", @"CFBundleIconName");

  if (v22)
  {
    [v6 addObject:v22];
    v23 = +[IFPlistParser catalogAssetExcerptForAssetName:v22 style:2];
    [v5 addEntriesFromDictionary:v23];
  }
  if ([v6 count])
  {
    if (a3) {
      *a3 = (id)[v5 copy];
    }
    id v24 = v6;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)looseFilesNamesReturningPlistExcerpt:(id *)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  v7 = [(IFPlistParser *)self infoDictionary];
  v8 = objc_msgSend(v7, "_IF_dictionaryForKey:", @"CFBundleIcons");
  objc_super v9 = objc_msgSend(v8, "_IF_dictionaryForKey:", @"CFBundlePrimaryIcon");
  v10 = objc_msgSend(v9, "_IF_arrayForKey:", @"CFBundleIconFiles");

  if (v10 && [v10 count])
  {
    [v6 addObjectsFromArray:v10];
    v11 = +[IFPlistParser fileAssetsExcerptForFilenames:v10 style:0];
    [v5 addEntriesFromDictionary:v11];
  }
  v12 = [(IFPlistParser *)self infoDictionary];
  v13 = objc_msgSend(v12, "_IF_dictionaryForKey:", @"CFBundleIcons~ipad");
  v14 = objc_msgSend(v13, "_IF_dictionaryForKey:", @"CFBundlePrimaryIcon");
  int v15 = objc_msgSend(v14, "_IF_arrayForKey:", @"CFBundleIconFiles");

  if (v15 && [v15 count])
  {
    [v6 addObjectsFromArray:v15];
    unint64_t v16 = +[IFPlistParser fileAssetsExcerptForFilenames:v15 style:3];
    [v5 addEntriesFromDictionary:v16];
  }
  int v17 = [(IFPlistParser *)self infoDictionary];
  unint64_t v18 = objc_msgSend(v17, "_IF_arrayForKey:", @"CFBundleIconFiles");

  if (v18 && [v18 count])
  {
    [v6 addObjectsFromArray:v18];
    __int16 v19 = +[IFPlistParser fileAssetsExcerptForFilenames:v18 style:0];
    [v5 addEntriesFromDictionary:v19];
  }
  id v20 = [(IFPlistParser *)self infoDictionary];
  v21 = objc_msgSend(v20, "_IF_arrayForKey:", @"CFBundleIconFiles~ipad");

  if (v21 && [v21 count])
  {
    [v6 addObjectsFromArray:v21];
    id v22 = +[IFPlistParser fileAssetsExcerptForFilenames:v21 style:3];
    [v5 addEntriesFromDictionary:v22];
  }
  v23 = [(IFPlistParser *)self infoDictionary];
  id v24 = objc_msgSend(v23, "_IF_stringForKey:", @"CFBundleIconFile");

  if (v24)
  {
    [v6 addObject:v24];
    v34[0] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    id v26 = +[IFPlistParser fileAssetsExcerptForFilenames:v25 style:4];
    [v5 addEntriesFromDictionary:v26];
  }
  v27 = [(IFPlistParser *)self infoDictionary];
  v28 = objc_msgSend(v27, "_IF_stringForKey:", @"CFBundleIconFile~ipad");

  if (v28)
  {
    [v6 addObject:v28];
    v33 = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    v30 = +[IFPlistParser fileAssetsExcerptForFilenames:v29 style:5];
    [v5 addEntriesFromDictionary:v30];
  }
  if ([v6 count])
  {
    if (a3) {
      *a3 = (id)[v5 copy];
    }
    id v31 = v6;
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

- (BOOL)hasGraphicIconReturningPlistExcerpt:(id *)a3
{
  id v4 = [(IFPlistParser *)self infoDictionary];
  id v5 = objc_msgSend(v4, "_IF_dictionaryForKey:", @"CFBundleIcons");
  uint64_t v6 = objc_msgSend(v5, "_IF_dictionaryForKey:", @"ISGraphicIconConfiguration");

  if (a3)
  {
    *a3 = +[IFPlistParser grahpicIconExcerptForConfigDictionary:v6];
  }

  return v6 != 0;
}

- (id)iconContentForAlternateIconName:(id)a3 variants:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 addObject:@"CFBundleIcons"];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [@"CFBundleIcons" stringByAppendingString:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v10);
  }
  id v26 = v8;

  id v28 = (id)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v7;
  uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        __int16 v19 = [(IFPlistParser *)self infoDictionary];
        id v20 = objc_msgSend(v19, "_IF_dictionaryForKey:", v18);
        v21 = objc_msgSend(v20, "_IF_dictionaryForKey:", @"CFBundleAlternateIcons");
        id v22 = objc_msgSend(v21, "_IF_dictionaryForKey:", v29);

        if (v22)
        {
          v39 = v22;
          uint64_t v40 = v18;
          v38 = @"CFBundlePrimaryIcon";
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          v41 = v23;
          id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];

          [v28 addEntriesFromDictionary:v24];
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v15);
  }

  return v28;
}

@end