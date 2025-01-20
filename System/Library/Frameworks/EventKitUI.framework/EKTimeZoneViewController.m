@interface EKTimeZoneViewController
- (CGSize)preferredContentSize;
- (EKTimeZoneViewController)initWithChooserStyle:(int)a3;
- (EKTimeZoneViewControllerDelegate)delegate;
- (NSArray)cities;
- (NSTimeZone)timeZone;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)chooserStyle;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCities:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
@end

@implementation EKTimeZoneViewController

- (EKTimeZoneViewController)initWithChooserStyle:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKTimeZoneViewController;
  v4 = [(EKTimeZoneViewController *)&v8 initWithStyle:0];
  if (v4)
  {
    v5 = EventKitUIBundle();
    v6 = [v5 localizedStringForKey:@"Time Zone" value:&stru_1F0CC2140 table:0];
    [(EKTimeZoneViewController *)v4 setTitle:v6];

    v4->_style = a3;
  }
  return v4;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)EKTimeZoneViewController;
  [(EKTimeZoneViewController *)&v18 viewDidLoad];
  v3 = [(EKTimeZoneViewController *)[EKTimeZoneSearchResultsController alloc] initWithChooserStyle:[(EKTimeZoneViewController *)self chooserStyle]];
  v4 = [(EKTimeZoneViewController *)self delegate];
  [(EKTimeZoneViewController *)v3 setDelegate:v4];

  v5 = [(EKTimeZoneViewController *)self timeZone];
  [(EKTimeZoneViewController *)v3 setTimeZone:v5];

  v6 = (UISearchController *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:v3];
  searchController = self->_searchController;
  self->_searchController = v6;

  [(UISearchController *)self->_searchController setSearchResultsUpdater:v3];
  objc_super v8 = [(EKTimeZoneViewController *)self navigationItem];
  [v8 setPreferredSearchBarPlacement:2];

  v9 = self->_searchController;
  v10 = [(EKTimeZoneViewController *)self navigationItem];
  [v10 setSearchController:v9];

  v11 = [(EKTimeZoneViewController *)self navigationItem];
  [v11 setHidesSearchBarWhenScrolling:0];

  v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v12 lineHeight];
  double v14 = v13;
  v15 = [(EKTimeZoneViewController *)self tableView];
  [v15 setEstimatedRowHeight:v14];

  double v16 = *MEMORY[0x1E4FB2F28];
  v17 = [(EKTimeZoneViewController *)self tableView];
  [v17 setRowHeight:v16];

  [(EKTimeZoneViewController *)self setDefinesPresentationContext:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)EKTimeZoneViewController;
  [(EKTimeZoneViewController *)&v11 viewWillAppear:a3];
  timeZone = self->_timeZone;
  if (timeZone)
  {
    v5 = [(NSTimeZone *)timeZone cityName];
    v6 = [(UISearchController *)self->_searchController searchBar];
    [v6 setText:v5];

    v7 = [MEMORY[0x1E4F4BE38] sharedManager];
    objc_super v8 = [v7 citiesMatchingName:v5];
    cities = self->_cities;
    self->_cities = v8;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4BE38] sharedManager];
    v10 = [v5 allCities];
    v7 = self->_cities;
    self->_cities = v10;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(EKTimeZoneViewController *)self view];
  if (!EKUICurrentHeightSizeClassIsRegular(v5)) {
    goto LABEL_6;
  }
  v6 = [(EKTimeZoneViewController *)self view];
  if (!EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v6))
  {

LABEL_6:
    goto LABEL_7;
  }
  BOOL v7 = [(UIViewController *)self isPresentedInsidePopover];

  if (!v7)
  {
    [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
    [(UISearchController *)self->_searchController setHidesNavigationBarDuringPresentation:0];
  }
LABEL_7:
  v8.receiver = self;
  v8.super_class = (Class)EKTimeZoneViewController;
  [(EKTimeZoneViewController *)&v8 viewDidAppear:v3];
}

- (CGSize)preferredContentSize
{
  double v2 = EKUIContainedControllerIdealWidth();
  double v3 = 600.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_cities count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"TimeZone"];
  cities = self->_cities;
  uint64_t v8 = [v5 row];

  v9 = [(NSArray *)cities objectAtIndexedSubscript:v8];
  v10 = [v9 displayNameIncludingCountry:1];
  objc_super v11 = [(EKUITableViewCell *)v6 textLabel];
  [v11 setText:v10];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSArray objectAtIndexedSubscript:](self->_cities, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x1E4F1CAF0];
    BOOL v7 = [v11 timeZone];
    uint64_t v8 = [v6 timeZoneWithName:v7];

    v9 = [v11 name];
    [v8 setCityName:v9];

    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 timeZoneViewController:self didSelectTimeZone:v8];
  }
}

- (void)willDismissSearchController:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F4BE38], "sharedManager", a3);
  id v5 = [v4 allCities];
  cities = self->_cities;
  self->_cities = v5;

  id v7 = [(EKTimeZoneViewController *)self tableView];
  [v7 reloadData];
}

- (EKTimeZoneViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKTimeZoneViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (int)chooserStyle
{
  return self->_chooserStyle;
}

- (NSArray)cities
{
  return self->_cities;
}

- (void)setCities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cities, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end