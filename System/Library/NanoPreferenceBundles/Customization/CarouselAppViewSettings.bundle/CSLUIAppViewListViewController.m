@interface CSLUIAppViewListViewController
- (CSLPRFLauncherViewModeSetting)setting;
- (CSLUIAppViewListViewController)init;
- (double)choiceViewPreferredHeight;
- (id)_appLayoutSpecifiers;
- (id)_appViewSpecifiers;
- (id)specifiers;
- (void)setChoiceViewPreferredHeight:(double)a3;
- (void)setSetting:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CSLUIAppViewListViewController

- (CSLUIAppViewListViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)CSLUIAppViewListViewController;
  v2 = [(CSLUIAppViewListViewController *)&v11 init];
  if (v2)
  {
    v3 = +[NRPairedDeviceRegistry sharedInstance];
    v4 = [v3 getActivePairedDevice];

    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6E76AC51-634C-415F-8491-C6784AF2C471"];
    v2->_supportsSilverAppView = [v4 supportsCapability:v5];

    v6 = (CSLPRFLauncherViewModeSetting *)objc_alloc_init((Class)CSLPRFLauncherViewModeSetting);
    setting = v2->_setting;
    v2->_setting = v6;

    id v8 = [objc_alloc((Class)CSLPRFAppViewChoiceCell) initWithStyle:0 reuseIdentifier:0];
    [v8 sizeToFit];
    objc_msgSend(v8, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    v2->_choiceViewPreferredHeight = v9;
    [(CSLPRFLauncherViewModeSetting *)v2->_setting setDelegate:v2];
  }
  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CSLUIAppViewListViewController;
  [(CSLUIAppViewListViewController *)&v4 viewDidLoad];
  if (self->_supportsSilverAppView)
  {
    v3 = [(CSLUIAppViewListViewController *)self table];
    [v3 setSeparatorStyle:0];
  }
}

- (id)specifiers
{
  if (self->_supportsSilverAppView) {
    [(CSLUIAppViewListViewController *)self _appViewSpecifiers];
  }
  else {
  v2 = [(CSLUIAppViewListViewController *)self _appLayoutSpecifiers];
  }

  return v2;
}

- (id)_appViewSpecifiers
{
  v3 = [(CSLUIAppViewListViewController *)self loadSpecifiersFromPlistName:@"CarouselAppViewChoice" target:self];
  objc_super v4 = [v3 specifierForID:@"APP_VIEW_HEADER_GROUP_ID"];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BRIDGE_APP_VIEW_HEADER_TEXT" value:&stru_3D1C0 table:@"CarouselAppViewChoice"];

  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];
  v7 = [v3 specifierForID:@"APP_VIEW_CHOICE_ID"];
  [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v8 = +[NSNumber numberWithDouble:self->_choiceViewPreferredHeight];
  [v7 setProperty:v8 forKey:PSTableCellHeightKey];

  if ([(CSLPRFLauncherViewModeSetting *)self->_setting launcherViewMode] == (char *)&def_1AB14 + 2) {
    objc_msgSend(v3, "removeObjectsInRange:", objc_msgSend(v3, "indexOfSpecifierWithID:", @"APP_ARRANGEMENT_GROUP_ID"), 2);
  }
  id v9 = [v3 copy];
  uint64_t v10 = OBJC_IVAR___PSListController__specifiers;
  objc_super v11 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v9;

  id v12 = *(id *)&self->PSListController_opaque[v10];
  return v12;
}

- (id)_appLayoutSpecifiers
{
  v3 = [(CSLUIAppViewListViewController *)self loadSpecifiersFromPlistName:@"CarouselLayoutSettings" target:self];
  objc_super v4 = [v3 specifierForID:@"APP_LAYOUT_GROUP_ID"];
  if ([(CSLPRFLauncherViewModeSetting *)self->_setting launcherViewMode] == (char *)&def_1AB14 + 2)
  {
    objc_msgSend(v3, "removeObjectsInRange:", objc_msgSend(v3, "indexOfSpecifierWithID:", @"APP_ARRANGEMENT_GROUP_ID"), 2);
    CFStringRef v5 = @"APP_LIST_VIEW_ID";
  }
  else
  {
    CFStringRef v5 = @"APP_GRID_VIEW_ID";
  }
  v6 = [v3 specifierForID:v5];
  [v4 setProperty:v6 forKey:PSRadioGroupCheckedSpecifierKey];
  id v7 = [v3 copy];
  uint64_t v8 = OBJC_IVAR___PSListController__specifiers;
  id v9 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v7;

  id v10 = *(id *)&self->PSListController_opaque[v8];
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_supportsSilverAppView)
  {
    uint64_t v8 = OBJC_IVAR___PSListController__specifiers;
    id v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] specifierForID:@"APP_LAYOUT_GROUP_ID"];
    id v10 = objc_msgSend(*(id *)&self->PSListController_opaque[v8], "objectAtIndex:", -[CSLUIAppViewListViewController indexForIndexPath:](self, "indexForIndexPath:", v7));
    objc_super v11 = cslprf_dock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v10 identifier];
      *(_DWORD *)buf = 138412546;
      v21 = v12;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl(&def_1AB14, v11, OS_LOG_TYPE_DEFAULT, "%@ selected, layoutRadioGroup = %@", buf, 0x16u);
    }
    v13 = [v10 identifier];
    unsigned __int8 v14 = [v13 isEqualToString:@"APP_GRID_VIEW_ID"];

    if (v14)
    {
      uint64_t v15 = 1;
    }
    else
    {
      v16 = [v10 identifier];
      unsigned __int8 v17 = [v16 isEqualToString:@"APP_LIST_VIEW_ID"];

      if ((v17 & 1) == 0)
      {
        v18.receiver = self;
        v18.super_class = (Class)CSLUIAppViewListViewController;
        [(CSLUIAppViewListViewController *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
        goto LABEL_11;
      }
      uint64_t v15 = 2;
    }
    [(CSLPRFLauncherViewModeSetting *)self->_setting setLauncherViewMode:v15 reason:2];
    [v9 setProperty:v10 forKey:PSRadioGroupCheckedSpecifierKey];
    v18.receiver = self;
    v18.super_class = (Class)CSLUIAppViewListViewController;
    [(CSLUIAppViewListViewController *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
    [(CSLUIAppViewListViewController *)self reloadSpecifiers];
LABEL_11:

    goto LABEL_12;
  }
  v19.receiver = self;
  v19.super_class = (Class)CSLUIAppViewListViewController;
  [(CSLUIAppViewListViewController *)&v19 tableView:v6 didSelectRowAtIndexPath:v7];
LABEL_12:
}

- (CSLPRFLauncherViewModeSetting)setting
{
  return self->_setting;
}

- (void)setSetting:(id)a3
{
}

- (double)choiceViewPreferredHeight
{
  return self->_choiceViewPreferredHeight;
}

- (void)setChoiceViewPreferredHeight:(double)a3
{
  self->_choiceViewPreferredHeight = a3;
}

- (void).cxx_destruct
{
}

@end