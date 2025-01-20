@interface CKRecentsViewController
- (BOOL)dragManager:(id)a3 canPeelItem:(id)a4;
- (BOOL)dragManager:(id)a3 canRotateItem:(id)a4;
- (BOOL)dragManager:(id)a3 canScaleItem:(id)a4;
- (BOOL)dragManager:(id)a3 shouldCancelDraggingForItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6;
- (BOOL)hasHandwritingRecents;
- (BOOL)hasStickerRecents;
- (BOOL)isLoaded;
- (BOOL)isLoadingRecents;
- (BOOL)isPreparingForDisplay;
- (BOOL)mayBeKeptInViewHierarchy;
- (BOOL)shouldShowChatChrome;
- (BOOL)stickerBrowserView:(id)a3 shouldDrawBorderAroundSticker:(id)a4;
- (CKRecentsViewController)initWithBalloonPlugin:(id)a3;
- (CKRecentsViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4;
- (MSStickerBrowserView)browserView;
- (NSMutableArray)recentItems;
- (NSMutableDictionary)stickerCache;
- (UILabel)noRecentsLabel;
- (id)_stickerForMSSticker:(id)a3;
- (id)draggingCompletionHandler;
- (id)requestSnapshotDataForPersistance;
- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4;
- (int64_t)_userInterfaceStyle;
- (int64_t)numberOfStickersInStickerBrowserView:(id)a3;
- (void)_loadRecentHandwritingsAndStickersWithCompletion:(id)a3;
- (void)_postBrowserDidPrepareForDisplayNotificationIfNecessary;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)dealloc;
- (void)didTransitionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4;
- (void)dismiss;
- (void)dragManager:(id)a3 didEndDraggingItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6;
- (void)forceTearDownRemoteView;
- (void)insertSticker:(id)a3 completionHandler:(id)a4;
- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 completionHandler:(id)a5;
- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 frameInScreenCoordinates:(CGRect)a5 completionHandler:(id)a6;
- (void)insertSticker:(id)a3 representations:(id)a4 completionHandler:(id)a5;
- (void)insertSticker:(id)a3 representations:(id)a4 forceStage:(BOOL)a5 frameInScreenCoordinates:(CGRect)a6 completionHandler:(id)a7;
- (void)loadRecents;
- (void)loadView;
- (void)prepareForDisplay;
- (void)resortAndReloadRecents;
- (void)saveSnapshotForBrowserViewController;
- (void)setBrowserView:(id)a3;
- (void)setDraggingCompletionHandler:(id)a3;
- (void)setHasHandwritingRecents:(BOOL)a3;
- (void)setHasStickerRecents:(BOOL)a3;
- (void)setIsLoadingRecents:(BOOL)a3;
- (void)setNoRecentsLabel:(id)a3;
- (void)setPreparingForDisplay:(BOOL)a3;
- (void)setRecentItems:(id)a3;
- (void)setStickerCache:(id)a3;
- (void)setupNoRecentsLabel;
- (void)startDragSticker:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKRecentsViewController

- (CKRecentsViewController)initWithBalloonPlugin:(id)a3
{
  return [(CKRecentsViewController *)self initWithBalloonPlugin:a3 dataSource:0];
}

- (CKRecentsViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CKRecentsViewController;
  v4 = [(CKBrowserViewController *)&v11 initWithBalloonPlugin:a3 dataSource:a4];
  v5 = v4;
  if (v4)
  {
    recentItems = v4->_recentItems;
    v4->_recentItems = 0;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stickerCache = v5->_stickerCache;
    v5->_stickerCache = v7;

    v5->_isLoadingRecents = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_RecentsUpdated, (CFStringRef)*MEMORY[0x1E4F6EB20], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(CKRecentsViewController *)v5 loadRecents];
  }
  return v5;
}

- (void)dealloc
{
  +[CKPreviewDispatchCache _invalidateStickerPreviewCache];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F6EB20], 0);
  v4.receiver = self;
  v4.super_class = (Class)CKRecentsViewController;
  [(CKRecentsViewController *)&v4 dealloc];
}

- (void)loadRecents
{
  if (![(CKRecentsViewController *)self isLoadingRecents])
  {
    [(CKRecentsViewController *)self setIsLoadingRecents:1];
    id location = 0;
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __38__CKRecentsViewController_loadRecents__block_invoke;
    v3[3] = &unk_1E5623920;
    objc_copyWeak(&v4, &location);
    [(CKRecentsViewController *)self _loadRecentHandwritingsAndStickersWithCompletion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __38__CKRecentsViewController_loadRecents__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  [WeakRetained setRecentItems:v5];
  id v6 = objc_loadWeakRetained(v2);
  [v6 resortAndReloadRecents];

  id v7 = objc_loadWeakRetained(v2);
  [v7 setIsLoadingRecents:0];
}

- (void)_loadRecentHandwritingsAndStickersWithCompletion:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6E908];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  objc_msgSend(v5, "loadRecentHandwritingsAndStickersWithThumbnailSize:completion:", v4, 80.0, 44.0);
}

- (void)prepareForDisplay
{
  [(CKRecentsViewController *)self setPreparingForDisplay:1];

  [(CKRecentsViewController *)self loadRecents];
}

- (void)didTransitionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  id v4 = [(CKRecentsViewController *)self browserView];
  [v4 invalidateFlowLayout];
}

- (void)forceTearDownRemoteView
{
  id v2 = [(CKRecentsViewController *)self browserView];
  [v2 invalidateFlowLayout];
}

- (void)resortAndReloadRecents
{
  if ([(NSMutableArray *)self->_recentItems count])
  {
    [(NSMutableArray *)self->_recentItems sortUsingComparator:&__block_literal_global_185];
    id v3 = [(CKRecentsViewController *)self browserView];
    [v3 reloadData];

    [(UILabel *)self->_noRecentsLabel removeFromSuperview];
    noRecentsLabel = self->_noRecentsLabel;
    self->_noRecentsLabel = 0;
LABEL_4:

    goto LABEL_5;
  }
  noRecentsLabel = [(CKRecentsViewController *)self recentItems];
  if ([noRecentsLabel count]) {
    goto LABEL_4;
  }
  id v5 = self->_noRecentsLabel;

  if (!v5)
  {
    [(CKRecentsViewController *)self setupNoRecentsLabel];
    noRecentsLabel = [(CKRecentsViewController *)self browserView];
    [noRecentsLabel addSubview:self->_noRecentsLabel];
    goto LABEL_4;
  }
LABEL_5:

  [(CKRecentsViewController *)self _postBrowserDidPrepareForDisplayNotificationIfNecessary];
}

uint64_t __49__CKRecentsViewController_resortAndReloadRecents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 timestamp];
  id v6 = [v4 timestamp];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_postBrowserDidPrepareForDisplayNotificationIfNecessary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(CKRecentsViewController *)self isPreparingForDisplay])
  {
    id v3 = [(CKBrowserViewController *)self balloonPlugin];

    if (v3)
    {
      v9 = @"CKRemoteViewPluginKey";
      id v4 = [(CKBrowserViewController *)self balloonPlugin];
      v10[0] = v4;
      id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__CKRecentsViewController__postBrowserDidPrepareForDisplayNotificationIfNecessary__block_invoke;
    block[3] = &unk_1E5620AF8;
    id v7 = v3;
    v8 = self;
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __82__CKRecentsViewController__postBrowserDidPrepareForDisplayNotificationIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v2, "__mainThreadPostNotificationName:object:userInfo:", @"CKMessageExtensionBrowserViewControllerDidPrepareForDisplay", 0, *(void *)(a1 + 32));

  id v3 = *(void **)(a1 + 40);

  return [v3 setPreparingForDisplay:0];
}

- (void)setupNoRecentsLabel
{
  [(UILabel *)self->_noRecentsLabel removeFromSuperview];
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  id v4 = [(CKRecentsViewController *)self view];
  [v4 frame];
  id v5 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
  noRecentsLabel = self->_noRecentsLabel;
  self->_noRecentsLabel = v5;

  id v7 = self->_noRecentsLabel;
  v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
  [(UILabel *)v7 setFont:v8];

  v9 = self->_noRecentsLabel;
  v10 = CKFrameworkBundle();
  objc_super v11 = [v10 localizedStringForKey:@"NO_RECENTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(UILabel *)v9 setText:v11];

  v12 = self->_noRecentsLabel;

  [(UILabel *)v12 setTextAlignment:1];
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 1;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)CKRecentsViewController;
  [(CKBrowserViewController *)&v9 loadView];
  id v3 = [(CKRecentsViewController *)self view];
  id v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = (MSStickerBrowserView *)objc_msgSend(objc_alloc((Class)MEMORY[0x192FBA860](@"MSStickerBrowserView", @"Messages")), "initWithFrame:stickerSize:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MSStickerBrowserView *)v5 setDataSource:self];
  [(MSStickerBrowserView *)v5 performSelector:sel_setDisplayDelegate_ withObject:self];
  [(MSStickerBrowserView *)v5 setAutoresizingMask:18];
  browserView = self->_browserView;
  self->_browserView = v5;
  id v7 = v5;

  v8 = [(CKRecentsViewController *)self view];
  [v8 addSubview:self->_browserView];
}

- (void)viewDidLayoutSubviews
{
  browserView = self->_browserView;
  id v4 = [(CKRecentsViewController *)self view];
  [v4 bounds];
  -[MSStickerBrowserView setFrame:](browserView, "setFrame:");

  noRecentsLabel = self->_noRecentsLabel;
  if (noRecentsLabel)
  {
    id v6 = [(CKRecentsViewController *)self view];
    [v6 bounds];
    -[UILabel setFrame:](noRecentsLabel, "setFrame:");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKRecentsViewController;
  [(CKBrowserViewController *)&v6 viewWillAppear:a3];
  id v4 = objc_msgSend((id)MEMORY[0x192FBA860](@"_MSStickerSendManager", @"Messages"), "sharedInstance");
  [v4 setDelegate:self];

  id v5 = [(CKRecentsViewController *)self browserView];
  [v5 _startAnimating];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKRecentsViewController;
  [(CKBrowserViewController *)&v5 viewDidDisappear:a3];
  id v4 = [(CKRecentsViewController *)self browserView];
  [v4 _stopAnimating];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKRecentsViewController;
  [(CKRecentsViewController *)&v4 traitCollectionDidChange:a3];
  [(CKRecentsViewController *)self recentsUpdated];
}

- (BOOL)shouldShowChatChrome
{
  return 1;
}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  int64_t result = [(NSMutableArray *)self->_recentItems count];
  if ((unint64_t)result >= 0x19) {
    return 25;
  }
  return result;
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  objc_super v4 = self;
  objc_super v5 = [(NSMutableArray *)self->_recentItems objectAtIndex:a4];
  objc_super v6 = (objc_class *)MEMORY[0x192FBA860](@"MSSticker", @"Messages");
  id v7 = [v5 payloadData];

  if (v7)
  {
    id v8 = [v6 alloc];
    objc_super v9 = [v5 fileURL];
    v10 = [v5 payloadData];
    objc_super v11 = (void *)[v8 initWithContentsOfURL:v9 data:v10 localizedDescription:@"handwriting" error:0];
  }
  else
  {
    objc_super v9 = [v5 messageItemInfo];
    v12 = [v5 fileURL];
    v13 = [v12 path];
    v10 = [v13 lastPathComponent];

    v14 = (void *)MEMORY[0x1E4F1CB10];
    v15 = [v5 fileURL];
    v16 = [v15 path];
    uint64_t v17 = [v14 fileURLWithPath:v16];

    uint64_t v18 = [v9 objectForKey:*MEMORY[0x1E4F6E3B8]];
    v19 = (void *)v18;
    v20 = @"com.apple.messages.Recents";
    if (v18) {
      v20 = (__CFString *)v18;
    }
    v21 = v20;

    id v22 = objc_alloc(MEMORY[0x1E4F6EA58]);
    v23 = [v5 accessibilityString];
    v47 = (void *)v17;
    v24 = (void *)[v22 initWithStickerID:v10 stickerPackID:v21 fileURL:v17 accessibilityLabel:v23 accessibilityName:0 searchText:0 sanitizedPrompt:0 moodCategory:0 stickerName:0];

    v25 = [MEMORY[0x1E4F6BC18] sharedInstance];
    v26 = [v24 stickerPackGUID];
    v27 = [v25 balloonPluginForBundleID:v26];

    v46 = v27;
    v28 = [v27 attributionInfo];
    [v24 setAttributionInfo:v28];

    v29 = [v9 objectForKey:*MEMORY[0x1E4F6E3C8]];
    if ([v29 length])
    {
      v30 = [v29 _FTDataFromHexString];
      [v24 setRecipe:v30];

      v31 = [v9 objectForKey:*MEMORY[0x1E4F6E388]];
      [v24 setBallonBundleID:v31];
    }
    v45 = v29;
    v32 = [v5 accessibilityString];
    uint64_t v33 = [v32 length];

    v34 = NSString;
    v35 = CKFrameworkBundle();
    v36 = v35;
    if (v33)
    {
      v37 = [v35 localizedStringForKey:@"STICKER_ACCESSIBILTY_LABEL_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v5 accessibilityString];
      v38 = v4;
      v40 = v39 = v6;
      v41 = objc_msgSend(v34, "stringWithFormat:", v37, v40);

      objc_super v6 = v39;
      objc_super v4 = v38;
    }
    else
    {
      v37 = [v35 localizedStringForKey:@"STICKER_ACCESSIBILTY_LABEL_NO_CONTENT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v41 = [v34 stringWithFormat:v37];
    }

    objc_super v11 = (void *)[[v6 alloc] initWithContentsOfFileURL:v47 localizedDescription:v41 error:0];
    stickerCache = v4->_stickerCache;
    v43 = [v11 imageFileURL];
    [(NSMutableDictionary *)stickerCache setObject:v24 forKey:v43];
  }

  return v11;
}

- (id)_stickerForMSSticker:(id)a3
{
  objc_super v4 = [a3 imageFileURL];
  objc_super v5 = [(NSMutableDictionary *)self->_stickerCache objectForKey:v4];

  return v5;
}

- (id)requestSnapshotDataForPersistance
{
  id v2 = [(CKRecentsViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [MEMORY[0x1E4F42D90] mainScreen];
  [v11 scale];
  CGFloat v13 = v12;
  v18.width = v8;
  v18.height = v10;
  UIGraphicsBeginImageContextWithOptions(v18, 1, v13);

  objc_msgSend(v2, "drawViewHierarchyInRect:afterScreenUpdates:", 0, v4, v6, v8, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v15 = UIImagePNGRepresentation(v14);

  return v15;
}

- (void)saveSnapshotForBrowserViewController
{
  int64_t v3 = [(CKRecentsViewController *)self _userInterfaceStyle];
  double v4 = [(CKRecentsViewController *)self view];
  [v4 bounds];
  +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", @"com.apple.messages.browser.RecentPlugin", v3);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  double v5 = [(CKRecentsViewController *)self requestSnapshotDataForPersistance];
  double v6 = (void *)MEMORY[0x1E4F42A80];
  double v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 scale];
  double v8 = objc_msgSend(v6, "imageWithData:scale:", v5);

  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v8];
  double v10 = [v16 stringValue];
  objc_super v11 = CKBrowserSnapshotPreviewURL(v10, @"png");

  CKFreeSpaceWriteDataToURL(v5, v11, 1);
  double v12 = +[CKBalloonPluginManager sharedInstance];
  CGFloat v13 = [v12 snapshotCache];
  v14 = [v16 stringValue];
  [v13 setCachedPreview:v9 key:v14];

  v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:@"CKBalloonPluginManagerSnapshotsDidChange" object:0];
}

- (void)dismiss
{
  v2.receiver = self;
  v2.super_class = (Class)CKRecentsViewController;
  [(CKBrowserViewController *)&v2 dismiss];
}

- (BOOL)isLoaded
{
  v3.receiver = self;
  v3.super_class = (Class)CKRecentsViewController;
  return [(CKBrowserViewController *)&v3 isLoaded];
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double bottom = a3.bottom;
  double top = a3.top;
  v6.receiver = self;
  v6.super_class = (Class)CKRecentsViewController;
  -[CKRecentsViewController _setContentOverlayInsets:](&v6, sel__setContentOverlayInsets_, a3.top, a3.left, a3.bottom, a3.right);
  -[CKRecentsViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", top, 0.0, bottom, 0.0);
}

- (void)insertSticker:(id)a3 representations:(id)a4 completionHandler:(id)a5
{
}

- (void)insertSticker:(id)a3 completionHandler:(id)a4
{
}

- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 completionHandler:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CKRecentsViewController.m", 338, @"Unexpected call to %s", "-[CKRecentsViewController insertSticker:forceStage:completionHandler:]");
}

- (void)insertSticker:(id)a3 representations:(id)a4 forceStage:(BOOL)a5 frameInScreenCoordinates:(CGRect)a6 completionHandler:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v12 = a3;
  CGFloat v13 = [v12 data];

  if (v13)
  {
    v14 = objc_alloc_init(CKBrowserItemPayload);
    v15 = [v12 data];

    [(CKBrowserItemPayload *)v14 setData:v15];
    [(CKBrowserItemPayload *)v14 setPluginBundleID:@"com.apple.Handwriting.HandwritingProvider"];
    id v16 = [(CKBrowserViewController *)self sendDelegate];
    [v16 startEditingPayload:v14];
  }
  else
  {
    v14 = [(CKBrowserViewController *)self sendDelegate];
    id v16 = [(CKRecentsViewController *)self _stickerForMSSticker:v12];

    -[CKBrowserItemPayload commitSticker:stickerFrame:](v14, "commitSticker:stickerFrame:", v16, x, y, width, height);
  }

  uint64_t v17 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v17 trackEvent:*MEMORY[0x1E4F6DC70]];

  if ([(CKBrowserViewController *)self inExpandedPresentation])
  {
    id v18 = [(CKBrowserViewController *)self sendDelegate];
    [v18 dismissAndReloadInputViews:1];
  }
}

- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 frameInScreenCoordinates:(CGRect)a5 completionHandler:(id)a6
{
}

- (void)startDragSticker:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v25 = a3;
  id v12 = a6;
  CGFloat v13 = [v25 data];

  if (v13)
  {
    if (v12) {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    }
  }
  else
  {
    v24 = [v25 imageFileURL];
    v14 = [[CKImageData alloc] initWithURL:v24];
    v15 = [(CKImageData *)v14 durationsWithMaxCount:0x7FFFFFFFLL];
    id v16 = [MEMORY[0x1E4F1CA48] array];
    if ([(CKImageData *)v14 count])
    {
      unint64_t v17 = 0;
      do
      {
        id v18 = -[CKImageData thumbnailAtIndex:fillToSize:maxCount:](v14, "thumbnailAtIndex:fillToSize:maxCount:", v17, 0x7FFFFFFFLL, 1.79769313e308, 1.79769313e308);
        if (v18) {
          [v16 addObject:v18];
        }

        ++v17;
      }
      while (v17 < [(CKImageData *)v14 count]);
    }
    v19 = [[CKAnimatedImage alloc] initWithImages:v16 durations:v15];
    v20 = [(CKBrowserViewController *)self browserDragManager];
    v21 = [(CKRecentsViewController *)self view];
    id v22 = [(CKRecentsViewController *)self view];
    v23 = [v22 window];
    objc_msgSend(v21, "convertRect:fromView:", v23, x, y, width, height);
    objc_msgSend(v20, "beginDraggingItem:withAnimatedDragImage:fromRect:", v25, v19);

    [(CKRecentsViewController *)self setDraggingCompletionHandler:v12];
  }
}

- (BOOL)dragManager:(id)a3 shouldCancelDraggingForItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6
{
  return (a6 & 0xFFFFFFFD) == 1;
}

- (void)dragManager:(id)a3 didEndDraggingItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  CGFloat v13 = [(CKBrowserViewController *)self sendDelegate];
  v14 = [(CKRecentsViewController *)self _stickerForMSSticker:v11];

  v15 = [v12 draggedSticker];

  [v13 commitSticker:v14 withDragTarget:v10 draggedSticker:v15];
  id v16 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v16 trackEvent:*MEMORY[0x1E4F6DC70]];

  unint64_t v17 = [(CKRecentsViewController *)self draggingCompletionHandler];

  if (v17)
  {
    id v18 = [(CKRecentsViewController *)self draggingCompletionHandler];
    ((void (**)(void, BOOL, void))v18)[2](v18, (a6 & 0xFFFFFFFD) == 1, 0);

    [(CKRecentsViewController *)self setDraggingCompletionHandler:0];
  }
}

- (BOOL)dragManager:(id)a3 canScaleItem:(id)a4
{
  double v4 = objc_msgSend(a4, "data", a3);
  BOOL v5 = v4 == 0;

  return v5;
}

- (BOOL)dragManager:(id)a3 canRotateItem:(id)a4
{
  double v4 = objc_msgSend(a4, "data", a3);
  BOOL v5 = v4 == 0;

  return v5;
}

- (BOOL)dragManager:(id)a3 canPeelItem:(id)a4
{
  double v4 = objc_msgSend(a4, "data", a3);
  BOOL v5 = v4 == 0;

  return v5;
}

- (BOOL)stickerBrowserView:(id)a3 shouldDrawBorderAroundSticker:(id)a4
{
  double v4 = objc_msgSend(a4, "data", a3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (int64_t)_userInterfaceStyle
{
  objc_super v2 = [(CKRecentsViewController *)self view];
  objc_super v3 = [v2 traitCollection];
  int64_t v4 = [v3 userInterfaceStyle];

  return v4;
}

- (BOOL)hasHandwritingRecents
{
  return self->_hasHandwritingRecents;
}

- (void)setHasHandwritingRecents:(BOOL)a3
{
  self->_hasHandwritingRecents = a3;
}

- (BOOL)hasStickerRecents
{
  return self->_hasStickerRecents;
}

- (void)setHasStickerRecents:(BOOL)a3
{
  self->_hasStickerRecents = a3;
}

- (NSMutableArray)recentItems
{
  return self->_recentItems;
}

- (void)setRecentItems:(id)a3
{
}

- (MSStickerBrowserView)browserView
{
  return self->_browserView;
}

- (void)setBrowserView:(id)a3
{
}

- (UILabel)noRecentsLabel
{
  return self->_noRecentsLabel;
}

- (void)setNoRecentsLabel:(id)a3
{
}

- (NSMutableDictionary)stickerCache
{
  return self->_stickerCache;
}

- (void)setStickerCache:(id)a3
{
}

- (BOOL)isLoadingRecents
{
  return self->_isLoadingRecents;
}

- (void)setIsLoadingRecents:(BOOL)a3
{
  self->_isLoadingRecents = a3;
}

- (BOOL)isPreparingForDisplay
{
  return self->_preparingForDisplay;
}

- (void)setPreparingForDisplay:(BOOL)a3
{
  self->_preparingForDispladouble y = a3;
}

- (id)draggingCompletionHandler
{
  return self->_draggingCompletionHandler;
}

- (void)setDraggingCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_draggingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_stickerCache, 0);
  objc_storeStrong((id *)&self->_noRecentsLabel, 0);
  objc_storeStrong((id *)&self->_browserView, 0);

  objc_storeStrong((id *)&self->_recentItems, 0);
}

@end