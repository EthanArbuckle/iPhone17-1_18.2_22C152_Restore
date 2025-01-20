@interface CSAppUaapFiles
+ (BOOL)enumerateUaapLocales:(id)a3 error:(id *)a4;
- (CSAppUaapFiles)initWithBundleId:(id)a3 assetDir:(id)a4 forLanguage:(id)a5;
- (CSAppUaapFiles)initWithBundleId:(id)a3 forLanguage:(id)a4;
- (NSArray)oldAppLmPaths;
- (NSString)appIntentsPath;
- (NSString)appLmPath;
- (NSString)bundleId;
- (id)filesAsDictionary;
- (id)generateNextLmPath;
- (void)setAppIntentsPath:(id)a3;
- (void)setAppLmPath:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setOldAppLmPaths:(id)a3;
@end

@implementation CSAppUaapFiles

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldAppLmPaths, 0);
  objc_storeStrong((id *)&self->_appLmPath, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appIntentsPath, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (void)setOldAppLmPaths:(id)a3
{
}

- (NSArray)oldAppLmPaths
{
  return self->_oldAppLmPaths;
}

- (void)setAppLmPath:(id)a3
{
}

- (NSString)appLmPath
{
  return self->_appLmPath;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setAppIntentsPath:(id)a3
{
}

- (NSString)appIntentsPath
{
  return self->_appIntentsPath;
}

- (id)generateNextLmPath
{
  appLmPath = self->_appLmPath;
  if (appLmPath)
  {
    v4 = [(NSString *)appLmPath pathExtension];
    v5 = v4;
    if (v4) {
      v6 = (char *)[v4 integerValue];
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = sub_10005FAA8(self->_bundleId, self->_language);
  v8 = +[NSString stringWithFormat:@"LM.%ld", v6 + 1];
  v9 = [v7 stringByAppendingPathComponent:v8];

  return v9;
}

- (id)filesAsDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  appIntentsPath = self->_appIntentsPath;
  if (appIntentsPath) {
    [v3 setObject:appIntentsPath forKey:@"AppIntents"];
  }
  return v4;
}

- (CSAppUaapFiles)initWithBundleId:(id)a3 forLanguage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = sub_10005FC54(v7, v6);
  v9 = [(CSAppUaapFiles *)self initWithBundleId:v7 assetDir:v8 forLanguage:v6];

  return v9;
}

- (CSAppUaapFiles)initWithBundleId:(id)a3 assetDir:(id)a4 forLanguage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v43.receiver = self;
  v43.super_class = (Class)CSAppUaapFiles;
  v12 = [(CSAppUaapFiles *)&v43 init];
  if (!v12) {
    goto LABEL_6;
  }
  v13 = +[NSFileManager defaultManager];
  v14 = [v13 contentsOfDirectoryAtPath:v10 error:0];

  if (!v14 || ![v14 count])
  {
LABEL_8:

    v29 = 0;
    goto LABEL_9;
  }
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10006008C;
  v40[3] = &unk_10024F688;
  id v41 = v10;
  v15 = v12;
  v42 = v15;
  [v14 enumerateObjectsUsingBlock:v40];
  if (!v15->_appIntentsPath)
  {

    goto LABEL_8;
  }
  v16 = sub_10005FAA8(v9, v11);
  uint64_t v17 = [v16 stringByAppendingPathComponent:@"LM"];
  appLmPath = v15->_appLmPath;
  v15->_appLmPath = (NSString *)v17;

  v19 = +[NSFileManager defaultManager];
  id v33 = v9;
  v20 = sub_10005FAA8(v9, v11);
  id v21 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v22 = [v20 stringByAppendingPathComponent:@"LM"];
  v23 = v15->_appLmPath;
  v15->_appLmPath = (NSString *)v22;

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v32 = v19;
  v24 = [v19 contentsOfDirectoryAtPath:v20 error:0];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100060100;
  v34[3] = &unk_10024F6B0;
  id v25 = v21;
  id v35 = v25;
  id v31 = v20;
  id v36 = v31;
  v38 = v39;
  v26 = v15;
  v37 = v26;
  [v24 enumerateObjectsUsingBlock:v34];

  [v25 removeObject:v15->_appLmPath];
  uint64_t v27 = +[NSArray arrayWithArray:v25];
  oldAppLmPaths = v26->_oldAppLmPaths;
  v26->_oldAppLmPaths = (NSArray *)v27;

  objc_storeStrong((id *)&v26->_language, a5);
  objc_storeStrong((id *)&v26->_bundleId, a3);

  _Block_object_dispose(v39, 8);
  id v9 = v33;
LABEL_6:
  v29 = v12;
LABEL_9:

  return v29;
}

+ (BOOL)enumerateUaapLocales:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = AFLibraryDirectoryWithSubPath();
  id v7 = [v6 stringByAppendingPathComponent:@"SpeechModels"];

  v8 = +[NSFileManager defaultManager];
  id v22 = 0;
  id v9 = [v8 contentsOfDirectoryAtPath:v7 error:&v22];
  id v10 = v22;
  id v11 = v10;
  if (v9)
  {
    id v21 = 0;
    v12 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", @"^[a-z][a-z]-[A-Z][A-Z]$", 0, &v21);
    id v13 = v21;
    v14 = v13;
    BOOL v15 = v12 != 0;
    if (v12)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000603AC;
      v17[3] = &unk_10024F660;
      id v18 = v12;
      id v19 = v7;
      id v20 = v5;
      [v9 enumerateObjectsUsingBlock:v17];
    }
    else if (a4)
    {
      *a4 = v13;
    }
  }
  else
  {
    BOOL v15 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v15;
}

@end