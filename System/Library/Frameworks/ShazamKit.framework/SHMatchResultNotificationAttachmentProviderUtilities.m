@interface SHMatchResultNotificationAttachmentProviderUtilities
+ (void)downloadImageURL:(id)a3 completionHandler:(id)a4;
@end

@implementation SHMatchResultNotificationAttachmentProviderUtilities

+ (void)downloadImageURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSURLSession sharedSession];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001661C;
  v10[3] = &unk_1000752D8;
  id v11 = v5;
  id v8 = v5;
  v9 = [v7 downloadTaskWithURL:v6 completionHandler:v10];

  [v9 resume];
}

@end