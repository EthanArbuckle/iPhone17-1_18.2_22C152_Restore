@interface PFUbiquityMetadataFactoryFilePresenter
+ (void)initialize;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (PFUbiquityMetadataFactoryFilePresenter)init;
- (PFUbiquityMetadataFactoryFilePresenter)initWithMetadataStoreFileLocation:(id)a3;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)relinquishPresentedItemToReader:(id)a3;
- (void)relinquishPresentedItemToWriter:(id)a3;
- (void)savePresentedItemChangesWithCompletionHandler:(id)a3;
@end

@implementation PFUbiquityMetadataFactoryFilePresenter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _sharedQueue = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28F08]);
  }
}

- (PFUbiquityMetadataFactoryFilePresenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryFilePresenter;
  result = [(PFUbiquityMetadataFactoryFilePresenter *)&v3 init];
  if (result)
  {
    result->_presentedItemURL = 0;
    result->_presentedItemLocation = 0;
  }
  return result;
}

- (PFUbiquityMetadataFactoryFilePresenter)initWithMetadataStoreFileLocation:(id)a3
{
  v4 = [(PFUbiquityMetadataFactoryFilePresenter *)self init];
  if (v4)
  {
    v4->_presentedItemLocation = (PFUbiquityLocation *)a3;
    v4->_presentedItemURL = (NSURL *)-[PFUbiquityLocation createFullURL]((uint64_t)a3);
  }
  return v4;
}

- (void)dealloc
{
  self->_presentedItemURL = 0;
  self->_presentedItemLocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMetadataFactoryFilePresenter;
  [(PFUbiquityMetadataFactoryFilePresenter *)&v3 dealloc];
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)_sharedQueue;
}

- (void)relinquishPresentedItemToReader:(id)a3
{
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
}

- (void)savePresentedItemChangesWithCompletionHandler:(id)a3
{
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got delete for metadata store: %@", "-[PFUbiquityMetadataFactoryFilePresenter accommodatePresentedItemDeletionWithCompletionHandler:]", 78, self->_presentedItemURL);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PFUbiquityMetadataFactoryFilePresenter_accommodatePresentedItemDeletionWithCompletionHandler___block_invoke;
  block[3] = &unk_1E544B868;
  block[4] = self;
  dispatch_async(global_queue, block);
  (*((void (**)(id, void))a3 + 2))(a3, 0);
}

void __96__PFUbiquityMetadataFactoryFilePresenter_accommodatePresentedItemDeletionWithCompletionHandler___block_invoke(uint64_t a1)
{
  self;
  v2 = (id *)_sharedFactory;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 16);
    if (!v4)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    uint64_t v5 = *(void *)(v4 + 32);
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = MEMORY[0x10];
    if (!MEMORY[0x10])
    {
      uint64_t v6 = 0;
      uint64_t v4 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v6 = *(void *)(v4 + 40);
  if (*(_DWORD *)(v4 + 24) != 1) {
    uint64_t v4 = *(void *)(v4 + 8);
  }
LABEL_6:

  -[PFUbiquityMetadataFactory removeCachedCoordinatorsForLocalPeerID:storeName:andUbiquityRootLocation:](v2, v5, v6, v4);
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

@end