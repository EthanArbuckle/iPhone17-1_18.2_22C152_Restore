@interface DDPreviewExtensionViewController
- (void)addViewController:(id)a3;
- (void)prepareViewControllerWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation DDPreviewExtensionViewController

- (void)prepareViewControllerWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(DDPreviewExtensionViewController *)self _hostApplicationBundleIdentifier];
  [v7 setHostApplicationIdentifier:v8];

  v9 = [v7 actionClass];
  id v10 = [objc_alloc(NSClassFromString(v9)) initWithContext:v7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000069FC;
  block[3] = &unk_10000C4B0;
  id v14 = v10;
  v15 = self;
  id v16 = v6;
  id v11 = v6;
  id v12 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addViewController:(id)a3
{
  id v4 = a3;
  [(DDPreviewExtensionViewController *)self addChildViewController:v4];
  v5 = [(DDPreviewExtensionViewController *)self view];
  id v6 = [v4 view];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:v6];
  CFStringRef v10 = @"v";
  id v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v8 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[v]|" options:0 metrics:0 views:v7];
  [v5 addConstraints:v8];

  v9 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[v]|" options:0 metrics:0 views:v7];
  [v5 addConstraints:v9];
}

- (void).cxx_destruct
{
}

@end