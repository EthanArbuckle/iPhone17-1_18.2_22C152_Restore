@interface PKSearchForAccountsIntentHandler
- (id)_openPeerPaymentPassActivity;
- (id)_responseForInvalidAccountResolution:(unint64_t)a3;
- (id)_responseForInvalidRegistrationStatus:(unint64_t)a3;
- (void)handleSearchForAccounts:(id)a3 completion:(id)a4;
@end

@implementation PKSearchForAccountsIntentHandler

- (void)handleSearchForAccounts:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received call to handleSearchForAccounts: with intent %@", buf, 0xCu);
  }

  kdebug_trace();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000AA68;
  v18[3] = &unk_100014A08;
  id v9 = v7;
  id v20 = v9;
  v18[4] = self;
  id v10 = v6;
  id v19 = v10;
  v11 = objc_retainBlock(v18);
  v12 = [v10 organizationName];

  if (v12)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v10 organizationName];
      *(_DWORD *)buf = 138412290;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling handleSearchForAccounts: completion with failureAccountNotFound for non-empty organizationName %@", buf, 0xCu);
    }
    id v14 = [objc_alloc((Class)INSearchForAccountsIntentResponse) initWithCode:7 userActivity:0];
    ((void (*)(void *, id))v11[2])(v11, v14);
  }
  else
  {
    v15 = [(PKPeerPaymentIntentHandler *)self intentQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AAF8;
    block[3] = &unk_100014A58;
    block[4] = self;
    v17 = v11;
    dispatch_async(v15, block);
  }
}

- (id)_responseForInvalidRegistrationStatus:(unint64_t)a3
{
  if (a3 == 2) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 4;
  }
  id v4 = [objc_alloc((Class)INSearchForAccountsIntentResponse) initWithCode:v3 userActivity:0];

  return v4;
}

- (id)_responseForInvalidAccountResolution:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = qword_10000FFE8[a3 - 1];
  }
  id v5 = objc_alloc((Class)INSearchForAccountsIntentResponse);
  id v6 = [(PKSearchForAccountsIntentHandler *)self _openPeerPaymentPassActivity];
  id v7 = [v5 initWithCode:v4 userActivity:v6];

  return v7;
}

- (id)_openPeerPaymentPassActivity
{
  v2 = [(PKPeerPaymentIntentHandler *)self peerPaymentController];
  uint64_t v3 = [v2 account];
  uint64_t v4 = [v3 associatedPassUniqueID];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSUserActivity);
    id v6 = [v5 initWithActivityType:PKViewPassUserActivityType];
    [v6 setEligibleForHandoff:0];
    uint64_t v9 = PKViewPassUserActivityPassKey;
    id v10 = v4;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v6 setUserInfo:v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end