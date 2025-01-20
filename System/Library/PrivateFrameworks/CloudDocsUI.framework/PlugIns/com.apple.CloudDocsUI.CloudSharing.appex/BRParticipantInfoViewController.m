@interface BRParticipantInfoViewController
- (BOOL)allowedToInvite;
- (BOOL)isAllowedToInvite:(id)a3 share:(id)a4;
- (BRParticipantInfoViewController)initWithParticipantContact:(id)a3;
- (BRParticipantInfoViewControllerDelegate)delegate;
- (CKShareParticipantContact)contact;
- (UISwitch)allowInviteToggle;
- (UITableView)staticTableView;
- (_UIShareTableStaticDataSource)staticTableDataSource;
- (id)_sections;
- (int64_t)participantPermission;
- (void)_performParticipantAction:(id)a3;
- (void)createdInviteToggle:(id)a3;
- (void)leaveShare:(id)a3;
- (void)removeAccess:(id)a3;
- (void)setAllowInviteToggle:(id)a3;
- (void)setAllowedToInvite:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setParticipantPermission:(int64_t)a3;
- (void)setStaticTableDataSource:(id)a3;
- (void)setStaticTableView:(id)a3;
- (void)toggleParticipantAllowedToInvite:(id)a3;
- (void)updateSections;
@end

@implementation BRParticipantInfoViewController

- (BRParticipantInfoViewController)initWithParticipantContact:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BRParticipantInfoViewController;
  v5 = [(BRParticipantInfoViewController *)&v31 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(BRParticipantInfoViewController *)v5 setContact:v4];
    id v7 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(BRParticipantInfoViewController *)v6 setStaticTableView:v7];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(BRParticipantInfoViewController *)v6 view];
    [v8 addSubview:v6->_staticTableView];

    v9 = [(BRParticipantInfoViewController *)v6 view];
    v28 = [v9 bottomAnchor];
    v27 = [v7 bottomAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v34[0] = v26;
    v25 = [v9 rightAnchor];
    v24 = [v7 rightAnchor];
    v10 = [v25 constraintEqualToAnchor:v24];
    v34[1] = v10;
    [v9 leftAnchor];
    v11 = id v30 = v4;
    v12 = [v7 leftAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v34[2] = v13;
    v29 = v9;
    v14 = [v9 topAnchor];
    v15 = [v7 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v34[3] = v16;
    v17 = +[NSArray arrayWithObjects:v34 count:4];
    +[NSLayoutConstraint activateConstraints:v17];

    v18 = [[_UIShareTableStaticDataSource alloc] initWithTableView:v7];
    [(BRParticipantInfoViewController *)v6 setStaticTableDataSource:v18];

    v19 = [(BRParticipantInfoViewController *)v6 staticTableDataSource];
    [v19 setDefaultTarget:v6];

    [v7 setRowHeight:UITableViewAutomaticDimension];
    [v7 setEstimatedRowHeight:44.0];
    [v7 setSectionHeaderHeight:0.0];
    v20 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v21 = [v20 localizedStringForKey:@"PARTICIPANT_INFO_TITLE_TEXT" value:@"Info" table:@"Localizable"];
    [(BRParticipantInfoViewController *)v6 setTitle:v21];

    id v4 = v30;
    [v7 registerClass:objc_opt_class() forCellReuseIdentifier:off_100061C08];
    [v7 registerClass:objc_opt_class() forCellReuseIdentifier:off_100061A18];
    [(BRParticipantInfoViewController *)v6 updateSections];
    v22 = cdui_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v30;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[INFO] Displaying info view controller for participant %@", buf, 0xCu);
    }
  }
  return v6;
}

- (void)updateSections
{
  v3 = [(BRParticipantInfoViewController *)self _sections];
  id v4 = [(BRParticipantInfoViewController *)self staticTableDataSource];
  [v4 setSections:v3];

  id v5 = [(BRParticipantInfoViewController *)self staticTableView];
  [v5 reloadData];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(BRParticipantInfoViewController *)self updateSections];
}

- (void)_performParticipantAction:(id)a3
{
  id v4 = [(BRParticipantInfoViewController *)self contact];
  id v5 = [v4 participant];
  v6 = [v5 userIdentity];
  id v7 = [v6 lookupInfo];
  v8 = [v7 emailAddress];

  v9 = [(BRParticipantInfoViewController *)self contact];
  v10 = [v9 participant];
  v11 = [v10 userIdentity];
  v12 = [v11 lookupInfo];
  v13 = v12;
  if (v8)
  {
    v14 = [v12 emailAddress];
    +[NSString stringWithFormat:@"mailto:%@", v14];
  }
  else
  {
    v14 = [v12 phoneNumber];
    +[NSString stringWithFormat:@"tel://%@", v14];
  v15 = };
  id v20 = +[NSURL URLWithString:v15];

  v16 = +[LSApplicationWorkspace defaultWorkspace];
  [v16 openURL:v20];
  v17 = [(BRParticipantInfoViewController *)self staticTableView];
  v18 = [(BRParticipantInfoViewController *)self staticTableView];
  v19 = [v18 indexPathForSelectedRow];
  [v17 deselectRowAtIndexPath:v19 animated:1];
}

- (BOOL)isAllowedToInvite:(id)a3 share:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BRParticipantInfoViewController *)self delegate];
  unsigned int v9 = [v8 itemIsShareRoot];

  if (v9)
  {
    v10 = [v7 owner];
    unsigned __int8 v11 = [v10 isEqual:v6];

    BOOL v12 = [v6 role] == (id)2 && objc_msgSend(v6, "permission") == (id)3;
    char v13 = v11 | v12;
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)_sections
{
  v3 = [(BRParticipantInfoViewController *)self delegate];
  id v4 = +[NSMutableArray array];
  id v5 = [v3 viewControllerShare:self];
  unsigned int v96 = [v3 itemIsShareRoot];
  if (!v5) {
    goto LABEL_44;
  }
  id v6 = objc_opt_new();
  id v7 = [(BRParticipantInfoViewController *)self contact];
  v8 = [v7 contact];

  unsigned int v9 = &BRAllowFolderSharing_ptr;
  v95 = v4;
  v97 = v5;
  v98 = v3;
  if (v8)
  {
    v10 = objc_opt_new();
    unsigned __int8 v11 = [(BRParticipantInfoViewController *)self contact];
    BOOL v12 = [v11 contact];
    [v10 setContact:v12];

    char v13 = [(BRParticipantInfoViewController *)self contact];
    v14 = [v13 participant];
    v15 = [v13 contact];
    if (v15)
    {
      v16 = [v13 contact];
      v17 = +[CNContactFormatter stringFromContact:v16 style:0];
    }
    else
    {
      v17 = 0;
    }

    if (![v17 length])
    {
      v18 = [v14 userIdentity];
      v19 = [v18 nameComponents];
      uint64_t v20 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v19 style:1 options:0];

      v17 = (void *)v20;
    }
    if ([v17 length])
    {
      if ([v14 type] == (id)1)
      {
        v21 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v22 = v21;
        CFStringRef v23 = @"PARTICIPANT_OWNER_TEXT";
        CFStringRef v24 = @"%@ (Owner)";
      }
      else
      {
        if (![v14 isCurrentUser])
        {
          id v25 = v17;
          goto LABEL_16;
        }
        v21 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v22 = v21;
        CFStringRef v23 = @"PARTICIPANT_ME_TEXT";
        CFStringRef v24 = @"%@ (Me)";
      }
      v26 = [v21 localizedStringForKey:v23 value:v24 table:@"Localizable"];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v17);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v25 = 0;
    }
LABEL_16:

    [v10 setTitle:v25];
    v27 = [v10 title];

    unsigned int v9 = &BRAllowFolderSharing_ptr;
    if (v27)
    {
      v125[0] = @"value";
      v125[1] = @"celltype";
      v126[0] = v10;
      v126[1] = off_100061A18;
      v28 = +[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:2];
      [v6 addObject:v28];
    }
    id v4 = v95;
    v3 = v98;
  }
  v29 = [(BRParticipantInfoViewController *)self contact];
  id v30 = [v29 participant];
  objc_super v31 = [v30 userIdentity];
  v32 = [v31 lookupInfo];

  id v33 = [v32 emailAddress];
  if (v33)
  {
  }
  else
  {
    v34 = [v32 phoneNumber];

    if (!v34) {
      goto LABEL_23;
    }
  }
  v123[0] = @"value";
  v35 = [(BRParticipantInfoViewController *)self contact];
  v124[0] = v35;
  v124[1] = @"action";
  v123[1] = @"type";
  v123[2] = @"celltype";
  v124[2] = off_100061C08;
  v123[3] = @"action";
  v36 = NSStringFromSelector("_performParticipantAction:");
  v124[3] = v36;
  v37 = [v9[190] dictionaryWithObjects:v124 forKeys:v123 count:4];
  [v6 addObject:v37];

LABEL_23:
  v121[0] = @"hheight";
  v121[1] = @"items";
  v122[0] = &off_100050EC8;
  v122[1] = v6;
  v38 = [v9[190] dictionaryWithObjects:v122 forKeys:v121 count:2];
  [v4 addObject:v38];

  unsigned __int8 v39 = [v3 participantInfoViewControllerAllowedPermissions:self];
  id v5 = v97;
  v40 = [v97 owner];
  unsigned int v41 = [v40 isCurrentUser];

  v42 = [v97 currentUserParticipant];
  unsigned int v43 = [(BRParticipantInfoViewController *)self isAllowedToInvite:v42 share:v97];

  v44 = &selRef_auxiliaryAction_;
  if (v43)
  {
    v45 = [(CKShareParticipantContact *)self->_contact participant];
    if (([v45 isCurrentUser] & 1) == 0)
    {
      id v46 = [v97 publicPermission];

      BOOL v47 = v46 == (id)1;
      v44 = &selRef_auxiliaryAction_;
      id v4 = v95;
      if (!v47) {
        goto LABEL_41;
      }
      v48 = [(CKShareParticipantContact *)self->_contact participant];
      id v49 = [v48 permission];

      v50 = [(CKShareParticipantContact *)self->_contact participant];
      [(BRParticipantInfoViewController *)self setAllowedToInvite:[(BRParticipantInfoViewController *)self isAllowedToInvite:v50 share:v97]];

      if (v41)
      {
        id v83 = v49;
        v119[0] = @"title";
        v93 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v91 = [v93 localizedStringForKey:@"Permission" value:@"Permission" table:@"Localizable"];
        v119[1] = @"items";
        v120[0] = v91;
        v116[0] = @"title";
        v89 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v88 = [v89 localizedStringForKey:@"Can make changes" value:@"Can make changes" table:@"Localizable"];
        v117[0] = v88;
        v117[1] = @"radio";
        v116[1] = @"type";
        v116[2] = @"key";
        v117[2] = @"participantPermission";
        v117[3] = &off_100050E88;
        v116[3] = @"value";
        v116[4] = @"enabled";
        if ((v39 & 0xC) != 0) {
          uint64_t v51 = 0;
        }
        else {
          uint64_t v51 = v96;
        }
        v87 = +[NSNumber numberWithInt:v51];
        v117[4] = v87;
        v86 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:5];
        v118[0] = v86;
        v114[0] = @"title";
        v85 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v84 = [v85 localizedStringForKey:@"View only" value:@"View only" table:@"Localizable"];
        v115[0] = v84;
        v115[1] = @"radio";
        v114[1] = @"type";
        v114[2] = @"key";
        v114[3] = @"value";
        v115[2] = @"participantPermission";
        v115[3] = &off_100050EA0;
        v114[4] = @"enabled";
        v52 = +[NSNumber numberWithInt:v51];
        v115[4] = v52;
        v53 = +[NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:5];
        v118[1] = v53;
        v54 = +[NSArray arrayWithObjects:v118 count:2];
        v120[1] = v54;
        uint64_t v55 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:2];

        id v4 = v95;
        if ((v39 & 0xC) == 0) {
          [v95 addObject:v55];
        }
        v94 = (void *)v55;
        unsigned int v56 = [v98 shareViewControllerIsNotesOrRemindersOrDocSharing];
        v57 = +[UIShareFeature coOwners];
        unsigned int v58 = [v57 isEnabled];

        if (v58 && v56)
        {
          CFStringRef v112 = @"items";
          v109[0] = @"title";
          v92 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
          v90 = [v92 localizedStringForKey:@"ALLOWED_TO_INVITE_PARTICIPANT_ACTION_TEXT" value:@"Can add people" table:@"Localizable"];
          v110[0] = v90;
          v110[1] = @"toggle";
          v109[1] = @"type";
          v109[2] = @"key";
          v110[2] = @"allowedToInvite";
          v109[3] = @"action";
          v59 = NSStringFromSelector("toggleParticipantAllowedToInvite:");
          v110[3] = v59;
          v109[4] = @"toggleCreationCallback";
          v60 = NSStringFromSelector("createdInviteToggle:");
          v110[4] = v60;
          v109[5] = @"enabled";
          v61 = +[NSNumber numberWithBool:v83 == (id)3];
          v110[5] = v61;
          v62 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:6];
          v111 = v62;
          v63 = +[NSArray arrayWithObjects:&v111 count:1];
          v113 = v63;
          v64 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];

          id v4 = v95;
          [v95 addObject:v64];
        }
        id v5 = v97;
      }
      v65 = [v5 owner];
      v66 = [(CKShareParticipantContact *)self->_contact participant];
      unsigned __int8 v67 = [v65 isEqual:v66];

      v44 = &selRef_auxiliaryAction_;
      if (!v96 || (v67 & 1) != 0) {
        goto LABEL_41;
      }
      CFStringRef v107 = @"items";
      v104[0] = @"title";
      v68 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v69 = [v68 localizedStringForKey:@"REMOVE_ACCESS_ACTION_TEXT" value:@"Remove Access" table:@"Localizable"];
      v105[0] = v69;
      v105[1] = @"action";
      v104[1] = @"type";
      v104[2] = @"action";
      v70 = NSStringFromSelector("removeAccess:");
      v105[2] = v70;
      v105[3] = @"centered";
      v104[3] = @"celltype";
      v104[4] = @"destructive";
      v105[4] = &__kCFBooleanTrue;
      v71 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:5];
      v106 = v71;
      v72 = +[NSArray arrayWithObjects:&v106 count:1];
      v108 = v72;
      +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      v45 = v73 = v4;

      v44 = &selRef_auxiliaryAction_;
      id v5 = v97;

      [v73 addObject:v45];
    }

    id v4 = v95;
  }
LABEL_41:
  v3 = v98;
  if ((v41 & 1) == 0)
  {
    v74 = [*(id *)((char *)&self->super.super.super.isa + *((int *)v44 + 249)) participant];
    unsigned int v75 = [v74 isCurrentUser] & v96;

    if (v75 == 1)
    {
      CFStringRef v102 = @"items";
      v99[0] = @"title";
      v76 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v77 = [v76 localizedStringForKey:@"LEAVE_SHARE_ACTION_TEXT" value:@"Remove Me" table:@"Localizable"];
      v100[0] = v77;
      v100[1] = @"action";
      v99[1] = @"type";
      v99[2] = @"action";
      v78 = NSStringFromSelector("leaveShare:");
      v100[2] = v78;
      v100[3] = @"centered";
      v99[3] = @"celltype";
      v99[4] = @"destructive";
      v100[4] = &__kCFBooleanTrue;
      v79 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:5];
      v101 = v79;
      v80 = +[NSArray arrayWithObjects:&v101 count:1];
      v103 = v80;
      v81 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];

      [v4 addObject:v81];
      id v5 = v97;
    }
  }
LABEL_44:

  return v4;
}

- (int64_t)participantPermission
{
  v2 = [(CKShareParticipantContact *)self->_contact participant];
  id v3 = [v2 permission];

  return (int64_t)v3;
}

- (void)setParticipantPermission:(int64_t)a3
{
  id v5 = [(CKShareParticipantContact *)self->_contact participant];
  if ([v5 permission] != (id)a3)
  {
    id v6 = [(BRParticipantInfoViewController *)self allowInviteToggle];

    if (!v6) {
      goto LABEL_9;
    }
    id v5 = [(BRParticipantInfoViewController *)self allowInviteToggle];
    id v7 = [(CKShareParticipantContact *)self->_contact participant];
    v8 = v7;
    if (a3 == 2) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }
    [v7 setRole:v9];

    if (v5)
    {
      [v5 setEnabled:a3 != 2];
      [v5 setUserInteractionEnabled:a3 != 2];
      [v5 setOn:a3 != 2];
    }
  }

LABEL_9:
  v10 = [(CKShareParticipantContact *)self->_contact participant];
  [v10 setPermission:a3];

  unsigned __int8 v11 = cdui_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    BOOL v12 = [(CKShareParticipantContact *)self->_contact participant];
    int v14 = 134217984;
    id v15 = [v12 permission];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] participant permissions set to %li", (uint8_t *)&v14, 0xCu);
  }
  char v13 = [(BRParticipantInfoViewController *)self delegate];
  [v13 participantInfoViewControllerDidChangeParticipant:self];
}

- (void)toggleParticipantAllowedToInvite:(id)a3
{
  if ([a3 isOn]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  id v5 = [(CKShareParticipantContact *)self->_contact participant];
  [v5 setRole:v4];

  id v6 = cdui_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(CKShareParticipantContact *)self->_contact participant];
    int v9 = 134217984;
    id v10 = [v7 role];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] participant allowedToInvite (role) set to %li", (uint8_t *)&v9, 0xCu);
  }
  v8 = [(BRParticipantInfoViewController *)self delegate];
  [v8 participantInfoViewControllerDidChangeParticipant:self];
}

- (void)createdInviteToggle:(id)a3
{
  id v6 = a3;
  -[BRParticipantInfoViewController setAllowInviteToggle:](self, "setAllowInviteToggle:");
  uint64_t v4 = [(CKShareParticipantContact *)self->_contact participant];
  id v5 = [v4 permission];

  if (v5 == (id)2) {
    [v6 setUserInteractionEnabled:0];
  }
}

- (void)removeAccess:(id)a3
{
  uint64_t v4 = cdui_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(BRParticipantInfoViewController *)self contact];
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] Remove requested for participant %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(BRParticipantInfoViewController *)self delegate];
  [v6 participantInfoViewControllerRemoveParticipant:self];
}

- (void)leaveShare:(id)a3
{
  uint64_t v4 = cdui_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(BRParticipantInfoViewController *)self contact];
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] Leave share requested for participant %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(BRParticipantInfoViewController *)self delegate];
  [v6 participantInfoViewControllerLeaveShare:self];
}

- (CKShareParticipantContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (BRParticipantInfoViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BRParticipantInfoViewControllerDelegate *)WeakRetained;
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

- (BOOL)allowedToInvite
{
  return self->_allowedToInvite;
}

- (void)setAllowedToInvite:(BOOL)a3
{
  self->_allowedToInvite = a3;
}

- (UISwitch)allowInviteToggle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_allowInviteToggle);

  return (UISwitch *)WeakRetained;
}

- (void)setAllowInviteToggle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_allowInviteToggle);
  objc_storeStrong((id *)&self->_staticTableDataSource, 0);
  objc_storeStrong((id *)&self->_staticTableView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end