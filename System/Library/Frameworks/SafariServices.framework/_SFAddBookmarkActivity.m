@interface _SFAddBookmarkActivity
- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (_SFSingleBookmarkNavigationController)bookmarkNavigationController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5;
@end

@implementation _SFAddBookmarkActivity

- (id)activityType
{
  return @"com.apple.mobilesafari.activity.addBookmark";
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return @"book";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F78290], "sharedFeatureManager", a3);
  int v4 = [v3 isBookmarksAvailable];

  if (!v4) {
    return 0;
  }
  v5 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
  char v6 = [v5 usesAllowedSitesOnly];

  if (v6) {
    return 0;
  }
  v8 = (void *)MEMORY[0x1E4F28B50];

  return objc_msgSend(v8, "safari_isMobileSafariInstalled");
}

- (_SFSingleBookmarkNavigationController)bookmarkNavigationController
{
  bookmarkNavigationController = self->_bookmarkNavigationController;
  if (!bookmarkNavigationController)
  {
    int v4 = [_SFSingleBookmarkNavigationController alloc];
    v5 = [MEMORY[0x1E4FB60E8] safariBookmarkCollection];
    char v6 = [(_SFSingleBookmarkNavigationController *)v4 initWithCollection:v5];
    v7 = self->_bookmarkNavigationController;
    self->_bookmarkNavigationController = v6;

    [(_SFSingleBookmarkNavigationController *)self->_bookmarkNavigationController setBookmarkNavDelegate:self];
    bookmarkNavigationController = self->_bookmarkNavigationController;
  }

  return bookmarkNavigationController;
}

- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5
{
}

- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end