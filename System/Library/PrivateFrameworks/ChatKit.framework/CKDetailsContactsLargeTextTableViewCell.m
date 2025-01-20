@interface CKDetailsContactsLargeTextTableViewCell
+ (double)estimatedHeight;
+ (double)preferredHeight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDetailsContactsLargeTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)buttonsTopConstraint;
- (void)_hideAllButtons;
- (void)_initConstraints;
- (void)_updateVisibleButtons;
- (void)configureWithViewModel:(id)a3;
- (void)setButtonsTopConstraint:(id)a3;
- (void)setShowsLocation:(BOOL)a3;
- (void)setShowsTUConversationStatus:(BOOL)a3;
@end

@implementation CKDetailsContactsLargeTextTableViewCell

- (void)_initConstraints
{
  v85[8] = *MEMORY[0x1E4F143B8];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 detailsViewContactImageDiameter];
  double v5 = v4;

  v48 = (void *)MEMORY[0x1E4F28DC8];
  v80 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
  v74 = [v80 heightAnchor];
  v77 = +[CKUIBehavior sharedBehaviors];
  [v77 detailsContactCellMinimumHeight];
  v71 = objc_msgSend(v74, "constraintGreaterThanOrEqualToConstant:");
  v85[0] = v71;
  v68 = [(CKDetailsContactsTableViewCell *)self contactAvatarView];
  v65 = [v68 widthAnchor];
  v62 = [v65 constraintEqualToConstant:v5];
  v85[1] = v62;
  v59 = [(CKDetailsContactsTableViewCell *)self contactAvatarView];
  v56 = [v59 heightAnchor];
  v54 = [v56 constraintEqualToConstant:v5];
  v85[2] = v54;
  v53 = [(CKDetailsContactsTableViewCell *)self contactAvatarView];
  v51 = [v53 leadingAnchor];
  v52 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
  v50 = [v52 layoutMarginsGuide];
  v49 = [v50 leadingAnchor];
  v47 = [v51 constraintEqualToAnchor:v49];
  v85[3] = v47;
  v46 = [(CKDetailsContactsTableViewCell *)self contactAvatarView];
  v45 = [v46 topAnchor];
  v44 = [(CKDetailsContactsLargeTextTableViewCell *)self topAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:10.0];
  v85[4] = v43;
  v42 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  v40 = [v42 leadingAnchor];
  v41 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
  v39 = [v41 layoutMarginsGuide];
  v38 = [v39 leadingAnchor];
  v37 = [v40 constraintEqualToAnchor:v38];
  v85[5] = v37;
  v36 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  v34 = [v36 trailingAnchor];
  v35 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
  v6 = [v35 layoutMarginsGuide];
  v7 = [v6 trailingAnchor];
  v8 = [v34 constraintEqualToAnchor:v7];
  v85[6] = v8;
  v9 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  v10 = [v9 topAnchor];
  v11 = [(CKDetailsContactsTableViewCell *)self contactAvatarView];
  v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v85[7] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:8];
  [v48 activateConstraints:v14];

  if ([(CKDetailsContactsTableViewCell *)self showsLocation])
  {
    v60 = (void *)MEMORY[0x1E4F28DC8];
    v81 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    v75 = [v81 leadingAnchor];
    v78 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
    v72 = [v78 layoutMarginsGuide];
    v69 = [v72 leadingAnchor];
    v66 = [v75 constraintEqualToAnchor:v69];
    v84[0] = v66;
    v63 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    v55 = [v63 topAnchor];
    v57 = [(CKDetailsContactsTableViewCell *)self nameLabel];
    v15 = [v57 bottomAnchor];
    v16 = [v55 constraintEqualToAnchor:v15];
    v84[1] = v16;
    v17 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    v18 = [v17 trailingAnchor];
    v19 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
    v20 = [v19 layoutMarginsGuide];
    v21 = [v20 trailingAnchor];
    v22 = [v18 constraintEqualToAnchor:v21];
    v84[2] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
    [v60 activateConstraints:v23];
  }
  if ([(CKDetailsContactsTableViewCell *)self showsTUConversationStatus])
  {
    v61 = (void *)MEMORY[0x1E4F28DC8];
    v82 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
    v76 = [v82 leadingAnchor];
    v79 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
    v73 = [v79 layoutMarginsGuide];
    v70 = [v73 leadingAnchor];
    v67 = [v76 constraintEqualToAnchor:v70];
    v83[0] = v67;
    v64 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
    v58 = [v64 topAnchor];
    v24 = [(CKDetailsContactsTableViewCell *)self nameLabel];
    v25 = [v24 bottomAnchor];
    v26 = [v58 constraintEqualToAnchor:v25];
    v83[1] = v26;
    v27 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
    v28 = [v27 trailingAnchor];
    v29 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
    v30 = [v29 layoutMarginsGuide];
    v31 = [v30 trailingAnchor];
    v32 = [v28 constraintEqualToAnchor:v31];
    v83[2] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:3];
    [v61 activateConstraints:v33];
  }
}

+ (double)preferredHeight
{
  return *MEMORY[0x1E4F43D18];
}

+ (double)estimatedHeight
{
  return *MEMORY[0x1E4F43D18];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double v5 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
  v6 = [v5 layoutMarginsGuide];
  [v6 layoutFrame];
  double v8 = v7;

  v9 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  objc_msgSend(v9, "sizeThatFits:", v8, height);
  double v11 = v10;

  v12 = +[CKUIBehavior sharedBehaviors];
  [v12 detailsContactCellButtonHeight];
  double v14 = v11 + v13 + 20.0;

  if ([(CKDetailsContactsTableViewCell *)self showsTUConversationStatus])
  {
    v15 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
LABEL_5:
    v16 = v15;
    objc_msgSend(v15, "sizeThatFits:", v8, v14);
    double v14 = v14 + v17;

    goto LABEL_6;
  }
  if ([(CKDetailsContactsTableViewCell *)self showsLocation])
  {
    v15 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    goto LABEL_5;
  }
LABEL_6:
  double v18 = v8;
  double v19 = v14;
  result.double height = v19;
  result.width = v18;
  return result;
}

- (CKDetailsContactsLargeTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)CKDetailsContactsLargeTextTableViewCell;
  double v4 = [(CKDetailsContactsTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4)
  {
    v6 = [(CKDetailsContactsTableViewCell *)v4 contactAvatarView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v7 = [(CKDetailsContactsTableViewCell *)v5 nameLabel];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v8 = [(CKDetailsContactsTableViewCell *)v5 nameLabel];
    [v8 setNumberOfLines:0];

    v9 = [(CKDetailsContactsTableViewCell *)v5 nameLabel];
    [v9 setLineBreakMode:0];

    double v10 = [(CKDetailsContactsTableViewCell *)v5 nameLabel];
    LODWORD(v11) = 1148846080;
    [v10 setContentHuggingPriority:1 forAxis:v11];

    v12 = [(CKDetailsContactsLargeTextTableViewCell *)v5 contentView];
    double v13 = [(CKDetailsContactsTableViewCell *)v5 contactAvatarView];
    [v12 addSubview:v13];

    double v14 = [(CKDetailsContactsLargeTextTableViewCell *)v5 contentView];
    v15 = [(CKDetailsContactsTableViewCell *)v5 nameLabel];
    [v14 addSubview:v15];

    [(CKDetailsContactsLargeTextTableViewCell *)v5 _hideAllButtons];
    [(CKDetailsContactsLargeTextTableViewCell *)v5 _initConstraints];
  }
  return v5;
}

- (void)setShowsLocation:(BOOL)a3
{
  BOOL v3 = a3;
  v32[3] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(CKDetailsContactsTableViewCell *)self showsLocation];
  v31.receiver = self;
  v31.super_class = (Class)CKDetailsContactsLargeTextTableViewCell;
  [(CKDetailsContactsTableViewCell *)&v31 setShowsLocation:v3];
  if (v5 != [(CKDetailsContactsTableViewCell *)self showsLocation])
  {
    if ([(CKDetailsContactsTableViewCell *)self showsLocation])
    {
      v6 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v7 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      [v7 setNumberOfLines:0];

      double v8 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
      v9 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      [v8 addSubview:v9];

      double v10 = [(CKDetailsContactsLargeTextTableViewCell *)self buttonsTopConstraint];
      [v10 setActive:0];

      v24 = (void *)MEMORY[0x1E4F28DC8];
      double v11 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      v29 = [v11 leadingAnchor];
      v30 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
      v28 = [v30 layoutMarginsGuide];
      v27 = [v28 leadingAnchor];
      v26 = [v29 constraintEqualToAnchor:v27];
      v32[0] = v26;
      v25 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      v22 = [v25 trailingAnchor];
      v23 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
      v21 = [v23 layoutMarginsGuide];
      v12 = [v21 trailingAnchor];
      double v13 = [v22 constraintEqualToAnchor:v12];
      v32[1] = v13;
      double v14 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      v15 = [v14 topAnchor];
      v16 = [(CKDetailsContactsTableViewCell *)self nameLabel];
      objc_super v17 = [v16 bottomAnchor];
      double v18 = [v15 constraintEqualToAnchor:v17 constant:0.0];
      v32[2] = v18;
      double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
      [v24 activateConstraints:v19];
    }
    else
    {
      double v11 = [(CKDetailsContactsLargeTextTableViewCell *)self buttonsTopConstraint];
      [v11 setActive:1];
    }

    v20 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
    [v20 setNeedsLayout];
  }
}

- (void)setShowsTUConversationStatus:(BOOL)a3
{
  BOOL v3 = a3;
  v32[3] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(CKDetailsContactsTableViewCell *)self showsTUConversationStatus];
  v31.receiver = self;
  v31.super_class = (Class)CKDetailsContactsLargeTextTableViewCell;
  [(CKDetailsContactsTableViewCell *)&v31 setShowsTUConversationStatus:v3];
  if (v5 != [(CKDetailsContactsTableViewCell *)self showsTUConversationStatus])
  {
    if ([(CKDetailsContactsTableViewCell *)self showsTUConversationStatus])
    {
      v6 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v7 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
      [v7 setNumberOfLines:0];

      double v8 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
      v9 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
      [v8 addSubview:v9];

      double v10 = [(CKDetailsContactsLargeTextTableViewCell *)self buttonsTopConstraint];
      [v10 setActive:0];

      v24 = (void *)MEMORY[0x1E4F28DC8];
      double v11 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
      v29 = [v11 leadingAnchor];
      v30 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
      v28 = [v30 layoutMarginsGuide];
      v27 = [v28 leadingAnchor];
      v26 = [v29 constraintEqualToAnchor:v27];
      v32[0] = v26;
      v25 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
      v22 = [v25 trailingAnchor];
      v23 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
      v21 = [v23 layoutMarginsGuide];
      v12 = [v21 trailingAnchor];
      double v13 = [v22 constraintEqualToAnchor:v12];
      v32[1] = v13;
      double v14 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
      v15 = [v14 topAnchor];
      v16 = [(CKDetailsContactsTableViewCell *)self nameLabel];
      objc_super v17 = [v16 bottomAnchor];
      double v18 = [v15 constraintEqualToAnchor:v17 constant:0.0];
      v32[2] = v18;
      double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
      [v24 activateConstraints:v19];
    }
    else
    {
      double v11 = [(CKDetailsContactsLargeTextTableViewCell *)self buttonsTopConstraint];
      [v11 setActive:1];
    }

    v20 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
    [v20 setNeedsLayout];
  }
}

- (void)configureWithViewModel:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CKDetailsContactsLargeTextTableViewCell;
  [(CKDetailsContactsTableViewCell *)&v13 configureWithViewModel:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  v6 = [(CKDetailsContactsTableViewCell *)self entityName];
  uint64_t v14 = *MEMORY[0x1E4FB0738];
  v15[0] = v4;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  double v8 = (void *)[v5 initWithString:v6 attributes:v7];

  v9 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  [v9 setAttributedText:v8];

  double v10 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  [v10 _setOverallWritingDirectionFollowsLayoutDirection:1];

  double v11 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  [v11 setNumberOfLines:0];

  v12 = [(CKDetailsContactsLargeTextTableViewCell *)self contentView];
  [v12 setNeedsLayout];
}

- (void)_updateVisibleButtons
{
  uint64_t v3 = [(CKDetailsContactsTableViewCell *)self showFaceTimeVideoButton] ^ 1;
  id v4 = [(CKDetailsContactsTableViewCell *)self facetimeVideoButton];
  [v4 setHidden:v3];

  uint64_t v5 = [(CKDetailsContactsTableViewCell *)self showMessageButton] ^ 1;
  v6 = [(CKDetailsContactsTableViewCell *)self messageButton];
  [v6 setHidden:v5];

  uint64_t v7 = [(CKDetailsContactsTableViewCell *)self showPhoneButton] ^ 1;
  double v8 = [(CKDetailsContactsTableViewCell *)self phoneButton];
  [v8 setHidden:v7];

  uint64_t v9 = [(CKDetailsContactsTableViewCell *)self showScreenSharingButton] ^ 1;
  id v10 = [(CKDetailsContactsTableViewCell *)self screenSharingButton];
  [v10 setHidden:v9];
}

- (void)_hideAllButtons
{
  uint64_t v3 = [(CKDetailsContactsTableViewCell *)self facetimeVideoButton];
  [v3 setHidden:1];

  id v4 = [(CKDetailsContactsTableViewCell *)self messageButton];
  [v4 setHidden:1];

  uint64_t v5 = [(CKDetailsContactsTableViewCell *)self phoneButton];
  [v5 setHidden:1];

  id v6 = [(CKDetailsContactsTableViewCell *)self screenSharingButton];
  [v6 setHidden:1];
}

- (NSLayoutConstraint)buttonsTopConstraint
{
  return self->_buttonsTopConstraint;
}

- (void)setButtonsTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end