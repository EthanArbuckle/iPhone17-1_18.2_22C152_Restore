@interface ACAssistantAlternateProviderController
- (ACAssistantAlternateProviderController)initWithAlternateProviderSnippet:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (double)desiredHeightForWidth:(double)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)sashItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
@end

@implementation ACAssistantAlternateProviderController

- (ACAssistantAlternateProviderController)initWithAlternateProviderSnippet:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACAssistantAlternateProviderController;
  v6 = [(ACAssistantAlternateProviderController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    -[ACAssistantAlternateProviderController setDefaultViewInsets:](v6, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    objc_storeStrong((id *)&v7->_snippet, a3);
    uint64_t v8 = [v5 title];
    snippetTitle = v7->_snippetTitle;
    v7->_snippetTitle = (NSString *)v8;

    v10 = [v5 alternateProviderResults];
    uint64_t v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    viewArray = v7->_viewArray;
    v7->_viewArray = (NSMutableArray *)v11;
  }
  return v7;
}

- (void)loadView
{
  v21.receiver = self;
  v21.super_class = (Class)ACAssistantAlternateProviderController;
  [(ACAssistantAlternateProviderController *)&v21 loadView];
  v3 = [(ACAssistantAlternateProviderController *)self collectionView];
  v4 = [(ACAssistantAlternateProviderController *)self delegate];
  id v5 = [v4 persistentDataStoreForSiriViewController:self];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(SAUIAlternateProviderSnippet *)self->_snippet alternateProviderResults];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [[ACAssistantAlternateProviderResultView alloc] initWithAlternateProviderResult:*(void *)(*((void *)&v17 + 1) + 8 * (void)v10) usingPersistentStore:v5];
        [(NSMutableArray *)self->_viewArray addObject:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  v12 = [(ACAssistantAlternateProviderController *)self delegate];
  [v12 siriViewControllerExpectedWidth:self];
  double v14 = v13;

  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v14, 0.0);
  [v3 setDataSource:self];
  [v3 setDelegate:self];
  uint64_t v15 = objc_opt_class();
  v16 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  [v3 registerClass:v15 forCellWithReuseIdentifier:v16];
}

- (double)desiredHeightForWidth:(double)a3
{
  if (([(ACAssistantAlternateProviderController *)self isViewLoaded] & 1) == 0) {
    [(ACAssistantAlternateProviderController *)self loadView];
  }
  v4 = [(ACAssistantAlternateProviderController *)self collectionView];
  id v5 = [v4 collectionViewLayout];
  [v5 collectionViewContentSize];
  double v7 = v6;

  return v7;
}

- (id)sashItem
{
  id v2 = objc_alloc((Class)SiriUISashItem);
  v3 = +[SiriUIUtilities defaultBrowserBundleIdentifier];
  id v4 = [v2 initWithApplicationBundleIdentifier:v3];

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  double v6 = [v5 siriUILocalizedStringForKey:@"OTHER_SOURCES" table:0];
  [v4 setTitle:v6];

  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(ACAssistantAlternateProviderController *)self collectionView];
  double v7 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  id v8 = [v6 dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v5];

  [v8 setHasChevron:0];
  viewArray = self->_viewArray;
  id v10 = [v5 item];

  uint64_t v11 = [(NSMutableArray *)viewArray objectAtIndex:v10];
  [v11 edgeInsets];
  objc_msgSend(v8, "setCustomViewEdgeInsets:");
  [v8 setCustomView:v11];
  v12 = [(NSMutableArray *)self->_viewArray lastObject];
  BOOL v13 = v11 != v12;

  [v8 setKeylineType:v13];

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_viewArray count];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  double v7 = [(ACAssistantAlternateProviderController *)self delegate];
  [v7 siriViewControllerExpectedWidth:self];
  double v9 = v8;

  viewArray = self->_viewArray;
  id v11 = [v6 item];

  v12 = [(NSMutableArray *)viewArray objectAtIndex:v11];
  objc_msgSend(v12, "sizeThatFits:", v9, 1.79769313e308);
  double v14 = v13;

  double v15 = v9;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  viewArray = self->_viewArray;
  id v8 = [v6 row];

  id v11 = [(NSMutableArray *)viewArray objectAtIndex:v8];
  double v9 = [(ACAssistantAlternateProviderController *)self delegate];
  id v10 = [v11 commands];
  [v9 siriViewController:self performAceCommands:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippet, 0);
  objc_storeStrong((id *)&self->_snippetTitle, 0);

  objc_storeStrong((id *)&self->_viewArray, 0);
}

@end