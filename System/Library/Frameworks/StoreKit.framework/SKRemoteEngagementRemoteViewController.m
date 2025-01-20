@interface SKRemoteEngagementRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SKEngagementPresenterProtocol)delegate;
- (void)engagementTaskDidFinishWithResult:(id)a3 resultData:(id)a4 error:(id)a5 completion:(id)a6;
- (void)preferredContentSizeDidChange:(CGSize)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SKRemoteEngagementRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08E2D88];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08E6110];
}

- (void)engagementTaskDidFinishWithResult:(id)a3 resultData:(id)a4 error:(id)a5 completion:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(SKRemoteEngagementRemoteViewController *)self delegate];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(SKRemoteEngagementRemoteViewController *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [(SKRemoteEngagementRemoteViewController *)self delegate];
      [v17 engagementTaskDidFinishWithResult:v18 resultData:v10 error:v11 completion:v12];
    }
  }
}

- (void)preferredContentSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(SKRemoteEngagementRemoteViewController *)self delegate];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(SKRemoteEngagementRemoteViewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(SKRemoteEngagementRemoteViewController *)self delegate];
      objc_msgSend(v10, "preferredContentSizeDidChange:", width, height);
    }
  }
}

- (SKEngagementPresenterProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKEngagementPresenterProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end