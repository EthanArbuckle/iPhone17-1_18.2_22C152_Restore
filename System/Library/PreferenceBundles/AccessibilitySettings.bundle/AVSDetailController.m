@interface AVSDetailController
- (AVSDetailController)initWithIdentifier:(id)a3 title:(id)a4 withCompletion:(id)a5;
- (NSString)identifier;
- (id)completion;
- (id)specifiers;
- (void)_removeButtonTapped:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AVSDetailController

- (AVSDetailController)initWithIdentifier:(id)a3 title:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AVSDetailController;
  v11 = [(AVSDetailController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v13 = [(AVSDetailController *)v11 navigationItem];
    [v13 setTitle:v9];

    [(AVSDetailController *)v12 setIdentifier:v8];
    [(AVSDetailController *)v12 setCompletion:v10];
    v14 = v12;
  }

  return v12;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = settingsLocString(@"AVS_REMOVE", @"Accessibility");
    v7 = +[PSSpecifier deleteButtonSpecifierWithName:v6 target:self action:"_removeButtonTapped:"];

    [v7 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v5 addObject:v7];
    id v8 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)_removeButtonTapped:(id)a3
{
  id v6 = objc_alloc_init((Class)AVSStore);
  [v6 deleteShortcutWithIdentifier:self->_identifier];
  v4 = [(AVSDetailController *)self navigationController];
  id v5 = [v4 popViewControllerAnimated:1];

  (*((void (**)(void))self->_completion + 2))();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end