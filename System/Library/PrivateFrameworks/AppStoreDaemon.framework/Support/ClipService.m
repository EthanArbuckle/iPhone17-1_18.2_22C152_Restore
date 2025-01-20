@interface ClipService
- (void)accountStatusUsingRequest:(id)a3 withReplyHandler:(id)a4;
- (void)boostSessionUsingChannel:(id)a3 forRequest:(id)a4 withReplyHandler:(id)a5;
- (void)cancelSessionID:(id)a3 withReplyHandler:(id)a4;
- (void)clipCardMetricsEvent:(id)a3 withReplyHandler:(id)a4;
- (void)commitSessionID:(id)a3 withReplyHandler:(id)a4;
- (void)placeholderSessionID:(id)a3 withReplyHandler:(id)a4;
- (void)startSessionID:(id)a3 withReplyHandler:(id)a4;
@end

@implementation ClipService

- (void)accountStatusUsingRequest:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a3;
  v40 = (void (**)(id, id, void *))a4;
  v6 = sub_100016788();
  v7 = +[ACAccountStore ams_sharedAccountStore];
  v8 = objc_msgSend(v7, "ams_activeiTunesAccount");

  v9 = objc_msgSend(v8, "ams_DSID");
  BOOL v42 = 0;
  v10 = objc_alloc_init(_TtC9appstored6LogKey);
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v6 processInfo];
    v13 = [v12 bundleIdentifier];
    *(_DWORD *)buf = 138412546;
    v44 = v10;
    __int16 v45 = 2114;
    v46 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%@] accountStatusUsingRequest for client: %{public}@", buf, 0x16u);
  }
  id v14 = [objc_alloc((Class)ASDAccountStatusResponse) initWithAccountID:v9];
  if (v8)
  {
    v15 = sub_100420D50();
    id v41 = 0;
    int v16 = sub_100420E2C((uint64_t)v15, v10, (int)[v5 lookupFamilyInfoIfNecessary], 0, &v42, &v41);
    id v17 = v41;

    if (v16) {
      uint64_t v18 = 32;
    }
    else {
      uint64_t v18 = 0;
    }
    v19 = objc_msgSend(v8, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagIsManagedAccount);
    if (v19 && (objc_opt_respondsToSelector() & 1) != 0 && [v19 BOOLValue]) {
      v18 |= 8uLL;
    }
    v20 = objc_msgSend(v8, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagCanUseAppClips);
    v35 = v19;
    if (v20 && (objc_opt_respondsToSelector() & 1) != 0 && ![v20 BOOLValue]) {
      v18 |= 2uLL;
    }
    uint64_t v21 = objc_msgSend(v8, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagUnderThirteen);
    id v36 = v17;
    v34 = (void *)v21;
    if (v21)
    {
      v22 = v6;
      v23 = (void *)v21;
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v23 BOOLValue]) {
        v18 |= 0x10uLL;
      }
      v6 = v22;
    }
    v24 = objc_msgSend(v8, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagIsInRestrictedRegion);
    id v39 = v5;
    if (v24 && (objc_opt_respondsToSelector() & 1) != 0 && [v24 BOOLValue]) {
      v18 |= 0x40uLL;
    }
    v25 = objc_msgSend(v8, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagHasAgreedToAppClipTerms);
    v38 = v9;
    if (v25 && (objc_opt_respondsToSelector() & 1) != 0 && ![v25 BOOLValue]) {
      v18 |= 0x80uLL;
    }
    v26 = objc_msgSend(v8, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagIsInBadCredit);
    v37 = v10;
    if (v26 && (objc_opt_respondsToSelector() & 1) != 0 && [v26 BOOLValue]) {
      v18 |= 0x100uLL;
    }
    v27 = objc_msgSend(v8, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagIsRestrictedAccount);
    v28 = v20;
    if (v27 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v29 = v6;
      if ([v27 BOOLValue]) {
        v18 |= 4uLL;
      }
    }
    else
    {
      v29 = v6;
    }
    v30 = objc_msgSend(v8, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagIsDisabledAccount);
    if (v30 && (objc_opt_respondsToSelector() & 1) != 0 && [v30 BOOLValue]) {
      v18 |= 0x200uLL;
    }

    v9 = v38;
    id v5 = v39;
    v6 = v29;
    v31 = v36;
    v10 = v37;
  }
  else
  {
    v31 = 0;
    uint64_t v18 = 1;
  }
  [v14 setAccountStatus:v18];
  [v14 setHasCachedFamilyInfo:v42];
  v32 = ASDErrorWithSafeUserInfo();
  v40[2](v40, v14, v32);

  v33 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v10;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%@] accountStatusUsingRequest complete", buf, 0xCu);
  }
}

- (void)boostSessionUsingChannel:(id)a3 forRequest:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 uniqueID];
  if (v11)
  {
    v12 = sub_1001FC07C((id *)[ClipSession alloc], self->_bag, v9, v8, self->_urlSession, self->_device);
    os_unfair_lock_lock_with_options();
    [(NSMutableDictionary *)self->_sessions setObject:v12 forKeyedSubscript:v11];
    os_unfair_lock_unlock(&self->_lock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003373B0;
    v14[3] = &unk_1005218C0;
    v14[4] = self;
    id v15 = v11;
    sub_1001FD518((uint64_t)v12, v10, v14);
  }
  else
  {
    v13 = ASDErrorWithDescription();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  }
}

- (void)cancelSessionID:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v9 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v6];
  os_unfair_lock_unlock(p_lock);
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100337554;
    v12[3] = &unk_1005230F0;
    id v13 = v7;
    sub_1001FCE4C((uint64_t)v9, v12);
  }
  else
  {
    id v10 = +[NSString stringWithFormat:@"Session '%@' not found", v6];
    v11 = ASDErrorWithDescription();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)clipCardMetricsEvent:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = sub_100016788();
  id v8 = objc_alloc_init(_TtC9appstored6LogKey);
  id v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 processInfo];
    v11 = [v10 bundleIdentifier];
    int v18 = 138412546;
    v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] clipCardMetricsEvent for client: %{public}@", (uint8_t *)&v18, 0x16u);
  }
  v12 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v5 bundleID];
    id v14 = [v5 itemID];
    id v15 = [v5 referralSourceBundleID];
    int v16 = [v5 sourceURL];
    int v18 = 138413314;
    v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    v23 = v14;
    __int16 v24 = 2114;
    v25 = v15;
    __int16 v26 = 2114;
    v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%@] Clip card event with bundleID: %{public}@ itemID: %{public}@ referral source bundleID: %{public}@ sourceURL: %{public}@", (uint8_t *)&v18, 0x34u);
  }
  id v17 = sub_1002E1CF4();
  sub_1002E3AEC((uint64_t)v17, v5);

  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (void)commitSessionID:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v9 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v6];
  os_unfair_lock_unlock(p_lock);
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003378F4;
    v12[3] = &unk_1005230F0;
    id v13 = v7;
    sub_1001FD330((uint64_t)v9, v12);
  }
  else
  {
    id v10 = +[NSString stringWithFormat:@"Session '%@' not found", v6];
    v11 = ASDErrorWithDescription();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)placeholderSessionID:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v9 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v6];
  os_unfair_lock_unlock(p_lock);
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100337A50;
    v12[3] = &unk_1005230F0;
    id v13 = v7;
    sub_1001FDA18((uint64_t)v9, v12);
  }
  else
  {
    id v10 = +[NSString stringWithFormat:@"Session '%@' not found", v6];
    v11 = ASDErrorWithDescription();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)startSessionID:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v9 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v6];
  os_unfair_lock_unlock(p_lock);
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100337BAC;
    v12[3] = &unk_1005230F0;
    id v13 = v7;
    sub_1001FC770((uint64_t)v9, v12);
  }
  else
  {
    id v10 = +[NSString stringWithFormat:@"Session '%@' not found", v6];
    v11 = ASDErrorWithDescription();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end