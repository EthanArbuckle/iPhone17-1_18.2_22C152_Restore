@interface AXSystemActionPickerController
- (AXSystemActionPickerController)init;
- (AXSystemActionPickerControllerDelegate)delegate;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSString)identifier;
- (NSString)siriShortcutToken;
- (id)prependedTopIcons;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSiriShortcutToken:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXSystemActionPickerController

- (id)prependedTopIcons
{
  v4[0] = @"__NONE__";
  v4[1] = AXAssistiveTouchIconTypeTripleClick;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (void)dealloc
{
  v3 = +[AXSiriShortcutsManager sharedManager];
  [v3 unregisterShortcutsDidChangeBlock:self->_siriShortcutToken];

  v4.receiver = self;
  v4.super_class = (Class)AXSystemActionPickerController;
  [(AXSystemActionPickerController *)&v4 dealloc];
}

- (AXSystemActionPickerController)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXSystemActionPickerController;
  v2 = [(AXSystemActionPickerController *)&v10 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSiriShortcutsManager sharedManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __38__AXSystemActionPickerController_init__block_invoke;
    v7[3] = &unk_2099A8;
    objc_copyWeak(&v8, &location);
    uint64_t v4 = [v3 registerShortcutsDidChangeBlock:v7];
    siriShortcutToken = v2->_siriShortcutToken;
    v2->_siriShortcutToken = (NSString *)v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__AXSystemActionPickerController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = [(AssistiveTouchCustomizeBaseActionPickerController *)self iconSpecifiers];
    [v5 addObjectsFromArray:v6];

    v7 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;

    uint64_t v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)loadView
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = __42__AXSystemActionPickerController_loadView__block_invoke;
  v4[3] = &unk_20B010;
  objc_copyWeak(&v5, &location);
  [(AssistiveTouchCustomizeBaseActionPickerController *)self setIconFilter:v4];
  v3.receiver = self;
  v3.super_class = (Class)AXSystemActionPickerController;
  [(AssistiveTouchCustomizeBaseActionPickerController *)&v3 loadView];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __42__AXSystemActionPickerController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  v6 = [WeakRetained delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v4);
    v9 = [v8 delegate];
    id v10 = [v9 supportsIconType:v3];
  }
  else
  {
    id v8 = AXSystemActionIconTypes();
    if ([v8 containsObject:v3]) {
      id v10 = &dword_0 + 1;
    }
    else {
      id v10 = [v3 hasPrefix:AXASTSiriShortcutPrefixName];
    }
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AXSystemActionPickerController *)self delegate];

  if (v5)
  {
    v6 = [(AXSystemActionPickerController *)self delegate];
    char v7 = [v6 actionForActionPickerController:self];
    [(AssistiveTouchCustomizeBaseActionPickerController *)self setSelectedPopoverIcon:v7];
  }
  v8.receiver = self;
  v8.super_class = (Class)AXSystemActionPickerController;
  [(AXSystemActionPickerController *)&v8 viewWillAppear:v3];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [(AssistiveTouchCustomizeBaseActionPickerController *)self astTableView:a3 didSelectRowAtIndexPath:a4];
  id v7 = [(AssistiveTouchCustomizeBaseActionPickerController *)self selectedPopoverIcon];
  id v5 = [(AXSystemActionPickerController *)self delegate];

  if (v5)
  {
    v6 = [(AXSystemActionPickerController *)self delegate];
    [v6 actionPickerController:self didSelectAction:v7];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(AssistiveTouchCustomizeBaseActionPickerController *)self astNumberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(AssistiveTouchCustomizeBaseActionPickerController *)self astTitleForSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(AXSystemActionPickerController *)self specifierForIndexPath:v6];
  v9 = [(AssistiveTouchCustomizeBaseActionPickerController *)self astPickerCellForRowAtIndexPath:v6 tableView:v7];

  id v10 = [v8 propertyForKey:PSIDKey];
  LODWORD(v7) = [v10 isEqualToString:@"__NONE__"];

  if (v7)
  {
    v11 = settingsLocString(@"NONE", @"HandSettings");
    v12 = [v9 textLabel];
    [v12 setText:v11];
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (AXSystemActionPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSystemActionPickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)a3;
}

- (NSString)siriShortcutToken
{
  return self->_siriShortcutToken;
}

- (void)setSiriShortcutToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriShortcutToken, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end