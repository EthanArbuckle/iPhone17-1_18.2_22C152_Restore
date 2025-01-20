@interface INHService
- (BOOL)_checkServiceAccessWithError:(id *)a3;
- (INHService)initWithServingConnection:(id)a3;
- (NSXPCConnection)servingConnection;
- (void)fetchShareExtensionIntentForExtensionContextUUID:(id)a3 completion:(id)a4;
- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5;
- (void)loadBundleURLsForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)loadDataImageForImage:(id)a3 scaledWidth:(double)a4 scaledHeight:(double)a5 usingPortableImageLoader:(id)a6 completion:(id)a7;
- (void)loadSchemaURLsForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)loadSchemaURLsWithCompletion:(id)a3;
- (void)purgeExpiredImagesInEphemeralStore;
- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4;
- (void)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 completion:(id)a7;
- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation INHService

- (INHService)initWithServingConnection:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INHService;
  v5 = [(INHService *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_servingConnection, v4);
    v7 = (INImageFilePersistence *)objc_alloc_init((Class)INImageFilePersistence);
    filePersistence = v6->_filePersistence;
    v6->_filePersistence = v7;
  }
  return v6;
}

- (void)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  BOOL v10 = a4;
  id v12 = a3;
  v13 = (void (**)(id, void *, id))a7;
  v14 = INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[INHService storeImage:scaled:qualityOfService:storeType:completion:]";
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Storing image %@ with INImageFilePersistence", buf, 0x16u);
  }
  filePersistence = self->_filePersistence;
  id v18 = 0;
  v16 = [(INImageFilePersistence *)filePersistence storeImage:v12 scaled:v10 qualityOfService:v9 storeType:a6 error:&v18];
  id v17 = v18;
  v13[2](v13, v16, v17);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_servingConnection);

  objc_storeStrong((id *)&self->_filePersistence, 0);
}

- (NSXPCConnection)servingConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_servingConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    BOOL v10 = "-[INHService storeUserContext:forBundleIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Within intents_helper, entitled-saving UserContext:%@ for bundle: %@", (uint8_t *)&v9, 0x20u);
  }
  v8 = +[INUserContextStore sharedStore];
  [v8 storeUserContext:v5 forBundleIdentifier:v6];
}

- (BOOL)_checkServiceAccessWithError:(id *)a3
{
  id v4 = [(INHService *)self servingConnection];
  id v5 = +[INHelperServiceAccessSpecifier accessSpecifierAppropriateForXPCConnection:v4];

  id v6 = [v5 accessLevel];
  id v7 = v6;
  if (a3 && v6 != (id)2)
  {
    id v8 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
    CFStringRef v12 = @"Client does not have sufficient permissions to access bundle";
    int v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    *a3 = [v8 initWithDomain:INIntentErrorDomain code:6010 userInfo:v9];
  }
  return v7 == (id)2;
}

- (void)fetchShareExtensionIntentForExtensionContextUUID:(id)a3 completion:(id)a4
{
  id v30 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(INHService *)self servingConnection];
  id v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v31, 0, sizeof(v31));
  }
  int v9 = +[LSBundleProxy bundleProxyWithAuditToken:v31 error:0];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  id v11 = v10;

  CFStringRef v12 = [v11 bundleIdentifier];
  if (v11
    && ([v11 protocol],
        __int16 v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 isEqualToString:@"com.apple.share-services"],
        v13,
        v14))
  {
    id v36 = v11;
    v15 = +[NSArray arrayWithObjects:&v36 count:1];
    v16 = INSupportedIntentsByExtensions();

    if (![v16 count])
    {
      id v17 = [v11 objectForInfoDictionaryKey:@"ShareSheetSuggestionsSupported-Minimum-iOS13.5" ofClass:objc_opt_class() inScope:0];
      if (v17)
      {
        id v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        uint64_t v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, 0);

        v16 = (void *)v20;
      }
    }
    __int16 v21 = [v11 containingBundle];
    id v22 = [v21 bundleIdentifier];
    v23 = 0;
    if ([v16 count] && v22)
    {
      id v28 = v22;
      id v29 = v12;
      id v24 = v30;
      id v25 = v16;
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2020000000;
      v26 = (void (*)(id, id, id, id))off_10000CA58;
      v35 = off_10000CA58;
      if (!off_10000CA58)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100004C50;
        v38 = &unk_100008388;
        v39 = &v32;
        sub_100004C50((uint64_t)buf);
        v26 = (void (*)(id, id, id, id))v33[3];
      }
      _Block_object_dispose(&v32, 8);
      if (!v26)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      v23 = v26(v28, v29, v24, v25);
    }
  }
  else
  {
    v23 = 0;
  }
  v27 = INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[INHService fetchShareExtensionIntentForExtensionContextUUID:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Fetched share extension intent %@ from people suggester for bundleID %@", buf, 0x20u);
  }
  if (v6) {
    v6[2](v6, v23);
  }
}

- (void)loadBundleURLsForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if ([v6 count])
  {
    id v30 = 0;
    unsigned __int8 v8 = [(INHService *)self _checkServiceAccessWithError:&v30];
    id v9 = v30;
    BOOL v10 = v9;
    if (v8)
    {
      id v24 = v9;
      id v25 = objc_opt_new();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v11 = v6;
      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            id v17 = +[APApplication applicationWithBundleIdentifier:](APApplication, "applicationWithBundleIdentifier:", v16, v24);
            unsigned __int8 v18 = [v17 isHidden];

            if ((v18 & 1) == 0)
            {
              v19 = +[LSBundleProxy bundleProxyForIdentifier:v16];
              uint64_t v20 = [v19 bundleURL];

              if (v20)
              {
                id v21 = objc_alloc((Class)NSSecurityScopedURLWrapper);
                id v22 = [v19 bundleURL];
                id v23 = [v21 initWithURL:v22 readonly:1];
                [v25 setObject:v23 forKey:v16];
              }
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v13);
      }

      v7[2](v7, v25, 0);
      BOOL v10 = v24;
    }
    else
    {
      ((void (**)(id, void *, id))v7)[2](v7, 0, v9);
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (void)loadSchemaURLsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = +[LSApplicationWorkspace defaultWorkspace];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005230;
  v19[3] = &unk_100008320;
  id v7 = v5;
  id v20 = v7;
  [v6 enumerateBundlesOfType:1 block:v19];

  unsigned __int8 v8 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_10000523C;
  id v17 = &unk_100008320;
  id v9 = v7;
  id v18 = v9;
  [v8 enumerateBundlesOfType:6 block:&v14];

  BOOL v10 = objc_msgSend(v9, "if_compactMap:", &stru_100008360, v14, v15, v16, v17);
  id v11 = +[NSSet setWithArray:v10];
  id v12 = [v11 mutableCopy];

  id v13 = [(id)_INVCIntentDefinitionManagerClass() allBundleIdentifiers];
  if (v13) {
    [v12 addObjectsFromArray:v13];
  }
  [(INHService *)self loadSchemaURLsForBundleIdentifiers:v12 completion:v4];
}

- (void)loadSchemaURLsForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_32;
  }
  id v44 = 0;
  unsigned __int8 v8 = [(INHService *)self _checkServiceAccessWithError:&v44];
  id v9 = v44;
  BOOL v10 = v9;
  if ((v8 & 1) == 0)
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
    goto LABEL_31;
  }
  id v27 = v9;
  id v28 = v7;
  v31 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v29 = v6;
  id obj = v6;
  id v33 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (!v33) {
    goto LABEL_25;
  }
  uint64_t v32 = *(void *)v41;
  do
  {
    id v11 = 0;
    do
    {
      if (*(void *)v41 != v32) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v11);
      id v39 = 0;
      id v13 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v12 allowPlaceholder:0 error:&v39];
      id v14 = v39;
      if (v14)
      {
        uint64_t v15 = INSiriLogContextIntents;
        if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v47 = "-[INHService loadSchemaURLsForBundleIdentifiers:completion:]";
          __int16 v48 = 2112;
          uint64_t v49 = v12;
          __int16 v50 = 2112;
          id v51 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Error getting bundle record for bundle identifier %@: %@", buf, 0x20u);
        }
      }
      if (v13)
      {
        uint64_t v16 = [v13 intentDefinitionURLs];
        id v17 = [v16 allValues];
        id v18 = +[NSSet setWithArray:v17];

        if (![v18 count]) {
          goto LABEL_23;
        }
      }
      else
      {
        v19 = [(id)_INVCIntentDefinitionManagerClass() intentDefinitionURLsForBundleID:v12];
        id v18 = +[NSSet setWithArray:v19];
      }
      id v34 = v14;
      id v20 = objc_opt_new();
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = v18;
      id v21 = [v18 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v36;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v18);
            }
            id v25 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:*(void *)(*((void *)&v35 + 1) + 8 * i) readonly:1];
            [v20 addObject:v25];
          }
          id v22 = [v18 countByEnumeratingWithState:&v35 objects:v45 count:16];
        }
        while (v22);
      }

      [v31 setObject:v20 forKey:v12];
      id v14 = v34;
LABEL_23:

      id v11 = (char *)v11 + 1;
    }
    while (v11 != v33);
    id v33 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  }
  while (v33);
LABEL_25:

  if ([v31 count]) {
    long long v26 = v31;
  }
  else {
    long long v26 = 0;
  }
  id v7 = v28;
  (*((void (**)(id, void *, void))v28 + 2))(v28, v26, 0);

  id v6 = v29;
  BOOL v10 = v27;
LABEL_31:

LABEL_32:
}

- (void)purgeExpiredImagesInEphemeralStore
{
  v3 = INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[INHService purgeExpiredImagesInEphemeralStore]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Purging all expired ephemeral images in INImageFilePersistence", (uint8_t *)&v4, 0xCu);
  }
  [(INImageFilePersistence *)self->_filePersistence purgeExpiredImagesInEphemeralStore];
}

- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    BOOL v10 = "-[INHService purgeImageWithIdentifier:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Purging image %@ from INImageFilePersistence", (uint8_t *)&v9, 0x16u);
  }
  [(INImageFilePersistence *)self->_filePersistence purgeImageWithIdentifier:v6 completion:v7];
}

- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    BOOL v10 = INSiriLogContextIntents;
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      id v12 = "-[INHService filePathForImage:usingPortableImageLoader:completion:]";
      __int16 v13 = 2112;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Loading image file path for %@ with portable image loader %@", (uint8_t *)&v11, 0x20u);
    }
    [v8 filePathForImage:v7 completion:v9];
  }
}

- (void)loadDataImageForImage:(id)a3 scaledWidth:(double)a4 scaledHeight:(double)a5 usingPortableImageLoader:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v14)
  {
    __int16 v15 = [(INHService *)self servingConnection];
    id v16 = +[INHelperServiceAccessSpecifier accessSpecifierAppropriateForXPCConnection:v15];

    id v17 = INSiriLogContextIntents;
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "-[INHService loadDataImageForImage:scaledWidth:scaledHeight:usingPortableImageLoader:completion:]";
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Loading image %@ with portable image loader %@", buf, 0x20u);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100005B94;
    v18[3] = &unk_1000082F8;
    id v19 = v14;
    double v20 = a4;
    double v21 = a5;
    [v13 loadImageDataFromImage:v12 accessSpecifier:v16 completion:v18];
  }
}

- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    BOOL v10 = "-[INHService retrieveImageWithIdentifier:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Retrieving image with identifier %@ with INImageFilePersistence", (uint8_t *)&v9, 0x16u);
  }
  [(INImageFilePersistence *)self->_filePersistence retrieveImageWithIdentifier:v6 completion:v7];
}

@end