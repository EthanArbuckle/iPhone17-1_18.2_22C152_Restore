@interface _SWRemoveParticipantAlertRemoteController
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (_SWRemoveParticipantAlertRemoteControllerDelegate)delegate;
- (void)_promptToRemoveParticipant:(id)a3 fromHighlight:(id)a4 preferredStyle:(int64_t)a5;
- (void)dismissAlert;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _SWRemoveParticipantAlertRemoteController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  return (id)[a1 requestViewController:@"CKRemoveParticipantAlertServiceViewController" fromServiceWithBundleIdentifier:@"com.apple.mobilesms.compose" connectionHandler:a3];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v3 = [(_SWRemoveParticipantAlertRemoteController *)self delegate];
  [v3 dismissAlert];
}

- (void)_promptToRemoveParticipant:(id)a3 fromHighlight:(id)a4 preferredStyle:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v11 promptToRemoveParticipant:v12 fromHighlight:v8 usingPreferredStyle:a5];
  }
}

- (void)dismissAlert
{
  id v2 = [(_SWRemoveParticipantAlertRemoteController *)self delegate];
  [v2 dismissAlert];
}

+ (id)serviceViewControllerInterface
{
  if (serviceViewControllerInterface_onceToken != -1) {
    dispatch_once(&serviceViewControllerInterface_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)serviceViewControllerInterface_interface;

  return v2;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken[0] != -1) {
    dispatch_once(exportedInterface_onceToken, &__block_literal_global_7);
  }
  id v2 = (void *)exportedInterface_interface;

  return v2;
}

- (_SWRemoveParticipantAlertRemoteControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SWRemoveParticipantAlertRemoteControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end