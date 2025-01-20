@interface IDSRegistrationKeychainManager
+ (IDSRegistrationKeychainManager)sharedInstance;
+ (id)keychainAccessGroupForVersion:(unint64_t)a3;
+ (id)keychainAccountForVersion:(unint64_t)a3;
+ (id)keychainServiceForVersion:(unint64_t)a3;
- (BOOL)__saveToKeychain;
- (BOOL)_saveToKeychain;
- (BOOL)addRegistration:(id)a3;
- (BOOL)removeAllRegistrations;
- (BOOL)removeRegistration:(id)a3;
- (IDSRegistrationKeychainManager)init;
- (NSArray)registrations;
- (OS_dispatch_queue)saveQueue;
- (id)authenticationCertForID:(id)a3;
- (id)registrationWithServiceType:(id)a3 registrationType:(int)a4 value:(id)a5;
- (id)smsIDs;
- (id)smsSignatureForID:(id)a3;
- (id)tempPhoneCredentialForID:(id)a3;
- (void)_flush;
- (void)_loadIfNeeded;
- (void)_purgeTimerFiredOnMain;
- (void)_reloadFromDictionary:(id)a3;
- (void)_setPurgeTimer;
- (void)dealloc;
- (void)reloadFromKeychain;
- (void)setAuthenticationCert:(id)a3 forID:(id)a4;
- (void)setSMSSignature:(id)a3 mainID:(id)a4;
- (void)setSaveQueue:(id)a3;
- (void)setTempPhoneCredential:(id)a3 forID:(id)a4;
- (void)systemDidFinishMigration;
@end

@implementation IDSRegistrationKeychainManager

+ (IDSRegistrationKeychainManager)sharedInstance
{
  if (qword_100A4C2C8 != -1) {
    dispatch_once(&qword_100A4C2C8, &stru_100986830);
  }
  v2 = (void *)qword_100A4C2D0;

  return (IDSRegistrationKeychainManager *)v2;
}

- (IDSRegistrationKeychainManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)IDSRegistrationKeychainManager;
  v2 = [(IDSRegistrationKeychainManager *)&v23 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    registrationData = v2->_registrationData;
    v2->_registrationData = v3;

    v5 = +[IMSystemMonitor sharedInstance];
    [v5 _addEarlyListener:v2];

    v6 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.identityservicesd.registrationKeychainManager-save", v8);
    saveQueue = v2->_saveQueue;
    v2->_saveQueue = (OS_dispatch_queue *)v9;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10022BF3C;
    v20[3] = &unk_100981000;
    objc_copyWeak(&v21, &location);
    id v11 = [v20 copy];
    id purgeCancelBlock = v2->_purgeCancelBlock;
    v2->_id purgeCancelBlock = v11;

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10022BF90;
    v17[3] = &unk_100981968;
    objc_copyWeak(&v19, &location);
    v13 = v2;
    v18 = v13;
    id v14 = [v17 copy];
    id purgeEnqueueBlock = v13->_purgeEnqueueBlock;
    v13->_id purgeEnqueueBlock = v14;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[IMSystemMonitor sharedInstance];
  [v3 _removeEarlyListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IDSRegistrationKeychainManager;
  [(IDSRegistrationKeychainManager *)&v4 dealloc];
}

- (void)_purgeTimerFiredOnMain
{
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022C14C;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)systemDidFinishMigration
{
  v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reloading keychain information: %@", (uint8_t *)&v4, 0xCu);
  }

  [(IDSRegistrationKeychainManager *)self reloadFromKeychain];
}

+ (id)keychainServiceForVersion:(unint64_t)a3
{
  if (a3)
  {
    int v4 = @"com.apple.facetime";
  }
  else
  {
    int v4 = (__CFString *)IDSKeychainServiceNameV0;
  }
  return v4;
}

+ (id)keychainAccountForVersion:(unint64_t)a3
{
  if (a3)
  {
    id v3 = +[NSString stringWithFormat:@"%@V%d", @"registration", a3];
  }
  else
  {
    id v3 = IDSKeychainAccountNameV0;
  }

  return v3;
}

+ (id)keychainAccessGroupForVersion:(unint64_t)a3
{
  return IDSKeychainAccessGroup;
}

- (BOOL)__saveToKeychain
{
  if (self->_loaded)
  {
    [(NSRecursiveLock *)self->_lock lock];
    byte_100A4C2D8 = 0;
    id v3 = +[IMRGLog keychainManager];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "** Saving registration data to keychain: Begin **", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled()) {
      MarcoLogRegistration();
    }
    id v58 = objc_alloc_init((Class)NSMutableDictionary);
    id v60 = objc_alloc_init((Class)NSMutableArray);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v57 = self;
    obj = self->_registrationData;
    id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    v5 = (id *)IMRGLog_ptr;
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = *(void *)v69;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v69 != v7) {
            objc_enumerationMutation(obj);
          }
          dispatch_queue_t v9 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          v10 = [v9 dictionaryRepresentation];
          id v11 = [*v5 keychainManager];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = [v9 serviceType];
            v13 = [v9 mainID];
            *(_DWORD *)buf = 138412546;
            id v73 = v12;
            __int16 v74 = 2112;
            v75 = v13;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "  => Adding registration for service: %@  ID: %@  to keychain dictionary", buf, 0x16u);

            v5 = (id *)IMRGLog_ptr;
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            id v14 = [v9 serviceType];
            [v9 mainID];
            v56 = id v52 = v14;
            MarcoLogRegistration();

            v5 = (id *)IMRGLog_ptr;
          }
          v15 = objc_msgSend(*v5, "keychainManager", v52, v56);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [v9 description];
            *(_DWORD *)buf = 138412290;
            id v73 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "     => Registration %@", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            v53 = [v9 description];
            MarcoLogRegistration();
          }
          v17 = objc_msgSend(*v5, "keychainManager", v53);
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          if (v10)
          {
            if (v18)
            {
              id v19 = [v10 count];
              *(_DWORD *)buf = 134217984;
              id v73 = v19;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "    => Dictionary has %lu key-value pairs", buf, 0xCu);
            }

            [v60 addObject:v10];
          }
          else
          {
            if (v18)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "    => Not saving, got a nil dictionary representation", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled()) {
              MarcoLogRegistration();
            }
          }
        }
        id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v6);
    }

    v20 = objc_opt_class();
    uint64_t v21 = IDSKeychainBlobCurrentVersion;
    v22 = [v20 keychainServiceForVersion:IDSKeychainBlobCurrentVersion];
    objc_super v23 = [(id)objc_opt_class() keychainAccountForVersion:v21];
    v24 = [*v5 keychainManager];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v60 count];
      *(_DWORD *)buf = 134217984;
      id v73 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Final keychain data array count: %lu", buf, 0xCu);
    }

    v26 = v58;
    if ([v60 count]) {
      [v58 setObject:v60 forKey:@"data"];
    }
    v27 = +[NSNumber numberWithUnsignedInteger:v21];
    [v58 setObject:v27 forKey:@"version"];

    if ([(NSMutableDictionary *)v57->_authenticationCerts count])
    {
      [v58 setObject:v57->_authenticationCerts forKey:@"auth-certs"];
      v28 = (id *)IMRGLog_ptr;
      v29 = +[IMRGLog keychainManager];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [(NSMutableDictionary *)v57->_authenticationCerts count];
        v31 = [(NSMutableDictionary *)v57->_authenticationCerts allKeys];
        *(_DWORD *)buf = 134218242;
        id v73 = v30;
        v28 = (id *)IMRGLog_ptr;
        __int16 v74 = 2112;
        v75 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "  => Adding %lu auth certs for users %@", buf, 0x16u);

        v26 = v58;
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        id v32 = [(NSMutableDictionary *)v57->_authenticationCerts count];
        [(NSMutableDictionary *)v57->_authenticationCerts allKeys];
        v56 = id v52 = v32;
        MarcoLogRegistration();

        v28 = (id *)IMRGLog_ptr;
      }
    }
    else
    {
      v28 = (id *)IMRGLog_ptr;
      v35 = +[IMRGLog keychainManager];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "  => We don't have any auth certs to save", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled()) {
        MarcoLogRegistration();
      }
    }
    if ([(NSMutableDictionary *)v57->_smsSignatures count])
    {
      [v26 setObject:v57->_smsSignatures forKey:@"sms-signatures"];
      v36 = [*v28 keychainManager];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = [(NSMutableDictionary *)v57->_smsSignatures count];
        *(_DWORD *)buf = 134217984;
        id v73 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "  => Adding %lu SMS signatures", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        id v54 = [(NSMutableDictionary *)v57->_smsSignatures count];
LABEL_55:
        MarcoLogRegistration();
      }
    }
    else
    {
      v38 = [*v28 keychainManager];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "  => We don't have any SMS signatures to save", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled()) {
        goto LABEL_55;
      }
    }
    if ([(NSMutableDictionary *)v57->_tempPhoneCredentials count])
    {
      [v26 setObject:v57->_tempPhoneCredentials forKey:@"temp-phone-creds"];
      v39 = [*v28 keychainManager];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = [(NSMutableDictionary *)v57->_tempPhoneCredentials count];
        *(_DWORD *)buf = 134217984;
        id v73 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "  => Adding %lu temp phone credentials", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_65;
      }
      id v55 = [(NSMutableDictionary *)v57->_tempPhoneCredentials count];
    }
    else
    {
      v41 = [*v28 keychainManager];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "  => We don't have any temp phone credentials to save", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_65;
      }
    }
    MarcoLogRegistration();
LABEL_65:
    uint64_t v42 = arc4random();
    v43 = +[NSNumber numberWithUnsignedInt:v42];
    [v26 setObject:v43 forKey:@"save-identifier"];

    id v67 = 0;
    v44 = +[NSPropertyListSerialization dataWithPropertyList:v26 format:200 options:0 error:&v67];
    id v45 = v67;
    BOOL v34 = v44 != 0;
    if (v44)
    {
      v46 = [(id)objc_opt_class() keychainAccessGroupForVersion:v21];
      saveQueue = v57->_saveQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10022CDF0;
      block[3] = &unk_100986858;
      id v62 = v44;
      id v63 = v22;
      id v64 = v23;
      id v65 = v46;
      int v66 = v42;
      id v48 = v46;
      dispatch_async(saveQueue, block);

      v49 = v60;
    }
    else
    {
      v50 = +[IMRGLog keychainManager];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v73 = v45;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Unable to build property list data: %@", buf, 0xCu);
      }

      v49 = v60;
      if (os_log_shim_legacy_logging_enabled())
      {
        id v55 = v45;
        MarcoLogRegistration();
      }
    }
    [(NSRecursiveLock *)v57->_lock unlock];

    return v34;
  }
  v33 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "** We haven't loaded anything, ignoring save to keychain **", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled()) {
    MarcoLogRegistration();
  }
  return 0;
}

- (BOOL)_saveToKeychain
{
  [(NSRecursiveLock *)self->_lock lock];
  if ((byte_100A4C2D8 & 1) == 0)
  {
    byte_100A4C2D8 = 1;
    im_dispatch_after_primary_queue();
  }
  [(NSRecursiveLock *)self->_lock unlock];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, IDSRegistrationKeychainChangedNotification, 0, 0, 0);
  return 1;
}

- (void)_flush
{
  id v3 = im_primary_queue();
  dispatch_async(v3, self->_purgeCancelBlock);

  [(NSRecursiveLock *)self->_lock lock];
  if (self->_loaded)
  {
    id v4 = +[IMRGLog keychainManager];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(NSMutableArray *)self->_registrationData count];
      unsigned int v6 = [(NSMutableDictionary *)self->_authenticationCerts count];
      *(_DWORD *)buf = 67109376;
      unsigned int v15 = v5;
      __int16 v16 = 1024;
      unsigned int v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forcing save of registration objects from keychain dictionary, %d entries  %d auth certs", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v10 = [(NSMutableArray *)self->_registrationData count];
      id v12 = [(NSMutableDictionary *)self->_authenticationCerts count];
      MarcoLogRegistration();
    }
    [(IDSRegistrationKeychainManager *)self __saveToKeychain];
    uint64_t v7 = +[IMRGLog keychainManager];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(NSMutableArray *)self->_registrationData count];
      unsigned int v9 = [(NSMutableDictionary *)self->_authenticationCerts count];
      *(_DWORD *)buf = 67109376;
      unsigned int v15 = v8;
      __int16 v16 = 1024;
      unsigned int v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Flushing registration objects from keychain dictionary, %d entries  %d auth certs", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v11 = [(NSMutableArray *)self->_registrationData count];
      id v13 = [(NSMutableDictionary *)self->_authenticationCerts count];
      MarcoLogRegistration();
    }
    [(NSMutableArray *)self->_registrationData removeAllObjects];
    [(NSMutableDictionary *)self->_authenticationCerts removeAllObjects];
    [(NSMutableDictionary *)self->_smsSignatures removeAllObjects];
    [(NSMutableDictionary *)self->_tempPhoneCredentials removeAllObjects];
    self->_loaded = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_setPurgeTimer
{
  id v3 = im_primary_queue();
  dispatch_async(v3, self->_purgeEnqueueBlock);
}

- (void)_loadIfNeeded
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_loaded)
  {
    self->_loaded = 1;
    [(IDSRegistrationKeychainManager *)self reloadFromKeychain];
  }
  [(NSRecursiveLock *)self->_lock unlock];

  [(IDSRegistrationKeychainManager *)self _setPurgeTimer];
}

- (void)_reloadFromDictionary:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  unsigned int v5 = [v4 objectForKey:@"data"];
  [(NSMutableArray *)self->_registrationData removeAllObjects];
  [(NSMutableDictionary *)self->_authenticationCerts removeAllObjects];
  id v60 = self;
  authenticationCerts = self->_authenticationCerts;
  if (!authenticationCerts)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    unsigned int v8 = v60->_authenticationCerts;
    v60->_authenticationCerts = (NSMutableDictionary *)Mutable;

    authenticationCerts = v60->_authenticationCerts;
  }
  unsigned int v9 = [v4 objectForKey:@"auth-certs"];
  [(NSMutableDictionary *)authenticationCerts addEntriesFromDictionary:v9];

  id v10 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [(NSMutableDictionary *)v60->_authenticationCerts count];
    id v12 = [(NSMutableDictionary *)v60->_authenticationCerts allKeys];
    *(_DWORD *)buf = 67109378;
    unsigned int v72 = v11;
    __int16 v73 = 2112;
    __int16 v74 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Loaded %d auth certs for users %@", buf, 0x12u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v13 = [(NSMutableDictionary *)v60->_authenticationCerts count];
    [(NSMutableDictionary *)v60->_authenticationCerts allKeys];
    v56 = id v52 = v13;
    MarcoLogRegistration();
  }
  [(NSMutableDictionary *)v60->_smsSignatures removeAllObjects];
  smsSignatures = v60->_smsSignatures;
  if (!smsSignatures)
  {
    CFMutableDictionaryRef v15 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    __int16 v16 = v60->_smsSignatures;
    v60->_smsSignatures = (NSMutableDictionary *)v15;

    smsSignatures = v60->_smsSignatures;
  }
  unsigned int v17 = [v4 objectForKey:@"sms-signatures"];
  [(NSMutableDictionary *)smsSignatures addEntriesFromDictionary:v17];

  BOOL v18 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = [(NSMutableDictionary *)v60->_smsSignatures count];
    *(_DWORD *)buf = 67109120;
    unsigned int v72 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Loaded %d sms signatures", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    id v53 = [(NSMutableDictionary *)v60->_smsSignatures count];
    MarcoLogRegistration();
  }
  [(NSMutableDictionary *)v60->_tempPhoneCredentials removeAllObjects];
  tempPhoneCredentials = v60->_tempPhoneCredentials;
  if (!tempPhoneCredentials)
  {
    CFMutableDictionaryRef v21 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v22 = v60->_tempPhoneCredentials;
    v60->_tempPhoneCredentials = (NSMutableDictionary *)v21;

    tempPhoneCredentials = v60->_tempPhoneCredentials;
  }
  objc_super v23 = [v4 objectForKey:@"temp-phone-creds"];
  [(NSMutableDictionary *)tempPhoneCredentials addEntriesFromDictionary:v23];

  v24 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v25 = [(NSMutableDictionary *)v60->_tempPhoneCredentials count];
    *(_DWORD *)buf = 67109120;
    unsigned int v72 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Loaded %d temp phone credentials", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    id v54 = [(NSMutableDictionary *)v60->_tempPhoneCredentials count];
    MarcoLogRegistration();
  }
  id v26 = objc_msgSend(v5, "count", v54);
  v27 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v72 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Reloading registration objects from keychain dictionary, %d entries", buf, 8u);
  }
  v59 = v4;

  if (os_log_shim_legacy_logging_enabled())
  {
    id v55 = v26;
    MarcoLogRegistration();
  }
  id v58 = v26;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v28 = v5;
  id v29 = [v28 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v66;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v66 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        BOOL v34 = objc_msgSend(v33, "objectForKey:", @"service", v55);
        if ([v34 isEqualToString:@"iMessage"])
        {
        }
        else
        {
          v35 = [v33 objectForKey:@"service"];
          unsigned int v36 = [v35 isEqualToString:@"FaceTime"];

          if (!v36) {
            continue;
          }
        }
        id v37 = [[IDSRegistration alloc] initWithDictionary:v33];
        if (v37)
        {
          v38 = [v33 objectForKey:@"migrated-v0-dictionary"];
          [(IDSRegistration *)v37 setMigrationContext:v38];
          [(NSMutableArray *)v60->_registrationData addObject:v37];
        }
      }
      id v30 = [v28 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v30);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v39 = v28;
  id v40 = [v39 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (!v40) {
    goto LABEL_48;
  }
  id v41 = v40;
  uint64_t v42 = *(void *)v62;
  do
  {
    for (j = 0; j != v41; j = (char *)j + 1)
    {
      if (*(void *)v62 != v42) {
        objc_enumerationMutation(v39);
      }
      v44 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
      objc_msgSend(v44, "objectForKey:", @"service", v55);
      id v45 = (IDSRegistration *)objc_claimAutoreleasedReturnValue();
      if (([(IDSRegistration *)v45 isEqualToString:@"iMessage"] & 1) == 0)
      {
        v46 = [v44 objectForKey:@"service"];
        unsigned __int8 v47 = [v46 isEqualToString:@"FaceTime"];

        if (v47) {
          continue;
        }
        id v45 = [[IDSRegistration alloc] initWithDictionary:v44];
        if (v45)
        {
          id v48 = [v44 objectForKey:@"migrated-v0-dictionary"];
          [(IDSRegistration *)v45 setMigrationContext:v48];
          [(NSMutableArray *)v60->_registrationData addObject:v45];
        }
      }
    }
    id v41 = [v39 countByEnumeratingWithState:&v61 objects:v69 count:16];
  }
  while (v41);
LABEL_48:

  id v49 = [(NSMutableArray *)v60->_registrationData count];
  if (v49 != v58)
  {
    id v50 = v49;
    v51 = +[IMRGLog keychainManager];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v72 = v58;
      __int16 v73 = 1024;
      LODWORD(v74) = v50;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Expected to load %d registration objects, but only loaded %d", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v55 = v58;
      id v57 = v50;
      MarcoLogRegistration();
    }
  }
  [(NSRecursiveLock *)v60->_lock unlock];
}

- (void)reloadFromKeychain
{
  [(NSRecursiveLock *)self->_lock lock];
  unint64_t v3 = 0;
  id v4 = 0;
  unsigned int v39 = 0;
  unsigned int v5 = (char *)IDSKeychainBlobCurrentVersion;
  unint64_t v36 = IDSKeychainBlobCurrentVersion;
  while (1)
  {
    unsigned int v6 = v4;
    uint64_t v7 = [(id)objc_opt_class() keychainServiceForVersion:v5];
    unsigned int v8 = [(id)objc_opt_class() keychainAccountForVersion:v5];
    unsigned int v9 = [(id)objc_opt_class() keychainAccessGroupForVersion:v5];
    id v10 = +[IMRGLog keychainManager];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v41 = v5;
      *(_WORD *)&v41[4] = 2112;
      *(void *)&v41[6] = v7;
      __int16 v42 = 2112;
      v43 = v8;
      __int16 v44 = 2112;
      id v45 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to load V%d keychain blob from service: %@   account: %@   accessGroup: %@", buf, 0x26u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      BOOL v34 = v8;
      v35 = v9;
      uint64_t v31 = (uint64_t)v5;
      v33 = v7;
      MarcoLogRegistration();
    }
    unsigned int v11 = +[IDSDependencyProvider keychainAdapter];
    id v38 = v6;
    unsigned int v12 = [v11 getKeychainData:&v38 service:v7 account:v8 accessGroup:v9 error:&v39];
    id v4 = v38;

    if (v12)
    {
      if (v4)
      {
        CFMutableDictionaryRef v15 = +[IMRGLog keychainManager];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)id v41 = v5;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "  => Found V%d keychain blob", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          uint64_t v31 = (uint64_t)v5;
          MarcoLogRegistration();
        }

        goto LABEL_27;
      }
      goto LABEL_20;
    }
    if (v39 == -25300)
    {
      id v14 = +[IMRGLog keychainManager];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  => No blob found in keychain", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_20;
      }
LABEL_19:
      MarcoLogRegistration();
      goto LABEL_20;
    }
    if (v39) {
      break;
    }
LABEL_20:

    ++v3;
    --v5;
    if (v3 > v36)
    {
      unsigned int v5 = 0;
LABEL_27:
      if (objc_msgSend(v4, "length", v31))
      {
        id v37 = 0;
        uint64_t v7 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v37];
        id v17 = v37;
        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && !v17) {
            goto LABEL_45;
          }
        }
        BOOL v18 = +[IMRGLog keychainManager];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v41 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unable to parse property list: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          unint64_t v32 = (unint64_t)v17;
          MarcoLogRegistration();
        }
        unsigned int v19 = [(id)objc_opt_class() keychainServiceForVersion:v5];
        v20 = [(id)objc_opt_class() keychainAccountForVersion:v5];
        CFMutableDictionaryRef v21 = +[IMRGLog keychainManager];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)id v41 = v5;
          *(_WORD *)&v41[4] = 2112;
          *(void *)&v41[6] = v19;
          __int16 v42 = 2112;
          v43 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Removing invalid keychain data (V%d) for service: %@   account: %@", buf, 0x1Cu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          v33 = v19;
          BOOL v34 = v20;
          unint64_t v32 = (unint64_t)v5;
          MarcoLogRegistration();
        }
        unsigned int v39 = 0;
        v22 = +[IDSDependencyProvider keychainAdapter];
        unsigned __int8 v23 = [v22 removeKeychainDataOnService:v19 account:v20 error:&v39];

        if ((v23 & 1) == 0)
        {
          v24 = +[IMRGLog keychainManager];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)id v41 = v39;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "  => Unable to remove invalid keychain blob (error: %d)", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            unint64_t v32 = v39;
            MarcoLogRegistration();
          }
        }

        if (v7)
        {
LABEL_45:
          unsigned int v25 = objc_msgSend(v7, "objectForKey:", @"version", v32);
          id v26 = v25;
          if (v25) {
            id v27 = [v25 unsignedIntegerValue];
          }
          else {
            id v27 = 0;
          }
          if ((unint64_t)v27 < v36)
          {
            id v28 = +[IMRGLog keychainManager];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)id v41 = v27;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Keychain dictionary V%d needs upgrade", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              unint64_t v32 = (unint64_t)v27;
              MarcoLogRegistration();
            }
            uint64_t v29 = sub_10022E368(v7);

            uint64_t v7 = (void *)v29;
          }
        }
      }
      else
      {
        uint64_t v7 = 0;
      }
      -[IDSRegistrationKeychainManager _reloadFromDictionary:](self, "_reloadFromDictionary:", v7, v32);
      [(NSRecursiveLock *)self->_lock unlock];
      goto LABEL_57;
    }
  }
  if (v39 != -34019)
  {
    id v13 = +[IMRGLog keychainManager];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)id v41 = v39;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "  => Failed to get keychain blob (error: %d)", buf, 8u);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_20;
    }
    uint64_t v31 = v39;
    goto LABEL_19;
  }
  id v30 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "  => Keychain upgrade pending, waiting to load registrations...", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled()) {
    MarcoLogRegistration();
  }
  self->_loaded = 0;

LABEL_57:
}

- (id)registrationWithServiceType:(id)a3 registrationType:(int)a4 value:(id)a5
{
  id v8 = a3;
  id v31 = a5;
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  [(NSRecursiveLock *)self->_lock lock];
  unsigned int v9 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = _StringForIDSRegistrationServiceType();
    unsigned int v11 = _StringForIDSRegistrationType(a4);
    *(_DWORD *)buf = 138412802;
    id v38 = v10;
    __int16 v39 = 2112;
    id v40 = v11;
    __int16 v41 = 2112;
    id v42 = v31;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Looking up registration with service type: %@  registration type: %@   value: %@", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    unsigned int v12 = _StringForIDSRegistrationServiceType();
    id v28 = _StringForIDSRegistrationType(a4);
    id v29 = v31;
    id v27 = v12;
    MarcoLogRegistration();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = self->_registrationData;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v14)
  {
    id v25 = 0;
    goto LABEL_22;
  }
  id v15 = v14;
  id v30 = self;
  uint64_t v16 = *(void *)v33;
  while (2)
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v33 != v16) {
        objc_enumerationMutation(v13);
      }
      BOOL v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      if (objc_msgSend(v18, "registrationType", v27, v28, v29) == a4)
      {
        uint64_t v19 = [v18 serviceType];
        if ((id)v19 == v8)
        {
        }
        else
        {
          v20 = (void *)v19;
          CFMutableDictionaryRef v21 = [v18 serviceType];
          unsigned int v22 = [v21 isEqualToString:v8];

          if (!v22) {
            continue;
          }
        }
        unsigned __int8 v23 = objc_msgSend(v18, "_keychain_comparisonValue");
        unsigned int v24 = [v23 isEqualToString:v31];

        if (v24)
        {
          id v25 = v18;
          goto LABEL_20;
        }
      }
    }
    id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15) {
      continue;
    }
    break;
  }
  id v25 = 0;
LABEL_20:
  self = v30;
LABEL_22:

  [(NSRecursiveLock *)self->_lock unlock];

  return v25;
}

- (NSArray)registrations
{
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  [(NSRecursiveLock *)self->_lock lock];
  registrationData = self->_registrationData;
  if (registrationData) {
    id v4 = [(NSMutableArray *)registrationData copy];
  }
  else {
    id v4 = objc_alloc_init((Class)NSArray);
  }
  unsigned int v5 = v4;
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSArray *)v5;
}

- (BOOL)addRegistration:(id)a3
{
  id v4 = a3;
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  [(NSRecursiveLock *)self->_lock lock];
  if (v4)
  {
    if ((unint64_t)[(NSMutableArray *)self->_registrationData count] >= 0x29)
    {
      unsigned int v5 = +[IMRGLog keychainManager];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v12 = 40;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => Removing first keychain entry, we're over max of %d entries", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        uint64_t v10 = 40;
        MarcoLogRegistration();
      }
      -[NSMutableArray removeObjectAtIndex:](self->_registrationData, "removeObjectAtIndex:", 0, v10);
    }
    if ([(NSMutableArray *)self->_registrationData count])
    {
      uint64_t v6 = 0;
      while (1)
      {
        uint64_t v7 = [(NSMutableArray *)self->_registrationData objectAtIndex:v6];
        if (objc_msgSend(v7, "_keychain_isEqual:", v4)) {
          break;
        }

        if (++v6 >= (unint64_t)[(NSMutableArray *)self->_registrationData count]) {
          goto LABEL_16;
        }
      }
      if (v7)
      {
        [(NSMutableArray *)self->_registrationData removeObjectIdenticalTo:v7];
      }
    }
LABEL_16:
    [(NSMutableArray *)self->_registrationData addObject:v4];
    BOOL v8 = [(IDSRegistrationKeychainManager *)self _saveToKeychain];
  }
  else
  {
    BOOL v8 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v8;
}

- (BOOL)removeRegistration:(id)a3
{
  id v4 = a3;
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  [(NSRecursiveLock *)self->_lock lock];
  unsigned int v5 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing registration : %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    id v11 = v4;
    MarcoLogRegistration();
  }
  if (!v4) {
    goto LABEL_14;
  }
  if (![(NSMutableArray *)self->_registrationData count])
  {
LABEL_10:
    BOOL v8 = +[IMRGLog keychainManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "  => No matching registration found to remove", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled()) {
      MarcoLogRegistration();
    }
LABEL_14:
    BOOL v9 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = -[NSMutableArray objectAtIndex:](self->_registrationData, "objectAtIndex:", v6, v11);
    if (objc_msgSend(v7, "_keychain_isEqual:", v4)) {
      break;
    }

    if (++v6 >= (unint64_t)[(NSMutableArray *)self->_registrationData count]) {
      goto LABEL_10;
    }
  }
  [(NSMutableArray *)self->_registrationData removeObjectAtIndex:v6];

  BOOL v9 = [(IDSRegistrationKeychainManager *)self _saveToKeychain];
LABEL_15:
  [(NSRecursiveLock *)self->_lock unlock];

  return v9;
}

- (BOOL)removeAllRegistrations
{
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  [(NSRecursiveLock *)self->_lock lock];
  unint64_t v3 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing all registrations", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled()) {
    MarcoLogRegistration();
  }
  [(NSMutableArray *)self->_registrationData removeAllObjects];
  BOOL v4 = [(IDSRegistrationKeychainManager *)self __saveToKeychain];
  [(NSRecursiveLock *)self->_lock unlock];
  return v4;
}

- (id)authenticationCertForID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(NSRecursiveLock *)self->_lock lock];
    [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
    unsigned int v5 = [(NSMutableDictionary *)self->_authenticationCerts objectForKey:v4];
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (void)setAuthenticationCert:(id)a3 forID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    BOOL v8 = +[IMRGLog keychainManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting IDS auth cert: %p   for ID: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      id v12 = v6;
      id v13 = v7;
      MarcoLogRegistration();
    }
    [(NSRecursiveLock *)self->_lock lock];
    [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
    if (!self->_authenticationCerts)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      authenticationCerts = self->_authenticationCerts;
      self->_authenticationCerts = Mutable;
    }
    id v11 = self->_authenticationCerts;
    if (v6) {
      [(NSMutableDictionary *)v11 setObject:v6 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)v11 removeObjectForKey:v7];
    }
    [(NSRecursiveLock *)self->_lock unlock];
    [(IDSRegistrationKeychainManager *)self _saveToKeychain];
  }
}

- (id)smsSignatureForID:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  if (v4)
  {
    unsigned int v5 = [(NSMutableDictionary *)self->_smsSignatures objectForKey:v4];
  }
  else
  {
    unsigned int v5 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  id v6 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 description];
    BOOL v8 = IMTruncatedLoggingStringForString();
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Returning SMS sig for ID: %@   signature: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    BOOL v9 = [v5 description];
    id v11 = IMTruncatedLoggingStringForString();
    MarcoLogRegistration();
  }

  return v5;
}

- (id)smsIDs
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  unint64_t v3 = [(NSMutableDictionary *)self->_smsSignatures allKeys];
  [(NSRecursiveLock *)self->_lock unlock];
  id v4 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Returning SMS IDs: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled()) {
    MarcoLogRegistration();
  }

  return v3;
}

- (void)setSMSSignature:(id)a3 mainID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v6 description];
    uint64_t v10 = IMTruncatedLoggingStringForString();
    *(_DWORD *)buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting SMS main ID: %@   signature: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v11 = [v6 description];
    IMTruncatedLoggingStringForString();
    v15 = id v14 = v7;
    MarcoLogRegistration();
  }
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  if (!self->_smsSignatures)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    smsSignatures = self->_smsSignatures;
    self->_smsSignatures = Mutable;
  }
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    [(NSMutableDictionary *)self->_smsSignatures setObject:v6 forKey:v7];
  }
  else if (v7)
  {
    [(NSMutableDictionary *)self->_smsSignatures removeObjectForKey:v7];
  }
  [(NSRecursiveLock *)self->_lock unlock];
  [(IDSRegistrationKeychainManager *)self _saveToKeychain];
}

- (id)tempPhoneCredentialForID:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  if (v4)
  {
    unsigned int v5 = [(NSMutableDictionary *)self->_tempPhoneCredentials objectForKeyedSubscript:v4];
  }
  else
  {
    unsigned int v5 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  id v6 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Returning temp phone credential for ID: %@ cert: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled()) {
    MarcoLogRegistration();
  }

  return v5;
}

- (void)setTempPhoneCredential:(id)a3 forID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[IMRGLog keychainManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Returning temp phone credential for ID: %@ tempCredential: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    id v13 = v7;
    id v14 = v6;
    MarcoLogRegistration();
  }
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeychainManager *)self _loadIfNeeded];
  if (!self->_tempPhoneCredentials)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    tempPhoneCredentials = self->_tempPhoneCredentials;
    self->_tempPhoneCredentials = Mutable;
  }
  if ([v7 length])
  {
    id v11 = self->_tempPhoneCredentials;
    id v12 = v6;
LABEL_11:
    [(NSMutableDictionary *)v11 setObject:v12 forKeyedSubscript:v7];
    goto LABEL_12;
  }
  if (v7)
  {
    id v11 = self->_tempPhoneCredentials;
    id v12 = 0;
    goto LABEL_11;
  }
LABEL_12:
  [(NSRecursiveLock *)self->_lock unlock];
  [(IDSRegistrationKeychainManager *)self _saveToKeychain];
}

- (OS_dispatch_queue)saveQueue
{
  return self->_saveQueue;
}

- (void)setSaveQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong(&self->_purgeEnqueueBlock, 0);
  objc_storeStrong(&self->_purgeCancelBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_purgeTimer, 0);
  objc_storeStrong((id *)&self->_registrationData, 0);
  objc_storeStrong((id *)&self->_authenticationCerts, 0);
  objc_storeStrong((id *)&self->_smsSignatures, 0);

  objc_storeStrong((id *)&self->_tempPhoneCredentials, 0);
}

@end