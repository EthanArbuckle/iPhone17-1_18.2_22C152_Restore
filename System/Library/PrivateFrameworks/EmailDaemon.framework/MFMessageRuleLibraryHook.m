@interface MFMessageRuleLibraryHook
+ (id)log;
- (EDMessageChangeManager)messageChangeManager;
- (MFMessageActionHandler)messageActionHandler;
- (MFMessageRuleLibraryHook)initWithMessageChangeManager:(id)a3;
- (NSArray)rules;
- (void)_loadRules;
- (void)_subscribeNotification;
- (void)dealloc;
- (void)executeRulesOnMessages:(id)a3;
- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4;
- (void)setMessageActionHandler:(id)a3;
- (void)setMessageChangeManager:(id)a3;
- (void)setRules:(id)a3;
@end

@implementation MFMessageRuleLibraryHook

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DB6C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BC10 != -1) {
    dispatch_once(&qword_10016BC10, block);
  }
  v2 = (void *)qword_10016BC08;

  return v2;
}

- (MFMessageRuleLibraryHook)initWithMessageChangeManager:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MFMessageRuleLibraryHook.m", 43, @"Invalid parameter not satisfying: %@", @"messageChangeManager" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)MFMessageRuleLibraryHook;
  v7 = [(MFMessageRuleLibraryHook *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_messageChangeManager, a3);
    [(MFMessageRuleLibraryHook *)v8 _loadRules];
    [(MFMessageRuleLibraryHook *)v8 _subscribeNotification];
  }

  return v8;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, EMUserDefaultMutedThreadActionDidChangeNotification, 0);
  v4.receiver = self;
  v4.super_class = (Class)MFMessageRuleLibraryHook;
  [(MFMessageRuleLibraryHook *)&v4 dealloc];
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  id v10 = a3;
  if ([v10 count])
  {
    id v6 = [v10 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v8 = +[NSAssertionHandler currentHandler];
      v9 = [v10 firstObject];
      [v8 handleFailureInMethod:a2, self, @"MFMessageRuleLibraryHook.m", 66, @"%@ must be a MFLibraryMessage", objc_opt_class() object file lineNumber description];
    }
    [(MFMessageRuleLibraryHook *)self executeRulesOnMessages:v10];
  }
}

- (void)executeRulesOnMessages:(id)a3
{
  id v31 = a3;
  os_unfair_lock_lock(&self->_lock);
  v26 = [(MFMessageRuleLibraryHook *)self rules];
  os_unfair_lock_unlock(&self->_lock);
  if (_os_feature_enabled_impl())
  {
    id v32 = [(MFMessageRuleLibraryHook *)self messageActionHandler];
    objc_super v4 = [(MFMessageRuleLibraryHook *)self messageActionHandler];
    v25 = [v4 messageActionProviderIDs];

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    v24 = self;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v25;
    id v29 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v45;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v7 = v31;
          id v8 = [v7 countByEnumeratingWithState:&v40 objects:v54 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v41;
            do
            {
              for (j = 0; j != v8; j = (char *)j + 1)
              {
                if (*(void *)v41 != v9) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
                v12 = objc_msgSend(v32, "ruleForMessage:usingMessageActionProvider:", v11, v6, v24);
                if (v12)
                {
                  v13 = [v5 objectForKeyedSubscript:v12];

                  if (v13)
                  {
                    v14 = [v5 objectForKeyedSubscript:v12];
                    [v14 addObject:v11];
                  }
                  else
                  {
                    id v15 = objc_alloc((Class)NSMutableArray);
                    uint64_t v53 = v11;
                    v14 = +[NSArray arrayWithObjects:&v53 count:1];
                    id v16 = [v15 initWithArray:v14];
                    [v5 setObject:v16 forKeyedSubscript:v12];
                  }
                }
              }
              id v8 = [v7 countByEnumeratingWithState:&v40 objects:v54 count:16];
            }
            while (v8);
          }
        }
        id v29 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v29);
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10007E49C;
    v39[3] = &unk_10013CDF8;
    v39[4] = v24;
    [v5 enumerateKeysAndObjectsUsingBlock:v39];

    self = v24;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v33 = v26;
  id v17 = [v33 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v36;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v33);
        }
        v20 = *(void **)(*((void *)&v35 + 1) + 8 * (void)k);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10007E540;
        v34[3] = &unk_10013C598;
        v34[4] = v20;
        v21 = objc_msgSend(v31, "ef_filter:", v34, v24);
        if ([v21 count])
        {
          v22 = +[MFMessageRuleLibraryHook log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v49 = v20;
            __int16 v50 = 2112;
            v51 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Apply rule:%@ to messages: %@", buf, 0x16u);
          }

          v23 = [(MFMessageRuleLibraryHook *)self messageChangeManager];
          [v20 performOperationOnMessages:v21 withMessageChangeManager:v23];
        }
      }
      id v17 = [v33 countByEnumeratingWithState:&v35 objects:v52 count:16];
    }
    while (v17);
  }
}

- (void)_loadRules
{
  v3 = objc_alloc_init(MFBlockedSenderMessageRule);
  BOOL v4 = sub_1000BC1BC(0);
  id v5 = &off_100139398;
  if (!v4) {
    id v5 = &off_100139480;
  }
  id v6 = objc_alloc_init(*v5);
  os_unfair_lock_lock(&self->_lock);
  if (_os_feature_enabled_impl())
  {
    id v7 = objc_alloc((Class)EDMessageActionHandler);
    id v8 = +[MEAppExtensionsController sharedInstance];
    id v9 = [v7 initWithExtensionsController:v8];

    id v10 = [[MFMessageActionHandler alloc] initWithActionHandler:v9];
    [(MFMessageRuleLibraryHook *)self setMessageActionHandler:v10];
  }
  v12[0] = v3;
  v12[1] = v6;
  uint64_t v11 = +[NSArray arrayWithObjects:v12 count:2];
  [(MFMessageRuleLibraryHook *)self setRules:v11];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_subscribeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)EMUserDefaultMutedThreadActionDidChangeNotification;

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10007E768, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (NSArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
}

- (EDMessageChangeManager)messageChangeManager
{
  return self->_messageChangeManager;
}

- (void)setMessageChangeManager:(id)a3
{
}

- (MFMessageActionHandler)messageActionHandler
{
  return self->_messageActionHandler;
}

- (void)setMessageActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageActionHandler, 0);
  objc_storeStrong((id *)&self->_messageChangeManager, 0);

  objc_storeStrong((id *)&self->_rules, 0);
}

@end