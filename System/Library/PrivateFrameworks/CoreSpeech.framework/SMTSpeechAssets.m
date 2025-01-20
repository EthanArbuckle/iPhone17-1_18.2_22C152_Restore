@interface SMTSpeechAssets
+ (void)initialize;
- (id)fetchAssetPathForAssetConfig:(id)a3 outError:(id *)a4;
- (id)fetchAssetPathForInstalledLanguage:(id)a3 outError:(id *)a4;
@end

@implementation SMTSpeechAssets

- (id)fetchAssetPathForAssetConfig:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = [v5 language];
  v7 = +[SFEntitledAssetManager sharedInstance];
  v8 = [v7 installedAssetWithConfig:v5];

  if (v8 && [v8 length])
  {
    v9 = v8;
  }
  else
  {
    if (a4)
    {
      v10 = +[NSString stringWithFormat:@"No asset found for language=%@", v6, NSLocalizedDescriptionKey];
      v14 = v10;
      v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:102 userInfo:v11];
    }
    v9 = &stru_10003D2D8;
  }

  return v9;
}

- (id)fetchAssetPathForInstalledLanguage:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v6 assetType:3];

  v8 = [(SMTSpeechAssets *)self fetchAssetPathForAssetConfig:v7 outError:a4];

  return v8;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_1000443A8 = (uint64_t)os_log_create("com.apple.speech.speechmodeltraining", "SMTSpeechAssets");
    _objc_release_x1();
  }
}

@end