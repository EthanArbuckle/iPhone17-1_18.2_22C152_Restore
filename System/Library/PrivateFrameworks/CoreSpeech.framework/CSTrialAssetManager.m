@interface CSTrialAssetManager
+ (id)sharedInstance;
- (CSTrialAssetManager)init;
- (void)_getSiriAttAssetsForType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5;
- (void)getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5;
@end

@implementation CSTrialAssetManager

- (void).cxx_destruct
{
}

- (void)getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (a3 != 6 && a3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001501F4;
    v11[3] = &unk_100252CA8;
    v11[4] = self;
    id v12 = v9;
    unint64_t v13 = a3;
    +[CSUtils getTrialIdsForAssetType:a3 withCompletion:v11];
  }
  else
  {
    [(CSTrialAssetManager *)self _getSiriAttAssetsForType:a3 forLocale:v8 completion:v9];
  }
}

- (void)_getSiriAttAssetsForType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100150724;
  v9[3] = &unk_100252C80;
  v9[4] = self;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = a3;
  id v7 = v11;
  id v8 = v10;
  +[CSUtils getTrialIdsForAssetType:a3 withCompletion:v9];
}

- (CSTrialAssetManager)init
{
  if (+[CSUtils isDarwinOS])
  {
    v3 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CSTrialAssetManager;
    v4 = [(CSTrialAssetManager *)&v20 init];
    if (v4)
    {
      v5 = +[NSMutableDictionary dictionary];
      if (+[CSUtils supportTrialMitigationAssets]) {
        +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_10025E290, &off_10025E2A8, 0);
      }
      else {
        +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_10025E2C0, &off_10025E2D8, 0);
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) unsignedIntegerValue];
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_100150EDC;
            v14[3] = &unk_100252C30;
            v15 = v5;
            +[CSUtils getTrialIdsForAssetType:v11 withCompletion:v14];
          }
          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v8);
      }

      trialClientDict = v4->_trialClientDict;
      v4->_trialClientDict = v5;
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

+ (id)sharedInstance
{
  if (qword_1002A3BE8 != -1) {
    dispatch_once(&qword_1002A3BE8, &stru_100252C08);
  }
  v2 = (void *)qword_1002A3BE0;
  return v2;
}

@end