@interface CKPhotosGridFooterViewModel
- (id)initAssetsDataSourceManager:(id)a3 syndicationIdentifiers:(id)a4;
- (void)_updateDetailedCounts;
- (void)_updateSavedCount;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDetailedCounts:(id *)a3;
- (void)setSavedCount:(int64_t)a3;
@end

@implementation CKPhotosGridFooterViewModel

- (id)initAssetsDataSourceManager:(id)a3 syndicationIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKPhotosGridFooterViewModel;
  v9 = [(PXFooterViewModel *)&v18 init];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = MEMORY[0x1E4F90E78];
    *(_OWORD *)&v9->_detailedCounts.photosCount = *MEMORY[0x1E4F90E78];
    v9->_detailedCounts.othersCount = *(void *)(v11 + 16);
    v9->_savedCount = -1;
    objc_storeStrong((id *)&v9->_assetsDataSourceManager, a3);
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F90000]) initWithAssetsDataSourceManager:v10->_assetsDataSourceManager];
    assetsCountsController = v10->_assetsCountsController;
    v10->_assetsCountsController = (PXAssetsDataSourceCountsController *)v12;

    [(PXAssetsDataSourceCountsController *)v10->_assetsCountsController registerChangeObserver:v10 context:PXAssetsDataSourceCountsControllerObserverContext];
    [(PXAssetsDataSourceCountsController *)v10->_assetsCountsController prepareCountsIfNeeded];
    [(CKPhotosGridFooterViewModel *)v10 _updateDetailedCounts];
    if (v8)
    {
      uint64_t v14 = [v8 copy];
      syndicationIdentifiers = v10->_syndicationIdentifiers;
      v10->_syndicationIdentifiers = (NSArray *)v14;

      v16 = [MEMORY[0x1E4F6BD68] sharedInstance];
      [v16 registerPhotoLibraryPersistenceManagerListener:v10];

      [(CKPhotosGridFooterViewModel *)v10 _updateSavedCount];
    }
  }

  return v10;
}

- (void)_updateDetailedCounts
{
  long long v6 = 0uLL;
  uint64_t v7 = 0;
  assetsCountsController = self->_assetsCountsController;
  if (assetsCountsController) {
    [(PXAssetsDataSourceCountsController *)assetsCountsController counts];
  }
  long long v4 = v6;
  uint64_t v5 = v7;
  [(CKPhotosGridFooterViewModel *)self setDetailedCounts:&v4];
}

- (void)_updateSavedCount
{
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_syndicationIdentifiers];
  v3 = [MEMORY[0x1E4F6BD68] sharedInstance];
  uint64_t v4 = [v3 cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:v5 shouldFetchAndNotifyAsNeeded:1 didStartFetch:0];

  [(CKPhotosGridFooterViewModel *)self setSavedCount:v4];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXAssetsDataSourceCountsControllerObserverContext == a5) {
    [(CKPhotosGridFooterViewModel *)self _updateDetailedCounts];
  }
}

- (void)setDetailedCounts:(id *)a3
{
  p_detailedCounts = &self->_detailedCounts;
  if (self->_detailedCounts.photosCount != a3->var0
    || self->_detailedCounts.videosCount != a3->var1
    || self->_detailedCounts.othersCount != a3->var2)
  {
    unint64_t var2 = a3->var2;
    *(_OWORD *)&p_detailedCounts->unint64_t photosCount = *(_OWORD *)&a3->var0;
    self->_detailedCounts.othersCount = var2;
    unint64_t photosCount = p_detailedCounts->photosCount;
    unint64_t videosCount = self->_detailedCounts.videosCount;
    if (p_detailedCounts->photosCount == 0x7FFFFFFFFFFFFFFFLL
      || videosCount == 0x7FFFFFFFFFFFFFFFLL
      || var2 == 0x7FFFFFFFFFFFFFFFLL
      || videosCount + photosCount + var2 == 0)
    {
      v13 = CKFrameworkBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"CKPhotosGridFooterViewModelLoadingCountsTitle" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    else
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      v15 = (void (*)(unint64_t, unint64_t, unint64_t, uint64_t, void))getPLLocalizedCountDescriptionSymbolLoc_ptr;
      v30 = getPLLocalizedCountDescriptionSymbolLoc_ptr;
      if (!getPLLocalizedCountDescriptionSymbolLoc_ptr)
      {
        *(void *)&long long v23 = MEMORY[0x1E4F143A8];
        *((void *)&v23 + 1) = 3221225472;
        othersCount = __getPLLocalizedCountDescriptionSymbolLoc_block_invoke;
        v25 = &unk_1E5620B90;
        v26 = &v27;
        __getPLLocalizedCountDescriptionSymbolLoc_block_invoke((uint64_t)&v23);
        v15 = (void (*)(unint64_t, unint64_t, unint64_t, uint64_t, void))v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (!v15) {
        -[CKPhotosGridFooterViewModel setDetailedCounts:]();
      }
      uint64_t v14 = v15(photosCount, videosCount, var2, 1, 0);
    }
    int64_t savedCount = self->_savedCount;
    long long v23 = *(_OWORD *)&p_detailedCounts->photosCount;
    othersCount = (void *(*)(uint64_t))p_detailedCounts->othersCount;
    v17 = _SavedCountDescriptionWithCounts(&v23, savedCount);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__CKPhotosGridFooterViewModel_setDetailedCounts___block_invoke;
    v20[3] = &unk_1E5628530;
    id v21 = v14;
    id v22 = v17;
    id v18 = v17;
    id v19 = v14;
    [(PXFooterViewModel *)self performChanges:v20];
  }
}

void __49__CKPhotosGridFooterViewModel_setDetailedCounts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setSubtitle1:*(void *)(a1 + 40)];
}

- (void)setSavedCount:(int64_t)a3
{
  if (self->_savedCount != a3)
  {
    self->_int64_t savedCount = a3;
    $C8986E5AD9146E03F7E851F39E835596 detailedCounts = self->_detailedCounts;
    id v4 = _SavedCountDescriptionWithCounts(&detailedCounts, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__CKPhotosGridFooterViewModel_setSavedCount___block_invoke;
    v6[3] = &unk_1E5628558;
    id v7 = v4;
    id v5 = v4;
    [(PXFooterViewModel *)self performChanges:v6];
  }
}

uint64_t __45__CKPhotosGridFooterViewModel_setSavedCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSubtitle1:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsCountsController, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifiers, 0);

  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
}

- (void)setDetailedCounts:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *SOFT_LINKED_PLLocalizedCountDescription(NSUInteger, NSUInteger, NSUInteger, BOOL, BOOL)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKPhotosGridFooterViewModel.m", 28, @"%s", dlerror());

  __break(1u);
}

@end