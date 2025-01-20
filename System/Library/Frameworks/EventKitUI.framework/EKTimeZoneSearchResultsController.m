@interface EKTimeZoneSearchResultsController
- (void)updateSearchResultsForSearchController:(id)a3;
@end

@implementation EKTimeZoneSearchResultsController

- (void)updateSearchResultsForSearchController:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4BE38];
  id v5 = a3;
  v6 = [v4 sharedManager];
  v7 = [v5 searchBar];

  v8 = [v7 text];
  v9 = [v6 citiesMatchingName:v8];
  [(EKTimeZoneViewController *)self setCities:v9];

  v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v10 lineHeight];
  double v12 = v11;
  v13 = [(EKTimeZoneSearchResultsController *)self tableView];
  [v13 setEstimatedRowHeight:v12];

  double v14 = *MEMORY[0x1E4FB2F28];
  v15 = [(EKTimeZoneSearchResultsController *)self tableView];
  [v15 setRowHeight:v14];

  id v16 = [(EKTimeZoneSearchResultsController *)self tableView];
  [v16 reloadData];
}

@end