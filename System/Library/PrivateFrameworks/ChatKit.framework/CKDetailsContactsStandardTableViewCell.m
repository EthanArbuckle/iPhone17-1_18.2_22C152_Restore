@interface CKDetailsContactsStandardTableViewCell
+ (double)preferredHeight;
- (CKDetailsContactsStandardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSMutableArray)visibleButtons;
- (void)_hideAllButtons;
- (void)_updateVisibleButtons;
- (void)layoutSubviews;
- (void)setShowsLocation:(BOOL)a3;
- (void)setShowsTUConversationStatus:(BOOL)a3;
- (void)setVisibleButtons:(id)a3;
@end

@implementation CKDetailsContactsStandardTableViewCell

- (void)layoutSubviews
{
  v138.receiver = self;
  v138.super_class = (Class)CKDetailsContactsStandardTableViewCell;
  [(CKDetailsContactsTableViewCell *)&v138 layoutSubviews];
  uint64_t v3 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  v4 = +[CKUIBehavior sharedBehaviors];
  [v4 detailsContactCellButtonWidth];
  double v6 = v5;
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 detailsContactCellButtonHeight];
  double v9 = v8;

  double v10 = 3.0;
  if (CKIsRunningInMacCatalyst())
  {
    if (v3)
    {
LABEL_3:
      double v11 = ceil(v10);
      goto LABEL_9;
    }
  }
  else
  {
    v12 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    [v12 bounds];
    if (CGRectGetWidth(v139) > 320.0) {
      double v10 = 8.0;
    }
    else {
      double v10 = 6.0;
    }

    if (v3) {
      goto LABEL_3;
    }
  }
  v13 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
  [v13 bounds];
  double v11 = ceil(v14 - v10);

LABEL_9:
  if (CKIsRunningInMacCatalyst())
  {
    v15 = +[CKUIBehavior sharedBehaviors];
    [v15 detailsInterGroupButtonPadding];
    double v17 = v16 + v16;
  }
  else
  {
    double v17 = 0.0;
  }
  v18 = [(CKDetailsContactsStandardTableViewCell *)self visibleButtons];
  uint64_t v19 = [v18 count];

  double v137 = v10;
  if (v19)
  {
    unint64_t v20 = 0;
    double v21 = ceil(v6 + v10 * 2.0);
    if (v3) {
      double v22 = v21;
    }
    else {
      double v22 = -v21;
    }
    double v23 = ceil(v6);
    if (v3) {
      double v24 = v23;
    }
    else {
      double v24 = -v23;
    }
    double v25 = floor(v6 * 0.5);
    do
    {
      if (v20) {
        double v26 = v22;
      }
      else {
        double v26 = v24;
      }
      double v11 = v11 + v26;
      v27 = [(CKDetailsContactsStandardTableViewCell *)self visibleButtons];
      v28 = [v27 objectAtIndex:v20];

      objc_msgSend(v28, "setBounds:", 0.0, 0.0, v6, v9);
      [(CKDetailsContactsStandardTableViewCell *)self bounds];
      double v30 = floor(v29 * 0.5);
      double v31 = v25 + v11 - v17;
      if (v3) {
        double v31 = v17 + v11 - v25;
      }
      objc_msgSend(v28, "setCenter:", v31, v30);
      v32 = [(CKDetailsContactsTableViewCell *)self updatingParticipantSpinner];

      [v28 setHidden:v32 != 0];
      ++v20;
      v33 = [(CKDetailsContactsStandardTableViewCell *)self visibleButtons];
      unint64_t v34 = [v33 count];
    }
    while (v20 < v34);
  }
  v35 = [(CKDetailsContactsTableViewCell *)self contactAvatarView];
  [v35 frame];
  double v37 = v36;
  double v39 = v38;

  v40 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
  v41 = v40;
  if (v3)
  {
    [v40 bounds];
    double v43 = v42;
    v44 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    [v44 layoutMargins];
    double v46 = v43 - v45 - v37;
    v47 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    [v47 bounds];
    double v49 = (v48 - v39) * 0.5;
    if (CKMainScreenScale_once_95 != -1) {
      dispatch_once(&CKMainScreenScale_once_95, &__block_literal_global_247);
    }
    double v50 = *(double *)&CKMainScreenScale_sMainScreenScale_95;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_95 == 0.0) {
      double v50 = 1.0;
    }
    double v51 = floor(v46 * v50) / v50;
    double v52 = floor(v49 * v50) / v50;
  }
  else
  {
    [v40 layoutMargins];
    double v54 = v53;
    v44 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    [v44 bounds];
    double v56 = (v55 - v39) * 0.5;
    if (CKMainScreenScale_once_95 != -1) {
      dispatch_once(&CKMainScreenScale_once_95, &__block_literal_global_247);
    }
    double v57 = *(double *)&CKMainScreenScale_sMainScreenScale_95;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_95 == 0.0) {
      double v57 = 1.0;
    }
    double v51 = floor(v54 * v57) / v57;
    double v52 = floor(v56 * v57) / v57;
  }

  v58 = [(CKDetailsContactsTableViewCell *)self contactAvatarView];
  objc_msgSend(v58, "setFrame:", v51, v52, v37, v39);

  v59 = [(CKDetailsContactsTableViewCell *)self entityName];
  v60 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  [v60 setText:v59];

  v61 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  [v61 setNumberOfLines:1];

  if (v3)
  {
    v62 = +[CKUIBehavior sharedBehaviors];
    [v62 detailsContactAvatarLabelSpacing];
    double v64 = v51 - v63;

    double v65 = ceil(v64 - (v17 + v11 + v137 * 2.0));
    v66 = [(CKDetailsContactsTableViewCell *)self nameLabel];
    [(CKDetailsContactsStandardTableViewCell *)self frame];
    objc_msgSend(v66, "sizeThatFits:", v65, v67);
    double v69 = v68;
    double v71 = v70;

    if (v69 >= v65) {
      double v72 = v65;
    }
    else {
      double v72 = v69;
    }
    v73 = +[CKUIBehavior sharedBehaviors];
    [v73 detailsContactAvatarLabelSpacing];
    double v75 = ceil(v51 - v74 - v72);
  }
  else
  {
    v76 = +[CKUIBehavior sharedBehaviors];
    [v76 detailsContactAvatarLabelSpacing];
    double v75 = ceil(v37 + v51 + v77);

    double v65 = ceil(v11 - v75 + v137 * -2.0 - v17);
    v78 = [(CKDetailsContactsTableViewCell *)self nameLabel];
    [(CKDetailsContactsStandardTableViewCell *)self frame];
    objc_msgSend(v78, "sizeThatFits:", v65, v79);
    double v72 = v80;
    double v71 = v81;

    if (v72 >= v65) {
      double v72 = v65;
    }
  }
  if ([(CKDetailsContactsTableViewCell *)self showsTUConversationStatus])
  {
    v82 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
    [v82 setNumberOfLines:1];

    v83 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
    [(CKDetailsContactsStandardTableViewCell *)self frame];
    objc_msgSend(v83, "sizeThatFits:", v65, v84);
    double v86 = v85;
    double v88 = v87;

    [(CKDetailsContactsStandardTableViewCell *)self frame];
    double v90 = (v89 - v71 - v88) * 0.5;
    if (CKMainScreenScale_once_95 != -1) {
      dispatch_once(&CKMainScreenScale_once_95, &__block_literal_global_247);
    }
    double v91 = *(double *)&CKMainScreenScale_sMainScreenScale_95;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_95 == 0.0) {
      double v91 = 1.0;
    }
    double v92 = floor(v90 * v91) / v91;
    if (v86 < v65) {
      double v65 = v86;
    }
    v140.origin.x = v75;
    v140.origin.y = v92;
    v140.size.width = v72;
    v140.size.height = v71;
    double MaxY = CGRectGetMaxY(v140);
    double v94 = v65 - v72;
    if (!v3) {
      double v94 = 0.0;
    }
    double v95 = v75 - v94;
    v96 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
LABEL_64:
    v109 = v96;
    objc_msgSend(v96, "setFrame:", v95, MaxY, v65, v88);

    goto LABEL_66;
  }
  if ([(CKDetailsContactsTableViewCell *)self showsLocation])
  {
    v97 = [(CKDetailsContactsTableViewCell *)self locationString];
    v98 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    [v98 setText:v97];

    v99 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    [v99 setNumberOfLines:1];

    v100 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    [(CKDetailsContactsStandardTableViewCell *)self frame];
    objc_msgSend(v100, "sizeThatFits:", v65, v101);
    double v103 = v102;
    double v88 = v104;

    [(CKDetailsContactsStandardTableViewCell *)self frame];
    double v106 = (v105 - v71 - v88) * 0.5;
    if (CKMainScreenScale_once_95 != -1) {
      dispatch_once(&CKMainScreenScale_once_95, &__block_literal_global_247);
    }
    double v107 = *(double *)&CKMainScreenScale_sMainScreenScale_95;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_95 == 0.0) {
      double v107 = 1.0;
    }
    double v92 = floor(v106 * v107) / v107;
    if (v103 < v65) {
      double v65 = v103;
    }
    v141.origin.x = v75;
    v141.origin.y = v92;
    v141.size.width = v72;
    v141.size.height = v71;
    double MaxY = CGRectGetMaxY(v141);
    double v108 = v65 - v72;
    if (!v3) {
      double v108 = 0.0;
    }
    double v95 = v75 - v108;
    v96 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    goto LABEL_64;
  }
  [(CKDetailsContactsStandardTableViewCell *)self frame];
  double v71 = v110;
  double v92 = 0.0;
LABEL_66:
  v111 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  objc_msgSend(v111, "setFrame:", v75, v92, v72, v71);

  v112 = [(CKDetailsContactsTableViewCell *)self updatingParticipantSpinner];

  if (v112)
  {
    v113 = [(CKDetailsContactsStandardTableViewCell *)self visibleButtons];
    v114 = [v113 lastObject];

    v115 = [(CKDetailsContactsTableViewCell *)self updatingParticipantSpinner];
    [v114 center];
    objc_msgSend(v115, "setCenter:");

    v116 = [(CKDetailsContactsTableViewCell *)self updatingParticipantSpinner];
    [v116 startAnimating];
  }
  v117 = [(CKDetailsCell *)self topSeperator];
  [v117 frame];
  double v119 = v118;
  double v121 = v120;
  double v123 = v122;

  v124 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
  [v124 layoutMargins];
  double v126 = v125;
  v127 = +[CKUIBehavior sharedBehaviors];
  [v127 detailsContactAvatarLabelSpacing];
  double v129 = v126 + v128;
  v130 = +[CKUIBehavior sharedBehaviors];
  [v130 detailsViewContactImageDiameter];
  double v132 = v129 + v131;

  double v133 = v132;
  if (v3)
  {
    v134 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    [v134 layoutMargins];
    double v133 = v135;
  }
  v136 = [(CKDetailsCell *)self topSeperator];
  objc_msgSend(v136, "setFrame:", v133, v119, v121 - v132, v123);
}

+ (double)preferredHeight
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 detailsContactCellMinimumHeight];
  double v4 = v3;

  return v4;
}

- (CKDetailsContactsStandardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)CKDetailsContactsStandardTableViewCell;
  double v4 = [(CKDetailsContactsTableViewCell *)&v19 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4)
  {
    double v6 = [(CKDetailsContactsTableViewCell *)v4 nameLabel];
    [v6 setLineBreakMode:4];

    v7 = [(CKDetailsContactsStandardTableViewCell *)v5 contentView];
    double v8 = [(CKDetailsContactsTableViewCell *)v5 nameLabel];
    [v7 addSubview:v8];

    double v9 = +[CKUIBehavior sharedBehaviors];
    [v9 detailsViewContactImageDiameter];
    double v11 = v10;
    v12 = +[CKUIBehavior sharedBehaviors];
    [v12 detailsViewContactImageDiameter];
    double v14 = v13;
    v15 = [(CKDetailsContactsTableViewCell *)v5 contactAvatarView];
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, v11, v14);

    double v16 = [(CKDetailsContactsStandardTableViewCell *)v5 contentView];
    double v17 = [(CKDetailsContactsTableViewCell *)v5 contactAvatarView];
    [v16 addSubview:v17];
  }
  return v5;
}

- (void)setShowsLocation:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKDetailsContactsStandardTableViewCell;
  [(CKDetailsContactsTableViewCell *)&v10 setShowsLocation:a3];
  uint64_t v4 = [(CKDetailsContactsTableViewCell *)self locationLabel];
  if (v4)
  {
    double v5 = (void *)v4;
    double v6 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    v7 = [v6 superview];

    if (!v7)
    {
      double v8 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
      double v9 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      [v8 addSubview:v9];
    }
  }
}

- (void)setShowsTUConversationStatus:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKDetailsContactsStandardTableViewCell;
  [(CKDetailsContactsTableViewCell *)&v8 setShowsTUConversationStatus:a3];
  uint64_t v4 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
  double v5 = [v4 superview];

  if (!v5)
  {
    double v6 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    v7 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
    [v6 addSubview:v7];
  }
}

- (void)_updateVisibleButtons
{
  visibleButtons = self->_visibleButtons;
  if (!visibleButtons)
  {
    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v5 = self->_visibleButtons;
    self->_visibleButtons = v4;

    visibleButtons = self->_visibleButtons;
  }
  [(NSMutableArray *)visibleButtons removeAllObjects];
  if ([(CKDetailsContactsTableViewCell *)self showPhoneButton])
  {
    double v6 = self->_visibleButtons;
    v7 = [(CKDetailsContactsTableViewCell *)self phoneButton];
    [(NSMutableArray *)v6 addObject:v7];

    objc_super v8 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    double v9 = [(CKDetailsContactsTableViewCell *)self phoneButton];
    [v8 addSubview:v9];
  }
  else
  {
    objc_super v8 = [(CKDetailsContactsTableViewCell *)self phoneButton];
    [v8 removeFromSuperview];
  }

  if ([(CKDetailsContactsTableViewCell *)self showMessageButton])
  {
    objc_super v10 = self->_visibleButtons;
    double v11 = [(CKDetailsContactsTableViewCell *)self messageButton];
    [(NSMutableArray *)v10 addObject:v11];

    v12 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    double v13 = [(CKDetailsContactsTableViewCell *)self messageButton];
    [v12 addSubview:v13];
  }
  else
  {
    v12 = [(CKDetailsContactsTableViewCell *)self messageButton];
    [v12 removeFromSuperview];
  }

  if ([(CKDetailsContactsTableViewCell *)self showFaceTimeVideoButton])
  {
    double v14 = self->_visibleButtons;
    v15 = [(CKDetailsContactsTableViewCell *)self facetimeVideoButton];
    [(NSMutableArray *)v14 addObject:v15];

    double v16 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    double v17 = [(CKDetailsContactsTableViewCell *)self facetimeVideoButton];
    [v16 addSubview:v17];
  }
  else
  {
    double v16 = [(CKDetailsContactsTableViewCell *)self facetimeVideoButton];
    [v16 removeFromSuperview];
  }

  if ([(CKDetailsContactsTableViewCell *)self showScreenSharingButton])
  {
    v18 = self->_visibleButtons;
    objc_super v19 = [(CKDetailsContactsTableViewCell *)self screenSharingButton];
    [(NSMutableArray *)v18 addObject:v19];

    unint64_t v20 = [(CKDetailsContactsStandardTableViewCell *)self contentView];
    double v21 = [(CKDetailsContactsTableViewCell *)self screenSharingButton];
    [v20 addSubview:v21];
  }
  else
  {
    unint64_t v20 = [(CKDetailsContactsTableViewCell *)self screenSharingButton];
    [v20 removeFromSuperview];
  }

  [(CKDetailsContactsStandardTableViewCell *)self layoutSubviews];
}

- (void)_hideAllButtons
{
  visibleButtons = self->_visibleButtons;
  if (!visibleButtons)
  {
    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v5 = self->_visibleButtons;
    self->_visibleButtons = v4;

    visibleButtons = self->_visibleButtons;
  }
  [(NSMutableArray *)visibleButtons removeAllObjects];
  if ([(CKDetailsContactsTableViewCell *)self showPhoneButton])
  {
    double v6 = [(CKDetailsContactsTableViewCell *)self phoneButton];
    [v6 removeFromSuperview];
  }
  if ([(CKDetailsContactsTableViewCell *)self showMessageButton])
  {
    v7 = [(CKDetailsContactsTableViewCell *)self messageButton];
    [v7 removeFromSuperview];
  }
  if ([(CKDetailsContactsTableViewCell *)self showFaceTimeVideoButton])
  {
    objc_super v8 = [(CKDetailsContactsTableViewCell *)self facetimeVideoButton];
    [v8 removeFromSuperview];
  }
  if ([(CKDetailsContactsTableViewCell *)self showScreenSharingButton])
  {
    double v9 = [(CKDetailsContactsTableViewCell *)self screenSharingButton];
    [v9 removeFromSuperview];
  }

  [(CKDetailsContactsStandardTableViewCell *)self layoutSubviews];
}

- (NSMutableArray)visibleButtons
{
  return self->_visibleButtons;
}

- (void)setVisibleButtons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end