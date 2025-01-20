@interface CPSURLOverrideDetailsController
- (CPSURLOverrideDetailsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)dismissHandler;
- (id)modelValueForSpecifier:(id)a3;
- (id)specifiers;
- (void)_anyTextFieldDidUpdate:(id)a3;
- (void)cancelAndDismiss:(id)a3;
- (void)chooseImage:(id)a3;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)removeOverride:(id)a3;
- (void)saveAndDismiss:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setModel:(id)a3;
- (void)setModelValue:(id)a3 forSpecifier:(id)a4;
- (void)updateHeroImageSpecifier;
- (void)updateSaveItem;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CPSURLOverrideDetailsController

- (CPSURLOverrideDetailsController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CPSURLOverrideDetailsController;
  v4 = [(CPSURLOverrideDetailsController *)&v11 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v4 action:"cancelAndDismiss:"];
    cancelItem = v4->_cancelItem;
    v4->_cancelItem = v5;

    v7 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:3 target:v4 action:"saveAndDismiss:"];
    saveItem = v4->_saveItem;
    v4->_saveItem = v7;

    v9 = v4;
  }

  return v4;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CPSURLOverrideDetailsController;
  [(CPSURLOverrideDetailsController *)&v5 viewDidLoad];
  v3 = [(CPSURLOverrideDetailsController *)self table];
  [v3 setKeyboardDismissMode:1];

  v4 = [(CPSURLOverrideDetailsController *)self navigationItem];
  [v4 setLeftBarButtonItem:self->_cancelItem];
  [v4 setRightBarButtonItem:self->_saveItem];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSURLOverrideDetailsController;
  [(CPSURLOverrideDetailsController *)&v5 viewDidAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_anyTextFieldDidUpdate:" name:UITextFieldTextDidChangeNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSURLOverrideDetailsController;
  [(CPSURLOverrideDetailsController *)&v5 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UITextFieldTextDidChangeNotification object:0];
}

- (void)saveAndDismiss:(id)a3
{
  [(CPSDeveloperOverride *)self->_model save];
  dismissHandler = (void (**)(id, uint64_t))self->_dismissHandler;
  if (dismissHandler) {
    dismissHandler[2](dismissHandler, 1);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifiers];
  objc_super v5 = [(CPSURLOverrideDetailsController *)self navigationController];
  id v6 = [v5 popViewControllerAnimated:1];

  SFKillProcessNamed();
}

- (void)cancelAndDismiss:(id)a3
{
  dismissHandler = (void (**)(id, void, id))self->_dismissHandler;
  if (dismissHandler) {
    dismissHandler[2](dismissHandler, 0, a3);
  }
  id v6 = [(CPSURLOverrideDetailsController *)self navigationController];
  id v5 = [v6 popViewControllerAnimated:1];
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
  [(CPSURLOverrideDetailsController *)self updateHeroImageSpecifier];

  [(CPSURLOverrideDetailsController *)self updateSaveItem];
}

- (id)specifiers
{
  v2 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (*v2)
  {
    id v3 = *v2;
  }
  else
  {
    if (qword_35F88 != -1) {
      dispatch_once(&qword_35F88, &stru_30F18);
    }
    id v5 = (id)qword_35F80;
    id v6 = [(CPSURLOverrideDetailsController *)self loadSpecifiersFromPlistName:@"URLOverrideDetailsSettings" target:self bundle:v5];

    v7 = [v6 specifierForID:@"RESET"];
    [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
    uint64_t v8 = OBJC_IVAR___PSViewController__specifier;
    v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"DeveloperOverride"];

    if (!v9) {
      [v6 removeObject:v7];
    }
    objc_storeStrong(v2, v6);
    v10 = [*(id *)&self->PSListController_opaque[v8] propertyForKey:@"DeveloperOverride"];
    objc_super v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = objc_alloc_init((Class)CPSDeveloperOverride);
    }
    v13 = v12;

    [(CPSURLOverrideDetailsController *)self setModel:v13];
    id v3 = *v2;
  }

  return v3;
}

- (id)modelValueForSpecifier:(id)a3
{
  return [(CPSDeveloperOverride *)self->_model valueForSpecifier:a3];
}

- (void)setModelValue:(id)a3 forSpecifier:(id)a4
{
  [(CPSDeveloperOverride *)self->_model setValue:a3 forSpecifier:a4];

  [(CPSURLOverrideDetailsController *)self updateSaveItem];
}

- (void)_anyTextFieldDidUpdate:(id)a3
{
  v4 = [a3 object];
  id v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = self;
    uint64_t v8 = sub_553C(v4, (uint64_t)v7);

    if (v8)
    {
      v23[0] = @"URL_OVERRIDE";
      v23[1] = @"URL_OVERRIDE_CLIP_BUNDLE_ID";
      v23[2] = @"ABR_TITLE";
      v23[3] = @"ABR_SUBTITLE";
      +[NSArray arrayWithObjects:v23 count:4];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            v15 = -[CPSURLOverrideDetailsController cachedCellForSpecifierID:](self, "cachedCellForSpecifierID:", v14, (void)v18);

            if (v15 == v8)
            {
              v16 = [v4 text];
              v17 = [(CPSURLOverrideDetailsController *)self specifierForID:v14];
              [(CPSURLOverrideDetailsController *)self setModelValue:v16 forSpecifier:v17];

              goto LABEL_13;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }
}

- (void)updateSaveItem
{
  id v3 = [(CPSDeveloperOverride *)self->_model isComplete];
  saveItem = self->_saveItem;

  [(UIBarButtonItem *)saveItem setEnabled:v3];
}

- (void)updateHeroImageSpecifier
{
  if ([(CPSDeveloperOverride *)self->_model heroImage])
  {
    id v3 = [(CPSURLOverrideDetailsController *)self specifiers];
    id v5 = [v3 specifierForID:@"CardPreviewSpecifier"];

    if (v5)
    {
      [(CPSURLOverrideDetailsController *)self reloadSpecifier:v5];
    }
    else
    {
      id v4 = [(CPSURLOverrideDetailsController *)self indexOfSpecifierID:@"ABR_HERO_IMAGE"];
      id v5 = +[CPSCardPreviewTableViewCell specifierForOverride:self->_model];
      [v5 setIdentifier:@"CardPreviewSpecifier"];
      [(CPSURLOverrideDetailsController *)self insertSpecifier:v5 atIndex:v4];
    }
  }
}

- (void)chooseImage:(id)a3
{
  id v6 = objc_alloc_init((Class)PHPickerConfiguration);
  id v4 = +[PHPickerFilter imagesFilter];
  [v6 setFilter:v4];

  id v5 = [objc_alloc((Class)PHPickerViewController) initWithConfiguration:v6];
  [v5 setDelegate:self];
  [(CPSURLOverrideDetailsController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)removeOverride:(id)a3
{
  [(CPSDeveloperOverride *)self->_model clear];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifiers];
  id v4 = [(CPSURLOverrideDetailsController *)self navigationController];
  id v5 = [v4 popViewControllerAnimated:1];

  SFKillProcessNamed();
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6 = a4;
  [a3 dismissViewControllerAnimated:1 completion:0];
  v7 = [v6 firstObject];

  uint64_t v8 = [v7 itemProvider];

  id v9 = self;
  LODWORD(v7) = [v8 canLoadObjectOfClass:v9];

  if (v7)
  {
    id v10 = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_596C;
    v12[3] = &unk_30ED8;
    v12[4] = self;
    id v11 = [v8 loadObjectOfClass:v10 completionHandler:v12];
  }
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_saveItem, 0);
  objc_storeStrong((id *)&self->_cancelItem, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end