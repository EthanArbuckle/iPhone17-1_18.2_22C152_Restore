@interface _UIShareOverviewController
- (BOOL)isShowAddPeople;
- (BOOL)itemIsInsideFolderShare;
- (BOOL)itemIsShareRoot;
- (BOOL)shareViewControllerIsNotesOrRemindersOrDocSharing;
- (CKShare)share;
- (NSError)error;
- (NSString)itemName;
- (NSURL)itemURL;
- (UIBarButtonItem)closeButton;
- (_UIShareOverviewController)initWithDelegate:(id)a3;
- (_UIShareOverviewControllerDelegate)delegate;
- (id)editableParticipants;
- (id)rootItemName;
- (id)shareRootItemURL;
- (id)sharedByModifiedByText;
- (int)popoverPresentationMode;
- (void)dismiss;
- (void)presentError:(id)a3;
- (void)presentReachabilityViewController:(id)a3 animated:(BOOL)a4;
- (void)setCloseButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setItemName:(id)a3;
- (void)setNavigationItemSpinner:(BOOL)a3;
- (void)shareDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateThumbnail;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _UIShareOverviewController

- (_UIShareOverviewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIShareOverviewController;
  v5 = [(_UIShareOverviewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(_UIShareOverviewController *)v5 setDelegate:v4];
  }

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIShareOverviewController;
  [(_UIShareOverviewController *)&v8 viewWillAppear:a3];
  -[_UIShareOverviewController setPreferredContentSize:](self, "setPreferredContentSize:", 375.0, 575.0);
  id v4 = [(_UIShareOverviewController *)self closeButton];

  if (v4)
  {
    id v5 = [(_UIShareOverviewController *)self closeButton];
  }
  else
  {
    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"dismiss"];
  }
  v6 = v5;
  v7 = [(_UIShareOverviewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];
}

- (void)presentError:(id)a3
{
  id v4 = a3;
  [(_UIShareOverviewController *)self setError:v4];
  id v5 = [(_UIShareOverviewController *)self delegate];
  [v5 shareViewController:self presentError:v4];
}

- (void)dismiss
{
  id v3 = [(_UIShareOverviewController *)self delegate];
  [v3 shareViewControllerDismiss:self];
}

- (CKShare)share
{
  id v3 = [(_UIShareOverviewController *)self delegate];
  id v4 = [v3 viewControllerShare:self];

  return (CKShare *)v4;
}

- (BOOL)isShowAddPeople
{
  v2 = [(_UIShareOverviewController *)self delegate];
  unsigned __int8 v3 = [v2 isShowAddPeople];

  return v3;
}

- (id)editableParticipants
{
  v2 = [(_UIShareOverviewController *)self delegate];
  unsigned __int8 v3 = [v2 editableParticipants];

  return v3;
}

- (BOOL)itemIsShareRoot
{
  v2 = [(_UIShareOverviewController *)self delegate];
  unsigned __int8 v3 = [v2 itemIsShareRoot];

  return v3;
}

- (BOOL)itemIsInsideFolderShare
{
  v2 = [(_UIShareOverviewController *)self delegate];
  unsigned __int8 v3 = [v2 itemIsInsideFolderShare];

  return v3;
}

- (id)shareRootItemURL
{
  v2 = [(_UIShareOverviewController *)self delegate];
  unsigned __int8 v3 = [v2 shareRootItemURL];

  return v3;
}

- (id)rootItemName
{
  v2 = [(_UIShareOverviewController *)self delegate];
  unsigned __int8 v3 = [v2 rootItemName];

  return v3;
}

- (id)sharedByModifiedByText
{
  v2 = [(_UIShareOverviewController *)self delegate];
  unsigned __int8 v3 = [v2 sharedByModifiedByText];

  return v3;
}

- (BOOL)shareViewControllerIsNotesOrRemindersOrDocSharing
{
  v2 = self;
  unsigned __int8 v3 = [(_UIShareOverviewController *)self delegate];
  LOBYTE(v2) = [v3 shareViewControllerIsNotesOrRemindersOrDocSharing:v2];

  return (char)v2;
}

- (NSURL)itemURL
{
  unsigned __int8 v3 = [(_UIShareOverviewController *)self delegate];
  id v4 = [v3 viewControllerItemURL:self];

  return (NSURL *)v4;
}

- (void)setNavigationItemSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIShareOverviewController *)self navigationItem];
  v6 = [v5 leftBarButtonItems];
  v7 = +[NSMutableArray arrayWithArray:v6];

  if (v3)
  {
    if (!self->_showingSpinner)
    {
      id v8 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      [v8 startAnimating];
      id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
      id v10 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v8];
      [v7 addObject:v9];
      [v7 addObject:v10];
      self->_BOOL showingSpinner = 1;
    }
  }
  else if (self->_showingSpinner)
  {
    [v7 removeLastObject];
    [v7 removeLastObject];
    self->_BOOL showingSpinner = 0;
  }
  v11 = [(_UIShareOverviewController *)self navigationItem];
  [v11 setLeftBarButtonItems:v7];

  id v12 = [(_UIShareOverviewController *)self navigationItem];
  v13 = [v12 rightBarButtonItem];
  if (v13)
  {

LABEL_10:
    goto LABEL_11;
  }
  BOOL showingSpinner = self->_showingSpinner;

  if (showingSpinner)
  {
    id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    id v18 = v12;
    v15 = +[NSArray arrayWithObjects:&v18 count:1];
    v16 = [(_UIShareOverviewController *)self navigationItem];
    [v16 setRightBarButtonItems:v15];

    goto LABEL_10;
  }
LABEL_11:
  v17 = [(_UIShareOverviewController *)self view];
  [v17 setUserInteractionEnabled:!v3];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UIShareOverviewController;
  [(_UIShareOverviewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(_UIShareOverviewController *)self updateTraitCollection];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIShareOverviewController;
  [(_UIShareOverviewController *)&v4 traitCollectionDidChange:a3];
  [(_UIShareOverviewController *)self updateTraitCollection];
}

- (void)presentReachabilityViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 setModalPresentationStyle:6];
  [(_UIShareOverviewController *)self presentViewController:v6 animated:v4 completion:0];
}

- (int)popoverPresentationMode
{
  return 0;
}

- (_UIShareOverviewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UIShareOverviewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
}

- (UIBarButtonItem)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_itemName, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updateThumbnail
{
  uint64_t v4 = objc_opt_class();

  _NSRequestConcreteImplementation(self, a2, v4);
}

- (void)shareDidChange
{
  uint64_t v4 = objc_opt_class();

  _NSRequestConcreteImplementation(self, a2, v4);
}

@end