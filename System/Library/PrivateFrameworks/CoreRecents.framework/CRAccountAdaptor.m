@interface CRAccountAdaptor
- (BOOL)isSyncingDisabledForAccountWithAddress:(id)a3;
- (BOOL)isUsingiCloud;
- (CRAccountAdaptor)init;
- (CRAccountAdaptor)initWithDelegate:(id)a3;
- (CRAccountAdaptor)initWithUserDefaults:(id)a3 accountStore:(id)a4 delegate:(id)a5;
- (CRAccountAdaptorDelegate)delegate;
- (id)_analyzeMailAccounts;
- (id)_primaryiCloudAccountPersonID;
- (id)senderEmailAddresses;
- (void)_delegateAccountChanges;
- (void)_resetCachedAccountInfo;
- (void)_runWithAnalyzerLock:(id)a3;
- (void)dealloc;
- (void)refresh;
- (void)setDelegate:(id)a3;
@end

@implementation CRAccountAdaptor

- (CRAccountAdaptor)init
{
  return 0;
}

- (CRAccountAdaptor)initWithDelegate:(id)a3
{
  v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = +[ACAccountStore defaultStore];
  return [(CRAccountAdaptor *)self initWithUserDefaults:v5 accountStore:v6 delegate:a3];
}

- (CRAccountAdaptor)initWithUserDefaults:(id)a3 accountStore:(id)a4 delegate:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)CRAccountAdaptor;
  v8 = [(CRAccountAdaptor *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_userDefaults = (NSUserDefaults *)a3;
    v9->_accountStore = (ACAccountStore *)a4;
    v9->_delegate = (CRAccountAdaptorDelegate *)a5;
    v9->_iCloudAccountPersonID = (NSString *)[(NSString *)[(NSUserDefaults *)v9->_userDefaults stringForKey:@"LastiCloudAccountPersonID"] copy];
    v9->_iCloudAccountWasLoggedIn = [(NSUserDefaults *)v9->_userDefaults BOOLForKey:@"LastiCloudAccountWasLoggedIn"];
    objc_initWeak(&location, v9);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100018A08;
    v16[3] = &unk_10002D400;
    objc_copyWeak(&v17, &location);
    v9->_mailAccountListener = (CNCancelable *)+[CRAccountListener mailAccountListenerWithHandler:v16];
    accountStore = v9->_accountStore;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100018A34;
    v14[3] = &unk_10002D400;
    objc_copyWeak(&v15, &location);
    v9->_appleAccountListener = (CNCancelable *)+[CRAccountListener appleAccountListenerForStore:accountStore withHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100018A60;
    v12[3] = &unk_10002D400;
    objc_copyWeak(&v13, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v9;
}

- (void)dealloc
{
  [(CNCancelable *)self->_mailAccountListener cancel];
  [(CNCancelable *)self->_appleAccountListener cancel];

  v3.receiver = self;
  v3.super_class = (Class)CRAccountAdaptor;
  [(CRAccountAdaptor *)&v3 dealloc];
}

- (BOOL)isSyncingDisabledForAccountWithAddress:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018BD0;
  v5[3] = &unk_10002D428;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  [(CRAccountAdaptor *)self _runWithAnalyzerLock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)senderEmailAddresses
{
  id v3 = +[NSMutableSet set];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018C98;
  v5[3] = &unk_10002C9D0;
  v5[4] = v3;
  v5[5] = self;
  [(CRAccountAdaptor *)self _runWithAnalyzerLock:v5];
  return v3;
}

- (void)_runWithAnalyzerLock:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_analyzer) {
    self->_analyzer = (CRMailAccountAnalyzer *)[(CRAccountAdaptor *)self _analyzeMailAccounts];
  }
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock(p_lock);
}

- (id)_analyzeMailAccounts
{
  id v3 = objc_alloc_init(CRMailAccountAnalyzer);
  v4 = [[CRMailAccountIterator alloc] initWithAccountStore:self->_accountStore];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018E1C;
  v6[3] = &unk_10002D450;
  v6[4] = v3;
  [(CRMailAccountIterator *)v4 enumerateEmailAddresses:v6];
  return v3;
}

- (void)_resetCachedAccountInfo
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100018E98;
  v2[3] = &unk_10002CA48;
  v2[4] = self;
  [(CRAccountAdaptor *)self _runWithAnalyzerLock:v2];
}

- (id)_primaryiCloudAccountPersonID
{
  id result = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
  if (result)
  {
    return objc_msgSend(result, "aa_personID");
  }
  return result;
}

- (BOOL)isUsingiCloud
{
  return objc_msgSend(-[CRAccountAdaptor _primaryiCloudAccountPersonID](self, "_primaryiCloudAccountPersonID"), "length") != 0;
}

- (void)_delegateAccountChanges
{
  id v3 = [(CRAccountAdaptor *)self _primaryiCloudAccountPersonID];
  v4 = +[CRLogging log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    iCloudAccountPersonID = self->_iCloudAccountPersonID;
    int v13 = 136315650;
    v14 = "-[CRAccountAdaptor _delegateAccountChanges]";
    __int16 v15 = 2114;
    v16 = iCloudAccountPersonID;
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s old:%{public}@ current:%{public}@", (uint8_t *)&v13, 0x20u);
  }
  unsigned int v6 = [v3 isEqualToString:self->_iCloudAccountPersonID];
  unsigned int v7 = v6;
  if (self->_iCloudAccountWasLoggedIn && !v3)
  {
    uint64_t v8 = 0;
    BOOL v9 = 1;
LABEL_17:
    [(CRAccountAdaptorDelegate *)[(CRAccountAdaptor *)self delegate] accountAdaptor:self observediCloudAccountTransition:v8];
    self->_iCloudAccountWasLoggedIn = v3 != 0;
    [(NSUserDefaults *)self->_userDefaults setBool:v3 != 0 forKey:@"LastiCloudAccountWasLoggedIn"];
    if (((v9 | v7) & 1) == 0)
    {

      v12 = (NSString *)[v3 copy];
      self->_iCloudAccountPersonID = v12;
      [(NSUserDefaults *)self->_userDefaults setObject:v12 forKey:@"LastiCloudAccountPersonID"];
    }
    [(NSUserDefaults *)self->_userDefaults synchronize];
    return;
  }
  BOOL v10 = !self->_iCloudAccountWasLoggedIn;
  BOOL v9 = v3 == 0;
  if (!v3) {
    BOOL v10 = 0;
  }
  if (v10 & v6)
  {
    uint64_t v8 = 1;
    goto LABEL_17;
  }
  if ((!v10 | v6) != 1)
  {
    uint64_t v8 = 2;
    goto LABEL_17;
  }
  BOOL v11 = !self->_iCloudAccountWasLoggedIn || v3 == 0;
  if (((v11 | v6) & 1) == 0)
  {
    BOOL v9 = 0;
    uint64_t v8 = 3;
    goto LABEL_17;
  }
}

- (void)refresh
{
}

- (CRAccountAdaptorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CRAccountAdaptorDelegate *)a3;
}

@end