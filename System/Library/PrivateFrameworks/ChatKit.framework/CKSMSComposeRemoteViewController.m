@interface CKSMSComposeRemoteViewController
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (CKSMSComposeRemoteViewControllerDelegate)delegate;
- (id)_extensionBundleIdentifierForAppProtection;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)smsComposeControllerAppeared;
- (void)smsComposeControllerCancelled;
- (void)smsComposeControllerDataInserted;
- (void)smsComposeControllerEntryViewContentInserted;
- (void)smsComposeControllerSendStartedWithText:(id)a3 messageGUID:(id)a4;
- (void)smsComposeControllerShouldSendMessageWithText:(id)a3 toRecipients:(id)a4 completion:(id)a5;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation CKSMSComposeRemoteViewController

- (void)dealloc
{
  [(CKSMSComposeRemoteViewController *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CKSMSComposeRemoteViewController;
  [(_UIRemoteViewController *)&v3 dealloc];
}

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() requestViewController:@"CKSMSComposeViewServiceController" fromServiceWithBundleIdentifier:@"com.apple.mobilesms.compose" connectionHandler:v3];

  return v4;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v6 = a3;
  v4 = [(CKSMSComposeRemoteViewController *)self delegate];

  if (v4)
  {
    v5 = [(CKSMSComposeRemoteViewController *)self delegate];
    [v5 viewServiceDidTerminateWithError:v6];
  }
}

- (void)smsComposeControllerDataInserted
{
  id v2 = [(CKSMSComposeRemoteViewController *)self delegate];
  [v2 smsComposeControllerDataInserted];
}

- (void)smsComposeControllerAppeared
{
  id v2 = [(CKSMSComposeRemoteViewController *)self delegate];
  [v2 smsComposeControllerAppeared];
}

- (void)smsComposeControllerShouldSendMessageWithText:(id)a3 toRecipients:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKSMSComposeRemoteViewController *)self delegate];
  [v11 smsComposeControllerShouldSendMessageWithText:v10 toRecipients:v9 completion:v8];
}

- (void)smsComposeControllerSendStartedWithText:(id)a3 messageGUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKSMSComposeRemoteViewController *)self delegate];
  [v8 smsComposeControllerSendStartedWithText:v7 messageGUID:v6];
}

- (void)smsComposeControllerCancelled
{
  id v2 = [(CKSMSComposeRemoteViewController *)self delegate];
  [v2 smsComposeControllerCancelled];
}

- (void)smsComposeControllerEntryViewContentInserted
{
  id v2 = [(CKSMSComposeRemoteViewController *)self delegate];
  [v2 smsComposeControllerEntryViewContentInserted];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_extensionBundleIdentifierForAppProtection
{
  return @"com.apple.MobileSMS.MessagesNotificationExtension";
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE059FE0];
}

+ (id)serviceViewControllerInterface
{
  return +[CKSMSComposeViewServiceController _exportedInterface];
}

- (CKSMSComposeRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSMSComposeRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end