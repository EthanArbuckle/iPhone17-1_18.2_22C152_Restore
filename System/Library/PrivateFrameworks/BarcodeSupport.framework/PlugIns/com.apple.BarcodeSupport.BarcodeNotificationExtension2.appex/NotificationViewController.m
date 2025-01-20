@interface NotificationViewController
- (BOOL)_hasAnyPreviewableContent;
- (UILabel)label;
- (id)_launchURLForActionIdentifier:(id)a3;
- (id)_notificationServiceConnection;
- (int64_t)_previewContentType;
- (void)_showContentViewControllerIfNeeded;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)setLabel:(id)a3;
@end

@implementation NotificationViewController

- (BOOL)_hasAnyPreviewableContent
{
  return self->_defaultURL
      || self->_scannerResult
      || self->_icsString
      || self->_contact
      || self->_extraPreviewText != 0;
}

- (void)_showContentViewControllerIfNeeded
{
  if ([(NotificationViewController *)self _hasAnyPreviewableContent]
    && self->_contentIsPreviewable)
  {
    if (self->_extraPreviewText)
    {
      v3 = [[TextPreviewViewController alloc] initWithPreviewText:self->_extraPreviewText footerTitle:self->_previewFooterTitle footerSubtitle:self->_previewFooterSubtitle];
LABEL_11:
      v9 = [(TextPreviewViewController *)v3 view];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:1];
      [v9 setAutoresizingMask:18];
      v10 = [(NotificationViewController *)self view];
      [v10 bounds];
      double Width = CGRectGetWidth(v22);
      v12 = [(NotificationViewController *)self view];
      [v12 bounds];
      objc_msgSend(v9, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v23));

      if (self->_extraPreviewText)
      {
        v15 = _NSConcreteStackBlock;
        uint64_t v16 = 3221225472;
        v17 = sub_100005390;
        v18 = &unk_100008290;
        v19 = self;
        v20 = v3;
        +[UIView performWithoutAnimation:&v15];
      }
      -[NotificationViewController addChildViewController:](self, "addChildViewController:", v3, v15, v16, v17, v18, v19);
      v13 = [(NotificationViewController *)self view];
      [v13 addSubview:v9];

      [(TextPreviewViewController *)v3 didMoveToParentViewController:self];
      v14 = +[BCSAWDLogger sharedLogger];
      objc_msgSend(v14, "logBarcodePreviewedEventForContentType:", -[NotificationViewController _previewContentType](self, "_previewContentType"));

      return;
    }
    v4 = +[DDDetectionController sharedController];
    objc_msgSend(v4, "barcodePreviewActionForContext:URL:result:contact:ics:", 0, self->_defaultURL, -[DDScannerResult coreResult](self->_scannerResult, "coreResult"), self->_contact, self->_icsString);
    v5 = (DDPreviewAction *)objc_claimAutoreleasedReturnValue();
    previewAction = self->_previewAction;
    self->_previewAction = v5;

    v7 = self->_previewAction;
    if (v7)
    {
      v8 = [(DDPreviewAction *)v7 viewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 _setShowingLinkPreviewWithMinimalUI:1];
      }
      v3 = [[PreviewWithFooterViewController alloc] initWithPreviewViewController:v8 footerTitle:self->_previewFooterTitle footerSubtitle:self->_previewFooterSubtitle];

      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100005E40();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "NotificationViewController: the notification banner doesn't have any content that can be previewed!", buf, 2u);
  }
}

- (void)didReceiveNotification:(id)a3
{
  v4 = [a3 request];
  v5 = [v4 content];

  v6 = [v5 userInfo];
  v7 = [v6 objectForKey:BCSBarcodeNotificationPayloadURLKey];

  v8 = +[NSURL URLWithString:v7];
  defaultURL = self->_defaultURL;
  self->_defaultURL = v8;

  v10 = [v5 userInfo];
  v11 = [v10 objectForKey:BCSBarcodeNotificationPayloadKey];

  if (!v11)
  {
LABEL_6:
    [(NotificationViewController *)self _showContentViewControllerIfNeeded];
    goto LABEL_10;
  }
  id v42 = 0;
  id v12 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v11 error:&v42];
  id v13 = v42;
  v14 = v13;
  if (v12)
  {
    v41 = v13;
    v15 = [v12 decodeObjectOfClass:objc_opt_class() forKey:BCSBarcodeNotificationPayloadURLKey];
    uint64_t v16 = self->_defaultURL;
    self->_defaultURL = v15;

    v17 = [v12 decodeObjectOfClass:objc_opt_class() forKey:BCSBarcodeNotificationPayloadScannerResultKey];
    scannerResult = self->_scannerResult;
    self->_scannerResult = v17;

    v19 = [v12 decodeObjectOfClass:objc_opt_class() forKey:BCSBarcodeNotificationPayloadICSStringKey];
    icsString = self->_icsString;
    self->_icsString = v19;

    v21 = [v12 decodeObjectOfClass:objc_opt_class() forKey:BCSBarcodeNotificationPayloadContactKey];
    contact = self->_contact;
    self->_contact = v21;

    CGRect v23 = [v12 decodeObjectOfClass:objc_opt_class() forKey:BCSBarcodeNotificationPayloadExtraPreviewText];
    extraPreviewText = self->_extraPreviewText;
    self->_extraPreviewText = v23;

    v25 = [v12 decodeObjectOfClass:objc_opt_class() forKey:BCSBarcodeNotificationPayloadPreviewFooterTitleKey];
    previewFooterTitle = self->_previewFooterTitle;
    self->_previewFooterTitle = v25;

    v27 = [v12 decodeObjectOfClass:objc_opt_class() forKey:BCSBarcodeNotificationPayloadPreviewFooterSubtitleKey];
    previewFooterSubtitle = self->_previewFooterSubtitle;
    self->_previewFooterSubtitle = v27;

    v29 = [v12 decodeObjectOfClass:objc_opt_class() forKey:BCSBarcodeNotificationPayloadContentIsPreviewableKey];
    self->_contentIsPreviewable = [v29 BOOLValue];
    uint64_t v30 = objc_opt_class();
    v31 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, objc_opt_class(), 0);
    v32 = [v12 decodeObjectOfClasses:v31 forKey:BCSBarcodeNotificationPayloadActionsKey];
    notificationActions = self->_notificationActions;
    self->_notificationActions = v32;

    v34 = self->_notificationActions;
    v35 = [(NotificationViewController *)self extensionContext];
    [v35 setNotificationActions:v34];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v36 = self->_defaultURL;
      v37 = self->_scannerResult;
      v38 = self->_icsString;
      v39 = self->_contact;
      v40 = self->_extraPreviewText;
      *(_DWORD *)buf = 138478851;
      v44 = v36;
      __int16 v45 = 2113;
      v46 = v37;
      __int16 v47 = 2113;
      v48 = v38;
      __int16 v49 = 2113;
      v50 = v39;
      __int16 v51 = 2113;
      v52 = v40;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "NotificationViewController: payload URL: %{private}@ scannerResult: %{private}@ icsString: %{private}@ contact: %{private}@ extraPreviewText: %{private}@", buf, 0x34u);
    }
    [v12 finishDecoding];

    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100005E88(v14);
  }

LABEL_10:
}

- (id)_notificationServiceConnection
{
  notificationServiceConnection = self->_notificationServiceConnection;
  if (!notificationServiceConnection)
  {
    v4 = (BCSNotificationServiceConnection *)objc_alloc_init((Class)BCSNotificationServiceConnection);
    v5 = self->_notificationServiceConnection;
    self->_notificationServiceConnection = v4;

    notificationServiceConnection = self->_notificationServiceConnection;
  }
  return notificationServiceConnection;
}

- (id)_launchURLForActionIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_notificationActions;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", (void)v13);
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = [v9 url];
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  v8 = [v6 actionIdentifier];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    long long v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "NotificationViewController: did receive notification response with action identifier %{public}@", buf, 0xCu);
  }
  v9 = [(NotificationViewController *)self _launchURLForActionIdentifier:v8];
  if (v9)
  {
    v10 = [(NotificationViewController *)self extensionContext];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005BB4;
    v12[3] = &unk_1000082B8;
    id v13 = v9;
    [v10 openURL:v13 completionHandler:v12];

    unsigned __int8 v11 = v13;
  }
  else
  {
    unsigned __int8 v11 = [(NotificationViewController *)self _notificationServiceConnection];
    [v11 didReceiveNotificationResponse:v6];
  }

  v7[2](v7, 1);
}

- (int64_t)_previewContentType
{
  if (self->_defaultURL) {
    return 0;
  }
  if (self->_scannerResult) {
    return 1;
  }
  if ([(NSString *)self->_icsString length]) {
    return 2;
  }
  if (self->_contact) {
    return 3;
  }
  if (self->_extraPreviewText) {
    return 4;
  }
  return 5;
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_notificationServiceConnection, 0);
  objc_storeStrong((id *)&self->_notificationActions, 0);
  objc_storeStrong((id *)&self->_previewFooterSubtitle, 0);
  objc_storeStrong((id *)&self->_previewFooterTitle, 0);
  objc_storeStrong((id *)&self->_extraPreviewText, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_icsString, 0);
  objc_storeStrong((id *)&self->_scannerResult, 0);
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_previewAction, 0);
}

@end