@interface AAUIDataclassDetailViewController
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_initSpecifiers;
- (void)cleanupDataclassSpecifiers;
- (void)setAccountManager:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AAUIDataclassDetailViewController

- (void)setAccountManager:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIDataclassDetailViewController;
  [(AAUIDataclassViewController *)&v7 setAccountManager:a3];
  v4 = [(AAUIDataclassDetailViewController *)self specifier];
  v5 = [v4 objectForKeyedSubscript:PSIDKey];
  dataclass = self->_dataclass;
  self->_dataclass = v5;

  [(AAUIDataclassDetailViewController *)self _initSpecifiers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AAUIDataclassDetailViewController;
  [(AAUIDataclassDetailViewController *)&v9 viewWillAppear:a3];
  v4 = [(AAUIDataclassDetailViewController *)self specifier];
  v5 = [v4 name];

  if (v5)
  {
    v6 = [(AAUIDataclassDetailViewController *)self specifier];
    objc_super v7 = [v6 name];
    v8 = [(AAUIDataclassDetailViewController *)self navigationItem];
    [v8 setTitle:v7];
  }
}

- (void)_initSpecifiers
{
  v3 = [AAUIDataclassDetailSpecifierProvider alloc];
  v4 = [(AAUIDataclassViewController *)self accountManager];
  v5 = [(AAUIDataclassDetailSpecifierProvider *)v3 initWithAccountManager:v4 presenter:self];
  specifierProvider = self->_specifierProvider;
  self->_specifierProvider = v5;

  [(AAUIDataclassDetailSpecifierProvider *)self->_specifierProvider setDelegate:self];
  dataclass = self->_dataclass;
  v8 = self->_specifierProvider;

  [(AAUIDataclassDetailSpecifierProvider *)v8 setDataclass:dataclass];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    v4 = [(AAUIDataclassDetailSpecifierProvider *)self->_specifierProvider specifiers];
    id v5 = [v4 count];

    if (v5)
    {
      v6 = [(AAUIDataclassDetailSpecifierProvider *)self->_specifierProvider specifiers];
      uint64_t v7 = +[NSArray arrayWithArray:v6];
      v8 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[v3];
      *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[v3] = v7;
    }
  }
  objc_super v9 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[v3];

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AAUIDataclassDetailViewController;
  v4 = [(AAUIDataclassDetailViewController *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = [v4 specifier];
  v6 = [v5 propertyForKey:PSControlIsLoadingKey];
  unsigned int v7 = [v6 BOOLValue];

  if (v7)
  {
    v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_4861C(v5, v8);
    }

    id v9 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v9 startAnimating];
    [v4 setAccessoryView:v9];
  }

  return v4;
}

- (void)cleanupDataclassSpecifiers
{
  [(AAUIDataclassDetailSpecifierProvider *)self->_specifierProvider setSpecifiers:0];
  uint64_t v3 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclass, 0);

  objc_storeStrong((id *)&self->_specifierProvider, 0);
}

@end