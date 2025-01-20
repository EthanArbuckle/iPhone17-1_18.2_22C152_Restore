@interface IXSAppDeletionEligibilityManager
+ (id)sharedInstance;
- (IXSAppDeletionEligibilityManager)init;
- (NSMutableDictionary)domainToEligibilityAnswerMap;
- (OS_dispatch_queue)internalQueue;
- (id)_domainToAppIdentitySetMap;
- (id)_systemAppPlaceholderEnumerator;
- (id)_testAppRemovabilityBundleID;
- (id)_test_domainToEligibilityAnswerMap;
- (unint64_t)_eligibilityAnswerForDomain:(unint64_t)a3;
- (void)_onQueue_enumerateSystemAppPlaceholdersAndSetAppRemovability:(id)a3;
- (void)_onQueue_processEligibilityDomainChange;
- (void)_onQueue_setAppRemovabilityForSystemAppPlaceholder:(id)a3;
- (void)_onQueue_setRemovabilityForAppWithIdentity:(id)a3 usingEligibilityAnswer:(unint64_t)a4;
- (void)_onQueue_updateRemovabilityForAppIdentities:(id)a3 usingEligibilityAnswer:(unint64_t)a4;
- (void)_test_modifyDomainToEligibilityAnswerMap:(id)a3;
- (void)eligibilityDidChange;
- (void)reconcileAppRemovabilityForSystemAppPlaceholders;
- (void)setDomainToEligibilityAnswerMap:(id)a3;
@end

@implementation IXSAppDeletionEligibilityManager

- (IXSAppDeletionEligibilityManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)IXSAppDeletionEligibilityManager;
  v2 = [(IXSAppDeletionEligibilityManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.installcoordination.AppDeletionEligibilityManager.internal", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    domainToEligibilityAnswerMap = v2->_domainToEligibilityAnswerMap;
    v2->_domainToEligibilityAnswerMap = (NSMutableDictionary *)v6;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AF04;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109DB0 != -1) {
    dispatch_once(&qword_100109DB0, block);
  }
  v2 = (void *)qword_100109DA8;

  return v2;
}

- (void)_onQueue_setRemovabilityForAppWithIdentity:(id)a3 usingEligibilityAnswer:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(IXSAppDeletionEligibilityManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  if (a4 == 4) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = 3;
  }
  objc_super v9 = IXStringForAppRemovability(v8);
  v10 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[IXSAppDeletionEligibilityManager _onQueue_setRemovabilityForAppWithIdentity:usingEligibilityAnswer:]";
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Setting IXAppRemovability to %@ for %@", buf, 0x20u);
  }

  v11 = +[IXSAppRemovabilityManager sharedInstance];
  id v15 = 0;
  unsigned __int8 v12 = [v11 setRemovability:v8 forAppWithIdentity:v6 byClient:4 error:&v15];
  id v13 = v15;

  if ((v12 & 1) == 0)
  {
    v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[IXSAppDeletionEligibilityManager _onQueue_setRemovabilityForAppWithIdentity:usingEligibilityAnswer:]";
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Unable to set IXAppRemovability for %@ to %@: %@", buf, 0x2Au);
    }
  }
}

- (void)_onQueue_updateRemovabilityForAppIdentities:(id)a3 usingEligibilityAnswer:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(IXSAppDeletionEligibilityManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B1D4;
  v8[3] = &unk_1000E9058;
  v8[4] = self;
  v8[5] = a4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (unint64_t)_eligibilityAnswerForDomain:(unint64_t)a3
{
  int domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    int v5 = domain_answer;
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10008BB60(v5, a3, v6);
    }
  }
  return 0;
}

- (id)_domainToAppIdentitySetMap
{
  v3 = objc_opt_new();
  dispatch_queue_t v4 = [(IXSAppDeletionEligibilityManager *)self _systemAppPlaceholderEnumerator];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v21;
    *(void *)&long long v6 = 136315650;
    long long v18 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "eligibilityDeletionDomain", v18);
        if (v11)
        {
          unsigned __int8 v12 = [v10 bundleIdentifier];
          id v13 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v12];
          id v19 = 0;
          unsigned __int8 v14 = [(IXApplicationIdentity *)v13 resolvePersonaWithError:&v19];
          id v15 = v19;
          if (v14)
          {
            v16 = [v3 objectForKeyedSubscript:v11];
            if (!v16) {
              v16 = objc_opt_new();
            }
            [v16 addObject:v13];
            [v3 setObject:v16 forKeyedSubscript:v11];
          }
          else
          {
            v16 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              v25 = "-[IXSAppDeletionEligibilityManager _domainToAppIdentitySetMap]";
              __int16 v26 = 2112;
              v27 = v12;
              __int16 v28 = 2112;
              id v29 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to resolve persona for %@ : %@. Skipping without setting conditional removability", buf, 0x20u);
            }
          }
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_onQueue_processEligibilityDomainChange
{
  v3 = [(IXSAppDeletionEligibilityManager *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  dispatch_queue_t v4 = [(IXSAppDeletionEligibilityManager *)self _domainToAppIdentitySetMap];
  id v5 = [(IXSAppDeletionEligibilityManager *)self domainToEligibilityAnswerMap];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B820;
  v9[3] = &unk_1000E9080;
  v9[4] = self;
  v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  if (*((unsigned char *)v13 + 24))
  {
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(IXSAppDeletionEligibilityManager *)self domainToEligibilityAnswerMap];
      *(_DWORD *)buf = 136315394;
      v17 = "-[IXSAppDeletionEligibilityManager _onQueue_processEligibilityDomainChange]";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Processed eligibility change : %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v12, 8);
}

- (void)eligibilityDidChange
{
  v3 = [(IXSAppDeletionEligibilityManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B9D0;
  block[3] = &unk_1000E8FA8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onQueue_setAppRemovabilityForSystemAppPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSAppDeletionEligibilityManager *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 bundleIdentifier];
  id v7 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v6];
  id v17 = 0;
  unsigned __int8 v8 = [(IXApplicationIdentity *)v7 resolvePersonaWithError:&v17];
  id v9 = v17;
  if (v8)
  {
    id v10 = [v4 eligibilityDeletionDomain];
    v11 = v10;
    if (v10)
    {
      unint64_t v12 = -[IXSAppDeletionEligibilityManager _eligibilityAnswerForDomain:](self, "_eligibilityAnswerForDomain:", [v10 longLongValue]);
      if (v12)
      {
        unint64_t v13 = v12;
        uint64_t v14 = +[NSNumber numberWithLongLong:v12];
        char v15 = [(IXSAppDeletionEligibilityManager *)self domainToEligibilityAnswerMap];
        [v15 setObject:v14 forKeyedSubscript:v11];

        [(IXSAppDeletionEligibilityManager *)self _onQueue_setRemovabilityForAppWithIdentity:v7 usingEligibilityAnswer:v13];
      }
    }
  }
  else
  {
    v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10008BC10((uint64_t)v6, (uint64_t)v9, v16);
    }

    v11 = 0;
  }
}

- (void)_onQueue_enumerateSystemAppPlaceholdersAndSetAppRemovability:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSAppDeletionEligibilityManager *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[IXSAppDeletionEligibilityManager _onQueue_setAppRemovabilityForSystemAppPlaceholder:](self, "_onQueue_setAppRemovabilityForSystemAppPlaceholder:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_systemAppPlaceholderEnumerator
{
  return +[LSApplicationRecord systemPlaceholderEnumerator];
}

- (void)reconcileAppRemovabilityForSystemAppPlaceholders
{
  v3 = [(IXSAppDeletionEligibilityManager *)self _systemAppPlaceholderEnumerator];
  id v4 = [(IXSAppDeletionEligibilityManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000BD34;
  v6[3] = &unk_1000E8E08;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, v6);
}

- (id)_test_domainToEligibilityAnswerMap
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000BE5C;
  long long v11 = sub_10000BE6C;
  id v12 = 0;
  v3 = [(IXSAppDeletionEligibilityManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000BE74;
  v6[3] = &unk_1000E90A8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_testAppRemovabilityBundleID
{
  return 0;
}

- (void)_test_modifyDomainToEligibilityAnswerMap:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSAppDeletionEligibilityManager *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BF94;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)domainToEligibilityAnswerMap
{
  return self->_domainToEligibilityAnswerMap;
}

- (void)setDomainToEligibilityAnswerMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainToEligibilityAnswerMap, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end