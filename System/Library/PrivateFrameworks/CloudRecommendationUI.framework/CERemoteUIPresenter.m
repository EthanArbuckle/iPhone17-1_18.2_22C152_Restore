@interface CERemoteUIPresenter
- (CERemoteUIPresenter)initWithAccount:(id)a3 presenter:(id)a4;
- (CERemoteUIPresenterDelegate)delegate;
- (ICQUIRemoteUIPresenter)remoteUIPresenter;
- (NSSet)dataclasses;
- (void)beginRUIFlowWithURL:(id)a3;
- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5;
- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4;
- (void)setDataclasses:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteUIPresenter:(id)a3;
@end

@implementation CERemoteUIPresenter

- (CERemoteUIPresenter)initWithAccount:(id)a3 presenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CERemoteUIPresenter;
  v8 = [(CERemoteUIPresenter *)&v14 init];
  if (v8)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v9 = (void *)getICQUIRemoteUIPresenterClass_softClass;
    uint64_t v19 = getICQUIRemoteUIPresenterClass_softClass;
    if (!getICQUIRemoteUIPresenterClass_softClass)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __getICQUIRemoteUIPresenterClass_block_invoke;
      v15[3] = &unk_265285CA0;
      v15[4] = &v16;
      __getICQUIRemoteUIPresenterClass_block_invoke((uint64_t)v15);
      v9 = (void *)v17[3];
    }
    v10 = v9;
    _Block_object_dispose(&v16, 8);
    uint64_t v11 = [[v10 alloc] initWithAccount:v6 presenter:v7];
    remoteUIPresenter = v8->_remoteUIPresenter;
    v8->_remoteUIPresenter = (ICQUIRemoteUIPresenter *)v11;

    [(ICQUIRemoteUIPresenter *)v8->_remoteUIPresenter setDelegate:v8];
  }

  return v8;
}

- (void)setDataclasses:(id)a3
{
}

- (void)beginRUIFlowWithURL:(id)a3
{
}

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CERemoteUIPresenter *)self delegate];
  [v10 remoteUIFlowManager:v9 didCompleteFlowWithSuccess:v5 error:v8];
}

- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CERemoteUIPresenter *)self delegate];
  [v8 remoteUIFlowManager:v7 didDismissWithError:v6];
}

- (NSSet)dataclasses
{
  return self->_dataclasses;
}

- (CERemoteUIPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CERemoteUIPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICQUIRemoteUIPresenter)remoteUIPresenter
{
  return self->_remoteUIPresenter;
}

- (void)setRemoteUIPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataclasses, 0);
}

@end