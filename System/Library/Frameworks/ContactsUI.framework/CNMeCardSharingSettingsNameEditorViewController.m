@interface CNMeCardSharingSettingsNameEditorViewController
- (CNMeCardSharingSettingsNameEditorViewController)initWithTextFields:(id)a3;
- (NSArray)textFields;
- (UICollectionView)collectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)doneTapped;
- (void)setCollectionView:(id)a3;
- (void)setTextFields:(id)a3;
- (void)setUpCollectionView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNMeCardSharingSettingsNameEditorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFields, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

- (void)setTextFields:(id)a3
{
}

- (NSArray)textFields
{
  return self->_textFields;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[CNMeCardSharingSettingsNameEditingCell cellIdentifier];
  v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  v10 = [(CNMeCardSharingSettingsNameEditorViewController *)self textFields];
  uint64_t v11 = [v6 row];

  v12 = [v10 objectAtIndexedSubscript:v11];
  [v9 setTextField:v12];

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(CNMeCardSharingSettingsNameEditorViewController *)self textFields];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)doneTapped
{
}

- (void)setUpCollectionView
{
  id v11 = (id)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  v3 = [MEMORY[0x1E4FB1580] layoutWithListConfiguration:v11];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  int64_t v5 = [(CNMeCardSharingSettingsNameEditorViewController *)self view];
  [v5 frame];
  id v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);

  [v6 setAutoresizingMask:18];
  [v6 setDelegate:self];
  [v6 setDataSource:self];
  [v6 setAllowsSelection:0];
  uint64_t v7 = objc_opt_class();
  v8 = +[CNMeCardSharingSettingsNameEditingCell cellIdentifier];
  [v6 registerClass:v7 forCellWithReuseIdentifier:v8];

  [(CNMeCardSharingSettingsNameEditorViewController *)self setCollectionView:v6];
  v9 = [(CNMeCardSharingSettingsNameEditorViewController *)self view];
  v10 = [(CNMeCardSharingSettingsNameEditorViewController *)self collectionView];
  [v9 addSubview:v10];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNMeCardSharingSettingsNameEditorViewController;
  [(CNMeCardSharingSettingsNameEditorViewController *)&v6 viewWillAppear:a3];
  id v4 = [(CNMeCardSharingSettingsNameEditorViewController *)self textFields];
  int64_t v5 = [v4 firstObject];

  [v5 becomeFirstResponder];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNMeCardSharingSettingsNameEditorViewController;
  [(CNMeCardSharingSettingsNameEditorViewController *)&v3 viewDidLoad];
  [(CNMeCardSharingSettingsNameEditorViewController *)self setUpCollectionView];
}

- (CNMeCardSharingSettingsNameEditorViewController)initWithTextFields:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNMeCardSharingSettingsNameEditorViewController *)self init];
  if (v5)
  {
    objc_super v6 = CNContactsUIBundle();
    uint64_t v7 = [v6 localizedStringForKey:@"SHARING_NAME_CELL_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNMeCardSharingSettingsNameEditorViewController *)v5 setTitle:v7];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v5 action:sel_doneTapped];
    v9 = [(CNMeCardSharingSettingsNameEditorViewController *)v5 navigationItem];
    [v9 setRightBarButtonItem:v8];

    [(CNMeCardSharingSettingsNameEditorViewController *)v5 setTextFields:v4];
    v10 = v5;
  }
  return v5;
}

@end