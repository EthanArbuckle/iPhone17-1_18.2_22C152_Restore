@interface WDUninstalledAppSourcesViewController
- (HKSourceListDataSource)dataSource;
- (NSArray)uninstalledSources;
- (UIImage)uninistalledAppImage;
- (WDProfile)profile;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)setDataSource:(id)a3;
- (void)setProfile:(id)a3;
- (void)setUninstalledSources:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateUninstalledSources;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDUninstalledAppSourcesViewController

- (void)dealloc
{
  [(HKSourceListDataSource *)self->_dataSource unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)WDUninstalledAppSourcesViewController;
  [(WDUninstalledAppSourcesViewController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDUninstalledAppSourcesViewController;
  [(WDUninstalledAppSourcesViewController *)&v4 viewWillAppear:a3];
  [(WDUninstalledAppSourcesViewController *)self updateUninstalledSources];
}

- (void)setDataSource:(id)a3
{
  v5 = (HKSourceListDataSource *)a3;
  dataSource = self->_dataSource;
  v7 = v5;
  if (dataSource != v5)
  {
    [(HKSourceListDataSource *)dataSource unregisterObserver:self];
    objc_storeStrong((id *)&self->_dataSource, a3);
    [(HKSourceListDataSource *)v7 registerObserver:self];
  }
}

- (UIImage)uninistalledAppImage
{
  if (uninistalledAppImage_onceToken != -1) {
    dispatch_once(&uninistalledAppImage_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)uninistalledAppImage_uninistalledAppImage;

  return (UIImage *)v2;
}

void __61__WDUninstalledAppSourcesViewController_uninistalledAppImage__block_invoke()
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  id v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  uint64_t v1 = objc_msgSend(v0, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.health.i.dont.exist", 0);
  v2 = (void *)uninistalledAppImage_uninistalledAppImage;
  uninistalledAppImage_uninistalledAppImage = v1;
}

- (void)updateUninstalledSources
{
  id v3 = [(WDUninstalledAppSourcesViewController *)self dataSource];
  objc_super v4 = [v3 sources];

  if (v4)
  {
    v5 = [(WDUninstalledAppSourcesViewController *)self dataSource];
    v6 = [v5 sources];
    id v12 = [v6 orderedUninstalledAppSources];

    v7 = [(WDUninstalledAppSourcesViewController *)self profile];
    v8 = [v7 presentationContext];

    if (v8 == @"SettingsPrivacy")
    {
      v9 = [(WDUninstalledAppSourcesViewController *)self dataSource];
      v10 = [v9 fetchFilteredSourcesWithAuthorizationRecordsForSources:v12];
      [(WDUninstalledAppSourcesViewController *)self setUninstalledSources:v10];
    }
    else
    {
      [(WDUninstalledAppSourcesViewController *)self setUninstalledSources:v12];
    }
    v11 = [(WDUninstalledAppSourcesViewController *)self tableView];
    [v11 reloadData];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(WDUninstalledAppSourcesViewController *)self uninstalledSources];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"WDUninstalledAppSourcesViewCell"];
  if (!v7)
  {
    v7 = [[WDSourcesListTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"WDUninstalledAppSourcesViewCell"];
    [(WDSourcesListTableViewCell *)v7 setAccessoryType:1];
  }
  v8 = [(WDUninstalledAppSourcesViewController *)self uninstalledSources];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];
  [(WDSourcesListTableViewCell *)v7 setSourceModel:v10];

  v11 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  id v12 = [(WDSourcesListTableViewCell *)v7 textLabel];
  [v12 setFont:v11];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 row];
  v7 = [(WDUninstalledAppSourcesViewController *)self uninstalledSources];
  unint64_t v8 = [v7 count] - 1;

  if (v6 <= v8)
  {
    v10 = objc_alloc_init(WDSourceStoredDataViewController);
    v11 = [(WDUninstalledAppSourcesViewController *)self uninstalledSources];
    id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v13 = [v12 source];
    [(WDSourceStoredDataViewController *)v10 setSource:v13];

    v14 = [(WDUninstalledAppSourcesViewController *)self profile];
    [(WDStoredDataByCategoryViewController *)v10 setProfile:v14];

    v15 = [(WDUninstalledAppSourcesViewController *)self navigationController];
    [v15 pushViewController:v10 animated:1];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_FAULT)) {
      -[WDUninstalledAppSourcesViewController tableView:didSelectRowAtIndexPath:](v9, self);
    }
  }
}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (HKSourceListDataSource)dataSource
{
  return self->_dataSource;
}

- (NSArray)uninstalledSources
{
  return self->_uninstalledSources;
}

- (void)setUninstalledSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uninstalledSources, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  objc_super v4 = [a2 uninstalledSources];
  int v5 = 134217984;
  uint64_t v6 = [v4 count];
  _os_log_fault_impl(&dword_2210D2000, v3, OS_LOG_TYPE_FAULT, "The count of uninstalledSources in WDUninstalledAppSourcesViewController is unexpectedly %lu", (uint8_t *)&v5, 0xCu);
}

@end