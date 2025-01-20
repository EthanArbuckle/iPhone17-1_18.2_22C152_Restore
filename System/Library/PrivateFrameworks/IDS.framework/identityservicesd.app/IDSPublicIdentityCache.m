@interface IDSPublicIdentityCache
+ (id)sharedInstance;
- (BOOL)addIdentity:(id)a3 forToken:(id)a4 uri:(id)a5 service:(id)a6 error:(id *)a7;
- (BOOL)addIdentityData:(id)a3 forToken:(id)a4 uri:(id)a5 service:(id)a6 error:(id *)a7;
- (BOOL)cleanupWithError:(id *)a3;
- (IDSPublicIdentityCache)init;
- (IDSPublicIdentityCache)initWithPath:(id)a3 withPersistenceManager:(id)a4;
- (id)identityDataForToken:(id)a3 uri:(id)a4 service:(id)a5 error:(id *)a6;
- (id)identityForToken:(id)a3 uri:(id)a4 service:(id)a5 error:(id *)a6;
- (id)keyForToken:(id)a3 uri:(id)a4 service:(id)a5;
- (id)recentURIsWithinTimeInterval:(double)a3 forService:(id)a4 error:(id *)a5;
- (void)deleteCache;
@end

@implementation IDSPublicIdentityCache

+ (id)sharedInstance
{
  if (qword_100A4A240 != -1) {
    dispatch_once(&qword_100A4A240, &stru_10097E948);
  }
  v2 = (void *)qword_100A4A248;

  return v2;
}

- (IDSPublicIdentityCache)init
{
  uint64_t v3 = CSDBGetMobileUserDirectory();
  if (v3)
  {
    v4 = +[NSString stringWithUTF8String:v3];
  }
  else
  {
    v4 = @"~";
  }
  v11[0] = v4;
  v11[1] = @"/Library/IdentityServices/ids-pub-id.db";
  v5 = +[NSArray arrayWithObjects:v11 count:2];
  v6 = +[NSString pathWithComponents:v5];

  if (v3) {
  v7 = +[IDSDaemon sharedInstance];
  }
  v8 = [v7 persistenceManager];
  v9 = [(IDSPublicIdentityCache *)self initWithPath:v6 withPersistenceManager:v8];

  return v9;
}

- (IDSPublicIdentityCache)initWithPath:(id)a3 withPersistenceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSPublicIdentityCache;
  v8 = [(IDSPublicIdentityCache *)&v12 init];
  if (v8)
  {
    v9 = (IDSKVStore *)[objc_alloc((Class)IDSKVStore) initWithPath:v6 storeName:@"PublicIdentityCache" dataProtectionClass:0];
    kvStore = v8->_kvStore;
    v8->_kvStore = v9;

    objc_storeStrong((id *)&v8->_persistenceManager, a4);
  }

  return v8;
}

- (id)keyForToken:(id)a3 uri:(id)a4 service:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = objc_msgSend(a3, "__imHexString");
  v10 = +[NSString stringWithFormat:@"%@-%@-%@", v9, v8, v7];

  return v10;
}

- (BOOL)addIdentityData:(id)a3 forToken:(id)a4 uri:(id)a5 service:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a5;
  if (_os_feature_enabled_impl())
  {
    [(IDSQuerySDPersistenceManager *)self->_persistenceManager savePublicIdentityData:v12 token:v13 uri:v15 service:v14 completion:&stru_10097E968];
    unsigned __int8 v16 = 1;
  }
  else
  {
    v17 = [v15 prefixedURI];

    id v15 = [(IDSPublicIdentityCache *)self keyForToken:v13 uri:v17 service:v14];

    unsigned __int8 v16 = [(IDSKVStore *)self->_kvStore persistData:v12 forKey:v15 error:a7];
  }

  return v16;
}

- (id)identityDataForToken:(id)a3 uri:(id)a4 service:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if (_os_feature_enabled_impl())
  {
    [(IDSQuerySDPersistenceManager *)self->_persistenceManager publicIdentityDataFor:v10 uri:v12 service:v11];
  }
  else
  {
    id v13 = [v12 prefixedURI];

    id v12 = [(IDSPublicIdentityCache *)self keyForToken:v10 uri:v13 service:v11];

    [(IDSKVStore *)self->_kvStore dataForKey:v12 error:a6];
  id v14 = };

  return v14;
}

- (BOOL)addIdentity:(id)a3 forToken:(id)a4 uri:(id)a5 service:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v11 dataRepresentationWithError:a7];
  if (v15)
  {
    unsigned __int8 v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      IDSLoggableDescriptionForTokenOnService();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = [v13 prefixedURI];
      v19 = IDSLoggableDescriptionForHandleOnService();
      *(_DWORD *)buf = 138413058;
      id v30 = v11;
      __int16 v31 = 2112;
      id v32 = v17;
      __int16 v33 = 2112;
      v34 = v19;
      __int16 v35 = 2112;
      id v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Adding identity to last resort DB { identity: %@, token: %@, uri: %@, service: %@ }", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v20 = IDSLoggableDescriptionForTokenOnService();
      v21 = [v13 prefixedURI];
      v26 = IDSLoggableDescriptionForHandleOnService();
      id v27 = v14;
      id v24 = v11;
      v25 = v20;
      _IDSLogV();
    }
    BOOL v22 = -[IDSPublicIdentityCache addIdentityData:forToken:uri:service:error:](self, "addIdentityData:forToken:uri:service:error:", v15, v12, v13, v14, a7, v24, v25, v26, v27);
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (id)identityForToken:(id)a3 uri:(id)a4 service:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForTokenOnService();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = IDSLoggableDescriptionForTokenOnService();
    *(_DWORD *)buf = 138412802;
    id v29 = v14;
    __int16 v30 = 2112;
    id v31 = v15;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Checking last resort DB for identity { token: %@, uri: %@, service: %@ }", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    unsigned __int8 v16 = IDSLoggableDescriptionForTokenOnService();
    v25 = IDSLoggableDescriptionForTokenOnService();
    id v26 = v12;
    id v24 = v16;
    _IDSLogV();
  }
  id v17 = -[IDSPublicIdentityCache identityDataForToken:uri:service:error:](self, "identityDataForToken:uri:service:error:", v10, v11, v12, a6, v24, v25, v26);
  if (v17)
  {
    v18 = +[IDSMPPublicDeviceIdentityContainer identityWithDataRepresentation:v17 error:a6];
    if (v18)
    {
      v19 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        IDSLoggableDescriptionForTokenOnService();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = IDSLoggableDescriptionForTokenOnService();
        *(_DWORD *)buf = 138413058;
        id v29 = v18;
        __int16 v30 = 2112;
        id v31 = v20;
        __int16 v32 = 2112;
        id v33 = v21;
        __int16 v34 = 2112;
        id v35 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found identity in last resort DB { identity: %@, token: %@, uri: %@, service: %@ }", buf, 0x2Au);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        BOOL v22 = IDSLoggableDescriptionForTokenOnService();
        id v27 = IDSLoggableDescriptionForTokenOnService();
        _IDSLogV();
      }
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)cleanupWithError:(id *)a3
{
  v5 = +[IDSServerBag sharedInstance];
  id v6 = [v5 objectForKey:@"public-identity-clear-time-seconds"];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = v6;
  }
  else {
    id v7 = &off_1009D0B40;
  }
  id v8 = +[IDSServerBag sharedInstance];
  v9 = [v8 objectForKey:@"public-identity-future-clear-time-seconds"];

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v10 = v9;
  }
  else {
    id v10 = &off_1009D0B40;
  }
  id v11 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)-(uint64_t)[v7 integerValue]);
  id v12 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)[v10 integerValue]);
  id v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    __int16 v22 = 2112;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cleaning last resort DB with date range %@ to %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (_os_feature_enabled_impl())
  {
    persistenceManager = self->_persistenceManager;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000283E0;
    v17[3] = &unk_10097E758;
    id v18 = v11;
    id v19 = v12;
    [(IDSQuerySDPersistenceManager *)persistenceManager deletePublicIdentitiesBeforeDate:v18 afterDate:v19 completion:v17];

    unsigned __int8 v15 = 1;
  }
  else
  {
    unsigned __int8 v15 = [(IDSKVStore *)self->_kvStore deleteEntriesBeforeDate:v11 afterDate:v12 error:a3];
  }

  return v15;
}

- (id)recentURIsWithinTimeInterval:(double)a3 forService:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = +[NSDate dateWithTimeIntervalSinceNow:-a3];
  if (_os_feature_enabled_impl())
  {
    id v10 = [(IDSQuerySDPersistenceManager *)self->_persistenceManager recentURIsSinceDate:v9 service:v8];
    id v11 = v10;
    if (!v10 || ![v10 count])
    {
      id v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v8;
        __int16 v29 = 2112;
        __int16 v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found no recent URIs for service: %@ in last resort cache since date %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v23 = v8;
        id v24 = v9;
        _IDSLogV();
      }
LABEL_26:
      id v19 = +[NSSet set];
      goto LABEL_27;
    }
  }
  else
  {
    id v13 = [(IDSKVStore *)self->_kvStore storedKeysAfterDate:v9 error:a5];
    id v11 = v13;
    if (!v13 || ![v13 count])
    {
      v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v8;
        __int16 v29 = 2112;
        __int16 v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found no recent URIs for service: %@ in last resort cache since date %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v23 = v8;
        id v24 = v9;
        _IDSLogV();
      }
      goto LABEL_26;
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100028968;
    v25[3] = &unk_10097E990;
    id v26 = v8;
    uint64_t v14 = objc_msgSend(v11, "__imArrayByApplyingBlock:", v25);

    id v11 = (void *)v14;
  }
  uint64_t v15 = objc_msgSend(v11, "__imArrayByFilteringWithBlock:", &stru_10097E9D0);
  unsigned __int8 v16 = (void *)v15;
  id v17 = &__NSArray0__struct;
  if (v15) {
    id v17 = (void *)v15;
  }
  id v18 = v17;

  id v19 = +[NSSet setWithArray:v18];
  id v20 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v8;
    __int16 v29 = 2112;
    __int16 v30 = v9;
    __int16 v31 = 2112;
    __int16 v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetched recent URIs for service: %@ in last resort cache since date %@ { URIs: %@ }", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }

LABEL_27:

  return v19;
}

- (void)deleteCache
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);

  objc_storeStrong((id *)&self->_kvStore, 0);
}

@end