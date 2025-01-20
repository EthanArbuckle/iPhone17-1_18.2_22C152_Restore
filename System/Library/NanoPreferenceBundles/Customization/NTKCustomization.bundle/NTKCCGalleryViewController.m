@interface NTKCCGalleryViewController
- (NTKCCGalleryViewController)init;
- (_NTKCCGalleryViewController)galleryViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)_performFaceGalleryScrollTestNamed:(id)a3 iterations:(int)a4;
- (void)navigateToRowContainingBundleIdentifier:(id)a3;
- (void)navigateToRowContainingWhatsNew;
- (void)openFaceDetailForFaceWithBundleIdentifier:(id)a3;
@end

@implementation NTKCCGalleryViewController

- (NTKCCGalleryViewController)init
{
  v3 = (_NTKCCGalleryViewController *)objc_opt_new();
  galleryViewController = self->_galleryViewController;
  self->_galleryViewController = v3;
  v5 = v3;

  v8.receiver = self;
  v8.super_class = (Class)NTKCCGalleryViewController;
  v6 = [(NTKCCGalleryViewController *)&v8 initWithRootViewController:v5];

  return v6;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (PSIsN56()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)_performFaceGalleryScrollTestNamed:(id)a3 iterations:(int)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_EAD0;
  block[3] = &unk_24BF0;
  block[4] = self;
  id v7 = a3;
  int v8 = a4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)navigateToRowContainingBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKCCGalleryViewController *)self galleryViewController];
  [v5 _navigateToRowContainingBundleIdentifier:v4];
}

- (void)openFaceDetailForFaceWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[CLKDevice currentDevice];
  [(NTKCCGalleryViewController *)self navigateToRowContainingBundleIdentifier:v4];
  v6 = +[NTKFaceBundleManager sharedManager];
  id v7 = [v6 faceBundleForBundleIdentifier:v4 onDevice:v5];

  if (v7)
  {
    int v8 = [v7 galleryFacesForDevice:v5];
    v9 = [v8 firstObject];

    if (!v9)
    {
      v9 = [v7 defaultFaceForDevice:v5];
    }
    v10 = [v9 addFaceDetailViewController];
    [(NTKCCGalleryViewController *)self pushViewController:v10 animated:0];
  }
  else
  {
    v11 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_14BE4((uint64_t)v4, v11);
    }
  }
}

- (void)navigateToRowContainingWhatsNew
{
  id v2 = [(NTKCCGalleryViewController *)self galleryViewController];
  [v2 _navigateToRowContainingWhatsNew];
}

- (_NTKCCGalleryViewController)galleryViewController
{
  return self->_galleryViewController;
}

- (void).cxx_destruct
{
}

@end