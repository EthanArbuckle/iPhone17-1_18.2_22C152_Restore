@interface EKUIInviteesViewInviteesCell
+ (id)_commentLabelFont;
+ (id)_nameLabelFont;
- (BOOL)hideStatus;
- (BOOL)showSpinner;
- (EKUIInviteesViewInviteesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (EKUILabeledAvatarView)contactAvatarView;
- (NSArray)persistentConstraints;
- (NSArray)removableConstraints;
- (UIActivityIndicatorView)spinner;
- (UIImageView)statusImageView;
- (UILabel)commentLabel;
- (UILabel)nameLabel;
- (UILabel)optionalInviteeLabel;
- (UIView)textContainerView;
- (id)_statusImageViewSymbolConfiguration;
- (void)setCommentLabel:(id)a3;
- (void)setContactAvatarView:(id)a3;
- (void)setHideStatus:(BOOL)a3;
- (void)setNameLabel:(id)a3;
- (void)setOptionalInviteeLabel:(id)a3;
- (void)setPersistentConstraints:(id)a3;
- (void)setRemovableConstraints:(id)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setStatusImageView:(id)a3;
- (void)setTextContainerView:(id)a3;
- (void)updateCommonElements:(id)a3 statusImage:(id)a4 conflict:(BOOL)a5;
- (void)updateConstraints;
- (void)updateWithParticipantForSorting:(id)a3;
- (void)updateWithParticipantForSorting:(id)a3 availabilityType:(int64_t)a4 showSpinner:(BOOL)a5 animated:(BOOL)a6;
@end

@implementation EKUIInviteesViewInviteesCell

- (EKUIInviteesViewInviteesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v40.receiver = self;
  v40.super_class = (Class)EKUIInviteesViewInviteesCell;
  v4 = [(EKUIInviteesViewInviteesCell *)&v40 initWithStyle:3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(EKUIInviteesViewInviteesCell *)v4 contentView];
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v8 = [(EKUIInviteesViewInviteesCell *)v5 _statusImageViewSymbolConfiguration];
    [v7 setPreferredSymbolConfiguration:v8];

    LODWORD(v9) = 1148846080;
    [v7 setContentHuggingPriority:0 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [v7 setContentHuggingPriority:1 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [v7 setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [v7 setContentCompressionResistancePriority:1 forAxis:v12];
    [(EKUIInviteesViewInviteesCell *)v5 setStatusImageView:v7];
    [(EKUIInviteesViewInviteesCell *)v5 setAccessoryView:v7];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    LODWORD(v14) = 1148846080;
    [v13 setContentHuggingPriority:0 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [v13 setContentHuggingPriority:1 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [v13 setContentCompressionResistancePriority:0 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [v13 setContentCompressionResistancePriority:1 forAxis:v17];
    [v13 setAlpha:0.0];
    [(EKUIInviteesViewInviteesCell *)v5 setSpinner:v13];
    v18 = [[EKUILabeledAvatarView alloc] initWithPlacement:0 options:0];
    [(EKUILabeledAvatarView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKUILabeledAvatarView *)v18 setLoadContactsAsynchronously:1];
    v39 = v6;
    [v6 addSubview:v18];
    [(EKUIInviteesViewInviteesCell *)v5 setContactAvatarView:v18];
    v19 = objc_opt_new();
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:v19];
    [(EKUIInviteesViewInviteesCell *)v5 setTextContainerView:v19];
    id v20 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [(id)objc_opt_class() _nameLabelFont];
    [v20 setFont:v21];

    v22 = [(EKUIInviteesViewInviteesCell *)v5 textLabel];
    v23 = [v22 textColor];
    [v20 setTextColor:v23];

    LODWORD(v24) = 1148846080;
    [v20 setContentCompressionResistancePriority:1 forAxis:v24];
    [v20 setNumberOfLines:0];
    v25 = [(EKUIInviteesViewInviteesCell *)v5 textContainerView];
    [v25 addSubview:v20];

    [(EKUIInviteesViewInviteesCell *)v5 setNameLabel:v20];
    id v26 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [(id)objc_opt_class() _commentLabelFont];
    [v26 setFont:v27];

    v28 = [(EKUIInviteesViewInviteesCell *)v5 detailTextLabel];
    v29 = [v28 textColor];
    [v26 setTextColor:v29];

    [v26 setNumberOfLines:0];
    LODWORD(v30) = 1148846080;
    [v26 setContentCompressionResistancePriority:1 forAxis:v30];
    [v26 setLineBreakMode:0];
    v31 = [(EKUIInviteesViewInviteesCell *)v5 textContainerView];
    [v31 addSubview:v26];

    [(EKUIInviteesViewInviteesCell *)v5 setCommentLabel:v26];
    id v32 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = [(id)objc_opt_class() _commentLabelFont];
    [v32 setFont:v33];

    v34 = [(EKUIInviteesViewInviteesCell *)v5 detailTextLabel];
    v35 = [v34 textColor];
    [v32 setTextColor:v35];

    [v32 setNumberOfLines:1];
    LODWORD(v36) = 1148846080;
    [v32 setContentCompressionResistancePriority:1 forAxis:v36];
    [v32 setLineBreakMode:0];
    v37 = [(EKUIInviteesViewInviteesCell *)v5 textContainerView];
    [v37 addSubview:v32];

    [(EKUIInviteesViewInviteesCell *)v5 setOptionalInviteeLabel:v32];
    [(EKUIInviteesViewInviteesCell *)v5 setNeedsUpdateConstraints];
  }
  return v5;
}

- (void)updateConstraints
{
  v3 = [(EKUIInviteesViewInviteesCell *)self persistentConstraints];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(EKUIInviteesViewInviteesCell *)self contactAvatarView];
    v6 = [v5 leadingAnchor];
    id v7 = [(EKUIInviteesViewInviteesCell *)self contentView];
    v8 = [v7 layoutMarginsGuide];
    double v9 = [v8 leadingAnchor];
    double v10 = [v6 constraintEqualToAnchor:v9];
    [v4 addObject:v10];

    double v11 = [(EKUIInviteesViewInviteesCell *)self contactAvatarView];
    double v12 = [v11 centerYAnchor];
    v13 = [(EKUIInviteesViewInviteesCell *)self contentView];
    double v14 = [v13 centerYAnchor];
    double v15 = [v12 constraintEqualToAnchor:v14];
    [v4 addObject:v15];

    double v16 = [(EKUIInviteesViewInviteesCell *)self contactAvatarView];
    double v17 = [v16 widthAnchor];
    v18 = [v17 constraintEqualToConstant:37.0];
    [v4 addObject:v18];

    v19 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    id v20 = [v19 leadingAnchor];
    v21 = [(EKUIInviteesViewInviteesCell *)self contactAvatarView];
    v22 = [v21 trailingAnchor];
    v23 = [v20 constraintEqualToAnchor:v22 constant:12.0];
    [v4 addObject:v23];

    double v24 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v25 = [v24 trailingAnchor];
    id v26 = [(EKUIInviteesViewInviteesCell *)self contentView];
    v27 = [v26 layoutMarginsGuide];
    v28 = [v27 trailingAnchor];
    v29 = [v25 constraintEqualToAnchor:v28];
    [v4 addObject:v29];

    double v30 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v31 = [v30 centerYAnchor];
    id v32 = [(EKUIInviteesViewInviteesCell *)self contentView];
    v33 = [v32 centerYAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    [v4 addObject:v34];

    v35 = [(EKUIInviteesViewInviteesCell *)self nameLabel];
    double v36 = [v35 leadingAnchor];
    v37 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v38 = [v37 leadingAnchor];
    v39 = [v36 constraintEqualToAnchor:v38];
    [v4 addObject:v39];

    objc_super v40 = [(EKUIInviteesViewInviteesCell *)self nameLabel];
    v41 = [v40 trailingAnchor];
    v42 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v43 = [v42 trailingAnchor];
    v44 = [v41 constraintEqualToAnchor:v43];
    [v4 addObject:v44];

    v45 = [(EKUIInviteesViewInviteesCell *)self nameLabel];
    v46 = [v45 topAnchor];
    v47 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v48 = [v47 topAnchor];
    v49 = [v46 constraintEqualToAnchor:v48];
    [v4 addObject:v49];

    v50 = [(EKUIInviteesViewInviteesCell *)self commentLabel];
    v51 = [v50 leadingAnchor];
    v52 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v53 = [v52 leadingAnchor];
    v54 = [v51 constraintEqualToAnchor:v53];
    [v4 addObject:v54];

    v55 = [(EKUIInviteesViewInviteesCell *)self commentLabel];
    v56 = [v55 trailingAnchor];
    v57 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v58 = [v57 trailingAnchor];
    v59 = [v56 constraintEqualToAnchor:v58];
    [v4 addObject:v59];

    v60 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
    v61 = [v60 leadingAnchor];
    v62 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v63 = [v62 leadingAnchor];
    v64 = [v61 constraintEqualToAnchor:v63];
    [v4 addObject:v64];

    v65 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
    v66 = [v65 trailingAnchor];
    v67 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v68 = [v67 trailingAnchor];
    v69 = [v66 constraintEqualToAnchor:v68];
    [v4 addObject:v69];

    v70 = [(EKUIInviteesViewInviteesCell *)self contentView];
    v71 = [v70 heightAnchor];
    v72 = [v71 constraintGreaterThanOrEqualToConstant:60.0];
    [v4 addObject:v72];

    v73 = [(EKUIInviteesViewInviteesCell *)self contentView];
    v74 = [v73 heightAnchor];
    v75 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v76 = [v75 heightAnchor];
    v77 = [v74 constraintGreaterThanOrEqualToAnchor:v76 constant:12.0];
    [v4 addObject:v77];

    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
    [(EKUIInviteesViewInviteesCell *)self setPersistentConstraints:v4];
  }
  v78 = [(EKUIInviteesViewInviteesCell *)self removableConstraints];

  if (!v78)
  {
    id v79 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v80 = [(EKUIInviteesViewInviteesCell *)self commentLabel];
    v81 = [v80 text];
    if (v81)
    {
      v82 = [(EKUIInviteesViewInviteesCell *)self commentLabel];
      v83 = [v82 text];
      BOOL v84 = [v83 length] != 0;
    }
    else
    {
      BOOL v84 = 0;
    }

    v85 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
    v86 = [v85 text];
    if (v86)
    {
      v87 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
      v88 = [v87 text];
      BOOL v89 = [v88 length] != 0;
    }
    else
    {
      BOOL v89 = 0;
    }

    v90 = [(id)objc_opt_class() _commentLabelFont];
    [v90 _scaledValueForValue:20.0];
    CalRoundToScreenScale(v91);
    double v93 = v92;

    if (v84 && v89)
    {
      v94 = [(EKUIInviteesViewInviteesCell *)self commentLabel];
      v95 = [v94 firstBaselineAnchor];
      v96 = [(EKUIInviteesViewInviteesCell *)self nameLabel];
      v97 = [v96 lastBaselineAnchor];
      v98 = [v95 constraintEqualToAnchor:v97 constant:v93];
      [v79 addObject:v98];

      v99 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
      v100 = [v99 firstBaselineAnchor];
      v101 = [(EKUIInviteesViewInviteesCell *)self commentLabel];
    }
    else
    {
      if (!v89)
      {
        if (v84)
        {
          v111 = [(EKUIInviteesViewInviteesCell *)self commentLabel];
          v112 = [v111 firstBaselineAnchor];
          v113 = [(EKUIInviteesViewInviteesCell *)self nameLabel];
          v114 = [v113 lastBaselineAnchor];
          v115 = [v112 constraintEqualToAnchor:v114 constant:v93];
          [v79 addObject:v115];

          [(EKUIInviteesViewInviteesCell *)self commentLabel];
        }
        else
        {
          [(EKUIInviteesViewInviteesCell *)self nameLabel];
        v105 = };
        goto LABEL_15;
      }
      v99 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
      v100 = [v99 firstBaselineAnchor];
      v101 = [(EKUIInviteesViewInviteesCell *)self nameLabel];
    }
    v102 = v101;
    v103 = [v101 lastBaselineAnchor];
    v104 = [v100 constraintEqualToAnchor:v103 constant:v93];
    [v79 addObject:v104];

    v105 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
LABEL_15:
    v106 = v105;
    v107 = [v105 bottomAnchor];
    v108 = [(EKUIInviteesViewInviteesCell *)self textContainerView];
    v109 = [v108 bottomAnchor];
    v110 = [v107 constraintEqualToAnchor:v109];
    [v79 addObject:v110];

    [MEMORY[0x1E4F28DC8] activateConstraints:v79];
    [(EKUIInviteesViewInviteesCell *)self setRemovableConstraints:v79];
  }
  v116.receiver = self;
  v116.super_class = (Class)EKUIInviteesViewInviteesCell;
  [(EKUIInviteesViewInviteesCell *)&v116 updateConstraints];
}

- (void)updateWithParticipantForSorting:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    double v17 = self;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, "Updating cell with participant for sorting: [%@]. Cell: [%@]", (uint8_t *)&v14, 0x16u);
  }
  [(EKUIInviteesViewInviteesCell *)self setShowSpinner:0];
  v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  id v7 = (void *)MEMORY[0x1E4FB08E0];
  v8 = [v6 fontDescriptor];
  [v6 pointSize];
  double v10 = [v7 fontWithDescriptor:v8 size:v9 + 2.0];

  double v11 = [v4 participant];
  [v11 participantStatus];
  double v12 = attributedStatusGlyph();

  v13 = CalImageFromGlyph(v12);
  [(EKUIInviteesViewInviteesCell *)self updateCommonElements:v4 statusImage:v13 conflict:0];
}

- (void)updateWithParticipantForSorting:(id)a3 availabilityType:(int64_t)a4 showSpinner:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  double v10 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    double v11 = v10;
    double v12 = EKAvailabilitySpanTypeAsString();
    v13 = CalBooleanAsString();
    int v16 = 138413058;
    id v17 = v9;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Updating cell with participant for sorting: [%@] availability type: [%@] showSpinner: [%@].  Cell: [%@]", (uint8_t *)&v16, 0x2Au);
  }
  [(EKUIInviteesViewInviteesCell *)self setHideStatus:0];
  [(EKUIInviteesViewInviteesCell *)self setShowSpinner:v6];
  uint64_t v14 = [MEMORY[0x1E4F254B8] showTypeAsBusy:a4];
  id v15 = ImageForAvailabilityType(a4);
  [(EKUIInviteesViewInviteesCell *)self updateCommonElements:v9 statusImage:v15 conflict:v14];
}

- (void)updateCommonElements:(id)a3 statusImage:(id)a4 conflict:(BOOL)a5
{
  BOOL v5 = a5;
  id v53 = a4;
  id v8 = a3;
  id v9 = [v8 participant];
  if ([(EKUIInviteesViewInviteesCell *)self showSpinner])
  {
    double v10 = [(EKUIInviteesViewInviteesCell *)self spinner];
    [(EKUIInviteesViewInviteesCell *)self setAccessoryView:v10];

    double v11 = [(EKUIInviteesViewInviteesCell *)self spinner];
    char v12 = [v11 isAnimating];

    if (v12) {
      goto LABEL_7;
    }
    v13 = [(EKUIInviteesViewInviteesCell *)self spinner];
    [v13 startAnimating];
  }
  else
  {
    uint64_t v14 = [(EKUIInviteesViewInviteesCell *)self statusImageView];
    [(EKUIInviteesViewInviteesCell *)self setAccessoryView:v14];

    id v15 = [(EKUIInviteesViewInviteesCell *)self spinner];
    int v16 = [v15 isAnimating];

    if (!v16) {
      goto LABEL_7;
    }
    v13 = [(EKUIInviteesViewInviteesCell *)self spinner];
    [v13 stopAnimating];
  }

LABEL_7:
  BOOL v17 = [(EKUIInviteesViewInviteesCell *)self hideStatus];
  __int16 v18 = [(EKUIInviteesViewInviteesCell *)self statusImageView];
  [v18 setHidden:v17];

  if (![(EKUIInviteesViewInviteesCell *)self hideStatus])
  {
    v19 = [(EKUIInviteesViewInviteesCell *)self statusImageView];
    [v19 setImage:v53];

    __int16 v20 = [(EKUIInviteesViewInviteesCell *)self _statusImageViewSymbolConfiguration];
    v21 = [(EKUIInviteesViewInviteesCell *)self statusImageView];
    [v21 setPreferredSymbolConfiguration:v20];

    __int16 v22 = [MEMORY[0x1E4FB1618] systemGrayColor];
    v23 = [(EKUIInviteesViewInviteesCell *)self statusImageView];
    [v23 setTintColor:v22];

    uint64_t v24 = [(EKUIInviteesViewInviteesCell *)self statusImageView];
    [v24 sizeToFit];
  }
  v25 = [(EKUIInviteesViewInviteesCell *)self contactAvatarView];
  [v25 updateWithParticipant:v9];

  id v26 = [v8 displayName];

  v27 = [(EKUIInviteesViewInviteesCell *)self nameLabel];
  [v27 setText:v26];

  v28 = [(EKUIInviteesViewInviteesCell *)self commentLabel];
  v29 = [v28 text];

  double v30 = [v9 commentLabelString];
  v31 = [(EKUIInviteesViewInviteesCell *)self commentLabel];
  [v31 setText:v30];

  id v32 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
  v33 = [v32 text];

  if ([v9 participantRole] == 2)
  {
    v34 = EventKitUIBundle();
    v35 = [v34 localizedStringForKey:@"Optional" value:&stru_1F0CC2140 table:0];

    if (v5)
    {
      double v36 = EventKitUIBundle();
      v37 = [v36 localizedStringForKey:@"Conflict" value:&stru_1F0CC2140 table:0];

      v38 = NSString;
      v39 = EventKitUIBundle();
      objc_super v40 = [v39 localizedStringForKey:@"StatusConflictFormat", @"%@, %@", 0 value table];
      uint64_t v41 = objc_msgSend(v38, "localizedStringWithFormat:", v40, v35, v37);

      v35 = (__CFString *)v41;
    }
    uint64_t v42 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    goto LABEL_15;
  }
  if (v5)
  {
    v43 = EventKitUIBundle();
    v35 = [v43 localizedStringForKey:@"Conflict" value:&stru_1F0CC2140 table:0];

    uint64_t v42 = [MEMORY[0x1E4FB1618] systemRedColor];
LABEL_15:
    v44 = (void *)v42;
    v45 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
    [v45 setTextColor:v44];

    goto LABEL_17;
  }
  v35 = &stru_1F0CC2140;
LABEL_17:
  v46 = [(EKUIInviteesViewInviteesCell *)self optionalInviteeLabel];
  [v46 setText:v35];

  if (v29)
  {
    int v47 = [v29 length] == 0;
    if (v30) {
      goto LABEL_19;
    }
  }
  else
  {
    int v47 = 1;
    if (v30)
    {
LABEL_19:
      int v48 = [v30 length] == 0;
      if (v33) {
        goto LABEL_20;
      }
LABEL_24:
      int v49 = 1;
      if (v35) {
        goto LABEL_21;
      }
LABEL_25:
      int v50 = 1;
      goto LABEL_26;
    }
  }
  int v48 = 1;
  if (!v33) {
    goto LABEL_24;
  }
LABEL_20:
  int v49 = [v33 length] == 0;
  if (!v35) {
    goto LABEL_25;
  }
LABEL_21:
  int v50 = [(__CFString *)v35 length] == 0;
LABEL_26:
  if (v47 != v48 || v49 != v50)
  {
    v51 = (void *)MEMORY[0x1E4F28DC8];
    v52 = [(EKUIInviteesViewInviteesCell *)self removableConstraints];
    [v51 deactivateConstraints:v52];

    [(EKUIInviteesViewInviteesCell *)self setRemovableConstraints:0];
    [(EKUIInviteesViewInviteesCell *)self setNeedsUpdateConstraints];
  }
}

- (id)_statusImageViewSymbolConfiguration
{
  v2 = [(EKUIInviteesViewInviteesCell *)self traitCollection];
  int64_t v3 = +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:-1 traitCollection:v2];

  id v4 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v5 = *MEMORY[0x1E4FB28C8];

  return (id)[v4 configurationWithTextStyle:v5 scale:v3];
}

+ (id)_nameLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (id)_commentLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

- (BOOL)hideStatus
{
  return self->_hideStatus;
}

- (void)setHideStatus:(BOOL)a3
{
  self->_hideStatus = a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)commentLabel
{
  return self->_commentLabel;
}

- (void)setCommentLabel:(id)a3
{
}

- (UILabel)optionalInviteeLabel
{
  return self->_optionalInviteeLabel;
}

- (void)setOptionalInviteeLabel:(id)a3
{
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (void)setStatusImageView:(id)a3
{
}

- (EKUILabeledAvatarView)contactAvatarView
{
  return self->_contactAvatarView;
}

- (void)setContactAvatarView:(id)a3
{
}

- (UIView)textContainerView
{
  return self->_textContainerView;
}

- (void)setTextContainerView:(id)a3
{
}

- (NSArray)persistentConstraints
{
  return self->_persistentConstraints;
}

- (void)setPersistentConstraints:(id)a3
{
}

- (NSArray)removableConstraints
{
  return self->_removableConstraints;
}

- (void)setRemovableConstraints:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_removableConstraints, 0);
  objc_storeStrong((id *)&self->_persistentConstraints, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_contactAvatarView, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_optionalInviteeLabel, 0);
  objc_storeStrong((id *)&self->_commentLabel, 0);

  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end