@interface QLPreviewMockScene
+ (BOOL)canPreviewItem:(id)a3;
+ (id)requestPreviewMockSceneActivation;
- (QLPreviewControllerConformingDataSource)dataSource;
- (QLPreviewControllerConformingDelegate)delegate;
- (QLPreviewItem)currentPreviewItem;
- (QLPreviewMockScene)init;
- (int64_t)currentPreviewItemIndex;
- (void)setCurrentPreviewItemIndex:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation QLPreviewMockScene

+ (id)requestPreviewMockSceneActivation
{
  return 0;
}

- (QLPreviewMockScene)init
{
  return 0;
}

+ (BOOL)canPreviewItem:(id)a3
{
  return 0;
}

- (QLPreviewItem)currentPreviewItem
{
  return 0;
}

- (int64_t)currentPreviewItemIndex
{
  return self->currentPreviewItemIndex;
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3
{
  self->currentPreviewItemIndex = a3;
}

- (QLPreviewControllerConformingDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->dataSource);

  return (QLPreviewControllerConformingDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (QLPreviewControllerConformingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (QLPreviewControllerConformingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);

  objc_destroyWeak((id *)&self->dataSource);
}

@end