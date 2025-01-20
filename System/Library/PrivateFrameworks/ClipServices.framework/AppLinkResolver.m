@interface AppLinkResolver
+ (id)_appBundleIdentifiersByURLPrefixes;
+ (id)_clipIPALinksByBundleIdentifiers;
- (AppLinkResolver)init;
- (BOOL)isClipForAppBundleIdentifier:(id)a3;
- (id)_bundleIdentifierForURL:(id)a3;
- (id)_hardCodedBundleIdentifierForURL:(id)a3;
- (id)appBundleIdentifierForURL:(id)a3;
- (id)ipaLinkForClipBundleIdentifier:(id)a3;
- (id)metadataForURL:(id)a3;
- (void)getAppBundleIdentifierForURL:(id)a3 completionHandler:(id)a4;
- (void)saveLinkWithURL:(id)a3 metadata:(id)a4;
@end

@implementation AppLinkResolver

- (AppLinkResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)AppLinkResolver;
  v2 = [(AppLinkResolver *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)saveLinkWithURL:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (!self->_URLHashToMetadataMap)
    {
      v9 = +[NSMutableDictionary dictionary];
      URLHashToMetadataMap = self->_URLHashToMetadataMap;
      self->_URLHashToMetadataMap = v9;
    }
    v11 = [v6 absoluteString];
    v12 = objc_msgSend(v11, "cps_sha256");

    [(NSMutableDictionary *)self->_URLHashToMetadataMap setObject:v8 forKey:v12];
    v13 = sub_1000051D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138740227;
      v15 = v8;
      __int16 v16 = 2117;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Found an app with meta data: %{sensitive}@, for URL: %{sensitive}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (id)metadataForURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 absoluteString];
  id v6 = objc_msgSend(v5, "cps_sha256");

  id v7 = [(NSMutableDictionary *)self->_URLHashToMetadataMap objectForKeyedSubscript:v6];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = +[CPSSessionManager sharedManager];
    v11 = [v10 sessionWithURL:v4 createIfNoExist:0];

    id v9 = [v11 metadata];

    if (v9)
    {
      id v9 = [v11 metadata];
    }
  }

  return v9;
}

- (id)appBundleIdentifierForURL:(id)a3
{
  id v4 = a3;
  v5 = sub_1000051D4();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "resolveURLAction", "start resolving URL", buf, 2u);
  }
  id v6 = [(AppLinkResolver *)self _bundleIdentifierForURL:v4];

  id v7 = sub_1000051D4();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "resolveURLAction", "end resolving URL", v9, 2u);
  }

  return v6;
}

- (id)ipaLinkForClipBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = sub_100002E84;
  id v17 = sub_100002E94;
  v5 = +[AppLinkResolver _clipIPALinksByBundleIdentifiers];
  id v18 = [v5 objectForKeyedSubscript:v4];

  id v6 = (void *)v14[5];
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    URLHashToMetadataMap = self->_URLHashToMetadataMap;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002E9C;
    v10[3] = &unk_1000144D8;
    id v11 = v4;
    v12 = &v13;
    [(NSMutableDictionary *)URLHashToMetadataMap enumerateKeysAndObjectsUsingBlock:v10];
    id v7 = (id)v14[5];
  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)getAppBundleIdentifierForURL:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = (void (**)(id, void *))a4;
    id v7 = a3;
    v8 = sub_1000051D4();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "resolveURLAction", "start resolving URL", buf, 2u);
    }
    id v9 = [(AppLinkResolver *)self _bundleIdentifierForURL:v7];

    v6[2](v6, v9);
    v10 = sub_1000051D4();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)id v11 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "resolveURLAction", "end resolving URL", v11, 2u);
    }
  }
}

- (BOOL)isClipForAppBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[AppLinkResolver _appBundleIdentifiersByURLPrefixes];
  v5 = [v4 allKeysForObject:v3];

  LOBYTE(v3) = [v5 count] != 0;
  return (char)v3;
}

- (id)_bundleIdentifierForURL:(id)a3
{
  id v4 = a3;
  v5 = [(AppLinkResolver *)self metadataForURL:v4];
  id v6 = v5;
  if (v5) {
    [v5 clipBundleID];
  }
  else {
  id v7 = [(AppLinkResolver *)self _hardCodedBundleIdentifierForURL:v4];
  }

  return v7;
}

+ (id)_appBundleIdentifiersByURLPrefixes
{
  if (+[CPSClipURL isSupported])
  {
    if (qword_10001A2E0 != -1) {
      dispatch_once(&qword_10001A2E0, &stru_1000144F8);
    }
    id v2 = (id)qword_10001A2D8;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

+ (id)_clipIPALinksByBundleIdentifiers
{
  return &off_100015038;
}

- (id)_hardCodedBundleIdentifierForURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 absoluteString];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_100002E84;
  __int16 v16 = sub_100002E94;
  id v17 = 0;
  v5 = +[AppLinkResolver _appBundleIdentifiersByURLPrefixes];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000333C;
  v9[3] = &unk_100014520;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void).cxx_destruct
{
}

@end