@interface MFMailComposeRemoteViewController
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (MFMailComposeRemoteViewControllerDelegate)delegate;
- (void)bodyFinishedDrawing;
- (void)serviceCompositionFinishedWithResult:(int64_t)a3 error:(id)a4;
- (void)serviceCompositionRequestsSendWithBody:(id)a3 recipients:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation MFMailComposeRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() requestViewController:@"ComposeServiceRemoteViewController" fromServiceWithBundleIdentifier:@"com.apple.MailCompositionService" connectionHandler:v3];

  return v4;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 domain];
    if ([v6 isEqualToString:*MEMORY[0x1E4FB3318]])
    {
      uint64_t v7 = [v5 code];

      if (v7 == 1) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#Warning %@", (uint8_t *)&v10, 0xCu);
    }
  }
LABEL_9:
  v9 = [(MFMailComposeRemoteViewController *)self delegate];
  [v9 compositionViewServiceTerminatedWithError:v5];
}

- (void)serviceCompositionFinishedWithResult:(int64_t)a3 error:(id)a4
{
  id v7 = a4;
  v6 = [(MFMailComposeRemoteViewController *)self delegate];
  [v6 compositionFinishedWithResult:a3 error:v7];
}

- (void)serviceCompositionRequestsSendWithBody:(id)a3 recipients:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [(MFMailComposeRemoteViewController *)self delegate];
  [v10 compositionRequestsSendWithBody:v11 recipients:v8 completion:v9];
}

- (void)bodyFinishedDrawing
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_MFMailComposeViewControllerFirstDrawNotification" object:self];
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E4F29280], "mf_mailComposeRemoteServiceInterface");
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E4F29280], "mf_mailComposeRemoteHostInterface");
}

- (MFMailComposeRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMailComposeRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end