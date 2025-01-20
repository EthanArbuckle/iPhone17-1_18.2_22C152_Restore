@interface HUContactView
- (BOOL)_isPhoneNumberOnlyAccount;
- (CNAvatarView)avatarView;
- (CNContact)contact;
- (HUContactView)initWithFrame:(CGRect)a3;
- (NSArray)accounts;
- (NSAttributedString)message;
- (NSMutableArray)constraints;
- (NSString)contactNameFontTextStyle;
- (UILabel)appleIDAccountLabel;
- (UILabel)appleMusicAccountLabel;
- (UILabel)messageLabel;
- (UILabel)nameLabel;
- (double)avatarDiameter;
- (int64_t)contactNameFormatStyle;
- (unint64_t)numberOfLinesForMessage;
- (void)_setupViews;
- (void)_updateConstraints;
- (void)_updateNameLabelFont;
- (void)setAccounts:(id)a3;
- (void)setAppleIDAccountLabel:(id)a3;
- (void)setAppleMusicAccountLabel:(id)a3;
- (void)setAvatarDiameter:(double)a3;
- (void)setAvatarView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactNameFontTextStyle:(id)a3;
- (void)setContactNameFormatStyle:(int64_t)a3;
- (void)setMessage:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNumberOfLinesForMessage:(unint64_t)a3;
@end

@implementation HUContactView

- (HUContactView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUContactView;
  v3 = -[HUContactView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_avatarDiameter = 85.0;
    v3->_contactNameFormatStyle = 0;
    [(HUContactView *)v3 _setupViews];
  }
  return v4;
}

- (void)setAvatarDiameter:(double)a3
{
  if (self->_avatarDiameter != a3)
  {
    self->_avatarDiameter = a3;
    [(HUContactView *)self _updateConstraints];
  }
}

- (void)setContact:(id)a3
{
  id v12 = a3;
  char v5 = [(CNContact *)self->_contact isEqual:v12];
  objc_super v6 = v12;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    if (self->_contact)
    {
      v7 = [(HUContactView *)self avatarView];
      [v7 setContact:v12];

      v8 = (void *)MEMORY[0x1E4F1B910];
      v9 = [(HUContactView *)self contact];
      v10 = objc_msgSend(v8, "stringFromContact:style:", v9, -[HUContactView contactNameFormatStyle](self, "contactNameFormatStyle"));
      v11 = [(HUContactView *)self nameLabel];
      [v11 setText:v10];
    }
    [(HUContactView *)self _updateConstraints];
    objc_super v6 = v12;
  }
}

- (NSAttributedString)message
{
  v2 = [(HUContactView *)self messageLabel];
  v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setMessage:(id)a3
{
  id v12 = a3;
  v4 = [(HUContactView *)self messageLabel];
  if (v12)
  {

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F42B38]);
      [(HUContactView *)self setMessageLabel:v5];

      objc_super v6 = [(HUContactView *)self messageLabel];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

      v7 = [(HUContactView *)self messageLabel];
      [(HUContactView *)self addSubview:v7];
    }
    unint64_t v8 = [(HUContactView *)self numberOfLinesForMessage];
    v9 = [(HUContactView *)self messageLabel];
    [v9 setNumberOfLines:v8];

    v10 = [(HUContactView *)self messageLabel];
    [v10 setAttributedText:v12];

    v11 = [(HUContactView *)self messageLabel];
    [v11 sizeToFit];

    [(HUContactView *)self _updateConstraints];
  }
  else
  {
    [v4 removeFromSuperview];

    [(HUContactView *)self setMessageLabel:0];
  }
}

- (void)setAccounts:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (!v3)
  {
    v54 = 0;
    id v5 = 0;
    goto LABEL_20;
  }
  uint64_t v4 = v3;
  v54 = 0;
  id v5 = 0;
  uint64_t v6 = *(void *)v56;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v56 != v6) {
        objc_enumerationMutation(obj);
      }
      unint64_t v8 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      objc_opt_class();
      id v9 = v8;
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
      id v11 = v10;

      objc_opt_class();
      id v12 = v9;
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      if (v11)
      {
        v15 = v54;
        v54 = v12;
        id v16 = v5;
      }
      else
      {
        v15 = v5;
        id v16 = v12;
        if (!v14) {
          goto LABEL_16;
        }
      }
      id v17 = v12;

      id v5 = v16;
LABEL_16:
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
  }
  while (v4);
LABEL_20:
  v18 = HFLogForCategory();
  v19 = v54;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v60 = v20;
    __int16 v61 = 2112;
    v62 = v54;
    __int16 v63 = 2112;
    v64 = v5;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@ appleMusicAccount = [%@], appleIDAccount = [%@] ", buf, 0x20u);
  }
  if (v5)
  {
    if (v54) {
      goto LABEL_24;
    }
LABEL_27:
    v22 = [(HUContactView *)self appleMusicAccountLabel];
    [v22 removeFromSuperview];

    [(HUContactView *)self setAppleMusicAccountLabel:0];
    if (v5) {
      goto LABEL_28;
    }
  }
  else
  {
    v21 = [(HUContactView *)self appleIDAccountLabel];
    [v21 removeFromSuperview];

    [(HUContactView *)self setAppleIDAccountLabel:0];
    if (!v54) {
      goto LABEL_27;
    }
LABEL_24:
    if (v5)
    {
LABEL_28:
      v23 = [(HUContactView *)self appleIDAccountLabel];

      if (!v23)
      {
        id v24 = objc_alloc_init(MEMORY[0x1E4F42B38]);
        [(HUContactView *)self setAppleIDAccountLabel:v24];

        v25 = [(HUContactView *)self appleIDAccountLabel];
        [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

        v26 = [(HUContactView *)self appleIDAccountLabel];
        [(HUContactView *)self addSubview:v26];
      }
    }
  }
  if (v54)
  {
    v27 = [v54 username];
    if ([v27 isEqualToString:v5]) {
      goto LABEL_34;
    }
    v28 = [(HUContactView *)self appleMusicAccountLabel];

    if (!v28)
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F42B38]);
      [(HUContactView *)self setAppleMusicAccountLabel:v29];

      v30 = [(HUContactView *)self appleMusicAccountLabel];
      [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

      v27 = [(HUContactView *)self appleMusicAccountLabel];
      [(HUContactView *)self addSubview:v27];
LABEL_34:
    }
  }
  if (![(HUContactView *)self _isPhoneNumberOnlyAccount])
  {
    v31 = HFLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v60 = v32;
      _os_log_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEFAULT, "%@ NOT a Phone Number ONLY Account, We will display iCloud and iTunes Accounts", buf, 0xCu);
    }
    uint64_t v33 = *MEMORY[0x1E4F43890];
    v34 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    v35 = [(HUContactView *)self appleIDAccountLabel];
    [v35 setFont:v34];

    v36 = [(HUContactView *)self appleMusicAccountLabel];
    if (v36)
    {
      v37 = NSString;
      v35 = _HULocalizedStringWithDefaultValue(@"HUUseriCloudAccount_Title", @"HUUseriCloudAccount_Title", 1);
      v38 = [v37 stringWithFormat:@"%@: %@", v35, v5];
    }
    else
    {
      v38 = v5;
    }
    v39 = [(HUContactView *)self appleIDAccountLabel];
    [v39 setText:v38];

    if (v36)
    {
    }
    v40 = [MEMORY[0x1E4F428B8] grayColor];
    v41 = [(HUContactView *)self appleIDAccountLabel];
    [v41 setTextColor:v40];

    v42 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v33];
    v43 = [(HUContactView *)self appleMusicAccountLabel];
    [v43 setFont:v42];

    v44 = NSString;
    v45 = _HULocalizedStringWithDefaultValue(@"HUUserAppleMusicAccount_Title", @"HUUserAppleMusicAccount_Title", 1);
    v19 = v54;
    v46 = [v54 username];
    v47 = [v44 stringWithFormat:@" %@: %@", v45, v46];
    v48 = [(HUContactView *)self appleMusicAccountLabel];
    [v48 setText:v47];

    v49 = [MEMORY[0x1E4F428B8] grayColor];
    v50 = [(HUContactView *)self appleMusicAccountLabel];
    [v50 setTextColor:v49];
  }
  [(HUContactView *)self _updateConstraints];
}

- (void)setNumberOfLinesForMessage:(unint64_t)a3
{
  id v4 = [(HUContactView *)self messageLabel];
  [v4 setNumberOfLines:a3];
}

- (void)setContactNameFontTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_contactNameFontTextStyle, a3);

  [(HUContactView *)self _updateNameLabelFont];
}

- (void)_setupViews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BB38]);
  [(HUContactView *)self setAvatarView:v3];

  id v4 = [(HUContactView *)self avatarView];
  [v4 setUserInteractionEnabled:0];

  id v5 = [(HUContactView *)self avatarView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v6 = [(HUContactView *)self avatarView];
  [(HUContactView *)self addSubview:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(HUContactView *)self setNameLabel:v7];

  unint64_t v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
  id v9 = [(HUContactView *)self nameLabel];
  [v9 setFont:v8];

  v10 = [(HUContactView *)self nameLabel];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = [(HUContactView *)self nameLabel];
  [v11 setNumberOfLines:2];

  id v12 = [(HUContactView *)self nameLabel];
  [v12 setTextAlignment:1];

  id v13 = [(HUContactView *)self nameLabel];
  [(HUContactView *)self addSubview:v13];
}

- (void)_updateNameLabelFont
{
  id v3 = (void *)MEMORY[0x1E4F42A30];
  id v4 = [(HUContactView *)self contactNameFontTextStyle];
  id v5 = [v3 preferredFontForTextStyle:v4];
  uint64_t v6 = [(HUContactView *)self nameLabel];
  [v6 setFont:v5];

  id v7 = [(HUContactView *)self nameLabel];
  [v7 setNeedsLayout];
}

- (void)_updateConstraints
{
  id v3 = [(HUContactView *)self constraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC8];
    id v5 = [(HUContactView *)self constraints];
    [v4 deactivateConstraints:v5];

    uint64_t v6 = [(HUContactView *)self constraints];
    [v6 removeAllObjects];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
    [(HUContactView *)self setConstraints:v6];
  }

  id v7 = [(HUContactView *)self constraints];
  unint64_t v8 = [(HUContactView *)self avatarView];
  id v9 = [v8 topAnchor];
  v10 = [(HUContactView *)self topAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  [v7 addObject:v11];

  id v12 = [(HUContactView *)self constraints];
  id v13 = [(HUContactView *)self avatarView];
  id v14 = [v13 centerXAnchor];
  v15 = [(HUContactView *)self centerXAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [v12 addObject:v16];

  id v17 = [(HUContactView *)self constraints];
  v18 = [(HUContactView *)self avatarView];
  v19 = [v18 leadingAnchor];
  v20 = [(HUContactView *)self leadingAnchor];
  v21 = [v19 constraintGreaterThanOrEqualToAnchor:v20];
  [v17 addObject:v21];

  v22 = [(HUContactView *)self constraints];
  v23 = [(HUContactView *)self avatarView];
  id v24 = [v23 trailingAnchor];
  v25 = [(HUContactView *)self trailingAnchor];
  v26 = [v24 constraintLessThanOrEqualToAnchor:v25];
  [v22 addObject:v26];

  v27 = [(HUContactView *)self constraints];
  v28 = [(HUContactView *)self avatarView];
  id v29 = [v28 widthAnchor];
  [(HUContactView *)self avatarDiameter];
  v30 = objc_msgSend(v29, "constraintEqualToConstant:");
  [v27 addObject:v30];

  v31 = [(HUContactView *)self constraints];
  v32 = [(HUContactView *)self avatarView];
  uint64_t v33 = [v32 heightAnchor];
  [(HUContactView *)self avatarDiameter];
  v34 = objc_msgSend(v33, "constraintEqualToConstant:");
  [v31 addObject:v34];

  v35 = [(HUContactView *)self nameLabel];
  v36 = [v35 firstBaselineAnchor];
  v37 = [(HUContactView *)self avatarView];
  v38 = [v37 bottomAnchor];
  id v142 = [v36 constraintEqualToAnchor:v38 constant:20.0];

  LODWORD(v39) = 1144750080;
  [v142 setPriority:v39];
  v40 = [(HUContactView *)self constraints];
  [v40 addObject:v142];

  v41 = [(HUContactView *)self constraints];
  v42 = [(HUContactView *)self nameLabel];
  v43 = [v42 topAnchor];
  v44 = [(HUContactView *)self avatarView];
  v45 = [v44 bottomAnchor];
  v46 = [v43 constraintGreaterThanOrEqualToAnchor:v45];
  [v41 addObject:v46];

  v47 = [(HUContactView *)self constraints];
  v48 = [(HUContactView *)self nameLabel];
  v49 = [v48 centerXAnchor];
  v50 = [(HUContactView *)self centerXAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  [v47 addObject:v51];

  v52 = [(HUContactView *)self constraints];
  v53 = [(HUContactView *)self nameLabel];
  v54 = [v53 leadingAnchor];
  long long v55 = [(HUContactView *)self leadingAnchor];
  long long v56 = [v54 constraintGreaterThanOrEqualToAnchor:v55];
  [v52 addObject:v56];

  long long v57 = [(HUContactView *)self constraints];
  long long v58 = [(HUContactView *)self nameLabel];
  v59 = [v58 trailingAnchor];
  v60 = [(HUContactView *)self trailingAnchor];
  __int16 v61 = [v59 constraintLessThanOrEqualToAnchor:v60];
  [v57 addObject:v61];

  v62 = [(HUContactView *)self appleIDAccountLabel];

  if (v62)
  {
    __int16 v63 = [(HUContactView *)self constraints];
    v64 = [(HUContactView *)self appleIDAccountLabel];
    v65 = [v64 firstBaselineAnchor];
    uint64_t v66 = [(HUContactView *)self nameLabel];
    v67 = [v66 lastBaselineAnchor];
    v68 = [v65 constraintEqualToAnchor:v67 constant:25.0];
    [v63 addObject:v68];

    v69 = [(HUContactView *)self constraints];
    v70 = [(HUContactView *)self appleIDAccountLabel];
    v71 = [v70 centerXAnchor];
    v72 = [(HUContactView *)self centerXAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    [v69 addObject:v73];

    v74 = [(HUContactView *)self constraints];
    v75 = [(HUContactView *)self appleIDAccountLabel];
    v76 = [v75 leadingAnchor];
    v77 = [(HUContactView *)self leadingAnchor];
    v78 = [v76 constraintGreaterThanOrEqualToAnchor:v77];
    [v74 addObject:v78];

    v79 = [(HUContactView *)self constraints];
    v80 = [(HUContactView *)self appleIDAccountLabel];
    v81 = [v80 trailingAnchor];
    v82 = [(HUContactView *)self trailingAnchor];
    v83 = [v81 constraintLessThanOrEqualToAnchor:v82];
    [v79 addObject:v83];
  }
  v84 = [(HUContactView *)self appleMusicAccountLabel];

  if (v84)
  {
    v85 = [(HUContactView *)self appleIDAccountLabel];
    v86 = [v85 lastBaselineAnchor];

    if (!v86)
    {
      v87 = [(HUContactView *)self nameLabel];
      v86 = [v87 lastBaselineAnchor];
    }
    v88 = [(HUContactView *)self constraints];
    v89 = [(HUContactView *)self appleMusicAccountLabel];
    v90 = [v89 firstBaselineAnchor];
    v91 = [v90 constraintEqualToAnchor:v86 constant:25.0];
    [v88 addObject:v91];

    v92 = [(HUContactView *)self constraints];
    v93 = [(HUContactView *)self appleMusicAccountLabel];
    v94 = [v93 centerXAnchor];
    v95 = [(HUContactView *)self centerXAnchor];
    v96 = [v94 constraintEqualToAnchor:v95];
    [v92 addObject:v96];

    v97 = [(HUContactView *)self constraints];
    v98 = [(HUContactView *)self appleMusicAccountLabel];
    v99 = [v98 trailingAnchor];
    v100 = [(HUContactView *)self trailingAnchor];
    v101 = [v99 constraintLessThanOrEqualToAnchor:v100];
    [v97 addObject:v101];
  }
  v102 = [(HUContactView *)self messageLabel];

  v103 = [(HUContactView *)self nameLabel];
  v104 = [v103 lastBaselineAnchor];

  v105 = [(HUContactView *)self appleIDAccountLabel];
  v106 = v105;
  if (v102)
  {
    if (v105
      && ([(HUContactView *)self appleMusicAccountLabel],
          v107 = objc_claimAutoreleasedReturnValue(),
          v107,
          v106,
          v107))
    {
      v108 = [(HUContactView *)self appleMusicAccountLabel];
    }
    else
    {
      v110 = [(HUContactView *)self appleIDAccountLabel];

      if (!v110)
      {
LABEL_19:
        v113 = [(HUContactView *)self constraints];
        v114 = [(HUContactView *)self messageLabel];
        v115 = [v114 firstBaselineAnchor];
        v116 = [v115 constraintEqualToAnchor:v104 constant:25.0];
        [v113 addObject:v116];

        v117 = [(HUContactView *)self constraints];
        v118 = [(HUContactView *)self messageLabel];
        v119 = [v118 centerXAnchor];
        v120 = [(HUContactView *)self centerXAnchor];
        v121 = [v119 constraintEqualToAnchor:v120];
        [v117 addObject:v121];

        v122 = [(HUContactView *)self constraints];
        v123 = [(HUContactView *)self messageLabel];
        v124 = [v123 leadingAnchor];
        v125 = [(HUContactView *)self leadingAnchor];
        v126 = [v124 constraintGreaterThanOrEqualToAnchor:v125];
        [v122 addObject:v126];

        v127 = [(HUContactView *)self constraints];
        v128 = [(HUContactView *)self messageLabel];
        v129 = [v128 trailingAnchor];
        v130 = [(HUContactView *)self trailingAnchor];
        v131 = [v129 constraintLessThanOrEqualToAnchor:v130];
        [v127 addObject:v131];

        v132 = [(HUContactView *)self constraints];
        v133 = [(HUContactView *)self messageLabel];
        v134 = [v133 lastBaselineAnchor];
        v135 = [(HUContactView *)self bottomAnchor];
        v136 = [v134 constraintEqualToAnchor:v135];
        [v132 addObject:v136];

        goto LABEL_24;
      }
      v108 = [(HUContactView *)self appleIDAccountLabel];
    }
    v111 = v108;
    uint64_t v112 = [v108 lastBaselineAnchor];

    v104 = (void *)v112;
    goto LABEL_19;
  }

  if (v106)
  {
    v109 = [(HUContactView *)self appleIDAccountLabel];
LABEL_22:
    v138 = v109;
    uint64_t v139 = [v109 lastBaselineAnchor];

    v104 = (void *)v139;
    goto LABEL_23;
  }
  v137 = [(HUContactView *)self appleMusicAccountLabel];

  if (v137)
  {
    v109 = [(HUContactView *)self appleMusicAccountLabel];
    goto LABEL_22;
  }
LABEL_23:
  v132 = [(HUContactView *)self constraints];
  v133 = [(HUContactView *)self bottomAnchor];
  v134 = [v104 constraintEqualToAnchor:v133];
  [v132 addObject:v134];
LABEL_24:

  v140 = (void *)MEMORY[0x1E4F28DC8];
  v141 = [(HUContactView *)self constraints];
  [v140 activateConstraints:v141];
}

- (BOOL)_isPhoneNumberOnlyAccount
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1B910];
  id v4 = [(HUContactView *)self contact];
  id v5 = objc_msgSend(v3, "stringFromContact:style:", v4, -[HUContactView contactNameFormatStyle](self, "contactNameFormatStyle"));

  uint64_t v6 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v5];
  id v7 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v6];
  uint64_t v8 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v9 = *MEMORY[0x1E4F1AEE0];
  v14[0] = v8;
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v12 = [v11 unifiedContactsMatchingPredicate:v7 keysToFetch:v10 error:0];
  LOBYTE(v8) = objc_msgSend(v12, "hmf_isEmpty");

  return v8 ^ 1;
}

- (double)avatarDiameter
{
  return self->_avatarDiameter;
}

- (CNContact)contact
{
  return self->_contact;
}

- (int64_t)contactNameFormatStyle
{
  return self->_contactNameFormatStyle;
}

- (void)setContactNameFormatStyle:(int64_t)a3
{
  self->_contactNameFormatStyle = a3;
}

- (unint64_t)numberOfLinesForMessage
{
  return self->_numberOfLinesForMessage;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (NSString)contactNameFontTextStyle
{
  return self->_contactNameFontTextStyle;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UILabel)appleIDAccountLabel
{
  return self->_appleIDAccountLabel;
}

- (void)setAppleIDAccountLabel:(id)a3
{
}

- (UILabel)appleMusicAccountLabel
{
  return self->_appleMusicAccountLabel;
}

- (void)setAppleMusicAccountLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicAccountLabel, 0);
  objc_storeStrong((id *)&self->_appleIDAccountLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_contactNameFontTextStyle, 0);
  objc_storeStrong((id *)&self->_accounts, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end