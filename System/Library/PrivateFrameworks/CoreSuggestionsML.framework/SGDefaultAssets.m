@interface SGDefaultAssets
+ (id)_filesystemPathForFilename:(id)a3 isFault:(BOOL)a4;
+ (id)checkFilesystemPathForFilename:(id)a3;
+ (id)dictionaryWithPlistAssetPath:(id)a3;
+ (id)dictionaryWithPlistFilename:(id)a3;
+ (id)filesystemPathForFilename:(id)a3;
+ (id)quickResponsesPrediction;
+ (id)quickResponsesPredictionVocab;
+ (id)responseToRobotParams;
+ (id)vocabWithTrieAssetPath:(id)a3;
@end

@implementation SGDefaultAssets

+ (id)vocabWithTrieAssetPath:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F61988];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithPath:v4];

  return v5;
}

+ (id)dictionaryWithPlistAssetPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    id v8 = 0;
    goto LABEL_18;
  }
  id v12 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v3 options:1 error:&v12];
  id v5 = v12;
  if (!v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error loading model plist %@: %@", buf, 0x16u);
    }
    id v8 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)[v4 length] >= 0x400
    && ([MEMORY[0x263F61E58] dictionaryWithData:v4 error:0],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
  }
  else
  {
    id v11 = 0;
    v7 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:0 error:&v11];
    id v9 = v11;

    if (v9)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error deserializing model plist %@: %@", buf, 0x16u);
      }
      id v8 = 0;
      goto LABEL_16;
    }
    id v5 = 0;
  }
  id v8 = v7;
  id v9 = v5;
  v7 = v8;
LABEL_16:

  id v5 = v9;
LABEL_17:

LABEL_18:
  return v8;
}

+ (id)dictionaryWithPlistFilename:(id)a3
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 pathForResource:v4 ofType:@"plist"];

  v7 = +[SGDefaultAssets dictionaryWithPlistAssetPath:v6];

  return v7;
}

+ (id)responseToRobotParams
{
  return +[SGDefaultAssets dictionaryWithPlistFilename:@"RepliesToRobots"];
}

+ (id)quickResponsesPredictionVocab
{
  return 0;
}

+ (id)quickResponsesPrediction
{
  return +[SGDefaultAssets dictionaryWithPlistFilename:@"MLQuickResponsesPrediction"];
}

+ (id)_filesystemPathForFilename:(id)a3 isFault:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [v7 stringByDeletingPathExtension];
  id v9 = [v7 pathExtension];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 pathForResource:v8 ofType:v9];

  if (v4 && !v11)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"SGDefaultAssets.m", 38, @"no path for filename %@", v7 object file lineNumber description];
  }
  return v11;
}

+ (id)checkFilesystemPathForFilename:(id)a3
{
  return +[SGDefaultAssets _filesystemPathForFilename:a3 isFault:0];
}

+ (id)filesystemPathForFilename:(id)a3
{
  return +[SGDefaultAssets _filesystemPathForFilename:a3 isFault:1];
}

@end