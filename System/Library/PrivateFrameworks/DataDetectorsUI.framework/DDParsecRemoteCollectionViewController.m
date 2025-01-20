@interface DDParsecRemoteCollectionViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (DDParsecHostVCInterface)hostSideDelegate;
- (void)getStatusBarHidden:(id)a3;
- (void)interactionEnded;
- (void)interactionEndedWithPunchout:(BOOL)a3;
- (void)loadReportAnIssueImage:(id)a3;
- (void)openParsecURL:(id)a3;
- (void)openTrailerPunchout:(id)a3;
- (void)performClientQueryWithServerAccessPermitted:(BOOL)a3 localSearchPermitted:(BOOL)a4;
- (void)performClientTextQueryWithTerm:(id)a3 queryId:(unint64_t)a4 sessionId:(id)a5 userAgent:(id)a6 reply:(id)a7;
- (void)remoteVCIsReady;
- (void)reportAnIssueWithReportIdentifier:(id)a3 sfReportData:(id)a4;
- (void)setHostSideDelegate:(id)a3;
- (void)showingErrorView:(BOOL)a3;
- (void)showingFTE:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation DDParsecRemoteCollectionViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

+ (id)serviceViewControllerInterface
{
  return _ddui_parsec_xpcInterface(1);
}

+ (id)exportedInterface
{
  return _ddui_parsec_xpcInterface(0);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDParsecRemoteCollectionViewController viewServiceDidTerminateWithError:](v4);
  }
  [(DDParsecRemoteCollectionViewController *)self interactionEndedWithPunchout:0];
  v5.receiver = self;
  v5.super_class = (Class)DDParsecRemoteCollectionViewController;
  [(_UIRemoteViewController *)&v5 viewServiceDidTerminateWithError:v4];
}

- (void)interactionEnded
{
}

- (void)interactionEndedWithPunchout:(BOOL)a3
{
  if (!self->_receivedInteractionDidFinish)
  {
    BOOL v3 = a3;
    self->_receivedInteractionDidFinish = 1;
    id v4 = [(DDParsecRemoteCollectionViewController *)self hostSideDelegate];
    [v4 interactionEndedWithPunchout:v3];
  }
}

- (void)reportAnIssueWithReportIdentifier:(id)a3 sfReportData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DDParsecRemoteCollectionViewController *)self hostSideDelegate];
  [v8 reportAnIssueWithReportIdentifier:v7 sfReportData:v6];
}

- (void)loadReportAnIssueImage:(id)a3
{
  id v4 = a3;
  id v5 = [(DDParsecRemoteCollectionViewController *)self hostSideDelegate];
  [v5 loadReportAnIssueImage:v4];
}

- (void)showingErrorView:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__DDParsecRemoteCollectionViewController_showingErrorView___block_invoke;
  v3[3] = &unk_1E5A85530;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __59__DDParsecRemoteCollectionViewController_showingErrorView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hostSideDelegate];
  [v2 showingErrorView:*(unsigned __int8 *)(a1 + 40)];
}

- (void)showingFTE:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__DDParsecRemoteCollectionViewController_showingFTE___block_invoke;
  v3[3] = &unk_1E5A85530;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __53__DDParsecRemoteCollectionViewController_showingFTE___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hostSideDelegate];
  [v2 showingFTE:*(unsigned __int8 *)(a1 + 40)];
}

- (void)openParsecURL:(id)a3
{
  id v4 = a3;
  id v5 = [(DDParsecRemoteCollectionViewController *)self hostSideDelegate];
  [v5 openParsecURL:v4];
}

- (void)getStatusBarHidden:(id)a3
{
  id v4 = a3;
  id v5 = [(DDParsecRemoteCollectionViewController *)self hostSideDelegate];
  [v5 getStatusBarHidden:v4];
}

- (void)openTrailerPunchout:(id)a3
{
  id v4 = a3;
  id v5 = [(DDParsecRemoteCollectionViewController *)self hostSideDelegate];
  [v5 openTrailerPunchout:v4];
}

- (void)performClientQueryWithServerAccessPermitted:(BOOL)a3 localSearchPermitted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(DDParsecRemoteCollectionViewController *)self hostSideDelegate];
  [v6 performClientQueryWithServerAccessPermitted:v5 localSearchPermitted:v4];
}

- (void)performClientTextQueryWithTerm:(id)a3 queryId:(unint64_t)a4 sessionId:(id)a5 userAgent:(id)a6 reply:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [(DDParsecRemoteCollectionViewController *)self hostSideDelegate];
  [v16 performClientTextQueryWithTerm:v15 queryId:a4 sessionId:v14 userAgent:v13 reply:v12];
}

- (void)remoteVCIsReady
{
  id v2 = [(DDParsecRemoteCollectionViewController *)self hostSideDelegate];
  [v2 remoteVCIsReady];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (DDParsecHostVCInterface)hostSideDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostSideDelegate);
  return (DDParsecHostVCInterface *)WeakRetained;
}

- (void)setHostSideDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)viewServiceDidTerminateWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = [a1 code];
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "View service did terminate (reason:%ld)", (uint8_t *)&v1, 0xCu);
}

@end