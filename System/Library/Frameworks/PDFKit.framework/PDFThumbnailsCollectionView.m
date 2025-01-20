@interface PDFThumbnailsCollectionView
- (BOOL)_canEditDocument;
- (BOOL)allowsPageReordering;
- (BOOL)shouldDisplayActionButtonForPage:(id)a3;
- (CGSize)thumbnailSizeForPage:(id)a3;
- (CGSize)thumbnailSizeForPage:(id)a3 displayBox:(int64_t)a4;
- (CGSize)thumbnailSizeForPage:(id)a3 displayBox:(int64_t)a4 thumbnailView:(id)a5;
- (id)_pasteActionIfAvailableAfterPage:(id)a3;
- (id)cacheKeyForPage:(id)a3;
- (id)cachedImageForPage:(id)a3 displayBox:(int64_t)a4 thumbnailView:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)contextMenuForBackgroundAtLocation:(CGPoint)a3;
- (id)contextMenuForPage:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)currentPage;
- (id)datasourceQueue;
- (id)defaultContextMenuForPage:(id)a3;
- (id)imageDrawingOperationQueue;
- (id)initFromThumbnailView:(id)a3;
- (id)itemsForDragWithSession:(id)a3 atIndexPath:(id)a4;
- (id)makeDatasource;
- (id)previewForCollectionView:(id)a3 contextMenuInteraction:(id)a4;
- (id)previewForCollectionView:(id)a3 indexPath:(id)a4;
- (id)supportedUTTypes;
- (unint64_t)_insertPagesFromProvidedPDFDocument:(id)a3 atPageIndex:(unint64_t)a4;
- (void)_insertFileAtURL:(id)a3 type:(id)a4 atIndex:(unint64_t)a5 completionHandler:(id)a6;
- (void)_insertImageWithURL:(id)a3 atIndex:(unint64_t)a4 completionHandler:(id)a5;
- (void)_insertPDFDocumentWithURL:(id)a3 atIndex:(unint64_t)a4 completionHandler:(id)a5;
- (void)_reloadPage:(id)a3;
- (void)_selectAndScrollToCurrentPageIfNeeded;
- (void)_updateActionsButtonVisibilityAtIndexPath:(id)a3;
- (void)_updateScrubber;
- (void)applySnapshotWithAnimation:(BOOL)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureCell:(id)a3 withPage:(id)a4 indexPath:(id)a5;
- (void)copyPage:(id)a3;
- (void)currentPageChanged:(id)a3;
- (void)documentChanged:(id)a3;
- (void)documentMutated:(id)a3;
- (void)insertPages:(id)a3 atIndexes:(id)a4;
- (void)itemProvider:(id)a3 registerDataRepresentationForPage:(id)a4 draggedPages:(id)a5;
- (void)itemProvider:(id)a3 registerFileRepresentationForPage:(id)a4 draggedPages:(id)a5;
- (void)loadImageWithPage:(id)a3 displayBox:(int64_t)a4 thumbnailView:(id)a5 completionHandler:(id)a6;
- (void)movePage:(id)a3 toIndex:(unint64_t)a4;
- (void)movePageWithTransaction:(id)a3;
- (void)pageChanged:(id)a3;
- (void)pasteAfterPage:(id)a3;
- (void)removePages:(id)a3;
- (void)setAllowsPageReordering:(BOOL)a3;
- (void)updateCacheForPage:(id)a3 withImage:(id)a4;
- (void)updateIconsImages;
- (void)updateImageForCell:(id)a3 atIndexPath:(id)a4;
- (void)updateImageForCell:(id)a3 indexPath:(id)a4 page:(id)a5;
- (void)writePDFDocumentFromPages:(id)a3 completionHandler:(id)a4;
@end

@implementation PDFThumbnailsCollectionView

- (id)initFromThumbnailView:(id)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PDFThumbnailsCollectionView;
  v5 = [(PDFThumbnailsCollectionView *)&v33 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_thumbnailView, v4);
    uint64_t v7 = objc_opt_new();
    cache = v6->_cache;
    v6->_cache = (NSCache *)v7;

    id v9 = objc_alloc_init(MEMORY[0x263F82570]);
    [v9 setScrollDirection:0];
    objc_msgSend(v9, "setSectionInset:", 5.0, 0.0, 5.0, 0.0);
    [v9 setMinimumLineSpacing:0.0];
    v32 = v9;
    objc_msgSend(v9, "setEstimatedItemSize:", *MEMORY[0x263F833F8], *(double *)(MEMORY[0x263F833F8] + 8));
    id v10 = objc_alloc(MEMORY[0x263F82528]);
    [v4 bounds];
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:collectionViewLayout:", v9);
    collectionView = v6->_collectionView;
    v6->_collectionView = (UICollectionView *)v11;

    [(PDFThumbnailsCollectionView *)v6 addSubview:v6->_collectionView];
    [(UICollectionView *)v6->_collectionView setDragInteractionEnabled:1];
    [(UICollectionView *)v6->_collectionView setDragDelegate:v6];
    [(UICollectionView *)v6->_collectionView setDropDelegate:v6];
    [(UICollectionView *)v6->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = (void *)MEMORY[0x263F08938];
    v31 = [(UICollectionView *)v6->_collectionView bottomAnchor];
    v30 = [(PDFThumbnailsCollectionView *)v6 bottomAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v34[0] = v29;
    v28 = [(UICollectionView *)v6->_collectionView topAnchor];
    v27 = [(PDFThumbnailsCollectionView *)v6 topAnchor];
    v25 = [v28 constraintEqualToAnchor:v27];
    v34[1] = v25;
    v13 = [(UICollectionView *)v6->_collectionView leadingAnchor];
    v14 = [(PDFThumbnailsCollectionView *)v6 leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v34[2] = v15;
    v16 = [(UICollectionView *)v6->_collectionView trailingAnchor];
    v17 = [(PDFThumbnailsCollectionView *)v6 trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v34[3] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
    [v26 activateConstraints:v19];

    [(UICollectionView *)v6->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PDFIconCollectionViewCell"];
    uint64_t v20 = [(PDFThumbnailsCollectionView *)v6 makeDatasource];
    dataSource = v6->_dataSource;
    v6->_dataSource = (UICollectionViewDiffableDataSource *)v20;

    [(UICollectionView *)v6->_collectionView setDataSource:v6->_dataSource];
    [(UICollectionView *)v6->_collectionView setDelegate:v6];
    v22 = [MEMORY[0x263F825C8] clearColor];
    [(UICollectionView *)v6->_collectionView setBackgroundColor:v22];

    v23 = (void *)[objc_alloc(MEMORY[0x263F82628]) initWithDelegate:v6];
    [(UICollectionView *)v6->_collectionView addInteraction:v23];
  }
  return v6;
}

- (id)makeDatasource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F82560]);
  collectionView = self->_collectionView;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke;
  v11[3] = &unk_264203F00;
  objc_copyWeak(&v12, &location);
  v5 = (void *)[v3 initWithCollectionView:collectionView cellProvider:v11];
  v6 = [v5 reorderingHandlers];
  [v6 setCanReorderItemHandler:&__block_literal_global_5];

  uint64_t v7 = [v5 reorderingHandlers];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke_3;
  v9[3] = &unk_264203F48;
  objc_copyWeak(&v10, &location);
  [v7 setDidReorderHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v5;
}

id __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a2 dequeueReusableCellWithReuseIdentifier:@"PDFIconCollectionViewCell" forIndexPath:v7];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (v8 && WeakRetained) {
    [WeakRetained configureCell:v9 withPage:v8 indexPath:v7];
  }

  return v9;
}

uint64_t __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke_2()
{
  return 1;
}

void __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained movePageWithTransaction:v5];
  }
}

- (void)updateImageForCell:(id)a3 indexPath:(id)a4 page:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 page];

  if (v11 == v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    v13 = [WeakRetained PDFView];
    v14 = [v13 document];
    v15 = [v14 renderingProperties];
    uint64_t v16 = [v15 displayBox];

    v17 = [(PDFThumbnailsCollectionView *)self cachedImageForPage:v10 displayBox:v16 thumbnailView:WeakRetained];
    if (v17)
    {
      v18 = [v8 imageView];
      v19 = [v18 image];

      if (v17 != v19)
      {
        uint64_t v20 = [v9 item];
        _PDFLog(OS_LOG_TYPE_INFO, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Setting cell image for cell n°%lu", v21, v22, v23, v24, v25, v20);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __65__PDFThumbnailsCollectionView_updateImageForCell_indexPath_page___block_invoke_2;
        block[3] = &unk_264203F98;
        id v33 = v8;
        id v34 = v17;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
    else
    {
      uint64_t v26 = [v9 item];
      _PDFLog(OS_LOG_TYPE_INFO, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Image for cell n°%lu is not cached", v27, v28, v29, v30, v31, v26);
      objc_initWeak(&location, self);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __65__PDFThumbnailsCollectionView_updateImageForCell_indexPath_page___block_invoke;
      v35[3] = &unk_264203F70;
      objc_copyWeak(&v38, &location);
      id v36 = v8;
      id v37 = v10;
      [(PDFThumbnailsCollectionView *)self loadImageWithPage:v37 displayBox:v16 thumbnailView:WeakRetained completionHandler:v35];

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
  }
}

void __65__PDFThumbnailsCollectionView_updateImageForCell_indexPath_page___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v8)
  {
    if (WeakRetained)
    {
      id v5 = [*(id *)(a1 + 32) page];
      v6 = *(void **)(a1 + 40);

      if (v5 == v6)
      {
        id v7 = [*(id *)(a1 + 32) imageView];
        [v7 setImage:v8];
      }
    }
  }
}

void __65__PDFThumbnailsCollectionView_updateImageForCell_indexPath_page___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:v1];
}

- (void)configureCell:(id)a3 withPage:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 item];
  _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Configuring cell n°%lu", v12, v13, v14, v15, v16, v11);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v18 = [WeakRetained PDFView];
  v19 = [v18 document];
  uint64_t v20 = [WeakRetained layoutMode];
  [WeakRetained thumbnailSize];
  v50 = v18;
  if (v20) {
    [v8 setThumbnailHeight:v21];
  }
  else {
    objc_msgSend(v8, "setThumbnailWidth:");
  }
  uint64_t v22 = [v19 renderingProperties];
  uint64_t v23 = [v22 displayBox];

  [v9 boundsForBox:v23];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  memset(&v55, 0, sizeof(v55));
  double v32 = PDFDegToRad((double)[v9 rotation]);
  CGAffineTransformMakeRotation(&v55, v32);
  CGAffineTransform v54 = v55;
  v56.origin.x = v25;
  v56.origin.y = v27;
  v56.size.width = v29;
  v56.size.height = v31;
  CGRect v57 = CGRectApplyAffineTransform(v56, &v54);
  objc_msgSend(v8, "updateAspectConstraintWithSize:", v57.size.width, v57.size.height);
  [v8 setPage:v9];
  [(PDFThumbnailsCollectionView *)self updateImageForCell:v8 indexPath:v10 page:v9];
  objc_initWeak((id *)&v54, self);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __64__PDFThumbnailsCollectionView_configureCell_withPage_indexPath___block_invoke;
  v51[3] = &unk_264203FC0;
  objc_copyWeak(&v53, (id *)&v54);
  id v33 = v9;
  id v52 = v33;
  id v34 = [v8 actionsButton];
  [v34 _setMenuProvider:v51];

  v35 = [v8 actionsButton];
  [v35 setShowsMenuAsPrimaryAction:1];

  LODWORD(v35) = [(PDFThumbnailsCollectionView *)self shouldDisplayActionButtonForPage:v33];
  id v36 = [v8 actionsButton];
  [v36 setHidden:v35 ^ 1];

  [v8 invalidateIntrinsicContentSize];
  id v37 = [v33 document];
  uint64_t v38 = [v37 indexForPage:v33];

  v39 = NSString;
  v40 = PDFKitLocalizedString(@"Thumbnail for page %ld");
  uint64_t v41 = v38 + 1;
  v42 = objc_msgSend(v39, "stringWithFormat:", v40, v38 + 1);
  [v8 setAccessibilityLabel:v42];

  v43 = PDFKitLocalizedString(@"PDF thumbnail");
  [v8 setAccessibilityIdentifier:v43];

  v44 = NSString;
  v45 = PDFKitLocalizedString(@"Page actions for page %ld");
  v46 = objc_msgSend(v44, "stringWithFormat:", v45, v41);
  v47 = [v8 actionsButton];
  [v47 setAccessibilityLabel:v46];

  v48 = PDFKitLocalizedString(@"Page actions");
  v49 = [v8 actionsButton];
  [v49 setAccessibilityIdentifier:v48];

  objc_destroyWeak(&v53);
  objc_destroyWeak((id *)&v54);
}

id __64__PDFThumbnailsCollectionView_configureCell_withPage_indexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained contextMenuForPage:*(void *)(a1 + 32)];

  return v3;
}

- (id)cacheKeyForPage:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v11 = @"pageHash";
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "hash"));
  v12[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v7 = [v4 dictionaryWithDictionary:v6];

  id v8 = [v3 lastAnnotationChange];
  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:@"lastAnnotation"];
  }
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "rotation"));
  [v7 setObject:v9 forKeyedSubscript:@"rotation"];

  return v7;
}

- (void)updateCacheForPage:(id)a3 withImage:(id)a4
{
  if (a3 && a4)
  {
    id v7 = a4;
    id v8 = a3;
    size_t Height = CGImageGetHeight((CGImageRef)[v7 CGImage]);
    id v10 = v7;
    *(double *)&uint64_t v11 = (double)(4 * Height * CGImageGetBytesPerRow((CGImageRef)[v10 CGImage]));
    _PDFLog(OS_LOG_TYPE_INFO, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Adding new image to the cache with a cost of %f", v12, v13, v14, v15, v16, v11);
    cache = self->_cache;
    id v23 = [(PDFThumbnailsCollectionView *)self cacheKeyForPage:v8];

    [(NSCache *)cache setObject:v10 forKey:v23 cost:(unint64_t)*(double *)&v11];
  }
  else
  {
    a4;
    id v23 = a3;
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Invalid nil parameter(s) to [updateCacheForPage:%p withImage:%p]", v18, v19, v20, v21, v22, (uint64_t)v23);
  }
}

- (id)cachedImageForPage:(id)a3 displayBox:(int64_t)a4 thumbnailView:(id)a5
{
  cache = self->_cache;
  v6 = -[PDFThumbnailsCollectionView cacheKeyForPage:](self, "cacheKeyForPage:", a3, a4, a5);
  id v7 = [(NSCache *)cache objectForKey:v6];

  return v7;
}

- (void)loadImageWithPage:(id)a3 displayBox:(int64_t)a4 thumbnailView:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 document];
  uint64_t v14 = [v13 pageCount];
  unint64_t v15 = [v13 indexForPage:v10];
  if (v15 > 0x7FFFFFFFFFFFFFFELL || v15 > v14 - 1)
  {
    uint64_t v19 = [MEMORY[0x263F08A48] mainQueue];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke;
    v29[3] = &unk_264203FE8;
    id v31 = v12;
    id v30 = v10;
    [v19 addOperationWithBlock:v29];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v16 = (void *)MEMORY[0x263F086D0];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_2;
    id v23 = &unk_264204038;
    objc_copyWeak(v27, &location);
    id v26 = v12;
    id v24 = v10;
    v27[1] = (id)a4;
    id v25 = v11;
    v17 = [v16 blockOperationWithBlock:&v20];
    uint64_t v18 = [(PDFThumbnailsCollectionView *)self imageDrawingOperationQueue];
    [v18 addOperation:v17];

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
}

uint64_t __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_2(uint64_t a1)
{
  v23[2] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained thumbnailSizeForPage:*(void *)(a1 + 32) displayBox:*(void *)(a1 + 64) thumbnailView:*(void *)(a1 + 40)];
    double v5 = v4;
    double v7 = v6;
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 64);
    v22[0] = @"PDFPageImageProperty_DrawAnnotations";
    v22[1] = @"PDFPageImageProperty_WithRotation";
    v23[0] = MEMORY[0x263EFFA88];
    v23[1] = MEMORY[0x263EFFA88];
    id v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v11 = objc_msgSend(v8, "imageOfSize:forBox:withOptions:", v9, v10, v5, v7);

    [v3 updateCacheForPage:*(void *)(a1 + 32) withImage:v11];
    id v12 = [MEMORY[0x263F08A48] mainQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_4;
    v15[3] = &unk_264204010;
    id v18 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 32);
    id v17 = v11;
    id v13 = v11;
    [v12 addOperationWithBlock:v15];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F08A48] mainQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_3;
    v19[3] = &unk_264203FE8;
    id v21 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 32);
    [v14 addOperationWithBlock:v19];

    id v13 = v21;
  }
}

uint64_t __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)datasourceQueue
{
  if (datasourceQueue_once != -1) {
    dispatch_once(&datasourceQueue_once, &__block_literal_global_120);
  }
  id v2 = (void *)datasourceQueue__datasourceQueue;

  return v2;
}

void __46__PDFThumbnailsCollectionView_datasourceQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.pdfkit.thumbnails-datasource-queue", attr);
  id v2 = (void *)datasourceQueue__datasourceQueue;
  datasourceQueue__datasourceQueue = (uint64_t)v1;
}

- (id)imageDrawingOperationQueue
{
  if (imageDrawingOperationQueue_once != -1) {
    dispatch_once(&imageDrawingOperationQueue_once, &__block_literal_global_123);
  }
  id v2 = (void *)imageDrawingOperationQueue__imageDrawingOperationQueue;

  return v2;
}

uint64_t __57__PDFThumbnailsCollectionView_imageDrawingOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  dispatch_queue_t v1 = (void *)imageDrawingOperationQueue__imageDrawingOperationQueue;
  imageDrawingOperationQueue__imageDrawingOperationQueue = (uint64_t)v0;

  [(id)imageDrawingOperationQueue__imageDrawingOperationQueue setMaxConcurrentOperationCount:1];
  [(id)imageDrawingOperationQueue__imageDrawingOperationQueue setName:@"com.apple.pdfkit.thumbnails-drawing-operation-queue"];
  id v2 = (void *)imageDrawingOperationQueue__imageDrawingOperationQueue;

  return [v2 setQualityOfService:25];
}

- (void)applySnapshotWithAnimation:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  double v6 = [WeakRetained PDFView];
  double v7 = [v6 document];

  if (WeakRetained) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && ([v7 isLocked] & 1) == 0)
  {
    objc_initWeak(&location, self);
    uint64_t v9 = [(PDFThumbnailsCollectionView *)self datasourceQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__PDFThumbnailsCollectionView_applySnapshotWithAnimation___block_invoke;
    v10[3] = &unk_264204060;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    BOOL v13 = a3;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __58__PDFThumbnailsCollectionView_applySnapshotWithAnimation___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F82358]);
    v14[0] = @"Thumbnails";
    double v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v3 appendSectionsWithIdentifiers:v4];

    if ([*(id *)(a1 + 32) pageCount])
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = [*(id *)(a1 + 32) pageAtIndex:v5];
        double v7 = (void *)v6;
        if (v6)
        {
          uint64_t v13 = v6;
          BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
          [v3 appendItemsWithIdentifiers:v8 intoSectionWithIdentifier:@"Thumbnails"];
        }
        ++v5;
      }
      while ([*(id *)(a1 + 32) pageCount] > v5);
    }
    uint64_t v9 = (void *)WeakRetained[53];
    uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__PDFThumbnailsCollectionView_applySnapshotWithAnimation___block_invoke_2;
    v11[3] = &unk_264203940;
    id v12 = WeakRetained;
    [v9 applySnapshot:v3 animatingDifferences:v10 completion:v11];
  }
}

uint64_t __58__PDFThumbnailsCollectionView_applySnapshotWithAnimation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _selectAndScrollToCurrentPageIfNeeded];
}

- (CGSize)thumbnailSizeForPage:(id)a3
{
  p_thumbnailView = &self->_thumbnailView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  double v7 = [WeakRetained PDFView];
  BOOL v8 = [v7 document];

  uint64_t v9 = [v8 renderingProperties];
  uint64_t v10 = [v9 displayBox];

  [(PDFThumbnailsCollectionView *)self thumbnailSizeForPage:v5 displayBox:v10];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)thumbnailSizeForPage:(id)a3 displayBox:(int64_t)a4
{
  p_thumbnailView = &self->_thumbnailView;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  [(PDFThumbnailsCollectionView *)self thumbnailSizeForPage:v7 displayBox:a4 thumbnailView:WeakRetained];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)thumbnailSizeForPage:(id)a3 displayBox:(int64_t)a4 thumbnailView:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  double BackingScaleFactor = PDFScreenGetBackingScaleFactor();
  [v9 boundsForBox:a4];
  double v12 = v11;
  double v14 = v13;

  double v15 = v14 / v12;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v17 = [WeakRetained layoutMode];
  [v8 thumbnailSize];
  double v19 = v18;
  double v21 = v20;

  double v22 = v21 + -6.0;
  double v23 = v19 + -6.0;
  if (v17) {
    double v23 = (v21 + -6.0) / v15;
  }
  else {
    double v22 = v15 * (v19 + -6.0);
  }
  double v24 = BackingScaleFactor + BackingScaleFactor;
  double v25 = (BackingScaleFactor + BackingScaleFactor) * v22;
  double v26 = v24 * v23;

  double v27 = v26;
  double v28 = v25;
  result.height = v28;
  result.width = v27;
  return result;
}

- (BOOL)allowsPageReordering
{
  return [(UICollectionView *)self->_collectionView dragInteractionEnabled];
}

- (void)setAllowsPageReordering:(BOOL)a3
{
}

- (void)updateIconsImages
{
}

- (id)currentPage
{
  id v3 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  double v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 firstObject];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    id v7 = [WeakRetained PDFView];
    id v8 = [v7 document];
    id v9 = objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v5, "item"));
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)documentChanged:(id)a3
{
}

- (void)documentMutated:(id)a3
{
}

- (void)currentPageChanged:(id)a3
{
  [(PDFThumbnailsCollectionView *)self _updateScrubber];

  [(PDFThumbnailsCollectionView *)self _selectAndScrollToCurrentPageIfNeeded];
}

- (void)pageChanged:(id)a3
{
  double v4 = (void *)MEMORY[0x263F8C6D0];
  id v5 = a3;
  [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel_pageChanged_ object:0];
  id v7 = [v5 userInfo];

  uint64_t v6 = [v7 objectForKey:@"page"];
  if (v6) {
    [(PDFThumbnailsCollectionView *)self _reloadPage:v6];
  }
}

- (void)_reloadPage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(PDFThumbnailsCollectionView *)self datasourceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PDFThumbnailsCollectionView__reloadPage___block_invoke;
  block[3] = &unk_264204088;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__PDFThumbnailsCollectionView__reloadPage___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[53] snapshot];
    id v5 = v4;
    if (v4
      && [v4 numberOfItems] >= 1
      && [v5 indexOfSectionIdentifier:@"Thumbnails"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = objc_loadWeakRetained(v3 + 51);
      id v7 = [v6 PDFView];
      id v8 = [v7 document];

      unint64_t v9 = [v8 indexForPage:*(void *)(a1 + 32)];
      if (v9 < [v5 numberOfItemsInSection:@"Thumbnails"])
      {
        id v10 = v3[53];
        double v11 = [MEMORY[0x263F088C8] indexPathForItem:v9 inSection:0];
        double v12 = [v10 itemIdentifierForIndexPath:v11];

        double v13 = [v3[53] snapshot];
        uint64_t v14 = [v13 indexOfItemIdentifier:*(void *)(a1 + 32)];
        if (v13 && v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v16[0] = v12;
          double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
          [v13 reconfigureItemsWithIdentifiers:v15];

          [v3[53] applySnapshot:v13 animatingDifferences:0];
        }
      }
    }
  }
}

- (void)_updateScrubber
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v4 = [WeakRetained layoutMode];

  id v5 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = v5;
    if (v4 == 1) {
      [v5 setScrollDirection:1];
    }
    [(UICollectionView *)self->_collectionView setCollectionViewLayout:v7];
    id v5 = v7;
  }
}

- (void)_selectAndScrollToCurrentPageIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v3 = [WeakRetained PDFView];
  uint64_t v4 = [v3 document];
  id v5 = [v3 currentPage];
  BOOL v6 = [v5 document];
  int v7 = [v6 indexForPage:v5];

  int v8 = [v4 pageCount];
  int v9 = v7 & ~(v7 >> 31);
  if (v9 >= v8 - 1) {
    int v9 = v8 - 1;
  }
  unint64_t v10 = v9;
  double v11 = [MEMORY[0x263F088C8] indexPathForRow:v9 inSection:0];
  double v12 = [(UICollectionView *)self->_collectionView dataSource];
  uint64_t v13 = [v12 numberOfSectionsInCollectionView:self->_collectionView];

  if (v13)
  {
    if ([(UICollectionView *)self->_collectionView numberOfItemsInSection:0] > v10)
    {
      [(UICollectionView *)self->_collectionView scrollToItemAtIndexPath:v11 atScrollPosition:0 animated:1];
      uint64_t v14 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
      char v15 = [v14 containsObject:v11];

      if ((v15 & 1) == 0)
      {
        [(UICollectionView *)self->_collectionView selectItemAtIndexPath:v11 animated:1 scrollPosition:0];
        [(PDFThumbnailsCollectionView *)self _updateActionsButtonVisibilityAtIndexPath:v11];
      }
    }
  }
}

- (BOOL)_canEditDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v3 = [WeakRetained PDFView];
  uint64_t v4 = [v3 document];

  id v5 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 documentCanBeEdited:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)_updateActionsButtonVisibilityAtIndexPath:(id)a3
{
  p_thumbnailView = &self->_thumbnailView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  int v7 = [WeakRetained PDFView];
  int v8 = [v7 document];
  objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v5, "item"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  int v9 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v5];

  if (v13) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v11 = [(PDFThumbnailsCollectionView *)self shouldDisplayActionButtonForPage:v13] ^ 1;
    double v12 = [v9 actionsButton];
    [v12 setHidden:v11];
  }
}

- (void)updateImageForCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  int v8 = [(PDFThumbnailsCollectionView *)self datasourceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__PDFThumbnailsCollectionView_updateImageForCell_atIndexPath___block_invoke;
  block[3] = &unk_2642040B0;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __62__PDFThumbnailsCollectionView_updateImageForCell_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      uint64_t v4 = (void *)WeakRetained[53];
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = WeakRetained;
      id v6 = v3;
      id v7 = [v4 itemIdentifierForIndexPath:v5];
      [*(id *)(a1 + 48) updateImageForCell:v6 indexPath:*(void *)(a1 + 40) page:v7];

      id WeakRetained = v8;
    }
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  p_thumbnailView = &self->_thumbnailView;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  id v10 = [WeakRetained PDFView];

  int v8 = [v10 document];
  id v9 = objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v6, "item"));
  [v10 goToPage:v9];

  [(PDFThumbnailsCollectionView *)self _updateActionsButtonVisibilityAtIndexPath:v6];
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v10 = [WeakRetained PDFView];
  uint64_t v11 = [v10 document];

  if (v11)
  {
    id v12 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v8];
    if (v12)
    {
      objc_initWeak(&location, self);
      id v13 = (void *)MEMORY[0x263F82610];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      void v16[2] = __95__PDFThumbnailsCollectionView_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
      v16[3] = &unk_2642040D8;
      objc_copyWeak(&v18, &location);
      id v17 = v12;
      uint64_t v14 = [v13 configurationWithIdentifier:v8 previewProvider:0 actionProvider:v16];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

id __95__PDFThumbnailsCollectionView_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained contextMenuForPage:*(void *)(a1 + 32)];

  return v3;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", x, y);
  if (v8)
  {
    id v9 = -[PDFThumbnailsCollectionView collectionView:contextMenuConfigurationForItemAtIndexPath:point:](self, "collectionView:contextMenuConfigurationForItemAtIndexPath:point:", self->_collectionView, v8, x, y);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    uint64_t v11 = [WeakRetained PDFView];
    id v12 = [v11 document];

    id v13 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v12, "pageCount") - 1, 0);
    objc_initWeak(&location, self);
    uint64_t v14 = (void *)MEMORY[0x263F82610];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __85__PDFThumbnailsCollectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v16[3] = &unk_264204100;
    objc_copyWeak(v17, &location);
    v17[1] = *(id *)&x;
    v17[2] = *(id *)&y;
    id v9 = [v14 configurationWithIdentifier:v13 previewProvider:0 actionProvider:v16];
    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __85__PDFThumbnailsCollectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_msgSend(WeakRetained, "contextMenuForBackgroundAtLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v3;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return [(PDFThumbnailsCollectionView *)self previewForCollectionView:self->_collectionView contextMenuInteraction:a3];
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return [(PDFThumbnailsCollectionView *)self previewForCollectionView:self->_collectionView contextMenuInteraction:a3];
}

- (id)previewForCollectionView:(id)a3 contextMenuInteraction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 locationInView:v6];
  double v9 = v8;
  double v11 = v10;
  id v12 = objc_msgSend(v6, "indexPathForItemAtPoint:");
  if (v12)
  {
    id v13 = [(PDFThumbnailsCollectionView *)self previewForCollectionView:v6 indexPath:v12];
  }
  else
  {
    if (!self->_backgroundOnePixelView)
    {
      uint64_t v14 = (UIView *)objc_opt_new();
      backgroundOnePixelView = self->_backgroundOnePixelView;
      self->_backgroundOnePixelView = v14;

      double v16 = [MEMORY[0x263F825C8] clearColor];
      [(UIView *)self->_backgroundOnePixelView setBackgroundColor:v16];

      [v6 addSubview:self->_backgroundOnePixelView];
    }
    [v7 locationInView:self];
    double v18 = v17;
    double v20 = v19;
    -[UIView setFrame:](self->_backgroundOnePixelView, "setFrame:", v9, v11, 0.0, 0.0);
    id v21 = objc_alloc_init(MEMORY[0x263F82AD0]);
    double v22 = [MEMORY[0x263F825C8] clearColor];
    [v21 setBackgroundColor:v22];

    double v23 = objc_msgSend(objc_alloc(MEMORY[0x263F82AE0]), "initWithContainer:center:", self, v18, v20);
    id v13 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self->_backgroundOnePixelView parameters:v21 target:v23];
  }

  return v13;
}

- (id)previewForCollectionView:(id)a3 indexPath:(id)a4
{
  if (a4)
  {
    uint64_t v4 = [a3 cellForItemAtIndexPath:a4];
    id v5 = objc_alloc_init(MEMORY[0x263F82AD0]);
    id v6 = [MEMORY[0x263F825C8] clearColor];
    [v5 setBackgroundColor:v6];

    id v7 = (void *)MEMORY[0x263F824C0];
    double v8 = [v4 imageView];
    [v8 bounds];
    double v9 = objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:");
    [v5 setVisiblePath:v9];

    id v10 = objc_alloc(MEMORY[0x263F82AE0]);
    double v11 = [v4 imageView];
    [v11 center];
    id v12 = objc_msgSend(v10, "initWithContainer:center:", v4);

    id v13 = objc_alloc(MEMORY[0x263F82CC8]);
    uint64_t v14 = [v4 imageView];
    id v15 = (void *)[v13 initWithView:v14 parameters:v5 target:v12];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  double v8 = [(PDFThumbnailsCollectionView *)self previewForCollectionView:v6 indexPath:v7];

  return v8;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  double v8 = [(PDFThumbnailsCollectionView *)self previewForCollectionView:v6 indexPath:v7];

  return v8;
}

- (id)contextMenuForBackgroundAtLocation:(CGPoint)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [WeakRetained PDFView];
  id v7 = [v6 document];

  double v8 = objc_msgSend(v7, "pageAtIndex:", objc_msgSend(v7, "pageCount") - 1);
  double v9 = [(PDFThumbnailsCollectionView *)self _pasteActionIfAvailableAfterPage:v8];
  if (v9) {
    [v5 addObject:v9];
  }
  id v10 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C516768 image:0 identifier:0 options:0 children:v5];

  return v10;
}

- (id)contextMenuForPage:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = [(PDFThumbnailsCollectionView *)self defaultContextMenuForPage:v4];
  double v8 = v7;
  if (v7 && [v7 count]) {
    [v6 addObjectsFromArray:v8];
  }
  double v9 = [WeakRetained thumbnailContextMenuDelegate];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = [v9 menuElementsForPage:v4];
    if ([v10 count]) {
      [v6 addObjectsFromArray:v10];
    }
  }
  double v11 = [WeakRetained PDFView];
  id v12 = [v11 document];
  uint64_t v13 = [v12 indexForPage:v4] + 1;

  uint64_t v14 = (void *)MEMORY[0x263F08A30];
  id v15 = [NSNumber numberWithInteger:v13];
  double v16 = [v14 localizedStringFromNumber:v15 numberStyle:1];

  double v17 = NSString;
  double v18 = PDFKitLocalizedString(@"Page %@");
  double v19 = objc_msgSend(v17, "stringWithFormat:", v18, v16);

  double v20 = [MEMORY[0x263F82940] menuWithTitle:v19 image:0 identifier:0 options:0 children:v6];

  return v20;
}

- (BOOL)shouldDisplayActionButtonForPage:(id)a3
{
  id v4 = [(PDFThumbnailsCollectionView *)self contextMenuForPage:a3];
  id v5 = [v4 children];
  if ([v5 count]) {
    BOOL v6 = ![(UICollectionView *)self->_collectionView hasActiveDrag];
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_pasteActionIfAvailableAfterPage:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(PDFThumbnailsCollectionView *)self _canEditDocument])
  {
    double v24 = v4;
    objc_initWeak(&location, self);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v5 = [MEMORY[0x263F82A18] generalPasteboard];
    BOOL v6 = [v5 itemProviders];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v7)
    {
      uint64_t v23 = *(void *)v33;
      do
      {
        uint64_t v22 = v7;
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v6);
          }
          double v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v10 = [(PDFThumbnailsCollectionView *)self supportedUTTypes];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v29;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v29 != v12) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v14 = [*(id *)(*((void *)&v28 + 1) + 8 * j) identifier];
                int v15 = [v9 hasItemConformingToTypeIdentifier:v14];

                if (v15)
                {
                  double v17 = (void *)MEMORY[0x263F823D0];
                  double v18 = PDFKitLocalizedString(@"Paste");
                  double v19 = [MEMORY[0x263F827E8] systemImageNamed:@"doc.on.clipboard"];
                  v25[0] = MEMORY[0x263EF8330];
                  v25[1] = 3221225472;
                  v25[2] = __64__PDFThumbnailsCollectionView__pasteActionIfAvailableAfterPage___block_invoke;
                  v25[3] = &unk_264204128;
                  objc_copyWeak(&v27, &location);
                  id v26 = v24;
                  double v20 = [v17 actionWithTitle:v18 image:v19 identifier:@"paste" handler:v25];

                  id v16 = v20;
                  objc_destroyWeak(&v27);

                  BOOL v6 = v16;
                  goto LABEL_20;
                }
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v7);
    }
    id v16 = 0;
LABEL_20:

    objc_destroyWeak(&location);
    id v4 = v24;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __64__PDFThumbnailsCollectionView__pasteActionIfAvailableAfterPage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained pasteAfterPage:*(void *)(a1 + 32)];
}

- (id)defaultContextMenuForPage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v6 = (void *)MEMORY[0x263F823D0];
  uint64_t v7 = PDFKitLocalizedString(@"Copy");
  double v8 = [MEMORY[0x263F827E8] systemImageNamed:@"doc.on.doc"];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__PDFThumbnailsCollectionView_defaultContextMenuForPage___block_invoke;
  v13[3] = &unk_264204128;
  objc_copyWeak(&v15, &location);
  id v9 = v4;
  id v14 = v9;
  id v10 = [v6 actionWithTitle:v7 image:v8 identifier:@"copy" handler:v13];

  [v5 addObject:v10];
  uint64_t v11 = [(PDFThumbnailsCollectionView *)self _pasteActionIfAvailableAfterPage:v9];
  if (v11) {
    [v5 addObject:v11];
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v5;
}

void __57__PDFThumbnailsCollectionView_defaultContextMenuForPage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained copyPage:*(void *)(a1 + 32)];
}

- (void)copyPage:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F088E0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = (void *)[v5 copy];

  uint64_t v8 = MEMORY[0x263EFFA68];
  [(PDFThumbnailsCollectionView *)self itemProvider:v6 registerDataRepresentationForPage:v7 draggedPages:MEMORY[0x263EFFA68]];
  [(PDFThumbnailsCollectionView *)self itemProvider:v6 registerFileRepresentationForPage:v7 draggedPages:v8];
  v11[0] = v6;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = [MEMORY[0x263F82A18] generalPasteboard];
  [v10 setItemProviders:v9];
}

- (void)pasteAfterPage:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v27 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v5 = [WeakRetained PDFView];
  double v24 = [v5 document];

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  unint64_t v38 = 0;
  uint64_t v6 = [v24 indexForPage:v22];
  unint64_t v7 = [v24 pageCount];
  unint64_t v8 = v6 + 1;
  if (v6 + 1 >= v7) {
    unint64_t v8 = v7;
  }
  unint64_t v38 = v8;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = objc_msgSend(MEMORY[0x263F82A18], "generalPasteboard", v22);
  obuint64_t j = [v9 itemProviders];

  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v10)
  {
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v13 = [(PDFThumbnailsCollectionView *)v27 supportedUTTypes];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v13);
              }
              double v17 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              double v18 = [v17 identifier];
              int v19 = [v12 hasItemConformingToTypeIdentifier:v18];

              if (v19)
              {
                double v20 = [v17 identifier];
                v28[0] = MEMORY[0x263EF8330];
                v28[1] = 3221225472;
                v28[2] = __46__PDFThumbnailsCollectionView_pasteAfterPage___block_invoke;
                v28[3] = &unk_264204178;
                v28[4] = v27;
                v28[5] = v17;
                v28[6] = v12;
                v28[7] = v37;
                id v21 = (id)[v12 loadFileRepresentationForTypeIdentifier:v20 completionHandler:v28];

                goto LABEL_18;
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(v37, 8);
}

void __46__PDFThumbnailsCollectionView_pasteAfterPage___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    id v9 = (void *)a1[4];
    uint64_t v8 = a1[5];
    uint64_t v10 = a1[7];
    uint64_t v11 = *(void *)(*(void *)(v10 + 8) + 24);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __46__PDFThumbnailsCollectionView_pasteAfterPage___block_invoke_2;
    v12[3] = &unk_264204150;
    v12[4] = v10;
    [v9 _insertFileAtURL:a2 type:v8 atIndex:v11 completionHandler:v12];
  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Item provider %@ returned a nil URL. Error: %@", a4, a5, a6, a7, a8, a1[6]);
  }
}

uint64_t __46__PDFThumbnailsCollectionView_pasteAfterPage___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a2;
  return result;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return [(PDFThumbnailsCollectionView *)self itemsForDragWithSession:a4 atIndexPath:a5];
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PDFThumbnailsCollectionView *)self _updateActionsButtonVisibilityAtIndexPath:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  dispatch_time_t v6 = dispatch_time(0, 100000000);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__PDFThumbnailsCollectionView_collectionView_dragSessionDidEnd___block_invoke;
  v8[3] = &unk_264203F98;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x263EF83A0], v8);
}

void __64__PDFThumbnailsCollectionView_collectionView_dragSessionDidEnd___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_updateActionsButtonVisibilityAtIndexPath:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v10 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.adobe.pdf"];
  long long v11 = [v10 identifier];
  v16[0] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  int v13 = [v8 hasItemsConformingToTypeIdentifiers:v12];

  if (v13)
  {
    uint64_t v14 = [(PDFThumbnailsCollectionView *)self itemsForDragWithSession:v8 atIndexPath:v9];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

- (id)itemsForDragWithSession:(id)a3 atIndexPath:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v7];
  id v9 = (void *)MEMORY[0x263EFF980];
  long long v10 = [v6 items];
  long long v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v12 = [v6 items];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = [*(id *)(*((void *)&v39 + 1) + 8 * i) localObject];
        if (v16) {
          [v11 addObject:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v13);
  }

  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__0;
  id v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  double v17 = (void *)MEMORY[0x263F82A18];
  uint64_t v18 = [(PDFThumbnailsCollectionView *)self _dragDataOwner];
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  id v27 = __67__PDFThumbnailsCollectionView_itemsForDragWithSession_atIndexPath___block_invoke;
  long long v28 = &unk_2642041A0;
  long long v32 = &v33;
  long long v29 = self;
  id v19 = v8;
  id v30 = v19;
  id v20 = v11;
  id v31 = v20;
  [v17 _performAsDataOwner:v18 block:&v25];
  id v21 = objc_alloc(MEMORY[0x263F826C8]);
  id v22 = objc_msgSend(v21, "initWithItemProvider:", v34[5], v25, v26, v27, v28, v29);
  [v22 setLocalObject:v19];
  v43 = v22;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];

  _Block_object_dispose(&v33, 8);

  return v23;
}

uint64_t __67__PDFThumbnailsCollectionView_itemsForDragWithSession_atIndexPath___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F088E0]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) itemProvider:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) registerDataRepresentationForPage:*(void *)(a1 + 40) draggedPages:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);

  return [v7 itemProvider:v6 registerFileRepresentationForPage:v8 draggedPages:v5];
}

- (void)itemProvider:(id)a3 registerDataRepresentationForPage:(id)a4 draggedPages:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)[a4 copy];
  id v9 = [(id)*MEMORY[0x263F1DBF0] identifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __91__PDFThumbnailsCollectionView_itemProvider_registerDataRepresentationForPage_draggedPages___block_invoke;
  v11[3] = &unk_2642041F0;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v7 registerDataRepresentationForTypeIdentifier:v9 visibility:0 loadHandler:v11];
}

uint64_t __91__PDFThumbnailsCollectionView_itemProvider_registerDataRepresentationForPage_draggedPages___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v10[0] = *(void *)(a1 + 40);
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__PDFThumbnailsCollectionView_itemProvider_registerDataRepresentationForPage_draggedPages___block_invoke_2;
  v8[3] = &unk_2642041C8;
  id v9 = v3;
  id v6 = v3;
  [v4 writePDFDocumentFromPages:v5 completionHandler:v8];

  return 0;
}

void __91__PDFThumbnailsCollectionView_itemProvider_registerDataRepresentationForPage_draggedPages___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    id v3 = [[PDFDocument alloc] initWithURL:v6];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [(PDFDocument *)v3 dataRepresentation];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)itemProvider:(id)a3 registerFileRepresentationForPage:(id)a4 draggedPages:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)[a4 copy];
  id v9 = [(id)*MEMORY[0x263F1DBF0] identifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __91__PDFThumbnailsCollectionView_itemProvider_registerFileRepresentationForPage_draggedPages___block_invoke;
  v11[3] = &unk_264204218;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v7 registerFileRepresentationForTypeIdentifier:v9 fileOptions:0 visibility:0 loadHandler:v11];
}

uint64_t __91__PDFThumbnailsCollectionView_itemProvider_registerFileRepresentationForPage_draggedPages___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v10[0] = *(void *)(a1 + 40);
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__PDFThumbnailsCollectionView_itemProvider_registerFileRepresentationForPage_draggedPages___block_invoke_2;
  v8[3] = &unk_2642041C8;
  id v9 = v3;
  id v6 = v3;
  [v4 writePDFDocumentFromPages:v5 completionHandler:v8];

  return 0;
}

void __91__PDFThumbnailsCollectionView_itemProvider_registerFileRepresentationForPage_draggedPages___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    int v6 = [v7 startAccessingSecurityScopedResource];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (v6) {
      [v7 stopAccessingSecurityScopedResource];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)writePDFDocumentFromPages:(id)a3 completionHandler:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v9 = [WeakRetained PDFView];
  id v10 = [v9 document];
  long long v11 = [v10 documentAttributes];
  id v12 = [v11 objectForKeyedSubscript:@"Title"];

  uint64_t v13 = objc_alloc_init(PDFDocument);
  uint64_t v14 = (void *)MEMORY[0x2166A0EA0]();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v57 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * i) copy];
        [(PDFDocument *)v13 insertPage:v20 atIndex:[(PDFDocument *)v13 pageCount]];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v17);
  }

  id v21 = [MEMORY[0x263F08850] defaultManager];
  id v22 = [v21 temporaryDirectory];
  uint64_t v23 = [MEMORY[0x263F08C38] UUID];
  double v24 = [v23 UUIDString];
  uint64_t v25 = [v22 URLByAppendingPathComponent:v24];

  uint64_t v26 = [v25 path];
  id v55 = 0;
  [v21 removeItemAtPath:v26 error:&v55];
  id v27 = v55;

  if (v27 && [v27 code] != 4)
  {
    uint64_t v35 = [v25 path];
    _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Failed to remove temporary folder (at path %@) prior to storing temporary PDF document with error: %@", v36, v37, v38, v39, v40, (uint64_t)v35);

    v7[2](v7, 0, v27);
  }
  else
  {
    id v53 = v12;
    long long v28 = [v25 path];
    id v54 = 0;
    [v21 createDirectoryAtPath:v28 withIntermediateDirectories:1 attributes:0 error:&v54];
    id v29 = v54;

    if (v29)
    {
      _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Failed to create directory for scanned PDF with error: %@", v30, v31, v32, v33, v34, (uint64_t)v29);
      v7[2](v7, 0, v29);
    }
    else
    {
      id v52 = (void (**)(id, void *, void))v7;
      if ([v15 count] == 1)
      {
        long long v41 = [v15 firstObject];
        long long v42 = v41;
        v50 = NSString;
        if (v53) {
          v43 = v53;
        }
        else {
          v43 = @"Exported Page";
        }
        v44 = [v41 label];
        uint64_t v45 = [v50 stringWithFormat:@"%@ n°%@", v43, v44];
      }
      else
      {
        if (v53) {
          v46 = v53;
        }
        else {
          v46 = @"Exported Page";
        }
        uint64_t v45 = [NSString stringWithFormat:@"%@ (%lu)", v46, objc_msgSend(v15, "count")];
      }
      v47 = [NSString stringWithFormat:@"%@.pdf", v45];
      v48 = [v25 URLByAppendingPathComponent:v47];
      if ([(PDFDocument *)v13 writeToURL:v48])
      {
        v52[2](v52, v48, 0);
      }
      else
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:512 userInfo:0];
        v49 = v51 = v45;
        ((void (**)(id, void *, void *))v52)[2](v52, 0, v49);

        uint64_t v45 = v51;
      }

      id v7 = (void (**)(id, void, id))v52;
    }

    id v12 = v53;
  }
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([(PDFThumbnailsCollectionView *)self _canEditDocument])
  {
    id v9 = [v8 localDragSession];

    if (v9)
    {
      int v10 = [v7 hasActiveDrag];
      id v11 = objc_alloc(MEMORY[0x263F82568]);
      if (v10) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 2;
      }
      uint64_t v26 = [v11 initWithDropOperation:v12 intent:1];
      goto LABEL_24;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v13 = [v8 items];
    uint64_t v30 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v30)
    {
      uint64_t v14 = *(void *)v39;
      uint64_t v32 = v13;
      id v33 = v7;
      uint64_t v29 = *(void *)v39;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v13);
          }
          uint64_t v31 = v15;
          uint64_t v16 = *(void **)(*((void *)&v38 + 1) + 8 * v15);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v17 = [(PDFThumbnailsCollectionView *)self supportedUTTypes];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v35;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v35 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                uint64_t v23 = [v16 itemProvider];
                double v24 = [v22 identifier];
                char v25 = [v23 hasItemConformingToTypeIdentifier:v24];

                if (v25)
                {
                  id v27 = (void *)[objc_alloc(MEMORY[0x263F82568]) initWithDropOperation:2 intent:1];

                  id v7 = v33;
                  goto LABEL_25;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          uint64_t v15 = v31 + 1;
          uint64_t v13 = v32;
          id v7 = v33;
          uint64_t v14 = v29;
        }
        while (v31 + 1 != v30);
        uint64_t v30 = [v32 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v30);
    }
  }
  uint64_t v26 = [objc_alloc(MEMORY[0x263F82568]) initWithDropOperation:1];
LABEL_24:
  id v27 = (void *)v26;
LABEL_25:

  return v27;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v19 = a4;
  id v21 = [v19 destinationIndexPath];
  if (!v21)
  {
    id v21 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v20, "numberOfItemsInSection:", 0), 0);
  }
  if (([v20 hasActiveDrag] & 1) == 0)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v37 = [v21 item];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v5 = [v19 items];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v6)
    {
      uint64_t v23 = *(void *)v33;
      obuint64_t j = v5;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(obj);
          }
          id v8 = [*(id *)(*((void *)&v32 + 1) + 8 * i) dragItem];
          id v9 = [v8 itemProvider];

          if (v9)
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            int v10 = [(PDFThumbnailsCollectionView *)self supportedUTTypes];
            uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v29;
              while (2)
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v29 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                  uint64_t v15 = [v14 identifier];
                  int v16 = [v9 hasItemConformingToTypeIdentifier:v15];

                  if (v16)
                  {
                    uint64_t v17 = [v14 identifier];
                    v25[0] = MEMORY[0x263EF8330];
                    v25[1] = 3221225472;
                    v25[2] = __73__PDFThumbnailsCollectionView_collectionView_performDropWithCoordinator___block_invoke;
                    v25[3] = &unk_264204178;
                    void v25[4] = self;
                    v25[5] = v14;
                    id v27 = v36;
                    id v26 = v9;
                    id v18 = (id)[v26 loadFileRepresentationForTypeIdentifier:v17 completionHandler:v25];

                    goto LABEL_20;
                  }
                }
                uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
                if (v11) {
                  continue;
                }
                break;
              }
            }
LABEL_20:
          }
        }
        id v5 = obj;
        uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v6);
    }

    _Block_object_dispose(v36, 8);
  }
}

void __73__PDFThumbnailsCollectionView_collectionView_performDropWithCoordinator___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    id v9 = (void *)a1[4];
    uint64_t v8 = a1[5];
    uint64_t v10 = a1[7];
    uint64_t v11 = *(void *)(*(void *)(v10 + 8) + 24);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __73__PDFThumbnailsCollectionView_collectionView_performDropWithCoordinator___block_invoke_2;
    v12[3] = &unk_264204150;
    v12[4] = v10;
    [v9 _insertFileAtURL:a2 type:v8 atIndex:v11 completionHandler:v12];
  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Item provider %@ returned a nil URL. Error: %@", a4, a5, a6, a7, a8, a1[6]);
  }
}

uint64_t __73__PDFThumbnailsCollectionView_collectionView_performDropWithCoordinator___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a2;
  return result;
}

- (unint64_t)_insertPagesFromProvidedPDFDocument:(id)a3 atPageIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v23 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  double v24 = [WeakRetained PDFView];
  id v7 = [v24 document];
  uint64_t v8 = [v7 renderingProperties];
  uint64_t v9 = [v8 displayBox];

  uint64_t v10 = [v6 pageCount];
  uint64_t v11 = [MEMORY[0x263EFF980] arrayWithCapacity:v10];
  if (v10)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v13 = (void *)MEMORY[0x2166A0EA0]();
      uint64_t v14 = [v6 pageAtIndex:i];
      uint64_t v15 = (void *)[v14 copy];

      [v15 boundsForBox:1];
      objc_msgSend(v15, "setBounds:forBox:", v9);
      [v7 insertPage:v15 atIndex:a4 + i];
      [v11 addObject:v15];
    }
  }
  int v16 = PDFKitLocalizedString(@"Insert pages");
  uint64_t v17 = [(PDFThumbnailsCollectionView *)v23 undoManager];
  id v18 = [v17 prepareWithInvocationTarget:v23];
  [v18 removePages:v11];

  id v19 = [(PDFThumbnailsCollectionView *)v23 undoManager];
  id v20 = PDFKitLocalizedString(v16);
  [v19 setActionName:v20];

  unint64_t v21 = [v11 count];
  return v21;
}

- (void)_insertPDFDocumentWithURL:(id)a3 atIndex:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [[PDFDocument alloc] initWithURL:v8];
  int v16 = v10;
  if (v10)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__PDFThumbnailsCollectionView__insertPDFDocumentWithURL_atIndex_completionHandler___block_invoke;
    block[3] = &unk_264204240;
    void block[4] = self;
    id v18 = v10;
    unint64_t v20 = a4;
    id v19 = v9;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"PDF document could not be created from URL %@", v11, v12, v13, v14, v15, (uint64_t)v8);
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __83__PDFThumbnailsCollectionView__insertPDFDocumentWithURL_atIndex_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _insertPagesFromProvidedPDFDocument:*(void *)(a1 + 40) atPageIndex:*(void *)(a1 + 56)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)_insertImageWithURL:(id)a3 atIndex:(unint64_t)a4 completionHandler:(id)a5
{
  v36[2] = *MEMORY[0x263EF8340];
  CFURLRef v8 = (const __CFURL *)a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v11 = [WeakRetained PDFView];
  uint64_t v12 = [v11 document];
  uint64_t v13 = CGImageSourceCreateWithURL(v8, 0);
  ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v13, 0, 0);
  if ([v12 pageCount] && objc_msgSend(v12, "pageCount") >= a4)
  {
    if (a4) {
      unint64_t v16 = a4 - 1;
    }
    else {
      unint64_t v16 = 0;
    }
    long long v29 = [v12 pageAtIndex:v16];
    [v29 boundsForBox:0];
    double v18 = v17;
    CGImageGetSizeAfterOrientation();
    objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", 0.0, 0.0, v18, v18 * v19 / v20);
    unint64_t v30 = a4;
    v22 = id v21 = WeakRetained;
    v35[0] = @"PDFPageImageInitializationOptionMediaBox";
    v35[1] = @"PDFPageImageInitializationOptionUpscaleIfSmaller";
    v36[0] = v22;
    v36[1] = MEMORY[0x263EFFA88];
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

    id WeakRetained = v21;
    a4 = v30;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263EFFA78];
  }
  long long v28 = [[PDFPage alloc] initWithCGImage:ImageAtIndex options:v15];
  if (v13) {
    CFRelease(v13);
  }
  if (v28)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__PDFThumbnailsCollectionView__insertImageWithURL_atIndex_completionHandler___block_invoke;
    block[3] = &unk_264204240;
    void block[4] = self;
    long long v32 = v28;
    unint64_t v34 = a4;
    id v33 = v9;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"PDF document could not be created from URL %@", v23, v24, v25, v26, v27, (uint64_t)v8);
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __77__PDFThumbnailsCollectionView__insertImageWithURL_atIndex_completionHandler___block_invoke(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)a1[4];
  v8[0] = a1[5];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a1[7]];
  id v7 = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  [v2 insertPages:v3 atIndexes:v5];

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)supportedUTTypes
{
  if (supportedUTTypes_onceToken != -1) {
    dispatch_once(&supportedUTTypes_onceToken, &__block_literal_global_213);
  }
  id v2 = (void *)supportedUTTypes_supportedTypes;

  return v2;
}

void __47__PDFThumbnailsCollectionView_supportedUTTypes__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1DB18];
  v3[0] = *MEMORY[0x263F1DBF0];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:2];
  id v2 = (void *)supportedUTTypes_supportedTypes;
  supportedUTTypes_supportedTypes = v1;
}

- (void)_insertFileAtURL:(id)a3 type:(id)a4 atIndex:(unint64_t)a5 completionHandler:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v13 = [WeakRetained thumbnailDataSourceDelegate];

  if (v13)
  {
    [v13 insertFileAtURL:v14 atIndex:a5 completionHandler:v11];
  }
  else if ((id)*MEMORY[0x263F1DBF0] == v10)
  {
    [(PDFThumbnailsCollectionView *)self _insertPDFDocumentWithURL:v14 atIndex:a5 completionHandler:v11];
  }
  else if ((id)*MEMORY[0x263F1DB18] == v10)
  {
    [(PDFThumbnailsCollectionView *)self _insertImageWithURL:v14 atIndex:a5 completionHandler:v11];
  }
}

- (void)removePages:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v6 = [WeakRetained PDFView];
  id v7 = [v6 document];

  CFURLRef v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v9 = [v4 reverseObjectEnumerator];
  id v10 = [v9 allObjects];

  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __43__PDFThumbnailsCollectionView_removePages___block_invoke;
  uint64_t v24 = &unk_264204268;
  id v25 = v7;
  id v26 = v8;
  id v11 = v8;
  id v12 = v7;
  [v10 enumerateObjectsUsingBlock:&v21];
  if ((unint64_t)objc_msgSend(v4, "count", v21, v22, v23, v24) <= 1) {
    uint64_t v13 = @"Remove page";
  }
  else {
    uint64_t v13 = @"Remove pages";
  }
  id v14 = PDFKitLocalizedString(v13);
  uint64_t v15 = [(PDFThumbnailsCollectionView *)self undoManager];
  unint64_t v16 = [v15 prepareWithInvocationTarget:self];
  double v17 = [v11 reverseObjectEnumerator];
  double v18 = [v17 allObjects];
  [v16 insertPages:v4 atIndexes:v18];

  double v19 = [(PDFThumbnailsCollectionView *)self undoManager];
  double v20 = PDFKitLocalizedString(v14);
  [v19 setActionName:v20];
}

void __43__PDFThumbnailsCollectionView_removePages___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) indexForPage:a2];
  [*(id *)(a1 + 32) removePageAtIndex:v3];
  id v4 = *(void **)(a1 + 40);
  id v5 = [NSNumber numberWithUnsignedInteger:v3];
  [v4 addObject:v5];
}

- (void)insertPages:(id)a3 atIndexes:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  uint64_t v7 = [v29 count];
  if (v7 == [v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    id v14 = [WeakRetained PDFView];
    uint64_t v15 = [v14 document];

    uint64_t v16 = [v6 count];
    double v17 = v29;
    if (v16)
    {
      for (unint64_t i = 0; i < v21; ++i)
      {
        double v19 = [v17 objectAtIndexedSubscript:i];
        double v20 = [v6 objectAtIndexedSubscript:i];
        objc_msgSend(v15, "insertPage:atIndex:", v19, objc_msgSend(v20, "unsignedIntegerValue"));

        unint64_t v21 = [v6 count];
        double v17 = v29;
      }
    }
    if ((unint64_t)[v17 count] <= 1) {
      uint64_t v22 = @"Insert page";
    }
    else {
      uint64_t v22 = @"Insert pages";
    }
    uint64_t v23 = PDFKitLocalizedString(v22);
    uint64_t v24 = [(PDFThumbnailsCollectionView *)self undoManager];
    id v25 = [v24 prepareWithInvocationTarget:self];
    [v25 removePages:v29];

    id v26 = [(PDFThumbnailsCollectionView *)self undoManager];
    uint64_t v27 = PDFKitLocalizedString(v23);
    [v26 setActionName:v27];
  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Number of pages to insert is different from the number of indexes", v8, v9, v10, v11, v12, v28);
  }
}

- (void)movePage:(id)a3 toIndex:(unint64_t)a4
{
  p_thumbnailView = &self->_thumbnailView;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  uint64_t v9 = [WeakRetained PDFView];
  id v16 = [v9 document];

  uint64_t v10 = [v16 indexForPage:v7];
  [v16 removePageAtIndex:v10];
  [v16 insertPage:v7 atIndex:a4];
  uint64_t v11 = PDFKitLocalizedString(@"Move page");
  uint64_t v12 = [(PDFThumbnailsCollectionView *)self undoManager];
  uint64_t v13 = [v12 prepareWithInvocationTarget:self];
  [v13 movePage:v7 toIndex:v10];

  id v14 = [(PDFThumbnailsCollectionView *)self undoManager];
  uint64_t v15 = PDFKitLocalizedString(v11);
  [v14 setActionName:v15];
}

- (void)movePageWithTransaction:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 difference];
  int v6 = [v5 hasChanges];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    uint64_t v8 = [WeakRetained thumbnailDataSourceDelegate];
    if (v8)
    {
      uint64_t v9 = [v4 difference];
      [v8 handlePageOrderedCollectionDifference:v9];
    }
    else
    {
      id v25 = WeakRetained;
      uint64_t v10 = [WeakRetained PDFView];
      uint64_t v11 = [v10 document];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v26 = v4;
      uint64_t v12 = [v4 difference];
      uint64_t v13 = [v12 removals];

      obuint64_t j = v13;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(obj);
            }
            double v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            double v19 = [v18 object];
            if (v19)
            {
              objc_msgSend(v11, "removePageAtIndex:", objc_msgSend(v18, "index"));
              objc_msgSend(v11, "insertPage:atIndex:", v19, objc_msgSend(v18, "associatedIndex"));
              double v20 = PDFKitLocalizedString(@"Move page");
              unint64_t v21 = [(PDFThumbnailsCollectionView *)self undoManager];
              uint64_t v22 = [v21 prepareWithInvocationTarget:self];
              objc_msgSend(v22, "movePage:toIndex:", v19, objc_msgSend(v18, "index"));

              uint64_t v23 = [(PDFThumbnailsCollectionView *)self undoManager];
              uint64_t v24 = PDFKitLocalizedString(v20);
              [v23 setActionName:v24];
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v15);
      }

      id WeakRetained = v25;
      id v4 = v26;
      uint64_t v8 = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundOnePixelView, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_destroyWeak((id *)&self->_thumbnailView);
}

@end