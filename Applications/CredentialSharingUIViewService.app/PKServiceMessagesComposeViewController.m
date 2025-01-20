@interface PKServiceMessagesComposeViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (MFMessageComposeViewController)messageComposeViewController;
- (PKServiceMessagesComposeViewController)init;
- (unint64_t)supportedInterfaceOrientations;
- (void)_hostApplicationDidEnterBackground;
- (void)loadView;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)setConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4;
- (void)setMessageComposeViewController:(id)a3;
- (void)setPartialShareInvite:(id)a3 completion:(id)a4;
- (void)setRecipientAddresses:(id)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation PKServiceMessagesComposeViewController

- (PKServiceMessagesComposeViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKServiceMessagesComposeViewController;
  v2 = [(PKServiceMessagesComposeViewController *)&v6 init];
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
  return (id)_PKServiceShareableCredentialsMessageComposeViewControllerExportedInterface(a1, a2);
}

+ (id)_remoteViewControllerInterface
{
  return (id)_PKRemoteShareableCredentialsMessageComposeViewControllerExportedInterface(a1, a2);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  v2.receiver = self;
  v2.super_class = (Class)PKServiceMessagesComposeViewController;
  [(PKServiceMessagesComposeViewController *)&v2 loadView];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKServiceMessagesComposeViewController;
  [(PKServiceMessagesComposeViewController *)&v4 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
}

- (void)_hostApplicationDidEnterBackground
{
  v2.receiver = self;
  v2.super_class = (Class)PKServiceMessagesComposeViewController;
  [(PKServiceMessagesComposeViewController *)&v2 _hostApplicationDidEnterBackground];
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

- (void)setRecipientAddresses:(id)a3
{
}

- (void)setConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messageComposeViewController = self->_messageComposeViewController;
  id v9 = objc_initWeak(&location, messageComposeViewController);
  [(MFMessageComposeViewController *)messageComposeViewController setRecipients:self->_recipientAddresses];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100001C10;
  v10[3] = &unk_100004150;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  +[PKSharingMessageExtensionMessageBuilder messageFromConfiguration:v6 completionHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setPartialShareInvite:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messageComposeViewController = self->_messageComposeViewController;
  id v9 = objc_initWeak(&location, messageComposeViewController);
  [(MFMessageComposeViewController *)messageComposeViewController setRecipients:self->_recipientAddresses];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100001DD0;
  v10[3] = &unk_100004150;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  +[PKSharingMessageExtensionMessageBuilder messageFromInvitation:v6 completionHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v5 = [(PKServiceMessagesComposeViewController *)self _remoteViewControllerProxy];
  [v5 messageComposeViewControllerDidFinishWithResult:a4 == 1];
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
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);

  objc_storeStrong((id *)&self->_recipientAddresses, 0);
}

@end