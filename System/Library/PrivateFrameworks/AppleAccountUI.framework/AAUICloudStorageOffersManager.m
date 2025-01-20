@interface AAUICloudStorageOffersManager
- (PSCloudStorageOffersManager)cloudStorageOffersManager;
- (id)completionHandler;
- (void)manager:(id)a3 didCompleteWithError:(id)a4;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)managerDidCancel:(id)a3;
- (void)presentCloudStorageOffersPageFromNavigationController:(id)a3 requiredStorageThreshold:(id)a4 completionHandler:(id)a5;
- (void)setCloudStorageOffersManager:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation AAUICloudStorageOffersManager

- (void)presentCloudStorageOffersPageFromNavigationController:(id)a3 requiredStorageThreshold:(id)a4 completionHandler:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  v9 = (objc_class *)MEMORY[0x263F5FB30];
  id v10 = a3;
  v11 = (PSCloudStorageOffersManager *)objc_alloc_init(v9);
  cloudStorageOffersManager = self->_cloudStorageOffersManager;
  self->_cloudStorageOffersManager = v11;

  [(PSCloudStorageOffersManager *)self->_cloudStorageOffersManager setDelegate:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v14 doubleValue];
    [(PSCloudStorageOffersManager *)self->_cloudStorageOffersManager setRequiredStorageThreshold:(unint64_t)v13];
  }
  [(AAUICloudStorageOffersManager *)self setCompletionHandler:v8];
  [(PSCloudStorageOffersManager *)self->_cloudStorageOffersManager beginFlowWithNavigationController:v10 modally:1];
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  completionHandler = (void (**)(id, void, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a4);
    id v6 = self->_completionHandler;
  }
  else
  {
    id v6 = 0;
  }
  self->_completionHandler = 0;

  cloudStorageOffersManager = self->_cloudStorageOffersManager;
  self->_cloudStorageOffersManager = 0;
}

- (void)managerDidCancel:(id)a3
{
  completionHandler = (void (**)(id, uint64_t, void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 1, 0);
    id v5 = self->_completionHandler;
  }
  else
  {
    id v5 = 0;
  }
  self->_completionHandler = 0;

  cloudStorageOffersManager = self->_cloudStorageOffersManager;
  self->_cloudStorageOffersManager = 0;
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  completionHandler = (void (**)(id, void, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a4);
    id v6 = self->_completionHandler;
  }
  else
  {
    id v6 = 0;
  }
  self->_completionHandler = 0;

  cloudStorageOffersManager = self->_cloudStorageOffersManager;
  self->_cloudStorageOffersManager = 0;
}

- (PSCloudStorageOffersManager)cloudStorageOffersManager
{
  return self->_cloudStorageOffersManager;
}

- (void)setCloudStorageOffersManager:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_cloudStorageOffersManager, 0);
}

@end