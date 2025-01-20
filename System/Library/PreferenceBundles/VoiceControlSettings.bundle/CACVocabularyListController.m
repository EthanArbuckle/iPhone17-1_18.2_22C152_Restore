@interface CACVocabularyListController
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
- (void)_addButtonTapped:(id)a3;
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

@implementation CACVocabularyListController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CACVocabularyListController;
  [(CACVocabularyListController *)&v7 viewDidLoad];
  [(CACVocabularyListController *)self _updateEditButton];
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"_addButtonTapped:"];
  v4 = [(CACVocabularyListController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = [(CACVocabularyListController *)self table];
  [v5 setCountStringInsignificantRowCount:9];

  v6 = [(CACVocabularyListController *)self table];
  [v6 setIndexHidden:0 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACVocabularyListController;
  [(CACVocabularyListController *)&v5 viewWillAppear:a3];
  v4 = [(CACVocabularyListController *)self navigationController];
  [v4 setToolbarHidden:0 animated:1];

  [(CACVocabularyListController *)self _updateEditButton];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACVocabularyListController;
  [(CACVocabularyListController *)&v5 viewWillDisappear:a3];
  v4 = [(CACVocabularyListController *)self navigationController];
  [v4 setToolbarHidden:1 animated:1];

  [(CACVocabularyListController *)self setToolbarItems:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CACVocabularyListController;
  [(CACVocabularyListController *)&v4 viewDidDisappear:a3];
  [(CACVocabularyListController *)self setEditing:0 animated:0];
  [(CACVocabularyListController *)self _updateEditButton];
}

- (void)_updateEditButton
{
  if ([(CACVocabularyListController *)self isEditing])
  {
    id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_handleDoneButtonTapped:"];
    id v9 = v3;
    objc_super v4 = &v9;
LABEL_5:
    objc_super v7 = +[NSArray arrayWithObjects:v4 count:1];
    [(CACVocabularyListController *)self setToolbarItems:v7];

    return;
  }
  objc_super v5 = [(CACVocabularyListController *)self items];
  id v6 = [v5 count];

  if (v6)
  {
    id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"_handleEditButtonTapped:"];
    id v8 = v3;
    objc_super v4 = &v8;
    goto LABEL_5;
  }

  [(CACVocabularyListController *)self setToolbarItems:0];
}

- (id)specifiers
{
  id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v19 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    objc_super v5 = [(CACVocabularyListController *)self items];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_78E0;
    v25[3] = &unk_4DA58;
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
          v12 = [(CACVocabularyListController *)self detailViewControllerClass];
          v13 = [(CACVocabularyListController *)self textForItem:v11];
          if (v12) {
            uint64_t v14 = 2;
          }
          else {
            uint64_t v14 = 3;
          }
          v15 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"_detailTextForSpecifier:" detail:v12 cell:v14 edit:0];

          [v15 setProperty:v11 forKey:@"CACVocabularyListItem"];
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

- (id)_detailTextForSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:@"CACVocabularyListItem"];
  objc_super v5 = [(CACVocabularyListController *)self detailTextForItem:v4];

  return v5;
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)CACVocabularyListController;
  [(CACVocabularyListController *)&v3 reloadSpecifiers];
  [(CACVocabularyListController *)self _updateEditButton];
}

- (void)_addButtonTapped:(id)a3
{
}

- (void)_handleDoneButtonTapped:(id)a3
{
  [(CACVocabularyListController *)self setEditing:0 animated:1];

  [(CACVocabularyListController *)self _updateEditButton];
}

- (void)_handleEditButtonTapped:(id)a3
{
  [(CACVocabularyListController *)self setEditing:1 animated:1];

  [(CACVocabularyListController *)self _updateEditButton];
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
    uint64_t v9 = [(CACVocabularyListController *)self specifierAtIndexPath:v8];
    v10 = [v9 propertyForKey:@"CACVocabularyListItem"];
    [(CACVocabularyListController *)self deleteItem:v10];
    [(CACVocabularyListController *)self removeSpecifier:v9 animated:1];
  }
  uint64_t v11 = [(CACVocabularyListController *)self items];
  id v12 = [v11 count];

  if (!v12) {
    [(CACVocabularyListController *)self _handleDoneButtonTapped:0];
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
  sub_7BB4();
  uint64_t v2 = objc_opt_class();
  sub_7B98(v2);
  return 0;
}

- (id)textForItem:(id)a3
{
  sub_7BB4();
  uint64_t v3 = objc_opt_class();
  sub_7B98(v3);
  return &stru_4EAE0;
}

- (id)detailTextForItem:(id)a3
{
  sub_7BB4();
  uint64_t v3 = objc_opt_class();
  sub_7B98(v3);
  return 0;
}

- (Class)detailViewControllerClass
{
  sub_7BB4();
  uint64_t v2 = objc_opt_class();
  sub_7B98(v2);
  return 0;
}

- (void)deleteItem:(id)a3
{
  sub_7BB4();
  objc_opt_class();

  _NSRequestConcreteImplementation(v3);
}

- (void)addButtonTapped
{
  sub_7BB4();
  objc_opt_class();

  _NSRequestConcreteImplementation(v2);
}

@end