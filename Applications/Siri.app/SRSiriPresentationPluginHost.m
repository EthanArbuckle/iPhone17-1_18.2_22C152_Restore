@interface SRSiriPresentationPluginHost
+ (id)_defaultURL;
+ (id)sharedSiriPresentationPluginHost;
- (BOOL)_isLoaded;
- (NSMutableDictionary)_bundleURLsByBundleIdentifier;
- (NSURL)_URL;
- (SRSiriPresentationPluginHost)init;
- (SRSiriPresentationPluginHost)initWithURL:(id)a3;
- (id)_builtInPresentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5;
- (id)_cachedURLForBundleWithIdentifier:(id)a3;
- (id)_classNameForBuiltInPresentationWithIdentifier:(id)a3;
- (id)_propertyListRepresentation;
- (id)_siriPresentationPluginBundleWithIdentifier:(id)a3;
- (id)presentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5;
- (void)_load;
- (void)_loadFromPropertyListRepresentation:(id)a3;
- (void)_rescanBundles;
- (void)_save;
- (void)_setLoaded:(BOOL)a3;
- (void)preloadPresentationBundleWithIdentifier:(id)a3;
@end

@implementation SRSiriPresentationPluginHost

+ (id)_defaultURL
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];

  v4 = [v3 stringByAppendingPathComponent:@"com.apple.siri.PresentationPluginCache.plist"];
  v5 = +[NSURL fileURLWithPath:v4 isDirectory:0];

  return v5;
}

+ (id)sharedSiriPresentationPluginHost
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F62C;
  block[3] = &unk_100144420;
  block[4] = a1;
  if (qword_100171E40 != -1) {
    dispatch_once(&qword_100171E40, block);
  }
  v2 = (void *)qword_100171E38;

  return v2;
}

- (SRSiriPresentationPluginHost)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SRSiriPresentationPluginHost;
  v5 = [(SRSiriPresentationPluginHost *)&v11 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    URL = v5->_URL;
    v5->_URL = v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    bundleURLsByBundleIdentifier = v5->_bundleURLsByBundleIdentifier;
    v5->_bundleURLsByBundleIdentifier = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (SRSiriPresentationPluginHost)init
{
  v3 = [(id)objc_opt_class() _defaultURL];
  id v4 = [(SRSiriPresentationPluginHost *)self initWithURL:v3];

  return v4;
}

- (id)_classNameForBuiltInPresentationWithIdentifier:(id)a3
{
  uint64_t v3 = qword_100171E50;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100171E50, &stru_1001444F8);
  }
  v5 = [(id)qword_100171E48 objectForKey:v4];

  return v5;
}

- (id)_builtInPresentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(SRSiriPresentationPluginHost *)self _classNameForBuiltInPresentationWithIdentifier:a3];
  id v11 = objc_alloc(NSClassFromString(v10));

  if ([v11 conformsToProtocol:&OBJC_PROTOCOL___SiriUIPresentation])
  {
    id v12 = v11;
    if (objc_opt_respondsToSelector())
    {
      id v13 = [v12 initWithDelegate:v8 dataSource:v9];
      goto LABEL_6;
    }
  }
  id v13 = [v11 init];
LABEL_6:
  v14 = v13;

  return v14;
}

- (void)_rescanBundles
{
  uint64_t v3 = [(SRSiriPresentationPluginHost *)self _bundleURLsByBundleIdentifier];
  [v3 removeAllObjects];

  id v4 = AFPresentationPluginsURL();
  id v5 = objc_alloc_init((Class)NSFileManager);
  NSURLResourceKey v30 = NSURLNameKey;
  v6 = +[NSArray arrayWithObjects:&v30 count:1];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_10005FB44;
  v27 = &unk_100144520;
  id v28 = v4;
  id v19 = v28;
  v7 = [v5 enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = [v13 pathExtension];
        unsigned int v15 = [v14 isEqualToString:@"siriUIPresentationBundle"];

        if (v15)
        {
          v16 = +[NSBundle bundleWithURL:v13];
          v17 = [(SRSiriPresentationPluginHost *)self _bundleURLsByBundleIdentifier];
          v18 = [v16 bundleIdentifier];
          [v17 setObject:v13 forKey:v18];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v10);
  }

  [(SRSiriPresentationPluginHost *)self _save];
}

- (id)_cachedURLForBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  [(SRSiriPresentationPluginHost *)self _load];
  id v5 = [(SRSiriPresentationPluginHost *)self _bundleURLsByBundleIdentifier];
  v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    [(SRSiriPresentationPluginHost *)self _rescanBundles];
    v7 = [(SRSiriPresentationPluginHost *)self _bundleURLsByBundleIdentifier];
    v6 = [v7 objectForKey:v4];
  }

  return v6;
}

- (id)_siriPresentationPluginBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriPresentationPluginHost *)self _cachedURLForBundleWithIdentifier:v4];
  if (v5) {
    +[NSBundle bundleWithURL:v5];
  }
  else {
  v6 = +[NSBundle bundleWithIdentifier:v4];
  }

  return v6;
}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[SRSiriPresentationPluginHost preloadPresentationBundleWithIdentifier:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = [(SRSiriPresentationPluginHost *)self _siriPresentationPluginBundleWithIdentifier:v4];
  if (([v6 isLoaded] & 1) == 0) {
    [v6 load];
  }
}

- (id)presentationWithIdentifier:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SRSiriPresentationPluginHost *)self _builtInPresentationWithIdentifier:v8 delegate:v9 dataSource:v10];
  if (!v11)
  {
    id v12 = [(SRSiriPresentationPluginHost *)self _siriPresentationPluginBundleWithIdentifier:v8];
    id v13 = objc_alloc((Class)[v12 principalClass]);
    if (objc_opt_respondsToSelector()) {
      id v14 = [v13 initWithDelegate:v9 dataSource:v10];
    }
    else {
      id v14 = [v13 init];
    }
    uint64_t v11 = v14;
  }

  return v11;
}

- (id)_propertyListRepresentation
{
  uint64_t v3 = [(SRSiriPresentationPluginHost *)self _bundleURLsByBundleIdentifier];
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);

  id v5 = [(SRSiriPresentationPluginHost *)self _bundleURLsByBundleIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100060030;
  v8[3] = &unk_100144548;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

- (void)_loadFromPropertyListRepresentation:(id)a3
{
  id v4 = a3;
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100060180;
  v7[3] = &unk_100144570;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  id v6 = [(SRSiriPresentationPluginHost *)self _bundleURLsByBundleIdentifier];
  [v6 setDictionary:v5];
}

- (void)_load
{
  if (![(SRSiriPresentationPluginHost *)self _isLoaded])
  {
    uint64_t v3 = [(SRSiriPresentationPluginHost *)self _URL];
    id v13 = 0;
    id v4 = +[NSData dataWithContentsOfURL:v3 options:1 error:&v13];
    id v5 = v13;

    if (v4)
    {
      id v12 = 0;
      id v6 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v12];
      id v7 = v12;

      if (v6)
      {
        [(SRSiriPresentationPluginHost *)self _loadFromPropertyListRepresentation:v6];
      }
      else
      {
        id v10 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
          sub_1000B9E88(self, v10);
        }
      }

      goto LABEL_15;
    }
    id v8 = [v5 domain];
    if ([v8 isEqualToString:NSCocoaErrorDomain])
    {
      id v9 = [v5 code];

      if (v9 == (id)260)
      {
LABEL_14:
        id v7 = v5;
LABEL_15:
        [(SRSiriPresentationPluginHost *)self _setLoaded:1];

        return;
      }
    }
    else
    {
    }
    uint64_t v11 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B9DDC(self, v11);
    }
    goto LABEL_14;
  }
}

- (void)_save
{
  uint64_t v3 = [(SRSiriPresentationPluginHost *)self _propertyListRepresentation];
  id v12 = 0;
  id v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v6 = [(SRSiriPresentationPluginHost *)self _URL];
    id v11 = v5;
    unsigned __int8 v7 = [v4 writeToURL:v6 options:1 error:&v11];
    id v8 = v11;

    if ((v7 & 1) == 0)
    {
      id v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        id v14 = "-[SRSiriPresentationPluginHost _save]";
        __int16 v15 = 2112;
        v16 = self;
        __int16 v17 = 2112;
        v18 = v6;
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s %@ unable to write property list representation data to %@: %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    id v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v14 = "-[SRSiriPresentationPluginHost _save]";
      __int16 v15 = 2114;
      v16 = self;
      __int16 v17 = 2112;
      v18 = v3;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %{public}@ unable to create property list data from property list representation %@: %{public}@", buf, 0x2Au);
    }
    id v8 = v5;
  }
}

- (NSURL)_URL
{
  return self->_URL;
}

- (BOOL)_isLoaded
{
  return self->_loaded;
}

- (void)_setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (NSMutableDictionary)_bundleURLsByBundleIdentifier
{
  return self->_bundleURLsByBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURLsByBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end