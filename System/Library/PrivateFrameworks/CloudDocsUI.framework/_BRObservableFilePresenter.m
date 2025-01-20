@interface _BRObservableFilePresenter
- (BRObservableFile)parent;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)presentedItemDidChange;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)presentedItemUbiquityDidChange;
- (void)setParent:(id)a3;
- (void)setPresentedItemOperationQueue:(id)a3;
- (void)setPresentedItemURL:(id)a3;
@end

@implementation _BRObservableFilePresenter

- (void)presentedItemDidChange
{
  id v2 = [(_BRObservableFilePresenter *)self parent];
  [v2 _presenterDidChange];
}

- (void)presentedItemUbiquityDidChange
{
  id v2 = [(_BRObservableFilePresenter *)self parent];
  [v2 _presenterDidChange];
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  [(_BRObservableFilePresenter *)self setPresentedItemURL:a3];
  id v4 = [(_BRObservableFilePresenter *)self parent];
  [v4 _presenterDidChange];
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  v5 = (void (**)(id, void))a3;
  [(_BRObservableFilePresenter *)self setPresentedItemURL:0];
  id v4 = [(_BRObservableFilePresenter *)self parent];
  [v4 _presenterDidChange];

  v5[2](v5, 0);
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPresentedItemURL:(id)a3
{
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPresentedItemOperationQueue:(id)a3
{
}

- (BRObservableFile)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (BRObservableFile *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);

  objc_storeStrong((id *)&self->_presentedItemURL, 0);
}

@end