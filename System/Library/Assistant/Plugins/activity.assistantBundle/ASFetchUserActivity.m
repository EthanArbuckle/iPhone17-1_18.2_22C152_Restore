@interface ASFetchUserActivity
- (ASFetchUserActivity)fetchUserActivityWithCompletion:(id)a3;
- (void)_fetchUserActivityForUUID:(id)a3 withCompletion:(id)a4;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASFetchUserActivity

- (void)performWithCompletion:(id)a3
{
}

- (ASFetchUserActivity)fetchUserActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ASFetchUserActivity *)self internalGUID];
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = objc_alloc((Class)NSUUID);
    v8 = [(ASFetchUserActivity *)self internalGUID];
    id v9 = [v7 initWithUUIDString:v8];

    [(ASFetchUserActivity *)self _fetchUserActivityForUUID:v9 withCompletion:v4];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_60EC;
    v11[3] = &unk_C528;
    v11[4] = self;
    id v12 = v4;
    +[NSUserActivity _currentUserActivityUUIDWithOptions:0 completionHandler:v11];
  }
  return result;
}

- (void)_fetchUserActivityForUUID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (!a3)
  {
    v8 = +[NSString stringWithFormat:@"Invalid ace command %@, no user activity found", self];
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      sub_78C0();
      if (!v7) {
        goto LABEL_6;
      }
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    id v9 = [objc_alloc((Class)SACommandFailed) initWithReason:v8];
    v10 = [v9 dictionary];
    ((void (**)(void, void *))v7)[2](v7, v10);

    goto LABEL_6;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_63AC;
  v11[3] = &unk_C550;
  id v12 = v6;
  +[NSUserActivity _fetchUserActivityWithUUID:a3 completionHandler:v11];
  v8 = v12;
LABEL_6:
}

@end