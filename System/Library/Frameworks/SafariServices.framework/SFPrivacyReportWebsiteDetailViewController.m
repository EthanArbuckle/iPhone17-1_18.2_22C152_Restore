@interface SFPrivacyReportWebsiteDetailViewController
- (BOOL)separatesBlockedTrackers;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (SFPrivacyReportWebsiteDetailViewController)initWithWebsite:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_loadSections;
- (void)setSeparatesBlockedTrackers:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SFPrivacyReportWebsiteDetailViewController

- (SFPrivacyReportWebsiteDetailViewController)initWithWebsite:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFPrivacyReportWebsiteDetailViewController;
  v6 = [(SFPrivacyReportWebsiteDetailViewController *)&v10 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_website, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SFPrivacyReportWebsiteDetailViewController;
  [(SFPrivacyReportWebsiteDetailViewController *)&v6 viewDidLoad];
  v3 = [(WBSTrackedFirstParty *)self->_website domain];
  [(SFPrivacyReportWebsiteDetailViewController *)self setTitle:v3];

  v4 = [(SFPrivacyReportWebsiteDetailViewController *)self tableView];
  double v5 = *MEMORY[0x1E4FB2F28];
  [v4 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v4 setSectionHeaderHeight:v5];
  [(SFPrivacyReportWebsiteDetailViewController *)self _loadSections];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  double v5 = [v4 trackers];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"trackerCellIdentifier"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"trackerCellIdentifier"];
  }
  v8 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v6 section]);
  v9 = [v8 trackers];
  uint64_t v10 = [v6 row];

  v11 = [v9 objectAtIndexedSubscript:v10];

  v12 = [v11 domain];
  v13 = [v7 textLabel];
  [v13 setText:v12];

  v14 = [v7 detailTextLabel];
  [v14 setNumberOfLines:0];
  v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v14 setTextColor:v15];

  v16 = [v11 ownerName];
  [v14 setText:v16];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  double v5 = [v4 title];

  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)_loadSections
{
  id v13 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(WBSTrackedFirstParty *)self->_website blockedTrackers];
  v4 = v3;
  if (!self->_separatesBlockedTrackers) {
    goto LABEL_6;
  }
  if ([v3 count])
  {
    double v5 = _WBSLocalizedString();
    id v6 = [[SFPrivacyReportWebsiteDetailSection alloc] initWithTitle:v5 trackers:v4];
    [v13 addObject:v6];
  }
  if (self->_separatesBlockedTrackers)
  {
    v7 = [(WBSTrackedFirstParty *)self->_website preventedTrackers];
  }
  else
  {
LABEL_6:
    v7 = [(WBSTrackedFirstParty *)self->_website trackers];
  }
  v8 = v7;
  if ([v7 count])
  {
    v9 = _WBSLocalizedString();
    uint64_t v10 = [[SFPrivacyReportWebsiteDetailSection alloc] initWithTitle:v9 trackers:v8];
    [v13 addObject:v10];
  }
  v11 = (NSArray *)[v13 copy];
  sections = self->_sections;
  self->_sections = v11;
}

- (BOOL)separatesBlockedTrackers
{
  return self->_separatesBlockedTrackers;
}

- (void)setSeparatesBlockedTrackers:(BOOL)a3
{
  self->_separatesBlockedTrackers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_website, 0);
}

@end