@interface CACCommandSearchResultsViewController
- (CACSearchResultPresenter)delegate;
- (NSArray)searchResults;
- (id)specifiers;
- (void)didDismissSearchController:(id)a3;
- (void)keyboardWasShown:(id)a3;
- (void)keyboardWillBeHidden:(id)a3;
- (void)presentCustomAction:(id)a3;
- (void)registerForKeyboardNotifications;
- (void)setDelegate:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CACCommandSearchResultsViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CACCommandSearchResultsViewController;
  [(CACCommandSearchResultsViewController *)&v3 viewDidLoad];
  [(CACCommandSearchResultsViewController *)self registerForKeyboardNotifications];
}

- (id)specifiers
{
  v29 = +[NSMutableArray array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  objc_super v3 = self;
  id obj = [(CACCommandSearchResultsViewController *)self searchResults];
  id v25 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v35;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v4;
        v5 = *(void **)(*((void *)&v34 + 1) + 8 * v4);
        v6 = [v5 commandGroup];
        v7 = [v6 displayString];
        uint64_t v8 = +[PSSpecifier groupSpecifierWithName:v7];

        v26 = (void *)v8;
        [v29 addObject:v8];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v28 = [v5 commandItems];
        id v9 = [v28 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v31;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v31 != v11) {
                objc_enumerationMutation(v28);
              }
              v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if ([v13 isCustom]) {
                uint64_t v14 = 0;
              }
              else {
                uint64_t v14 = objc_opt_class();
              }
              v15 = [v13 displayString];
              v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:v3 set:0 get:0 detail:v14 cell:2 edit:0];

              if ([v13 isCustom]) {
                [v16 setControllerLoadAction:"presentCustomAction:"];
              }
              [v16 setProperty:v13 forKey:@"CACCommandItem"];
              [v29 addObject:v16];
            }
            id v10 = [v28 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v10);
        }

        uint64_t v4 = v27 + 1;
      }
      while ((id)(v27 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v25);
  }

  uint64_t v17 = OBJC_IVAR___PSListController__specifiers;
  v18 = v3;
  v19 = *(void **)&v3->AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&v3->AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers] = v29;
  id v20 = v29;

  id v21 = *(id *)&v18->AXUISettingsListController_opaque[v17];
  return v21;
}

- (void)setSearchResults:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  v5 = self;
  objc_sync_enter(v5);
  searchResults = v5->_searchResults;
  v5->_searchResults = v4;
  v7 = v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A3FC;
  block[3] = &unk_4D980;
  block[4] = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_sync_exit(v5);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a4;
  id v6 = a3;
  v7 = [(CACCommandSearchResultsViewController *)self searchResults];
  uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v15, "section"));

  id v9 = [v8 commandItems];
  id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v15, "row"));

  if ([v10 isCustom]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = objc_opt_class();
  }
  v12 = [v10 displayString];
  v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:v11 cell:2 edit:0];

  if ([v10 isCustom]) {
    [v13 setControllerLoadAction:"presentCustomAction:"];
  }
  [v13 setProperty:v10 forKey:@"CACCommandItem"];
  [v6 deselectRowAtIndexPath:v15 animated:1];

  uint64_t v14 = [(CACCommandSearchResultsViewController *)self delegate];
  [v14 searchResultSpecifierSelected:v13];
}

- (void)didDismissSearchController:(id)a3
{
}

- (void)registerForKeyboardNotifications
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"keyboardWasShown:" name:UIKeyboardDidShowNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"keyboardWillBeHidden:" name:UIKeyboardWillHideNotification object:0];
}

- (void)keyboardWasShown:(id)a3
{
  id v9 = [a3 userInfo];
  id v4 = [v9 objectForKey:UIKeyboardFrameBeginUserInfoKey];
  [v4 CGRectValue];
  double v6 = v5;

  v7 = [(CACCommandSearchResultsViewController *)self contentScrollView];
  objc_msgSend(v7, "setContentInset:", 0.0, 0.0, v6, 0.0);

  uint64_t v8 = [(CACCommandSearchResultsViewController *)self contentScrollView];
  objc_msgSend(v8, "setScrollIndicatorInsets:", 0.0, 0.0, v6, 0.0);
}

- (void)keyboardWillBeHidden:(id)a3
{
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v7 = [(CACCommandSearchResultsViewController *)self contentScrollView];
  objc_msgSend(v7, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);

  id v8 = [(CACCommandSearchResultsViewController *)self contentScrollView];
  objc_msgSend(v8, "setScrollIndicatorInsets:", UIEdgeInsetsZero.top, left, bottom, right);
}

- (void)presentCustomAction:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init((Class)CACCustomCommandEditorViewController);
  double v5 = [v4 propertyForKey:@"CACCommandItem"];

  [v7 setCommandItem:v5];
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  [(CACCommandSearchResultsViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (CACSearchResultPresenter)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CACSearchResultPresenter *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end