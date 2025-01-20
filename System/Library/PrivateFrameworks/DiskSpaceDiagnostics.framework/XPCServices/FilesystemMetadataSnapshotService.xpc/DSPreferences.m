@interface DSPreferences
+ (id)sharedPreferences;
- (DSPreferences)init;
- (void)refreshPreferences;
@end

@implementation DSPreferences

+ (id)sharedPreferences
{
  if (qword_10006A7D8 != -1) {
    dispatch_once(&qword_10006A7D8, &stru_100064B38);
  }
  v2 = (void *)qword_10006A7D0;

  return v2;
}

- (DSPreferences)init
{
  v19.receiver = self;
  v19.super_class = (Class)DSPreferences;
  v2 = [(DSPreferences *)&v19 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    int v18 = 0;
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_100014B24;
    v12 = &unk_100064B60;
    v14 = &v15;
    v4 = v2;
    v13 = v4;
    v5 = objc_retainBlock(&v9);
    v6 = (int *)(v16 + 3);
    id v7 = &_dispatch_main_q;
    notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", v6, (dispatch_queue_t)&_dispatch_main_q, v5);

    [(DSPreferences *)v4 refreshPreferences];
    _Block_object_dispose(&v15, 8);
  }
  return v3;
}

- (void)refreshPreferences
{
  v2 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Refreshing preferences", (uint8_t *)&v8, 2u);
  }

  v3 = +[NSDictionary dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/com.apple.FilesystemMetadataSnapshotService.plist"];
  v4 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Preferences (profile): %{public}@", (uint8_t *)&v8, 0xCu);
  }

  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 synchronize];
  v6 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 dictionaryRepresentation];
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Preferences (defaults): %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

@end