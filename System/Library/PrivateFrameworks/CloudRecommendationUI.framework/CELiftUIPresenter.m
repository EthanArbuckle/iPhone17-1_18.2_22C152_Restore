@interface CELiftUIPresenter
- (BOOL)presentInViewController:(id)a3 animated:(BOOL)a4;
- (CELiftUIPresenter)initWithURL:(id)a3 account:(id)a4 data:(id)a5;
- (CELiftUIPresenterDelegate)delegate;
- (ICQLiftUIPresenter)liftUIPresenter;
- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5;
- (void)liftUIPresenterDidCancel:(id)a3 userInfo:(id)a4;
- (void)liftUIPresenterDidComplete:(id)a3 userInfo:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLiftUIPresenter:(id)a3;
@end

@implementation CELiftUIPresenter

- (CELiftUIPresenter)initWithURL:(id)a3 account:(id)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CELiftUIPresenter;
  v11 = [(CELiftUIPresenter *)&v17 init];
  if (v11)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v12 = (void *)getICQLiftUIPresenterClass_softClass;
    uint64_t v22 = getICQLiftUIPresenterClass_softClass;
    if (!getICQLiftUIPresenterClass_softClass)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __getICQLiftUIPresenterClass_block_invoke;
      v18[3] = &unk_265285CA0;
      v18[4] = &v19;
      __getICQLiftUIPresenterClass_block_invoke((uint64_t)v18);
      v12 = (void *)v20[3];
    }
    v13 = v12;
    _Block_object_dispose(&v19, 8);
    uint64_t v14 = [[v13 alloc] initWithURL:v8 account:v9 data:v10];
    liftUIPresenter = v11->_liftUIPresenter;
    v11->_liftUIPresenter = (ICQLiftUIPresenter *)v14;

    [(ICQLiftUIPresenter *)v11->_liftUIPresenter setDelegate:v11];
  }

  return v11;
}

- (BOOL)presentInViewController:(id)a3 animated:(BOOL)a4
{
  return [(ICQLiftUIPresenter *)self->_liftUIPresenter presentInViewController:a3 animated:a4];
}

- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CELiftUIPresenter *)self delegate];
  [v8 liftUIPresenterDidLoadWithSuccess:v5 error:v7];
}

- (void)liftUIPresenterDidComplete:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(CELiftUIPresenter *)self delegate];
  [v6 liftUIPresenterDidCompleteWithUserInfo:v5];
}

- (void)liftUIPresenterDidCancel:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(CELiftUIPresenter *)self delegate];
  [v6 liftUIPresenterDidCancelWithUserInfo:v5];
}

- (CELiftUIPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CELiftUIPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICQLiftUIPresenter)liftUIPresenter
{
  return self->_liftUIPresenter;
}

- (void)setLiftUIPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end