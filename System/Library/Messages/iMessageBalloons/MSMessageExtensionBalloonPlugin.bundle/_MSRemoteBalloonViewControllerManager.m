@interface _MSRemoteBalloonViewControllerManager
+ (id)sharedInstance;
+ (id)viewControllerKeyForMessageIdentifier:(id)a3 contextIdentifier:(id)a4;
- (_MSRemoteBalloonViewControllerManager)init;
- (id)remoteViewControllerIdentifiersLRU;
- (id)remoteViewControllersByMessageGUID;
- (void)getRemoteViewControllerForExtension:(id)a3 messageIdentifier:(id)a4 contextIdentifier:(id)a5 item:(id)a6 connectionHandler:(id)a7;
- (void)removeShelfBalloonViewController;
- (void)removeViewControllerWithIdentifier:(id)a3;
@end

@implementation _MSRemoteBalloonViewControllerManager

+ (id)sharedInstance
{
  if (qword_46F28 != -1) {
    dispatch_once(&qword_46F28, &stru_3D268);
  }
  v2 = (void *)qword_46F20;

  return v2;
}

- (_MSRemoteBalloonViewControllerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_MSRemoteBalloonViewControllerManager;
  v2 = [(_MSRemoteBalloonViewControllerManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    remoteViewControllersByMessageGUID = v2->_remoteViewControllersByMessageGUID;
    v2->_remoteViewControllersByMessageGUID = (NSMutableDictionary *)v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    remoteViewControllerIdentifiersLRU = v2->_remoteViewControllerIdentifiersLRU;
    v2->_remoteViewControllerIdentifiersLRU = v5;
  }
  return v2;
}

- (void)removeViewControllerWithIdentifier:(id)a3
{
  remoteViewControllerIdentifiersLRU = self->_remoteViewControllerIdentifiersLRU;
  id v5 = a3;
  [(NSMutableOrderedSet *)remoteViewControllerIdentifiersLRU removeObject:v5];
  [(NSMutableDictionary *)self->_remoteViewControllersByMessageGUID removeObjectForKey:v5];
}

- (void)removeShelfBalloonViewController
{
  [(NSMutableOrderedSet *)self->_remoteViewControllerIdentifiersLRU removeObject:@"_MSRemoteBalloonViewControllerShelfIdentifier"];
  remoteViewControllersByMessageGUID = self->_remoteViewControllersByMessageGUID;

  [(NSMutableDictionary *)remoteViewControllersByMessageGUID removeObjectForKey:@"_MSRemoteBalloonViewControllerShelfIdentifier"];
}

- (id)remoteViewControllersByMessageGUID
{
  return self->_remoteViewControllersByMessageGUID;
}

- (id)remoteViewControllerIdentifiersLRU
{
  return self->_remoteViewControllerIdentifiersLRU;
}

+ (id)viewControllerKeyForMessageIdentifier:(id)a3 contextIdentifier:(id)a4
{
  return +[NSString stringWithFormat:@"%@-%@", a3, a4];
}

- (void)getRemoteViewControllerForExtension:(id)a3 messageIdentifier:(id)a4 contextIdentifier:(id)a5 item:(id)a6 connectionHandler:(id)a7
{
  id val = a3;
  id v12 = a4;
  id v13 = a5;
  id v40 = a6;
  id v41 = a7;
  v38 = v13;
  v39 = v12;
  v44 = +[_MSRemoteBalloonViewControllerManager viewControllerKeyForMessageIdentifier:v12 contextIdentifier:v13];
  uint64_t v43 = [(NSMutableDictionary *)self->_remoteViewControllersByMessageGUID objectForKeyedSubscript:v44];
  if (!val || v43)
  {
    objc_opt_class();
    v35 = (void *)v43;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      (*((void (**)(id, void, uint64_t, void))v41 + 2))(v41, 0, v43, 0);
      goto LABEL_30;
    }
    v36 = ms_defaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v57 = v43;
      __int16 v58 = 2112;
      v59 = v44;
      __int16 v60 = 2112;
      id v61 = val;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "LiveBubble Not fetching remoteViewController. cached viewController %@, GUID: %@, extension: %@", buf, 0x20u);
    }
  }
  else
  {
    unsigned __int8 v14 = [v12 isEqualToString:@"_MSRemoteBalloonViewControllerShelfIdentifier"];
    if ((v14 & 1) == 0)
    {
      v15 = +[NSNull null];
      [(NSMutableDictionary *)self->_remoteViewControllersByMessageGUID setObject:v15 forKeyedSubscript:v44];
    }
    id location = 0;
    objc_initWeak(&location, val);
    id v63 = v40;
    v16 = +[NSArray arrayWithObjects:&v63 count:1];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_19950;
    v50[3] = &unk_3D2B8;
    v50[4] = self;
    id v37 = v44;
    id v51 = v37;
    objc_copyWeak(&v53, &location);
    char v54 = v14 ^ 1;
    id v52 = v41;
    [val instantiateViewControllerWithInputItems:v16 connectionHandler:v50];

    if ((v14 & 1) == 0)
    {
      [(NSMutableOrderedSet *)self->_remoteViewControllerIdentifiersLRU removeObject:v37];
      [(NSMutableOrderedSet *)self->_remoteViewControllerIdentifiersLRU addObject:v37];
      v17 = +[CKUIBehavior sharedBehaviors];
      v18 = [v17 maxNumExtensionRemoteViewControllers];

      v19 = [(NSMutableOrderedSet *)self->_remoteViewControllerIdentifiersLRU count];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v20 = [(NSMutableOrderedSet *)self->_remoteViewControllerIdentifiersLRU copy];
      id v21 = [v20 countByEnumeratingWithState:&v46 objects:v62 count:16];
      id obj = v20;
      if (v21)
      {
        uint64_t v22 = v19 - v18;
        uint64_t v23 = *(void *)v47;
LABEL_8:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(obj);
          }
          if (v22 < 1) {
            break;
          }
          v25 = *(void **)(*((void *)&v46 + 1) + 8 * v24);
          v26 = [(NSMutableDictionary *)self->_remoteViewControllersByMessageGUID objectForKeyedSubscript:v25];
          v27 = +[NSNull null];
          unsigned __int8 v28 = [v26 isEqual:v27];

          if ((v28 & 1) == 0)
          {
            v29 = [v26 view];
            v30 = [v29 superview];
            BOOL v31 = v30 == 0;

            if (v31 && ([v25 isEqualToString:v37] & 1) == 0)
            {
              [(NSMutableDictionary *)self->_remoteViewControllersByMessageGUID removeObjectForKey:v25];
              [(NSMutableOrderedSet *)self->_remoteViewControllerIdentifiersLRU removeObject:v25];
              v32 = ms_defaultLog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v57 = (uint64_t)v25;
                _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "LiveBubble. Evicted remoteViewController with messageGUID: %@", buf, 0xCu);
              }

              --v22;
            }
          }

          if (v21 == (id)++v24)
          {
            id v21 = [obj countByEnumeratingWithState:&v46 objects:v62 count:16];
            if (v21) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      v33 = ms_defaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        remoteViewControllerIdentifiersLRU = self->_remoteViewControllerIdentifiersLRU;
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = (uint64_t)remoteViewControllerIdentifiersLRU;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "LiveBubble. _remoteViewControllerIdentifiersLRU after update: %@", buf, 0xCu);
      }
    }
    objc_destroyWeak(&v53);

    objc_destroyWeak(&location);
  }
  v35 = (void *)v43;
LABEL_30:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewControllerIdentifiersLRU, 0);

  objc_storeStrong((id *)&self->_remoteViewControllersByMessageGUID, 0);
}

@end