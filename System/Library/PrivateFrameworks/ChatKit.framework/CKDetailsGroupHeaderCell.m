@interface CKDetailsGroupHeaderCell
+ (id)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDetailsAvatarPancakeView)avatarView;
- (CKDetailsGroupHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 participants:(id)a5;
- (NSArray)avatarViews;
- (UILabel)subTitleLabel;
- (UILabel)titleLabel;
- (double)_additionalHeightToAccommodateInterTextVerticalSpacing;
- (id)constraintsForAccessibility;
- (id)standardConstraints;
- (id)standardWolfConstraints;
- (void)addConstraints;
- (void)configureCellIconForCollapsedState:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAvatarView:(id)a3;
- (void)setAvatarViews:(id)a3;
- (void)setSubTitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CKDetailsGroupHeaderCell

+ (id)reuseIdentifier
{
  return @"CKDetailsGroupHeaderContactsCell_reuseIdentifier";
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsGroupHeaderCell;
  [(CKDetailsCell *)&v4 prepareForReuse];
  v3 = [(CKDetailsGroupHeaderCell *)self avatarView];
  [v3 removeFromSuperview];
}

- (CKDetailsGroupHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 participants:(id)a5
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v101.receiver = self;
  v101.super_class = (Class)CKDetailsGroupHeaderCell;
  v9 = [(CKDetailsCell *)&v101 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(CKDetailsGroupHeaderCell *)v9 setSelectionStyle:2];
    id v11 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    [(CKDetailsGroupHeaderCell *)v10 setTitleLabel:v16];

    v17 = [(CKDetailsGroupHeaderCell *)v10 titleLabel];
    v18 = +[CKUIBehavior sharedBehaviors];
    v19 = [v18 detailsGroupHeaderCellTitleFont];
    [v17 setFont:v19];

    v20 = [(CKDetailsGroupHeaderCell *)v10 titleLabel];
    v21 = +[CKUIBehavior sharedBehaviors];
    v22 = [v21 theme];
    v23 = [v22 detailsContactCellTitleColor];
    [v20 setTextColor:v23];

    v24 = [(CKDetailsGroupHeaderCell *)v10 titleLabel];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

    v25 = [(CKDetailsGroupHeaderCell *)v10 titleLabel];
    v26 = NSString;
    v27 = CKFrameworkBundle();
    v28 = [v27 localizedStringForKey:@"GROUP_PEOPLE_COUNT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v29 = objc_msgSend(v26, "localizedStringWithFormat:", v28, objc_msgSend(v8, "count"));

    v30 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v31 = [v30 userInterfaceLayoutDirection];

    if (v31 == 1) {
      v32 = @"\u200F";
    }
    else {
      v32 = @"\u200E";
    }
    v33 = [(__CFString *)v32 stringByAppendingString:v29];

    [v25 setText:v33];
    v34 = [(CKDetailsGroupHeaderCell *)v10 titleLabel];
    [v34 setContentMode:4];

    v35 = [(CKDetailsGroupHeaderCell *)v10 titleLabel];
    [v35 setNumberOfLines:0];

    v36 = [(CKDetailsGroupHeaderCell *)v10 titleLabel];
    [v36 setLineBreakMode:0];

    id v37 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v38 = MEMORY[0x1E4F1CBF0];
    v39 = (void *)[v37 initWithArray:MEMORY[0x1E4F1CBF0]];
    v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v38];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v96 = v8;
    id v41 = v8;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v97 objects:v102 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v98;
      uint64_t v45 = MEMORY[0x1E4F1CBF0];
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v98 != v44) {
            objc_enumerationMutation(v41);
          }
          v47 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          v48 = [v47 abbreviatedDisplayName];
          [v39 addObject:v48];

          v49 = [v47 defaultIMHandle];
          v50 = [v49 cnContactWithKeys:v45];

          v51 = (void *)[objc_alloc(MEMORY[0x1E4F1BB38]) initWithContact:v50];
          [v40 addObject:v51];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v97 objects:v102 count:16];
      }
      while (v43);
    }

    unint64_t v52 = [v40 count];
    if (v52 >= 3) {
      uint64_t v53 = 3;
    }
    else {
      uint64_t v53 = v52;
    }
    v54 = objc_msgSend(v40, "subarrayWithRange:", 0, v53);
    [(CKDetailsGroupHeaderCell *)v10 setAvatarViews:v54];

    v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v12, v13, v14, v15);
    [(CKDetailsGroupHeaderCell *)v10 setSubTitleLabel:v55];

    v56 = [(CKDetailsGroupHeaderCell *)v10 subTitleLabel];
    v57 = +[CKUIBehavior sharedBehaviors];
    v58 = [v57 detailsGroupHeaderCellSubtitleFont];
    [v56 setFont:v58];

    v59 = [(CKDetailsGroupHeaderCell *)v10 subTitleLabel];
    v60 = +[CKUIBehavior sharedBehaviors];
    v61 = [v60 theme];
    v62 = [v61 detailsContactCellSubTitleColor];
    [v59 setTextColor:v62];

    v63 = [(CKDetailsGroupHeaderCell *)v10 subTitleLabel];
    [v63 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v64 = [v39 count];
    v65 = [(CKDetailsGroupHeaderCell *)v10 subTitleLabel];
    if (v64)
    {
      v66 = NSString;
      v67 = [v39 valueForKey:@"description"];
      v68 = [v67 componentsJoinedByString:@", "];
      v69 = [v66 stringWithFormat:@"%@", v68];
      [v65 setText:v69];
    }
    else
    {
      v67 = CKFrameworkBundle();
      v68 = [v67 localizedStringForKey:@"CONTACT_DETAILS_SUBTITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v65 setText:v68];
    }

    v70 = [(CKDetailsGroupHeaderCell *)v10 subTitleLabel];
    [v70 setClipsToBounds:0];

    v71 = [(CKDetailsGroupHeaderCell *)v10 subTitleLabel];
    [v71 setLineBreakMode:4];

    v72 = [(CKDetailsGroupHeaderCell *)v10 subTitleLabel];
    [v72 setNumberOfLines:1];

    [(CKDetailsGroupHeaderCell *)v10 configureCellIconForCollapsedState:1];
    v73 = [(CKDetailsGroupHeaderCell *)v10 avatarViews];
    uint64_t v74 = [v73 count];
    v75 = +[CKUIBehavior sharedBehaviors];
    v76 = v75;
    if (v74 == 3) {
      [v75 detailsAvatarPancakeViewWidth3Avatars];
    }
    else {
      [v75 detailsAvatarPancakeViewWidth2Avatars];
    }
    double v78 = v77;

    v79 = [(CKDetailsGroupHeaderCell *)v10 avatarViews];
    uint64_t v80 = [v79 count];

    if (v80)
    {
      v81 = [CKDetailsAvatarPancakeView alloc];
      v82 = +[CKUIBehavior sharedBehaviors];
      [(CKDetailsAvatarPancakeView *)v82 detailsAvatarCutoutDiameter];
      double v84 = v83;
      v85 = [(CKDetailsGroupHeaderCell *)v10 avatarViews];
      v86 = -[CKDetailsAvatarPancakeView initWithSize:avatarViews:](v81, "initWithSize:avatarViews:", v85, v78, v84);
      [(CKDetailsGroupHeaderCell *)v10 setAvatarView:v86];
    }
    else
    {
      v82 = objc_alloc_init(CKDetailsAvatarPancakeView);
      [(CKDetailsGroupHeaderCell *)v10 setAvatarView:v82];
    }
    id v8 = v96;

    v87 = [(CKDetailsGroupHeaderCell *)v10 avatarView];
    [v87 setTranslatesAutoresizingMaskIntoConstraints:0];

    v88 = [(CKDetailsGroupHeaderCell *)v10 contentView];
    v89 = [(CKDetailsGroupHeaderCell *)v10 titleLabel];
    [v88 addSubview:v89];

    v90 = [(CKDetailsGroupHeaderCell *)v10 contentView];
    v91 = [(CKDetailsGroupHeaderCell *)v10 subTitleLabel];
    [v90 addSubview:v91];

    v92 = [(CKDetailsGroupHeaderCell *)v10 contentView];
    v93 = [(CKDetailsGroupHeaderCell *)v10 avatarView];
    [v92 addSubview:v93];

    v94 = [(CKDetailsGroupHeaderCell *)v10 contentView];
    [v94 setBackgroundColor:0];

    [(CKDetailsGroupHeaderCell *)v10 addConstraints];
  }

  return v10;
}

- (double)_additionalHeightToAccommodateInterTextVerticalSpacing
{
  v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [v3 isAccessibilityPreferredContentSizeCategory];

  double result = 0.0;
  if ((v4 & 1) == 0)
  {
    v6 = +[CKUIBehavior sharedBehaviors];
    [v6 detailsGroupHeaderCellInterTextVerticalSpacing];
    double v8 = v7;
    v9 = [(CKDetailsGroupHeaderCell *)self titleLabel];
    v10 = [v9 font];
    [v10 pointSize];
    double v12 = v8 + v11 * 0.5;

    double v13 = [(CKDetailsGroupHeaderCell *)self titleLabel];
    double v14 = [v13 font];
    [v14 _scaledValueForValue:1 useLanguageAwareScaling:v12];
    double v16 = v15;

    double v17 = v16 - v12;
    v18 = +[CKUIBehavior sharedBehaviors];
    [v18 detailsGroupHeaderCellInterTextVerticalSpacing];
    double v20 = v19;
    v21 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
    v22 = [v21 font];
    [v22 pointSize];
    double v24 = v20 + v23 * 0.5;

    v25 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
    v26 = [v25 font];
    [v26 _scaledValueForValue:1 useLanguageAwareScaling:v24];
    double v28 = v27;

    return v17 + v28 - v24;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = +[CKUIBehavior sharedBehaviors];
  int v7 = [v6 isAccessibilityPreferredContentSizeCategory];

  double v8 = +[CKUIBehavior sharedBehaviors];
  v9 = v8;
  if (v7)
  {
    [v8 detailsAvatarCutoutDiameter];
    double v11 = v10;

    double v12 = [(CKDetailsGroupHeaderCell *)self titleLabel];
    objc_msgSend(v12, "sizeThatFits:", width, height);
    double v14 = v13;

    double v15 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
    objc_msgSend(v15, "sizeThatFits:", width, height);
    double v17 = v16;

    [(CKDetailsGroupHeaderCell *)self layoutMargins];
    double v19 = v18;
    [(CKDetailsGroupHeaderCell *)self layoutMargins];
    double v21 = v11 + v14 + v17 + v19 + v20;
  }
  else
  {
    [v8 detailsContactCellMinimumHeight];
    double v21 = v22;
  }
  [(CKDetailsGroupHeaderCell *)self _additionalHeightToAccommodateInterTextVerticalSpacing];
  double v24 = v21 + v23;
  double v25 = width;
  result.double height = v24;
  result.double width = v25;
  return result;
}

- (void)addConstraints
{
  v37[5] = *MEMORY[0x1E4F143B8];
  v36 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(CKDetailsGroupHeaderCell *)self avatarViews];
  unint64_t v4 = [v3 count];
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = v5;
  if (v4 >= 3) {
    [v5 detailsAvatarPancakeViewWidth3Avatars];
  }
  else {
    [v5 detailsAvatarPancakeViewWidth2Avatars];
  }
  double v8 = v7;

  v35 = [(CKDetailsGroupHeaderCell *)self avatarView];
  v34 = [v35 widthAnchor];
  v33 = [v34 constraintEqualToConstant:v8];
  v37[0] = v33;
  v32 = [(CKDetailsGroupHeaderCell *)self avatarView];
  v30 = [v32 heightAnchor];
  uint64_t v31 = +[CKUIBehavior sharedBehaviors];
  [v31 detailsAvatarCutoutDiameter];
  v29 = objc_msgSend(v30, "constraintEqualToConstant:");
  v37[1] = v29;
  double v28 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  v26 = [v28 heightAnchor];
  double v27 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  double v25 = [v27 font];
  [v25 pointSize];
  double v24 = objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:");
  v37[2] = v24;
  double v23 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  double v21 = [v23 heightAnchor];
  double v22 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  v9 = [v22 font];
  [v9 pointSize];
  double v10 = objc_msgSend(v21, "constraintGreaterThanOrEqualToConstant:");
  v37[3] = v10;
  double v11 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  double v12 = [v11 trailingAnchor];
  double v13 = [(CKDetailsGroupHeaderCell *)self contentView];
  double v14 = [v13 trailingAnchor];
  double v15 = [(CKDetailsGroupHeaderCell *)self contentView];
  [v15 layoutMargins];
  double v17 = [v12 constraintEqualToAnchor:v14 constant:v16];
  v37[4] = v17;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  [v36 addObjectsFromArray:v18];

  double v19 = +[CKUIBehavior sharedBehaviors];
  LODWORD(v11) = [v19 isAccessibilityPreferredContentSizeCategory];

  if (v11) {
    [(CKDetailsGroupHeaderCell *)self constraintsForAccessibility];
  }
  else {
  double v20 = [(CKDetailsGroupHeaderCell *)self standardConstraints];
  }
  [v36 addObjectsFromArray:v20];

  [MEMORY[0x1E4F28DC8] activateConstraints:v36];
}

- (id)constraintsForAccessibility
{
  v49[7] = *MEMORY[0x1E4F143B8];
  v48 = [(CKDetailsGroupHeaderCell *)self avatarView];
  v46 = [v48 topAnchor];
  v47 = [(CKDetailsGroupHeaderCell *)self contentView];
  uint64_t v44 = [v47 topAnchor];
  uint64_t v45 = [(CKDetailsGroupHeaderCell *)self contentView];
  [v45 layoutMargins];
  uint64_t v43 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", v44);
  v49[0] = v43;
  uint64_t v42 = [(CKDetailsGroupHeaderCell *)self avatarView];
  v40 = [v42 leadingAnchor];
  id v41 = [(CKDetailsGroupHeaderCell *)self contentView];
  uint64_t v38 = [v41 leadingAnchor];
  v39 = [(CKDetailsGroupHeaderCell *)self contentView];
  [v39 layoutMargins];
  id v37 = [v40 constraintEqualToAnchor:v38 constant:v3];
  v49[1] = v37;
  v36 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  v34 = [v36 leadingAnchor];
  v35 = [(CKDetailsGroupHeaderCell *)self contentView];
  v32 = [v35 leadingAnchor];
  v33 = [(CKDetailsGroupHeaderCell *)self contentView];
  [v33 layoutMargins];
  uint64_t v31 = [v34 constraintEqualToAnchor:v32 constant:v4];
  v49[2] = v31;
  v30 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  double v28 = [v30 topAnchor];
  v29 = [(CKDetailsGroupHeaderCell *)self avatarView];
  double v27 = [v29 bottomAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v49[3] = v26;
  double v25 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  double v23 = [v25 leadingAnchor];
  double v24 = [(CKDetailsGroupHeaderCell *)self contentView];
  double v21 = [v24 leadingAnchor];
  double v22 = [(CKDetailsGroupHeaderCell *)self contentView];
  [v22 layoutMargins];
  double v20 = [v23 constraintEqualToAnchor:v21 constant:v5];
  v49[4] = v20;
  double v19 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  v6 = [v19 topAnchor];
  double v7 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  double v8 = [v7 bottomAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  v49[5] = v9;
  double v10 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  double v11 = [v10 trailingAnchor];
  double v12 = [(CKDetailsGroupHeaderCell *)self contentView];
  double v13 = [v12 trailingAnchor];
  double v14 = [(CKDetailsGroupHeaderCell *)self contentView];
  [v14 layoutMargins];
  double v16 = [v11 constraintEqualToAnchor:v13 constant:v15];
  v49[6] = v16;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:7];

  return v18;
}

- (id)standardConstraints
{
  v68[7] = *MEMORY[0x1E4F143B8];
  double v3 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  double v4 = [v3 font];
  double v5 = +[CKUIBehavior sharedBehaviors];
  [v5 detailsGroupHeaderCellInterTextVerticalSpacing];
  double v7 = v6;
  double v8 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  v9 = [v8 font];
  [v9 pointSize];
  [v4 _scaledValueForValue:1 useLanguageAwareScaling:v7 + v10 * 0.5];
  double v12 = v11;

  double v13 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  double v14 = [v13 font];
  double v15 = +[CKUIBehavior sharedBehaviors];
  [v15 detailsGroupHeaderCellInterTextVerticalSpacing];
  double v17 = v16;
  id v18 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  double v19 = [v18 font];
  [v19 pointSize];
  [v14 _scaledValueForValue:1 useLanguageAwareScaling:v17 + v20 * 0.5];
  double v22 = v21;

  v67 = [(CKDetailsGroupHeaderCell *)self avatarView];
  v65 = [v67 leadingAnchor];
  v66 = [(CKDetailsGroupHeaderCell *)self contentView];
  uint64_t v64 = [v66 layoutMarginsGuide];
  v63 = [v64 leadingAnchor];
  v62 = [v65 constraintEqualToAnchor:v63];
  v68[0] = v62;
  v61 = [(CKDetailsGroupHeaderCell *)self avatarView];
  v59 = [v61 centerYAnchor];
  v60 = [(CKDetailsGroupHeaderCell *)self contentView];
  v58 = [v60 layoutMarginsGuide];
  v57 = [v58 centerYAnchor];
  v56 = [v59 constraintEqualToAnchor:v57];
  v68[1] = v56;
  v55 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  uint64_t v53 = [v55 leadingAnchor];
  v54 = [(CKDetailsGroupHeaderCell *)self avatarView];
  v51 = [v54 trailingAnchor];
  unint64_t v52 = +[CKUIBehavior sharedBehaviors];
  [v52 detailsGroupHeaderCellAvatarViewRightMargin];
  v50 = objc_msgSend(v53, "constraintEqualToAnchor:constant:", v51);
  v68[2] = v50;
  v49 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  v47 = [v49 centerYAnchor];
  v48 = [(CKDetailsGroupHeaderCell *)self contentView];
  v46 = [v48 centerYAnchor];
  uint64_t v45 = [v47 constraintEqualToAnchor:v46 constant:-v12];
  v68[3] = v45;
  uint64_t v44 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  uint64_t v42 = [v44 leadingAnchor];
  uint64_t v43 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  id v41 = [v43 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v68[4] = v40;
  v39 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  uint64_t v38 = [v39 centerYAnchor];
  double v23 = [(CKDetailsGroupHeaderCell *)self contentView];
  double v24 = [v23 centerYAnchor];
  double v25 = [v38 constraintEqualToAnchor:v24 constant:v22];
  v68[5] = v25;
  v26 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  double v27 = [v26 trailingAnchor];
  double v28 = [(CKDetailsGroupHeaderCell *)self contentView];
  v29 = [v28 trailingAnchor];
  v30 = [(CKDetailsGroupHeaderCell *)self contentView];
  [v30 layoutMargins];
  double v32 = v31;
  v33 = +[CKUIBehavior sharedBehaviors];
  [v33 detailsGroupHeaderCellSubtitleViewRightMargin];
  v35 = [v27 constraintEqualToAnchor:v29 constant:-(v32 + v34)];
  v68[6] = v35;
  id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:7];

  return v37;
}

- (id)standardWolfConstraints
{
  v43[7] = *MEMORY[0x1E4F143B8];
  uint64_t v42 = [(CKDetailsGroupHeaderCell *)self avatarView];
  v40 = [v42 leadingAnchor];
  id v41 = [(CKDetailsGroupHeaderCell *)self contentView];
  v39 = [v41 layoutMarginsGuide];
  uint64_t v38 = [v39 leadingAnchor];
  id v37 = [v40 constraintEqualToAnchor:v38];
  v43[0] = v37;
  v36 = [(CKDetailsGroupHeaderCell *)self avatarView];
  double v34 = [v36 centerYAnchor];
  v35 = [(CKDetailsGroupHeaderCell *)self contentView];
  v33 = [v35 layoutMarginsGuide];
  double v32 = [v33 centerYAnchor];
  double v31 = [v34 constraintEqualToAnchor:v32];
  v43[1] = v31;
  v30 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  double v28 = [v30 leadingAnchor];
  v29 = [(CKDetailsGroupHeaderCell *)self avatarView];
  v26 = [v29 trailingAnchor];
  double v27 = +[CKUIBehavior sharedBehaviors];
  [v27 detailsGroupHeaderCellAvatarViewRightMargin];
  double v25 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v26);
  v43[2] = v25;
  double v24 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  double v22 = [v24 bottomAnchor];
  double v23 = [(CKDetailsGroupHeaderCell *)self contentView];
  double v21 = [v23 centerYAnchor];
  double v20 = [v22 constraintEqualToAnchor:v21];
  v43[3] = v20;
  double v19 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  double v17 = [v19 leadingAnchor];
  id v18 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  double v16 = [v18 leadingAnchor];
  double v15 = [v17 constraintEqualToAnchor:v16];
  v43[4] = v15;
  double v3 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  double v4 = [v3 topAnchor];
  double v5 = [(CKDetailsGroupHeaderCell *)self titleLabel];
  double v6 = [v5 bottomAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  v43[5] = v7;
  double v8 = [(CKDetailsGroupHeaderCell *)self subTitleLabel];
  v9 = [v8 trailingAnchor];
  double v10 = [(CKDetailsGroupHeaderCell *)self contentView];
  double v11 = [v10 trailingAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  v43[6] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:7];

  return v14;
}

- (void)configureCellIconForCollapsedState:(BOOL)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  double v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = v5;
  if (a3) {
    [v5 detailsGroupHeaderCellChevronForwardName];
  }
  else {
  double v7 = [v5 detailsGroupHeaderCellChevronDownName];
  }

  double v8 = (void *)MEMORY[0x1E4F42A98];
  v9 = +[CKUIBehavior sharedBehaviors];
  double v10 = [v9 detailsGroupHeaderCellChevronFont];
  double v11 = +[CKUIBehavior sharedBehaviors];
  double v12 = objc_msgSend(v8, "configurationWithFont:scale:", v10, objc_msgSend(v11, "detailsGroupChevronImageScale"));

  double v13 = [MEMORY[0x1E4F42A80] systemImageNamed:v7];
  id v14 = [v13 imageWithConfiguration:v12];

  double v15 = (void *)MEMORY[0x1E4F42A98];
  double v16 = +[CKUIBehavior sharedBehaviors];
  double v17 = [v16 theme];
  id v18 = [v17 detailsGroupHeaderCellChevronColor];
  v23[0] = v18;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  double v20 = [v15 configurationWithPaletteColors:v19];
  double v21 = [v14 imageByApplyingSymbolConfiguration:v20];

  double v22 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v21];
  [(CKDetailsGroupHeaderCell *)self setAccessoryView:v22];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsGroupHeaderCell;
  [(CKDetailsCell *)&v4 layoutSubviews];
  double v3 = [(CKDetailsCell *)self topSeperator];
  [v3 setHidden:1];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
}

- (NSArray)avatarViews
{
  return self->_avatarViews;
}

- (void)setAvatarViews:(id)a3
{
}

- (CKDetailsAvatarPancakeView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarViews, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end