@interface CKDetailsSIMCell
+ (BOOL)shouldHighlight;
+ (double)preferredHeight;
+ (id)reuseIdentifier;
- (CKDetailsSIMCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CKDetailsSIMCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 simLabelText:(id)a5;
- (UIButton)button;
- (UILabel)simLabel;
- (UIMenu)menu;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setButton:(id)a3;
- (void)setMenu:(id)a3;
- (void)setSIMLabelText:(id)a3;
@end

@implementation CKDetailsSIMCell

+ (id)reuseIdentifier
{
  return @"CKDetailsSIM_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 1;
}

+ (double)preferredHeight
{
  int HasMultipleActiveSubscriptions = IMSharedHelperDeviceHasMultipleActiveSubscriptions();
  double result = 44.0;
  if (!HasMultipleActiveSubscriptions) {
    return 0.0;
  }
  return result;
}

- (CKDetailsSIMCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 simLabelText:(id)a5
{
  v126[12] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v124.receiver = self;
  v124.super_class = (Class)CKDetailsSIMCell;
  v9 = [(CKDetailsCell *)&v124 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(CKDetailsSIMCell *)v9 setSelectionStyle:0];
    v11 = [(CKDetailsSIMCell *)v10 textLabel];
    uint64_t v12 = *MEMORY[0x1E4F43870];
    v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [v11 setFont:v13];

    v14 = [(CKDetailsSIMCell *)v10 textLabel];
    [v14 setNumberOfLines:0];

    v15 = [(CKDetailsSIMCell *)v10 textLabel];
    [v15 setLineBreakMode:4];

    v16 = [(CKDetailsSIMCell *)v10 textLabel];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(CKDetailsSIMCell *)v10 contentView];
    [v17 setBackgroundColor:0];

    v18 = objc_alloc_init(CKStandardButton);
    [(CKDetailsSIMCell *)v10 setButton:v18];

    v19 = [(CKDetailsSIMCell *)v10 button];
    [v19 _setCornerRadius:10.0];

    v20 = [(CKDetailsSIMCell *)v10 button];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    v21 = [(CKDetailsSIMCell *)v10 button];
    [v21 setBackgroundColor:0];

    v22 = [(CKDetailsSIMCell *)v10 button];
    [v22 setContextMenuIsPrimary:1];

    v23 = [(CKDetailsSIMCell *)v10 button];
    [v23 setContextMenuInteractionEnabled:1];

    v24 = [(CKDetailsSIMCell *)v10 menu];
    v25 = [(CKDetailsSIMCell *)v10 button];
    [v25 setMenu:v24];

    v26 = [(CKDetailsSIMCell *)v10 menu];
    v27 = [(CKDetailsSIMCell *)v10 button];
    [v27 setHidden:v26 == 0];

    v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    simLabel = v10->_simLabel;
    v10->_simLabel = v28;

    id v123 = v8;
    [(UILabel *)v10->_simLabel setText:v8];
    v30 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v12];
    [(UILabel *)v10->_simLabel setFont:v30];

    v31 = +[CKUIBehavior sharedBehaviors];
    v32 = [v31 theme];
    v33 = [v32 appTintColor];
    [(UILabel *)v10->_simLabel setTextColor:v33];

    [(UILabel *)v10->_simLabel setTextAlignment:2];
    [(UILabel *)v10->_simLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = [(CKDetailsSIMCell *)v10 button];
    [(CKDetailsSIMCell *)v10 addSubview:v34];

    v35 = [(CKDetailsSIMCell *)v10 button];
    v36 = [(CKDetailsSIMCell *)v10 simLabel];
    [v35 addSubview:v36];

    v37 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v38 = [v37 userInterfaceLayoutDirection];

    if (v38 == 1)
    {
      [(UILabel *)v10->_simLabel setTextAlignment:0];
      v77 = (void *)MEMORY[0x1E4F28DC8];
      v122 = [(CKDetailsSIMCell *)v10 textLabel];
      v39 = [v122 rightAnchor];
      v120 = [(CKDetailsSIMCell *)v10 rightAnchor];
      v121 = v39;
      v119 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", -18.0);
      v125[0] = v119;
      v118 = [(CKDetailsSIMCell *)v10 textLabel];
      v40 = [v118 topAnchor];
      v116 = [(CKDetailsSIMCell *)v10 topAnchor];
      v117 = v40;
      v115 = objc_msgSend(v40, "constraintEqualToAnchor:");
      v125[1] = v115;
      v114 = [(CKDetailsSIMCell *)v10 textLabel];
      v41 = [v114 bottomAnchor];
      v112 = [(CKDetailsSIMCell *)v10 bottomAnchor];
      v113 = v41;
      v111 = objc_msgSend(v41, "constraintEqualToAnchor:");
      v125[2] = v111;
      v110 = [(CKDetailsSIMCell *)v10 button];
      v42 = [v110 centerXAnchor];
      uint64_t v43 = [(CKDetailsSIMCell *)v10 leftAnchor];
      [(CKDetailsSIMCell *)v10 bounds];
      v108 = (void *)v43;
      v109 = v42;
      v107 = [v42 constraintEqualToAnchor:v43 constant:v44 * 0.25];
      v125[3] = v107;
      v106 = [(CKDetailsSIMCell *)v10 button];
      v45 = [v106 leftAnchor];
      v104 = [(CKDetailsSIMCell *)v10 leftAnchor];
      v105 = v45;
      v103 = objc_msgSend(v45, "constraintEqualToAnchor:constant:", 18.0);
      v125[4] = v103;
      v102 = [(CKDetailsSIMCell *)v10 button];
      v46 = [v102 topAnchor];
      v100 = [(CKDetailsSIMCell *)v10 topAnchor];
      v101 = v46;
      v99 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", 5.0);
      v125[5] = v99;
      v98 = [(CKDetailsSIMCell *)v10 button];
      v47 = [v98 bottomAnchor];
      v96 = [(CKDetailsSIMCell *)v10 bottomAnchor];
      v97 = v47;
      v95 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", -5.0);
      v125[6] = v95;
      v94 = [(CKDetailsSIMCell *)v10 simLabel];
      v48 = [v94 bottomAnchor];
      v92 = [(CKDetailsSIMCell *)v10 button];
      [v92 bottomAnchor];
      v91 = v93 = v48;
      v90 = objc_msgSend(v48, "constraintEqualToAnchor:");
      v125[7] = v90;
      v89 = [(CKDetailsSIMCell *)v10 simLabel];
      v49 = [v89 topAnchor];
      v87 = [(CKDetailsSIMCell *)v10 button];
      [v87 topAnchor];
      v86 = v88 = v49;
      v85 = objc_msgSend(v49, "constraintEqualToAnchor:");
      v125[8] = v85;
      v84 = [(CKDetailsSIMCell *)v10 simLabel];
      v50 = [v84 centerXAnchor];
      v82 = [(CKDetailsSIMCell *)v10 button];
      [v82 centerXAnchor];
      v81 = v83 = v50;
      v80 = objc_msgSend(v50, "constraintEqualToAnchor:");
      v125[9] = v80;
      v79 = [(CKDetailsSIMCell *)v10 simLabel];
      v51 = [v79 rightAnchor];
      v52 = [(CKDetailsSIMCell *)v10 button];
      v53 = [v52 rightAnchor];
      v78 = v51;
      v54 = [v51 constraintEqualToAnchor:v53];
      v125[10] = v54;
      v55 = [(CKDetailsSIMCell *)v10 textLabel];
      v56 = [v55 leftAnchor];
      v57 = [(CKDetailsSIMCell *)v10 button];
      v58 = [v57 rightAnchor];
      v59 = [v56 constraintEqualToAnchor:v58 constant:5.0];
      v125[11] = v59;
      v60 = (void *)MEMORY[0x1E4F1C978];
      v61 = v125;
    }
    else
    {
      v77 = (void *)MEMORY[0x1E4F28DC8];
      v122 = [(CKDetailsSIMCell *)v10 textLabel];
      v62 = [v122 leftAnchor];
      v120 = [(CKDetailsSIMCell *)v10 leftAnchor];
      v121 = v62;
      v119 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", 18.0);
      v126[0] = v119;
      v118 = [(CKDetailsSIMCell *)v10 textLabel];
      v63 = [v118 topAnchor];
      v116 = [(CKDetailsSIMCell *)v10 topAnchor];
      v117 = v63;
      v115 = objc_msgSend(v63, "constraintEqualToAnchor:");
      v126[1] = v115;
      v114 = [(CKDetailsSIMCell *)v10 textLabel];
      v64 = [v114 bottomAnchor];
      v112 = [(CKDetailsSIMCell *)v10 bottomAnchor];
      v113 = v64;
      v111 = objc_msgSend(v64, "constraintEqualToAnchor:");
      v126[2] = v111;
      v110 = [(CKDetailsSIMCell *)v10 button];
      v65 = [v110 centerXAnchor];
      uint64_t v66 = [(CKDetailsSIMCell *)v10 rightAnchor];
      [(CKDetailsSIMCell *)v10 bounds];
      v108 = (void *)v66;
      v109 = v65;
      v107 = [v65 constraintEqualToAnchor:v66 constant:v67 * -0.25];
      v126[3] = v107;
      v106 = [(CKDetailsSIMCell *)v10 button];
      v68 = [v106 rightAnchor];
      v104 = [(CKDetailsSIMCell *)v10 rightAnchor];
      v105 = v68;
      v103 = objc_msgSend(v68, "constraintEqualToAnchor:constant:", -18.0);
      v126[4] = v103;
      v102 = [(CKDetailsSIMCell *)v10 button];
      v69 = [v102 topAnchor];
      v100 = [(CKDetailsSIMCell *)v10 topAnchor];
      v101 = v69;
      v99 = objc_msgSend(v69, "constraintEqualToAnchor:constant:", 5.0);
      v126[5] = v99;
      v98 = [(CKDetailsSIMCell *)v10 button];
      v70 = [v98 bottomAnchor];
      v96 = [(CKDetailsSIMCell *)v10 bottomAnchor];
      v97 = v70;
      v95 = objc_msgSend(v70, "constraintEqualToAnchor:constant:", -5.0);
      v126[6] = v95;
      v94 = [(CKDetailsSIMCell *)v10 simLabel];
      v71 = [v94 bottomAnchor];
      v92 = [(CKDetailsSIMCell *)v10 button];
      [v92 bottomAnchor];
      v91 = v93 = v71;
      v90 = objc_msgSend(v71, "constraintEqualToAnchor:");
      v126[7] = v90;
      v89 = [(CKDetailsSIMCell *)v10 simLabel];
      v72 = [v89 topAnchor];
      v87 = [(CKDetailsSIMCell *)v10 button];
      [v87 topAnchor];
      v86 = v88 = v72;
      v85 = objc_msgSend(v72, "constraintEqualToAnchor:");
      v126[8] = v85;
      v84 = [(CKDetailsSIMCell *)v10 simLabel];
      v73 = [v84 centerXAnchor];
      v82 = [(CKDetailsSIMCell *)v10 button];
      [v82 centerXAnchor];
      v81 = v83 = v73;
      v80 = objc_msgSend(v73, "constraintEqualToAnchor:");
      v126[9] = v80;
      v79 = [(CKDetailsSIMCell *)v10 simLabel];
      v74 = [v79 leftAnchor];
      v52 = [(CKDetailsSIMCell *)v10 button];
      v53 = [v52 leftAnchor];
      v78 = v74;
      v54 = [v74 constraintEqualToAnchor:v53];
      v126[10] = v54;
      v55 = [(CKDetailsSIMCell *)v10 textLabel];
      v56 = [v55 rightAnchor];
      v57 = [(CKDetailsSIMCell *)v10 button];
      v58 = [v57 leftAnchor];
      v59 = [v56 constraintEqualToAnchor:v58 constant:-5.0];
      v126[11] = v59;
      v60 = (void *)MEMORY[0x1E4F1C978];
      v61 = v126;
    }
    v75 = [v60 arrayWithObjects:v61 count:12];
    [v77 activateConstraints:v75];

    id v8 = v123;
  }

  return v10;
}

- (CKDetailsSIMCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v32[4] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)CKDetailsSIMCell;
  v4 = [(CKDetailsCell *)&v31 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CKDetailsSIMCell *)v4 setSelectionStyle:0];
    v6 = [(CKDetailsSIMCell *)v5 textLabel];
    v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [v6 setFont:v7];

    id v8 = [(CKDetailsSIMCell *)v5 textLabel];
    [v8 setNumberOfLines:0];

    v9 = [(CKDetailsSIMCell *)v5 textLabel];
    [v9 setLineBreakMode:4];

    v10 = [(CKDetailsSIMCell *)v5 textLabel];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:1];

    v11 = [(CKDetailsSIMCell *)v5 contentView];
    [v11 setBackgroundColor:0];

    v23 = (void *)MEMORY[0x1E4F28DC8];
    v30 = [(CKDetailsSIMCell *)v5 textLabel];
    v29 = [v30 rightAnchor];
    v28 = [(CKDetailsSIMCell *)v5 rightAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v32[0] = v27;
    v26 = [(CKDetailsSIMCell *)v5 textLabel];
    v25 = [v26 leftAnchor];
    v24 = [(CKDetailsSIMCell *)v5 leftAnchor];
    v22 = [v25 constraintEqualToAnchor:v24];
    v32[1] = v22;
    uint64_t v12 = [(CKDetailsSIMCell *)v5 textLabel];
    v13 = [v12 topAnchor];
    v14 = [(CKDetailsSIMCell *)v5 topAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v32[2] = v15;
    v16 = [(CKDetailsSIMCell *)v5 textLabel];
    v17 = [v16 bottomAnchor];
    v18 = [(CKDetailsSIMCell *)v5 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v32[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    [v23 activateConstraints:v20];
  }
  return v5;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKDetailsSIMCell;
  [(CKDetailsCell *)&v5 layoutSubviews];
  v3 = [(CKDetailsCell *)self topSeperator];
  [v3 setHidden:1];

  v4 = [(CKDetailsCell *)self bottomSeperator];
  [v4 setHidden:1];
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)CKDetailsSIMCell;
  [(CKDetailsCell *)&v6 prepareForReuse];
  v3 = [(CKDetailsSIMCell *)self textLabel];
  [v3 setText:&stru_1EDE4CA38];

  [(CKDetailsSIMCell *)self setMenu:0];
  v4 = [(CKDetailsSIMCell *)self menu];
  objc_super v5 = [(CKDetailsSIMCell *)self button];
  [v5 setHidden:v4 == 0];
}

- (void)setMenu:(id)a3
{
  v7 = (UIMenu *)a3;
  if (self->_menu != v7)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    objc_super v5 = [(CKDetailsSIMCell *)self button];
    [v5 setMenu:v7];

    objc_super v6 = [(CKDetailsSIMCell *)self button];
    [v6 setHidden:v7 == 0];
  }
}

- (void)setSIMLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKDetailsSIMCell *)self simLabel];
  [v5 setText:v4];
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (UILabel)simLabel
{
  return self->_simLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simLabel, 0);
  objc_storeStrong((id *)&self->_menu, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end