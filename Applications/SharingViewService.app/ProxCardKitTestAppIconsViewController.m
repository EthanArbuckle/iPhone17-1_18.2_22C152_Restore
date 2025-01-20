@interface ProxCardKitTestAppIconsViewController
- (ProxCardKitTestAppIconsViewController)initWithContentView:(id)a3;
@end

@implementation ProxCardKitTestAppIconsViewController

- (ProxCardKitTestAppIconsViewController)initWithContentView:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)ProxCardKitTestAppIconsViewController;
  id v19 = a3;
  v3 = -[ProxCardKitTestAppIconsViewController initWithContentView:](&v23, "initWithContentView:");
  v4 = v3;
  if (v3)
  {
    [(ProxCardKitTestAppIconsViewController *)v3 setTitle:@"ProxCardKit Test"];
    [(ProxCardKitTestAppIconsViewController *)v4 setImageStyle:1];
    v18 = +[UIScreen mainScreen];
    [v18 scale];
    v5 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.MobileSMS", 2);
    v24[0] = v5;
    v6 = +[UIScreen mainScreen];
    [v6 scale];
    v7 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.reminders", 2);
    v24[1] = v7;
    if (SFIsDevicePhone()) {
      CFStringRef v8 = @"com.apple.mobilephone";
    }
    else {
      CFStringRef v8 = @"com.apple.mobilenotes";
    }
    v9 = +[UIScreen mainScreen];
    [v9 scale];
    v10 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v8, 2);
    v24[2] = v10;
    v11 = +[UIScreen mainScreen];
    [v11 scale];
    v12 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.mobilesafari", 2);
    v24[3] = v12;
    v13 = +[NSArray arrayWithObjects:v24 count:4];
    [(ProxCardKitTestAppIconsViewController *)v4 setImages:v13];

    [(ProxCardKitTestAppIconsViewController *)v4 setBodyText:@"Use this view to list apps such as Messages, Phone, Reminders, and more when setting up a device."];
    id location = 0;
    objc_initWeak(&location, v4);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100129B18;
    v20[3] = &unk_1001A19A0;
    objc_copyWeak(&v21, &location);
    v14 = +[PRXAction actionWithTitle:@"Next" style:0 handler:v20];
    id v15 = [(ProxCardKitTestAppIconsViewController *)v4 addAction:v14];

    v16 = v4;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v4;
}

@end