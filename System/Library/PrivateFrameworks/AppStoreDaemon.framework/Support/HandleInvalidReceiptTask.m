@interface HandleInvalidReceiptTask
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation HandleInvalidReceiptTask

- (void)mainWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = *(id *)(&self->super._finished + 1);
  v6 = +[FBSSystemService sharedService];
  [v6 terminateApplication:v5 forReason:5 andReport:0 withDescription:@"StoreKit invalid receipt"];

  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(&self->super._finished + 1);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Terminated app with bundle identifier:%{public}@ due to invalid receipt.", (uint8_t *)&buf, 0xCu);
  }

  v9 = +[ApplicationProxy proxyForBundleID:*(void *)(&self->super._finished + 1)];
  v10 = v9;
  if (*(NSString **)((char *)&self->_bundleIdentifier + 2))
  {
    v11 = +[ASFReceipt receiptFromBundleAtURL:](ASFReceipt, "receiptFromBundleAtURL:");
  }
  else
  {
    v12 = [v9 bundleURL];
    v11 = +[ASFReceipt receiptFromBundleAtURL:v12];
  }
  v13 = [v11 expirationDate];
  v14 = +[NSDate date];
  id v15 = [v13 compare:v14];

  if (v10)
  {
    v16 = [v10 localizedName];
    v17 = [v10 vendorName];
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v10 storeItemID]);
    BOOL v19 = (uint64_t)[v10 storeItemID] > 0;
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    BOOL v19 = 1;
  }
  if ((![v11 isVPPLicensed] || (objc_msgSend(v11, "isRevoked") & 1) == 0)
    && (![v11 isVPPLicensed] || v15 != (id)-1))
  {
    v4[2](v4, 0);
    goto LABEL_23;
  }
  v41 = v18;
  if (!v16)
  {
    v37 = ASDLocalizedString();
    if (v17) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v22 = ASDLocalizedString();
    goto LABEL_19;
  }
  v20 = ASDLocalizedString();
  v37 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v16);

  if (!v17) {
    goto LABEL_18;
  }
LABEL_15:
  v21 = ASDLocalizedString();
  uint64_t v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v17);

LABEL_19:
  v39 = v17;
  v40 = v16;
  if (v19)
  {
    v23 = +[NSString stringWithFormat:@"itms-apps:///app/%@", v41];
    v24 = +[NSURL URLWithString:v23];
  }
  else
  {
    v24 = +[NSURL URLWithString:@"itms-appss://?action=software"];
  }
  id v25 = v24;
  v26 = v4;
  v27 = (void *)v22;
  v28 = +[AMSDialogRequest requestWithTitle:v37 message:v22];
  ASDLocalizedString();
  v29 = v38 = v4;
  v30 = +[AMSDialogAction actionWithTitle:v29 identifier:@"InvalidReceiptPromptOKAction"];

  v31 = ASDLocalizedString();
  v32 = +[AMSDialogAction actionWithTitle:v31 identifier:@"InvalidReceiptPromptCancelAction"];

  [v28 addButtonAction:v30];
  [v28 addButtonAction:v32];

  id v33 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v28];
  v34 = [v33 present];
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  v43 = sub_1003BED3C;
  v44 = &unk_10052BD48;
  v35 = v26;
  id v46 = v35;
  id v36 = v25;
  id v45 = v36;
  [v34 addFinishBlock:&buf];

  v4 = v38;
  v17 = v39;
  v16 = v40;
  v18 = v41;
LABEL_23:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_bundleIdentifier + 2), 0);
  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

@end