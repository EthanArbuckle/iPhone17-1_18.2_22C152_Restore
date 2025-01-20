@interface AKAuthorizationIconManager
+ (id)sharedManager;
- (AKAuthorizationIconManager)init;
- (BOOL)_isFetchingIconWithRequestContext:(id)a3;
- (id)_dataBlockForKey:(id)a3;
- (id)_serviceIDForRequestContext:(id)a3;
- (id)_startFetchingIconForBundleID:(id)a3 size:(id)a4 scale:(id)a5;
- (void)_removeDataBlockForKey:(id)a3;
- (void)_setDataBlock:(id)a3 forKey:(id)a4;
- (void)continueFetchingIconWithRequestContext:(id)a3 completion:(id)a4;
- (void)setFetchIconBlockForPresenter:(id)a3 withContext:(id)a4;
- (void)startFetchingIconWithRequestContext:(id)a3;
@end

@implementation AKAuthorizationIconManager

- (AKAuthorizationIconManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKAuthorizationIconManager;
  result = [(AKAuthorizationIconManager *)&v3 init];
  if (result) {
    result->_dataBlocksLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)sharedManager
{
  if (qword_100272208 != -1) {
    dispatch_once(&qword_100272208, &stru_100226AE8);
  }
  v2 = (void *)qword_100272200;

  return v2;
}

- (void)startFetchingIconWithRequestContext:(id)a3
{
  id v4 = a3;
  v5 = [(AKAuthorizationIconManager *)self _serviceIDForRequestContext:v4];
  v6 = [v4 _proxiedClientBundleID];
  uint64_t v7 = [v4 _iconScale];
  v8 = (void *)v7;
  v9 = &off_10023AF08;
  if (v7) {
    v9 = (_UNKNOWN **)v7;
  }
  v23 = v9;

  v10 = [v4 _iconSize];
  if (v5) {
    BOOL v11 = v6 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  v13 = [v4 _iconData];

  if ([v4 _isWebLogin]) {
    unsigned int v14 = 1;
  }
  else {
    unsigned int v14 = [v4 _isSubscriptionLogin];
  }
  if (v13) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = v14;
  }
  int v16 = v15 & v12;
  v17 = _AKLogSystem();
  v18 = v17;
  if (v16 == 1)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = self;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Starting to fetch icon for request context (%@)", buf, 0x16u);
    }

    v19 = v23;
    v18 = [(AKAuthorizationIconManager *)self _startFetchingIconForBundleID:v6 size:v10 scale:v23];
    [(AKAuthorizationIconManager *)self _setDataBlock:v18 forKey:v5];
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v20 = @"NO";
      *(_DWORD *)buf = 138413314;
      v25 = self;
      if (v12) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      __int16 v26 = 2112;
      id v27 = v4;
      if (v13) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      __int16 v28 = 2112;
      if (v14) {
        CFStringRef v20 = @"YES";
      }
      CFStringRef v29 = v21;
      __int16 v30 = 2112;
      CFStringRef v31 = v22;
      __int16 v32 = 2112;
      CFStringRef v33 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@: Determined request context (%@) is not eligible for remotely fetching icon (hasParameters: %@, hasData: %@, hasFetchContext: %@)", buf, 0x34u);
    }
    v19 = v23;
  }
}

- (void)setFetchIconBlockForPresenter:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 credentialRequestContext];
  unsigned int v9 = [(AKAuthorizationIconManager *)self _isFetchingIconWithRequestContext:v8];

  if (v9)
  {
    v10 = [v7 credentialRequestContext];
    BOOL v11 = [(AKAuthorizationIconManager *)self _serviceIDForRequestContext:v10];

    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100010CF8;
    v13[3] = &unk_100226B38;
    objc_copyWeak(&v15, &location);
    id v12 = v11;
    id v14 = v12;
    [v6 setFetchIconBlock:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)continueFetchingIconWithRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, NSObject *))a4;
  if ([(AKAuthorizationIconManager *)self _isFetchingIconWithRequestContext:v6])
  {
    v8 = _os_activity_create((void *)&_mh_execute_header, "authkit/icon-fetching", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v8, &v11);
    unsigned int v9 = [(AKAuthorizationIconManager *)self _serviceIDForRequestContext:v6];
    v10 = [(AKAuthorizationIconManager *)self _dataBlockForKey:v9];
    [v10 setCompletion:v7];

    os_activity_scope_leave(&v11);
  }
  else
  {
    v8 = +[NSError ak_errorWithCode:-7044];
    v7[2](v7, 0, v8);
  }
}

- (id)_startFetchingIconForBundleID:(id)a3 size:(id)a4 scale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = _os_activity_create((void *)&_mh_execute_header, "authkit/icon-fetching", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100011134;
  v16[3] = &unk_100226B88;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = +[AKCoordinatedDataBlock startCoordinatingBlock:v16];

  os_activity_scope_leave(&state);

  return v14;
}

- (BOOL)_isFetchingIconWithRequestContext:(id)a3
{
  id v4 = [(AKAuthorizationIconManager *)self _serviceIDForRequestContext:a3];
  if (v4)
  {
    v5 = [(AKAuthorizationIconManager *)self _dataBlockForKey:v4];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_serviceIDForRequestContext:(id)a3
{
  id v3 = a3;
  if ([v3 _isSubscriptionLogin])
  {
    id v4 = [v3 _proxiedClientBundleID];
  }
  else
  {
    v5 = [v3 authorizationRequest];

    id v4 = [v5 clientID];
    id v3 = v5;
  }

  return v4;
}

- (id)_dataBlockForKey:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001146C;
  v7[3] = &unk_100226BB0;
  p_dataBlocksLock = &self->_dataBlocksLock;
  v7[4] = self;
  id v8 = a3;
  id v4 = v8;
  os_unfair_lock_lock(p_dataBlocksLock);
  v5 = sub_10001146C((uint64_t)v7);
  os_unfair_lock_unlock(p_dataBlocksLock);

  return v5;
}

- (void)_setDataBlock:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001154C;
  v11[3] = &unk_100226BD8;
  p_dataBlocksLock = &self->_dataBlocksLock;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  os_unfair_lock_lock(p_dataBlocksLock);
  sub_10001154C(v11);
  os_unfair_lock_unlock(p_dataBlocksLock);
}

- (void)_removeDataBlockForKey:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011664;
  v5[3] = &unk_100226C00;
  p_dataBlocksLock = &self->_dataBlocksLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_dataBlocksLock);
  sub_100011664((uint64_t)v5);
  os_unfair_lock_unlock(p_dataBlocksLock);
}

- (void).cxx_destruct
{
}

@end