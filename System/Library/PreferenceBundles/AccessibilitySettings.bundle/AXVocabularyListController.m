@interface AXVocabularyListController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (Class)detailViewControllerClass;
- (NSArray)items;
- (id)_detailTextForSpecifier:(id)a3;
- (id)detailTextForItem:(id)a3;
- (id)specifiers;
- (id)textForItem:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableViewStyle;
- (void)_handleDoneButtonTapped:(id)a3;
- (void)_handleEditButtonTapped:(id)a3;
- (void)_updateEditButton;
- (void)addButtonTapped;
- (void)deleteItem:(id)a3;
- (void)reloadSpecifiers;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXVocabularyListController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)AXVocabularyListController;
  [(AXVocabularyListController *)&v7 viewDidLoad];
  [(AXVocabularyListController *)self _updateEditButton];
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"_addButtonTapped:"];
  v4 = [(AXVocabularyListController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = [(AXVocabularyListController *)self table];
  [v5 setCountStringInsignificantRowCount:9];

  v6 = [(AXVocabularyListController *)self table];
  [v6 setIndexHidden:0 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXVocabularyListController;
  [(AXVocabularyListController *)&v5 viewWillAppear:a3];
  v4 = [(AXVocabularyListController *)self navigationController];
  [v4 setToolbarHidden:0 animated:1];

  [(AXVocabularyListController *)self _updateEditButton];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXVocabularyListController;
  [(AXVocabularyListController *)&v5 viewWillDisappear:a3];
  v4 = [(AXVocabularyListController *)self navigationController];
  [v4 setToolbarHidden:1 animated:1];

  [(AXVocabularyListController *)self setToolbarItems:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXVocabularyListController;
  [(AXVocabularyListController *)&v4 viewDidDisappear:a3];
  [(AXVocabularyListController *)self setEditing:0 animated:0];
  [(AXVocabularyListController *)self _updateEditButton];
}

- (void)_updateEditButton
{
  if ([(AXVocabularyListController *)self isEditing])
  {
    id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_handleDoneButtonTapped:"];
    id v9 = v3;
    objc_super v4 = &v9;
LABEL_5:
    objc_super v7 = +[NSArray arrayWithObjects:v4 count:1];
    [(AXVocabularyListController *)self setToolbarItems:v7];

    return;
  }
  objc_super v5 = [(AXVocabularyListController *)self items];
  id v6 = [v5 count];

  if (v6)
  {
    id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"_handleEditButtonTapped:"];
    id v8 = v3;
    objc_super v4 = &v8;
    goto LABEL_5;
  }

  [(AXVocabularyListController *)self setToolbarItems:0];
}

- (id)specifiers
{
  id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v19 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    objc_super v5 = [(AXVocabularyListController *)self items];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __40__AXVocabularyListController_specifiers__block_invoke;
    v25[3] = &unk_20B9D8;
    v25[4] = self;
    id v6 = [v5 sortedArrayUsingComparator:v25];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v6;
    id v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v12 = [(AXVocabularyListController *)self detailViewControllerClass];
          v13 = [(AXVocabularyListController *)self textForItem:v11];
          if (v12) {
            uint64_t v14 = 2;
          }
          else {
            uint64_t v14 = 3;
          }
          v15 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"_detailTextForSpecifier:" detail:v12 cell:v14 edit:0];

          [v15 setProperty:v11 forKey:@"AXVocabularyListItem"];
          [v4 addObject:v15];
        }
        id v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    v16 = *(void **)&self->AXUISettingsBaseListController_opaque[v19];
    *(void *)&self->AXUISettingsBaseListController_opaque[v19] = v4;
    id v17 = v4;

    id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v19];
  }

  return v3;
}

id __40__AXVocabularyListController_specifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 textForItem:a2];
  id v8 = [*(id *)(a1 + 32) textForItem:v6];

  id v9 = [v7 localizedCompare:v8];
  return v9;
}

- (id)_detailTextForSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:@"AXVocabularyListItem"];
  objc_super v5 = [(AXVocabularyListController *)self detailTextForItem:v4];

  return v5;
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)AXVocabularyListController;
  [(AXVocabularyListController *)&v3 reloadSpecifiers];
  [(AXVocabularyListController *)self _updateEditButton];
}

- (void)_handleDoneButtonTapped:(id)a3
{
  [(AXVocabularyListController *)self setEditing:0 animated:1];

  [(AXVocabularyListController *)self _updateEditButton];
}

- (void)_handleEditButtonTapped:(id)a3
{
  [(AXVocabularyListController *)self setEditing:1 animated:1];

  [(AXVocabularyListController *)self _updateEditButton];
}

- (int64_t)tableViewStyle
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    id v9 = [(AXVocabularyListController *)self specifierAtIndexPath:v8];
    v10 = [v9 propertyForKey:@"AXVocabularyListItem"];
    [(AXVocabularyListController *)self deleteItem:v10];
    [(AXVocabularyListController *)self removeSpecifier:v9 animated:1];
  }
  uint64_t v11 = [(AXVocabularyListController *)self items];
  id v12 = [v11 count];

  if (!v12) {
    [(AXVocabularyListController *)self _handleDoneButtonTapped:0];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (NSArray)items
{
  return 0;
}

- (id)textForItem:(id)a3
{
  return &stru_20F6B8;
}

- (id)detailTextForItem:(id)a3
{
  return 0;
}

- (Class)detailViewControllerClass
{
  return 0;
}

- (void)deleteItem:(id)a3
{
  OUTLINED_FUNCTION_1_2();
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)addButtonTapped
{
  OUTLINED_FUNCTION_1_2();
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end