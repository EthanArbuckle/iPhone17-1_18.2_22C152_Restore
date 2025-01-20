@interface PKServiceSubcredentialMessageComposeViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (MFMessageComposeViewController)messageComposeViewController;
- (PKServiceSubcredentialMessageComposeViewController)init;
- (unint64_t)supportedInterfaceOrientations;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4;
- (void)setMessageComposeViewController:(id)a3;
- (void)setSharingRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation PKServiceSubcredentialMessageComposeViewController

- (PKServiceSubcredentialMessageComposeViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKServiceSubcredentialMessageComposeViewController;
  v2 = [(PKServiceSubcredentialMessageComposeViewController *)&v6 init];
  if (v2)
  {
    v3 = (MFMessageComposeViewController *)objc_alloc_init((Class)MFMessageComposeViewController);
    messageComposeViewController = v2->_messageComposeViewController;
    v2->_messageComposeViewController = v3;

    [(MFMessageComposeViewController *)v2->_messageComposeViewController setMessageComposeDelegate:v2];
  }
  return v2;
}

+ (id)_exportedInterface
{
  return (id)_PKServiceSubcredentialMessageComposeViewControllerExportedInterface(a1, a2);
}

+ (id)_remoteViewControllerInterface
{
  return (id)_PKRemoteSubcredentialMessageComposeViewControllerExportedInterface(a1, a2);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13.CGFloat width = width;
    v13.CGFloat height = height;
    v8 = NSStringFromCGSize(v13);
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2048;
    double v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v9, 0x16u);
  }
  PKSetDisplayProperties();
}

- (void)setSharingRequest:(id)a3 completionHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100001F78;
  v6[3] = &unk_100004118;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  +[PKSharingMessageExtensionMessageBuilder messageFromSharingRequest:a3 completionHandler:v6];
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  [a3 dismissViewControllerAnimated:1 completion:0];
  id v6 = [(PKServiceSubcredentialMessageComposeViewController *)self _remoteViewControllerProxy];
  [v6 messageComposeViewControllerDidFinishWithResult:a4 == 1];
}

- (MFMessageComposeViewController)messageComposeViewController
{
  return self->_messageComposeViewController;
}

- (void)setMessageComposeViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end