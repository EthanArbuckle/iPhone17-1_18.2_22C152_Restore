@interface PHImportAssetFilePresenter
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (NSURL)primaryPresentedItemURL;
- (PHImportAssetFilePresenter)initWithPrimaryURL:(id)a3 presentedURL:(id)a4;
@end

@implementation PHImportAssetFilePresenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_primaryPresentedItemURL, 0);

  objc_storeStrong((id *)&self->_presentedItemURL, 0);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)primaryPresentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (PHImportAssetFilePresenter)initWithPrimaryURL:(id)a3 presentedURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = [(PHImportAssetFilePresenter *)self init];
    v10 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_primaryPresentedItemURL, a3);
      objc_storeStrong((id *)&v10->_presentedItemURL, a4);
      uint64_t v12 = objc_opt_new();
      self = (PHImportAssetFilePresenter *)v10->_presentedItemOperationQueue;
      v10->_presentedItemOperationQueue = (NSOperationQueue *)v12;
    }
    else
    {
      self = 0;
    }
  }

  return v10;
}

@end