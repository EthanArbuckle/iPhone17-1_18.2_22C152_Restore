@interface AKFollowUpManager
- (AKFollowUpControllerServiceProvider)serviceProvider;
- (AKFollowUpManager)initWithFollowUpFactory:(id)a3 provider:(id)a4;
- (BOOL)_synchronizeLocalFollowUpsWithServerPayload:(id)a3 altDSID:(id)a4 error:(id *)a5;
- (id)_alignedInsertionCandidates:(id)a3 withExistingItems:(id)a4;
- (id)pendingFollowUpWithCommand:(unint64_t)a3;
- (id)pendingFollowUpWithMessageId:(id)a3;
- (void)_notifyServerOfTeardownWithContext:(id)a3 completion:(id)a4;
- (void)_processFetchCompletionForAltDSID:(id)a3 items:(id)a4 fetchError:(id)a5 completion:(id)a6;
- (void)_refreshFollowUpsWithIdmsInfo:(id)a3 context:(id)a4 authHandler:(id)a5 completion:(id)a6;
- (void)_refreshFollowUpsWithIdmsInfo:(id)a3 context:(id)a4 completion:(id)a5;
- (void)processPushMessage:(id)a3;
- (void)setServiceProvider:(id)a3;
- (void)synchronizeFollowUpItemsForContext:(id)a3 authHandler:(id)a4 completion:(id)a5;
- (void)tearDownFollowUpsWithItems:(id)a3;
- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKFollowUpManager

- (AKFollowUpManager)initWithFollowUpFactory:(id)a3 provider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AKFollowUpManager;
  v9 = [(AKFollowUpManager *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_factory, a3);
    objc_storeStrong((id *)&v10->_provider, a4);
    latestPushMessage = v10->_latestPushMessage;
    v10->_latestPushMessage = 0;
  }
  return v10;
}

- (void)processPushMessage:(id)a3
{
  id v5 = a3;
  if ([v5 command] == (id)800 || objc_msgSend(v5, "command") == (id)1900)
  {
    v6 = [v5 altDSID];
    id v7 = +[AKAccountManager sharedInstance];
    id v8 = [v7 iCloudAccountForAltDSID:v6];

    if (v8)
    {
      v9 = +[AKAccountManager sharedInstance];
      if ([v9 isPrimaryiCloudAccount:v8])
      {

LABEL_10:
        objc_storeStrong((id *)&self->_latestPushMessage, a3);
        v12 = objc_opt_new();
        [v12 setAltDSID:v6];
        objc_super v13 = [v5 userInfo];
        v14 = [v13 objectForKeyedSubscript:AKFollowUpPushPayloadKey];
        [(AKFollowUpManager *)self _refreshFollowUpsWithIdmsInfo:v14 context:v12 completion:0];

        goto LABEL_11;
      }
      id v11 = [v5 command];

      if (v11 == (id)1900) {
        goto LABEL_10;
      }
      v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Suppressing repair push for non-primary account", v15, 2u);
      }
    }
    else
    {
      v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10017A804(v5, v10);
      }
    }

LABEL_11:
  }
}

- (void)synchronizeFollowUpItemsForContext:(id)a3 authHandler:(id)a4 completion:(id)a5
{
}

- (void)_refreshFollowUpsWithIdmsInfo:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_refreshFollowUpsWithIdmsInfo:(id)a3 context:(id)a4 authHandler:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v11 altDSID];
    *(_DWORD *)buf = 138412546;
    v22 = v15;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Refreshing follow ups for %@ with info %@", buf, 0x16u);
  }
  if (v10)
  {
    v16 = [v10 objectForKeyedSubscript:@"items"];
    v17 = [v11 altDSID];
    [(AKFollowUpManager *)self _processFetchCompletionForAltDSID:v17 items:v16 fetchError:0 completion:v13];
  }
  else
  {
    v16 = [(AKFollowUpControllerServiceProvider *)self->_serviceProvider serviceControllerForContext:v11];
    [v16 setAuthenticationDelegate:v12];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100011B00;
    v18[3] = &unk_100226C30;
    id v20 = v13;
    v18[4] = self;
    id v19 = v11;
    [v16 executeRequestWithCompletion:v18];

    v17 = v20;
  }
}

- (void)_processFetchCompletionForAltDSID:(id)a3 items:(id)a4 fetchError:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, id))a6;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v18 = 0;
    unsigned __int8 v15 = [(AKFollowUpManager *)self _synchronizeLocalFollowUpsWithServerPayload:v11 altDSID:v10 error:&v18];
    id v14 = v18;
    if (v15)
    {
      uint64_t v16 = 1;
      if (!v13) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10017A8CC();
  }

  uint64_t v16 = 0;
  if (v13) {
LABEL_9:
  }
    v13[2](v13, v16, v14);
LABEL_10:
}

- (BOOL)_synchronizeLocalFollowUpsWithServerPayload:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Synchronizing local follow up state", buf, 2u);
  }

  id v11 = +[NSMutableDictionary dictionary];
  latestPushMessage = self->_latestPushMessage;
  if (latestPushMessage)
  {
    id v13 = +[NSNumber numberWithUnsignedInteger:[(AKPushMessage *)latestPushMessage command]];
    [v11 setObject:v13 forKeyedSubscript:@"cmd"];

    id v14 = [(AKPushMessage *)self->_latestPushMessage messageId];
    [v11 setObject:v14 forKeyedSubscript:@"txnid"];
  }
  id v15 = [(AKFollowUpProvider *)self->_provider pendingFollowUpItems:0];
  uint64_t v16 = [(AKFollowUpItemFactory *)self->_factory itemsForAltDSID:v9 pushMessageInfo:v11 fromIDMSPayload:v8];
  v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Insertion Candidates: %@", buf, 0xCu);
  }

  unint64_t v18 = [(AKPushMessage *)self->_latestPushMessage command];
  uint64_t v19 = [(AKFollowUpManager *)self pendingFollowUpWithCommand:800];
  id v20 = (void *)v19;
  if (v18 != 1900 && v19)
  {
    id v48 = v9;
    v21 = objc_msgSend(v8, "aaf_map:", &stru_100226C70);
    v22 = +[NSSet setWithArray:v21];

    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10001232C;
    v59[3] = &unk_100226C98;
    id v47 = v22;
    id v60 = v47;
    v49 = objc_msgSend(v20, "aaf_filter:", v59);
    if ([v49 count])
    {
      __int16 v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v49;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Deleting: %@", buf, 0xCu);
      }

      provider = self->_provider;
      id v58 = 0;
      unsigned __int8 v25 = [(AKFollowUpProvider *)provider removeFollowUpItems:v49 error:&v58];
      id v26 = v58;
      if ((v25 & 1) == 0)
      {
        v27 = _AKLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10017A940();
        }
      }
    }
    v28 = [(AKFollowUpItemFactory *)self->_factory itemIdentifiersRequiringNotificationClearFromPayload:v8];
    v29 = +[NSSet setWithArray:v28];

    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100012374;
    v56[3] = &unk_100226C98;
    id v30 = v29;
    id v57 = v30;
    v31 = objc_msgSend(v20, "aaf_filter:", v56);
    if ([v31 count])
    {
      v45 = a5;
      id v46 = v8;
      v32 = _AKLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v31;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Clearing Notifications: %@", buf, 0xCu);
      }

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v33 = v31;
      id v34 = [v33 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v53;
        do
        {
          for (i = 0; i != v35; i = (char *)i + 1)
          {
            if (*(void *)v53 != v36) {
              objc_enumerationMutation(v33);
            }
            -[AKFollowUpProvider clearNotificationsForItem:error:](self->_provider, "clearNotificationsForItem:error:", *(void *)(*((void *)&v52 + 1) + 8 * i), 0, v45, v46);
          }
          id v35 = [v33 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v35);
      }

      a5 = v45;
      id v8 = v46;
    }
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000123BC;
    v50[3] = &unk_100226C98;
    id v51 = v30;
    id v38 = v30;
    uint64_t v39 = objc_msgSend(v16, "aaf_filter:", v50);

    uint64_t v16 = (void *)v39;
    id v9 = v48;
  }
  v40 = -[AKFollowUpManager _alignedInsertionCandidates:withExistingItems:](self, "_alignedInsertionCandidates:withExistingItems:", v16, v20, v45, v46);

  v41 = self->_latestPushMessage;
  self->_latestPushMessage = 0;

  v42 = _AKLogSystem();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v40;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Inserting: %@", buf, 0xCu);
  }

  unsigned __int8 v43 = [(AKFollowUpProvider *)self->_provider addFollowUpItems:v40 error:a5];
  return v43;
}

- (id)_alignedInsertionCandidates:(id)a3 withExistingItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSMutableDictionary dictionary];
  +[NSMutableDictionary dictionary];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001268C;
  v23[3] = &unk_100226CC0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v9;
  id v10 = v8;
  id v25 = v10;
  [v7 enumerateObjectsUsingBlock:v23];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100012768;
  v19[3] = &unk_100226CE8;
  id v11 = v9;
  id v20 = v11;
  id v12 = v10;
  id v21 = v12;
  v22 = self;
  [v6 enumerateObjectsUsingBlock:v19];

  id v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found incoming sparse followups: %@", buf, 0xCu);
  }

  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found incoming full followups: %@", buf, 0xCu);
  }

  id v15 = [v11 allValues];
  uint64_t v16 = [v12 allValues];
  v17 = [v15 arrayByAddingObjectsFromArray:v16];

  return v17;
}

- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = [v6 itemIdentifier];
  if (!v8
    || (id v9 = (void *)v8,
        [v6 altDSID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    id v20 = +[NSError ak_errorWithCode:-7044];
    v7[2](v7, 0, v20);

    goto LABEL_16;
  }
  id v11 = [v6 akAction];
  unsigned __int8 v12 = [v11 isEqualToString:AKActionDelete];

  id v13 = [v6 akAction];
  unsigned int v14 = [v13 isEqualToString:AKActionTeardown];

  id v15 = [v6 akAction];
  unsigned int v16 = [v15 isEqualToString:AKFollowUpActionClear];

  unsigned int v17 = 1;
  if ((v12 & 1) == 0 && (v14 & 1) == 0) {
    unsigned int v17 = [v6 isContinuityPush];
  }
  if ((v14 | v16))
  {
    unsigned int v18 = 1;
    if (!v17) {
      goto LABEL_8;
    }
  }
  else
  {
    unsigned int v18 = [v6 isContinuityPush];
    if (!v17)
    {
LABEL_8:
      uint64_t v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10017AAD0();
      }
      goto LABEL_13;
    }
  }
  provider = self->_provider;
  uint64_t v19 = [v6 itemIdentifier];
  __int16 v23 = v19;
  v22 = +[NSArray arrayWithObjects:&v23 count:1];
  [(AKFollowUpProvider *)provider removeFollowUpItemsWithIdentifiers:v22 error:0];

LABEL_13:
  if (v18) {
    [(AKFollowUpManager *)self _notifyServerOfTeardownWithContext:v6 completion:v7];
  }
  else {
    v7[2](v7, 1, 0);
  }
LABEL_16:
}

- (void)_notifyServerOfTeardownWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v25 = AKRequestBodyFollowupKey;
  id v6 = a4;
  id v7 = [v5 itemIdentifier];
  id v24 = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:&v24 count:1];
  id v26 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v10 = [v9 mutableCopy];

  if ([v5 isContinuityPush])
  {
    id v11 = [v5 txnid];
    [v10 setObject:v11 forKeyedSubscript:@"txnid"];

    [v10 setObject:&off_10023AF18 forKeyedSubscript:@"cmd"];
    unsigned __int8 v12 = [v5 idmsData];

    if (v12)
    {
      id v13 = [v5 idmsData];
      [v10 setObject:v13 forKeyedSubscript:AKIdmsDataKey];
    }
    unsigned int v14 = [v5 akAction];
    CFStringRef v15 = @"action";
  }
  else
  {
    unsigned int v16 = [v5 akAction];

    if (!v16) {
      goto LABEL_8;
    }
    unsigned int v14 = [v5 akAction];
    CFStringRef v15 = (const __CFString *)AKFollowUpTeardownSource;
  }
  [v10 setObject:v14 forKeyedSubscript:v15];

LABEL_8:
  unsigned int v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending tear down payload: %@", (uint8_t *)&v22, 0xCu);
  }

  unsigned int v18 = +[AKAppleIDCheckInHelperService sharedService];
  uint64_t v19 = +[AKAccountManager sharedInstance];
  id v20 = [v5 altDSID];
  id v21 = [v19 authKitAccountWithAltDSID:v20 error:0];
  [v18 ackWithPayload:v10 account:v21 completion:v6];
}

- (id)pendingFollowUpWithMessageId:(id)a3
{
  id v4 = a3;
  id v5 = [(AKFollowUpProvider *)self->_provider pendingFollowUpItems:0];
  +[NSMutableArray array];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013014;
  v12[3] = &unk_100226CC0;
  id v13 = v4;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v6;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v12];
  uint64_t v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10017AB04();
  }

  id v9 = v14;
  id v10 = v6;

  return v10;
}

- (id)pendingFollowUpWithCommand:(unint64_t)a3
{
  id v4 = [(AKFollowUpProvider *)self->_provider pendingFollowUpItems:0];
  +[NSMutableArray array];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000131C4;
  v8[3] = &unk_100226D10;
  unint64_t v10 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  [v4 enumerateObjectsUsingBlock:v8];
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10017AB6C();
  }

  return v5;
}

- (void)tearDownFollowUpsWithItems:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Tear down follow up items: %@", (uint8_t *)&v6, 0xCu);
  }

  [(AKFollowUpProvider *)self->_provider removeFollowUpItems:v4 error:0];
}

- (AKFollowUpControllerServiceProvider)serviceProvider
{
  return self->_serviceProvider;
}

- (void)setServiceProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_latestPushMessage, 0);
  objc_storeStrong((id *)&self->_provider, 0);

  objc_storeStrong((id *)&self->_factory, 0);
}

@end