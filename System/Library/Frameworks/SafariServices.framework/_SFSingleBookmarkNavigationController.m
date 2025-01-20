@interface _SFSingleBookmarkNavigationController
- (BOOL)bookmarkInfoViewControllerCanSaveBookmarkChanges:(id)a3;
- (BOOL)bookmarkInfoViewControllerShouldUseTranslucentAppearance:(id)a3;
- (BOOL)prepareForPresentationForAddingBookmark:(BOOL)a3;
- (_SFSingleBookmarkNavigationController)initWithBookmark:(id)a3 inCollection:(id)a4;
- (_SFSingleBookmarkNavigationController)initWithCollection:(id)a3;
- (_SFSingleBookmarkNavigationController)initWithFolderOfBookmarks:(id)a3 inCollection:(id)a4;
- (_SFSingleBookmarkNavigationControllerDelegate)bookmarkNavDelegate;
- (_SFSyntheticBookmarkProvider)syntheticBookmarkProvider;
- (id)_initWithBookmark:(id)a3 childBookmarks:(id)a4 inCollection:(id)a5 withSyntheticFolder:(id)a6 addingBookmark:(BOOL)a7 toFavorites:(BOOL)a8;
- (id)_lastSelectedFolder;
- (id)addBookmarkAnalyticsHandler;
- (id)addBookmarkWithTitle:(id)a3 address:(id)a4 parentBookmark:(id)a5;
- (id)initForAddingToFavoritesInCollection:(id)a3;
- (id)initForAddingToSyntheticBookmarkFolder:(id)a3;
- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3;
- (void)_didBecomeActive;
- (void)_releaseBookmarkLockIfNeeded;
- (void)_willResignActive;
- (void)bookmarkInfoViewController:(id)a3 didFinishWithResult:(BOOL)a4;
- (void)dealloc;
- (void)setAddBookmarkAnalyticsHandler:(id)a3;
- (void)setBookmarkNavDelegate:(id)a3;
- (void)setSyntheticBookmarkProvider:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation _SFSingleBookmarkNavigationController

- (id)_initWithBookmark:(id)a3 childBookmarks:(id)a4 inCollection:(id)a5 withSyntheticFolder:(id)a6 addingBookmark:(BOOL)a7 toFavorites:(BOOL)a8
{
  uint64_t v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  objc_storeStrong((id *)&self->_collection, a5);
  if ([v15 count])
  {
    id v18 = objc_alloc(MEMORY[0x1E4FB60E0]);
    [(_SFSingleBookmarkNavigationController *)self _lastSelectedFolder];
    id v19 = v17;
    BOOL v20 = v9;
    v22 = id v21 = v16;
    unsigned int v34 = v8;
    uint64_t v23 = [v22 identifier];
    v24 = [(WebBookmarkCollection *)self->_collection configuration];
    v25 = objc_msgSend(v18, "initFolderWithParentID:collectionType:", v23, objc_msgSend(v24, "collectionType"));

    id v16 = v21;
    BOOL v9 = v20;
    id v17 = v19;
    v26 = _WBSLocalizedString();
    [v25 setTitle:v26];

    id v14 = v25;
    uint64_t v8 = v34;
  }
  v27 = [[_SFBookmarkInfoViewController alloc] initWithBookmark:v14 childBookmarks:v15 inCollection:v16 addingBookmark:v9 toFavorites:v8 willBeDisplayedModally:1];
  v28 = v27;
  if (v17) {
    [(_SFBookmarkInfoViewController *)v27 setParent:0 syntheticParentFolder:v17];
  }
  v35.receiver = self;
  v35.super_class = (Class)_SFSingleBookmarkNavigationController;
  v29 = [(_SFSingleBookmarkNavigationController *)&v35 initWithRootViewController:v28];
  v30 = v29;
  if (v29)
  {
    [(_SFSingleBookmarkNavigationController *)v29 _setClipUnderlapWhileTransitioning:1];
    objc_storeStrong((id *)&v30->_infoViewController, v28);
    [(_SFBookmarkInfoViewController *)v30->_infoViewController setDelegate:v30];
    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v30 selector:sel__willResignActive name:*MEMORY[0x1E4FB2738] object:0];
    [v31 addObserver:v30 selector:sel__didBecomeActive name:*MEMORY[0x1E4FB2628] object:0];
    v30->_needsBookmarksLockOnAppResume = 0;
    v32 = v30;
  }
  return v30;
}

- (_SFSingleBookmarkNavigationController)initWithBookmark:(id)a3 inCollection:(id)a4
{
  return (_SFSingleBookmarkNavigationController *)[(_SFSingleBookmarkNavigationController *)self _initWithBookmark:a3 childBookmarks:0 inCollection:a4 withSyntheticFolder:0 addingBookmark:0 toFavorites:0];
}

- (_SFSingleBookmarkNavigationController)initWithCollection:(id)a3
{
  return (_SFSingleBookmarkNavigationController *)[(_SFSingleBookmarkNavigationController *)self _initWithBookmark:0 childBookmarks:0 inCollection:a3 withSyntheticFolder:0 addingBookmark:1 toFavorites:0];
}

- (_SFSingleBookmarkNavigationController)initWithFolderOfBookmarks:(id)a3 inCollection:(id)a4
{
  return (_SFSingleBookmarkNavigationController *)[(_SFSingleBookmarkNavigationController *)self _initWithBookmark:0 childBookmarks:a3 inCollection:a4 withSyntheticFolder:0 addingBookmark:1 toFavorites:0];
}

- (id)initForAddingToFavoritesInCollection:(id)a3
{
  return [(_SFSingleBookmarkNavigationController *)self _initWithBookmark:0 childBookmarks:0 inCollection:a3 withSyntheticFolder:0 addingBookmark:1 toFavorites:1];
}

- (id)initForAddingToSyntheticBookmarkFolder:(id)a3
{
  return [(_SFSingleBookmarkNavigationController *)self _initWithBookmark:0 childBookmarks:0 inCollection:0 withSyntheticFolder:a3 addingBookmark:1 toFavorites:1];
}

- (void)dealloc
{
  [(_SFSingleBookmarkNavigationController *)self _releaseBookmarkLockIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)_SFSingleBookmarkNavigationController;
  [(_SFSingleBookmarkNavigationController *)&v3 dealloc];
}

- (id)_lastSelectedFolder
{
  objc_super v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = [v3 stringForKey:*MEMORY[0x1E4F78A08]];

  if ([v4 isEqualToString:*MEMORY[0x1E4F78A10]])
  {
    uint64_t v5 = [(WebBookmarkCollection *)self->_collection favoritesFolder];
  }
  else
  {
    if (!v4)
    {
      v6 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = [(WebBookmarkCollection *)self->_collection bookmarkWithUUID:v4];
  }
  v6 = (void *)v5;
LABEL_7:
  if ([v6 isBookmarksMenuFolder]
    && (-[WebBookmarkCollection listWithID:](self->_collection, "listWithID:", [v6 identifier]),
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 bookmarkCount],
        v7,
        !v8))
  {
  }
  else if (v6)
  {
    goto LABEL_13;
  }
  v6 = [(WebBookmarkCollection *)self->_collection bookmarksBarBookmark];
LABEL_13:

  return v6;
}

- (id)addBookmarkWithTitle:(id)a3 address:(id)a4 parentBookmark:(id)a5
{
  id v8 = a5;
  BOOL v9 = (objc_class *)MEMORY[0x1E4FB60E0];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 alloc];
  v13 = [(WebBookmarkCollection *)self->_collection configuration];
  id v14 = objc_msgSend(v12, "initWithTitle:address:collectionType:", v11, v10, objc_msgSend(v13, "collectionType"));

  collection = self->_collection;
  id v16 = v8;
  if (!v8)
  {
    id v16 = [(_SFSingleBookmarkNavigationController *)self _lastSelectedFolder];
  }
  -[WebBookmarkCollection moveBookmark:toFolderWithID:](collection, "moveBookmark:toFolderWithID:", v14, [v16 identifier]);
  if (v8)
  {
    [(_SFBookmarkInfoViewController *)self->_infoViewController setBookmark:v14];
  }
  else
  {

    [(_SFBookmarkInfoViewController *)self->_infoViewController setBookmark:v14];
    [(_SFBookmarkInfoViewController *)self->_infoViewController updateLastSelectedSyntheticFolder];
  }

  return v14;
}

- (void)_willResignActive
{
  objc_super v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A690B000, v3, OS_LOG_TYPE_INFO, "Application will resign active, single bookmark navigation controller unlocking bookmarks if needed", v4, 2u);
  }
  self->_needsBookmarksLockOnAppResume = self->_bookmarkCollectionLocked;
  [(_SFSingleBookmarkNavigationController *)self _releaseBookmarkLockIfNeeded];
}

- (void)_didBecomeActive
{
  objc_super v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A690B000, v3, OS_LOG_TYPE_INFO, "Application did become active, single bookmark navigation controller locking bookmarks if needed", v4, 2u);
  }
  if (self->_needsBookmarksLockOnAppResume) {
    [(_SFSingleBookmarkNavigationController *)self prepareForPresentationForAddingBookmark:0];
  }
  self->_needsBookmarksLockOnAppResume = 0;
}

- (void)_releaseBookmarkLockIfNeeded
{
  objc_super v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A690B000, v3, OS_LOG_TYPE_INFO, "Single bookmark navigation controller unlocking bookmarks", v4, 2u);
  }
  if (self->_bookmarkCollectionLocked)
  {
    [MEMORY[0x1E4FB60E8] unlockSync];
    self->_bookmarkCollectionLocked = 0;
  }
  [MEMORY[0x1E4FB60E8] unholdLockSync:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(_SFSingleBookmarkNavigationController *)self _releaseBookmarkLockIfNeeded];
  v6.receiver = self;
  v6.super_class = (Class)_SFSingleBookmarkNavigationController;
  [(_SFSingleBookmarkNavigationController *)&v6 viewDidDisappear:v3];
  if (!self->_delegateNotifiedOfResult)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarkNavDelegate);
    [WeakRetained addBookmarkNavController:self didFinishWithResult:0 bookmark:0];
  }
}

- (BOOL)prepareForPresentationForAddingBookmark:(BOOL)a3
{
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Single bookmark navigation controller preparing for presentation for adding bookmark", v8, 2u);
  }
  objc_super v6 = [MEMORY[0x1E4F781E8] sharedCoordinator];
  [v6 unlockBookmarksIfNeeded];

  [MEMORY[0x1E4FB60E8] holdLockSync:self];
  if (!self->_bookmarkCollectionLocked && ([MEMORY[0x1E4FB60E8] isLockedSync] & 1) == 0) {
    self->_bookmarkCollectionLocked = [MEMORY[0x1E4FB60E8] lockSync];
  }
  return a3 || self->_bookmarkCollectionLocked;
}

- (void)bookmarkInfoViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  BOOL v4 = a4;
  self->_delegateNotifiedOfResult = 1;
  p_bookmarkNavDelegate = &self->_bookmarkNavDelegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_bookmarkNavDelegate);
  id v8 = [v7 bookmark];

  [WeakRetained addBookmarkNavController:self didFinishWithResult:v4 bookmark:v8];
  BOOL v9 = WeakRetained;
  if (!WeakRetained)
  {
    [(_SFSingleBookmarkNavigationController *)self dismissViewControllerAnimated:1 completion:0];
    BOOL v9 = 0;
  }
}

- (BOOL)bookmarkInfoViewControllerShouldUseTranslucentAppearance:(id)a3
{
  return 0;
}

- (BOOL)bookmarkInfoViewControllerCanSaveBookmarkChanges:(id)a3
{
  BOOL v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarkNavDelegate);
  LOBYTE(v3) = [WeakRetained addBookmarkNavControllerCanSaveBookmarkChanges:v3];

  return (char)v3;
}

- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syntheticBookmarkProvider);

  return WeakRetained;
}

- (_SFSingleBookmarkNavigationControllerDelegate)bookmarkNavDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarkNavDelegate);

  return (_SFSingleBookmarkNavigationControllerDelegate *)WeakRetained;
}

- (void)setBookmarkNavDelegate:(id)a3
{
}

- (id)addBookmarkAnalyticsHandler
{
  return self->_addBookmarkAnalyticsHandler;
}

- (void)setAddBookmarkAnalyticsHandler:(id)a3
{
}

- (_SFSyntheticBookmarkProvider)syntheticBookmarkProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syntheticBookmarkProvider);

  return (_SFSyntheticBookmarkProvider *)WeakRetained;
}

- (void)setSyntheticBookmarkProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syntheticBookmarkProvider);
  objc_storeStrong(&self->_addBookmarkAnalyticsHandler, 0);
  objc_destroyWeak((id *)&self->_bookmarkNavDelegate);
  objc_storeStrong((id *)&self->_collection, 0);

  objc_storeStrong((id *)&self->_infoViewController, 0);
}

@end