@interface AKAuthorizationNotificationService
+ (id)_sharedService;
+ (void)startServiceWithNotificationHandler:(id)a3;
+ (void)startServiceWithStateBroadcastHandler:(id)a3;
- (AKAuthorizationNotificationService)init;
- (AKAuthorizationNotificationService)initWithDaemonXPCEndpoint:(id)a3;
- (void)_configureNotificationServiceWithCompletion:(id)a3;
- (void)_configureStateBroadcastServiceWithCompletion:(id)a3;
- (void)startWithNotificationHandler:(id)a3 completion:(id)a4;
- (void)startWithStateBroadcastHandler:(id)a3 completion:(id)a4;
@end

@implementation AKAuthorizationNotificationService

- (AKAuthorizationNotificationService)init
{
  return [(AKAuthorizationNotificationService *)self initWithDaemonXPCEndpoint:0];
}

- (AKAuthorizationNotificationService)initWithDaemonXPCEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationNotificationService;
  v6 = [(AKAuthorizationNotificationService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_daemonEndpoint, a3);
  }

  return v7;
}

+ (id)_sharedService
{
  if (_sharedService_onceToken != -1) {
    dispatch_once(&_sharedService_onceToken, &__block_literal_global_47);
  }
  v2 = (void *)_sharedService_sharedService;

  return v2;
}

uint64_t __52__AKAuthorizationNotificationService__sharedService__block_invoke()
{
  _sharedService_sharedService = objc_alloc_init(AKAuthorizationNotificationService);

  return MEMORY[0x1F41817F8]();
}

+ (void)startServiceWithNotificationHandler:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedService];
  [v5 startWithNotificationHandler:v4 completion:0];
}

+ (void)startServiceWithStateBroadcastHandler:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedService];
  [v5 startWithStateBroadcastHandler:v4 completion:0];
}

- (void)startWithNotificationHandler:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = +[AKAuthorizationNotificationHandlerInterface XPCInterface];
  objc_super v9 = [[AKAdaptiveService alloc] initWithInterface:v8 strongObject:v6];
  service = self->_service;
  self->_service = v9;

  v11 = self->_service;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__AKAuthorizationNotificationService_startWithNotificationHandler_completion___block_invoke;
  v13[3] = &unk_1E5761F08;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v14 = v12;
  [(AKAdaptiveService *)v11 setInvalidationHandler:v13];
  [(AKAdaptiveService *)self->_service resume];
  [(AKAuthorizationNotificationService *)self _configureNotificationServiceWithCompletion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __78__AKAuthorizationNotificationService_startWithNotificationHandler_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _configureNotificationServiceWithCompletion:*(void *)(a1 + 32)];
}

- (void)startWithStateBroadcastHandler:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = +[AKAuthorizationStateBroadcastHandlerInterface XPCInterface];
  objc_super v9 = [[AKAdaptiveService alloc] initWithInterface:v8 strongObject:v6];
  service = self->_service;
  self->_service = v9;

  v11 = self->_service;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__AKAuthorizationNotificationService_startWithStateBroadcastHandler_completion___block_invoke;
  v13[3] = &unk_1E5761F08;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v14 = v12;
  [(AKAdaptiveService *)v11 setInvalidationHandler:v13];
  [(AKAdaptiveService *)self->_service resume];
  [(AKAuthorizationNotificationService *)self _configureStateBroadcastServiceWithCompletion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __80__AKAuthorizationNotificationService_startWithStateBroadcastHandler_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _configureStateBroadcastServiceWithCompletion:*(void *)(a1 + 32)];
}

- (void)_configureNotificationServiceWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [[AKAuthorizationController alloc] initWithDaemonXPCEndpoint:self->_daemonEndpoint];
  id v5 = [(AKAdaptiveService *)self->_service listenerEndpoint];
  [(AKAuthorizationController *)v6 establishConnectionWithNotificationHandlerEndpoint:v5 completion:v4];
}

- (void)_configureStateBroadcastServiceWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [[AKAuthorizationController alloc] initWithDaemonXPCEndpoint:self->_daemonEndpoint];
  id v5 = [(AKAdaptiveService *)self->_service listenerEndpoint];
  [(AKAuthorizationController *)v6 establishConnectionWithStateBroadcastHandlerEndpoint:v5 completion:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonEndpoint, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end