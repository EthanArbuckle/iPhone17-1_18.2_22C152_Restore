@interface _UIShareInvitationSettingsController
- (BOOL)allowOthersToInvite;
- (BOOL)hasACL;
- (BOOL)shouldShowAllowInviting;
- (BRShareSettings)settings;
- (UISwitch)allowInviteToggle;
- (UITableView)staticTableView;
- (_UIShareInvitationSettingsController)init;
- (_UIShareInvitationSettingsDelegate)delegate;
- (_UIShareOverviewController)proxiedOverviewController;
- (_UIShareOverviewControllerDelegate)overviewControllerDelegate;
- (_UIShareTableStaticDataSource)staticTableDataSource;
- (id)_sections;
- (id)share;
- (int64_t)allowInviters;
- (int64_t)currentParticipantsState;
- (int64_t)defaultPermission;
- (int64_t)publicPermission;
- (void)_sendSettingsControllerDidChange;
- (void)_sendSettingsControllerDidChangeAllowInviters;
- (void)auxiliaryAction:(id)a3;
- (void)copyLink:(id)a3;
- (void)setAllowInviteToggle:(id)a3;
- (void)setAllowInviters:(int64_t)a3;
- (void)setAllowOthersToInvite:(BOOL)a3;
- (void)setDefaultPermission:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasACL:(BOOL)a3;
- (void)setOverviewControllerDelegate:(id)a3;
- (void)setProxiedOverviewController:(id)a3;
- (void)setPublicPermission:(int64_t)a3;
- (void)setSettings:(id)a3;
- (void)setStaticTableDataSource:(id)a3;
- (void)setStaticTableView:(id)a3;
- (void)updateSections;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _UIShareInvitationSettingsController

- (_UIShareInvitationSettingsController)init
{
  v32.receiver = self;
  v32.super_class = (Class)_UIShareInvitationSettingsController;
  v2 = [(_UIShareInvitationSettingsController *)&v32 initWithNibName:0 bundle:0];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    settings = v2->_settings;
    v2->_settings = (BRShareSettings *)v3;

    id v5 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(_UIShareInvitationSettingsController *)v2 setStaticTableView:v5];

    v6 = [(_UIShareInvitationSettingsController *)v2 staticTableView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(_UIShareInvitationSettingsController *)v2 staticTableView];
    [v7 setSectionFooterHeight:UITableViewAutomaticDimension];

    v8 = [(_UIShareInvitationSettingsController *)v2 staticTableView];
    [v8 setEstimatedSectionFooterHeight:25.0];

    v9 = [(_UIShareInvitationSettingsController *)v2 view];
    [v9 addSubview:v2->_staticTableView];

    v31 = [(_UIShareInvitationSettingsController *)v2 view];
    v30 = [v31 bottomAnchor];
    v29 = [(UITableView *)v2->_staticTableView bottomAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v33[0] = v28;
    v27 = [(_UIShareInvitationSettingsController *)v2 view];
    v26 = [v27 rightAnchor];
    v25 = [(UITableView *)v2->_staticTableView rightAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v33[1] = v24;
    v23 = [(_UIShareInvitationSettingsController *)v2 view];
    v10 = [v23 leftAnchor];
    v11 = [(UITableView *)v2->_staticTableView leftAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v33[2] = v12;
    v13 = [(_UIShareInvitationSettingsController *)v2 view];
    v14 = [v13 topAnchor];
    v15 = [(UITableView *)v2->_staticTableView topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v33[3] = v16;
    v17 = +[NSArray arrayWithObjects:v33 count:4];
    +[NSLayoutConstraint activateConstraints:v17];

    v18 = [[_UIShareTableStaticDataSource alloc] initWithTableView:v2->_staticTableView];
    [(_UIShareInvitationSettingsController *)v2 setStaticTableDataSource:v18];

    v19 = [(_UIShareInvitationSettingsController *)v2 staticTableDataSource];
    [v19 setDefaultTarget:v2];

    v20 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v21 = [v20 localizedStringForKey:@"SETTINGS_TITLE_TEXT" value:@"Share Options" table:@"Localizable"];
    [(_UIShareInvitationSettingsController *)v2 setTitle:v21];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIShareInvitationSettingsController;
  [(_UIShareInvitationSettingsController *)&v4 viewWillAppear:a3];
  [(_UIShareInvitationSettingsController *)self updateSections];
}

- (void)updateSections
{
  uint64_t v3 = [(_UIShareInvitationSettingsController *)self _sections];
  objc_super v4 = [(_UIShareInvitationSettingsController *)self staticTableDataSource];
  [v4 setSections:v3];

  id v5 = [(_UIShareInvitationSettingsController *)self staticTableView];
  [v5 reloadData];
}

- (id)share
{
  uint64_t v3 = [(_UIShareInvitationSettingsController *)self overviewControllerDelegate];
  objc_super v4 = [v3 viewControllerShare:self];

  return v4;
}

- (id)_sections
{
  v104 = [(_UIShareInvitationSettingsController *)self overviewControllerDelegate];
  v113 = [(_UIShareInvitationSettingsController *)self proxiedOverviewController];
  id v115 = +[NSMutableArray array];
  unsigned int v82 = [v104 shareViewControllerIsInitialShare:v113];
  unsigned int v114 = [(BRShareSettings *)self->_settings hasACL];
  uint64_t v3 = [v104 viewControllerShare:self];
  v100 = v3;
  if (v3)
  {
    objc_super v4 = [v3 owner];
    unsigned int v5 = [v4 isCurrentUser];
  }
  else
  {
    unsigned int v5 = 1;
  }
  v112 = self;
  unsigned int v102 = v5;
  uint64_t v6 = [(BRShareSettings *)self->_settings shouldShowMode] & v5;
  v159[0] = @"title";
  v110 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v108 = [v110 localizedStringForKey:@"Who can access" value:@"Who can access" table:@"Localizable"];
  v160[0] = v108;
  v160[1] = &off_100050EB8;
  v159[1] = @"fheight";
  v159[2] = @"items";
  v156[0] = @"title";
  v105 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v96 = [v105 localizedStringForKey:@"Only people you invite" value:@"Only people you invite" table:@"Localizable"];
  v157[0] = v96;
  v157[1] = @"radio";
  v156[1] = @"type";
  v156[2] = @"key";
  v157[2] = @"hasACL";
  v157[3] = &__kCFBooleanTrue;
  v156[3] = @"value";
  v156[4] = @"enabled";
  int v7 = v6;
  v93 = +[NSNumber numberWithBool:v6];
  v156[5] = @"axIdentifier";
  v157[4] = v93;
  v157[5] = @"aclPrivateCell";
  v90 = +[NSDictionary dictionaryWithObjects:v157 forKeys:v156 count:6];
  v158[0] = v90;
  v154[0] = @"title";
  v8 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v9 = [v8 localizedStringForKey:@"Anyone with the link" value:@"Anyone with the link" table:@"Localizable"];
  v155[0] = v9;
  v155[1] = @"radio";
  v154[1] = @"type";
  v154[2] = @"key";
  v155[2] = @"hasACL";
  v155[3] = &__kCFBooleanFalse;
  v154[3] = @"value";
  v154[4] = @"enabled";
  v10 = +[NSNumber numberWithBool:v6];
  v154[5] = @"axIdentifier";
  v155[4] = v10;
  v155[5] = @"aclPublicCell";
  v11 = +[NSDictionary dictionaryWithObjects:v155 forKeys:v154 count:6];
  v158[1] = v11;
  v12 = +[NSArray arrayWithObjects:v158 count:2];
  v160[2] = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:3];

  if (v7 == 1) {
    [v115 addObject:v13];
  }
  unsigned int v106 = [(BRShareSettings *)self->_settings shouldShowPermissions] & v102;
  v14 = @"publicPermission";
  if (v114) {
    v14 = @"defaultPermission";
  }
  v109 = v14;
  v99 = (void *)v13;
  if (v114) {
    BOOL v97 = [(BRShareSettings *)self->_settings defaultPermission] == 0;
  }
  else {
    BOOL v97 = 0;
  }
  v152[0] = @"title";
  v94 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v91 = [v94 localizedStringForKey:@"Permission" value:@"Permission" table:@"Localizable"];
  v153[0] = v91;
  v152[1] = @"items";
  v149[0] = @"title";
  v88 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v87 = [v88 localizedStringForKey:@"Can make changes" value:@"Can make changes" table:@"Localizable"];
  v150[0] = v87;
  v150[1] = @"radio";
  v149[1] = @"type";
  v149[2] = @"key";
  v150[2] = v109;
  v150[3] = &off_100050E40;
  v149[3] = @"value";
  v149[4] = @"enabled";
  v86 = +[NSNumber numberWithBool:v106];
  v149[5] = @"axIdentifier";
  v150[4] = v86;
  v150[5] = @"readWritePermissionCell";
  v85 = +[NSDictionary dictionaryWithObjects:v150 forKeys:v149 count:6];
  v151[0] = v85;
  v147[0] = @"title";
  v84 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v83 = [v84 localizedStringForKey:@"View only" value:@"View only" table:@"Localizable"];
  v148[0] = v83;
  v148[1] = @"radio";
  v147[1] = @"type";
  v147[2] = @"key";
  v148[2] = v109;
  v148[3] = &off_100050E58;
  v147[3] = @"value";
  v147[4] = @"enabled";
  v15 = +[NSNumber numberWithBool:v106];
  v147[5] = @"axIdentifier";
  v148[4] = v15;
  v148[5] = @"readOnlyPermissionCell";
  v16 = +[NSDictionary dictionaryWithObjects:v148 forKeys:v147 count:6];
  v151[1] = v16;
  v17 = +[NSArray arrayWithObjects:v151 count:2];
  v153[1] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v153 forKeys:v152 count:2];
  id v111 = [v18 mutableCopy];

  v19 = &BRAllowFolderSharing_ptr;
  v20 = v104;
  v21 = self;
  if (v97 || self->_hasEverBeenInMixedPermissionState)
  {
    self->_hasEverBeenInMixedPermissionState = 1;
    id v22 = objc_alloc((Class)NSAttributedString);
    v23 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v24 = [v23 localizedStringForKey:@"Some people can make changes, others can only view.", @"Some people can make changes, others can only view.", @"Localizable" value table];
    NSAttributedStringKey v145 = NSForegroundColorAttributeName;
    if (v97) {
      +[UIColor secondaryLabelColor];
    }
    else {
    v25 = +[UIColor clearColor];
    }
    v146 = v25;
    v26 = +[NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
    id v27 = [v22 initWithString:v24 attributes:v26];

    [v111 setObject:v27 forKey:@"footer"];
    v112->_permissionSectionIndex = (unint64_t)[v115 count];
  }
  if (v106) {
    [v115 addObject:v111];
  }
  BOOL v28 = (v114 & 1) != 0 || v112->_settings == 0;
  BOOL v29 = (id)[(_UIShareInvitationSettingsController *)v112 defaultPermission] == (id)3
     || v112->_settings == 0;
  if (([v104 shareViewControllerIsNotesOrRemindersOrDocSharing:v113] & v28) == 1) {
    int v30 = v102 & (v29 || v97);
  }
  else {
    int v30 = 0;
  }
  v31 = +[UIShareFeature coOwners];
  unsigned int v32 = [v31 isEnabled];

  if (v32 && v30)
  {
    v33 = [v104 editableParticipants];
    id v34 = [v33 count];

    v112->_allowInviters = [(_UIShareInvitationSettingsController *)v112 currentParticipantsState];
    if ((unint64_t)v34 < 2 || [v104 isShowAddPeople])
    {
      id v35 = [v104 shareViewControllerAllowOthersToInvite];
      CFStringRef v143 = @"items";
      v140[0] = @"title";
      id v36 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v37 = [v36 localizedStringForKey:@"Anyone can add people" value:@"Anyone can add people" table:@"Localizable"];
      v141[0] = v37;
      v141[1] = @"toggle";
      v140[1] = @"type";
      v140[2] = @"key";
      v141[2] = @"allowOthersToInvite";
      v140[3] = @"enabled";
      v38 = +[NSNumber numberWithInt:v28 & v29];
      v141[3] = v38;
      v140[4] = @"value";
      v39 = +[NSNumber numberWithBool:v35];
      v141[4] = v39;
      v140[5] = @"toggleCreationCallback";
      v40 = NSStringFromSelector("createdInviteToggle:");
      v141[5] = v40;
      v41 = +[NSDictionary dictionaryWithObjects:v141 forKeys:v140 count:6];
      v142 = v41;
      v42 = +[NSArray arrayWithObjects:&v142 count:1];
      v144 = v42;
      id v43 = +[NSDictionary dictionaryWithObjects:&v144 forKeys:&v143 count:1];

      v21 = v112;
    }
    else
    {
      v138[0] = @"title";
      v107 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v103 = [v107 localizedStringForKey:@"Adding People" value:@"Adding People" table:@"Localizable"];
      v139[0] = v103;
      v138[1] = @"items";
      v135[0] = @"title";
      v101 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v98 = [v101 localizedStringForKey:@"Anyone can add people" value:@"Anyone can add people" table:@"Localizable"];
      v136[0] = v98;
      v136[1] = @"radio";
      v135[1] = @"type";
      v135[2] = @"key";
      v136[2] = @"allowInviters";
      v136[3] = &off_100050E70;
      v135[3] = @"value";
      v135[4] = @"enabled";
      uint64_t v71 = v28 & v29;
      v95 = +[NSNumber numberWithInt:v71];
      v135[5] = @"axIdentifier";
      v136[4] = v95;
      v136[5] = @"anyoneCanInviteCell";
      v92 = +[NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:6];
      v137[0] = v92;
      v133[0] = @"title";
      v89 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v72 = [v89 localizedStringForKey:@"Only you can add people" value:@"Only you can add people" table:@"Localizable"];
      v134[0] = v72;
      v134[1] = @"radio";
      v133[1] = @"type";
      v133[2] = @"key";
      v134[2] = @"allowInviters";
      v134[3] = &off_100050E58;
      v133[3] = @"value";
      v133[4] = @"enabled";
      v73 = +[NSNumber numberWithInt:v71];
      v133[5] = @"axIdentifier";
      v134[4] = v73;
      v134[5] = @"onlyYouCanInviteCell";
      v74 = +[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:6];
      v137[1] = v74;
      v75 = +[NSArray arrayWithObjects:v137 count:2];
      v139[1] = v75;
      v76 = +[NSDictionary dictionaryWithObjects:v139 forKeys:v138 count:2];
      id v43 = [v76 mutableCopy];

      v21 = v112;
      if (v112->_allowInviters != 3)
      {
        v20 = v104;
        v19 = &BRAllowFolderSharing_ptr;
        goto LABEL_34;
      }
      id v77 = objc_alloc((Class)NSAttributedString);
      v19 = &BRAllowFolderSharing_ptr;
      v78 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v79 = [v78 localizedStringForKey:@"Some people can add others." value:@"Some people can add others." table:@"Localizable"];
      NSAttributedStringKey v131 = NSForegroundColorAttributeName;
      v80 = +[UIColor secondaryLabelColor];
      v132 = v80;
      v81 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
      id v36 = [v77 initWithString:v79 attributes:v81];

      [v43 setObject:v36 forKey:@"footer"];
      v112->_hasEverBeenInMixedAllowInvitersState = 1;
      v21 = v112;
      v112->_allowInvitersSectionIndex = (unint64_t)[v115 count];
      v20 = v104;
    }

LABEL_34:
    [v115 addObject:v43];
  }
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  v44 = [v20 viewControllerShare:v21];
  v45 = [v44 participants];

  id v46 = [v45 countByEnumeratingWithState:&v116 objects:v130 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v117;
    while (2)
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v117 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v116 + 1) + 8 * i);
        if ([v50 role] == (id)3 || objc_msgSend(v50, "role") == (id)2)
        {
          char v51 = 0;
          goto LABEL_47;
        }
      }
      id v47 = [v45 countByEnumeratingWithState:&v116 objects:v130 count:16];
      char v51 = 1;
      if (v47) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v51 = 1;
  }
LABEL_47:

  unsigned int v52 = [(BRShareSettings *)v21->_settings shouldHideCopyLink];
  if ((v51 & 1) == 0 && ((v52 | v82) & 1) == 0 && ((v114 ^ 1) & 1) == 0)
  {
    v128[0] = @"items";
    v125[0] = @"title";
    v53 = [v19[188] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v54 = [v53 localizedStringForKey:@"COPY_LINK_ACTION_TEXT" value:@"Copy Link" table:@"Localizable"];
    v126[0] = v54;
    v126[1] = @"action";
    v125[1] = @"type";
    v125[2] = @"action";
    v55 = NSStringFromSelector("copyLink:");
    v125[3] = @"celltype";
    v126[2] = v55;
    v126[3] = @"centered";
    v56 = +[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:4];
    v127 = v56;
    v57 = +[NSArray arrayWithObjects:&v127 count:1];
    v129[0] = v57;
    v128[1] = @"footer";
    v58 = [v19[188] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v59 = [v58 localizedStringForKey:@"SETTINGS_COPY_LINK_SUBTITLE" value:@"Only added people will have access." table:@"Localizable"];
    v60 = [v20 shareViewControllerItemUTI:v113];
    v61 = _CDAdaptLocalizedStringForItemType();
    v129[1] = v61;
    v62 = +[NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:2];

    v20 = v104;
    [v115 addObject:v62];
  }
  uint64_t v63 = [v20 shareViewControllerAuxiliaryActionTitle:v113];
  v64 = (void *)v63;
  char v65 = v114;
  if (!v63) {
    char v65 = 1;
  }
  if ((v65 & 1) == 0)
  {
    CFStringRef v123 = @"items";
    v120[0] = @"title";
    v120[1] = @"type";
    v121[0] = v63;
    v121[1] = @"action";
    v120[2] = @"action";
    v66 = NSStringFromSelector("auxiliaryAction:");
    v120[3] = @"celltype";
    v121[2] = v66;
    v121[3] = @"centered";
    v67 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:4];
    v122 = v67;
    v68 = +[NSArray arrayWithObjects:&v122 count:1];
    v124 = v68;
    v69 = +[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];

    [v115 addObject:v69];
  }

  return v115;
}

- (void)_sendSettingsControllerDidChange
{
  id v3 = [(_UIShareInvitationSettingsController *)self delegate];
  [v3 settingsControllerDidChange:self changedAllowInviters:0];
}

- (void)_sendSettingsControllerDidChangeAllowInviters
{
  id v3 = [(_UIShareInvitationSettingsController *)self delegate];
  [v3 settingsControllerDidChange:self changedAllowInviters:1];
}

- (void)setAllowInviters:(int64_t)a3
{
  if (self->_allowInviters != a3)
  {
    unsigned int v5 = [(_UIShareInvitationSettingsController *)self overviewControllerDelegate];
    uint64_t v6 = [v5 editableParticipants];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      if (a3 == 1) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 3;
      }
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([v12 isCurrentUser] & 1) == 0) {
            [v12 setRole:v10];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    self->_allowInviters = a3;
    [(_UIShareInvitationSettingsController *)self _sendSettingsControllerDidChangeAllowInviters];
    if (self->_hasEverBeenInMixedAllowInvitersState)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000C244;
      block[3] = &unk_10004C918;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (int64_t)currentParticipantsState
{
  v2 = [(_UIShareInvitationSettingsController *)self overviewControllerDelegate];
  id v3 = [v2 shareViewControllerCurrentParticipantsState];

  return (int64_t)v3;
}

- (void)setAllowOthersToInvite:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIShareInvitationSettingsController *)self overviewControllerDelegate];
  if ([v5 shareViewControllerAllowOthersToInvite] != v3)
  {
    [v5 shareViewControllerSetAllowOthersToInvite:v3];
    [(_UIShareInvitationSettingsController *)self _sendSettingsControllerDidChange];
  }
}

- (BOOL)allowOthersToInvite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overviewControllerDelegate);
  unsigned __int8 v3 = [WeakRetained shareViewControllerAllowOthersToInvite];

  return v3;
}

- (BOOL)shouldShowAllowInviting
{
  unsigned __int8 v3 = [(_UIShareInvitationSettingsController *)self overviewControllerDelegate];
  objc_super v4 = [v3 viewControllerShare:self];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 owner];
    unsigned __int8 v7 = [v6 isCurrentUser];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }
  unsigned int v8 = [(BRShareSettings *)self->_settings hasACL];
  settings = self->_settings;
  if (settings) {
    int v10 = v8 ^ 1;
  }
  else {
    int v10 = 0;
  }
  if ((id)[(BRShareSettings *)settings defaultPermission] == (id)3)
  {
    BOOL v11 = 1;
    if (!v8)
    {
LABEL_9:
      BOOL v12 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v11 = self->_settings == 0;
    if (!v8) {
      goto LABEL_9;
    }
  }
  BOOL v12 = [(BRShareSettings *)self->_settings defaultPermission] == 0;
LABEL_12:
  uint64_t v13 = [(_UIShareInvitationSettingsController *)self proxiedOverviewController];
  unsigned int v14 = [v3 shareViewControllerIsNotesOrRemindersOrDocSharing:v13];

  if ((v14 ^ 1 | v10)) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v7 & (v11 || v12);
  }

  return v15;
}

- (void)setDefaultPermission:(int64_t)a3
{
  if ([(BRShareSettings *)self->_settings defaultPermission] != a3)
  {
    id v5 = [(_UIShareInvitationSettingsController *)self allowInviteToggle];

    if (v5)
    {
      uint64_t v6 = [(_UIShareInvitationSettingsController *)self overviewControllerDelegate];
      if ((a3 != 2) != [v6 shareViewControllerAllowOthersToInvite]) {
        [v6 shareViewControllerSetAllowOthersToInvite:a3 != 2];
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000C6C8;
      block[3] = &unk_10004C918;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    unsigned int v7 = [(_UIShareInvitationSettingsController *)self shouldShowAllowInviting];
    [(BRShareSettings *)self->_settings setDefaultPermission:a3];
    [(_UIShareInvitationSettingsController *)self _sendSettingsControllerDidChange];
    unsigned int v8 = [(_UIShareInvitationSettingsController *)self shouldShowAllowInviting];
    if (self->_hasEverBeenInMixedPermissionState || v7 != v8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000C704;
      v10[3] = &unk_10004CC20;
      v10[4] = self;
      char v11 = v7;
      char v12 = v8;
      BOOL v13 = v5 != 0;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }
}

- (int64_t)defaultPermission
{
  return [(BRShareSettings *)self->_settings defaultPermission];
}

- (void)setPublicPermission:(int64_t)a3
{
  if ([(BRShareSettings *)self->_settings publicPermission] != a3)
  {
    [(BRShareSettings *)self->_settings setPublicPermission:a3];
    [(_UIShareInvitationSettingsController *)self _sendSettingsControllerDidChange];
  }
}

- (int64_t)publicPermission
{
  return [(BRShareSettings *)self->_settings publicPermission];
}

- (void)setHasACL:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BRShareSettings *)self->_settings hasACL] != a3)
  {
    [(BRShareSettings *)self->_settings setHasACL:v3];
    unsigned int v5 = [(BRShareSettings *)self->_settings hasACL];
    settings = self->_settings;
    if (v5)
    {
      [(BRShareSettings *)self->_settings setDefaultPermission:[(BRShareSettings *)settings publicPermission]];
    }
    else
    {
      int64_t v7 = [(BRShareSettings *)settings defaultPermission];
      unsigned int v8 = self->_settings;
      if (v7)
      {
        uint64_t v9 = [(BRShareSettings *)v8 defaultPermission];
        unsigned int v8 = self->_settings;
      }
      else
      {
        uint64_t v9 = 3;
      }
      [(BRShareSettings *)v8 setPublicPermission:v9];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C9CC;
    block[3] = &unk_10004C918;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)hasACL
{
  return [(BRShareSettings *)self->_settings hasACL];
}

- (void)setSettings:(id)a3
{
  if (self->_settings != a3)
  {
    objc_super v4 = (BRShareSettings *)[a3 copy];
    settings = self->_settings;
    self->_settings = v4;

    [(_UIShareInvitationSettingsController *)self updateSections];
  }
}

- (void)copyLink:(id)a3
{
  objc_super v4 = [(_UIShareInvitationSettingsController *)self overviewControllerDelegate];
  unsigned int v5 = [(_UIShareInvitationSettingsController *)self proxiedOverviewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000CB2C;
  v6[3] = &unk_10004CAC8;
  v6[4] = self;
  [v4 shareViewControllerCopyShareURL:v5 completion:v6];
}

- (void)auxiliaryAction:(id)a3
{
  objc_super v4 = [(_UIShareInvitationSettingsController *)self overviewControllerDelegate];
  unsigned int v5 = [(_UIShareInvitationSettingsController *)self proxiedOverviewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000CCA0;
  v6[3] = &unk_10004C918;
  v6[4] = self;
  [v4 shareViewControllerPerformAuxiliaryAction:v5 completion:v6];
}

- (_UIShareInvitationSettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UIShareInvitationSettingsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIShareOverviewControllerDelegate)overviewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overviewControllerDelegate);

  return (_UIShareOverviewControllerDelegate *)WeakRetained;
}

- (void)setOverviewControllerDelegate:(id)a3
{
}

- (_UIShareOverviewController)proxiedOverviewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxiedOverviewController);

  return (_UIShareOverviewController *)WeakRetained;
}

- (void)setProxiedOverviewController:(id)a3
{
}

- (BRShareSettings)settings
{
  return self->_settings;
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

- (UISwitch)allowInviteToggle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_allowInviteToggle);

  return (UISwitch *)WeakRetained;
}

- (void)setAllowInviteToggle:(id)a3
{
}

- (int64_t)allowInviters
{
  return self->_allowInviters;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_allowInviteToggle);
  objc_storeStrong((id *)&self->_staticTableDataSource, 0);
  objc_storeStrong((id *)&self->_staticTableView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_proxiedOverviewController);
  objc_destroyWeak((id *)&self->_overviewControllerDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end