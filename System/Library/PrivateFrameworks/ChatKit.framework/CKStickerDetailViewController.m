@interface CKStickerDetailViewController
+ (BOOL)isGenmojiBundleIDFromFileTransfer:(id)a3;
+ (id)localizedAppNameForStickerDetailsFromFileTransfer:(id)a3;
+ (id)stickerBundleIDFromFileTransfer:(id)a3;
- (BOOL)canSaveStickerForItem:(id)a3;
- (BOOL)canViewStickerPackForItem:(id)a3;
- (BOOL)constrainToPresentingVCBounds;
- (BOOL)preserveModalPresentationStyle;
- (BOOL)shouldAutorotate;
- (BOOL)shouldHideViewButtonInStickerDetailsForIdentifier:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)wantsWindowedPresentation;
- (CKStickerDetailViewController)initWithEmojiImageMediaObjects:(id)a3;
- (CKStickerDetailViewController)initWithStickerChatItems:(id)a3;
- (CKStickerDetailViewControllerDelegate)delegate;
- (NSArray)stickerDetailsItems;
- (UITableView)tableView;
- (UIVisualEffectView)visualEffectView;
- (id)_adamIDForStickersDetailItem:(id)a3;
- (id)_deleteSwipeActionForIndexPath:(id)a3;
- (id)_indexPathForTransferGUID:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)stickerDetailsItemType;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3;
- (void)_previewDidChangeNotification:(id)a3;
- (void)_reloadCellWithTransferGUID:(id)a3;
- (void)deleteStickerSelectedAtIndexPath:(id)a3;
- (void)loadView;
- (void)saveStickerButtonSelectedAtIndexPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreserveModalPresentationStyle:(BOOL)a3;
- (void)setStickerDetailsItemType:(int64_t)a3;
- (void)setStickerDetailsItems:(id)a3;
- (void)setTableView:(id)a3;
- (void)setVisualEffectView:(id)a3;
- (void)setWantsWindowedPresentation:(BOOL)a3;
- (void)stickerDetailViewControllerCloseButtonPressed:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLayoutSubviews;
- (void)viewStickerAppButtonSelectedAtIndexPath:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKStickerDetailViewController

- (CKStickerDetailViewController)initWithEmojiImageMediaObjects:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKStickerDetailViewController;
  v5 = [(CKStickerDetailViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stickerDetailsItems = v5->_stickerDetailsItems;
    v5->_stickerDetailsItems = (NSArray *)v6;

    v5->_stickerDetailsItemType = 1;
  }

  return v5;
}

- (CKStickerDetailViewController)initWithStickerChatItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKStickerDetailViewController;
  v5 = [(CKStickerDetailViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stickerDetailsItems = v5->_stickerDetailsItems;
    v5->_stickerDetailsItems = (NSArray *)v6;

    v5->_stickerDetailsItemType = 0;
  }

  return v5;
}

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)CKStickerDetailViewController;
  [(CKStickerDetailViewController *)&v19 loadView];
  v3 = [(CKStickerDetailViewController *)self view];
  [v3 setLayoutMarginsFollowReadableWidth:1];

  id v4 = [(CKStickerDetailViewController *)self view];
  [v4 setBackgroundColor:0];

  id v5 = objc_alloc(MEMORY[0x1E4F42E98]);
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = objc_msgSend(v5, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  [v10 setDataSource:self];
  [v10 setDelegate:self];
  [v10 setAutoresizingMask:18];
  [v10 setRowHeight:*MEMORY[0x1E4F43D18]];
  [(CKStickerDetailViewController *)self setTableView:v10];
  v11 = [(CKStickerDetailViewController *)self view];
  [v11 addSubview:v10];

  if (CKIsRunningInMacCatalyst())
  {
    v12 = [MEMORY[0x1E4F428B8] clearColor];
    [v10 setBackgroundColor:v12];
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, v9);
  [v10 setTableFooterView:v13];
  uint64_t v14 = objc_opt_class();
  v15 = +[CKStickerDetailCell identifier];
  [v10 registerClass:v14 forCellReuseIdentifier:v15];

  objc_msgSend(v10, "__ck_scrollToTop:", 0);
  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 addObserver:self selector:sel__previewDidChangeNotification_ name:@"CKPreviewDidChangeNotification" object:0];
  [v16 addObserver:self selector:sel__adaptiveImageGlyphWasGeneratedNotification_ name:@"CKAdaptiveImageGlyphGeneratedNotification" object:0];
  if (!CKIsRunningInMacCatalyst())
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_stickerDetailViewControllerCloseButtonPressed_];
    v18 = [(CKStickerDetailViewController *)self navigationItem];
    [v18 setRightBarButtonItem:v17];
  }
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CKStickerDetailViewController;
  [(CKStickerDetailViewController *)&v11 viewDidLayoutSubviews];
  v3 = [(CKStickerDetailViewController *)self tableView];
  id v4 = [(CKStickerDetailViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  int64_t stickerDetailsItemType = self->_stickerDetailsItemType;
  if (stickerDetailsItemType)
  {
    if (stickerDetailsItemType != 1)
    {
      double v9 = 0;
      goto LABEL_7;
    }
    double v6 = CKFrameworkBundle();
    double v7 = v6;
    double v8 = @"EMOJI_DETAILS_NAVIGATION_BAR_TITLE";
  }
  else
  {
    double v6 = CKFrameworkBundle();
    double v7 = v6;
    double v8 = @"STICKER_TITLE";
  }
  double v9 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_7:
  v10 = [(CKStickerDetailViewController *)self navigationItem];
  [v10 setTitle:v9];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKStickerDetailViewController;
  [(CKStickerDetailViewController *)&v5 viewWillAppear:a3];
  id v4 = [(CKStickerDetailViewController *)self tableView];
  objc_msgSend(v4, "__ck_scrollToTop:", 0);
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_stickerDetailsItems count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = +[CKStickerDetailCell identifier];
  double v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  [v9 setDelegate:self];
  uint64_t v10 = [v6 item];

  objc_super v11 = [(NSArray *)self->_stickerDetailsItems objectAtIndex:v10];
  v12 = [v11 stickerDetailsPreview];
  [v9 setStickerPreview:v12];
  v13 = [v11 stickerDetailsTitleText];
  [v9 setTitleText:v13];
  uint64_t v14 = [v11 stickerDetailsSubtitleText];
  [v9 setSubtitleText:v14];

  if ([(CKStickerDetailViewController *)self canSaveStickerForItem:v11]) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = [(CKStickerDetailViewController *)self canViewStickerPackForItem:v11];
  }
  [v9 setAdditionalActionType:v15];
  v16 = [v11 stickerDetailsDateAdded];
  [v9 setTimestampDate:v16];

  return v9;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)shouldHideViewButtonInStickerDetailsForIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F6CAF8]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6CB78]];
  }

  return v4;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  char v4 = -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", objc_msgSend(a4, "item", a3));
  char v5 = [v4 canDeleteFromStickerDetails];

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1) {
    [(CKStickerDetailViewController *)self deleteStickerSelectedAtIndexPath:a5];
  }
}

- (void)deleteStickerSelectedAtIndexPath:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", [v4 item]);
  id v6 = [v5 stickerDetailsTransferGUID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained stickerDetailViewController:self deletedStickerWithTransferGUID:v6];

  double v8 = [(CKStickerDetailViewController *)self stickerDetailsItems];
  double v9 = (void *)[v8 mutableCopy];

  [v9 removeObject:v5];
  uint64_t v10 = (void *)[v9 copy];
  [(CKStickerDetailViewController *)self setStickerDetailsItems:v10];

  objc_super v11 = [(CKStickerDetailViewController *)self tableView];
  v15[0] = v4;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v11 deleteRowsAtIndexPaths:v12 withRowAnimation:100];

  if (![(NSArray *)self->_stickerDetailsItems count])
  {
    dispatch_time_t v13 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__CKStickerDetailViewController_deleteStickerSelectedAtIndexPath___block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __66__CKStickerDetailViewController_deleteStickerSelectedAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stickerDetailViewControllerCloseButtonPressed:0];
}

- (void)saveStickerButtonSelectedAtIndexPath:(id)a3
{
  -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", [a3 item]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(CKStickerDetailViewController *)self dismissModalViewControllerAnimated:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 saveStickerFromDetailViewController:self chatItemContainingSticker:v4];
  }
  else
  {
    id v4 = [v8 saveableSticker];
    if (!v4) {
      goto LABEL_7;
    }
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 stickerDetailViewController:self didRequestSaveSticker:v4];
  }

LABEL_7:
}

- (void)viewStickerAppButtonSelectedAtIndexPath:(id)a3
{
  -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", [a3 item]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = -[CKStickerDetailViewController _adamIDForStickersDetailItem:](self, "_adamIDForStickersDetailItem:");
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stickerDetailViewController:self selectedStickerPackWithAdamID:v4];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)wantsWindowedPresentation
{
  self->_wantsWindowedPresentation = 1;
  return 1;
}

- (BOOL)preserveModalPresentationStyle
{
  self->_preserveModalPresentationStyle = 1;
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 1;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", [v5 item]);
  if ([v6 canDeleteFromStickerDetails])
  {
    id v7 = [(CKStickerDetailViewController *)self _deleteSwipeActionForIndexPath:v5];
    id v8 = (void *)MEMORY[0x1E4F42E68];
    v12[0] = v7;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v10 = [v8 configurationWithActions:v9];

    [v10 setPerformsFirstActionWithFullSwipe:1];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_deleteSwipeActionForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F42900];
  id v6 = CKFrameworkBundle();
  id v7 = [v6 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __64__CKStickerDetailViewController__deleteSwipeActionForIndexPath___block_invoke;
  uint64_t v15 = &unk_1E5628638;
  v16 = self;
  id v17 = v4;
  id v8 = v4;
  double v9 = [v5 contextualActionWithStyle:1 title:v7 handler:&v12];

  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"trash.fill", v12, v13, v14, v15, v16);
  [v9 setImage:v10];

  return v9;
}

uint64_t __64__CKStickerDetailViewController__deleteSwipeActionForIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteStickerSelectedAtIndexPath:*(void *)(a1 + 40)];
}

- (id)_adamIDForStickersDetailItem:(id)a3
{
  id v3 = [a3 stickerDetailsTransferGUID];
  if ([v3 length])
  {
    id v4 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    id v5 = [v4 transferForGUID:v3];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 attributionInfo];
      id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6D3C8]];
      double v9 = v8;
      if (v8 && [v8 integerValue]) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)canViewStickerPackForItem:(id)a3
{
  id v3 = [(CKStickerDetailViewController *)self _adamIDForStickersDetailItem:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)canSaveStickerForItem:(id)a3
{
  id v3 = [a3 saveableSticker];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)stickerDetailViewControllerCloseButtonPressed:(id)a3
{
}

- (id)_indexPathForTransferGUID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  stickerDetailsItems = self->_stickerDetailsItems;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __59__CKStickerDetailViewController__indexPathForTransferGUID___block_invoke;
  uint64_t v13 = &unk_1E5628660;
  id v6 = v4;
  id v14 = v6;
  uint64_t v15 = &v16;
  [(NSArray *)stickerDetailsItems enumerateObjectsUsingBlock:&v10];
  uint64_t v7 = v17[3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v7, 0, v10, v11, v12, v13);
  }

  _Block_object_dispose(&v16, 8);

  return v8;
}

void __59__CKStickerDetailViewController__indexPathForTransferGUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 stickerDetailsTransferGUID];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_reloadCellWithTransferGUID:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(CKStickerDetailViewController *)self _indexPathForTransferGUID:a3];
  id v5 = (void *)v4;
  if (v4)
  {
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(UITableView *)self->_tableView reloadRowsAtIndexPaths:v6 withRowAnimation:5];
  }
}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3
{
  id v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v5 transferGUID];
    [(CKStickerDetailViewController *)self _reloadCellWithTransferGUID:v4];
  }
}

- (void)_previewDidChangeNotification:(id)a3
{
  id v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v5 transferGUID];
    [(CKStickerDetailViewController *)self _reloadCellWithTransferGUID:v4];
  }
}

+ (id)stickerBundleIDFromFileTransfer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 attributionInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6D3E0]];
  id v6 = [v5 componentsSeparatedByString:@":"];
  id v7 = [v6 lastObject];

  if (![v7 length])
  {
    id v8 = [v3 stickerUserInfo];
    double v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F6E3B8]];
    uint64_t v10 = [v9 componentsSeparatedByString:@":"];
    uint64_t v11 = [v10 lastObject];

    id v7 = (void *)v11;
  }

  return v7;
}

+ (BOOL)isGenmojiBundleIDFromFileTransfer:(id)a3
{
  id v3 = [a1 stickerBundleIDFromFileTransfer:a3];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6CBD0]];

  return v4;
}

+ (id)localizedAppNameForStickerDetailsFromFileTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributionInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6D3D0]];
  id v7 = [a1 stickerBundleIDFromFileTransfer:v4];

  if ([v7 length])
  {
    id v8 = [MEMORY[0x1E4F223B8] bundleProxyForIdentifier:v7];
    double v9 = [v8 localizedName];
  }
  else
  {
    double v9 = 0;
  }
  int v10 = [v7 isEqualToString:*MEMORY[0x1E4F6CC18]];
  int v11 = [v7 isEqualToString:*MEMORY[0x1E4F6CBD0]];
  int v12 = [v7 isEqualToString:*MEMORY[0x1E4F6CBA8]];
  if (v10)
  {
    if ([v6 length])
    {
LABEL_6:
      id v13 = v6;
LABEL_15:
      id v17 = v13;
      goto LABEL_19;
    }
    if (![v9 length]) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (v11)
  {
    id v14 = CKFrameworkBundle();
    uint64_t v15 = v14;
    uint64_t v16 = @"GENMOJI";
  }
  else
  {
    if (!v12)
    {
      if (![v9 length])
      {
        if ([v6 length]) {
          goto LABEL_6;
        }
LABEL_17:
        id v14 = CKFrameworkBundle();
        uint64_t v15 = v14;
        uint64_t v16 = @"GENERIC_STICKERS_APP_SHORT_TITLE";
        goto LABEL_18;
      }
LABEL_14:
      id v13 = v9;
      goto LABEL_15;
    }
    id v14 = CKFrameworkBundle();
    uint64_t v15 = v14;
    uint64_t v16 = @"EMOJI";
  }
LABEL_18:
  id v17 = [v14 localizedStringForKey:v16 value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_19:

  return v17;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

- (CKStickerDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKStickerDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)stickerDetailsItems
{
  return self->_stickerDetailsItems;
}

- (void)setStickerDetailsItems:(id)a3
{
}

- (int64_t)stickerDetailsItemType
{
  return self->_stickerDetailsItemType;
}

- (void)setStickerDetailsItemType:(int64_t)a3
{
  self->_int64_t stickerDetailsItemType = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_stickerDetailsItems, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end