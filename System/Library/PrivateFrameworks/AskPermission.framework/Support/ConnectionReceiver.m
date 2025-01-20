@interface ConnectionReceiver
+ (ConnectionReceiver)sharedReceiver;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)connectionListener;
- (id)_getMatchingRequestsViaUserDefaultsCheckWithIdentifier:(id)a3;
- (id)_getRequestRequestViaUserDefaultsCheckWithIdentifier:(id)a3;
- (void)addRequestWithURL:(id)a3 account:(id)a4 completion:(id)a5;
- (void)checkDownloadQueueWithContentType:(int64_t)a3 completion:(id)a4;
- (void)didReceiveStorePushNotificationWithPayload:(id)a3;
- (void)getCachedRequestsWithCompletion:(id)a3;
- (void)getMatchingRequestsWithIdentifier:(id)a3 completion:(id)a4;
- (void)getRequestWithIdentifier:(id)a3 completion:(id)a4;
- (void)localApproveRequestWithItemIdentifier:(id)a3 completion:(id)a4;
- (void)presentApprovalSheetWithRequestIdentifier:(id)a3 completion:(id)a4;
- (void)presentProductPageWithTitle:(id)a3 body:(id)a4 approve:(id)a5 decline:(id)a6 itemIdentifier:(id)a7 previewURL:(id)a8 offerName:(id)a9 requestString:(id)a10 requestSummary:(id)a11 priceSummary:(id)a12;
- (void)resetAccountWithType:(int64_t)a3;
- (void)restartAPNSConnection;
- (void)setConnectionListener:(id)a3;
- (void)start;
- (void)updateRequestWithIdentifier:(id)a3 action:(int64_t)a4 completion:(id)a5;
@end

@implementation ConnectionReceiver

+ (ConnectionReceiver)sharedReceiver
{
  if (qword_100042AD0 != -1) {
    dispatch_once(&qword_100042AD0, &stru_1000387F8);
  }
  v2 = (void *)qword_100042AD8;
  return (ConnectionReceiver *)v2;
}

- (void)start
{
  v3 = [(ConnectionReceiver *)self connectionListener];

  if (!v3)
  {
    v4 = +[APLogConfig sharedDaemonConfig];
    if (!v4)
    {
      v4 = +[APLogConfig sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting connection listener", (uint8_t *)&v10, 0xCu);
    }
    id v7 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.askpermissiond"];
    [(ConnectionReceiver *)self setConnectionListener:v7];

    v8 = [(ConnectionReceiver *)self connectionListener];
    [v8 setDelegate:self];

    v9 = [(ConnectionReceiver *)self connectionListener];
    [v9 resume];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[APLogConfig sharedDaemonConfig];
  if (!v8)
  {
    v8 = +[APLogConfig sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2114;
    id v23 = v7;
    id v10 = v21;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepting new connection. Connection: %{public}@", buf, 0x16u);
  }
  id v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ConnectionProtocol];
  [v7 setExportedInterface:v11];
  objc_initWeak((id *)buf, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000AF68;
  v18[3] = &unk_100038820;
  objc_copyWeak(&v19, (id *)buf);
  [v7 setInvalidationHandler:v18];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10000B064;
  v16 = &unk_100038820;
  objc_copyWeak(&v17, (id *)buf);
  [v7 setInterruptionHandler:&v13];
  objc_msgSend(v7, "setExportedObject:", self, v13, v14, v15, v16);
  [v7 resume];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)addRequestWithURL:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[APLogConfig sharedDaemonConfig];
  if (!v11)
  {
    id v11 = +[APLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v20 = (id)objc_opt_class();
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    id v13 = v20;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Add request. URL: %{public}@, account: %{public}@", buf, 0x20u);
  }
  uint64_t v14 = [[PostRequestTask alloc] initWithRequestURL:v8 account:v9];
  v15 = [(PostRequestTask *)v14 perform];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000B334;
  v17[3] = &unk_100038848;
  v17[4] = self;
  id v18 = v10;
  id v16 = v10;
  [v15 addFinishBlock:v17];
}

- (void)resetAccountWithType:(int64_t)a3
{
  v5 = +[APLogConfig sharedFrameworkConfig];
  if (!v5)
  {
    v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = a3;
    id v7 = *(id *)&buf[4];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Reset account with type: %{public}ld", buf, 0x16u);
  }
  if (a3 == 1)
  {
    id v8 = objc_alloc_init(ResetRequesterAccountTask);
    id v9 = [(ResetRequesterAccountTask *)v8 perform];
    id v10 = v9;
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_10000B86C;
    v15 = &unk_100038870;
    id v16 = self;
    id v11 = &v12;
  }
  else
  {
    if (a3) {
      return;
    }
    id v8 = objc_alloc_init(ResetApproverAccountTask);
    id v9 = [(ResetRequesterAccountTask *)v8 perform];
    id v10 = v9;
    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    id v19 = sub_10000B6E0;
    id v20 = &unk_100038870;
    __int16 v21 = self;
    id v11 = &v17;
  }
  objc_msgSend(v9, "addFinishBlock:", v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, *(_OWORD *)buf, *(void *)&buf[16]);
}

- (void)checkDownloadQueueWithContentType:(int64_t)a3 completion:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  id v6 = +[APLogConfig sharedDaemonConfig];
  if (!v6)
  {
    id v6 = +[APLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = (id)objc_opt_class();
    id v8 = v25;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking download queue.", buf, 0xCu);
  }
  id v9 = +[ExtensionManager sharedExtensionManager];
  id v23 = 0;
  unsigned int v10 = [v9 checkDownloadQueueWithContentType:a3 error:&v23];
  id v11 = v23;

  uint64_t v12 = +[APLogConfig sharedDaemonConfig];
  uint64_t v13 = (void *)v12;
  if (v10)
  {
    if (!v12)
    {
      uint64_t v13 = +[APLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v25 = v15;
      id v16 = v15;
      id v17 = "%{public}@: Checked download queue succesfully.";
      uint64_t v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      uint32_t v20 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
    }
  }
  else
  {
    if (!v12)
    {
      uint64_t v13 = +[APLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v25 = v21;
      __int16 v26 = 2114;
      id v27 = v11;
      id v16 = v21;
      id v17 = "%{public}@: Fail to check download queue with error: %{public}@.";
      uint64_t v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      uint32_t v20 = 22;
      goto LABEL_14;
    }
  }

  id v22 = objc_msgSend(v11, "ams_sanitizedForSecureCoding");
  v5[2](v5, v22);
}

- (void)getCachedRequestsWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    v4 = +[APLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v6 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Getting all cached requests via XPC", (uint8_t *)&v10, 0xCu);
  }
  id v7 = +[ApproverStore sharedStore];
  id v8 = [v7 getCachedApprovalRequests];

  id v9 = objc_msgSend(v8, "ams_mapWithTransformIgnoresNil:", &stru_1000388B0);
  v3[2](v3, v9);
}

- (void)localApproveRequestWithItemIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APLogConfig sharedDaemonConfig];
  if (!v8)
  {
    id v8 = +[APLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v6;
    id v10 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Local approve request. Item identifier: %{public}@", buf, 0x16u);
  }
  id v11 = [[LocalApproveRequestTask alloc] initWithItemIdentifier:v6];
  uint64_t v12 = [(LocalApproveRequestTask *)v11 perform];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000BF94;
  v14[3] = &unk_100038848;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v12 addFinishBlock:v14];
}

- (void)presentApprovalSheetWithRequestIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = +[APLogConfig sharedDaemonConfig];
  if (!v7)
  {
    id v7 = +[APLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = (id)objc_opt_class();
    __int16 v23 = 2114;
    id v24 = v5;
    id v9 = v22;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Present approval sheet. Request identifier: %{public}@", buf, 0x16u);
  }
  id v10 = +[ApproverStore sharedStore];
  id v11 = [v10 approvalRequestWithRequestIdentifier:v5];

  if (!v11)
  {
    CFStringRef v19 = @"requestIdentifier";
    id v20 = v5;
    id v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    APCustomError();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  id v18 = 0;
  +[ProductPagePresenter presentRequest:v11 withError:&v18];
  id v12 = v18;
  if (v12)
  {
    id v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      id v13 = +[APLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v22 = v15;
      __int16 v23 = 2114;
      id v24 = v12;
      id v16 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: Error presenting approval sheet. Error: %{public}@", buf, 0x16u);
    }
    goto LABEL_13;
  }
LABEL_14:
  id v17 = objc_msgSend(v12, "ams_sanitizedForSecureCoding");
  v6[2](v6, v17);
}

- (void)restartAPNSConnection
{
  id v2 = +[RemoteNotificationHandler sharedHandler];
  [v2 start];
}

- (void)updateRequestWithIdentifier:(id)a3 action:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[APLogConfig sharedDaemonConfig];
  if (!v10)
  {
    id v10 = +[APLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2050;
    int64_t v23 = a4;
    id v12 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Update request. Identifier: %{public}@, action: %{public}ld", buf, 0x20u);
  }
  id v13 = [[UpdateRequestTask alloc] initWithRequestIdentifier:v8 action:a4];
  uint64_t v14 = [(UpdateRequestTask *)v13 perform];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C614;
  v16[3] = &unk_100038848;
  v16[4] = self;
  id v17 = v9;
  id v15 = v9;
  [v14 addFinishBlock:v16];
}

- (void)presentProductPageWithTitle:(id)a3 body:(id)a4 approve:(id)a5 decline:(id)a6 itemIdentifier:(id)a7 previewURL:(id)a8 offerName:(id)a9 requestString:(id)a10 requestSummary:(id)a11 priceSummary:(id)a12
{
  id v41 = a3;
  id v37 = a4;
  id v17 = a5;
  id v45 = a6;
  id v44 = a7;
  id v42 = a8;
  id v43 = a9;
  id v40 = a10;
  id v39 = a11;
  id v38 = a12;
  id v18 = +[APLogConfig sharedFrameworkConfig];
  if (!v18)
  {
    id v18 = +[APLogConfig sharedConfig];
  }
  id v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138545154;
    id v48 = (id)objc_opt_class();
    __int16 v49 = 2114;
    id v50 = v41;
    __int16 v51 = 2114;
    id v52 = v37;
    __int16 v53 = 2114;
    id v54 = v17;
    __int16 v55 = 2114;
    id v56 = v45;
    __int16 v57 = 2114;
    id v58 = v44;
    __int16 v59 = 2114;
    id v60 = v42;
    __int16 v61 = 2114;
    id v62 = v43;
    id v20 = v48;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Present product page. Title: %{public}@, body: %{public}@, approve: %{public}@, decline: %{public}@, itemIdentifier: %{public}@, previewURL: %{public}@, offerName:%{public}@", buf, 0x52u);
  }
  id v21 = [ApprovalRequest alloc];
  __int16 v22 = +[NSDate date];
  int64_t v23 = +[NSUUID UUID];
  id v24 = [v23 UUIDString];
  id v25 = +[NSUUID UUID];
  __int16 v26 = [v25 UUIDString];
  id v27 = [[RequestLocalizations alloc] initWithApprove:v17 body:v37 decline:v45 title:v41];
  v28 = v42;
  if ([v42 length])
  {
    v29 = +[NSURL URLWithString:v42];
    LOBYTE(v36) = 1;
    v30 = -[ApprovalRequest initWithApproverDSID:createdDate:modifiedDate:requestIdentifier:uniqueIdentifier:canSendViaMessages:itemBundleID:itemDescription:itemIdentifier:itemTitle:localizations:offerName:mocked:previewURL:productType:productTypeName:productURL:requesterName:requesterDSID:requestInfo:requestString:requestSummary:priceSummary:status:](v21, "initWithApproverDSID:createdDate:modifiedDate:requestIdentifier:uniqueIdentifier:canSendViaMessages:itemBundleID:itemDescription:itemIdentifier:itemTitle:localizations:offerName:mocked:previewURL:productType:productTypeName:productURL:requesterName:requesterDSID:requestInfo:requestString:requestSummary:priceSummary:status:", 0, v22, 0, v24, v26, 0, @"com.apple.Bundle", v37, v44, v41, v27, v43, v36, v29, 0,
            0,
            0,
            @"Child",
            @"1234",
            0,
            v40,
            v39,
            v38,
            -1);

    v28 = v42;
  }
  else
  {
    LOBYTE(v36) = 1;
    v30 = -[ApprovalRequest initWithApproverDSID:createdDate:modifiedDate:requestIdentifier:uniqueIdentifier:canSendViaMessages:itemBundleID:itemDescription:itemIdentifier:itemTitle:localizations:offerName:mocked:previewURL:productType:productTypeName:productURL:requesterName:requesterDSID:requestInfo:requestString:requestSummary:priceSummary:status:](v21, "initWithApproverDSID:createdDate:modifiedDate:requestIdentifier:uniqueIdentifier:canSendViaMessages:itemBundleID:itemDescription:itemIdentifier:itemTitle:localizations:offerName:mocked:previewURL:productType:productTypeName:productURL:requesterName:requesterDSID:requestInfo:requestString:requestSummary:priceSummary:status:", 0, v22, 0, v24, v26, 0, @"com.apple.Bundle", v37, v44, v41, v27, v43, v36, 0, 0,
            0,
            0,
            @"Child",
            @"1234",
            0,
            v40,
            v39,
            v38,
            -1);
  }

  id v46 = 0;
  +[ProductPagePresenter presentRequest:v30 withError:&v46];
  id v31 = v46;
  if (v31)
  {
    v32 = +[APLogConfig sharedDaemonConfig];
    if (!v32)
    {
      v32 = +[APLogConfig sharedConfig];
    }
    v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v48 = v34;
      __int16 v49 = 2114;
      id v50 = v31;
      id v35 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@: Error presenting product page. Error: %{public}@", buf, 0x16u);

      v28 = v42;
    }
  }
}

- (void)getRequestWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  id v8 = objc_alloc_init(FamilyRequestTask);
  id v9 = [(FamilyRequestTask *)v8 perform];
  id v45 = 0;
  id v10 = [v9 resultWithError:&v45];
  id v11 = v45;
  if (v11) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v16 = +[APLogConfig sharedDaemonConfig];
    if (!v16)
    {
      id v16 = +[APLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
LABEL_34:
      id v37 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      __int16 v49 = v37;
      __int16 v50 = 2114;
      id v51 = v11;
      id v38 = v37;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Falling back to UserDefaults. Error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v13 = [v10 type];
    if (v13 == (id)1)
    {
      uint64_t v14 = +[RequesterStore sharedStore];
      uint64_t v15 = [v14 requestWithIdentifier:v6];
LABEL_13:
      id v18 = (void *)v15;

      if (!v18) {
        goto LABEL_14;
      }
LABEL_36:
      v32 = [v18 compile];
      if (!v7) {
        goto LABEL_38;
      }
LABEL_37:
      id v39 = objc_msgSend(v11, "ams_sanitizedForSecureCoding");
      v7[2](v7, v32, v39);

      goto LABEL_38;
    }
    if (!v13)
    {
      uint64_t v14 = +[ApproverStore sharedStore];
      uint64_t v15 = [v14 approvalRequestWithRequestIdentifier:v6];
      goto LABEL_13;
    }
    id v16 = +[APLogConfig sharedDaemonConfig];
    if (!v16)
    {
      id v16 = +[APLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
  }

  id v18 = [(ConnectionReceiver *)self _getRequestRequestViaUserDefaultsCheckWithIdentifier:v6];
  if (v18) {
    goto LABEL_36;
  }
LABEL_14:
  id v41 = v9;
  id v42 = v8;
  id v19 = +[APLogConfig sharedDaemonConfig];
  if (!v19)
  {
    id v19 = +[APLogConfig sharedConfig];
  }
  id v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    __int16 v49 = v21;
    __int16 v50 = 2112;
    id v51 = v6;
    id v22 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to find cached request. Attempting to fetch from server. Identifier: %@", buf, 0x16u);
  }
  int64_t v23 = [[FetchRequestTask alloc] initWithIdentifier:v6];
  id v24 = [(FetchRequestTask *)v23 perform];
  id v44 = 0;
  unsigned int v25 = [v24 resultWithError:&v44];
  id v43 = v44;

  uint64_t v26 = +[APLogConfig sharedDaemonConfig];
  id v27 = (void *)v26;
  if (v25)
  {
    if (!v26)
    {
      id v27 = +[APLogConfig sharedConfig];
    }
    v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_opt_class();
      id v40 = v29;
      v30 = [(FetchRequestTask *)v23 request];
      *(_DWORD *)buf = 138543618;
      __int16 v49 = v29;
      __int16 v50 = 2114;
      id v51 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched request successfully. Request: %{public}@", buf, 0x16u);
    }
    id v31 = [(FetchRequestTask *)v23 request];
    v32 = [v31 compile];
    id v9 = v41;
    v33 = v43;
  }
  else
  {
    if (!v26)
    {
      id v27 = +[APLogConfig sharedConfig];
    }
    v34 = [v27 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      __int16 v49 = v35;
      __int16 v50 = 2114;
      id v51 = v43;
      id v36 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetch request failed. Error: %{public}@", buf, 0x16u);
    }
    CFStringRef v46 = @"requestIdentifier";
    id v47 = v6;
    id v31 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v33 = APCustomError();

    v32 = 0;
  }

  id v8 = v42;
  if (v7) {
    goto LABEL_37;
  }
LABEL_38:
}

- (id)_getRequestRequestViaUserDefaultsCheckWithIdentifier:(id)a3
{
  id v3 = a3;
  if (!+[APDefaults isApprover])
  {
    unsigned int v9 = +[APDefaults isRequester];
    uint64_t v10 = +[APLogConfig sharedDaemonConfig];
    id v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        id v11 = +[APLogConfig sharedConfig];
      }
      BOOL v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v25 = 138543362;
        *(void *)&v25[4] = objc_opt_class();
        id v13 = *(id *)&v25[4];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: User Defaults says I am Requester", v25, 0xCu);
      }
      id v7 = +[RequesterStore sharedStore];
      uint64_t v8 = [v7 requestWithIdentifier:v3];
      goto LABEL_13;
    }
    if (!v10)
    {
      id v11 = +[APLogConfig sharedConfig];
    }
    uint64_t v15 = [v11 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unsigned int v25 = 138543362;
      *(void *)&v25[4] = objc_opt_class();
      id v16 = *(id *)&v25[4];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: User Defaults NOT SET - checking both stores", v25, 0xCu);
    }
    id v17 = +[ApproverStore sharedStore];
    uint64_t v14 = [v17 approvalRequestWithRequestIdentifier:v3];

    if (v14)
    {
      id v7 = +[APLogConfig sharedDaemonConfig];
      if (!v7)
      {
        id v7 = +[APLogConfig sharedConfig];
      }
      id v18 = objc_msgSend(v7, "OSLogObject", *(_OWORD *)v25);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      id v19 = objc_opt_class();
      *(_DWORD *)unsigned int v25 = 138543362;
      *(void *)&v25[4] = v19;
      id v20 = v19;
      id v21 = "%{public}@: Found request in Approver Storage";
    }
    else
    {
      id v22 = +[RequesterStore sharedStore];
      uint64_t v14 = [v22 requestWithIdentifier:v3];

      if (!v14) {
        goto LABEL_31;
      }
      id v7 = +[APLogConfig sharedDaemonConfig];
      if (!v7)
      {
        id v7 = +[APLogConfig sharedConfig];
      }
      id v18 = objc_msgSend(v7, "OSLogObject", *(_OWORD *)v25);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int64_t v23 = objc_opt_class();
      *(_DWORD *)unsigned int v25 = 138543362;
      *(void *)&v25[4] = v23;
      id v20 = v23;
      id v21 = "%{public}@: Found request in Requester Storage";
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v21, v25, 0xCu);

LABEL_29:
    goto LABEL_30;
  }
  v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    v4 = +[APLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)unsigned int v25 = 138543362;
    *(void *)&v25[4] = objc_opt_class();
    id v6 = *(id *)&v25[4];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: User Defaults says I am Approver", v25, 0xCu);
  }
  id v7 = +[ApproverStore sharedStore];
  uint64_t v8 = [v7 approvalRequestWithRequestIdentifier:v3];
LABEL_13:
  uint64_t v14 = (void *)v8;
LABEL_30:

LABEL_31:
  return v14;
}

- (void)getMatchingRequestsWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  uint64_t v8 = objc_alloc_init(FamilyRequestTask);
  unsigned int v9 = [(FamilyRequestTask *)v8 perform];
  id v37 = 0;
  uint64_t v10 = [v9 resultWithError:&v37];
  id v11 = v37;
  if (v11) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v17 = +[APLogConfig sharedDaemonConfig];
    if (!v17)
    {
      id v17 = +[APLogConfig sharedConfig];
    }
    id v18 = [v17 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v13 = objc_msgSend(v10, "type", v9, v8);
  if (v13 == (id)1)
  {
    uint64_t v14 = +[RequesterStore sharedStore];
    uint64_t v15 = v6;
    uint64_t v16 = [v14 requestsMatchingUniqueIdentifier:v6];
    goto LABEL_13;
  }
  if (!v13)
  {
    uint64_t v14 = +[ApproverStore sharedStore];
    uint64_t v15 = v6;
    uint64_t v16 = [v14 approvalRequestsMatchingUniqueIdentifier:v6];
LABEL_13:
    id v19 = (void *)v16;

    goto LABEL_19;
  }
  id v17 = +[APLogConfig sharedDaemonConfig];
  if (!v17)
  {
    id v17 = +[APLogConfig sharedConfig];
  }
  id v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
LABEL_17:
    id v20 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v40 = v20;
    __int16 v41 = 2114;
    id v42 = v11;
    id v21 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Falling back to UserDefaults. Error: %{public}@", buf, 0x16u);
  }
LABEL_18:

  uint64_t v15 = v6;
  id v19 = [(ConnectionReceiver *)self _getMatchingRequestsViaUserDefaultsCheckWithIdentifier:v6];
LABEL_19:
  id v22 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v19 count]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v19;
  id v24 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v34;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [*(id *)(*((void *)&v33 + 1) + 8 * i) compile];
        [v22 addObject:v28];
      }
      id v25 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }

  if (v7)
  {
    v29 = +[NSArray arrayWithArray:v22];
    v30 = objc_msgSend(v11, "ams_sanitizedForSecureCoding");
    v7[2](v7, v29, v30);
  }
}

- (id)_getMatchingRequestsViaUserDefaultsCheckWithIdentifier:(id)a3
{
  id v3 = a3;
  if (!+[APDefaults isApprover])
  {
    unsigned int v9 = +[APDefaults isRequester];
    uint64_t v10 = +[APLogConfig sharedDaemonConfig];
    id v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        id v11 = +[APLogConfig sharedConfig];
      }
      BOOL v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v25 = 138543362;
        *(void *)&v25[4] = objc_opt_class();
        id v13 = *(id *)&v25[4];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: User Defaults says I am Requester", v25, 0xCu);
      }
      id v7 = +[RequesterStore sharedStore];
      uint64_t v8 = [v7 requestsMatchingUniqueIdentifier:v3];
      goto LABEL_13;
    }
    if (!v10)
    {
      id v11 = +[APLogConfig sharedConfig];
    }
    uint64_t v15 = [v11 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v25 = 138543362;
      *(void *)&v25[4] = objc_opt_class();
      id v16 = *(id *)&v25[4];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: User Defaults NOT SET - checking both stores", v25, 0xCu);
    }
    id v17 = +[ApproverStore sharedStore];
    uint64_t v14 = [v17 approvalRequestsMatchingUniqueIdentifier:v3];

    if (v14)
    {
      id v7 = +[APLogConfig sharedDaemonConfig];
      if (!v7)
      {
        id v7 = +[APLogConfig sharedConfig];
      }
      id v18 = objc_msgSend(v7, "OSLogObject", *(_OWORD *)v25);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      id v19 = objc_opt_class();
      *(_DWORD *)id v25 = 138543362;
      *(void *)&v25[4] = v19;
      id v20 = v19;
      id v21 = "%{public}@: Found request in Approver Storage";
    }
    else
    {
      id v22 = +[RequesterStore sharedStore];
      uint64_t v14 = [v22 requestsMatchingUniqueIdentifier:v3];

      if (!v14) {
        goto LABEL_31;
      }
      id v7 = +[APLogConfig sharedDaemonConfig];
      if (!v7)
      {
        id v7 = +[APLogConfig sharedConfig];
      }
      id v18 = objc_msgSend(v7, "OSLogObject", *(_OWORD *)v25);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      id v23 = objc_opt_class();
      *(_DWORD *)id v25 = 138543362;
      *(void *)&v25[4] = v23;
      id v20 = v23;
      id v21 = "%{public}@: Found request in Requester Storage";
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v21, v25, 0xCu);

LABEL_29:
    goto LABEL_30;
  }
  v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    v4 = +[APLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v25 = 138543362;
    *(void *)&v25[4] = objc_opt_class();
    id v6 = *(id *)&v25[4];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: User Defaults says I am Approver", v25, 0xCu);
  }
  id v7 = +[ApproverStore sharedStore];
  uint64_t v8 = [v7 approvalRequestsMatchingUniqueIdentifier:v3];
LABEL_13:
  uint64_t v14 = (void *)v8;
LABEL_30:

LABEL_31:
  return v14;
}

- (void)didReceiveStorePushNotificationWithPayload:(id)a3
{
  id v3 = a3;
  v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    v4 = +[APLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v3;
    id v6 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received store push notification. Payload: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = +[RemoteNotificationHandler sharedHandler];
  [v7 handleLegacyStoreNotificationPayload:v3];
}

- (NSXPCListener)connectionListener
{
  return self->_connectionListener;
}

- (void)setConnectionListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end