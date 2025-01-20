@interface HandleInvalidReceiptTask
- (HandleInvalidReceiptTask)initWithClient:(id)a3 pid:(int)a4;
- (_TtC9storekitd6Client)client;
- (id)dialogRequestWithTitle:(id)a3 dialogMessage:(id)a4;
- (id)productURLForAppWithID:(id)a3;
- (int)pid;
- (void)_presentSystemDialogWithTitle:(id)a3 dialogMessage:(id)a4 actionURL:(id)a5;
- (void)main;
- (void)terminateClientApplication;
@end

@implementation HandleInvalidReceiptTask

- (HandleInvalidReceiptTask)initWithClient:(id)a3 pid:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HandleInvalidReceiptTask;
  v8 = [(Task *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)(v8 + 50), a3);
    *(_DWORD *)(v9 + 42) = a4;
  }

  return (HandleInvalidReceiptTask *)v9;
}

- (void)main
{
  [(HandleInvalidReceiptTask *)self terminateClientApplication];
  v3 = [(HandleInvalidReceiptTask *)self client];
  v4 = [v3 callerBundleURL];
  id v24 = +[ASFReceipt receiptFromBundleAtURL:v4];

  v5 = [v24 expirationDate];
  v6 = +[NSDate date];
  id v7 = [v5 compare:v6];

  v8 = [(HandleInvalidReceiptTask *)self client];
  v9 = [v8 localizedName];

  v10 = [(HandleInvalidReceiptTask *)self client];
  objc_super v11 = [v10 vendorName];

  v12 = [(HandleInvalidReceiptTask *)self client];
  v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 storeItemID]);
  v14 = [v13 stringValue];

  v15 = [(HandleInvalidReceiptTask *)self client];
  id v16 = [v15 storeItemID];

  if ([v24 isVPPLicensed] && (objc_msgSend(v24, "isRevoked") & 1) != 0
    || [v24 isVPPLicensed] && v7 == (id)-1)
  {
    v17 = +[NSBundle bundleWithIdentifier:@"com.apple.AppStoreDaemon"];
    if (v9)
    {
      v18 = [v17 localizedStringForKey:@"RECEIPT_REVOKED_TITLE" value:&stru_10036C970 table:0];
      v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v9);
    }
    else
    {
      v19 = [v17 localizedStringForKey:@"RECEIPT_REVOKED_FALLBACK_TITLE" value:&stru_10036C970 table:0];
    }

    v20 = +[NSBundle bundleWithIdentifier:@"com.apple.AppStoreDaemon"];
    if (v11)
    {
      v21 = [v20 localizedStringForKey:@"RECEIPT_REVOKED_MESSAGE" value:&stru_10036C970 table:0];
      v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v11);
    }
    else
    {
      v22 = [v20 localizedStringForKey:@"RECEIPT_REVOKED_FALLBACK_MESSAGE" value:&stru_10036C970 table:0];
    }

    if (v16) {
      [(HandleInvalidReceiptTask *)self productURLForAppWithID:v14];
    }
    else {
    v23 = +[NSURL URLWithString:@"itms-appss://?action=software"];
    }
    [(HandleInvalidReceiptTask *)self _presentSystemDialogWithTitle:v19 dialogMessage:v22 actionURL:v23];
  }
  else
  {
    [(AsyncTask *)self completeWithSuccess];
  }
}

- (id)dialogRequestWithTitle:(id)a3 dialogMessage:(id)a4
{
  v4 = +[AMSDialogRequest requestWithTitle:a3 message:a4];
  v5 = +[NSBundle bundleWithIdentifier:@"com.apple.AppStoreDaemon"];
  v6 = [v5 localizedStringForKey:@"VIEW_IN_APP_STORE" value:&stru_10036C970 table:0];
  id v7 = +[AMSDialogAction actionWithTitle:v6 identifier:@"InvalidReceiptPromptOKAction"];

  v8 = +[NSBundle bundleWithIdentifier:@"com.apple.AppStoreDaemon"];
  v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_10036C970 table:0];
  v10 = +[AMSDialogAction actionWithTitle:v9 identifier:@"InvalidReceiptPromptCancelAction"];

  [v4 addButtonAction:v7];
  [v4 addButtonAction:v10];

  return v4;
}

- (void)terminateClientApplication
{
  id v3 = [objc_alloc((Class)RBSTerminateContext) initWithExplanation:@"StoreKit invalid receipt"];
  v4 = +[RBSProcessIdentifier identifierWithPid:[(HandleInvalidReceiptTask *)self pid]];
  v5 = +[RBSProcessPredicate predicateMatchingIdentifier:v4];
  id v6 = [objc_alloc((Class)RBSTerminateRequest) initWithPredicate:v5 context:v3];
  id v14 = 0;
  unsigned __int8 v7 = [v6 execute:&v14];
  id v8 = v14;
  if (v7)
  {
    if (qword_1003A06F0 != -1) {
      dispatch_once(&qword_1003A06F0, &stru_10035A728);
    }
    v9 = (void *)qword_1003A06A8;
    if (os_log_type_enabled((os_log_t)qword_1003A06A8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_super v11 = [(HandleInvalidReceiptTask *)self client];
      v12 = [v11 callerBundleID];
      *(_DWORD *)buf = 138543362;
      id v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Terminated app with bundle identifier:%{public}@ for invalid receipt.", buf, 0xCu);
    }
  }
  else
  {
    if (qword_1003A06F0 != -1) {
      dispatch_once(&qword_1003A06F0, &stru_10035A728);
    }
    v13 = (void *)qword_1003A06A8;
    if (os_log_type_enabled((os_log_t)qword_1003A06A8, OS_LOG_TYPE_ERROR)) {
      sub_1002CA904(v13, self, (uint64_t)v8);
    }
  }
}

- (id)productURLForAppWithID:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"itms-apps:///app/%@", a3];
  v4 = +[NSURL URLWithString:v3];

  return v4;
}

- (void)_presentSystemDialogWithTitle:(id)a3 dialogMessage:(id)a4 actionURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(HandleInvalidReceiptTask *)self dialogRequestWithTitle:v8 dialogMessage:v9];
  id v12 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v11];
  objc_initWeak(&location, self);
  v13 = [v12 present];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100098B14;
  v15[3] = &unk_10035A708;
  objc_copyWeak(&v18, &location);
  id v14 = v10;
  id v16 = v14;
  v17 = self;
  [v13 addFinishBlock:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->_pid + 2);
}

- (int)pid
{
  return *(_DWORD *)(&self->super._finished + 1);
}

- (void).cxx_destruct
{
}

@end