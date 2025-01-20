@interface EKUIParticipantContainer
- (EKParticipant)participant;
- (EKUILabeledAvatarView)avatar;
- (EKUIParticipantContainer)initWithParticipant:(id)a3 viewController:(id)a4;
- (NSMutableArray)labelConstraints;
- (UILabel)nameLabel;
- (UILabel)subLabel;
- (UINavigationController)navController;
- (void)setAvatar:(id)a3;
- (void)setBusy:(BOOL)a3;
- (void)setLabelConstraints:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNavController:(id)a3;
- (void)setParticipant:(id)a3;
- (void)setSubLabel:(id)a3;
- (void)singleTap:(id)a3;
- (void)updateContentForSizeCategoryChange:(id)a3;
- (void)updateSublabelWithState:(unint64_t)a3;
@end

@implementation EKUIParticipantContainer

- (EKUIParticipantContainer)initWithParticipant:(id)a3 viewController:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)EKUIParticipantContainer;
  v9 = -[EKUIParticipantContainer initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participant, a3);
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKUIParticipantContainer *)v10 setBackgroundColor:v11];

    v12 = [[EKUILabeledAvatarView alloc] initWithIdentity:v7 placement:0 options:2];
    avatar = v10->_avatar;
    v10->_avatar = v12;

    [(EKUILabeledAvatarView *)v10->_avatar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKUIParticipantContainer *)v10 addSubview:v10->_avatar];
    uint64_t v14 = objc_opt_new();
    nameLabel = v10->_nameLabel;
    v10->_nameLabel = (UILabel *)v14;

    [(UILabel *)v10->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v10->_nameLabel setFont:v16];

    v35 = [MEMORY[0x1E4F255C0] participantForSortingWithEKParticipant:v7];
    v17 = [v35 displayName];
    [(UILabel *)v10->_nameLabel setText:v17];

    [(EKUIParticipantContainer *)v10 addSubview:v10->_nameLabel];
    uint64_t v18 = objc_opt_new();
    labelConstraints = v10->_labelConstraints;
    v10->_labelConstraints = (NSMutableArray *)v18;

    [(EKUIParticipantContainer *)v10 updateSublabelWithState:0];
    v20 = [(EKUILabeledAvatarView *)v10->_avatar leadingAnchor];
    v21 = [(EKUIParticipantContainer *)v10 safeAreaLayoutGuide];
    v22 = [v21 leadingAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];

    [v23 setConstant:20.0];
    [v23 setActive:1];
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v39 = @"avatar";
    v40[0] = v10->_avatar;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    v26 = [v24 constraintsWithVisualFormat:@"H:[avatar(==30)]" options:1024 metrics:0 views:v25];
    [v24 activateConstraints:v26];

    v27 = (void *)MEMORY[0x1E4F28DC8];
    v37 = @"avatar";
    v38 = v10->_avatar;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v29 = [v27 constraintsWithVisualFormat:@"V:[avatar(==30)]" options:0 metrics:0 views:v28];
    [v27 activateConstraints:v29];

    v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10->_avatar attribute:10 relatedBy:0 toItem:v10 attribute:10 multiplier:1.0 constant:0.0];
    [v30 setActive:1];

    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v10 selector:sel_updateContentForSizeCategoryChange_ name:*MEMORY[0x1E4FB27A8] object:0];
    v32 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v10 action:sel_singleTap_];
    [v32 setNumberOfTapsRequired:1];
    [v32 setCancelsTouchesInView:0];
    [(EKUIParticipantContainer *)v10 addGestureRecognizer:v32];
    v33 = [v8 navigationController];
    [(EKUIParticipantContainer *)v10 setNavController:v33];
  }
  return v10;
}

- (void)singleTap:(id)a3
{
  v4 = [EKIdentityViewController alloc];
  v5 = [(EKUIParticipantContainer *)self participant];
  id v7 = [(EKIdentityViewController *)v4 initWithIdentity:v5];

  v6 = [(EKUIParticipantContainer *)self navController];
  [v6 pushViewController:v7 animated:1];
}

- (void)updateSublabelWithState:(unint64_t)a3
{
  v94[1] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4FB1618] systemRedColor];
  v6 = [(EKUIParticipantContainer *)self participant];
  int v7 = [v6 isLocationRoom];

  if (v7)
  {
    id v8 = EventKitUIBundle();
    v9 = v8;
    v10 = @"Room";
LABEL_7:
    uint64_t v14 = [v8 localizedStringForKey:v10 value:&stru_1F0CC2140 table:0];
    goto LABEL_8;
  }
  v11 = [(EKUIParticipantContainer *)self participant];
  uint64_t v12 = [v11 participantRole];

  if (v12 == 2)
  {
    v13 = EventKitUIBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"Optional" value:&stru_1F0CC2140 table:0];

    [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v5 = v9 = v5;
LABEL_8:

    goto LABEL_9;
  }
  v15 = [(EKUIParticipantContainer *)self participant];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = EventKitUIBundle();
    v9 = v8;
    v10 = @"Organizer";
    goto LABEL_7;
  }
  uint64_t v14 = 0;
LABEL_9:
  v17 = EventKitUIBundle();
  uint64_t v18 = [v17 localizedStringForKey:@"Conflict" value:&stru_1F0CC2140 table:0];

  if (v14)
  {
    if (a3 == 2)
    {
      v19 = NSString;
      v20 = EventKitUIBundle();
      v21 = [v20 localizedStringForKey:@"StatusConflictFormat", @"%@, %@", 0 value table];
      v22 = objc_msgSend(v19, "localizedStringWithFormat:", v21, v14, v18);

      uint64_t v23 = [v22 rangeOfString:v18];
      uint64_t v74 = v24;
      uint64_t v75 = v23;
      id v25 = objc_alloc(MEMORY[0x1E4F28E48]);
      v26 = v18;
      v27 = v5;
      uint64_t v93 = *MEMORY[0x1E4FB0700];
      uint64_t v28 = v93;
      v29 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      v94[0] = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:&v93 count:1];
      v31 = (void *)[v25 initWithString:v22 attributes:v30];

      uint64_t v91 = v28;
      v5 = v27;
      uint64_t v18 = v26;
      uint64_t v32 = (uint64_t)v31;
      v92 = v5;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
      objc_msgSend(v31, "setAttributes:range:", v33, v75, v74);

LABEL_19:
      goto LABEL_20;
    }
    id v35 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v89 = *MEMORY[0x1E4FB0700];
    v22 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v90 = v22;
    objc_super v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    uint64_t v32 = [v35 initWithString:v14 attributes:v36];
LABEL_18:

    goto LABEL_19;
  }
  if (a3 == 1)
  {
    id v37 = objc_alloc(MEMORY[0x1E4F28E48]);
    v22 = EventKitUIBundle();
    objc_super v36 = [v22 localizedStringForKey:@"Available" value:&stru_1F0CC2140 table:0];
    uint64_t v85 = *MEMORY[0x1E4FB0700];
    v38 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v86 = v38;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
    uint64_t v40 = [v37 initWithString:v36 attributes:v39];

    uint64_t v32 = v40;
    goto LABEL_18;
  }
  if (a3 == 2)
  {
    id v34 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v87 = *MEMORY[0x1E4FB0700];
    v88 = v5;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    uint64_t v32 = [v34 initWithString:v18 attributes:v22];
    goto LABEL_19;
  }
  uint64_t v32 = 0;
LABEL_20:
  v41 = (void *)MEMORY[0x1E4F28DC8];
  v42 = [(EKUIParticipantContainer *)self labelConstraints];
  [v41 deactivateConstraints:v42];

  v43 = [(EKUIParticipantContainer *)self labelConstraints];
  [v43 removeAllObjects];

  v44 = [(EKUIParticipantContainer *)self subLabel];
  v45 = v44;
  v76 = (void *)v32;
  if (v32)
  {

    if (!v45)
    {
      v46 = objc_opt_new();
      [(EKUIParticipantContainer *)self setSubLabel:v46];

      v47 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
      v48 = [(EKUIParticipantContainer *)self subLabel];
      [v48 setFont:v47];

      v49 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      v50 = [(EKUIParticipantContainer *)self subLabel];
      [v50 setTextColor:v49];

      v51 = [(EKUIParticipantContainer *)self subLabel];
      [v51 setTranslatesAutoresizingMaskIntoConstraints:0];

      v52 = [(EKUIParticipantContainer *)self subLabel];
      [(EKUIParticipantContainer *)self addSubview:v52];
    }
    v53 = [(EKUIParticipantContainer *)self subLabel];
    [v53 setAttributedText:v32];

    v54 = [(EKUIParticipantContainer *)self subLabel];
    [v54 setHidden:0];

    v55 = (void *)MEMORY[0x1E4F28DC8];
    v83[0] = @"avatar";
    v56 = [(EKUIParticipantContainer *)self avatar];
    v83[1] = @"title";
    v84[0] = v56;
    v57 = [(EKUIParticipantContainer *)self nameLabel];
    v84[1] = v57;
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];
    v59 = [v55 constraintsWithVisualFormat:@"H:[avatar]-[title]-|" options:0 metrics:0 views:v58];
    [v55 activateConstraints:v59];

    v60 = (void *)MEMORY[0x1E4F28DC8];
    v81[0] = @"avatar";
    v61 = [(EKUIParticipantContainer *)self avatar];
    v81[1] = @"subtitle";
    v82[0] = v61;
    v62 = [(EKUIParticipantContainer *)self subLabel];
    v82[1] = v62;
    v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];
    v64 = [v60 constraintsWithVisualFormat:@"H:[avatar]-[subtitle]-|" options:0 metrics:0 views:v63];
    [v60 activateConstraints:v64];

    v65 = (void *)MEMORY[0x1E4F28DC8];
    v79[0] = @"title";
    v66 = [(EKUIParticipantContainer *)self nameLabel];
    v79[1] = @"subtitle";
    v80[0] = v66;
    v67 = [(EKUIParticipantContainer *)self subLabel];
    v80[1] = v67;
    v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
    v69 = [v65 constraintsWithVisualFormat:@"V:|-(3)-[title][subtitle]-(3)-|" options:0 metrics:0 views:v68];
    [v65 activateConstraints:v69];
  }
  else
  {
    [v44 setHidden:1];

    v66 = [(EKUIParticipantContainer *)self labelConstraints];
    v70 = (void *)MEMORY[0x1E4F28DC8];
    v77[0] = @"avatar";
    v67 = [(EKUIParticipantContainer *)self avatar];
    v77[1] = @"title";
    v78[0] = v67;
    v68 = [(EKUIParticipantContainer *)self nameLabel];
    v78[1] = v68;
    v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:2];
    v71 = [v70 constraintsWithVisualFormat:@"H:[avatar]-[title]-|" options:1024 metrics:0 views:v69];
    [v66 addObjectsFromArray:v71];
  }
  v72 = (void *)MEMORY[0x1E4F28DC8];
  v73 = [(EKUIParticipantContainer *)self labelConstraints];
  [v72 activateConstraints:v73];
}

- (void)updateContentForSizeCategoryChange:(id)a3
{
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_nameLabel setFont:v4];

  [(UILabel *)self->_nameLabel invalidateIntrinsicContentSize];
  v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [(UILabel *)self->_subLabel setFont:v5];

  [(UILabel *)self->_subLabel invalidateIntrinsicContentSize];

  [(EKUIParticipantContainer *)self setNeedsLayout];
}

- (void)setBusy:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(EKUIParticipantContainer *)self updateSublabelWithState:v3];
}

- (EKParticipant)participant
{
  return (EKParticipant *)objc_getProperty(self, a2, 408, 1);
}

- (void)setParticipant:(id)a3
{
}

- (EKUILabeledAvatarView)avatar
{
  return (EKUILabeledAvatarView *)objc_getProperty(self, a2, 416, 1);
}

- (void)setAvatar:(id)a3
{
}

- (UILabel)nameLabel
{
  return (UILabel *)objc_getProperty(self, a2, 424, 1);
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)subLabel
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSubLabel:(id)a3
{
}

- (NSMutableArray)labelConstraints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLabelConstraints:(id)a3
{
}

- (UINavigationController)navController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navController);

  return (UINavigationController *)WeakRetained;
}

- (void)setNavController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navController);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_avatar, 0);

  objc_storeStrong((id *)&self->_participant, 0);
}

@end