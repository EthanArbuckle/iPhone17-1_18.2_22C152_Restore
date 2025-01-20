@interface EventKitTCCTableViewCell
+ (id)reuseIdentifier;
- (EventKitTCCTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 title:(id)a5 subtitle:(id)a6 symbolName:(id)a7 imageColor:(id)a8;
- (UIImageView)symbolImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)setSubtitleLabel:(id)a3;
- (void)setSymbolImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation EventKitTCCTableViewCell

+ (id)reuseIdentifier
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__EventKitTCCTableViewCell_reuseIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reuseIdentifier_onceToken != -1) {
    dispatch_once(&reuseIdentifier_onceToken, block);
  }
  v2 = (void *)reuseIdentifier_reuseIdentifier;

  return v2;
}

uint64_t __43__EventKitTCCTableViewCell_reuseIdentifier__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  reuseIdentifier_reuseIdentifier = NSStringFromClass(v0);

  return MEMORY[0x270F9A758]();
}

- (EventKitTCCTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 title:(id)a5 subtitle:(id)a6 symbolName:(id)a7 imageColor:(id)a8
{
  v158[4] = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v153.receiver = self;
  v153.super_class = (Class)EventKitTCCTableViewCell;
  v18 = [(EventKitTCCTableViewCell *)&v153 initWithStyle:a3 reuseIdentifier:a4];
  if (v18)
  {
    v19 = [MEMORY[0x263F825C8] tertiarySystemFillColor];
    [(EventKitTCCTableViewCell *)v18 setBackgroundColor:v19];

    -[EventKitTCCTableViewCell setSeparatorInset:](v18, "setSeparatorInset:", 0.0, 16.0, 0.0, 16.0);
    id v20 = objc_alloc(MEMORY[0x263F82828]);
    double v21 = *MEMORY[0x263F001A8];
    double v22 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v23 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v24 = *(double *)(MEMORY[0x263F001A8] + 24);
    v25 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x263F001A8], v22, v23, v24);
    [(EventKitTCCTableViewCell *)v18 setSymbolImageView:v25];

    v26 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    v27 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    [v27 setContentMode:4];

    v28 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    id v149 = v17;
    [v28 setTintColor:v17];

    v29 = (void *)MEMORY[0x263F827E8];
    uint64_t v30 = *MEMORY[0x263F83610];
    [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83610] scale:-1];
    v31 = id v152 = v15;
    id v150 = v16;
    v32 = [v29 systemImageNamed:v16 withConfiguration:v31];
    v33 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    [v33 setImage:v32];

    v34 = [(EventKitTCCTableViewCell *)v18 contentView];
    v35 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    [v34 addSubview:v35];

    v36 = [MEMORY[0x263F81708] preferredFontForTextStyle:v30];
    [v36 pointSize];
    double v38 = v37;

    v124 = (void *)MEMORY[0x263F08938];
    v146 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    v140 = [v146 centerYAnchor];
    v143 = [(EventKitTCCTableViewCell *)v18 contentView];
    v136 = [v143 centerYAnchor];
    v132 = [v140 constraintEqualToAnchor:v136];
    v158[0] = v132;
    v128 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    v117 = [v128 leadingAnchor];
    v120 = [(EventKitTCCTableViewCell *)v18 contentView];
    v39 = [v120 leadingAnchor];
    v40 = [v117 constraintEqualToAnchor:v39 constant:16.0];
    v158[1] = v40;
    v41 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    v42 = [v41 widthAnchor];
    v43 = [v42 constraintEqualToConstant:v38];
    v158[2] = v43;
    v44 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    [v44 heightAnchor];
    v45 = id v151 = v14;
    v46 = [v45 constraintEqualToConstant:v38];
    v158[3] = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v158 count:4];
    [v124 activateConstraints:v47];

    v48 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
    LODWORD(v49) = 1144750080;
    [v48 setContentHuggingPriority:0 forAxis:v49];

    v50 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v21, v22, v23, v24);
    [(EventKitTCCTableViewCell *)v18 setTitleLabel:v50];

    v51 = [(EventKitTCCTableViewCell *)v18 titleLabel];
    [v51 setTranslatesAutoresizingMaskIntoConstraints:0];

    v52 = (void *)MEMORY[0x263F81708];
    uint64_t v53 = *MEMORY[0x263F835B8];
    v54 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    [v54 pointSize];
    v55 = objc_msgSend(v52, "boldSystemFontOfSize:");
    v56 = [(EventKitTCCTableViewCell *)v18 titleLabel];
    [v56 setFont:v55];

    v57 = [(EventKitTCCTableViewCell *)v18 titleLabel];
    [v57 setAdjustsFontForContentSizeCategory:1];

    v58 = [(EventKitTCCTableViewCell *)v18 titleLabel];
    [v58 setText:v151];

    v59 = [(EventKitTCCTableViewCell *)v18 titleLabel];
    [v59 setNumberOfLines:0];

    v60 = [(EventKitTCCTableViewCell *)v18 contentView];
    v61 = [(EventKitTCCTableViewCell *)v18 titleLabel];
    [v60 addSubview:v61];

    v144 = (void *)MEMORY[0x263F08938];
    v62 = [(EventKitTCCTableViewCell *)v18 titleLabel];
    v63 = [v62 topAnchor];
    v147 = [(EventKitTCCTableViewCell *)v18 contentView];
    uint64_t v64 = [v147 topAnchor];
    v141 = (void *)v64;
    if (v152)
    {
      v137 = [v63 constraintEqualToAnchor:v64 constant:8.0];
      v156[0] = v137;
      v129 = [(EventKitTCCTableViewCell *)v18 titleLabel];
      v121 = [v129 leadingAnchor];
      v65 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
      v66 = [v65 trailingAnchor];
      v67 = [v121 constraintEqualToAnchor:v66 constant:16.0];
      v156[1] = v67;
      v68 = [(EventKitTCCTableViewCell *)v18 titleLabel];
      v69 = [v68 trailingAnchor];
      [(EventKitTCCTableViewCell *)v18 contentView];
      v70 = v125 = v62;
      [v70 trailingAnchor];
      v71 = v118 = v63;
      v72 = [v69 constraintEqualToAnchor:v71 constant:-16.0];
      v156[2] = v72;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:3];
      v73 = uint64_t v133 = v53;
      [v144 activateConstraints:v73];

      v74 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v21, v22, v23, v24);
      [(EventKitTCCTableViewCell *)v18 setSubtitleLabel:v74];

      v75 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      [v75 setTranslatesAutoresizingMaskIntoConstraints:0];

      v76 = [MEMORY[0x263F81708] preferredFontForTextStyle:v133];
      v77 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      [v77 setFont:v76];

      v78 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      [v78 setAdjustsFontForContentSizeCategory:1];

      v79 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      [v79 setNumberOfLines:1];

      v80 = [MEMORY[0x263F825C8] grayColor];
      v81 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      [v81 setTextColor:v80];

      v82 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      [v82 setText:v152];

      v83 = [(EventKitTCCTableViewCell *)v18 contentView];
      v84 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      [v83 addSubview:v84];

      v126 = (void *)MEMORY[0x263F08938];
      v148 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      v142 = [v148 topAnchor];
      v145 = [(EventKitTCCTableViewCell *)v18 titleLabel];
      v138 = [v145 bottomAnchor];
      v134 = [v142 constraintEqualToAnchor:v138 constant:4.0];
      v155[0] = v134;
      v130 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      v122 = [v130 leadingAnchor];
      v85 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
      v86 = [v85 trailingAnchor];
      v87 = [v122 constraintEqualToAnchor:v86 constant:16.0];
      v155[1] = v87;
      v88 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      v89 = [v88 trailingAnchor];
      v90 = [(EventKitTCCTableViewCell *)v18 contentView];
      v91 = [v90 trailingAnchor];
      v92 = [v89 constraintEqualToAnchor:v91 constant:-16.0];
      v155[2] = v92;
      v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v155 count:3];
      [v126 activateConstraints:v93];

      v94 = [(EventKitTCCTableViewCell *)v18 subtitleLabel];
      v95 = [v94 bottomAnchor];
      v96 = [(EventKitTCCTableViewCell *)v18 contentView];
      v97 = [v96 bottomAnchor];
      v62 = [v95 constraintEqualToAnchor:v97 constant:-8.0];

      LODWORD(v98) = 1144750080;
      [v62 setPriority:v98];
      v99 = (void *)MEMORY[0x263F08938];
      v154 = v62;
      v100 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v154 count:1];
      [v99 activateConstraints:v100];
    }
    else
    {
      v139 = [MEMORY[0x263F81708] preferredFontForTextStyle:v53];
      [v139 pointSize];
      v135 = [v63 constraintEqualToAnchor:v64 constant:v101 * 0.5 + 2.0 + 8.0];
      v157[0] = v135;
      v131 = [(EventKitTCCTableViewCell *)v18 titleLabel];
      v123 = [v131 bottomAnchor];
      v127 = [(EventKitTCCTableViewCell *)v18 contentView];
      v116 = [v127 bottomAnchor];
      v119 = [MEMORY[0x263F81708] preferredFontForTextStyle:v53];
      [v119 pointSize];
      v115 = [v123 constraintEqualToAnchor:v116 constant:-(v102 * 0.5 + 2.0 + 8.0)];
      v157[1] = v115;
      v114 = [(EventKitTCCTableViewCell *)v18 titleLabel];
      v112 = [v114 leadingAnchor];
      v113 = [(EventKitTCCTableViewCell *)v18 symbolImageView];
      v111 = [v113 trailingAnchor];
      v103 = [v112 constraintEqualToAnchor:v111 constant:16.0];
      v157[2] = v103;
      v104 = [(EventKitTCCTableViewCell *)v18 titleLabel];
      v105 = [v104 trailingAnchor];
      v106 = [(EventKitTCCTableViewCell *)v18 contentView];
      v107 = [v106 trailingAnchor];
      [v105 constraintEqualToAnchor:v107 constant:-16.0];
      v108 = v100 = v63;
      v157[3] = v108;
      v109 = [MEMORY[0x263EFF8C0] arrayWithObjects:v157 count:4];
      [v144 activateConstraints:v109];
    }
    id v14 = v151;
    id v15 = v152;
    id v17 = v149;
    id v16 = v150;
  }

  return v18;
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_symbolImageView, 0);
}

@end