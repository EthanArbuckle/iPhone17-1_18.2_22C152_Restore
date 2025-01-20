@interface CFXEffectPickerViewController
+ (id)effectPickerViewController;
- (BOOL)isPreviewing;
- (BOOL)shouldDisplayExpandedModeForFilterPickerView:(id)a3;
- (BOOL)shouldRotateCellsForDeviceOrientation;
- (CFXEffectPickerView)pickerView;
- (CFXEffectPickerViewControllerDelegate)delegate;
- (CFXEffectType)effectType;
- (NSArray)effects;
- (OS_dispatch_queue)effectLoadingQueue;
- (UIImage)previewBackgroundImage;
- (id)CFX_createPickerViewForEffectType:(id)a3;
- (id)effectPickerView:(id)a3 effectAtIndex:(int64_t)a4;
- (id)effectPickerView:(id)a3 effectIdentifierAtIndex:(int64_t)a4;
- (id)effectPickerView:(id)a3 effectTitleAtIndex:(int64_t)a4;
- (unint64_t)CFX_indexForEffectIdentifier:(id)a3;
- (unint64_t)effectPickerView:(id)a3 indexForEffectID:(id)a4;
- (unint64_t)numberOfEffectsInPickerView:(id)a3;
- (unint64_t)selectedFilterIndexForFilterPickerView:(id)a3;
- (void)CFX_configureEffect:(id)a3 previewSizeInPixels:(CGSize)a4;
- (void)CFX_loadEffectsForType:(id)a3 completion:(id)a4;
- (void)CFX_restartPreviewing;
- (void)CFX_stopPreviewing;
- (void)effectPickerView:(id)a3 didPickEffectAtIndex:(int64_t)a4;
- (void)effectPickerView:(id)a3 effectAtIndex:(int64_t)a4 forPreviewingAtSizeInPixels:(CGSize)a5 completionBlock:(id)a6;
- (void)effectPickerViewDidScroll:(id)a3;
- (void)filterPickerPresentationModeDidChange;
- (void)setDelegate:(id)a3;
- (void)setEffectLoadingQueue:(id)a3;
- (void)setEffectType:(id)a3;
- (void)setEffects:(id)a3;
- (void)setPickerView:(id)a3;
- (void)setPreviewBackgroundImage:(id)a3;
- (void)setPreviewing:(BOOL)a3;
- (void)startPreviewing;
- (void)stopPreviewing;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation CFXEffectPickerViewController

+ (id)effectPickerViewController
{
  v2 = (void *)MEMORY[0x263F1C9E8];
  v3 = [MEMORY[0x263F086E0] jfxBundle];
  v4 = [v2 storyboardWithName:@"CFXEffectPickerViewController" bundle:v3];
  v5 = [v4 instantiateViewControllerWithIdentifier:@"CFXEffectPickerViewController"];

  return v5;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)CFXEffectPickerViewController;
  [(CFXEffectPickerViewController *)&v12 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] clearColor];
  v4 = [(CFXEffectPickerViewController *)self view];
  [v4 setBackgroundColor:v3];

  if (viewDidLoad_onceToken != -1) {
    dispatch_once(&viewDidLoad_onceToken, &__block_literal_global_31);
  }
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"com.apple.%@.effectLoadingQueue", v7];

  id v9 = v8;
  v10 = (const char *)[v9 UTF8String];
  dispatch_queue_t v11 = dispatch_queue_create(v10, MEMORY[0x263EF83A8]);
  [(CFXEffectPickerViewController *)self setEffectLoadingQueue:v11];
}

uint64_t __44__CFXEffectPickerViewController_viewDidLoad__block_invoke()
{
  s_effectLoadingSemaphore = (uint64_t)dispatch_semaphore_create(2);
  return MEMORY[0x270F9A758]();
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CFXEffectPickerViewController;
  [(CFXEffectPickerViewController *)&v5 viewWillAppear:a3];
  v4 = [(CFXEffectPickerViewController *)self pickerView];
  [v4 reloadData];

  if ([(CFXEffectPickerViewController *)self isPreviewing]) {
    [(CFXEffectPickerViewController *)self CFX_restartPreviewing];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CFXEffectPickerViewController;
  [(CFXEffectPickerViewController *)&v4 viewWillDisappear:a3];
  if ([(CFXEffectPickerViewController *)self isPreviewing]) {
    [(CFXEffectPickerViewController *)self CFX_stopPreviewing];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CFXEffectPickerViewController;
  id v7 = a4;
  -[CFXEffectPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__CFXEffectPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_264C0B718;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

void __84__CFXEffectPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pickerView];
  [v1 orientationDidChange];
}

- (void)setPreviewBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_previewBackgroundImage, a3);
  if ([(CFXEffectPickerViewController *)self isPreviewing])
  {
    [(CFXEffectPickerViewController *)self CFX_restartPreviewing];
  }
}

- (void)setEffectType:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_effectType] & 1) == 0)
  {
    [(CFXEffectPickerViewController *)self CFX_stopPreviewing];
    v6 = [(CFXEffectPickerViewController *)self pickerView];
    [v6 removeFromSuperview];

    objc_storeStrong((id *)&self->_effectType, a3);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__CFXEffectPickerViewController_setEffectType___block_invoke;
    v7[3] = &unk_264C09F10;
    v7[4] = self;
    id v8 = v5;
    [(CFXEffectPickerViewController *)self CFX_loadEffectsForType:v8 completion:v7];
  }
}

uint64_t __47__CFXEffectPickerViewController_setEffectType___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "CFX_createPickerViewForEffectType:", *(void *)(a1 + 40));
  [*(id *)(a1 + 32) setPickerView:v2];

  uint64_t result = [*(id *)(a1 + 32) isPreviewing];
  if (result)
  {
    objc_super v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "CFX_restartPreviewing");
  }
  return result;
}

- (void)startPreviewing
{
  [(CFXEffectPickerViewController *)self setPreviewing:1];
  v3 = [(CFXEffectPickerViewController *)self view];
  objc_super v4 = [v3 window];

  if (v4)
  {
    [(CFXEffectPickerViewController *)self CFX_restartPreviewing];
  }
}

- (void)stopPreviewing
{
  [(CFXEffectPickerViewController *)self setPreviewing:0];
  [(CFXEffectPickerViewController *)self CFX_stopPreviewing];
}

- (void)CFX_restartPreviewing
{
  v3 = [(CFXEffectPickerViewController *)self pickerView];

  if (!v3) {
    return;
  }
  objc_super v4 = [(CFXEffectPickerViewController *)self pickerView];
  [v4 stopPreviewing];

  id v5 = [(CFXEffectPickerViewController *)self effectType];
  int v6 = [v5 jtEffectType];

  if (v6 == 2)
  {
    v15 = [(CFXEffectPickerViewController *)self pickerView];
    [v15 setPreviewBackgroundImage:0];

    v16 = [(CFXEffectPickerViewController *)self pickerView];
    [v16 setContinuousPreviewEnabled:1];

    objc_super v12 = [(CFXEffectPickerViewController *)self pickerView];
    v13 = v12;
    BOOL v14 = 0;
  }
  else
  {
    if (v6 != 1)
    {
      v17 = [(CFXEffectPickerViewController *)self pickerView];
      [v17 setPreviewBackgroundImage:0];

      v18 = [(CFXEffectPickerViewController *)self pickerView];
      [v18 setUseCameraForContinuousPreview:0];

      v13 = [(CFXEffectPickerViewController *)self pickerView];
      [v13 setContinuousPreviewEnabled:0];
      goto LABEL_9;
    }
    id v7 = [(CFXEffectPickerViewController *)self previewBackgroundImage];
    id v8 = [(CFXEffectPickerViewController *)self pickerView];
    [v8 setPreviewBackgroundImage:v7];

    objc_super v9 = [(CFXEffectPickerViewController *)self previewBackgroundImage];
    BOOL v10 = v9 == 0;

    dispatch_queue_t v11 = [(CFXEffectPickerViewController *)self pickerView];
    [v11 setContinuousPreviewEnabled:v10];

    objc_super v12 = [(CFXEffectPickerViewController *)self pickerView];
    v13 = v12;
    BOOL v14 = v10;
  }
  [v12 setUseCameraForContinuousPreview:v14];
LABEL_9:

  id v19 = [(CFXEffectPickerViewController *)self pickerView];
  [v19 startPreviewing];
}

- (void)CFX_stopPreviewing
{
  id v2 = [(CFXEffectPickerViewController *)self pickerView];
  [v2 stopPreviewing];
}

- (void)CFX_loadEffectsForType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CFXEffectPickerViewController *)self setEffects:0];
  if (v6)
  {
    id v8 = +[JFXEffectFactory sharedInstance];
    uint64_t v9 = [v6 jtEffectType];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__CFXEffectPickerViewController_CFX_loadEffectsForType_completion___block_invoke;
    v10[3] = &unk_264C0B740;
    id v11 = v6;
    objc_super v12 = self;
    id v13 = v7;
    [v8 effectIDsForType:v9 completion:v10];
  }
}

void __67__CFXEffectPickerViewController_CFX_loadEffectsForType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = +[CFXEffect effectWithIdentifier:forEffectType:](CFXEffect, "effectWithIdentifier:forEffectType:", *(void *)(*((void *)&v11 + 1) + 8 * v9), *(void *)(a1 + 32), (void)v11);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 40) setEffects:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (unint64_t)CFX_indexForEffectIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXEffectPickerViewController *)self effects];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__CFXEffectPickerViewController_CFX_indexForEffectIdentifier___block_invoke;
  v9[3] = &unk_264C0B768;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __62__CFXEffectPickerViewController_CFX_indexForEffectIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)CFX_createPickerViewForEffectType:(id)a3
{
  v25[4] = *MEMORY[0x263EF8340];
  if (a3)
  {
    [a3 jtEffectType];
    uint64_t v4 = objc_opt_new();
    id v5 = [(CFXEffectPickerViewController *)self view];
    [v5 addSubview:v4];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = (void *)MEMORY[0x263F08938];
    v23 = [v4 leadingAnchor];
    v24 = [(CFXEffectPickerViewController *)self view];
    v22 = [v24 leadingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v25[0] = v21;
    id v19 = [v4 trailingAnchor];
    v20 = [(CFXEffectPickerViewController *)self view];
    v18 = [v20 trailingAnchor];
    uint64_t v16 = [v19 constraintEqualToAnchor:v18];
    v25[1] = v16;
    v15 = [v4 topAnchor];
    id v6 = [(CFXEffectPickerViewController *)self view];
    unint64_t v7 = [v6 topAnchor];
    uint64_t v8 = [v15 constraintEqualToAnchor:v7];
    v25[2] = v8;
    uint64_t v9 = [v4 bottomAnchor];
    id v10 = [(CFXEffectPickerViewController *)self view];
    long long v11 = [v10 bottomAnchor];
    long long v12 = [v9 constraintEqualToAnchor:v11];
    v25[3] = v12;
    long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    [v17 activateConstraints:v13];

    [v4 setDataSource:self];
    [v4 setDelegate:self];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CFXEffectPickerViewController;
  [(CFXEffectPickerViewController *)&v5 willMoveToParentViewController:v4];
  if ([v4 conformsToProtocol:&unk_26E878840]) {
    [v4 setFilterPickerPresentationDelegate:self];
  }
}

- (void)effectPickerView:(id)a3 didPickEffectAtIndex:(int64_t)a4
{
  id v6 = [(CFXEffectPickerViewController *)self effects];
  unint64_t v7 = [v6 count];

  if (v7 > a4)
  {
    uint64_t v8 = [(CFXEffectPickerViewController *)self effects];
    uint64_t v9 = [v8 objectAtIndex:a4];
    id v11 = (id)[v9 copy];

    id v10 = [(CFXEffectPickerViewController *)self delegate];
    [v10 effectPickerViewController:self didPickEffect:v11];
  }
}

- (void)effectPickerViewDidScroll:(id)a3
{
  id v3 = +[CFXAnalyticsManager sharedInstance];
  [v3 pickerDidScroll];
}

- (unint64_t)numberOfEffectsInPickerView:(id)a3
{
  id v3 = [(CFXEffectPickerViewController *)self effects];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)effectPickerView:(id)a3 effectAtIndex:(int64_t)a4
{
  id v6 = [(CFXEffectPickerViewController *)self effects];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = [(CFXEffectPickerViewController *)self effects];
    uint64_t v9 = [v8 objectAtIndex:a4];
  }
  return v9;
}

- (id)effectPickerView:(id)a3 effectIdentifierAtIndex:(int64_t)a4
{
  id v6 = [(CFXEffectPickerViewController *)self effects];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v8 = [(CFXEffectPickerViewController *)self effects];
    uint64_t v9 = [v8 objectAtIndex:a4];

    id v10 = [v9 identifier];
  }
  return v10;
}

- (id)effectPickerView:(id)a3 effectTitleAtIndex:(int64_t)a4
{
  objc_super v5 = [(CFXEffectPickerViewController *)self effects];
  id v6 = [v5 objectAtIndex:a4];

  unint64_t v7 = [v6 localizedTitle];

  return v7;
}

- (unint64_t)effectPickerView:(id)a3 indexForEffectID:(id)a4
{
  return [(CFXEffectPickerViewController *)self CFX_indexForEffectIdentifier:a4];
}

- (void)effectPickerView:(id)a3 effectAtIndex:(int64_t)a4 forPreviewingAtSizeInPixels:(CGSize)a5 completionBlock:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a6;
  id v11 = [(CFXEffectPickerViewController *)self effects];
  unint64_t v12 = [v11 count];

  if (v12 > a4)
  {
    long long v13 = [(CFXEffectPickerViewController *)self effects];
    long long v14 = [v13 objectAtIndex:a4];

    v15 = [v14 jtEffect];
    if ([v15 type] == 2) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;
    if (![v15 isNone])
    {
      int v18 = [v15 renderEffectResourcesAreReady];
      if (v17 && [v17 hasDynamicText]) {
        char v19 = [v17 wasDynamicTextSet] ^ 1;
      }
      else {
        char v19 = 0;
      }
      [v15 renderSize];
      if (!v18 || (v19 & 1) != 0)
      {
        v22 = [(CFXEffectPickerViewController *)self effectLoadingQueue];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke;
        v23[3] = &unk_264C0B7E0;
        id v24 = v15;
        char v31 = v19;
        id v25 = v17;
        v26 = self;
        double v29 = width;
        double v30 = height;
        id v28 = v10;
        id v27 = v14;
        dispatch_async(v22, v23);

        goto LABEL_18;
      }
      if (v20 != width || v21 != height) {
        -[CFXEffectPickerViewController CFX_configureEffect:previewSizeInPixels:](self, "CFX_configureEffect:previewSizeInPixels:", v15, width, height);
      }
    }
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
LABEL_18:

    goto LABEL_19;
  }
  (*((void (**)(id, void))v10 + 2))(v10, 0);
LABEL_19:
}

void __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = s_effectLoadingSemaphore;
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v3);
  [*(id *)(a1 + 32) loadRenderEffect];
  if (*(unsigned char *)(a1 + 88))
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    objc_super v5 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke_2;
    v13[3] = &unk_264C0B790;
    dispatch_semaphore_t v14 = v4;
    id v6 = v4;
    [v5 updateDynamicTextWithCompletionBlock:v13];
    dispatch_time_t v7 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v6, v7);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)s_effectLoadingSemaphore);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke_3;
  block[3] = &unk_264C0B7B8;
  block[4] = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 72);
  id v11 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

intptr_t __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __108__CFXEffectPickerViewController_effectPickerView_effectAtIndex_forPreviewingAtSizeInPixels_completionBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "CFX_configureEffect:previewSizeInPixels:", *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

- (void)CFX_configureEffect:(id)a3 previewSizeInPixels:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  if (([v6 isNone] & 1) == 0 && objc_msgSend(v6, "renderEffectResourcesAreReady"))
  {
    objc_msgSend(v6, "setRenderSize:", width, height);
    dispatch_time_t v7 = [v6 renderEffect];
    v19[0] = kDefaultEffectPreviewAnimationRange;
    v19[1] = xmmword_234D62718;
    v19[2] = xmmword_234D62728;
    [v7 setEffectRange:v19];

    [v6 setForceRenderAtPosterFrame:1];
    if ([v6 type] == 2) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    id v10 = v9;
    if (v9)
    {
      long long v13 = *MEMORY[0x263F010E0];
      long long v16 = *MEMORY[0x263F010E0];
      uint64_t v11 = *(void *)(MEMORY[0x263F010E0] + 16);
      uint64_t v17 = v11;
      objc_msgSend(v9, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v16, 0.0, 0.0, width, height, 0.0, 0.0, width, height);
      [v10 pickerScale];
      if (v12 != 1.0)
      {
        CGAffineTransformMakeScale(&v18, v12, v12);
        long long v14 = v13;
        uint64_t v15 = v11;
        objc_msgSend(v10, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v18, &v14, 1, 0.0, 0.0, width, height);
      }
    }
  }
}

- (unint64_t)selectedFilterIndexForFilterPickerView:(id)a3
{
  dispatch_semaphore_t v4 = [(CFXEffectPickerViewController *)self delegate];
  id v5 = [v4 selectedFilterIdentifierForEffectPickerViewController:self];

  if (!v5) {
    id v5 = (id)*MEMORY[0x263F61368];
  }
  unint64_t v6 = [(CFXEffectPickerViewController *)self CFX_indexForEffectIdentifier:v5];

  return v6;
}

- (BOOL)shouldDisplayExpandedModeForFilterPickerView:(id)a3
{
  dispatch_semaphore_t v4 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1) {
    return 1;
  }
  dispatch_time_t v7 = [(CFXEffectPickerViewController *)self parentViewController];
  if ([v7 conformsToProtocol:&unk_26E878840]) {
    BOOL v6 = [v7 layoutPresentationStyle] == 1;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldRotateCellsForDeviceOrientation
{
  id v2 = [(CFXEffectPickerViewController *)self delegate];
  char v3 = [v2 shouldRotateCellsForDeviceOrientation];

  return v3;
}

- (void)filterPickerPresentationModeDidChange
{
  id v2 = [(CFXEffectPickerViewController *)self pickerView];
  [v2 setNeedsLayout];

  id v3 = +[CFXAnalyticsManager sharedInstance];
  [v3 pickerDidChangePresentationMode];
}

- (UIImage)previewBackgroundImage
{
  return self->_previewBackgroundImage;
}

- (CFXEffectType)effectType
{
  return self->_effectType;
}

- (CFXEffectPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
}

- (CFXEffectPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXEffectPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)effects
{
  return self->_effects;
}

- (void)setEffects:(id)a3
{
}

- (OS_dispatch_queue)effectLoadingQueue
{
  return self->_effectLoadingQueue;
}

- (void)setEffectLoadingQueue:(id)a3
{
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (void)setPreviewing:(BOOL)a3
{
  self->_previewing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectLoadingQueue, 0);
  objc_storeStrong((id *)&self->_effects, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_effectType, 0);
  objc_storeStrong((id *)&self->_previewBackgroundImage, 0);
}

@end