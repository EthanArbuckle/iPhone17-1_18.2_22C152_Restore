@interface CLBAlertPresenter
- (CLBAlertPresenter)initWithWindowScene:(id)a3;
- (id)alertWithToken:(int)a3;
- (void)addAlertFromDictionary:(id)a3 replyPort:(unsigned int)a4;
- (void)cancelAlert:(id)a3;
- (void)cancelAlertFromDictionary:(id)a3;
- (void)giveResponse:(int64_t)a3 toAlert:(id)a4;
- (void)showAlert:(id)a3;
- (void)showNextAlert;
@end

@implementation CLBAlertPresenter

- (CLBAlertPresenter)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLBAlertPresenter;
  v5 = [(CLBAlertPresenter *)&v13 init];
  if (v5)
  {
    v6 = [[CLBSecureWindow alloc] initWithWindowScene:v4];
    alertWindow = v5->_alertWindow;
    v5->_alertWindow = v6;

    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    alerts = v5->_alerts;
    v5->_alerts = v8;

    [(CLBSecureWindow *)v5->_alertWindow setOpaque:0];
    v10 = v5->_alertWindow;
    v11 = +[UIColor clearColor];
    [(CLBSecureWindow *)v10 setBackgroundColor:v11];

    [(CLBSecureWindow *)v5->_alertWindow setWindowLevel:UIWindowLevelAlert];
    [(CLBSecureWindow *)v5->_alertWindow setHidden:1];
  }

  return v5;
}

- (void)addAlertFromDictionary:(id)a3 replyPort:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [[CLBAlertViewController alloc] initFromDictionary:v6 replyPort:v4];
  [(NSMutableArray *)self->_alerts addObject:v7];
  objc_opt_class();
  v8 = [v6 objectForKey:@"AlertSource"];
  v9 = __UIAccessibilityCastAsClass();

  v21[0] = 0;
  objc_opt_class();
  v10 = [v6 objectForKey:@"SBUserNotificationExtensionIdentifier"];
  v11 = __UIAccessibilityCastAsClass();

  if (![v9 isEqualToString:@"findmydeviced"])
  {
    if ([v9 isEqualToString:@"locationd"])
    {
      if ([v11 isEqualToString:@"com.apple.corelocation.CoreLocationVanillaWhenInUseAuthPromptPlugin"])
      {
        v12 = CLFLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100100588(v12);
        }

        objc_super v13 = self;
        uint64_t v14 = 0;
        goto LABEL_8;
      }
      if ([v11 isEqualToString:@"com.apple.corelocation.CoreLocationRepromptAlwaysAuthPromptPlugin"])
      {
        v15 = CLFLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Recieved location reprompt alert. Cancel it for now.", v21, 2u);
        }

        v16 = [v7 otherTitleKey];
        unsigned int v17 = [v16 isEqualToString:@"LOCATION_CLIENT_PERMISSION_KEEP_ALWAYS_BUTTON"];

        if (v17)
        {
          objc_super v13 = self;
          uint64_t v14 = 2;
LABEL_8:
          -[CLBAlertPresenter giveResponse:toAlert:](v13, "giveResponse:toAlert:", v14, v7, *(void *)v21);
          goto LABEL_20;
        }
        v18 = [v7 alternateTitleKey];
        unsigned int v19 = [v18 isEqualToString:@"LOCATION_CLIENT_PERMISSION_KEEP_ALWAYS_BUTTON"];

        if (v19)
        {
          objc_super v13 = self;
          uint64_t v14 = 1;
          goto LABEL_8;
        }
      }
      v20 = CLFLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 138412290;
        *(void *)&v21[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received alert from source: %@. Canceling it", v21, 0xCu);
      }
    }
    -[CLBAlertPresenter cancelAlert:](self, "cancelAlert:", v7, *(void *)v21);
    goto LABEL_20;
  }
  [(CLBAlertPresenter *)self showAlert:v7];
LABEL_20:
}

- (id)alertWithToken:(int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_alerts;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "token", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)cancelAlertFromDictionary:(id)a3
{
  id v4 = [(CLBAlertPresenter *)self alertWithToken:+[CLBAlertViewController tokenFromDictionary:a3]];
  if (v4)
  {
    [(NSMutableArray *)self->_alerts removeObject:v4];
    [v4 cancel];
  }
  [(CLBAlertPresenter *)self showNextAlert];
}

- (void)showAlert:(id)a3
{
  if ((byte_1001810D8 & 1) == 0)
  {
    byte_1001810D8 = 1;
    alertWindow = self->_alertWindow;
    id v5 = a3;
    [(CLBSecureWindow *)alertWindow setRootViewController:v5];
    [(CLBSecureWindow *)self->_alertWindow setHidden:0];
    [(CLBSecureWindow *)self->_alertWindow makeKeyWindow];
    [v5 sound];
    v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_10001FB44;
    v11 = &unk_10015CAD8;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    long long v13 = self;
    id v6 = v12;
    [v5 setCompletionBlock:&v8];
    objc_msgSend(v6, "playWithCompletion:", 0, v8, v9, v10, v11);
    uint64_t v7 = +[CLBIdleSleepManager sharedInstance];
    [v7 resetIdleTimerAndUndim:1];

    [(NSMutableArray *)self->_alerts removeObject:v5];
  }
}

- (void)giveResponse:(int64_t)a3 toAlert:(id)a4
{
  id v6 = a4;
  [(NSMutableArray *)self->_alerts removeObject:v6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FCA8;
  v7[3] = &unk_10015BEB8;
  v7[4] = self;
  [v6 setCompletionBlock:v7];
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      if (![v6 hasAlternateResponse]) {
        goto LABEL_6;
      }
      [v6 alternateResponse];
      break;
    case 2:
      if ([v6 hasOtherResponse]) {
        [v6 otherResponse];
      }
      else {
LABEL_6:
      }
        [v6 defaultResponse];
      break;
    case 3:
      [v6 cancel];
      break;
    default:
      break;
  }
}

- (void)cancelAlert:(id)a3
{
  alerts = self->_alerts;
  id v5 = a3;
  [(NSMutableArray *)alerts removeObject:v5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001FD58;
  v6[3] = &unk_10015BEB8;
  v6[4] = self;
  [v5 setCompletionBlock:v6];
  [v5 cancel];
}

- (void)showNextAlert
{
  if ([(NSMutableArray *)self->_alerts count])
  {
    id v4 = [(NSMutableArray *)self->_alerts lastObject];
    [(CLBAlertPresenter *)self showAlert:v4];
  }
  else
  {
    alertWindow = self->_alertWindow;
    [(CLBSecureWindow *)alertWindow setHidden:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alerts, 0);

  objc_storeStrong((id *)&self->_alertWindow, 0);
}

@end