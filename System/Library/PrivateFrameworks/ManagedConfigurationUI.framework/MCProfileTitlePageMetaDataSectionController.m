@interface MCProfileTitlePageMetaDataSectionController
- (MCProfile)profile;
- (MCProfileTitlePageMetaDataSectionController)initWithProfile:(id)a3;
- (MCProfileTitlePageOrganizationCell)orgCell;
- (MCProfileTitlePageSettingsIconCell)iconCell;
- (MCProfileTitlePageSubtitleCell)subtitleCell;
- (MCProfileTitlePageTitleCell)titleCell;
- (UITableView)tableView;
- (double)heightForHeader;
- (double)heightForRowAtIndex:(unint64_t)a3;
- (id)cellForRowAtIndex:(unint64_t)a3;
- (id)titleForHeader;
- (unint64_t)numberOfRows;
- (void)registerCellClassWithTableView:(id)a3;
- (void)setIconCell:(id)a3;
- (void)setOrgCell:(id)a3;
- (void)setProfile:(id)a3;
- (void)setSubtitleCell:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitleCell:(id)a3;
@end

@implementation MCProfileTitlePageMetaDataSectionController

- (MCProfileTitlePageMetaDataSectionController)initWithProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCProfileTitlePageMetaDataSectionController;
  v6 = [(MCProfileTitlePageMetaDataSectionController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_profile, a3);
  }

  return v7;
}

- (void)registerCellClassWithTableView:(id)a3
{
  id v4 = a3;
  [(MCProfileTitlePageMetaDataSectionController *)self setTableView:v4];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"iconCell"];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"titleCell"];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"subtitleCell"];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"organizationCell"];
}

- (id)cellForRowAtIndex:(unint64_t)a3
{
  if (a3 == 2)
  {
    v8 = [(MCProfileTitlePageMetaDataSectionController *)self profile];
    objc_super v9 = [v8 organization];
    v10 = [(MCProfileTitlePageMetaDataSectionController *)self orgCell];
    [v10 setOrganizationName:v9];

    v11 = [(MCProfileTitlePageMetaDataSectionController *)self profile];
    v12 = [v11 payloadsWithClass:objc_opt_class()];
    v13 = [v12 firstObject];
    v14 = [v13 managedAppleID];
    v15 = [(MCProfileTitlePageMetaDataSectionController *)self orgCell];
    [v15 setAppleID:v14];

    v7 = [(MCProfileTitlePageMetaDataSectionController *)self orgCell];
  }
  else if (a3 == 1)
  {
    v16 = MCUILocalizedString(@"USER_ENROLLMENT_DESCRIPTION");
    v17 = [(MCProfileTitlePageMetaDataSectionController *)self subtitleCell];
    v18 = [v17 titleLabel];
    [v18 setText:v16];

    v7 = [(MCProfileTitlePageMetaDataSectionController *)self subtitleCell];
  }
  else if (a3)
  {
    v7 = 0;
  }
  else
  {
    id v4 = MCUILocalizedString(@"USER_ENROLLMENT");
    id v5 = [(MCProfileTitlePageMetaDataSectionController *)self titleCell];
    v6 = [v5 titleLabel];
    [v6 setText:v4];

    v7 = [(MCProfileTitlePageMetaDataSectionController *)self titleCell];
  }
  return v7;
}

- (id)titleForHeader
{
  return 0;
}

- (double)heightForHeader
{
  return 55.0;
}

- (double)heightForRowAtIndex:(unint64_t)a3
{
  if (a3 == 2) {
    return 75.0;
  }
  if (a3 == 1) {
    return *MEMORY[0x1E4F43D18];
  }
  if (a3) {
    return 0.0;
  }
  int v3 = MCUIIsiPhone();
  double result = 46.0;
  if (v3) {
    return 50.0;
  }
  return result;
}

- (unint64_t)numberOfRows
{
  return 3;
}

- (MCProfileTitlePageSettingsIconCell)iconCell
{
  iconCell = self->_iconCell;
  if (!iconCell)
  {
    id v4 = (MCProfileTitlePageSettingsIconCell *)objc_opt_new();
    id v5 = self->_iconCell;
    self->_iconCell = v4;

    iconCell = self->_iconCell;
  }
  return iconCell;
}

- (MCProfileTitlePageTitleCell)titleCell
{
  titleCell = self->_titleCell;
  if (!titleCell)
  {
    id v4 = (MCProfileTitlePageTitleCell *)objc_opt_new();
    id v5 = self->_titleCell;
    self->_titleCell = v4;

    titleCell = self->_titleCell;
  }
  return titleCell;
}

- (MCProfileTitlePageSubtitleCell)subtitleCell
{
  subtitleCell = self->_subtitleCell;
  if (!subtitleCell)
  {
    id v4 = (MCProfileTitlePageSubtitleCell *)objc_opt_new();
    id v5 = self->_subtitleCell;
    self->_subtitleCell = v4;

    subtitleCell = self->_subtitleCell;
  }
  return subtitleCell;
}

- (MCProfileTitlePageOrganizationCell)orgCell
{
  orgCell = self->_orgCell;
  if (!orgCell)
  {
    id v4 = (MCProfileTitlePageOrganizationCell *)objc_opt_new();
    id v5 = self->_orgCell;
    self->_orgCell = v4;

    orgCell = self->_orgCell;
  }
  return orgCell;
}

- (void)setIconCell:(id)a3
{
}

- (void)setTitleCell:(id)a3
{
}

- (void)setSubtitleCell:(id)a3
{
}

- (void)setOrgCell:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (MCProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_orgCell, 0);
  objc_storeStrong((id *)&self->_subtitleCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_iconCell, 0);
}

@end