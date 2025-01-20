@interface ASVGesture
- (ASVGesture)initWithDataSource:(id)a3;
- (ASVGestureDataSource)dataSource;
- (BOOL)firstTouchWasOnAsset;
- (double)initialAssetLocationOnScreen;
- (double)latestAssetLocationOnScreen;
- (void)setDataSource:(id)a3;
- (void)setFirstTouchWasOnAsset:(BOOL)a3;
- (void)setInitialAssetLocationOnScreen:(ASVGesture *)self;
- (void)setLatestAssetLocationOnScreen:(ASVGesture *)self;
@end

@implementation ASVGesture

- (ASVGesture)initWithDataSource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASVGesture;
  v5 = [(ASVGesture *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    [v4 assetScreenPosition];
    *(void *)v6->_initialAssetLocationOnScreen = v7;
    *(void *)v6->_latestAssetLocationOnScreen = v7;
  }

  return v6;
}

- (ASVGestureDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (ASVGestureDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)firstTouchWasOnAsset
{
  return self->_firstTouchWasOnAsset;
}

- (void)setFirstTouchWasOnAsset:(BOOL)a3
{
  self->_firstTouchWasOnAsset = a3;
}

- (double)initialAssetLocationOnScreen
{
  return *(double *)(a1 + 24);
}

- (void)setInitialAssetLocationOnScreen:(ASVGesture *)self
{
  *(void *)self->_initialAssetLocationOnScreen = v2;
}

- (double)latestAssetLocationOnScreen
{
  return *(double *)(a1 + 32);
}

- (void)setLatestAssetLocationOnScreen:(ASVGesture *)self
{
  *(void *)self->_latestAssetLocationOnScreen = v2;
}

- (void).cxx_destruct
{
}

@end