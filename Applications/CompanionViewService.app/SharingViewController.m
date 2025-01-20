@interface SharingViewController
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SharingViewController

- (void)viewDidAppear:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SharingViewController;
  [(SharingViewController *)&v23 viewDidAppear:a3];
  v4 = [(SharingViewController *)self view];
  v5 = [v4 window];
  v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  v7 = [(BaseViewController *)self presentationContext];
  v8 = [v7 sharingData];

  if (v8)
  {
    v9 = [SharingItem alloc];
    v10 = [(BaseViewController *)self presentationContext];
    v11 = [v10 sharingData];
    v12 = [(SharingItem *)v9 initWithData:v11];

    id v13 = objc_alloc((Class)UIActivityViewController);
    v24 = v12;
    v14 = +[NSArray arrayWithObjects:&v24 count:1];
    id v15 = [v13 initWithActivityItems:v14 applicationActivities:0];

    objc_initWeak(&location, self);
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_100003DD4;
    v20 = &unk_10000C408;
    objc_copyWeak(&v21, &location);
    v16 = objc_retainBlock(&v17);
    [v15 setCompletionWithItemsHandler:v16, v17, v18, v19, v20];
    [(SharingViewController *)self presentViewController:v15 animated:1 completion:0];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = (SharingItem *)[objc_alloc((Class)UIActivityViewController) initWithActivityItems:&off_10000CAA8 applicationActivities:0];
    [(SharingViewController *)self presentViewController:v12 animated:1 completion:0];
  }
}

@end