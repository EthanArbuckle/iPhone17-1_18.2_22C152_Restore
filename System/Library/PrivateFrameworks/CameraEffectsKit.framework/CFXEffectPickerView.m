@interface CFXEffectPickerView
- (BOOL)isContinuousPreviewEnabled;
- (BOOL)isUsingCameraForContinuousPreview;
- (BOOL)previewingIsWaitingForConfiguration;
- (CFXEffectPickerView)initWithCoder:(id)a3;
- (CFXEffectPickerView)initWithFrame:(CGRect)a3;
- (CFXEffectPickerViewDataSource)dataSource;
- (CFXEffectPickerViewDelegate)delegate;
- (CGSize)cellSize;
- (CGSize)previewSizeInPixels;
- (CGSize)thumbnailSize;
- (JFXEffectPreviewManager)previewManager;
- (JFXEffectStaticPreviewOptions)staticPreviewOptions;
- (UIImage)previewBackgroundImage;
- (id)collectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionViewLayout;
- (id)contentView;
- (id)effectPickerCellNibName;
- (id)effectPickerCellReuseIdentifier;
- (id)effectPickerNibName;
- (unint64_t)effectIndexForCellIndex:(unint64_t)a3;
- (unint64_t)numberOfCollectionViewItems;
- (void)applyEffectAtCellIndex:(unint64_t)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didResizeCollectionViewToSize:(CGSize)a3;
- (void)didScrollCollectionView;
- (void)effectDidLoadForCell:(id)a3 effect:(id)a4;
- (void)effectPreviewManager:(id)a3 didUpdateContinousPreviewsForEffectIDs:(id)a4;
- (void)reloadData;
- (void)setCellSize:(CGSize)a3;
- (void)setContinuousPreviewEnabled:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviewBackgroundImage:(id)a3;
- (void)setPreviewManager:(id)a3;
- (void)setPreviewingIsWaitingForConfiguration:(BOOL)a3;
- (void)setStaticPreviewOptions:(id)a3;
- (void)setThumbnailSize:(CGSize)a3;
- (void)setUseCameraForContinuousPreview:(BOOL)a3;
- (void)sharedInit;
- (void)startPreviewing;
- (void)stopPreviewing;
- (void)subviewsDidLoad;
- (void)updatePreviewEffects;
- (void)updatePreviewEffectsWhenReloadComplete;
@end

@implementation CFXEffectPickerView

- (CFXEffectPickerView)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF498];
    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [v11 stringWithFormat:@"cannot initialize abstract class %@", v13];
    id v15 = [v9 exceptionWithName:v10 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)CFXEffectPickerView;
  v6 = [(CFXEffectPickerView *)&v16 initWithCoder:v4];
  v7 = v6;
  if (v6) {
    [(CFXEffectPickerView *)v6 sharedInit];
  }

  return v7;
}

- (CFXEffectPickerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v12 = (void *)MEMORY[0x263EFF940];
    uint64_t v13 = *MEMORY[0x263EFF498];
    v14 = NSString;
    id v15 = (objc_class *)objc_opt_class();
    objc_super v16 = NSStringFromClass(v15);
    v17 = [v14 stringWithFormat:@"cannot initialize abstract class %@", v16];
    id v18 = [v12 exceptionWithName:v13 reason:v17 userInfo:0];

    objc_exception_throw(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)CFXEffectPickerView;
  v9 = -[CFXEffectPickerView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  uint64_t v10 = v9;
  if (v9) {
    [(CFXEffectPickerView *)v9 sharedInit];
  }
  return v10;
}

- (void)sharedInit
{
  v33[4] = *MEMORY[0x263EF8340];
  [(CFXEffectPickerView *)self setClipsToBounds:1];
  v3 = [(CFXEffectPickerView *)self effectPickerNibName];
  if (v3)
  {
    id v4 = [MEMORY[0x263F086E0] jfxBundle];
    id v5 = (id)[v4 loadNibNamed:v3 owner:self options:0];

    v6 = [(CFXEffectPickerView *)self contentView];
    [(CFXEffectPickerView *)self addSubview:v6];

    v7 = [(CFXEffectPickerView *)self contentView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v24 = (void *)MEMORY[0x263F08938];
    v31 = [(CFXEffectPickerView *)self contentView];
    v30 = [v31 leadingAnchor];
    v29 = [(CFXEffectPickerView *)self leadingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v33[0] = v28;
    v27 = [(CFXEffectPickerView *)self contentView];
    v26 = [v27 trailingAnchor];
    v25 = [(CFXEffectPickerView *)self trailingAnchor];
    v23 = [v26 constraintEqualToAnchor:v25];
    v33[1] = v23;
    uint64_t v8 = [(CFXEffectPickerView *)self contentView];
    [v8 topAnchor];
    v9 = v32 = v3;
    uint64_t v10 = [(CFXEffectPickerView *)self topAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v33[2] = v11;
    v12 = [(CFXEffectPickerView *)self contentView];
    uint64_t v13 = [v12 bottomAnchor];
    v14 = [(CFXEffectPickerView *)self bottomAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14];
    v33[3] = v15;
    objc_super v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    [v24 activateConstraints:v16];

    v17 = [(CFXEffectPickerView *)self effectPickerCellNibName];
    id v18 = (void *)MEMORY[0x263F1C808];
    objc_super v19 = [MEMORY[0x263F086E0] jfxBundle];
    v20 = [v18 nibWithNibName:v17 bundle:v19];

    v21 = [(CFXEffectPickerView *)self collectionView];
    v22 = [(CFXEffectPickerView *)self effectPickerCellReuseIdentifier];
    [v21 registerNib:v20 forCellWithReuseIdentifier:v22];

    v3 = v32;
  }
  else
  {
    v17 = [(CFXEffectPickerView *)self effectPickerCellNibName];
  }
  self->_cellSize = (CGSize)kDefaultCellSize;
  [(CFXEffectPickerView *)self subviewsDidLoad];
}

- (void)subviewsDidLoad
{
  v3 = [MEMORY[0x263F1C550] clearColor];
  [(CFXEffectPickerView *)self setBackgroundColor:v3];

  id v4 = [(CFXEffectPickerView *)self collectionView];
  [v4 setDelegate:self];
}

- (id)effectPickerNibName
{
  return 0;
}

- (id)effectPickerCellNibName
{
  return 0;
}

- (void)reloadData
{
  v3 = [(CFXEffectPickerView *)self previewManager];
  if (v3)
  {
  }
  else if (![(CFXEffectPickerView *)self previewingIsWaitingForConfiguration])
  {
    return;
  }
  [(CFXEffectPickerView *)self stopPreviewing];
  [(CFXEffectPickerView *)self startPreviewing];
}

- (void)setContinuousPreviewEnabled:(BOOL)a3
{
  if (self->_continuousPreviewEnabled != a3)
  {
    self->_continuousPreviewEnabled = a3;
    id v4 = [(CFXEffectPickerView *)self previewManager];

    if (v4)
    {
      [(CFXEffectPickerView *)self reloadData];
    }
  }
}

- (void)setUseCameraForContinuousPreview:(BOOL)a3
{
  if (self->_useCameraForContinuousPreview != a3)
  {
    self->_useCameraForContinuousPreview = a3;
    id v4 = [(CFXEffectPickerView *)self previewManager];
    int v5 = [v4 isContinouslyPreviewing];

    if (v5)
    {
      [(CFXEffectPickerView *)self reloadData];
    }
  }
}

- (void)setPreviewBackgroundImage:(id)a3
{
  if (self->_previewBackgroundImage != a3)
  {
    objc_storeStrong((id *)&self->_previewBackgroundImage, a3);
    int v5 = [(CFXEffectPickerView *)self previewManager];
    int v6 = [v5 isContinouslyPreviewing];

    if (v6) {
      [(CFXEffectPickerView *)self reloadData];
    }
  }
  MEMORY[0x270F9A758]();
}

- (CGSize)previewSizeInPixels
{
  [(CFXEffectPickerView *)self thumbnailSize];
  double v3 = v2;
  double v5 = v4;
  int v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  double v8 = v7;

  double v9 = v3 * v8;
  double v10 = v5 * v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  if (a3.width != self->_thumbnailSize.width || a3.height != self->_thumbnailSize.height)
  {
    self->_thumbnailSize = a3;
    double v5 = [(CFXEffectPickerView *)self previewManager];

    if (!v5)
    {
      [(CFXEffectPickerView *)self reloadData];
    }
  }
}

- (void)setCellSize:(CGSize)a3
{
  if (a3.width != self->_cellSize.width || a3.height != self->_cellSize.height)
  {
    if (a3.width == *MEMORY[0x263F001B0] && a3.height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      a3.double width = 1.0;
      a3.double height = 1.0;
    }
    self->_cellSize = a3;
    double v5 = [(CFXEffectPickerView *)self collectionViewLayout];
    [(id)objc_opt_class() invalidationContextClass];
    id v7 = (id)objc_opt_new();

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setInvalidateFlowLayoutDelegateMetrics:1];
    }
    int v6 = [(CFXEffectPickerView *)self collectionViewLayout];
    [v6 invalidateLayoutWithContext:v7];

    if ([(CFXEffectPickerView *)self previewingIsWaitingForConfiguration]) {
      [(CFXEffectPickerView *)self reloadData];
    }
  }
}

- (void)startPreviewing
{
  double v3 = [(CFXEffectPickerView *)self previewManager];

  if (v3) {
    return;
  }
  [(CFXEffectPickerView *)self thumbnailSize];
  if (v5 != *MEMORY[0x263F001B0] || v4 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(CFXEffectPickerView *)self cellSize];
    if (v8 != 1.0 || v7 != 1.0)
    {
      double v10 = [JFXEffectPreviewManager alloc];
      v11 = [(JFXEffectPreviewManager *)v10 initWithName:@"FilterPicker" callbackQueue:MEMORY[0x263EF83A0]];
      [(CFXEffectPickerView *)self setPreviewManager:v11];

      v12 = [(CFXEffectPickerView *)self previewManager];
      [v12 setDelegate:self];

      [(CFXEffectPickerView *)self setPreviewingIsWaitingForConfiguration:0];
      if ([(CFXEffectPickerView *)self isContinuousPreviewEnabled])
      {
        if ([(CFXEffectPickerView *)self isUsingCameraForContinuousPreview])
        {
          id v13 = [[JFXEffectContinousLiveCapturePreviewOptions alloc] initLiveCaptureOptions];
        }
        else
        {
          id v13 = [[JFXEffectContinousPreviewImageOptions alloc] initImageOptionsWithFrameRate:15];
          objc_super v19 = [(CFXEffectPickerView *)self previewBackgroundImage];

          if (v19)
          {
            v20 = [(CFXEffectPickerView *)self previewBackgroundImage];
          }
          else
          {
            v21 = (void *)MEMORY[0x263F1C6B0];
            v22 = [MEMORY[0x263F1C550] clearColor];
            [(CFXEffectPickerView *)self thumbnailSize];
            v20 = objc_msgSend(v21, "imageWithColor:andSize:", v22);
          }
          v23 = +[JTImage jtImageWithUIImage:v20];
          [v13 setBackgroundImage:v23];
        }
        v24 = [(CFXEffectPickerView *)self previewManager];
        [(CFXEffectPickerView *)self previewSizeInPixels];
        objc_msgSend(v24, "startPreparingPreviewsContinuouslyAtSize:options:", v13);
      }
      else
      {
        v14 = [(CFXEffectPickerView *)self previewBackgroundImage];

        if (!v14)
        {
LABEL_24:
          v25 = [(CFXEffectPickerView *)self collectionView];
          [v25 setDataSource:self];

          v26 = [(CFXEffectPickerView *)self collectionView];
          [v26 reloadData];

          v27 = [(CFXEffectPickerView *)self collectionView];
          [v27 setHidden:0];

          v28 = [(CFXEffectPickerView *)self collectionView];
          [v28 layoutIfNeeded];

          [(CFXEffectPickerView *)self updatePreviewEffectsWhenReloadComplete];
          return;
        }
        id v15 = [[JFXEffectStaticPreviewOptions alloc] initStaticPreviewOptions];
        [(CFXEffectPickerView *)self setStaticPreviewOptions:v15];

        objc_super v16 = [(CFXEffectPickerView *)self previewBackgroundImage];
        v17 = +[JTImage jtImageWithUIImage:v16];
        id v18 = [(CFXEffectPickerView *)self staticPreviewOptions];
        [v18 setRenderBackgroundImage:v17];

        id v13 = [(CFXEffectPickerView *)self staticPreviewOptions];
        [v13 setDontCacheToDisk:1];
      }

      goto LABEL_24;
    }
  }
  [(CFXEffectPickerView *)self setPreviewingIsWaitingForConfiguration:1];
}

- (void)updatePreviewEffectsWhenReloadComplete
{
  dispatch_time_t v3 = dispatch_time(0, 30000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CFXEffectPickerView_updatePreviewEffectsWhenReloadComplete__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __61__CFXEffectPickerView_updatePreviewEffectsWhenReloadComplete__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) collectionView];
  dispatch_time_t v3 = [v2 visibleCells];
  uint64_t v4 = [v3 count];

  double v5 = *(void **)(a1 + 32);
  if (v4)
  {
    return [v5 updatePreviewEffects];
  }
  else
  {
    return [v5 updatePreviewEffectsWhenReloadComplete];
  }
}

- (void)updatePreviewEffects
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = [(CFXEffectPickerView *)self previewManager];

  if (v3)
  {
    uint64_t v4 = [(CFXEffectPickerView *)self previewManager];
    if ([v4 isContinouslyPreviewing])
    {
    }
    else
    {
      BOOL v5 = [(CFXEffectPickerView *)self isContinuousPreviewEnabled];

      if (!v5) {
        return;
      }
    }
    int v6 = [(CFXEffectPickerView *)self collectionView];
    double v7 = [v6 visibleCells];

    double v8 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v13), "effect", (void)v19);
          if (v14)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || ([v14 jtEffect],
                  id v15 = objc_claimAutoreleasedReturnValue(),
                  char v16 = [v15 isEmoji],
                  v15,
                  (v16 & 1) == 0))
            {
              v17 = [v14 jtEffect];
              [v8 addObject:v17];
            }
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    id v18 = [(CFXEffectPickerView *)self previewManager];
    [v18 setContinousPreviewEffects:v8];
  }
}

- (void)stopPreviewing
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = [(CFXEffectPickerView *)self previewManager];

  if (v3)
  {
    [(CFXEffectPickerView *)self setPreviewManager:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(CFXEffectPickerView *)self collectionView];
    BOOL v5 = [v4 visibleCells];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v9++) setImage:0];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    uint64_t v10 = [(CFXEffectPickerView *)self collectionView];
    [v10 setDataSource:0];

    uint64_t v11 = [(CFXEffectPickerView *)self collectionView];
    [v11 setHidden:1];
  }
}

- (void)applyEffectAtCellIndex:(unint64_t)a3
{
  unint64_t v4 = [(CFXEffectPickerView *)self effectIndexForCellIndex:a3];
  id v5 = [(CFXEffectPickerView *)self delegate];
  [v5 effectPickerView:self didPickEffectAtIndex:v4];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "item", a3);
  [(CFXEffectPickerView *)self didSelectItemAtCellIndex:v5];
}

- (void)didScrollCollectionView
{
  dispatch_time_t v3 = [(CFXEffectPickerView *)self delegate];
  [v3 effectPickerViewDidScroll:self];

  [(CFXEffectPickerView *)self updatePreviewEffects];
}

- (unint64_t)numberOfCollectionViewItems
{
  dispatch_time_t v3 = [(CFXEffectPickerView *)self dataSource];
  unint64_t v4 = [v3 numberOfEffectsInPickerView:self];

  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(CFXEffectPickerView *)self collectionView];
  uint64_t v7 = [(CFXEffectPickerView *)self effectPickerCellReuseIdentifier];
  uint64_t v8 = [v6 dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v5];

  uint64_t v9 = [v5 item];
  unint64_t v10 = [(CFXEffectPickerView *)self effectIndexForCellIndex:v9];
  uint64_t v11 = [(CFXEffectPickerView *)self dataSource];
  long long v12 = [v11 effectPickerView:self effectIdentifierAtIndex:v10];

  [v8 setEffectIdentifier:v12];
  [(CFXEffectPickerView *)self configureCell:v8];
  long long v13 = [(CFXEffectPickerView *)self dataSource];
  [(CFXEffectPickerView *)self previewSizeInPixels];
  double v15 = v14;
  double v17 = v16;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __61__CFXEffectPickerView_collectionView_cellForItemAtIndexPath___block_invoke;
  v21[3] = &unk_264C0AE78;
  id v18 = v8;
  id v22 = v18;
  v23 = self;
  objc_msgSend(v13, "effectPickerView:effectAtIndex:forPreviewingAtSizeInPixels:completionBlock:", self, v10, v21, v15, v17);

  id v19 = v18;
  return v19;
}

void __61__CFXEffectPickerView_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    dispatch_time_t v3 = [*(id *)(a1 + 32) effectIdentifier];
    unint64_t v4 = [v6 identifier];
    int v5 = [v3 isEqualToString:v4];

    if (v5) {
      [*(id *)(a1 + 40) effectDidLoadForCell:*(void *)(a1 + 32) effect:v6];
    }
  }
}

- (unint64_t)effectIndexForCellIndex:(unint64_t)a3
{
  return a3;
}

- (void)effectDidLoadForCell:(id)a3 effect:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 setEffect:v7];
  uint64_t v8 = [v7 jtEffect];
  uint64_t v9 = [v8 accessibilityName];
  [v6 setAccessibilityLabel:v9];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v7 jtEffect],
        unint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEmoji],
        v10,
        v11))
  {
    long long v12 = [MEMORY[0x263F1C6B0] systemImageNamed:@"face.smiling.fill"];
    long long v13 = +[JTImage jtImageWithUIImage:v12];
    [v6 setImage:v13];
  }
  else
  {
    double v14 = [v7 jtEffect];
    int v15 = [v14 type];

    if (v15 == 1)
    {
      double v16 = +[CFXEffectHostAppDelegate sharedInstance];
      double v17 = [v16 preferredDisplayColorSpace];
      uint64_t v18 = [v17 isHDRSpace];

      id v19 = [v7 jtEffect];
      [v19 setHDR:v18];
    }
    long long v20 = [(CFXEffectPickerView *)self previewManager];
    long long v21 = [v7 jtEffect];
    [(CFXEffectPickerView *)self previewSizeInPixels];
    double v23 = v22;
    double v25 = v24;
    v26 = [(CFXEffectPickerView *)self staticPreviewOptions];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __51__CFXEffectPickerView_effectDidLoadForCell_effect___block_invoke;
    v47[3] = &unk_264C0AEA0;
    id v48 = v6;
    id v27 = v7;
    id v49 = v27;
    objc_msgSend(v20, "previewForEffect:atSize:options:completion:", v21, v26, v47, v23, v25);

    [(CFXEffectPickerView *)self updatePreviewEffects];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v28 = [(CFXEffectPickerView *)self previewManager];
    v29 = [v28 continousPreviewEffects];

    uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v44;
LABEL_8:
      uint64_t v33 = 0;
      while (1)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v43 + 1) + 8 * v33);
        v35 = [v27 jtEffect];

        if (v35 == v34) {
          break;
        }
        if (v31 == ++v33)
        {
          uint64_t v31 = [v29 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v31) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:

      v36 = [(CFXEffectPickerView *)self previewManager];
      v37 = [v36 continousPreviewEffects];
      v29 = (void *)[v37 mutableCopy];

      v38 = [v27 jtEffect];
      [v29 addObject:v38];

      v39 = [(CFXEffectPickerView *)self previewManager];
      [v39 setContinousPreviewEffects:v29];

      v40 = JFXLog_pickerUI();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = [v27 jtEffect];
        v42 = [v41 accessibilityName];
        *(_DWORD *)buf = 138412290;
        v51 = v42;
        _os_log_impl(&dword_234C41000, v40, OS_LOG_TYPE_DEFAULT, "Missing entry for %@, adding here as a workaround", buf, 0xCu);
      }
    }
  }
}

void __51__CFXEffectPickerView_effectDidLoadForCell_effect___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  dispatch_time_t v3 = [*(id *)(a1 + 32) effectIdentifier];
  unint64_t v4 = [*(id *)(a1 + 40) identifier];
  int v5 = [v3 isEqualToString:v4];

  if (v5) {
    [*(id *)(a1 + 32) setImage:v6];
  }
}

- (void)effectPreviewManager:(id)a3 didUpdateContinousPreviewsForEffectIDs:(id)a4
{
  id v5 = a4;
  id v6 = [(CFXEffectPickerView *)self previewManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__CFXEffectPickerView_effectPreviewManager_didUpdateContinousPreviewsForEffectIDs___block_invoke;
  v7[3] = &unk_264C0AEC8;
  v7[4] = self;
  [v6 continousPreviewsForEffectIDs:v5 completion:v7];
}

void __83__CFXEffectPickerView_effectPreviewManager_didUpdateContinousPreviewsForEffectIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "collectionView", 0);
  id v5 = [v4 visibleCells];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *MEMORY[0x263F61368];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 effect];
        long long v13 = [v12 identifier];
        double v14 = [v3 objectForKey:v13];

        if (v14)
        {
          [v11 setImage:v14];
        }
        else
        {
          int v15 = [v3 objectForKey:v9];
          [v11 setImage:v15];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)didResizeCollectionViewToSize:(CGSize)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CFXEffectPickerView_didResizeCollectionViewToSize___block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__CFXEffectPickerView_didResizeCollectionViewToSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePreviewEffects];
}

- (id)effectPickerCellReuseIdentifier
{
  double v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  unint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"must override %@ in subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)collectionView
{
  double v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  unint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"must override %@ in subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)collectionViewLayout
{
  double v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  unint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"must override %@ in subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)contentView
{
  double v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  unint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"must override %@ in subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)isContinuousPreviewEnabled
{
  return self->_continuousPreviewEnabled;
}

- (UIImage)previewBackgroundImage
{
  return self->_previewBackgroundImage;
}

- (BOOL)isUsingCameraForContinuousPreview
{
  return self->_useCameraForContinuousPreview;
}

- (CFXEffectPickerViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (CFXEffectPickerViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (CFXEffectPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXEffectPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (JFXEffectStaticPreviewOptions)staticPreviewOptions
{
  return self->_staticPreviewOptions;
}

- (void)setStaticPreviewOptions:(id)a3
{
}

- (BOOL)previewingIsWaitingForConfiguration
{
  return self->_previewingIsWaitingForConfiguration;
}

- (void)setPreviewingIsWaitingForConfiguration:(BOOL)a3
{
  self->_previewingIsWaitingForConfiguration = a3;
}

- (JFXEffectPreviewManager)previewManager
{
  return self->_previewManager;
}

- (void)setPreviewManager:(id)a3
{
}

- (CGSize)cellSize
{
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewManager, 0);
  objc_storeStrong((id *)&self->_staticPreviewOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_previewBackgroundImage, 0);
}

@end