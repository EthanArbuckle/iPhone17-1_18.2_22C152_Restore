@interface SHMatchResultUserNotificationPayload
+ (id)notificationFromLegacyUserInfoFormat:(id)a3;
+ (id)payloadFromNotificationContentUserInfo:(id)a3;
+ (id)userInfoPayloadForMediaItem:(id)a3 bundleIdentifier:(id)a4;
- (NSString)bundleIdentifier;
- (SHMediaItem)mediaItem;
- (void)setBundleIdentifier:(id)a3;
- (void)setMediaItem:(id)a3;
@end

@implementation SHMatchResultUserNotificationPayload

+ (id)payloadFromNotificationContentUserInfo:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"com.apple.ShazamNotifications.user-info.payload"];
  if (v4)
  {
    id v11 = 0;
    id v5 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v4 error:&v11];
    id v6 = v11;
    if (v5)
    {
      v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"com.apple.ShazamNotifications.user-info.media-item"];
      v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"com.apple.ShazamNotifications.user-info.attribution"];
      v9 = objc_alloc_init(SHMatchResultUserNotificationPayload);
      [(SHMatchResultUserNotificationPayload *)v9 setMediaItem:v7];
      [(SHMatchResultUserNotificationPayload *)v9 setBundleIdentifier:v8];
    }
    else
    {
      v7 = sh_log_object();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v4;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to unarchive notification payload data %@ with error %@", buf, 0x16u);
      }
      v9 = 0;
    }
  }
  else
  {
    v9 = [(id)objc_opt_class() notificationFromLegacyUserInfoFormat:v3];
  }

  return v9;
}

+ (id)userInfoPayloadForMediaItem:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v7 encodeObject:v6 forKey:@"com.apple.ShazamNotifications.user-info.media-item"];

  [v7 encodeObject:v5 forKey:@"com.apple.ShazamNotifications.user-info.attribution"];
  v8 = [v7 encodedData];
  CFStringRef v11 = @"com.apple.ShazamNotifications.user-info.payload";
  v12 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  return v9;
}

+ (id)notificationFromLegacyUserInfoFormat:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"com.apple.ShazamNotifications.user-info.apple-music"];
  objc_opt_class();
  id v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4)
  {
    uint64_t v6 = +[NSURL URLWithString:v4];
    if (v6)
    {
      id v7 = (void *)v6;
      id v5 = objc_alloc_init(SHMatchResultUserNotificationPayload);
      v8 = [v3 objectForKeyedSubscript:@"com.apple.ShazamNotifications.user-info.attribution"];
      [(SHMatchResultUserNotificationPayload *)v5 setBundleIdentifier:v8];

      SHMediaItemProperty v12 = SHMediaItemAppleMusicURL;
      v13 = v7;
      v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      v10 = +[SHMediaItem mediaItemWithProperties:v9];
      [(SHMatchResultUserNotificationPayload *)v5 setMediaItem:v10];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (SHMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_mediaItem, 0);
}

@end