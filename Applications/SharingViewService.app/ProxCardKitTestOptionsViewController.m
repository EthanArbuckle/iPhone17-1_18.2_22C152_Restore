@interface ProxCardKitTestOptionsViewController
- (ProxCardKitTestOptionsViewController)initWithContentView:(id)a3;
@end

@implementation ProxCardKitTestOptionsViewController

- (ProxCardKitTestOptionsViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ProxCardKitTestOptionsViewController;
  v5 = [(ProxCardKitTestOptionsViewController *)&v17 initWithContentView:v4];
  v6 = v5;
  if (v5)
  {
    [(ProxCardKitTestOptionsViewController *)v5 setDismissalType:1];
    [(ProxCardKitTestOptionsViewController *)v6 setTitle:@"Select A Chime"];
    [(ProxCardKitTestOptionsViewController *)v6 setSubtitle:@"Tap a sound to hear it."];
    [(ProxCardKitTestOptionsViewController *)v6 setOptions:&off_1001A7298];
    id location = 0;
    objc_initWeak(&location, v6);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_100129D0C;
    v14 = &unk_1001A19A0;
    objc_copyWeak(&v15, &location);
    v7 = +[PRXAction actionWithTitle:@"Continue" style:0 handler:&v11];
    id v8 = -[ProxCardKitTestOptionsViewController addAction:](v6, "addAction:", v7, v11, v12, v13, v14);

    v9 = v6;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

@end