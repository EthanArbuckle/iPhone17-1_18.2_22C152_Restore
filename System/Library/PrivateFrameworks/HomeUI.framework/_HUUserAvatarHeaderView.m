@interface _HUUserAvatarHeaderView
- (ACAccountStore)accountStore;
- (HUContactView)contactView;
- (HUMediaAccountDelegate)mediaAccountDelegate;
- (HUMultiUserTokenFixTableView)multiUserTokenFixHeaderView;
- (HUSplitAccountHeaderTableView)splitAccountHeaderView;
- (NAFuture)mediaAccountFuture;
- (NSArray)layoutConstraints;
- (NSAttributedString)message;
- (_HUUserAvatarHeaderView)initWithUser:(id)a3 home:(id)a4 delegate:(id)a5;
- (id)_keyDescriptors;
- (void)dealloc;
- (void)dismissMultiUserTokenFixUI;
- (void)dismissSplitAccountView;
- (void)presentMultiUserTokenFixUIForMediaAccount:(id)a3 inHome:(id)a4;
- (void)setAccountStore:(id)a3;
- (void)setAccounts:(id)a3 forHome:(id)a4;
- (void)setLayoutConstraints:(id)a3;
- (void)setMediaAccountDelegate:(id)a3;
- (void)setMediaAccountFuture:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMultiUserTokenFixHeaderView:(id)a3;
- (void)setSplitAccountHeaderView:(id)a3;
- (void)showSplitAccountViewIfNeeded;
@end

@implementation _HUUserAvatarHeaderView

- (_HUUserAvatarHeaderView)initWithUser:(id)a3 home:(id)a4 delegate:(id)a5
{
  v66[4] = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v58 = a4;
  id obj = a5;
  v65.receiver = self;
  v65.super_class = (Class)_HUUserAvatarHeaderView;
  v8 = [(_HUUserAvatarHeaderView *)&v65 initWithReuseIdentifier:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mediaAccountDelegate, obj);
    v10 = objc_alloc_init(HUContactView);
    contactView = v9->_contactView;
    v9->_contactView = v10;

    [(HUContactView *)v9->_contactView setContactNameFontTextStyle:*MEMORY[0x1E4F438B8]];
    v59 = objc_msgSend(v58, "hf_handleForUser:", v57);
    if (v59)
    {
      v12 = [MEMORY[0x1E4F69090] defaultStore];
      v13 = [(_HUUserAvatarHeaderView *)v9 _keyDescriptors];
      v14 = [v12 contactForUserHandle:v59 withKeys:v13];
      [(HUContactView *)v9->_contactView setContact:v14];
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F1B8F8];
      v16 = [v57 name];
      v12 = [v15 contactWithDisplayName:v16 emailOrPhoneNumber:0];

      [(HUContactView *)v9->_contactView setContact:v12];
    }

    if (![v59 type])
    {
      v17 = objc_opt_new();
      v18 = [v59 userID];

      if (v18)
      {
        v19 = [v59 userID];
        [v17 addObject:v19];
      }
      [(HUContactView *)v9->_contactView setAccounts:v17];
      v20 = [MEMORY[0x1E4F68F00] sharedInstance];
      v21 = [v58 uniqueIdentifier];
      v22 = [v21 UUIDString];
      v23 = [v20 mediaAccountForHomeIdentifier:v22];

      if (v23)
      {
        [v17 addObject:v23];
        [(HUContactView *)v9->_contactView setAccounts:v17];
      }
      else
      {
        v24 = [MEMORY[0x1E4F68F00] sharedInstance];
        uint64_t v25 = [v24 executeHomeMediaAccountFetchForHome:v58];
        mediaAccountFuture = v9->_mediaAccountFuture;
        v9->_mediaAccountFuture = (NAFuture *)v25;

        objc_initWeak(&location, v9);
        v27 = v9->_mediaAccountFuture;
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __54___HUUserAvatarHeaderView_initWithUser_home_delegate___block_invoke;
        v60[3] = &unk_1E638C168;
        objc_copyWeak(&v63, &location);
        id v61 = v58;
        id v62 = v17;
        id v28 = (id)[(NAFuture *)v27 addCompletionBlock:v60];

        objc_destroyWeak(&v63);
        objc_destroyWeak(&location);
      }
    }
    v29 = [(_HUUserAvatarHeaderView *)v9 contentView];
    objc_msgSend(v29, "naui_addAutoLayoutSubview:", v9->_contactView);

    v55 = [(_HUUserAvatarHeaderView *)v9 contentView];
    v53 = [v55 topAnchor];
    v54 = [(_HUUserAvatarHeaderView *)v9 contactView];
    v52 = [v54 topAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:-20.0];
    v66[0] = v51;
    v50 = [(_HUUserAvatarHeaderView *)v9 contentView];
    v49 = [v50 layoutMarginsGuide];
    v47 = [v49 leadingAnchor];
    v48 = [(_HUUserAvatarHeaderView *)v9 contactView];
    v46 = [v48 leadingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v66[1] = v45;
    v44 = [(_HUUserAvatarHeaderView *)v9 contentView];
    v43 = [v44 layoutMarginsGuide];
    v42 = [v43 trailingAnchor];
    v30 = [(_HUUserAvatarHeaderView *)v9 contactView];
    v31 = [v30 trailingAnchor];
    v32 = [v42 constraintEqualToAnchor:v31];
    v66[2] = v32;
    v33 = [(_HUUserAvatarHeaderView *)v9 contentView];
    v34 = [v33 bottomAnchor];
    v35 = [(_HUUserAvatarHeaderView *)v9 contactView];
    v36 = [v35 bottomAnchor];
    v37 = [v34 constraintEqualToAnchor:v36 constant:20.0];
    v66[3] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:4];
    [(_HUUserAvatarHeaderView *)v9 setLayoutConstraints:v38];

    v39 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [(_HUUserAvatarHeaderView *)v9 layoutConstraints];
    [v39 activateConstraints:v40];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(_HUUserAvatarHeaderView *)self mediaAccountFuture];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)_HUUserAvatarHeaderView;
  [(_HUUserAvatarHeaderView *)&v4 dealloc];
}

- (void)presentMultiUserTokenFixUIForMediaAccount:(id)a3 inHome:(id)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    v11 = [v8 currentUser];
    *(_DWORD *)buf = 138413058;
    v95 = v10;
    __int16 v96 = 2112;
    id v97 = v7;
    __int16 v98 = 2112;
    v99 = v11;
    __int16 v100 = 2112;
    id v101 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@ MutilUser Token Fix needed for account [%@], user [%@], in Home [%@]", buf, 0x2Au);
  }
  v12 = [HUMultiUserTokenFixTableView alloc];
  v13 = [(_HUUserAvatarHeaderView *)self mediaAccountDelegate];
  v14 = -[HUMultiUserTokenFixTableView initWithFrame:mediaAccount:home:delegate:](v12, "initWithFrame:mediaAccount:home:delegate:", v7, v8, v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_HUUserAvatarHeaderView *)self setMultiUserTokenFixHeaderView:v14];

  v15 = [(_HUUserAvatarHeaderView *)self contentView];
  v16 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  objc_msgSend(v15, "naui_addAutoLayoutSubview:", v16);

  v17 = (void *)MEMORY[0x1E4F28DC8];
  v18 = [(_HUUserAvatarHeaderView *)self layoutConstraints];
  [v17 deactivateConstraints:v18];

  v92 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  v90 = [v92 leadingAnchor];
  v91 = [(_HUUserAvatarHeaderView *)self contentView];
  v89 = [v91 leadingAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v93[0] = v88;
  v87 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  v85 = [v87 trailingAnchor];
  v86 = [(_HUUserAvatarHeaderView *)self contentView];
  v84 = [v86 trailingAnchor];
  v82 = [v85 constraintEqualToAnchor:v84];
  v93[1] = v82;
  v80 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  v78 = [v80 topAnchor];
  v79 = [(_HUUserAvatarHeaderView *)self contentView];
  v77 = [v79 topAnchor];
  v76 = [v78 constraintEqualToAnchor:v77 constant:-20.0];
  v93[2] = v76;
  v75 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  v72 = [v75 heightAnchor];
  v73 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  v74 = [MEMORY[0x1E4F42D90] mainScreen];
  [v74 bounds];
  [v73 tableViewHeightForWidth:v19];
  v71 = objc_msgSend(v72, "constraintEqualToConstant:");
  v93[3] = v71;
  v70 = [(_HUUserAvatarHeaderView *)self contactView];
  v68 = [v70 leadingAnchor];
  v69 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  v67 = [v69 leadingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v93[4] = v66;
  objc_super v65 = [(_HUUserAvatarHeaderView *)self contactView];
  id v63 = [v65 trailingAnchor];
  v64 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  id v62 = [v64 trailingAnchor];
  id v61 = [v63 constraintEqualToAnchor:v62];
  v93[5] = v61;
  v60 = [(_HUUserAvatarHeaderView *)self contactView];
  v59 = [v60 topAnchor];
  v20 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  v21 = [v20 bottomAnchor];
  v22 = [v59 constraintEqualToAnchor:v21 constant:20.0];
  v93[6] = v22;
  v23 = [(_HUUserAvatarHeaderView *)self contentView];
  v24 = [v23 bottomAnchor];
  [(_HUUserAvatarHeaderView *)self contactView];
  uint64_t v25 = v83 = v7;
  [v25 bottomAnchor];
  v26 = v81 = v8;
  v27 = [v24 constraintEqualToAnchor:v26 constant:20.0];
  v93[7] = v27;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:8];
  [(_HUUserAvatarHeaderView *)self setLayoutConstraints:v28];

  v29 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [(_HUUserAvatarHeaderView *)self layoutConstraints];
  [v29 activateConstraints:v30];

  v31 = [(_HUUserAvatarHeaderView *)self contentView];
  [v31 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  v40 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  v41 = [MEMORY[0x1E4F42D90] mainScreen];
  [v41 bounds];
  [v40 tableViewHeightForWidth:v42];
  double v44 = v39 + v43 + -20.0;

  v45 = [(_HUUserAvatarHeaderView *)self contentView];
  objc_msgSend(v45, "setFrame:", v33, v35, v37, v44);

  [(_HUUserAvatarHeaderView *)self frame];
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  v54 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  v55 = [MEMORY[0x1E4F42D90] mainScreen];
  [v55 bounds];
  [v54 tableViewHeightForWidth:v56];
  double v58 = v53 + v57 + -20.0;

  -[_HUUserAvatarHeaderView setFrame:](self, "setFrame:", v47, v49, v51, v58);
}

- (void)dismissMultiUserTokenFixUI
{
  uint64_t v3 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    v5 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
    [v5 alpha];
    double v7 = v6;

    if (v7 == 1.0)
    {
      id v8 = [(_HUUserAvatarHeaderView *)self contentView];
      [v8 frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      v15 = [(_HUUserAvatarHeaderView *)self contentView];
      [v15 frame];
      double v17 = v16;
      v18 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
      [v18 tableViewHeightForWidth:v14];
      double v20 = v17 - v19 + 20.0;

      v21 = [(_HUUserAvatarHeaderView *)self contentView];
      objc_msgSend(v21, "setFrame:", v10, v12, v14, v20);

      [(_HUUserAvatarHeaderView *)self frame];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      [(_HUUserAvatarHeaderView *)self frame];
      double v29 = v28;
      v30 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
      [v30 tableViewHeightForWidth:v27];
      double v32 = v29 - v31 + 20.0;

      -[_HUUserAvatarHeaderView setFrame:](self, "setFrame:", v23, v25, v27, v32);
      double v33 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
      double v34 = [v33 heightAnchor];
      double v35 = [v34 constraintEqualToConstant:20.0];
      [v35 setActive:1];

      double v36 = [(_HUUserAvatarHeaderView *)self multiUserTokenFixHeaderView];
      [v36 setAlpha:0.0];

      [(_HUUserAvatarHeaderView *)self layoutIfNeeded];
    }
  }
}

- (void)setAccounts:(id)a3 forHome:(id)a4
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  contactView = self->_contactView;
  id v9 = a3;
  [(HUContactView *)contactView setAccounts:v9];
  double v10 = [(_HUUserAvatarHeaderView *)self accountStore];
  double v11 = objc_msgSend(v10, "ams_activeiTunesAccount");
  double v12 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_131);

  double v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v109 = v14;
    __int16 v110 = 1024;
    *(_DWORD *)v111 = [MEMORY[0x1E4F69758] isAMac];
    *(_WORD *)&v111[4] = 1024;
    *(_DWORD *)&v111[6] = [v7 isMultiUserEnabled];
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@ isThisMac = %d, is MU Enabled = [%d] ", buf, 0x18u);
  }
  v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = NSStringFromSelector(a2);
    double v17 = objc_msgSend(v11, "aa_altDSID");
    objc_msgSend(v12, "aa_altDSID");
    v18 = a2;
    double v19 = v11;
    id v20 = v7;
    double v22 = v21 = v12;
    *(_DWORD *)buf = 138413570;
    v109 = v16;
    __int16 v110 = 2112;
    *(void *)v111 = v19;
    *(_WORD *)&v111[8] = 2112;
    v112 = v17;
    __int16 v113 = 2112;
    v114 = v21;
    __int16 v115 = 2112;
    v116 = v22;
    __int16 v117 = 2112;
    id v118 = v20;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@ Active Media Account - [%@] with DSID - [%@] on this iOS device.  Fetched ams_iTunesAccount - [%@] with DSID - [%@] for Home [%@]", buf, 0x3Eu);

    double v12 = v21;
    id v7 = v20;
    double v11 = v19;
    a2 = v18;
  }
  if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0
    && [v7 isMultiUserEnabled]
    && v11
    && (objc_msgSend(v11, "aa_altDSID"),
        double v23 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "aa_altDSID"),
        double v24 = objc_claimAutoreleasedReturnValue(),
        char v25 = [v23 isEqualToString:v24],
        v24,
        v23,
        (v25 & 1) == 0))
  {
    v105 = v12;
    v106 = v10;
    double v29 = HFLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v109 = v30;
      _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "%@ Found Accounts are Split. Displaying the Split account UI", buf, 0xCu);
    }
    double v31 = [HUSplitAccountHeaderTableView alloc];
    double v32 = [(_HUUserAvatarHeaderView *)self mediaAccountDelegate];
    double v33 = -[HUSplitAccountHeaderTableView initWithFrame:mediaAccount:home:delegate:](v31, "initWithFrame:mediaAccount:home:delegate:", v11, v7, v32, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(_HUUserAvatarHeaderView *)self setSplitAccountHeaderView:v33];

    double v34 = [(_HUUserAvatarHeaderView *)self contentView];
    double v35 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    objc_msgSend(v34, "naui_addAutoLayoutSubview:", v35);

    double v36 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    [v36 setAlpha:0.0];

    double v37 = (void *)MEMORY[0x1E4F28DC8];
    double v38 = [(_HUUserAvatarHeaderView *)self layoutConstraints];
    [v37 deactivateConstraints:v38];

    v104 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    uint64_t v102 = [v104 leadingAnchor];
    v103 = [(_HUUserAvatarHeaderView *)self contentView];
    id v101 = [v103 leadingAnchor];
    __int16 v100 = [v102 constraintEqualToAnchor:v101];
    v107[0] = v100;
    v99 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    id v97 = [v99 trailingAnchor];
    __int16 v98 = [(_HUUserAvatarHeaderView *)self contentView];
    __int16 v96 = [v98 trailingAnchor];
    v95 = [v97 constraintEqualToAnchor:v96];
    v107[1] = v95;
    v94 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    v92 = [v94 topAnchor];
    v93 = [(_HUUserAvatarHeaderView *)self contentView];
    v91 = [v93 topAnchor];
    v90 = [v92 constraintEqualToAnchor:v91 constant:-20.0];
    v107[2] = v90;
    v89 = [(_HUUserAvatarHeaderView *)self contactView];
    v87 = [v89 leadingAnchor];
    v88 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    v86 = [v88 leadingAnchor];
    v85 = [v87 constraintEqualToAnchor:v86];
    v107[3] = v85;
    v84 = [(_HUUserAvatarHeaderView *)self contactView];
    v82 = [v84 trailingAnchor];
    v83 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    v81 = [v83 trailingAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    v107[4] = v80;
    v79 = [(_HUUserAvatarHeaderView *)self contactView];
    v77 = [v79 topAnchor];
    v78 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    v76 = [v78 bottomAnchor];
    double v39 = [v77 constraintEqualToAnchor:v76 constant:20.0];
    v107[5] = v39;
    v40 = [(_HUUserAvatarHeaderView *)self contentView];
    v41 = [v40 bottomAnchor];
    double v42 = [(_HUUserAvatarHeaderView *)self contactView];
    double v43 = [v42 bottomAnchor];
    double v44 = [v41 constraintEqualToAnchor:v43 constant:20.0];
    v107[6] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:7];
    [(_HUUserAvatarHeaderView *)self setLayoutConstraints:v45];

    double v46 = (void *)MEMORY[0x1E4F28DC8];
    double v47 = [(_HUUserAvatarHeaderView *)self layoutConstraints];
    [v46 activateConstraints:v47];

    double v48 = [(_HUUserAvatarHeaderView *)self contentView];
    [v48 frame];
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;

    double v57 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    double v58 = [MEMORY[0x1E4F42D90] mainScreen];
    [v58 bounds];
    [v57 tableViewHeightForWidth:v59];
    double v61 = v56 + v60 + -20.0;

    id v62 = [(_HUUserAvatarHeaderView *)self contentView];
    objc_msgSend(v62, "setFrame:", v50, v52, v54, v61);

    [(_HUUserAvatarHeaderView *)self frame];
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    double v70 = v69;
    v71 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    v72 = [MEMORY[0x1E4F42D90] mainScreen];
    [v72 bounds];
    [v71 tableViewHeightForWidth:v73];
    double v75 = v70 + v74 + -20.0;

    -[_HUUserAvatarHeaderView setFrame:](self, "setFrame:", v64, v66, v68, v75);
    double v12 = v105;
    double v10 = v106;
  }
  else
  {
    double v26 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];

    if (v26)
    {
      double v27 = HFLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        double v28 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v109 = v28;
        _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "%@ Dismissing Split Account View", buf, 0xCu);
      }
      [(_HUUserAvatarHeaderView *)self dismissSplitAccountView];
    }
  }
  [(_HUUserAvatarHeaderView *)self setNeedsLayout];
}

- (void)showSplitAccountViewIfNeeded
{
  uint64_t v3 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];

  if (v3)
  {
    objc_super v4 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    v5 = [v4 heightAnchor];
    double v6 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    id v7 = [MEMORY[0x1E4F42D90] mainScreen];
    [v7 bounds];
    [v6 tableViewHeightForWidth:v8];
    id v9 = objc_msgSend(v5, "constraintEqualToConstant:");
    [v9 setActive:1];

    double v10 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    [v10 setAlpha:1.0];

    [(_HUUserAvatarHeaderView *)self layoutIfNeeded];
  }
}

- (void)dismissSplitAccountView
{
  uint64_t v3 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    v5 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
    [v5 alpha];
    double v7 = v6;

    if (v7 == 1.0)
    {
      double v8 = [(_HUUserAvatarHeaderView *)self contentView];
      [v8 frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      v15 = [(_HUUserAvatarHeaderView *)self contentView];
      [v15 frame];
      double v17 = v16;
      v18 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
      [v18 tableViewHeightForWidth:v14];
      double v20 = v17 - v19 + 20.0;

      v21 = [(_HUUserAvatarHeaderView *)self contentView];
      objc_msgSend(v21, "setFrame:", v10, v12, v14, v20);

      [(_HUUserAvatarHeaderView *)self frame];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      [(_HUUserAvatarHeaderView *)self frame];
      double v29 = v28;
      v30 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
      [v30 tableViewHeightForWidth:v27];
      double v32 = v29 - v31 + 20.0;

      -[_HUUserAvatarHeaderView setFrame:](self, "setFrame:", v23, v25, v27, v32);
      double v33 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
      double v34 = [v33 heightAnchor];
      double v35 = [v34 constraintEqualToConstant:20.0];
      [v35 setActive:1];

      double v36 = [(_HUUserAvatarHeaderView *)self splitAccountHeaderView];
      [v36 setAlpha:0.0];

      [(_HUUserAvatarHeaderView *)self layoutIfNeeded];
    }
  }
}

- (ACAccountStore)accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    objc_super v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  double v6 = accountStore;

  return v6;
}

- (NSAttributedString)message
{
  v2 = [(_HUUserAvatarHeaderView *)self contactView];
  uint64_t v3 = [v2 message];

  return (NSAttributedString *)v3;
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(_HUUserAvatarHeaderView *)self contactView];
  [v5 setMessage:v4];
}

- (id)_keyDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1BB38] descriptorForRequiredKeysWithThreeDTouchEnabled:1];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (HUContactView)contactView
{
  return self->_contactView;
}

- (HUSplitAccountHeaderTableView)splitAccountHeaderView
{
  return self->_splitAccountHeaderView;
}

- (void)setSplitAccountHeaderView:(id)a3
{
}

- (HUMultiUserTokenFixTableView)multiUserTokenFixHeaderView
{
  return self->_multiUserTokenFixHeaderView;
}

- (void)setMultiUserTokenFixHeaderView:(id)a3
{
}

- (void)setAccountStore:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (HUMediaAccountDelegate)mediaAccountDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaAccountDelegate);

  return (HUMediaAccountDelegate *)WeakRetained;
}

- (void)setMediaAccountDelegate:(id)a3
{
}

- (NAFuture)mediaAccountFuture
{
  return self->_mediaAccountFuture;
}

- (void)setMediaAccountFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAccountFuture, 0);
  objc_destroyWeak((id *)&self->_mediaAccountDelegate);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_multiUserTokenFixHeaderView, 0);
  objc_storeStrong((id *)&self->_splitAccountHeaderView, 0);

  objc_storeStrong((id *)&self->_contactView, 0);
}

@end