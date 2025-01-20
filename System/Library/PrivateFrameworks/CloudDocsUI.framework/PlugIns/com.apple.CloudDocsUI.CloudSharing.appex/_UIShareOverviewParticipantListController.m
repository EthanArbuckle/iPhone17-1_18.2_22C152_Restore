@interface _UIShareOverviewParticipantListController
- (BOOL)_isOrgAdminParticipant:(id)a3;
- (BOOL)doNotDisturb;
- (BOOL)showParticipantEdits;
- (BRShareSettings)settings;
- (CKShareParticipantArrayController)participantArrayController;
- (NSOrderedSet)modelSnapshot;
- (UITableView)staticTableView;
- (_UIShareOverviewActionController)addPeopleViewController;
- (_UIShareOverviewParticipantListController)initWithDelegate:(id)a3;
- (_UIShareTableStaticDataSource)staticTableDataSource;
- (id)_documentsApplicationProxy;
- (id)_sections;
- (id)settingsSectionWithText:(id)a3;
- (id)viewControllerItemURL:(id)a3;
- (id)viewControllerShare:(id)a3;
- (unint64_t)participantInfoViewControllerAllowedPermissions:(id)a3;
- (void)_dismissAddPeople:(id)a3;
- (void)_updateOverrideTraitsForModallyPresentedAddPeopleController;
- (void)addPeople:(id)a3;
- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5;
- (void)copyLink:(id)a3;
- (void)dealloc;
- (void)leaveShare:(id)a3;
- (void)participantInfoViewControllerDidChangeParticipant:(id)a3;
- (void)participantInfoViewControllerLeaveShare:(id)a3;
- (void)participantInfoViewControllerRemoveParticipant:(id)a3;
- (void)presentReachabilityViewController:(id)a3 animated:(BOOL)a4;
- (void)removeParticipant:(id)a3;
- (void)sendLink:(id)a3;
- (void)setAddPeopleViewController:(id)a3;
- (void)setDoNotDisturb:(BOOL)a3;
- (void)setModelSnapshot:(id)a3;
- (void)setParticipantArrayController:(id)a3;
- (void)setSettings:(id)a3;
- (void)setShowParticipantEdits:(BOOL)a3;
- (void)setStaticTableDataSource:(id)a3;
- (void)setStaticTableView:(id)a3;
- (void)settingsControllerDidChange:(id)a3 changedAllowInviters:(BOOL)a4;
- (void)shareDidChange;
- (void)showParticipantInfo:(id)a3;
- (void)showSettings:(id)a3;
- (void)showSettingsAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)showSharedFolder:(id)a3;
- (void)stopSharing:(id)a3;
- (void)togglePrimarySwitch:(id)a3;
- (void)toggleSecondarySwitch:(id)a3;
- (void)updateSections;
- (void)updateThumbnail;
- (void)willNavigateFromViewController:(id)a3;
@end

@implementation _UIShareOverviewParticipantListController

- (_UIShareOverviewParticipantListController)initWithDelegate:(id)a3
{
  v41.receiver = self;
  v41.super_class = (Class)_UIShareOverviewParticipantListController;
  v3 = [(_UIShareOverviewController *)&v41 initWithDelegate:a3];
  if (v3)
  {
    v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v5 = [v4 localizedStringForKey:@"POST_SHARE_LIST_TITLE_BACK_BUTTON_TEXT" value:@"People" table:@"Localizable"];
    v6 = [(_UIShareOverviewParticipantListController *)v3 navigationItem];
    [v6 setBackButtonTitle:v5];

    if ((_UIBarsApplyChromelessEverywhere() & 1) == 0) {
      [(_UIShareOverviewParticipantListController *)v3 setEdgesForExtendedLayout:0];
    }
    id v7 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(_UIShareOverviewParticipantListController *)v3 setStaticTableView:v7];

    v8 = [(_UIShareOverviewParticipantListController *)v3 staticTableView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(_UIShareOverviewParticipantListController *)v3 staticTableView];
    [v9 setRowHeight:UITableViewAutomaticDimension];

    v10 = [(_UIShareOverviewParticipantListController *)v3 staticTableView];
    [v10 setEstimatedRowHeight:56.0];

    v11 = [(_UIShareOverviewParticipantListController *)v3 staticTableView];
    [v11 setSectionFooterHeight:UITableViewAutomaticDimension];

    v12 = [(_UIShareOverviewParticipantListController *)v3 staticTableView];
    [v12 setEstimatedSectionFooterHeight:25.0];

    v13 = [(_UIShareOverviewParticipantListController *)v3 view];
    [v13 addSubview:v3->_staticTableView];

    v14 = [(_UIShareOverviewParticipantListController *)v3 staticTableView];
    [v14 registerClass:objc_opt_class() forCellReuseIdentifier:off_100061A18];

    v15 = [(_UIShareOverviewParticipantListController *)v3 staticTableView];
    [v15 registerClass:objc_opt_class() forCellReuseIdentifier:off_1000611D0];

    v40 = [(_UIShareOverviewParticipantListController *)v3 view];
    v39 = [v40 bottomAnchor];
    v38 = [(UITableView *)v3->_staticTableView bottomAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v42[0] = v37;
    v36 = [(_UIShareOverviewParticipantListController *)v3 view];
    v35 = [v36 rightAnchor];
    v34 = [(UITableView *)v3->_staticTableView rightAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v42[1] = v33;
    v32 = [(_UIShareOverviewParticipantListController *)v3 view];
    v16 = [v32 leftAnchor];
    v17 = [(UITableView *)v3->_staticTableView leftAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v42[2] = v18;
    v19 = [(_UIShareOverviewParticipantListController *)v3 view];
    v20 = [v19 topAnchor];
    v21 = [(UITableView *)v3->_staticTableView topAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v42[3] = v22;
    v23 = +[NSArray arrayWithObjects:v42 count:4];
    +[NSLayoutConstraint activateConstraints:v23];

    v24 = [[_UIShareTableStaticDataSource alloc] initWithTableView:v3->_staticTableView];
    [(_UIShareOverviewParticipantListController *)v3 setStaticTableDataSource:v24];

    v25 = [(_UIShareOverviewParticipantListController *)v3 staticTableDataSource];
    [v25 setDefaultTarget:v3];

    v26 = [CKShareParticipantArrayController alloc];
    v27 = [(_UIShareOverviewController *)v3 share];
    v28 = [(CKShareParticipantArrayController *)v26 initWithDelegate:v3 share:v27];
    [(_UIShareOverviewParticipantListController *)v3 setParticipantArrayController:v28];

    v29 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v30 = [v29 localizedStringForKey:@"POST_SHARE_LIST_TITLE_TEXT" value:@"People" table:@"Localizable"];
    [(_UIShareOverviewParticipantListController *)v3 setTitle:v30];

    [(_UIShareOverviewParticipantListController *)v3 updateSections];
  }
  return v3;
}

- (void)shareDidChange
{
  v3 = [(_UIShareOverviewController *)self share];
  v4 = [(_UIShareOverviewParticipantListController *)self participantArrayController];
  [v4 setShare:v3];

  v5 = [(_UIShareOverviewParticipantListController *)self participantArrayController];
  [v5 forceParticipantUpdate];

  v6 = [(_UIShareOverviewParticipantListController *)self addPeopleViewController];
  id v7 = v6;
  if (v6) {
    [v6 shareDidChange];
  }
  else {
    [(_UIShareOverviewParticipantListController *)self updateSections];
  }
}

- (void)updateSections
{
  v3 = [BRShareSettings alloc];
  v4 = [(_UIShareOverviewController *)self share];
  v5 = [(_UIShareOverviewController *)self delegate];
  v6 = -[BRShareSettings initWithShare:permissions:](v3, "initWithShare:permissions:", v4, [v5 shareViewControllerAllowedPermissions:self]);
  settings = self->_settings;
  self->_settings = v6;

  v8 = [(_UIShareOverviewParticipantListController *)self _sections];
  v9 = [(_UIShareOverviewParticipantListController *)self staticTableDataSource];
  [v9 setSections:v8];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005238;
  v10[3] = &unk_10004C918;
  v10[4] = self;
  +[UIView performWithoutAnimation:v10];
}

- (void)updateThumbnail
{
  id v2 = [(_UIShareOverviewParticipantListController *)self addPeopleViewController];
  [v2 updateThumbnail];
}

- (void)dealloc
{
  [(CKShareParticipantArrayController *)self->_participantArrayController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIShareOverviewParticipantListController;
  [(_UIShareOverviewParticipantListController *)&v3 dealloc];
}

- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000053A8;
  v6[3] = &unk_10004CA00;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)showParticipantInfo:(id)a3
{
  id v4 = a3;
  v9 = [[BRParticipantInfoViewController alloc] initWithParticipantContact:v4];

  [(BRParticipantInfoViewController *)v9 setDelegate:self];
  id v5 = [(_UIShareOverviewParticipantListController *)self navigationController];
  [v5 pushViewController:v9 animated:1];

  v6 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  id v7 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  v8 = [v7 indexPathForSelectedRow];
  [v6 deselectRowAtIndexPath:v8 animated:1];
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareOverviewController *)self share];
  v6 = [v5 participants];
  id v7 = [v6 count];

  if ((unint64_t)v7 > 2)
  {
    [(_UIShareOverviewController *)self setNavigationItemSpinner:1];
    v14 = [(_UIShareOverviewController *)self delegate];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005948;
    v16[3] = &unk_10004CA50;
    v16[4] = self;
    id v17 = v4;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000059B4;
    v15[3] = &unk_10004CA78;
    v15[4] = self;
    [v14 shareViewController:self modifyShare:v16 completion:v15];
  }
  else
  {
    v8 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v9 = [v8 localizedStringForKey:@"Remove “%@”?" value:@"Remove “%@”?" table:@"Localizable"];
    v10 = sub_10000573C(v4);
    v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v10);

    v12 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v13 = [v12 localizedStringForKey:@"Removing the only invited participant will stop sharing." value:@"Removing the only invited participant will stop sharing." table:@"Localizable"];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000058E8;
    v18[3] = &unk_10004CA28;
    v18[4] = self;
    [(_UIShareOverviewParticipantListController *)self showSettingsAlertWithTitle:v11 message:v13 completion:v18];
  }
}

- (void)addPeople:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareOverviewController *)self delegate];
  [v5 turnShowAddPeopleOn:1];
  if ([v5 shareViewControllerIsFolderShare:self]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 shareViewController:self setFolderShareIsPrepared:1];
  }
  v6 = [_UIShareOverviewActionController alloc];
  id v7 = [(_UIShareOverviewController *)self delegate];
  v8 = [(_UIShareOverviewActionController *)v6 initWithDelegate:v7];

  [(_UIShareOverviewActionController *)v8 updatePermissionOptions];
  v9 = [(_UIShareOverviewController *)self itemName];
  [(_UIShareOverviewActionController *)v8 setItemName:v9];

  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"_dismissAddPeople:"];
  [(_UIShareOverviewController *)v8 setCloseButton:v10];

  [(_UIShareOverviewParticipantListController *)self setAddPeopleViewController:v8];
  id v11 = [objc_alloc((Class)_UIPreferredContentSizeRelayingNavigationController) initWithRootViewController:v8];
  v12 = [(_UIShareOverviewParticipantListController *)self navigationController];
  v13 = [v12 delegate];
  [v11 setDelegate:v13];

  [v11 setModalPresentationStyle:6];
  v14 = [(_UIShareOverviewParticipantListController *)self navigationController];
  [v14 presentViewController:v11 animated:1 completion:0];

  [(_UIShareOverviewParticipantListController *)self _updateOverrideTraitsForModallyPresentedAddPeopleController];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005C70;
  v15[3] = &unk_10004CAA0;
  objc_copyWeak(&v16, &location);
  [v11 setPreferredContentSizeDidChange:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)sendLink:(id)a3
{
}

- (id)_documentsApplicationProxy
{
  return +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.DocumentsApp"];
}

- (void)showSharedFolder:(id)a3
{
  id v3 = [(_UIShareOverviewController *)self delegate];
  [v3 changeToTopLevelSharedFolderURL];
}

- (void)togglePrimarySwitch:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIShareOverviewController *)self delegate];
  id v5 = [v4 isOn];

  [v6 shareViewControllerDidTogglePrimarySwitch:v5];
}

- (void)toggleSecondarySwitch:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIShareOverviewController *)self delegate];
  id v5 = [v4 isOn];

  [v6 shareViewControllerDidToggleSecondarySwitch:v5];
}

- (void)_updateOverrideTraitsForModallyPresentedAddPeopleController
{
  id v5 = +[UITraitCollection _traitCollectionWithValue:&__kCFBooleanTrue forTraitNamed:@"_BRNeedsCancelNavigationButtonTrait"];
  id v3 = [(_UIShareOverviewParticipantListController *)self presentedViewController];
  id v4 = [(_UIShareOverviewParticipantListController *)self addPeopleViewController];
  [v3 setOverrideTraitCollection:v5 forChildViewController:v4];
}

- (void)_dismissAddPeople:(id)a3
{
  id v4 = [(_UIShareOverviewController *)self delegate];
  [v4 turnShowAddPeopleOn:0];
  id v5 = [(_UIShareOverviewParticipantListController *)self navigationController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005F60;
  v6[3] = &unk_10004C918;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

- (void)stopSharing:(id)a3
{
  [(_UIShareOverviewController *)self setNavigationItemSpinner:1];
  id v4 = [(_UIShareOverviewController *)self delegate];
  [v4 shareViewControllerStopSharing:self overrideAlert:0];

  id v7 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  id v5 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  id v6 = [v5 indexPathForSelectedRow];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)leaveShare:(id)a3
{
  [(_UIShareOverviewController *)self setNavigationItemSpinner:1];
  id v4 = [(_UIShareOverviewController *)self delegate];
  [v4 shareViewControllerLeaveShare:self];

  id v7 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  id v5 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  id v6 = [v5 indexPathForSelectedRow];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)copyLink:(id)a3
{
  [(_UIShareOverviewController *)self setNavigationItemSpinner:1];
  id v4 = [(_UIShareOverviewController *)self delegate];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000061C4;
  v5[3] = &unk_10004CAC8;
  v5[4] = self;
  [v4 shareViewControllerCopyShareURL:self completion:v5];
}

- (BOOL)_isOrgAdminParticipant:(id)a3
{
  return [a3 isOrgAdminUser];
}

- (id)_sections
{
  id v3 = [(_UIShareOverviewController *)self delegate];
  v203 = self;
  id v4 = [v3 viewControllerShare:self];
  id v186 = +[NSMutableArray array];
  if (!v4)
  {
    id v9 = v186;
    goto LABEL_159;
  }
  id v5 = [v4 currentUserParticipant];
  id v6 = [v4 owner];
  unsigned int v7 = [v6 isEqual:v5];

  unsigned int v182 = v7;
  BOOL v8 = (v7 & 1) != 0 || [v5 role] == (id)2;
  BOOL v197 = v8;
  id v188 = [v5 permission];
  [v3 shareViewControllerAllowOthersToInvite];
  p_isa = (id *)&v203->super.super.super.super.isa;
  unsigned int v184 = [(_UIShareOverviewController *)v203 itemIsShareRoot];
  unsigned int v11 = [v3 itemIsInsideFolderShare];
  unsigned int v12 = [v3 shareViewControllerIsFolderShare:v203];
  unsigned int v13 = v12;
  v185 = v3;
  v200 = v4;
  v189 = v5;
  unsigned int v183 = v11;
  if (v11)
  {
    v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v15 = [v14 localizedStringForKey:@"SHARED_WITHIN_TEXT" value:@"Shared Folder: %@" table:@"Localizable"];
    id v16 = [(_UIShareOverviewController *)v203 rootItemName];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v16);
    v181 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v181 = &stru_10004DE30;
  if (v12)
  {
LABEL_9:
    id v17 = &stru_10004DE30;
    CFStringRef v18 = @"Folder140pt";
    if (!(v184 | v13)) {
      id v17 = @"Folder140pt";
    }
    v19 = v17;
    uint64_t v20 = [v3 shareViewControllerThumbnail:v203];
    v21 = (void *)v20;
    if (v13)
    {
      uint64_t v22 = [v3 shareViewControllerHeaderPrimaryImage];

      v21 = (void *)v22;
      if (!v22) {
        goto LABEL_16;
      }
    }
    else if (!v20)
    {
      CFStringRef v18 = @"DefaultThumbnail";
LABEL_16:
      v21 = +[UIImage imageNamed:v18];
    }
    v23 = [v3 shareViewControllerHeaderSecondaryImage];
    if (!v23)
    {
      if ([(__CFString *)v19 length])
      {
        v23 = +[UIImage imageNamed:v19];
      }
      else
      {
        v23 = 0;
      }
    }
    v271[0] = @"hheight";
    v271[1] = @"fheight";
    v272[0] = &off_100050DB0;
    v272[1] = &off_100050DB0;
    v271[2] = @"items";
    v268[0] = @"title";
    v24 = [v3 itemName];
    v269[0] = v24;
    v269[1] = v181;
    v268[1] = @"detail";
    v268[2] = @"sharedByModifiedBy";
    v25 = [v3 sharedByModifiedByText];
    v269[2] = v25;
    v269[3] = @"header";
    v268[3] = @"celltype";
    v268[4] = @"shareElementImage";
    v269[4] = v21;
    v268[5] = @"shareElementBadge";
    v26 = v23;
    if (!v23)
    {
      v26 = +[NSNull null];
    }
    v269[5] = v26;
    v27 = +[NSDictionary dictionaryWithObjects:v269 forKeys:v268 count:6];
    v270 = v27;
    v28 = +[NSArray arrayWithObjects:&v270 count:1];
    v272[2] = v28;
    v29 = +[NSDictionary dictionaryWithObjects:v272 forKeys:v271 count:3];

    if (!v23) {
    [v186 addObject:v29];
    }

    id v3 = v185;
    id v4 = v200;
    p_isa = (id *)&v203->super.super.super.super.isa;
  }
  v202 = +[NSMutableArray array];
  id v30 = [v4 publicPermission];
  id v31 = [p_isa[7] defaultPermission];
  unsigned int v32 = [v3 shareViewControllerIsNotesOrRemindersOrDocSharing:p_isa];
  id v208 = v30;
  if (v30 == (id)1) {
    unsigned int v33 = v182;
  }
  else {
    unsigned int v33 = 0;
  }
  int v187 = v33;
  if (v32 && v31 == (id)3 && (v33 & 1) != 0)
  {
    unsigned int v180 = 1;
    v34 = &BRAllowFolderSharing_ptr;
  }
  else
  {
    v34 = &BRAllowFolderSharing_ptr;
    if ([p_isa[7] shouldShowMode]) {
      unsigned int v180 = 1;
    }
    else {
      unsigned int v180 = [p_isa[7] shouldShowPermissions];
    }
  }
  v201 = [v3 shareViewControllerParticipantDetails];
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  id obj = [p_isa modelSnapshot];
  id v206 = [obj countByEnumeratingWithState:&v215 objects:v267 count:16];
  if (!v206)
  {
    v199 = 0;
    goto LABEL_85;
  }
  v199 = 0;
  uint64_t v204 = *(void *)v216;
  do
  {
    for (i = 0; i != v206; i = (char *)i + 1)
    {
      if (*(void *)v216 != v204) {
        objc_enumerationMutation(obj);
      }
      v36 = *(void **)(*((void *)&v215 + 1) + 8 * i);
      v37 = [v36 participant];
      BOOL v38 = [v37 role] == (id)3 || objc_msgSend(v37, "role") == (id)2;
      if (v208 == (id)1 || !v38 || [v37 acceptanceStatus] == (id)2)
      {
        v39 = sub_10000573C(v36);
        if ([v39 length])
        {
          int v207 = 1;
          v40 = &BRAllowFolderSharing_ptr;
        }
        else
        {
          v40 = &BRAllowFolderSharing_ptr;
          objc_super v41 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          uint64_t v42 = [v41 localizedStringForKey:@"Unknown participant" value:@"Unknown participant" table:@"Localizable"];

          v39 = (void *)v42;
          int v207 = v187;
        }
        if ([v37 acceptanceStatus] == (id)1)
        {
          v43 = [v40[188] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          id v213 = [v43 localizedStringForKey:@"PARTICIPANT_STATUS_TEXT_WAITING" value:@"Invited" table:@"Localizable"];
        }
        else
        {
          id v213 = 0;
        }
        if ([v37 permission] == (id)2
          || [v4 publicPermission] == (id)2
          && ([v4 owner],
              v45 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v46 = [v37 isEqual:v45],
              v45,
              (v46 & 1) == 0))
        {
          v44 = [v40[188] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v211 = [v44 localizedStringForKey:@"PARTICIPANT_STATUS_TEXT_VIEW_ONLY" value:@"View only" table:@"Localizable"];
        }
        else
        {
          v211 = 0;
        }
        id v47 = [v37 acceptanceStatus];
        v48 = &off_100050DE0;
        if (v47 == (id)2) {
          v48 = &off_100050DC8;
        }
        v49 = v48;
        v50 = [v4 owner];
        unsigned int v51 = [v37 isEqual:v50];

        v210 = v39;
        if (v51)
        {
          id v52 = v39;

          v53 = [v40[188] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v54 = [v53 localizedStringForKey:@"PARTICIPANT_OWNER_TEXT" value:@"%@ (Owner)" table:@"Localizable"];
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v54, v52);
          id v55 = (id)objc_claimAutoreleasedReturnValue();

          v49 = &off_100050DF8;
          v199 = v52;
        }
        else if ([v37 isEqual:v189])
        {
          v56 = [v40[188] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v57 = [v56 localizedStringForKey:@"PARTICIPANT_ME_TEXT" value:@"%@ (Me)" table:@"Localizable"];
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v57, v39);
          id v55 = (id)objc_claimAutoreleasedReturnValue();

          v49 = &off_100050E10;
        }
        else
        {
          id v55 = v39;
        }
        if (v197)
        {
          int v58 = (v208 == (id)1) & ~[v37 isCurrentUser] & (v183 ^ 1);
          if (v188 != (id)3) {
            int v58 = 0;
          }
          int v209 = v58;
        }
        else
        {
          int v209 = 0;
        }
        v59 = objc_opt_new();
        v60 = [v37 userIdentity];
        v61 = [v60 userRecordID];
        v62 = [v61 recordName];
        v63 = [v201 objectForKeyedSubscript:v62];

        v64 = [v36 contact];
        [v59 setContact:v64];

        [v59 setTitle:v55];
        if (v213) {
          id v65 = v213;
        }
        else {
          id v65 = v211;
        }
        [v59 setSubtitle:v65];
        objc_msgSend(v59, "setGrayedOut:", objc_msgSend(v37, "acceptanceStatus") != (id)2);
        v66 = [v63 participantColor];
        [v59 setParticipantColor:v66];

        if ([(_UIShareOverviewParticipantListController *)v203 _isOrgAdminParticipant:v37])
        {
          [v59 setIsOrgAdmin:1];
          v67 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v68 = [v67 localizedStringForKey:@"PARTICIPANT_ORG_ADMIN_TEXT" value:@"Your Organization" table:@"Localizable"];
          v69 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v68, v210);
          [v59 setSubtitle:v69];

          v49 = &off_100050DB0;
          v34 = &BRAllowFolderSharing_ptr;
          goto LABEL_77;
        }
        v34 = &BRAllowFolderSharing_ptr;
        if (v207)
        {
          v265[0] = @"sortTitle";
          v265[1] = @"type";
          v266[0] = v55;
          v266[1] = @"action";
          v266[2] = off_100061A18;
          v265[2] = @"celltype";
          v265[3] = @"action";
          v70 = NSStringFromSelector("showParticipantInfo:");
          v266[3] = v70;
          v266[4] = v36;
          v265[4] = @"param";
          v265[5] = @"value";
          v265[6] = @"prio";
          v266[5] = v59;
          v266[6] = v49;
          v71 = +[NSDictionary dictionaryWithObjects:v266 forKeys:v265 count:7];
          id v72 = [v71 mutableCopy];
        }
        else
        {
LABEL_77:
          v263[0] = @"sortTitle";
          v263[1] = @"type";
          v264[0] = v55;
          v264[1] = @"action";
          v263[2] = @"celltype";
          v263[3] = @"param";
          v264[2] = off_100061A18;
          v264[3] = v36;
          v263[4] = @"value";
          v263[5] = @"prio";
          v264[4] = v59;
          v264[5] = v49;
          v70 = +[NSDictionary dictionaryWithObjects:v264 forKeys:v263 count:6];
          id v72 = [v70 mutableCopy];
        }

        if (v209)
        {
          CFStringRef v261 = @"remact";
          v73 = NSStringFromSelector("removeParticipant:");
          v262 = v73;
          v74 = +[NSDictionary dictionaryWithObjects:&v262 forKeys:&v261 count:1];
          [v72 addEntriesFromDictionary:v74];
        }
        [v202 addObject:v72];

        id v4 = v200;
      }
    }
    id v206 = [obj countByEnumeratingWithState:&v215 objects:v267 count:16];
  }
  while (v206);
LABEL_85:

  v75 = +[NSSortDescriptor sortDescriptorWithKey:@"prio" ascending:1];
  v260[0] = v75;
  v76 = +[NSSortDescriptor sortDescriptorWithKey:@"sortTitle" ascending:1];
  v260[1] = v76;
  v77 = +[NSArray arrayWithObjects:v260 count:2];
  [v202 sortUsingDescriptors:v77];

  BOOL v78 = v197;
  if (v208 != (id)1) {
    BOOL v78 = 0;
  }
  if ((v78 & v184) == 1 && v188 == (id)3)
  {
    v259[0] = @"action";
    v258[0] = @"type";
    v258[1] = @"action";
    v79 = NSStringFromSelector("addPeople:");
    v259[1] = v79;
    v259[2] = off_1000611D0;
    v258[2] = @"celltype";
    v258[3] = @"value";
    v80 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v81 = [v80 localizedStringForKey:@"ADD_PEOPLE_ACTION_TEXT" value:@"Add People" table:@"Localizable"];
    v259[3] = v81;
    v82 = [v34[190] dictionaryWithObjects:v259 forKeys:v258 count:4];
    [v202 addObject:v82];
  }
  if (![(BRShareSettings *)v203->_settings hasACL])
  {
    id v89 = [(BRShareSettings *)v203->_settings publicPermission];
    v90 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v83 = v90;
    if (v182)
    {
      if (v89 == (id)2)
      {
        CFStringRef v91 = @"SETTINGS_DETAIL_PUBLIC_RO_TEXT";
        CFStringRef v92 = @"Anyone with the link can view.";
      }
      else
      {
        CFStringRef v91 = @"SETTINGS_DETAIL_PUBLIC_RW_TEXT";
        CFStringRef v92 = @"Anyone with the link can make changes.";
      }
      [v90 localizedStringForKey:v91 value:v92 table:@"Localizable"];
      v196 = v195 = 0;
    }
    else
    {
      if (v89 == (id)2)
      {
        CFStringRef v94 = @"SETTINGS_DETAIL_PUBLIC_RO_TEXT";
        CFStringRef v95 = @"Anyone with the link can view.";
      }
      else
      {
        CFStringRef v94 = @"SETTINGS_DETAIL_PUBLIC_RW_TEXT";
        CFStringRef v95 = @"Anyone with the link can make changes.";
      }
      v195 = [v90 localizedStringForKey:v94 value:v95 table:@"Localizable"];
      v196 = 0;
    }
    goto LABEL_119;
  }
  if ((v182 & v180 & v184) != 1)
  {
    v83 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v93 = [v83 localizedStringForKey:@"SETTINGS_ONLY_OWNER_CAN_CHANGE" value:@"Error: don't expect this ONLY_OWNER_CAN_CHANGE to show." table:@"Localizable"];
    v195 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v93, v199);

    v196 = 0;
    goto LABEL_119;
  }
  v83 = [v185 shareViewControllerItemUTI:v203];
  unsigned int v84 = [v83 isEqualToString:@"com.apple.reminders.list"];
  id v85 = [v185 shareViewControllerCurrentParticipantsState];
  if ((id)[(BRShareSettings *)v203->_settings defaultPermission] == (id)2)
  {
    v86 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v195 = [v86 localizedStringForKey:@"SETTINGS_DETAIL_ACL_RO_SUMMARY_TEXT" value:@"Only people you invite can view." table:@"Localizable"];

    v87 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v88 = [v87 localizedStringForKey:@"SETTINGS_DETAIL_ACL_RO_POST_SHARE_TEXT" value:@"Invited people can view only." table:@"Localizable"];
    goto LABEL_118;
  }
  id v96 = [(BRShareSettings *)v203->_settings defaultPermission];
  v97 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v98 = v97;
  if (v96 != (id)3)
  {
    v195 = [v97 localizedStringForKey:@"SETTINGS_DETAIL_ACL_MIXED_SUMMARY_TEXT" value:@"Only people you invite can open." table:@"Localizable"];

    v102 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v101 = [v102 localizedStringForKey:@"SETTINGS_DETAIL_ACL_RW_MIXED_EDIT_N_ADD_POST_SHARE_TEXT" value:@"Some invited people can make changes and add others." table:@"Localizable"];

    if (v84)
    {
      v103 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v87 = v103;
      if (v85 == (id)2)
      {
        CFStringRef v104 = @"SETTINGS_DETAIL_REMINDERS_POST_SHARE_TEXT";
        CFStringRef v105 = @"Only people you invited have access.";
      }
      else
      {
        CFStringRef v104 = @"SETTINGS_DETAIL_REMINDERS_MIXED_ADD_POST_SHARE_TEXT";
        CFStringRef v105 = @"Some people you invited can add others.";
      }
      goto LABEL_117;
    }
    goto LABEL_115;
  }
  v195 = [v97 localizedStringForKey:@"SETTINGS_DETAIL_ACL_RW_SUMMARY_TEXT" value:@"Only people you invite can make changes." table:@"Localizable"];

  v99 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v100 = v99;
  if (v85 == (id)1)
  {
    v101 = [v99 localizedStringForKey:@"SETTINGS_DETAIL_ACL_RW_ADD_OTHERS_POST_SHARE_TEXT" value:@"Invited people can make changes and add others." table:@"Localizable"];
    goto LABEL_112;
  }
  v101 = [v99 localizedStringForKey:@"SETTINGS_DETAIL_ACL_RW_MIXED_ADD_POST_SHARE_TEXT" value:@"Some invited people can add others." table:@"Localizable"];

  if (v85 == (id)2)
  {
    v100 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v106 = [v100 localizedStringForKey:@"SETTINGS_DETAIL_ACL_RW_MIXED_NO_ADD_POST_SHARE_TEXT" value:@"Only people you invited can make changes." table:@"Localizable"];

    v101 = (void *)v106;
LABEL_112:
  }
  if (!v84)
  {
LABEL_115:
    v196 = v101;
    goto LABEL_119;
  }
  v103 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v87 = v103;
  CFStringRef v104 = @"SETTINGS_DETAIL_REMINDERS_ADD_OTHERS_POST_SHARE_TEXT";
  CFStringRef v105 = @"People you invited can add others.";
LABEL_117:
  uint64_t v107 = [v103 localizedStringForKey:v104 value:v105 table:@"Localizable"];

  uint64_t v88 = v107;
LABEL_118:
  v196 = (void *)v88;

LABEL_119:
  v256[0] = @"hheight";
  v256[1] = @"items";
  v257[0] = &off_100050DB0;
  v257[1] = v202;
  v256[2] = @"fheight";
  v257[2] = &off_100050DB0;
  v214 = [v34[190] dictionaryWithObjects:v257 forKeys:v256 count:3];
  v254[0] = @"title";
  v193 = +[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:");
  v108 = [v193 localizedStringForKey:@"COPY_LINK_ACTION_TEXT" value:@"Copy Link" table:@"Localizable"];
  v255[0] = v108;
  v255[1] = @"action";
  v254[1] = @"type";
  v254[2] = @"action";
  v109 = NSStringFromSelector("copyLink:");
  v255[2] = v109;
  v255[3] = @"centered";
  v254[3] = @"celltype";
  v254[4] = @"accessibilityLabel";
  v110 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v111 = [v110 localizedStringForKey:@"COPY_LINK_ACTION_ACCESSIBILITY_LABEL" value:@"Copy Link button" table:@"Localizable"];
  v255[4] = v111;
  v254[5] = @"accessibilityHint";
  v112 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v113 = [v112 localizedStringForKey:@"COPY_LINK_ACTION_ACCESSIBILITY_HINT" value:@"copy shared link to clipboard" table:@"Localizable"];
  v255[5] = v113;
  v205 = [v34[190] dictionaryWithObjects:v255 forKeys:v254 count:6];

  v252[0] = @"title";
  v114 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v115 = [v114 localizedStringForKey:@"SEND_LINK_ACTION_TEXT" value:@"Send Link" table:@"Localizable"];
  v253[0] = v115;
  v253[1] = @"action";
  v252[1] = @"type";
  v252[2] = @"action";
  v116 = NSStringFromSelector("sendLink:");
  v252[3] = @"celltype";
  v253[2] = v116;
  v253[3] = @"centered";
  uint64_t v117 = +[NSDictionary dictionaryWithObjects:v253 forKeys:v252 count:4];

  v250[0] = @"title";
  v118 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v119 = [v118 localizedStringForKey:@"STOP_SHARING_ACTION_TEXT" value:@"Stop Sharing" table:@"Localizable"];
  v251[0] = v119;
  v251[1] = @"action";
  v250[1] = @"type";
  v250[2] = @"action";
  v120 = NSStringFromSelector("stopSharing:");
  v251[2] = v120;
  v251[3] = &__kCFBooleanTrue;
  v250[3] = @"destructive";
  v250[4] = @"celltype";
  v251[4] = @"centered";
  v194 = +[NSDictionary dictionaryWithObjects:v251 forKeys:v250 count:5];

  [v186 addObject:v214];
  id v3 = v185;
  id v4 = v200;
  v121 = (void *)v117;
  v192 = (void *)v117;
  if (v183)
  {
    v122 = [(_UIShareOverviewParticipantListController *)v203 _documentsApplicationProxy];
    v123 = [v122 appState];
    unsigned int v124 = [v123 isInstalled];

    if (v124)
    {
      v248[0] = @"title";
      v125 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v126 = [v125 localizedStringForKey:@"SHOW_FOLDER_ACTION_TEXT" value:@"Show Shared Folder" table:@"Localizable"];
      v249[0] = v126;
      v249[1] = @"action";
      v248[1] = @"type";
      v248[2] = @"action";
      v127 = NSStringFromSelector("showSharedFolder:");
      v248[3] = @"celltype";
      v249[2] = v127;
      v249[3] = @"centered";
      v128 = +[NSDictionary dictionaryWithObjects:v249 forKeys:v248 count:4];

      if (v182)
      {
        v129 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v130 = [v129 localizedStringForKey:@"NON_ROOT_ITEM_FOLDER_INFORMATION_TEXT" value:@"Go to the folder’s share options to add people or change editing permissions." table:@"Localizable"];

        v131 = [v185 shareViewControllerItemUTI:v203];
        v132 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v133 = [v132 localizedStringForKey:@"NON_ROOT_ITEM_INFORMATION_TEXT" value:@"This item is in a shared folder. %@" table:@"Localizable"];
        v134 = _CDAdaptLocalizedStringForItemType();
        v135 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v134, v130);

        id v3 = v185;
        v247[0] = &off_100050E28;
        v246[0] = @"hheight";
        v246[1] = @"items";
        v245 = v128;
        v136 = +[NSArray arrayWithObjects:&v245 count:1];
        v246[2] = @"footer";
        v247[1] = v136;
        v247[2] = v135;
        v137 = +[NSDictionary dictionaryWithObjects:v247 forKeys:v246 count:3];
        [v186 addObject:v137];

        v121 = v192;
      }
      else
      {
        v244[0] = &off_100050E28;
        v243[0] = @"hheight";
        v243[1] = @"items";
        v242 = v128;
        v130 = +[NSArray arrayWithObjects:&v242 count:1];
        v243[2] = @"fheight";
        v244[1] = v130;
        v244[2] = &off_100050DB0;
        v131 = +[NSDictionary dictionaryWithObjects:v244 forKeys:v243 count:3];
        [v186 addObject:v131];
      }
    }
  }
  if (v201)
  {
    v198 = [v3 shareViewControllerPrimaryAuxilarySwitchTitle];
    v191 = [v3 shareViewControllerSecondaryAuxilarySwitchTitle];
    -[_UIShareOverviewParticipantListController setShowParticipantEdits:](v203, "setShowParticipantEdits:", [v3 shareViewControllerPrimaryAuxiliarySwitchState]);
    -[_UIShareOverviewParticipantListController setDoNotDisturb:](v203, "setDoNotDisturb:", [v3 shareViewControllerSecondaryAuxiliarySwitchState]);
    v240[0] = @"title";
    v240[1] = @"type";
    v241[0] = v198;
    v241[1] = @"toggle";
    v241[2] = @"showParticipantEdits";
    v240[2] = @"key";
    v240[3] = @"action";
    v138 = NSStringFromSelector("togglePrimarySwitch:");
    v241[3] = v138;
    v139 = +[NSDictionary dictionaryWithObjects:v241 forKeys:v240 count:4];

    v238[0] = @"title";
    v238[1] = @"type";
    id v3 = v185;
    v239[0] = v191;
    v239[1] = @"toggle";
    v239[2] = @"doNotDisturb";
    v238[2] = @"key";
    v238[3] = @"action";
    v140 = NSStringFromSelector("toggleSecondarySwitch:");
    v239[3] = v140;
    v141 = +[NSDictionary dictionaryWithObjects:v239 forKeys:v238 count:4];

    v237[0] = &off_100050E28;
    v236[0] = @"hheight";
    v236[1] = @"items";
    v235[0] = v139;
    v235[1] = v141;
    v142 = +[NSArray arrayWithObjects:v235 count:2];
    v236[2] = @"fheight";
    v237[1] = v142;
    v237[2] = &off_100050DB0;
    v143 = +[NSDictionary dictionaryWithObjects:v237 forKeys:v236 count:3];

    [v186 addObject:v143];
    v121 = v192;
  }
  if ((v184 | v183) == 1)
  {
    if (v182)
    {
      if ((v180 & v184) == 1)
      {
        id v144 = [(_UIShareOverviewParticipantListController *)v203 settingsSectionWithText:v196];
        [v186 addObject:v144];
        if (v183)
        {
          v230[0] = &off_100050E28;
          v229[0] = @"hheight";
          v229[1] = @"items";
          v228 = v121;
          v145 = +[NSArray arrayWithObjects:&v228 count:1];
          v229[2] = @"footer";
          v230[1] = v145;
          v230[2] = v195;
          v146 = v230;
          v147 = v229;
        }
        else
        {
          v234[0] = &off_100050E28;
          v233[0] = @"hheight";
          v233[1] = @"items";
          if (v208 == (id)1)
          {
            v232 = v194;
            v163 = &v232;
            uint64_t v164 = 1;
          }
          else
          {
            v231[0] = v121;
            v231[1] = v194;
            v163 = (void **)v231;
            uint64_t v164 = 2;
          }
          v145 = +[NSArray arrayWithObjects:v163 count:v164];
          v233[2] = @"fheight";
          v234[1] = v145;
          v234[2] = &off_100050E28;
          v146 = v234;
          v147 = v233;
        }
        v148 = +[NSDictionary dictionaryWithObjects:v146 forKeys:v147 count:3];

        [v186 addObject:v148];
      }
      else
      {
        uint64_t v212 = [v3 shareViewControllerItemUTI:v203];
        if (v183)
        {
          unsigned int v153 = [(BRShareSettings *)v203->_settings hasACL];
          v154 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v155 = v154;
          if (v153)
          {
            CFStringRef v156 = @"SETTINGS_COPY_LINK_SUBFOLDERTITLE_PRIVATE";
            CFStringRef v157 = @"Only people added to the shared folder “%@” can use the link to access this item.";
          }
          else
          {
            CFStringRef v156 = @"SETTINGS_COPY_LINK_SUBFOLDERTITLE_PUBLIC";
            CFStringRef v157 = @"Only people in the shared folder “%@” can use the link to access this item.";
          }
          v168 = [v154 localizedStringForKey:v156 value:v157 table:@"Localizable"];
          v172 = _CDAdaptLocalizedStringForItemType();
          v173 = [(_UIShareOverviewController *)v203 rootItemName];
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v172, v173);
          id v144 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v155 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v168 = [v155 localizedStringForKey:@"SETTINGS_COPY_LINK_SUBTITLE" value:@"Only added people will have access." table:@"Localizable"];
          _CDAdaptLocalizedStringForItemType();
          id v144 = (id)objc_claimAutoreleasedReturnValue();
        }

        v227[0] = &off_100050E28;
        v226[0] = @"hheight";
        v226[1] = @"items";
        v225 = v205;
        v174 = +[NSArray arrayWithObjects:&v225 count:1];
        v226[2] = @"footer";
        v227[1] = v174;
        v227[2] = v144;
        v175 = +[NSDictionary dictionaryWithObjects:v227 forKeys:v226 count:3];
        [v186 addObject:v175];

        v121 = v192;
        if ((v183 & 1) == 0)
        {
          v224[0] = &off_100050DB0;
          v223[0] = @"hheight";
          v223[1] = @"items";
          v222 = v194;
          v176 = +[NSArray arrayWithObjects:&v222 count:1];
          v223[2] = @"fheight";
          v224[1] = v176;
          v224[2] = &off_100050DB0;
          v177 = +[NSDictionary dictionaryWithObjects:v224 forKeys:v223 count:3];
          [v186 addObject:v177];
        }
        v148 = (void *)v212;
      }
    }
    else
    {
      v148 = [v3 shareViewControllerItemUTI:v203];
      if (v183)
      {
        v149 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v150 = v149;
        if (v208 == (id)1)
        {
          CFStringRef v151 = @"SETTINGS_COPY_LINK_SUBFOLDERTITLE_COLLAB_PRIVATE";
          CFStringRef v152 = @"Only people added to the shared folder “%@” will have access to this item.";
        }
        else
        {
          CFStringRef v151 = @"SETTINGS_COPY_LINK_SUBFOLDERTITLE_PUBLIC";
          CFStringRef v152 = @"Only people in the shared folder “%@” can use the link to access this item.";
        }
        v165 = [v149 localizedStringForKey:v151 value:v152 table:@"Localizable"];
        v166 = _CDAdaptLocalizedStringForItemType();
        v167 = [(_UIShareOverviewController *)v203 rootItemName];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v166, v167);
        id v144 = (id)objc_claimAutoreleasedReturnValue();

        v162 = v205;
        v121 = v192;
      }
      else if (v208 == (id)1)
      {
        v158 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v159 = [v158 localizedStringForKey:@"SETTINGS_ONLY_PEOPLE_INVITED_CAN_ACCESS" value:@"Only people added to this item will have access." table:@"Localizable"];
        v160 = [v3 shareViewControllerItemUTI:v203];
        v161 = _CDAdaptLocalizedStringForItemType();
        id v144 = +[NSString localizedStringWithFormat:v161];

        v121 = v192;
        v162 = v205;
      }
      else
      {
        v169 = v195;
        if (!v195) {
          v169 = v196;
        }
        id v144 = v169;
        v162 = v121;
      }
      v221[0] = &off_100050E28;
      v220[0] = @"hheight";
      v220[1] = @"items";
      v219 = v162;
      v170 = +[NSArray arrayWithObjects:&v219 count:1];
      v220[2] = @"footer";
      v221[1] = v170;
      v221[2] = v144;
      v171 = +[NSDictionary dictionaryWithObjects:v221 forKeys:v220 count:3];
      [v186 addObject:v171];
    }
  }
  id v178 = v186;

LABEL_159:

  return v186;
}

- (id)settingsSectionWithText:(id)a3
{
  v15[0] = &off_100050E28;
  v14[0] = @"hheight";
  v14[1] = @"items";
  id v3 = a3;
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI", @"title"];
  id v5 = [v4 localizedStringForKey:@"SETTINGS_ACTION_TEXT" value:@"Share Options" table:@"Localizable"];
  v12[0] = v5;
  v12[1] = v3;
  v11[1] = @"detail";
  v11[2] = @"type";
  v12[2] = @"action";
  v12[3] = @"subtitle";
  v11[3] = @"celltype";
  v11[4] = @"action";
  id v6 = NSStringFromSelector("showSettings:");
  v12[4] = v6;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  unsigned int v13 = v7;
  BOOL v8 = +[NSArray arrayWithObjects:&v13 count:1];
  v14[2] = @"fheight";
  v15[1] = v8;
  v15[2] = &off_100050DB0;
  id v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v9;
}

- (void)presentReachabilityViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  BOOL v8 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  id v9 = [v8 indexPathForSelectedRow];
  [v7 deselectRowAtIndexPath:v9 animated:v4];

  id v10 = [(_UIShareOverviewParticipantListController *)self navigationController];
  id v11 = [v10 popToViewController:self animated:v4];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000089E0;
  void v15[3] = &unk_10004CAF0;
  id v16 = v6;
  id v17 = self;
  BOOL v18 = v4;
  id v12 = v6;
  unsigned int v13 = objc_retainBlock(v15);
  v14 = [(_UIShareOverviewParticipantListController *)self presentedViewController];

  if (v14) {
    [(_UIShareOverviewParticipantListController *)self dismissViewControllerAnimated:v4 completion:v13];
  }
  else {
    ((void (*)(void *))v13[2])(v13);
  }
}

- (void)willNavigateFromViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(_UIShareOverviewParticipantListController *)self updateSections];
  }
  id v8 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  id v6 = [(_UIShareOverviewParticipantListController *)self staticTableView];
  unsigned int v7 = [v6 indexPathForSelectedRow];
  [v8 deselectRowAtIndexPath:v7 animated:1];
}

- (void)showSettings:(id)a3
{
  unsigned int v7 = objc_alloc_init(_UIShareInvitationSettingsController);
  [(_UIShareInvitationSettingsController *)v7 setDelegate:self];
  id v4 = [(_UIShareOverviewParticipantListController *)self settings];
  [(_UIShareInvitationSettingsController *)v7 setSettings:v4];

  id v5 = [(_UIShareOverviewController *)self delegate];
  [(_UIShareInvitationSettingsController *)v7 setOverviewControllerDelegate:v5];

  [(_UIShareInvitationSettingsController *)v7 setProxiedOverviewController:self];
  id v6 = [(_UIShareOverviewParticipantListController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (void)showSettingsAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_UIShareOverviewParticipantListController *)self traitCollection];
  BOOL v12 = [v11 userInterfaceIdiom] != (id)1;

  unsigned int v13 = +[UIAlertController alertControllerWithTitle:v10 message:v9 preferredStyle:v12];

  v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v15 = [v14 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100008E18;
  v26[3] = &unk_10004CB18;
  id v16 = v8;
  id v27 = v16;
  id v17 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v26];
  [v13 addAction:v17];

  BOOL v18 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v19 = [v18 localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100008E2C;
  v24[3] = &unk_10004CB18;
  id v25 = v16;
  id v20 = v16;
  v21 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v24];
  [v13 addAction:v21];

  uint64_t v22 = [(_UIShareOverviewParticipantListController *)self navigationController];
  [v22 presentViewController:v13 animated:1 completion:0];
}

- (void)settingsControllerDidChange:(id)a3 changedAllowInviters:(BOOL)a4
{
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000095F0;
  v73[3] = &unk_10004CA00;
  v73[4] = self;
  id v6 = a3;
  id v74 = v6;
  unsigned int v7 = objc_retainBlock(v73);
  id v8 = [(_UIShareOverviewParticipantListController *)self settings];
  unsigned int v9 = [v8 hasACL];
  id v10 = [v6 settings];
  unsigned int v11 = [v10 hasACL];

  if (v9 == v11)
  {
    v34 = [(_UIShareOverviewParticipantListController *)self settings];
    unsigned int v35 = [v34 hasACL];

    v36 = cdui_default_log();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
    if (!v35)
    {
      if (v37)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "[INFO] public permissions changed", buf, 2u);
      }

      goto LABEL_36;
    }
    if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "[INFO] default permissions or allowInviters changed, applying to all participants", buf, 2u);
    }

    if (a4)
    {
LABEL_36:
      ((void (*)(void *))v7[2])(v7);
      goto LABEL_37;
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    BOOL v38 = [(_UIShareOverviewController *)self share];
    v39 = [v38 participants];

    id v40 = [v39 countByEnumeratingWithState:&v60 objects:v75 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v61;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v61 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if (([v44 isCurrentUser] & 1) == 0)
          {
            v45 = [v6 settings];
            objc_msgSend(v44, "setPermission:", objc_msgSend(v45, "defaultPermission"));

            unsigned __int8 v46 = [v6 settings];
            id v47 = [v46 defaultPermission];

            if (v47 == (id)2) {
              [v44 setRole:3];
            }
          }
        }
        id v41 = [v39 countByEnumeratingWithState:&v60 objects:v75 count:16];
      }
      while (v41);
    }
LABEL_32:

    goto LABEL_36;
  }
  BOOL v12 = cdui_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ACL setting changed", buf, 2u);
  }

  unsigned int v13 = [v6 settings];
  unsigned int v14 = [v13 hasACL];

  v15 = cdui_default_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (!v14)
  {
    if (v16)
    {
      v48 = [(_UIShareOverviewParticipantListController *)self settings];
      id v49 = [v48 publicPermission];
      *(_DWORD *)buf = 134217984;
      id v78 = v49;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[INFO] to off, copying permissions from public (%lu)", buf, 0xCu);
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v50 = [(_UIShareOverviewController *)self share];
    v39 = [v50 participants];

    id v51 = [v39 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v65;
      do
      {
        for (j = 0; j != v52; j = (char *)j + 1)
        {
          if (*(void *)v65 != v53) {
            objc_enumerationMutation(v39);
          }
          id v55 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
          v56 = [v6 settings];
          objc_msgSend(v55, "setPermission:", objc_msgSend(v56, "publicPermission"));
        }
        id v52 = [v39 countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v52);
    }
    goto LABEL_32;
  }
  int v58 = v7;
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[INFO] ...to on, asking permission", buf, 2u);
  }

  id v17 = [(_UIShareOverviewParticipantListController *)self traitCollection];
  BOOL v18 = [v17 userInterfaceIdiom] != (id)1;

  v19 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v59 = [v19 localizedStringForKey:@"SETTINGS_SWITCH_TO_ACL_TITLE" value:@"Change to Invite Only?" table:@"Localizable"];

  id v20 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v21 = [v20 localizedStringForKey:@"SETTINGS_SWITCH_TO_ACL_MESSAGE" value:@"Only you will have access to “%@” until you invite people." table:@"Localizable"];
  uint64_t v22 = [(_UIShareOverviewController *)self delegate];
  v23 = [v22 shareViewControllerItemUTI:self];
  v24 = _CDAdaptLocalizedStringForItemType();
  id v25 = [(_UIShareOverviewController *)self itemName];
  v57 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v24, v25);

  v26 = +[UIAlertController alertControllerWithTitle:v59 message:v57 preferredStyle:v18];
  id v27 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v28 = [v27 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_100009760;
  v70[3] = &unk_10004CB68;
  id v71 = v6;
  id v72 = self;
  v29 = +[UIAlertAction actionWithTitle:v28 style:1 handler:v70];
  [v26 addAction:v29];

  id v30 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v31 = [v30 localizedStringForKey:@"Continue" value:@"Continue" table:@"Localizable"];
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000097EC;
  v68[3] = &unk_10004CB18;
  unsigned int v7 = v58;
  v69 = v58;
  unsigned int v32 = +[UIAlertAction actionWithTitle:v31 style:0 handler:v68];
  [v26 addAction:v32];

  unsigned int v33 = [(_UIShareOverviewParticipantListController *)self navigationController];
  [v33 presentViewController:v26 animated:1 completion:0];

LABEL_37:
}

- (id)viewControllerShare:(id)a3
{
  id v4 = [(_UIShareOverviewController *)self delegate];
  id v5 = [v4 viewControllerShare:self];

  return v5;
}

- (id)viewControllerItemURL:(id)a3
{
  id v4 = [(_UIShareOverviewController *)self delegate];
  id v5 = [v4 viewControllerItemURL:self];

  return v5;
}

- (void)participantInfoViewControllerDidChangeParticipant:(id)a3
{
  id v4 = a3;
  id v5 = cdui_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 contact];
    *(_DWORD *)buf = 138412290;
    BOOL v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] Saving share for modified participant %@", buf, 0xCu);
  }
  [(_UIShareOverviewController *)self setNavigationItemSpinner:1];
  unsigned int v7 = [(_UIShareOverviewController *)self delegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009A70;
  v9[3] = &unk_10004CBF8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 shareViewController:self modifyShare:&stru_10004CBA8 completion:v9];
}

- (void)participantInfoViewControllerLeaveShare:(id)a3
{
  [(_UIShareOverviewParticipantListController *)self leaveShare:0];
  id v5 = [(_UIShareOverviewParticipantListController *)self navigationController];
  id v4 = [v5 popToViewController:self animated:1];
}

- (void)participantInfoViewControllerRemoveParticipant:(id)a3
{
  id v4 = [a3 contact];
  [(_UIShareOverviewParticipantListController *)self removeParticipant:v4];

  id v6 = [(_UIShareOverviewParticipantListController *)self navigationController];
  id v5 = [v6 popToViewController:self animated:1];
}

- (unint64_t)participantInfoViewControllerAllowedPermissions:(id)a3
{
  id v4 = [(_UIShareOverviewController *)self delegate];
  id v5 = [v4 shareViewControllerAllowedPermissions:self];

  return (unint64_t)v5;
}

- (BRShareSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (UITableView)staticTableView
{
  return self->_staticTableView;
}

- (void)setStaticTableView:(id)a3
{
}

- (_UIShareTableStaticDataSource)staticTableDataSource
{
  return self->_staticTableDataSource;
}

- (void)setStaticTableDataSource:(id)a3
{
}

- (CKShareParticipantArrayController)participantArrayController
{
  return self->_participantArrayController;
}

- (void)setParticipantArrayController:(id)a3
{
}

- (NSOrderedSet)modelSnapshot
{
  return self->_modelSnapshot;
}

- (void)setModelSnapshot:(id)a3
{
}

- (_UIShareOverviewActionController)addPeopleViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addPeopleViewController);

  return (_UIShareOverviewActionController *)WeakRetained;
}

- (void)setAddPeopleViewController:(id)a3
{
}

- (BOOL)showParticipantEdits
{
  return self->_showParticipantEdits;
}

- (void)setShowParticipantEdits:(BOOL)a3
{
  self->_showParticipantEdits = a3;
}

- (BOOL)doNotDisturb
{
  return self->_doNotDisturb;
}

- (void)setDoNotDisturb:(BOOL)a3
{
  self->_doNotDisturb = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_addPeopleViewController);
  objc_storeStrong((id *)&self->_modelSnapshot, 0);
  objc_storeStrong((id *)&self->_participantArrayController, 0);
  objc_storeStrong((id *)&self->_staticTableDataSource, 0);
  objc_storeStrong((id *)&self->_staticTableView, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end