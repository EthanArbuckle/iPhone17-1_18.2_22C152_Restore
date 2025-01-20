@interface IDSDGroupContextController
+ (id)sharedInstance;
- (CUTPromiseSeal)seal;
- (ENGroupContext)messagesGroupContext;
- (IDSDGroupContextController)init;
- (id)registrationCenter;
- (void)_messagesGroupContextWithCompletion:(id)a3;
- (void)centerUpdatedRegistrationIdentities:(id)a3;
- (void)dealloc;
- (void)deleteAllCachedValuesForGroupWithID:(id)a3 WithCompletion:(id)a4;
- (void)deleteAllKnownGroupsWithCompletion:(id)a3;
- (void)fetchAllKnownGroups:(id)a3;
- (void)fetchGroupWithID:(id)a3 completion:(id)a4;
- (void)groupContextForProtectionSpace:(int64_t)a3 withCompletion:(id)a4;
- (void)groupFromPublicDataRepresentation:(id)a3 completion:(id)a4;
- (void)latestCachedGroupWithStableID:(id)a3 completion:(id)a4;
- (void)participantsForCypher:(id)a3 completion:(id)a4;
- (void)publicDataRepresentationForGroup:(id)a3 completion:(id)a4;
- (void)qGroupContextWithDeviceIdentity:(id)a3 completion:(id)a4;
- (void)qSetupSeal;
- (void)setMessagesGroupContext:(id)a3;
- (void)setSeal:(id)a3;
- (void)upsertGroupWithInfo:(id)a3 previousGroup:(id)a4 completion:(id)a5;
- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5;
@end

@implementation IDSDGroupContextController

+ (id)sharedInstance
{
  if (qword_100A4C6F8 != -1) {
    dispatch_once(&qword_100A4C6F8, &stru_100988480);
  }
  v2 = (void *)qword_100A4C700;

  return v2;
}

- (IDSDGroupContextController)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSDGroupContextController;
  v2 = [(IDSDGroupContextController *)&v7 init];
  if (v2)
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Group context controller starting up", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v4 = [(IDSDGroupContextController *)v2 registrationCenter];
    [v4 addListener:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(IDSDGroupContextController *)self registrationCenter];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IDSDGroupContextController;
  [(IDSDGroupContextController *)&v4 dealloc];
}

- (id)registrationCenter
{
  return +[IDSRegistrationCenter sharedInstance];
}

- (void)groupContextForProtectionSpace:(int64_t)a3 withCompletion:(id)a4
{
  id v5 = a4;
  v6 = [(IDSDGroupContextController *)self seal];

  if (!v6) {
    [(IDSDGroupContextController *)self qSetupSeal];
  }
  objc_super v7 = [(IDSDGroupContextController *)self seal];
  v8 = [v7 promise];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002F19B8;
  v10[3] = &unk_100980C70;
  id v11 = v5;
  id v9 = v5;
  [v8 registerResultBlock:v10];
}

- (void)upsertGroupWithInfo:(id)a3 previousGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Incoming Daemon UpsertGroup", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002F1D24;
  v15[3] = &unk_1009884A8;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:v15];
}

- (void)fetchGroupWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Incoming Daemon FetchGroup {groupID: %{public}@}", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002F24C0;
  v11[3] = &unk_1009884D0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:v11];
}

- (void)publicDataRepresentationForGroup:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002F2764;
  v8[3] = &unk_1009884D0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:v8];
}

- (void)groupFromPublicDataRepresentation:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002F2A08;
  v8[3] = &unk_1009884D0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:v8];
}

- (void)participantsForCypher:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002F2C98;
  v8[3] = &unk_1009884D0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:v8];
}

- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002F2F4C;
  v11[3] = &unk_1009884A8;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:v11];
}

- (void)latestCachedGroupWithStableID:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002F31E0;
  v8[3] = &unk_1009884D0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(IDSDGroupContextController *)self _messagesGroupContextWithCompletion:v8];
}

- (void)fetchAllKnownGroups:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002F3344;
  v5[3] = &unk_100988570;
  id v6 = a3;
  id v4 = v6;
  [(IDSDGroupContextController *)self _messagesGroupContextWithCompletion:v5];
}

- (void)deleteAllKnownGroupsWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002F3534;
  v5[3] = &unk_100988570;
  id v6 = a3;
  id v4 = v6;
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:v5];
}

- (void)deleteAllCachedValuesForGroupWithID:(id)a3 WithCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002F36C0;
  v8[3] = &unk_1009884D0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:v8];
}

- (void)centerUpdatedRegistrationIdentities:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notified of update to registration identities; invalidating daemon cache",
      v6,
      2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(IDSDGroupContextController *)self setSeal:0];
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:&stru_1009885B0];
}

- (void)_messagesGroupContextWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002F3A5C;
  v5[3] = &unk_100988570;
  id v6 = a3;
  id v4 = v6;
  [(IDSDGroupContextController *)self groupContextForProtectionSpace:0 withCompletion:v5];
}

- (void)qSetupSeal
{
  id v3 = objc_alloc((Class)CUTPromiseSeal);
  id v4 = im_primary_queue();
  id v5 = [v3 initWithQueue:v4];

  [(IDSDGroupContextController *)self setSeal:v5];
}

- (void)qGroupContextWithDeviceIdentity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = [(IDSDGroupContextController *)self messagesGroupContext];

  if (v6)
  {
    id v7 = [(IDSDGroupContextController *)self seal];
    [v7 fulfillWithValue:self->_messagesGroupContext];
  }
  else
  {
    id v8 = objc_alloc((Class)ENAccountIdentity);
    id v9 = [v5 accountIdentity];
    id v7 = [v8 initWithAccountKey:v9 deviceKey:v5];

    id v10 = objc_alloc((Class)ENGroupContext);
    id v11 = +[IDSDGroupContextDataSource sharedInstance];
    id v12 = im_primary_queue();
    id v13 = [v10 initWithAccountIdentity:v7 dataSource:v11 queue:v12];

    if (+[IMUserDefaults isEngramEnabled])
    {
      id v14 = NSHomeDirectory();
      id v15 = +[NSArray arrayWithObjects:v14, @"/Library/IdentityServices/", 0];
      id v16 = +[NSString pathWithComponents:v15];
      id v17 = +[NSURL fileURLWithPath:v16];

      id v18 = objc_alloc((Class)ENGroupContextCoreDataCache);
      v19 = im_primary_queue();
      id v20 = [v18 initOnDiskCacheWithContainerURL:v17 Queue:v19];

      v21 = [[IDSGroupSendAheadObserver alloc] initWithProtectionSpace:0];
      [v13 appendMiddleware:v20];
      [v13 appendMiddleware:v21];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1002F3E0C;
      v23[3] = &unk_100981B98;
      v23[4] = self;
      id v24 = v13;
      [v20 loadWithCompletion:v23];
    }
    else
    {
      id v17 = [(IDSDGroupContextController *)self seal];
      uint64_t v22 = ENGroupContextErrorDomain;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Engram is disabled";
      id v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v21 = +[NSError errorWithDomain:v22 code:-1000 userInfo:v20];
      [v17 failWithError:v21];
    }
  }
}

- (ENGroupContext)messagesGroupContext
{
  return self->_messagesGroupContext;
}

- (void)setMessagesGroupContext:(id)a3
{
}

- (CUTPromiseSeal)seal
{
  return self->_seal;
}

- (void)setSeal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seal, 0);

  objc_storeStrong((id *)&self->_messagesGroupContext, 0);
}

@end