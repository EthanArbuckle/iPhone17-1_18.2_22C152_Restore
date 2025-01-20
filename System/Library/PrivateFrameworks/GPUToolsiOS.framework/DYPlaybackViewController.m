@interface DYPlaybackViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)shouldAutorotate;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DYPlaybackViewController

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DYPlaybackViewController;
  -[DYPlaybackViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__DYPlaybackViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_26533C128;
  v9[4] = self;
  v8 = (void *)MEMORY[0x253362C50](v9);
  [v7 animateAlongsideTransition:v8 completion:&__block_literal_global];
}

void __79__DYPlaybackViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) view];
  v3 = [v2 layer];
  v4 = v3;
  if (v3) {
    [v3 transform];
  }
  else {
    memset(&v25, 0, sizeof(v25));
  }
  CATransform3DInvert(&v26, &v25);
  v5 = [*(id *)(a1 + 32) view];
  v6 = [v5 layer];
  CATransform3D v24 = v26;
  [v6 setSublayerTransform:&v24];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "view", 0);
  v8 = [v7 layer];
  v9 = [v8 sublayers];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = [*(id *)(a1 + 32) view];
        v15 = [v14 layer];
        [v15 bounds];
        double v17 = v16;
        double v19 = v18;

        objc_msgSend(v13, "setPosition:", v17 * 0.5, v19 * 0.5);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v10);
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

@end