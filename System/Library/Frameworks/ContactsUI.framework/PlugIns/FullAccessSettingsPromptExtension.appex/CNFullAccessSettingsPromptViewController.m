@interface CNFullAccessSettingsPromptViewController
+ (id)log;
- (UILabel)countsLabel;
- (UILabel)privacyDescriptionLabel;
- (UIView)avatarView;
- (void)setAvatarView:(id)a3;
- (void)setCountsLabel:(id)a3;
- (void)setPrivacyDescriptionLabel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNFullAccessSettingsPromptViewController

+ (id)log
{
  if (qword_100008770 != -1) {
    dispatch_once(&qword_100008770, &stru_100004190);
  }
  v2 = (void *)qword_100008778;

  return v2;
}

- (void)viewDidLoad
{
  v107.receiver = self;
  v107.super_class = (Class)CNFullAccessSettingsPromptViewController;
  [(CNFullAccessSettingsPromptViewController *)&v107 viewDidLoad];
  v3 = [(CNFullAccessSettingsPromptViewController *)self extensionContext];
  v4 = [v3 inputItems];
  v5 = [v4 firstObject];

  v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v115 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "InputItem: %@", buf, 0xCu);
  }

  v7 = [v5 userInfo];
  v98 = [v7 valueForKey:kTCCNotificationExtensionClientDataKey];

  v99 = v5;
  v8 = [v5 userInfo];
  uint64_t v9 = [v8 valueForKey:@"ClientBundleIdentifier"];

  id v106 = 0;
  v104 = (void *)v9;
  id v10 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v9 allowPlaceholder:1 error:&v106];
  id v11 = v106;
  v12 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v115 = v10;
    __int16 v116 = 2112;
    uint64_t v117 = (uint64_t)v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ApplicationRecord: %@ error: %@", buf, 0x16u);
  }
  v102 = v11;

  v97 = v10;
  uint64_t v13 = [v10 localizedName];
  -[CNFullAccessSettingsPromptViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, 800.0);
  v14 = (UILabel *)objc_alloc_init((Class)UILabel);
  privacyDescriptionLabel = self->_privacyDescriptionLabel;
  self->_privacyDescriptionLabel = v14;

  [(UILabel *)self->_privacyDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v96 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:0];
  v16 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", 0.0);
  [(UILabel *)self->_privacyDescriptionLabel setFont:v16];

  [(UILabel *)self->_privacyDescriptionLabel setTextAlignment:1];
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"FULL_ACCESS_PROMPT_ALLOW_ACCESS_TO_ALL_CONTACTS_DESCRIPTION %@" value:&stru_1000041F0 table:@"Localizable"];
  v103 = (void *)v13;
  v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v13);
  [(UILabel *)self->_privacyDescriptionLabel setText:v19];

  [(UILabel *)self->_privacyDescriptionLabel setLineBreakStrategy:1];
  [(UILabel *)self->_privacyDescriptionLabel setNumberOfLines:0];
  [(UILabel *)self->_privacyDescriptionLabel setAllowsDefaultTighteningForTruncation:1];
  v20 = [(CNFullAccessSettingsPromptViewController *)self view];
  [v20 addSubview:self->_privacyDescriptionLabel];

  id v105 = 0;
  id v100 = objc_alloc_init((Class)CNContactStore);
  v21 = [v100 unifiedContactCountWithError:&v105];
  id v22 = v105;
  v23 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v115 = v21;
    __int16 v116 = 2112;
    uint64_t v117 = v13;
    __int16 v118 = 2112;
    v119 = v104;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Total contacts: %@ Requesting full access for %@(%@)", buf, 0x20u);
  }

  if (!v21 && v22)
  {
    v24 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v115 = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Unable to get contacts count. Error: %@", buf, 0xCu);
    }
  }
  v101 = v22;
  uint64_t v25 = +[CNContactGroupVisualizer fullAccessPromptSettingsContactsController];
  v26 = v21;
  if ((uint64_t)[v21 longLongValue] >= 1 && v25)
  {
    v27 = (UILabel *)objc_alloc_init((Class)UILabel);
    countsLabel = self->_countsLabel;
    self->_countsLabel = v27;

    [(UILabel *)self->_countsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_countsLabel setNumberOfLines:0];
    +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline addingSymbolicTraits:0x8000 options:0];
    v30 = v29 = (void *)v25;
    UIFontDescriptorAttributeName v112 = UIFontDescriptorTraitsAttribute;
    UIFontDescriptorTraitKey v110 = UIFontWeightTrait;
    v31 = +[NSNumber numberWithDouble:UIFontWeightSemibold];
    v111 = v31;
    v32 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    v113 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
    uint64_t v82 = [v30 fontDescriptorByAddingAttributes:v33];

    v34 = +[UIFont fontWithDescriptor:v82 size:0.0];
    [(UILabel *)self->_countsLabel setFont:v34];

    [(UILabel *)self->_countsLabel setTextAlignment:1];
    v35 = +[NSBundle bundleForClass:objc_opt_class()];
    v36 = [v35 localizedStringForKey:@"FULL_ACCESS_PROMPT_CONTACTS_COUNT %lld" value:&stru_1000041F0 table:@"Localizable"];
    v81 = v26;
    v37 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v36, [v26 longLongValue]);
    [(UILabel *)self->_countsLabel setText:v37];

    [(UILabel *)self->_countsLabel setLineBreakStrategy:1];
    v38 = [(CNFullAccessSettingsPromptViewController *)self view];
    [v38 addSubview:self->_countsLabel];

    [(CNFullAccessSettingsPromptViewController *)self addChildViewController:v29];
    v80 = v29;
    v39 = [v29 view];
    avatarView = self->_avatarView;
    self->_avatarView = v39;

    v41 = [(CNFullAccessSettingsPromptViewController *)self view];
    [v41 addSubview:self->_avatarView];

    [v29 didMoveToParentViewController:self];
    [(UIView *)self->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_avatarView setClipsToBounds:0];
    v79 = [(UIView *)self->_avatarView topAnchor];
    v95 = [(CNFullAccessSettingsPromptViewController *)self view];
    v94 = [v95 topAnchor];
    v93 = objc_msgSend(v79, "constraintEqualToAnchor:constant:", -5.0);
    v109[0] = v93;
    v42 = [(UIView *)self->_avatarView leadingAnchor];
    v91 = [(CNFullAccessSettingsPromptViewController *)self view];
    [v91 leadingAnchor];
    v90 = v92 = v42;
    v89 = objc_msgSend(v42, "constraintEqualToAnchor:");
    v109[1] = v89;
    v74 = [(UIView *)self->_avatarView trailingAnchor];
    v88 = [(CNFullAccessSettingsPromptViewController *)self view];
    v87 = [v88 trailingAnchor];
    uint64_t v75 = objc_msgSend(v74, "constraintEqualToAnchor:");
    v109[2] = v75;
    v43 = [(UIView *)self->_avatarView bottomAnchor];
    v85 = [(UILabel *)self->_countsLabel topAnchor];
    v86 = v43;
    v84 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", -8.0);
    v109[3] = v84;
    v44 = [(UILabel *)self->_countsLabel bottomAnchor];
    v68 = [(UILabel *)self->_privacyDescriptionLabel topAnchor];
    v83 = v44;
    v78 = [v44 constraintEqualToAnchor:v68 constant:-8.0];
    v109[4] = v78;
    v76 = [(UILabel *)self->_countsLabel leadingAnchor];
    v77 = [(CNFullAccessSettingsPromptViewController *)self view];
    v73 = [v77 leadingAnchor];
    v72 = [v76 constraintEqualToAnchor:v73 constant:16.0];
    v109[5] = v72;
    v70 = [(UILabel *)self->_countsLabel trailingAnchor];
    v71 = [(CNFullAccessSettingsPromptViewController *)self view];
    v69 = [v71 trailingAnchor];
    v67 = [v70 constraintEqualToAnchor:v69 constant:-16.0];
    v109[6] = v67;
    v65 = [(UILabel *)self->_privacyDescriptionLabel bottomAnchor];
    v66 = [(CNFullAccessSettingsPromptViewController *)self view];
    v64 = [v66 bottomAnchor];
    v45 = [v65 constraintEqualToAnchor:v64 constant:-12.0];
    v109[7] = v45;
    v46 = [(UILabel *)self->_privacyDescriptionLabel leadingAnchor];
    v47 = [(CNFullAccessSettingsPromptViewController *)self view];
    v48 = [v47 leadingAnchor];
    v49 = [v46 constraintEqualToAnchor:v48 constant:16.0];
    v109[8] = v49;
    v50 = [(UILabel *)self->_privacyDescriptionLabel trailingAnchor];
    v51 = [(CNFullAccessSettingsPromptViewController *)self view];
    v52 = [v51 trailingAnchor];
    v53 = [v50 constraintEqualToAnchor:v52 constant:-16.0];
    v109[9] = v53;
    v54 = +[NSArray arrayWithObjects:v109 count:10];
    +[NSLayoutConstraint activateConstraints:v54];

    v55 = v74;
    v56 = v80;

    v57 = (void *)v75;
    v58 = v79;

    v59 = (void *)v82;
    v26 = v81;
  }
  else
  {
    v59 = [(UILabel *)self->_privacyDescriptionLabel topAnchor];
    v58 = [(CNFullAccessSettingsPromptViewController *)self view];
    v95 = [v58 topAnchor];
    v94 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", -5.0);
    v108[0] = v94;
    v60 = [(UILabel *)self->_privacyDescriptionLabel bottomAnchor];
    v92 = [(CNFullAccessSettingsPromptViewController *)self view];
    [v92 bottomAnchor];
    v91 = v93 = v60;
    v90 = objc_msgSend(v60, "constraintEqualToAnchor:constant:", -12.0);
    v108[1] = v90;
    v61 = [(UILabel *)self->_privacyDescriptionLabel leadingAnchor];
    v55 = [(CNFullAccessSettingsPromptViewController *)self view];
    v88 = [v55 leadingAnchor];
    v89 = v61;
    v87 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", 16.0);
    v108[2] = v87;
    uint64_t v62 = [(UILabel *)self->_privacyDescriptionLabel trailingAnchor];
    v63 = self;
    v57 = (void *)v62;
    v86 = [(CNFullAccessSettingsPromptViewController *)v63 view];
    v85 = [v86 trailingAnchor];
    v84 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", -16.0);
    v108[3] = v84;
    v83 = +[NSArray arrayWithObjects:v108 count:4];
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:");
    v56 = (void *)v25;
  }
}

- (void)viewDidLayoutSubviews
{
  [(UILabel *)self->_privacyDescriptionLabel intrinsicContentSize];
  double v4 = v3;
  countsLabel = self->_countsLabel;
  if (countsLabel && self->_avatarView)
  {
    [(UILabel *)countsLabel intrinsicContentSize];
    double v7 = v6;
    [(UIView *)self->_avatarView intrinsicContentSize];
    double v4 = v4 + v7 + v8 + 8.0;
  }

  -[CNFullAccessSettingsPromptViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v4 + 12.0);
}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UILabel)countsLabel
{
  return self->_countsLabel;
}

- (void)setCountsLabel:(id)a3
{
}

- (UILabel)privacyDescriptionLabel
{
  return self->_privacyDescriptionLabel;
}

- (void)setPrivacyDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_countsLabel, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end