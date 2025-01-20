@interface CPLEngineParametersStorage
+ (NSSet)defaultSupportedLibraryIdentifiers;
- (BOOL)isCPLEngineParametersStorageKey:(id)a3;
- (BOOL)removeParametersWithLibraryIdentifier:(id)a3 error:(id *)a4;
- (BOOL)saveParameters:(id)a3 error:(id *)a4;
- (CPLEngineParametersStorage)initWithBundleIdentifier:(id)a3;
- (CPLEngineParametersStorage)initWithUserDefaults:(id)a3 bundleIdentifier:(id)a4 supportedLibraryIdentifiers:(id)a5;
- (NSArray)allDefinedParameters;
- (NSSet)supportedLibraryIdentifiers;
- (NSString)bundleIdentifier;
- (id)_keyForInsanityForLibraryIdentifier:(id)a3;
- (id)_savedParametersForKey:(id)a3;
- (id)keyForLibraryIdentifier:(id)a3 error:(id *)a4;
- (id)parametersForLibraryIdentifier:(id)a3;
- (void)_removeKeyForInsanityForLibraryIdentifier:(id)a3;
- (void)_saveParameters:(id)a3 withKey:(id)a4;
- (void)_setKeyForInsanityIfNecessaryForParameters:(id)a3;
@end

@implementation CPLEngineParametersStorage

+ (NSSet)defaultSupportedLibraryIdentifiers
{
  if (qword_100041358 != -1) {
    dispatch_once(&qword_100041358, &stru_100034A58);
  }
  v2 = (void *)qword_100041350;
  return (NSSet *)v2;
}

- (CPLEngineParametersStorage)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[NSUserDefaults standardUserDefaults];
  v6 = [(id)objc_opt_class() defaultSupportedLibraryIdentifiers];
  v7 = [(CPLEngineParametersStorage *)self initWithUserDefaults:v5 bundleIdentifier:v4 supportedLibraryIdentifiers:v6];

  return v7;
}

- (CPLEngineParametersStorage)initWithUserDefaults:(id)a3 bundleIdentifier:(id)a4 supportedLibraryIdentifiers:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)CPLEngineParametersStorage;
  v12 = [(CPLEngineParametersStorage *)&v38 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    v14 = (NSString *)[v10 copy];
    bundleIdentifier = v13->_bundleIdentifier;
    v13->_bundleIdentifier = v14;

    v16 = (NSSet *)[v11 copy];
    supportedLibraryIdentifiers = v13->_supportedLibraryIdentifiers;
    v13->_supportedLibraryIdentifiers = v16;

    v18 = [(NSUserDefaults *)v13->_userDefaults dictionaryForKey:@"CPLEngineInfo"];
    v19 = v18;
    if (!v18)
    {
LABEL_41:

      goto LABEL_42;
    }
    v20 = [v18 objectForKeyedSubscript:@"libraryIdentifier"];
    if ([v20 isEqualToString:@"MobileSlideShow"])
    {
      if (!_CPLSilentLogging)
      {
        v21 = sub_100004854();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v40 = v20;
          __int16 v41 = 2112;
          v42 = (void *)CPLLibraryIdentifierSystemLibrary;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Automatically renaming %{public}@ to %@", buf, 0x16u);
        }
      }
      id v22 = CPLLibraryIdentifierSystemLibrary;

      v20 = v22;
    }
    if (!v20)
    {
      v25 = 0;
      v23 = 0;
      goto LABEL_15;
    }
    v23 = [(CPLEngineParametersStorage *)v13 keyForLibraryIdentifier:v20 error:0];
    if (!v23)
    {
      v25 = 0;
      goto LABEL_15;
    }
    uint64_t v24 = [(CPLEngineParametersStorage *)v13 _savedParametersForKey:v23];
    if (v24)
    {
      v25 = (void *)v24;
LABEL_15:
      if (_CPLSilentLogging)
      {
LABEL_40:
        [(NSUserDefaults *)v13->_userDefaults removeObjectForKey:@"CPLEngineInfo", v32];

        goto LABEL_41;
      }
      v26 = sub_100004854();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v20;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Discarding old engine info for %{public}@", buf, 0xCu);
      }
LABEL_39:

      goto LABEL_40;
    }
    v26 = [v19 objectForKeyedSubscript:@"clientLibraryBasePath"];
    v37 = [v19 objectForKeyedSubscript:@"cloudLibraryStateStoragePath"];
    v35 = [v19 objectForKeyedSubscript:@"cloudLibraryResourceStoragePath"];
    v33 = v26;
    if (v26)
    {
      v26 = +[NSURL fileURLWithPath:v26 isDirectory:1];
    }
    if (v37)
    {
      v34 = +[NSURL fileURLWithPath:v37 isDirectory:1];
    }
    else
    {
      v34 = 0;
    }
    if (v35)
    {
      v36 = +[NSURL fileURLWithPath:v35 isDirectory:1];
    }
    else
    {
      v36 = 0;
    }
    v27 = [v19 objectForKeyedSubscript:@"options"];
    id v32 = [v27 integerValue];

    if (v37 && v26 && v36)
    {
      if (!_CPLSilentLogging)
      {
        v28 = sub_100004854();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v20;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Upgrading old engine info for %{public}@", buf, 0xCu);
        }
      }
      v29 = [CPLEngineParameters alloc];
      v30 = [(CPLEngineParameters *)v29 initWithClientLibraryBaseURL:v26 cloudLibraryStateStorageURL:v34 cloudLibraryResourceStorageURL:v36 libraryIdentifier:v20 mainScopeIdentifier:CPLPrimaryScopeIdentifier options:v32];
      [(CPLEngineParametersStorage *)v13 _saveParameters:v30 withKey:v23];
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_38:

        v25 = 0;
        goto LABEL_39;
      }
      v30 = sub_100004854();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = v20;
        __int16 v41 = 2112;
        v42 = v19;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Discarding old invalid engine info for %{public}@: %@", buf, 0x16u);
      }
    }

    goto LABEL_38;
  }
LABEL_42:

  return v13;
}

- (id)_savedParametersForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSUserDefaults *)self->_userDefaults dictionaryForKey:v4];
  if (v5)
  {
    v6 = [[CPLEngineParameters alloc] initWithPlist:v5];
    v7 = [(CPLEngineParameters *)v6 asPlist];
    if (([v7 isEqual:v5] & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        v8 = sub_100004854();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138543874;
          id v11 = v4;
          __int16 v12 = 2112;
          v13 = v5;
          __int16 v14 = 2112;
          v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating plist for %{public}@ from %@ to %@", (uint8_t *)&v10, 0x20u);
        }
      }
      [(CPLEngineParametersStorage *)self _saveParameters:v6 withKey:v4];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_saveParameters:(id)a3 withKey:(id)a4
{
  id v6 = a4;
  id v7 = [a3 asPlist];
  [(NSUserDefaults *)self->_userDefaults setObject:v7 forKey:v6];

  [(NSUserDefaults *)self->_userDefaults synchronize];
}

- (id)keyForLibraryIdentifier:(id)a3 error:(id *)a4
{
  return objc_msgSend(@"CPLEngineParameters-", "stringByAppendingString:", a3, a4);
}

- (id)_keyForInsanityForLibraryIdentifier:(id)a3
{
  return [@"_CPLLibraryPathInsanityCheckDate." stringByAppendingString:a3];
}

- (void)_setKeyForInsanityIfNecessaryForParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 cloudLibraryResourceStorageURL];
  id v6 = [v5 lastPathComponent];

  if (v6 && ([v6 isEqual:@"storage"] & 1) != 0)
  {
  }
  else
  {

    if (!_CPLSilentLogging)
    {
      id v7 = sub_100004854();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = [v4 libraryIdentifier];
        id v9 = [v4 cloudLibraryResourceStorageURL];
        int v14 = 138412546;
        v15 = v8;
        __int16 v16 = 2112;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Client asked to store some weird path for %@: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    userDefaults = self->_userDefaults;
    id v11 = +[NSDate date];
    __int16 v12 = [v4 libraryIdentifier];
    v13 = [(CPLEngineParametersStorage *)self _keyForInsanityForLibraryIdentifier:v12];
    [(NSUserDefaults *)userDefaults setObject:v11 forKey:v13];
  }
}

- (void)_removeKeyForInsanityForLibraryIdentifier:(id)a3
{
  userDefaults = self->_userDefaults;
  id v4 = [(CPLEngineParametersStorage *)self _keyForInsanityForLibraryIdentifier:a3];
  [(NSUserDefaults *)userDefaults removeObjectForKey:v4];
}

- (id)parametersForLibraryIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineParametersStorage *)self keyForLibraryIdentifier:v4 error:0];
  if (v5)
  {
    id v6 = [(CPLEngineParametersStorage *)self _savedParametersForKey:v5];
    id v7 = [v6 libraryIdentifier];
    unsigned __int8 v8 = [v7 isEqualToString:v4];

    if (v8) {
      goto LABEL_5;
    }
  }
  id v6 = 0;
LABEL_5:

  return v6;
}

- (BOOL)removeParametersWithLibraryIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineParametersStorage *)self keyForLibraryIdentifier:v6 error:a4];
  if (v7)
  {
    [(NSUserDefaults *)self->_userDefaults removeObjectForKey:v7];
    [(CPLEngineParametersStorage *)self _removeKeyForInsanityForLibraryIdentifier:v6];
    [(NSUserDefaults *)self->_userDefaults synchronize];
  }

  return v7 != 0;
}

- (BOOL)saveParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 libraryIdentifier];
  unsigned __int8 v8 = [(CPLEngineParametersStorage *)self keyForLibraryIdentifier:v7 error:a4];

  if (v8)
  {
    [(CPLEngineParametersStorage *)self _saveParameters:v6 withKey:v8];
    [(CPLEngineParametersStorage *)self _setKeyForInsanityIfNecessaryForParameters:v6];
  }

  return v8 != 0;
}

- (BOOL)isCPLEngineParametersStorageKey:(id)a3
{
  return [a3 hasPrefix:@"CPLEngineParameters-"];
}

- (NSArray)allDefinedParameters
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSSet count](self->_supportedLibraryIdentifiers, "count"));
  id v4 = [(NSUserDefaults *)self->_userDefaults persistentDomainForName:self->_bundleIdentifier];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1000055EC;
  __int16 v12 = &unk_100034A80;
  v13 = self;
  id v5 = v3;
  id v14 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  objc_msgSend(v5, "sortUsingComparator:", &stru_100034AC0, v9, v10, v11, v12, v13);
  id v6 = v14;
  id v7 = (NSArray *)v5;

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSSet)supportedLibraryIdentifiers
{
  return self->_supportedLibraryIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLibraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end