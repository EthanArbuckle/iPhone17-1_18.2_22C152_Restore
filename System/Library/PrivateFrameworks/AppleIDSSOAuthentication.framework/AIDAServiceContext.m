@interface AIDAServiceContext
+ (BOOL)accessInstanceVariablesDirectly;
+ (id)contextWithContext:(id)a3;
- (AASignInFlowControllerDelegate)aaSignInFlowControllerDelegate;
- (AASignOutFlowControllerDelegate)aaSignOutFlowControllerDelegate;
- (AIDAServiceContext)init;
- (BOOL)shouldForceOperation;
- (CDPStateUIProvider)cdpUiProvider;
- (NSDictionary)authenticationResults;
- (NSDictionary)signInContexts;
- (NSDictionary)signOutContexts;
- (NSMutableDictionary)_telemetryTimeSeries;
- (UIViewController)viewController;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)operationUIPermissions;
@end

@implementation AIDAServiceContext

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)contextWithContext:(id)a3
{
  v4 = (id *)a3;
  id v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4[1] copy];
  v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  objc_storeStrong((id *)v5 + 4, v4[4]);
  *((unsigned char *)v5 + 16) = *((unsigned char *)v4 + 16);
  *((void *)v5 + 3) = v4[3];
  uint64_t v8 = [v4[7] copy];
  v9 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v8;

  uint64_t v10 = [v4[8] copy];
  v11 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v10;

  objc_storeStrong((id *)v5 + 5, v4[5]);
  objc_storeStrong((id *)v5 + 6, v4[6]);
  id WeakRetained = objc_loadWeakRetained(v4 + 9);
  objc_storeWeak((id *)v5 + 9, WeakRetained);

  uint64_t v13 = [v4[10] mutableCopy];
  v14 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v13;

  return v5;
}

- (AIDAServiceContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)AIDAServiceContext;
  v2 = [(AIDAServiceContext *)&v7 init];
  v3 = v2;
  if (v2)
  {
    authenticationResults = v2->_authenticationResults;
    v2->_authenticationResults = 0;

    viewController = v3->_viewController;
    v3->_viewController = 0;

    v3->_shouldForceOperation = 0;
    v3->_operationUIPermissions = 0;
  }
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (BOOL)shouldForceOperation
{
  return self->_shouldForceOperation;
}

- (int64_t)operationUIPermissions
{
  return self->_operationUIPermissions;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (NSDictionary)signInContexts
{
  return self->_signInContexts;
}

- (NSDictionary)signOutContexts
{
  return self->_signOutContexts;
}

- (AASignInFlowControllerDelegate)aaSignInFlowControllerDelegate
{
  return self->_aaSignInFlowControllerDelegate;
}

- (AASignOutFlowControllerDelegate)aaSignOutFlowControllerDelegate
{
  return self->_aaSignOutFlowControllerDelegate;
}

- (CDPStateUIProvider)cdpUiProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cdpUiProvider);

  return (CDPStateUIProvider *)WeakRetained;
}

- (NSMutableDictionary)_telemetryTimeSeries
{
  return self->__telemetryTimeSeries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__telemetryTimeSeries, 0);
  objc_destroyWeak((id *)&self->_cdpUiProvider);
  objc_storeStrong((id *)&self->_signOutContexts, 0);
  objc_storeStrong((id *)&self->_signInContexts, 0);
  objc_storeStrong((id *)&self->_aaSignOutFlowControllerDelegate, 0);
  objc_storeStrong((id *)&self->_aaSignInFlowControllerDelegate, 0);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_authenticationResults, 0);
}

@end