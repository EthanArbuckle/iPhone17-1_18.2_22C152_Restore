@interface SHMatchResultUserNotificationCenterDelegate
- (SHMediaItemPresenter)mediaItemPresenter;
- (void)handleAppleMusicActionWithPayload:(id)a3 completionHandler:(id)a4;
- (void)handleDefaultActionWithPayload:(id)a3 completionHandler:(id)a4;
- (void)sendAnalyticsEvent:(id)a3 forBundleIdentifier:(id)a4 actionName:(id)a5;
- (void)setMediaItemPresenter:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation SHMatchResultUserNotificationCenterDelegate

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(void))a5;
  v9 = sh_log_object();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [v7 notification];
    v11 = [v10 request];
    v12 = [v7 notification];
    v13 = [v12 request];
    v14 = [v13 content];
    *(_DWORD *)buf = 138412802;
    id v30 = v7;
    __int16 v31 = 2112;
    v32 = v11;
    __int16 v33 = 2112;
    v34 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received notification response %@ for request %@ with content %@", buf, 0x20u);
  }
  v15 = [v7 notification];
  v16 = [v15 request];
  v17 = [v16 content];
  v18 = [v17 userInfo];
  v19 = +[SHMatchResultUserNotificationPayload payloadFromNotificationContentUserInfo:v18];

  v20 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.ShazamNotifications", @"apple-music-action"];
  v21 = [v7 actionIdentifier];
  LODWORD(v18) = [v21 isEqualToString:v20];

  if (v18)
  {
    uint64_t v22 = SHAnalyticsEventMusicRecognitionResultAction;
    v23 = [v19 bundleIdentifier];
    [(SHMatchResultUserNotificationCenterDelegate *)self sendAnalyticsEvent:v22 forBundleIdentifier:v23 actionName:@"apple-music-action"];

    [(SHMatchResultUserNotificationCenterDelegate *)self handleAppleMusicActionWithPayload:v19 completionHandler:v8];
  }
  else
  {
    v24 = [v7 actionIdentifier];
    unsigned int v25 = [v24 isEqualToString:UNNotificationDefaultActionIdentifier];

    if (v25)
    {
      uint64_t v26 = SHAnalyticsEventMusicRecognitionResultAction;
      v27 = [v19 bundleIdentifier];
      [(SHMatchResultUserNotificationCenterDelegate *)self sendAnalyticsEvent:v26 forBundleIdentifier:v27 actionName:SHAnalyticsActionNotificationTap];

      [(SHMatchResultUserNotificationCenterDelegate *)self handleDefaultActionWithPayload:v19 completionHandler:v8];
    }
    else
    {
      v28 = sh_log_object();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to handle notification action", buf, 2u);
      }

      v8[2](v8);
    }
  }
}

- (void)handleDefaultActionWithPayload:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v8 = [v6 mediaItem];

  if (v8)
  {
    v9 = [SHMediaItemPresenter alloc];
    v10 = [v6 bundleIdentifier];
    id v11 = [(SHMediaItemPresenter *)v9 initBundleIdentifier:v10];
    [(SHMatchResultUserNotificationCenterDelegate *)self setMediaItemPresenter:v11];

    v12 = sh_log_object();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = [v6 mediaItem];
      v14 = [v13 webURL];
      v15 = [v6 bundleIdentifier];
      *(_DWORD *)buf = 138412546;
      id v22 = v14;
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Presenting media item with web url %@ from bundle identifier %@", buf, 0x16u);
    }
    v16 = [(SHMatchResultUserNotificationCenterDelegate *)self mediaItemPresenter];
    v17 = [v6 mediaItem];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000488C;
    v19[3] = &unk_100074CA8;
    v20 = v7;
    [v16 presentMediaItem:v17 completionHandler:v19];
  }
  else
  {
    v18 = sh_log_object();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "No media item provided for payload %@", buf, 0xCu);
    }

    v7[2](v7);
  }
}

- (void)handleAppleMusicActionWithPayload:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [v5 mediaItem];
  v8 = [v7 appleMusicURL];

  if (v8)
  {
    v9 = +[LSApplicationWorkspace defaultWorkspace];
    v10 = [v5 mediaItem];
    id v11 = [v10 appleMusicURL];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004B04;
    v13[3] = &unk_100074CD0;
    v14 = v6;
    [v9 openURL:v11 configuration:0 completionHandler:v13];
  }
  else
  {
    v12 = sh_log_object();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No apple music url provided for payload %@", buf, 0xCu);
    }

    v6[2](v6);
  }
}

- (void)sendAnalyticsEvent:(id)a3 forBundleIdentifier:(id)a4 actionName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = +[NSMutableDictionary dictionary];
  [v11 setValue:v8 forKey:SHAnalyticsPayloadSourceKey];

  [v11 setValue:v7 forKey:SHAnalyticsPayloadActionKey];
  id v10 = [v11 copy];
  +[SHAnalytics sendEvent:v9 withPayload:v10];
}

- (SHMediaItemPresenter)mediaItemPresenter
{
  return self->_mediaItemPresenter;
}

- (void)setMediaItemPresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end