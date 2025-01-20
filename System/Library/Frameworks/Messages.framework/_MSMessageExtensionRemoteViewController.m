@interface _MSMessageExtensionRemoteViewController
- (BOOL)_allowsShielding;
- (BOOL)_shouldRemoteViewControllerFenceOriginChanges;
- (BOOL)isReadyToDisplay;
- (BOOL)needsSizeMatchBeforeSnapshotSwap;
- (BOOL)providesExplicitSizeSnapshot;
- (NSExtension)weakExtension;
- (NSUUID)requestUUID;
- (int64_t)intent;
- (void)dealloc;
- (void)setIntent:(int64_t)a3;
- (void)setNeedsSizeMatchBeforeSnapshotSwap:(BOOL)a3;
- (void)setProvidesExplicitSizeSnapshot:(BOOL)a3;
- (void)setReadyToDisplay:(BOOL)a3;
- (void)setRequestUUID:(id)a3;
- (void)setWeakExtension:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation _MSMessageExtensionRemoteViewController

- (void)viewDidLayoutSubviews
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_MSMessageExtensionRemoteViewController;
  [(_MSMessageExtensionRemoteViewController *)&v13 viewDidLayoutSubviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(_MSMessageExtensionRemoteViewController *)self view];
  v4 = [v3 subviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setUserInteractionEnabled:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)dealloc
{
  v3 = [(_MSMessageExtensionRemoteViewController *)self requestUUID];
  if (v3)
  {
    v4 = [(_MSMessageExtensionRemoteViewController *)self weakExtension];
    [v4 cancelExtensionRequestWithIdentifier:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)_MSMessageExtensionRemoteViewController;
  [(_UIRemoteViewController *)&v5 dealloc];
}

- (BOOL)_shouldRemoteViewControllerFenceOriginChanges
{
  return self->_intent != 1;
}

- (BOOL)_allowsShielding
{
  return (unint64_t)(self->_intent - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSExtension)weakExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakExtension);

  return (NSExtension *)WeakRetained;
}

- (void)setWeakExtension:(id)a3
{
}

- (BOOL)providesExplicitSizeSnapshot
{
  return self->_providesExplicitSizeSnapshot;
}

- (void)setProvidesExplicitSizeSnapshot:(BOOL)a3
{
  self->_providesExplicitSizeSnapshot = a3;
}

- (BOOL)needsSizeMatchBeforeSnapshotSwap
{
  return self->_needsSizeMatchBeforeSnapshotSwap;
}

- (void)setNeedsSizeMatchBeforeSnapshotSwap:(BOOL)a3
{
  self->_needsSizeMatchBeforeSnapshotSwap = a3;
}

- (BOOL)isReadyToDisplay
{
  return self->_readyToDisplay;
}

- (void)setReadyToDisplay:(BOOL)a3
{
  self->_readyToDisplay = a3;
}

- (int64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakExtension);

  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end