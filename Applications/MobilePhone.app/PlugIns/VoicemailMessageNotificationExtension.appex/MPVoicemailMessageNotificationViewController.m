@interface MPVoicemailMessageNotificationViewController
- (CGRect)mediaPlayPauseButtonFrame;
- (MPVoicemailMessageNotificationViewController)init;
- (UIColor)mediaPlayPauseButtonTintColor;
- (id)playerControlsView;
- (unint64_t)mediaPlayPauseButtonType;
- (void)dealloc;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)mediaPause;
- (void)mediaPlay;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playerController:(id)a3 didChangeToCurrentTime:(float)a4;
- (void)viewDidLoad;
@end

@implementation MPVoicemailMessageNotificationViewController

- (MPVoicemailMessageNotificationViewController)init
{
  if ((id)+[CNContactStore authorizationStatusForEntityType:0] == (id)3)
  {
    v3 = objc_alloc_init((Class)CNContactStore);
    self = [(VMMessageViewController *)self initWithContactStore:v3];
  }
  else
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100040CE8(v3);
    }
  }

  return self;
}

- (id)playerControlsView
{
  v2 = [(VMMessageViewController *)self playerControlsViewController];
  v3 = [v2 playerControlsView];

  return v3;
}

- (void)dealloc
{
  v3 = [(VMMessageViewController *)self playerControlsViewController];
  v4 = [v3 playerControlsView];

  v5 = NSStringFromSelector("state");
  [v4 removeObserver:self forKeyPath:v5 context:&off_10005D330];

  v6.receiver = self;
  v6.super_class = (Class)MPVoicemailMessageNotificationViewController;
  [(VMMessageViewController *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = PHDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Received a key-value observing notification for key path (%@) object (%@).", (uint8_t *)&v21, 0x16u);
  }

  if (v9)
  {
    if (a6 == &off_10005D330)
    {
      id v12 = [v9 length];
      if (v10)
      {
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v10;
            v14 = [(VMMessageViewController *)self playerControlsViewController];
            v15 = [v14 playerControlsView];
            unsigned int v16 = [v13 isEqual:v15];

            if (!v16) {
              goto LABEL_16;
            }
            v17 = NSStringFromSelector("state");
            unsigned int v18 = [v9 isEqualToString:v17];

            if (!v18) {
              goto LABEL_16;
            }
            id v19 = [v13 state];
            if (v19 != (id)2)
            {
              if (v19 == (id)1)
              {
                v20 = [(MPVoicemailMessageNotificationViewController *)self extensionContext];
                [v20 mediaPlayingStarted];
                goto LABEL_15;
              }
              if (v19)
              {
LABEL_16:

                goto LABEL_17;
              }
            }
            v20 = [(MPVoicemailMessageNotificationViewController *)self extensionContext];
            [v20 mediaPlayingPaused];
LABEL_15:

            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_17:
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)MPVoicemailMessageNotificationViewController;
  [(VMMessageViewController *)&v9 viewDidLoad];
  v3 = [(VMMessageViewController *)self playerControlsViewController];
  v4 = [v3 playerControlsView];

  v5 = [(VMMessageViewController *)self playerControlsViewController];
  objc_super v6 = [v5 playerController];
  [v6 setDelegate:self];

  [v4 setStyle:1];
  v7 = [v4 playPauseButton];
  [v7 setHidden:1];

  v8 = NSStringFromSelector("state");
  [v4 addObserver:self forKeyPath:v8 options:0 context:&off_10005D330];
}

- (void)playerController:(id)a3 didChangeToCurrentTime:(float)a4
{
  objc_super v6 = [(MPVoicemailMessageNotificationViewController *)self playerControlsView];
  double v7 = a4;
  [v6 setElapsedTime:1 animated:v7];

  v8 = [(VMMessageViewController *)self voicemailMessage];
  if ([v8 shouldMarkAsReadForPlaybackCurrentTime:v7])
  {
    objc_super v9 = PHDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Marking current voicemail as read %@", buf, 0xCu);
    }

    id v10 = [(VMMessageViewController *)self voicemailManager];
    id v12 = v8;
    v11 = +[NSArray arrayWithObjects:&v12 count:1];
    [v10 markVoicemailsAsRead:v11 completion:&stru_10005D338];
  }
}

- (void)didReceiveNotification:(id)a3
{
  v4 = (MPMessageID *)a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received notification (%@).", buf, 0xCu);
  }

  objc_super v6 = [(MPMessageID *)v4 request];
  double v7 = [v6 content];
  v8 = [v7 userInfo];

  objc_super v9 = [v8 objectForKeyedSubscript:@"VMVoicemailIdentifier"];
  id v10 = [v8 objectForKeyedSubscript:@"voicemailRecordUUID"];
  v11 = PHDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Retrieving voicemail message matching the specified identifier (%@).", buf, 0xCu);
  }

  if (v9)
  {
    if (v10)
    {
      id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
      id v13 = [[MPMessageID alloc] initWithUuid:v12];
    }
    else
    {
      id v13 = [[MPMessageID alloc] initWithValue:(int)[(MPMessageID *)v9 intValue]];
      id v12 = objc_alloc_init((Class)VMVoicemailManager);
      v14 = [(VMMessageViewController *)self onVoicemailsChanged];
      v15 = +[PHVisualVoicemailManagerFactory getVisualVoiceMailWithVisualVoicemailManager:v12 onVoicemailsChanged:v14];
      [(VMMessageViewController *)self setVoicemailManager:v15];
    }
    unsigned int v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(VMMessageViewController *)self voicemailManager];
      *(_DWORD *)buf = 138412546;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Fetching voicemail for messageID (%@) using manager %@.", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    unsigned int v18 = [(VMMessageViewController *)self voicemailManager];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000564C;
    v19[3] = &unk_10005D388;
    objc_copyWeak(&v20, (id *)buf);
    [v18 voicemailWithIdentifier:v13 completion:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  objc_super v6 = a3;
  id v7 = a4;
  v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received notification response (%@).", buf, 0xCu);
  }

  objc_super v9 = [v6 actionIdentifier];
  id v10 = [v9 length];
  v11 = PHDefaultLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Executing action matching the specified identifier (%@).", buf, 0xCu);
    }

    if ([v9 isEqualToString:@"MPCallBulletinBoardActionIdentifier"])
    {
      id v13 = [v6 notification];
      v14 = [v13 request];
      v15 = [v14 content];
      unsigned int v16 = [v15 userInfo];

      v17 = [v16 objectForKeyedSubscript:@"TUDialRequestURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v18 = v17;
        id v19 = PHDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Constructing a URL from the specified string (%@).", buf, 0xCu);
        }

        id v20 = +[NSURL URLWithString:v18];
        int v21 = PHDefaultLog();
        id v22 = v21;
        if (v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v20;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Initiating outgoing call with the specified URL (%@).", buf, 0xCu);
          }

          __int16 v23 = [(MPVoicemailMessageNotificationViewController *)self extensionContext];
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_100005C68;
          v28[3] = &unk_10005D3B0;
          v29 = v7;
          [v23 openURL:v20 completionHandler:v28];

          id v22 = v29;
        }
        else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          sub_100040D2C((uint64_t)v18, v22);
        }
      }
      else
      {
        unsigned int v18 = PHDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100040DA4((uint64_t)v16, v18);
        }
      }

LABEL_27:
      goto LABEL_28;
    }
    if ([v9 isEqualToString:@"MPVoicemailDeleteMessageBulletinBoardActionIdentifier"])
    {
      unsigned int v16 = [(VMMessageViewController *)self voicemailMessage];
      id v24 = PHDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = [v16 identifier];
        *(_DWORD *)buf = 134217984;
        v32 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Trashing voicemail message matching the specified identifier (%lu).", buf, 0xCu);
      }
      v26 = [(VMMessageViewController *)self voicemailManager];
      v30 = v16;
      v27 = +[NSArray arrayWithObjects:&v30 count:1];
      [v26 trashVoicemails:v27 completion:&stru_10005D3D0];

      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
      goto LABEL_27;
    }
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Received notification response contains an empty or nil action identifier (%@).", buf, 0xCu);
    }

    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
LABEL_28:
}

- (CGRect)mediaPlayPauseButtonFrame
{
  v3 = [(VMMessageViewController *)self playerControlsViewController];
  v4 = [v3 playerControlsView];
  v5 = [v4 playPauseButton];

  if (v5)
  {
    objc_super v6 = [(MPVoicemailMessageNotificationViewController *)self view];
    id v7 = [v5 imageView];
    [v7 frame];
    [v6 convertRect:v5 fromView:];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
  }
  else
  {
    unsigned int v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100040E30((uint64_t)self, v16);
    }
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (UIColor)mediaPlayPauseButtonTintColor
{
  return +[UIColor systemBlueColor];
}

- (unint64_t)mediaPlayPauseButtonType
{
  return 1;
}

- (void)mediaPlay
{
  id v2 = [(VMMessageViewController *)self playerControlsViewController];
  [v2 play];
}

- (void)mediaPause
{
  id v2 = [(VMMessageViewController *)self playerControlsViewController];
  [v2 pause];
}

@end