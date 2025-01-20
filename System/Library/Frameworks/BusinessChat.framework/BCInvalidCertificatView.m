@interface BCInvalidCertificatView
- (id)initWithHost:(id *)a1;
@end

@implementation BCInvalidCertificatView

- (id)initWithHost:(id *)a1
{
  v120[6] = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    v116.receiver = a1;
    v116.super_class = (Class)BCInvalidCertificatView;
    v5 = (id *)objc_msgSendSuper2(&v116, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 51, a2);
      v110 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v115 = v4;
      v100 = [MEMORY[0x263F1C6B0] imageNamed:@"InsecureIcon" inBundle:v110 compatibleWithTraitCollection:0];
      v6 = [MEMORY[0x263F1C550] colorNamed:@"InsecureTitleColor" inBundle:v110 compatibleWithTraitCollection:0];
      v96 = [MEMORY[0x263F1C550] colorNamed:@"InsecureMessageColor" inBundle:v110 compatibleWithTraitCollection:0];
      v105 = [MEMORY[0x263F1C550] colorNamed:@"InvalidCertificatColor" inBundle:v110 compatibleWithTraitCollection:0];
      v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
      v8 = [v7 fontDescriptor];

      v117[0] = *MEMORY[0x263F1D210];
      v119[0] = *MEMORY[0x263F1D350];
      v9 = [NSNumber numberWithDouble:*MEMORY[0x263F1D330]];
      v118[0] = v9;
      v10 = [NSDictionary dictionaryWithObjects:v118 forKeys:v119 count:1];
      v120[0] = v10;
      v11 = [NSDictionary dictionaryWithObjects:v120 forKeys:v117 count:1];
      v12 = [v8 fontDescriptorByAddingAttributes:v11];

      [a1 setBackgroundColor:v105];
      v13 = objc_opt_new();
      objc_storeStrong(a1 + 55, v13);

      v14 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v100];
      objc_storeStrong(a1 + 52, v14);

      v15 = objc_opt_new();
      objc_storeStrong(a1 + 53, v15);

      v16 = (void *)MEMORY[0x263F1C658];
      [v12 pointSize];
      v17 = objc_msgSend(v16, "fontWithDescriptor:size:", v12);
      [a1[53] setFont:v17];

      [a1[53] setTextColor:v6];
      v18 = +[BCShared classBundle]();
      v19 = [v18 localizedStringForKey:@"CONNECTION_NOT_PRIVATE_TITLE" value:&stru_26DD2B2A8 table:0];
      [a1[53] setText:v19];

      [a1[53] setTextAlignment:1];
      [a1[53] setNumberOfLines:0];
      v20 = objc_opt_new();
      objc_storeStrong(a1 + 54, v20);

      v21 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
      [a1[54] setFont:v21];

      [a1[54] setTextColor:v96];
      v22 = NSString;
      v23 = +[BCShared classBundle]();
      v24 = [v23 localizedStringForKey:@"CONNECTION_NOT_PRIVATE_MESSAGE" value:&stru_26DD2B2A8 table:0];
      id v25 = a1[51];
      v26 = objc_msgSend(v22, "stringWithFormat:", v24, v25);
      [a1[54] setText:v26];

      [a1[54] setTextAlignment:1];
      [a1[54] setNumberOfLines:0];
      id v27 = a1[52];
      id v28 = a1[55];
      [v28 addSubview:v27];

      id v29 = a1[53];
      id v30 = a1[55];
      [v30 addSubview:v29];

      id v31 = a1[54];
      id v32 = a1[55];
      [v32 addSubview:v31];

      [a1 addSubview:a1[55]];
      [a1[55] setTranslatesAutoresizingMaskIntoConstraints:0];
      [a1[52] setTranslatesAutoresizingMaskIntoConstraints:0];
      [a1[53] setTranslatesAutoresizingMaskIntoConstraints:0];
      [a1[54] setTranslatesAutoresizingMaskIntoConstraints:0];
      v80 = (void *)MEMORY[0x263F08938];
      id v111 = a1[55];
      v106 = [v111 topAnchor];
      v101 = [a1 topAnchor];
      v97 = [v106 constraintGreaterThanOrEqualToAnchor:v101 constant:20.0];
      v120[0] = v97;
      id v93 = a1[55];
      v90 = [v93 leftAnchor];
      v87 = [a1 leftAnchor];
      v84 = [v90 constraintGreaterThanOrEqualToAnchor:v87 constant:20.0];
      v120[1] = v84;
      id v82 = a1[55];
      v78 = [v82 rightAnchor];
      v76 = [a1 rightAnchor];
      v74 = [v78 constraintLessThanOrEqualToAnchor:v76 constant:-20.0];
      v120[2] = v74;
      id v73 = a1[55];
      v72 = [v73 bottomAnchor];
      v71 = [a1 bottomAnchor];
      v70 = [v72 constraintLessThanOrEqualToAnchor:v71 constant:-20.0];
      v120[3] = v70;
      id v33 = a1[55];
      v34 = [v33 centerXAnchor];
      v35 = [a1 centerXAnchor];
      v36 = [v34 constraintEqualToAnchor:v35];
      v120[4] = v36;
      id v37 = a1[55];
      v38 = [v37 centerYAnchor];
      v39 = [a1 centerYAnchor];
      v40 = [v38 constraintEqualToAnchor:v39];
      v120[5] = v40;
      v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:6];
      [v80 activateConstraints:v41];

      v102 = (void *)MEMORY[0x263F08938];
      id v112 = a1[52];
      v107 = [v112 topAnchor];
      id v42 = a1[55];
      v43 = [v42 topAnchor];
      v44 = [v107 constraintEqualToAnchor:v43];
      v119[0] = v44;
      id v45 = a1[52];
      v46 = [v45 centerXAnchor];
      id v47 = a1[55];
      v48 = [v47 centerXAnchor];
      v49 = [v46 constraintEqualToAnchor:v48];
      v119[1] = v49;
      v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:2];
      [v102 activateConstraints:v50];

      v91 = (void *)MEMORY[0x263F08938];
      id v113 = a1[53];
      v108 = [v113 firstBaselineAnchor];
      id v103 = a1[52];
      v98 = [v103 lastBaselineAnchor];
      v94 = [v108 constraintEqualToAnchor:v98 constant:40.0];
      v118[0] = v94;
      id v88 = a1[53];
      v85 = [v88 leadingAnchor];
      id v51 = a1[55];
      v52 = [v51 leadingAnchor];
      v53 = [v85 constraintEqualToAnchor:v52];
      v118[1] = v53;
      id v54 = a1[53];
      v55 = [v54 trailingAnchor];
      id v56 = a1[55];
      v57 = [v56 trailingAnchor];
      v58 = [v55 constraintEqualToAnchor:v57];
      v118[2] = v58;
      v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:3];
      [v91 activateConstraints:v59];

      v86 = (void *)MEMORY[0x263F08938];
      id v114 = a1[54];
      v109 = [v114 firstBaselineAnchor];
      id v104 = a1[53];
      v99 = [v104 lastBaselineAnchor];
      v95 = [v109 constraintEqualToAnchor:v99 constant:38.0];
      v117[0] = v95;
      id v92 = a1[54];
      v89 = [v92 leadingAnchor];
      id v83 = a1[55];
      v81 = [v83 leadingAnchor];
      v79 = [v89 constraintEqualToAnchor:v81];
      v117[1] = v79;
      id v77 = a1[54];
      v75 = [v77 trailingAnchor];
      id v60 = a1[55];
      v61 = [v60 trailingAnchor];
      v62 = [v75 constraintEqualToAnchor:v61];
      v117[2] = v62;
      id v63 = a1[54];
      v64 = [v63 bottomAnchor];
      id v65 = a1[55];
      v66 = [v65 bottomAnchor];
      v67 = [v64 constraintEqualToAnchor:v66];
      v117[3] = v67;
      v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:4];
      [v86 activateConstraints:v68];

      id v4 = v115;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_insecureIcon, 0);

  objc_storeStrong((id *)&self->_host, 0);
}

@end