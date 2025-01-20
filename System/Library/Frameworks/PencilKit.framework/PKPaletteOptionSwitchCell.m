@interface PKPaletteOptionSwitchCell
- (id)initWithTitle:(void *)a3 subtitle:(void *)a4 target:(uint64_t)a5 action:;
@end

@implementation PKPaletteOptionSwitchCell

- (id)initWithTitle:(void *)a3 subtitle:(void *)a4 target:(uint64_t)a5 action:
{
  v69[12] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    v68.receiver = a1;
    v68.super_class = (Class)PKPaletteOptionSwitchCell;
    v12 = (id *)objc_msgSendSuper2(&v68, sel_init);
    if (v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
      [v13 setSpacing:16.0];
      [v13 setAxis:0];
      [v13 setAlignment:3];
      [v13 setDistribution:0];
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v12 addSubview:v13];
      id v14 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
      [v14 setSpacing:4.0];
      [v14 setAxis:1];
      [v14 setAlignment:1];
      [v14 setDistribution:0];
      uint64_t v66 = a5;
      v15 = v14;
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v16 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      id v17 = v12[51];
      v12[51] = v16;

      v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [v12[51] setFont:v18];

      [v12[51] setNumberOfLines:0];
      [v12[51] setLineBreakMode:0];
      [v12[51] setText:v9];
      [v15 addArrangedSubview:v12[51]];
      id v19 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      id v20 = v12[53];
      v12[53] = v19;

      v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
      [v12[53] setFont:v21];

      [v12[53] setNumberOfLines:0];
      [v12[53] setLineBreakMode:0];
      [v12[53] setText:v10];
      [v12[53] setHidden:v10 == 0];
      [v15 addArrangedSubview:v12[53]];
      id v22 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
      id v23 = v12[52];
      v12[52] = v22;

      [v12[52] addTarget:v11 action:v66 forControlEvents:4096];
      v51 = v15;
      [v13 addArrangedSubview:v15];
      [v13 addArrangedSubview:v12[52]];
      v47 = (void *)MEMORY[0x1E4F28DC8];
      v63 = [v13 topAnchor];
      v62 = [v12 topAnchor];
      v61 = [v63 constraintEqualToAnchor:v62];
      v69[0] = v61;
      v60 = [v13 leadingAnchor];
      v59 = [v12 leadingAnchor];
      v58 = [v60 constraintEqualToAnchor:v59 constant:16.0];
      v69[1] = v58;
      v57 = [v13 trailingAnchor];
      v56 = [v12 trailingAnchor];
      v55 = [v57 constraintEqualToAnchor:v56 constant:-16.0];
      v69[2] = v55;
      v54 = [v13 bottomAnchor];
      v53 = [v12 bottomAnchor];
      v52 = [v54 constraintEqualToAnchor:v53];
      v69[3] = v52;
      v50 = [v15 leadingAnchor];
      v49 = [v13 leadingAnchor];
      v48 = [v50 constraintEqualToAnchor:v49];
      v69[4] = v48;
      v46 = [v15 trailingAnchor];
      v45 = [v12[52] leadingAnchor];
      v44 = [v46 constraintLessThanOrEqualToAnchor:v45 constant:-16.0];
      v69[5] = v44;
      v43 = [v15 topAnchor];
      v42 = [v13 topAnchor];
      v41 = [v43 constraintEqualToAnchor:v42];
      v69[6] = v41;
      v40 = [v15 bottomAnchor];
      v39 = [v13 bottomAnchor];
      v38 = [v40 constraintEqualToAnchor:v39];
      v69[7] = v38;
      v37 = [v12[51] topAnchor];
      v36 = [v12 topAnchor];
      v35 = [v37 constraintGreaterThanOrEqualToAnchor:v36 constant:16.0];
      v69[8] = v35;
      v34 = [v12[51] bottomAnchor];
      v33 = [v12 bottomAnchor];
      [v34 constraintLessThanOrEqualToAnchor:v33 constant:-16.0];
      v24 = id v67 = v9;
      v69[9] = v24;
      [v12[53] topAnchor];
      v25 = id v65 = v10;
      [v12 topAnchor];
      v26 = id v64 = v11;
      v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26 constant:16.0];
      v69[10] = v27;
      v28 = [v12[53] bottomAnchor];
      v29 = [v12 bottomAnchor];
      v30 = [v28 constraintLessThanOrEqualToAnchor:v29 constant:-16.0];
      v69[11] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:12];
      [v47 activateConstraints:v31];

      id v11 = v64;
      id v10 = v65;

      id v9 = v67;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTextLabel, 0);
  objc_storeStrong((id *)&self->_switchButton, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end