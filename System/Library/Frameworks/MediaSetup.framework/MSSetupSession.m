@interface MSSetupSession
- (BOOL)startWithError:(NSError *)error;
- (MSServiceAccount)account;
- (MSSetupSession)initWithServiceAccount:(MSServiceAccount *)serviceAccount;
- (MSSetupSession)initWithServiceAccount:(id)a3 test:(unint64_t)a4;
- (MSSetupViewController)viewController;
- (id)presentationContext;
- (unint64_t)testFlags;
- (void)setPresentationContext:(id)presentationContext;
@end

@implementation MSSetupSession

- (MSSetupSession)initWithServiceAccount:(id)a3 test:(unint64_t)a4
{
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSSetupSession;
  v8 = [(MSSetupSession *)&v10 self];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a3);
    v8->_testFlags = a4;
  }

  return v8;
}

- (MSSetupSession)initWithServiceAccount:(MSServiceAccount *)serviceAccount
{
  return [(MSSetupSession *)self initWithServiceAccount:serviceAccount test:0];
}

- (BOOL)startWithError:(NSError *)error
{
  v5 = [[MSSetupViewController alloc] initWithServiceAccount:self->_account testFlags:self->_testFlags];
  viewController = self->_viewController;
  self->_viewController = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContext);
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_presentationContext);
    v9 = [v8 presentationAnchor];
  }
  else
  {
    objc_super v10 = [MEMORY[0x263F82438] sharedApplication];
    v8 = [v10 connectedScenes];

    v11 = objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global);
    v12 = [v11 windows];
    v9 = [v12 firstObject];
  }
  v13 = [v9 rootViewController];
  v14 = v13;
  if (v13)
  {
    [v13 presentViewController:self->_viewController animated:1 completion:0];
  }
  else
  {
    NSLog(&cfstr_NoViewControll.isa);
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.mediasetup.serviceonboarding.errorDomain" code:6 userInfo:0];
    }
  }

  return v14 != 0;
}

BOOL __33__MSSetupSession_startWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 activationState] == 0;
}

- (id)presentationContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContext);

  return WeakRetained;
}

- (void)setPresentationContext:(id)presentationContext
{
}

- (MSServiceAccount)account
{
  return self->_account;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (MSSetupViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_destroyWeak((id *)&self->_presentationContext);
}

@end