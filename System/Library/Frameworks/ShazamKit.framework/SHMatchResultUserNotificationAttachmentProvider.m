@interface SHMatchResultUserNotificationAttachmentProvider
+ (void)notificationAttachmentForMediaItem:(id)a3 completionHandler:(id)a4;
@end

@implementation SHMatchResultUserNotificationAttachmentProvider

+ (void)notificationAttachmentForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 artworkURL];

  if (v7)
  {
    v8 = [v5 artworkURL];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100048F80;
    v9[3] = &unk_1000761C8;
    id v11 = v6;
    id v10 = v5;
    +[SHMatchResultNotificationAttachmentProviderUtilities downloadImageURL:v8 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

@end