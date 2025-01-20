@interface CLSActivityItem
- (id)generateReportFromDataInDatabase:(id)a3;
- (void)_populateReportItem:(id)a3;
@end

@implementation CLSActivityItem

- (id)generateReportFromDataInDatabase:(id)a3
{
  return 0;
}

- (void)_populateReportItem:(id)a3
{
  id v4 = a3;
  v5 = [(CLSActivityItem *)self title];
  [v4 setTitle:v5];

  id v6 = [(CLSActivityItem *)self identifier];
  [v4 setIdentifier:v6];
}

@end