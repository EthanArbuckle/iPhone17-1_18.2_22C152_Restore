@interface HUInstructionsCell
- (BOOL)hidesTopSpacing;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HFItem)item;
- (HUInstructionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (UILabel)titleLabel;
- (UITextView)descriptionView;
- (double)contentBottomMargin;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setConstraints:(id)a3;
- (void)setContentBottomMargin:(double)a3;
- (void)setDescriptionView:(id)a3;
- (void)setHidesTopSpacing:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUInstructionsCell

- (HUInstructionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v37.receiver = self;
  v37.super_class = (Class)HUInstructionsCell;
  v4 = [(HUInstructionsCell *)&v37 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HUInstructionsCell *)v4 setSelectionStyle:0];
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUInstructionsCell *)v5 setBackgroundColor:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    [(HUInstructionsCell *)v5 setTitleLabel:v12];

    v13 = [(HUInstructionsCell *)v5 titleLabel];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v14 = [(HUInstructionsCell *)v5 titleLabel];
    [v14 setAdjustsFontSizeToFitWidth:1];

    v15 = [(HUInstructionsCell *)v5 contentView];
    v16 = [(HUInstructionsCell *)v5 titleLabel];
    [v15 addSubview:v16];

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42F58]), "initWithFrame:", v8, v9, v10, v11);
    [(HUInstructionsCell *)v5 setDescriptionView:v17];

    v18 = [MEMORY[0x1E4F428B8] clearColor];
    v19 = [(HUInstructionsCell *)v5 descriptionView];
    [v19 setBackgroundColor:v18];

    v20 = [(HUInstructionsCell *)v5 descriptionView];
    [v20 setDelegate:v5];

    v21 = [(HUInstructionsCell *)v5 descriptionView];
    [v21 setEditable:0];

    v22 = [(HUInstructionsCell *)v5 descriptionView];
    v23 = [v22 textContainer];
    [v23 setLineFragmentPadding:0.0];

    double v24 = *MEMORY[0x1E4F437F8];
    double v25 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    v28 = [(HUInstructionsCell *)v5 descriptionView];
    objc_msgSend(v28, "setTextContainerInset:", v24, v25, v26, v27);

    v29 = [(HUInstructionsCell *)v5 descriptionView];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

    v30 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v31 = [(HUInstructionsCell *)v5 descriptionView];
    [v31 setTextColor:v30];

    v32 = [(HUInstructionsCell *)v5 descriptionView];
    [v32 setScrollEnabled:0];

    v33 = [(HUInstructionsCell *)v5 descriptionView];
    [v33 _setInteractiveTextSelectionDisabled:1];

    v34 = [(HUInstructionsCell *)v5 contentView];
    v35 = [(HUInstructionsCell *)v5 descriptionView];
    [v34 addSubview:v35];

    [(HUInstructionsCell *)v5 setHidesTopSpacing:0];
    v5->_contentBottomMargin = 14.0;
    [(HUInstructionsCell *)v5 setNeedsUpdateConstraints];
  }
  return v5;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUInstructionsCell;
  [(HUInstructionsCell *)&v3 prepareForReuse];
  [(HUInstructionsCell *)self setContentBottomMargin:14.0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUInstructionsCell;
  [(HUInstructionsCell *)&v3 layoutSubviews];
  [(UITableViewCell *)self turnOffRounding];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v4 = [(HUInstructionsCell *)self item];
  id v65 = [v4 latestResults];

  v5 = [v65 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v6 = [v65 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  id v7 = [(HUInstructionsCell *)self titleLabel];
  [v7 setText:v5];

  double v8 = [(HUInstructionsCell *)self titleLabel];
  [v8 setHidden:v5 == 0];

  double v9 = [MEMORY[0x1E4F1CA60] dictionary];
  double v10 = [(HUInstructionsCell *)self descriptionView];
  double v11 = [v10 font];
  objc_msgSend(v9, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E4F42508]);

  v12 = [(HUInstructionsCell *)self descriptionView];
  v13 = [v12 textColor];
  objc_msgSend(v9, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E4F42510]);

  v14 = [v6 stringWithAttributes:v9];
  v15 = [(HUInstructionsCell *)self descriptionView];
  [v15 setAttributedText:v14];

  v16 = [(HUInstructionsCell *)self descriptionView];
  [v16 setHidden:v6 == 0];

  v17 = [(HUInstructionsCell *)self item];
  v18 = [v17 latestResults];
  v19 = [v18 objectForKeyedSubscript:@"instructionsStyle"];

  if (v19)
  {
    switch([v19 integerValue])
    {
      case 0:
        v20 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F0]];
        v21 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
        v22 = (void *)MEMORY[0x1E4F42A30];
        [v20 pointSize];
        v23 = objc_msgSend(v22, "systemFontOfSize:weight:");
        double v24 = [(HUInstructionsCell *)self titleLabel];
        [v24 setFont:v23];

        double v25 = [(HUInstructionsCell *)self titleLabel];
        [v25 setTextAlignment:4];

        double v26 = [(HUInstructionsCell *)self titleLabel];
        [v26 setNumberOfLines:0];

        double v27 = (void *)MEMORY[0x1E4F42A30];
        [v21 pointSize];
        v28 = objc_msgSend(v27, "systemFontOfSize:weight:");
        v29 = [(HUInstructionsCell *)self descriptionView];
        [v29 setFont:v28];

        v30 = [(HUInstructionsCell *)self descriptionView];
        [v30 setTextAlignment:4];

        goto LABEL_11;
      case 1:
        v31 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438C8] traits:32770];
        v32 = [(HUInstructionsCell *)self titleLabel];
        [v32 setFont:v31];

        v33 = [(HUInstructionsCell *)self titleLabel];
        [v33 setTextAlignment:4];

        v34 = [MEMORY[0x1E4F428B8] systemGrayColor];
        v35 = [(HUInstructionsCell *)self titleLabel];
        [v35 setTextColor:v34];

        v36 = [(HUInstructionsCell *)self titleLabel];
        [v36 setNumberOfLines:1];

        objc_super v37 = [(HUInstructionsCell *)self titleLabel];
        v38 = [v37 text];
        v39 = [v38 localizedUppercaseString];
        v40 = [(HUInstructionsCell *)self titleLabel];
        [v40 setText:v39];

        v41 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
        v42 = [(HUInstructionsCell *)self descriptionView];
        [v42 setFont:v41];

        v43 = [(HUInstructionsCell *)self descriptionView];
        [v43 setTextAlignment:4];

        v44 = (void *)MEMORY[0x1E4F428B8];
        goto LABEL_10;
      case 2:
        v20 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
        v45 = (void *)MEMORY[0x1E4F42A30];
        [v20 pointSize];
        v46 = objc_msgSend(v45, "systemFontOfSize:weight:");
        v47 = [(HUInstructionsCell *)self titleLabel];
        [v47 setFont:v46];

        v48 = [(HUInstructionsCell *)self titleLabel];
        [v48 setTextAlignment:4];

        v49 = [MEMORY[0x1E4F428B8] systemGrayColor];
        v50 = [(HUInstructionsCell *)self titleLabel];
        [v50 setTextColor:v49];

        v21 = [(HUInstructionsCell *)self titleLabel];
        [v21 setNumberOfLines:1];
        goto LABEL_11;
      case 3:
        v51 = [MEMORY[0x1E4F42A30] systemFontOfSize:22.0 weight:*MEMORY[0x1E4F43930]];
        v52 = [(HUInstructionsCell *)self titleLabel];
        [v52 setFont:v51];

        v53 = [(HUInstructionsCell *)self titleLabel];
        [v53 setTextAlignment:4];

        v54 = [MEMORY[0x1E4F428B8] labelColor];
        v55 = [(HUInstructionsCell *)self titleLabel];
        [v55 setTextColor:v54];

        v20 = [(HUInstructionsCell *)self titleLabel];
        [v20 setNumberOfLines:1];
        goto LABEL_12;
      case 4:
        v56 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
        v57 = [(HUInstructionsCell *)self titleLabel];
        [v57 setFont:v56];

        v58 = [(HUInstructionsCell *)self titleLabel];
        [v58 setTextAlignment:4];

        v59 = [MEMORY[0x1E4F428B8] labelColor];
        v60 = [(HUInstructionsCell *)self titleLabel];
        [v60 setTextColor:v59];

        v61 = [(HUInstructionsCell *)self titleLabel];
        [v61 setNumberOfLines:0];

        v20 = [(HUInstructionsCell *)self titleLabel];
        [v20 setLineBreakMode:0];
        goto LABEL_12;
      case 5:
        v62 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
        v63 = [(HUInstructionsCell *)self descriptionView];
        [v63 setFont:v62];

        v64 = [(HUInstructionsCell *)self descriptionView];
        [v64 setTextAlignment:4];

        v44 = (void *)MEMORY[0x1E4F428B8];
LABEL_10:
        v20 = [v44 systemGrayColor];
        v21 = [(HUInstructionsCell *)self descriptionView];
        [v21 setTextColor:v20];
LABEL_11:

LABEL_12:
        break;
      default:
        break;
    }
  }
  else
  {
    NSLog(&cfstr_NoInstructions.isa);
  }
  [(HUInstructionsCell *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HUInstructionsCell *)self item];
  v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:@"instructionsStyle"];

  if (v6)
  {
    uint64_t v7 = [v6 integerValue];
  }
  else
  {
    NSLog(&cfstr_NoInstructions.isa);
    uint64_t v7 = -1;
  }
  double v8 = [(HUInstructionsCell *)self item];
  double v9 = [v8 latestResults];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  double v11 = [(HUInstructionsCell *)self item];
  v12 = [v11 latestResults];
  uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];

  v14 = [(HUInstructionsCell *)self titleLabel];
  LODWORD(v15) = 1144766464;
  [v14 setContentCompressionResistancePriority:1 forAxis:v15];

  v16 = [(HUInstructionsCell *)self titleLabel];
  LODWORD(v17) = 1132134400;
  [v16 setContentHuggingPriority:1 forAxis:v17];

  BOOL v18 = [(HUInstructionsCell *)self hidesTopSpacing];
  if (v18) {
    double v19 = 12.0;
  }
  else {
    double v19 = 52.0;
  }
  if (v18) {
    double v20 = 12.0;
  }
  else {
    double v20 = 20.0;
  }
  switch(v7)
  {
    case 0:
      if (v10 && v13)
      {
        double v26 = [(HUInstructionsCell *)self titleLabel];
        double v27 = [v26 firstBaselineAnchor];
        v28 = [(HUInstructionsCell *)self contentView];
        v29 = [v28 topAnchor];
        v30 = [v27 constraintEqualToAnchor:v29 constant:v19];
        [v3 addObject:v30];

        v31 = [(HUInstructionsCell *)self titleLabel];
        v32 = [v31 leadingAnchor];
        v33 = [(HUInstructionsCell *)self contentView];
        v34 = [v33 layoutMarginsGuide];
        v35 = [v34 leadingAnchor];
        v36 = [v32 constraintEqualToAnchor:v35];
        [v3 addObject:v36];

        objc_super v37 = [(HUInstructionsCell *)self titleLabel];
        v38 = [v37 trailingAnchor];
        v39 = [(HUInstructionsCell *)self contentView];
        v40 = [v39 layoutMarginsGuide];
        v41 = [v40 trailingAnchor];
        v42 = [v38 constraintEqualToAnchor:v41];
        [v3 addObject:v42];

        v43 = [(HUInstructionsCell *)self descriptionView];
        v44 = [v43 font];
        v45 = v44;
        double v46 = 22.0;
        goto LABEL_22;
      }
      if (v10 | v13)
      {
        if (v10) {
          [(HUInstructionsCell *)self titleLabel];
        }
        else {
        v101 = [(HUInstructionsCell *)self descriptionView];
        }
        v151 = [v101 firstBaselineAnchor];
        v152 = [(HUInstructionsCell *)self contentView];
        v153 = [v152 topAnchor];
        v154 = v151;
        v155 = v153;
        double v156 = v19;
        goto LABEL_43;
      }
      break;
    case 1:
      if (v10 && v13)
      {
        v47 = [(HUInstructionsCell *)self titleLabel];
        v48 = [v47 topAnchor];
        v49 = [(HUInstructionsCell *)self contentView];
        v50 = [v49 topAnchor];
        v51 = [v48 constraintEqualToAnchor:v50 constant:v20];
        [v3 addObject:v51];

        v52 = [(HUInstructionsCell *)self titleLabel];
        v53 = [v52 leadingAnchor];
        v54 = [(HUInstructionsCell *)self contentView];
        v55 = [v54 layoutMarginsGuide];
        v56 = [v55 leadingAnchor];
        v57 = [v53 constraintEqualToAnchor:v56];
        [v3 addObject:v57];

        v58 = [(HUInstructionsCell *)self titleLabel];
        v59 = [v58 trailingAnchor];
        v60 = [(HUInstructionsCell *)self contentView];
        v61 = [v60 layoutMarginsGuide];
        v62 = [v61 trailingAnchor];
        v63 = [v59 constraintEqualToAnchor:v62];
        [v3 addObject:v63];

        v43 = [(HUInstructionsCell *)self descriptionView];
        v44 = [v43 font];
        v45 = v44;
        double v46 = v20;
LABEL_22:
        [v44 _scaledValueForValue:v46];
        double v65 = HURoundToScreenScale(v64);

        v66 = [(HUInstructionsCell *)self descriptionView];
        v67 = [v66 firstBaselineAnchor];
        v68 = [(HUInstructionsCell *)self titleLabel];
        v69 = [v68 lastBaselineAnchor];
        v70 = [v67 constraintEqualToAnchor:v69 constant:v65];
        [v3 addObject:v70];

        v71 = [(HUInstructionsCell *)self descriptionView];
        v72 = [v71 leadingAnchor];
        v73 = [(HUInstructionsCell *)self contentView];
        v74 = [v73 layoutMarginsGuide];
        v75 = [v74 leadingAnchor];
        v76 = [v72 constraintEqualToAnchor:v75];
        [v3 addObject:v76];

        v77 = [(HUInstructionsCell *)self descriptionView];
        v78 = [v77 trailingAnchor];
        v79 = [(HUInstructionsCell *)self contentView];
        v80 = [v79 layoutMarginsGuide];
        v81 = [v80 trailingAnchor];
        v82 = [v78 constraintEqualToAnchor:v81];
        [v3 addObject:v82];

        v83 = [(HUInstructionsCell *)self descriptionView];
        goto LABEL_24;
      }
      if (v10 | v13)
      {
        if (v10) {
          [(HUInstructionsCell *)self titleLabel];
        }
        else {
        v101 = [(HUInstructionsCell *)self descriptionView];
        }
        v151 = [v101 topAnchor];
        v152 = [(HUInstructionsCell *)self contentView];
        v153 = [v152 topAnchor];
        v154 = v151;
        v155 = v153;
        double v156 = v20;
LABEL_43:
        v157 = [v154 constraintEqualToAnchor:v155 constant:v156];
        [v3 addObject:v157];

        v158 = [v101 leadingAnchor];
        v159 = [(HUInstructionsCell *)self contentView];
        v160 = [v159 layoutMarginsGuide];
        v161 = [v160 leadingAnchor];
        v162 = [v158 constraintEqualToAnchor:v161];
        [v3 addObject:v162];

        v163 = [v101 trailingAnchor];
        v164 = [(HUInstructionsCell *)self contentView];
        v165 = [v164 layoutMarginsGuide];
        v166 = [v165 trailingAnchor];
        v167 = [v163 constraintEqualToAnchor:v166];
        [v3 addObject:v167];

        v83 = v101;
        goto LABEL_25;
      }
      break;
    case 2:
    case 3:
      double v21 = 44.0;
      if (v18) {
        double v21 = 12.0;
      }
      if (v7 == 2)
      {
        double v19 = v21;
        v22 = [(HUInstructionsCell *)self titleLabel];
        v23 = [v22 font];
        [v23 _scaledValueForValue:10.0];
        double v25 = HURoundToScreenScale(v24);
      }
      else
      {
        [(HUInstructionsCell *)self contentBottomMargin];
        double v25 = v127;
      }
      v128 = [(HUInstructionsCell *)self titleLabel];
      v129 = [v128 firstBaselineAnchor];
      v130 = [(HUInstructionsCell *)self contentView];
      v131 = [v130 topAnchor];
      v132 = [v129 constraintEqualToAnchor:v131 constant:v19];
      [v3 addObject:v132];

      v133 = [(HUInstructionsCell *)self titleLabel];
      v134 = [v133 leadingAnchor];
      v135 = [(HUInstructionsCell *)self contentView];
      v136 = [v135 layoutMarginsGuide];
      v137 = [v136 leadingAnchor];
      v138 = [v134 constraintEqualToAnchor:v137];
      [v3 addObject:v138];

      v139 = [(HUInstructionsCell *)self titleLabel];
      v140 = [v139 trailingAnchor];
      v141 = [(HUInstructionsCell *)self contentView];
      v142 = [v141 layoutMarginsGuide];
      v143 = [v142 trailingAnchor];
      v144 = [v140 constraintEqualToAnchor:v143];
      [v3 addObject:v144];

      v101 = [(HUInstructionsCell *)self titleLabel];
      v102 = [v101 bottomAnchor];
      v103 = [(HUInstructionsCell *)self contentView];
      v104 = [v103 bottomAnchor];
      double v106 = -v25;
      goto LABEL_28;
    case 4:
      v84 = [(HUInstructionsCell *)self titleLabel];
      v85 = [v84 firstBaselineAnchor];
      v86 = [(HUInstructionsCell *)self contentView];
      v87 = [v86 topAnchor];
      v88 = [v85 constraintEqualToAnchor:v87 constant:v19];
      [v3 addObject:v88];

      v89 = [(HUInstructionsCell *)self titleLabel];
      v90 = [v89 leadingAnchor];
      v91 = [(HUInstructionsCell *)self contentView];
      v92 = [v91 layoutMarginsGuide];
      v93 = [v92 leadingAnchor];
      v94 = [v90 constraintEqualToAnchor:v93];
      [v3 addObject:v94];

      v95 = [(HUInstructionsCell *)self titleLabel];
      v96 = [v95 trailingAnchor];
      v97 = [(HUInstructionsCell *)self contentView];
      v98 = [v97 layoutMarginsGuide];
      v99 = [v98 trailingAnchor];
      v100 = [v96 constraintEqualToAnchor:v99];
      [v3 addObject:v100];

      v83 = [(HUInstructionsCell *)self titleLabel];
LABEL_24:
      v101 = v83;
LABEL_25:
      v102 = [v83 bottomAnchor];
      v103 = [(HUInstructionsCell *)self contentView];
      v104 = [v103 bottomAnchor];
      [(HUInstructionsCell *)self contentBottomMargin];
      double v106 = -v105;
LABEL_28:
      v125 = [v102 constraintEqualToAnchor:v104 constant:v106];
      [v3 addObject:v125];
      goto LABEL_29;
    case 5:
      v107 = [(HUInstructionsCell *)self descriptionView];
      v108 = [v107 topAnchor];
      v109 = [(HUInstructionsCell *)self contentView];
      v110 = [v109 layoutMarginsGuide];
      v111 = [v110 topAnchor];
      v112 = [v108 constraintEqualToAnchor:v111];
      [v3 addObject:v112];

      v113 = [(HUInstructionsCell *)self descriptionView];
      v114 = [v113 bottomAnchor];
      v115 = [(HUInstructionsCell *)self contentView];
      v116 = [v115 layoutMarginsGuide];
      v117 = [v116 bottomAnchor];
      v118 = [v114 constraintEqualToAnchor:v117];
      [v3 addObject:v118];

      v119 = [(HUInstructionsCell *)self descriptionView];
      v120 = [v119 leadingAnchor];
      v121 = [(HUInstructionsCell *)self contentView];
      v122 = [v121 layoutMarginsGuide];
      v123 = [v122 leadingAnchor];
      v124 = [v120 constraintEqualToAnchor:v123];
      [v3 addObject:v124];

      v101 = [(HUInstructionsCell *)self descriptionView];
      v102 = [v101 trailingAnchor];
      v103 = [(HUInstructionsCell *)self contentView];
      v104 = [v103 layoutMarginsGuide];
      v125 = [v104 trailingAnchor];
      v126 = [v102 constraintEqualToAnchor:v125];
      [v3 addObject:v126];

LABEL_29:
      break;
    default:
      break;
  }
  v145 = [(HUInstructionsCell *)self constraints];
  char v146 = [v3 isEqualToArray:v145];

  if ((v146 & 1) == 0)
  {
    v147 = (void *)MEMORY[0x1E4F28DC8];
    v148 = [(HUInstructionsCell *)self constraints];
    [v147 deactivateConstraints:v148];

    [(HUInstructionsCell *)self setConstraints:v3];
    v149 = (void *)MEMORY[0x1E4F28DC8];
    v150 = [(HUInstructionsCell *)self constraints];
    [v149 activateConstraints:v150];
  }
  v168.receiver = self;
  v168.super_class = (Class)HUInstructionsCell;
  [(HUInstructionsCell *)&v168 updateConstraints];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  double v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v11, 0x16u);
  }

  return (unint64_t)(a6 - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)hidesTopSpacing
{
  return self->_hidesTopSpacing;
}

- (void)setHidesTopSpacing:(BOOL)a3
{
  self->_hidesTopSpacing = a3;
}

- (double)contentBottomMargin
{
  return self->_contentBottomMargin;
}

- (void)setContentBottomMargin:(double)a3
{
  self->_contentBottomMargin = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UITextView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end