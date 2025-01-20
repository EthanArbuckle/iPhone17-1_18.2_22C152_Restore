@interface MCSignInPageTitleSectionController
- (NSString)orgName;
- (double)heightForHeader;
- (id)cellForRowAtIndex:(unint64_t)a3;
- (unint64_t)numberOfRows;
- (void)setOrgName:(id)a3;
@end

@implementation MCSignInPageTitleSectionController

- (unint64_t)numberOfRows
{
  return 2;
}

- (double)heightForHeader
{
  return 55.0;
}

- (id)cellForRowAtIndex:(unint64_t)a3
{
  if (a3 == 1)
  {
    v8 = NSString;
    v9 = MCUILocalizedString(@"SIGN_IN_TO_%@");
    v10 = [(MCSignInPageTitleSectionController *)self orgName];
    v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);
    v12 = [(MCProfileTitlePageMetaDataSectionController *)self subtitleCell];
    v13 = [v12 titleLabel];
    [v13 setText:v11];

    v7 = [(MCProfileTitlePageMetaDataSectionController *)self subtitleCell];
  }
  else if (a3)
  {
    v7 = 0;
  }
  else
  {
    v4 = MCUILocalizedString(@"SIGN_IN");
    v5 = [(MCProfileTitlePageMetaDataSectionController *)self titleCell];
    v6 = [v5 titleLabel];
    [v6 setText:v4];

    v7 = [(MCProfileTitlePageMetaDataSectionController *)self titleCell];
  }
  return v7;
}

- (NSString)orgName
{
  return self->_orgName;
}

- (void)setOrgName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end