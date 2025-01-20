@interface AXUISettingsInstructionsView
- (AXUISettingsInstructionsView)initWithSpecifier:(id)a3;
- (OBWelcomeController)moreInfoController;
- (double)preferredHeightForWidth:(double)a3;
- (id)settingsLocString:(id)a3 table:(id)a4;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)_initializeContent;
- (void)doneButtonTapped:(id)a3;
- (void)setMoreInfoController:(id)a3;
- (void)setNeedsLayout;
@end

@implementation AXUISettingsInstructionsView

- (AXUISettingsInstructionsView)initWithSpecifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXUISettingsInstructionsView;
  v6 = -[AXUISettingsInstructionsView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    marginConstraints = v6->_marginConstraints;
    v6->_marginConstraints = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_specifier, a3);
    [(AXUISettingsInstructionsView *)v6 _initializeContent];
    v9 = v6;
  }

  return v6;
}

- (id)settingsLocString:(id)a3 table:(id)a4
{
  specifier = self->_specifier;
  id v6 = a4;
  id v7 = a3;
  v8 = [(PSSpecifier *)specifier propertyForKey:@"bundlePath"];
  v9 = [MEMORY[0x1E4F28B50] bundleWithPath:v8];
  v10 = [v9 localizedStringForKey:v7 value:v7 table:v6];

  return v10;
}

- (void)_initializeContent
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  v3 = (NSMutableArray *)objc_opt_new();
  contentLabels = self->_contentLabels;
  self->_contentLabels = v3;

  id v5 = (NSMutableArray *)objc_opt_new();
  moreLabels = self->_moreLabels;
  self->_moreLabels = v5;

  id v7 = [(PSSpecifier *)self->_specifier propertyForKey:@"table"];
  v123 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4FB1948] groupedFooterConfiguration];
  v9 = [v8 textProperties];
  v120 = [v9 color];

  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  v10 = [(PSSpecifier *)self->_specifier propertyForKey:@"content"];
  uint64_t v131 = [v10 countByEnumeratingWithState:&v154 objects:v163 count:16];
  objc_super v11 = 0;
  if (!v131)
  {
LABEL_53:

    goto LABEL_54;
  }
  uint64_t v128 = *(void *)v155;
  double v12 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v122 = *MEMORY[0x1E4FB28F0];
  unint64_t v16 = 0x1E4F92000uLL;
  uint64_t v118 = *MEMORY[0x1E4FB12E8];
  uint64_t v119 = *MEMORY[0x1E4FB12C8];
  uint64_t v117 = *MEMORY[0x1E4FB12B8];
  v124 = v7;
  v121 = v10;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v155 != v128) {
        objc_enumerationMutation(v10);
      }
      v18 = *(void **)(*((void *)&v154 + 1) + 8 * v17);
      v19 = [v18 objectForKey:@"requiresNoHomeButton"];
      int v20 = [v19 BOOLValue];

      if (!v20 || (AXDeviceHasHomeButton() & 1) == 0)
      {
        v21 = [v18 objectForKey:@"alreadyLocalized"];
        int v22 = [v21 BOOLValue];

        v23 = [v18 objectForKey:@"headerLabel"];
        v24 = v23;
        int v139 = v22;
        if (v22)
        {
          id v25 = v23;
        }
        else
        {
          uint64_t v148 = MEMORY[0x1E4F143A8];
          uint64_t v149 = 3221225472;
          v150 = __50__AXUISettingsInstructionsView__initializeContent__block_invoke;
          v151 = &unk_1E649BE60;
          v152 = self;
          id v153 = v7;
          AXLocStringForDeviceVariant();
          id v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        v26 = v25;
        v27 = [v18 objectForKey:@"contentGetter"];
        v138 = v26;
        if ([v27 length])
        {
          v28 = [(PSSpecifier *)self->_specifier target];
          v140 = [v28 safeStringForKey:v27];

          v26 = v138;
        }
        else
        {
          v140 = 0;
        }
        v29 = [v18 objectForKey:@"contentLabel"];
        v137 = v27;
        v134 = v29;
        if (v29)
        {
          if (v139)
          {
            id v30 = v29;
            v31 = v140;
          }
          else
          {
            uint64_t v142 = MEMORY[0x1E4F143A8];
            uint64_t v143 = 3221225472;
            v144 = __50__AXUISettingsInstructionsView__initializeContent__block_invoke_2;
            v145 = &unk_1E649BE60;
            v146 = self;
            id v147 = v7;
            AXLocStringForDeviceVariant();
            id v30 = (id)objc_claimAutoreleasedReturnValue();

            v31 = v147;
          }

          v140 = v30;
          v27 = v137;
        }
        v136 = [v18 objectForKey:@"moreLabel"];
        v132 = v24;
        uint64_t v133 = v17;
        if ([v26 length])
        {
          v32 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v12, v13, v14, v15);
          headerLabel = self->_headerLabel;
          self->_headerLabel = v32;

          [(UILabel *)self->_headerLabel setNumberOfLines:0];
          [(UILabel *)self->_headerLabel setAdjustsFontForContentSizeCategory:1];
          [(UILabel *)self->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
          v34 = [MEMORY[0x1E4FB1618] clearColor];
          [(UILabel *)self->_headerLabel setBackgroundColor:v34];

          [(UILabel *)self->_headerLabel setLineBreakMode:0];
          LODWORD(v35) = 0.5;
          [(UILabel *)self->_headerLabel _setHyphenationFactor:v35];
          [(UILabel *)self->_headerLabel setText:v26];
          v127 = v11;
          if (AXProcessIsSetup())
          {
            v36 = [getBFFStyleClass() sharedStyle];
            [v36 applyThemeToLabel:self->_headerLabel];
          }
          else
          {
            [(UILabel *)self->_headerLabel setTextColor:v120];
          }
          v135 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:v122 addingSymbolicTraits:2 options:0];
          v40 = objc_msgSend(MEMORY[0x1E4FB1798], "fontWithDescriptor:size:", 0.0);
          [(UILabel *)self->_headerLabel setFont:v40];

          [(UILabel *)self->_headerLabel sizeToFit];
          v41 = [(AXUISettingsInstructionsView *)self contentView];
          [v41 addSubview:self->_headerLabel];

          v42 = [(UILabel *)self->_headerLabel leadingAnchor];
          v43 = [(AXUISettingsInstructionsView *)self contentView];
          v44 = [v43 leadingAnchor];
          uint64_t v45 = [v42 constraintEqualToAnchor:v44 constant:0.0];

          v129 = (void *)v45;
          [(NSMutableArray *)self->_marginConstraints addObject:v45];
          v125 = [(UILabel *)self->_headerLabel topAnchor];
          v46 = [(AXUISettingsInstructionsView *)self contentView];
          v47 = [v46 topAnchor];
          v48 = [v125 constraintEqualToAnchor:v47 constant:5.0];
          v162[0] = v48;
          v162[1] = v45;
          v49 = [(UILabel *)self->_headerLabel trailingAnchor];
          v50 = [(AXUISettingsInstructionsView *)self contentView];
          v51 = [v50 trailingAnchor];
          v52 = [v49 constraintLessThanOrEqualToAnchor:v51 constant:-15.0];
          v162[2] = v52;
          v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:3];
          [v123 addObjectsFromArray:v53];

          v37 = self->_headerLabel;
          v54 = v129;
          id v7 = v124;
          v10 = v121;
          goto LABEL_36;
        }
        if ([v140 length])
        {
          v37 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v12, v13, v14, v15);
          [(UILabel *)v37 setNumberOfLines:0];
          [(UILabel *)v37 setLineBreakMode:0];
          v38 = [MEMORY[0x1E4FB1618] clearColor];
          [(UILabel *)v37 setBackgroundColor:v38];

          [(UILabel *)v37 setTranslatesAutoresizingMaskIntoConstraints:0];
          if (AXProcessIsSetup())
          {
            v39 = [getBFFStyleClass() sharedStyle];
            [v39 applyThemeToLabel:v37];
          }
          else
          {
            [(UILabel *)v37 setTextColor:v120];
          }
          [(UILabel *)v37 setText:v140];
          v61 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v122];
          [(UILabel *)v37 setFont:v61];

          [(UILabel *)v37 setAdjustsFontForContentSizeCategory:1];
          LODWORD(v62) = 0.5;
          [(UILabel *)v37 _setHyphenationFactor:v62];
          [(UILabel *)v37 sizeToFit];
          v63 = [(AXUISettingsInstructionsView *)self contentView];
          [v63 addSubview:v37];

          [(NSMutableArray *)self->_contentLabels addObject:v37];
          v64 = [(UILabel *)v37 topAnchor];
          if (v11)
          {
            v65 = [(UILabel *)v11 bottomAnchor];
            v135 = [v64 constraintEqualToAnchor:v65 constant:0.0];
          }
          else
          {
            v65 = [(AXUISettingsInstructionsView *)self contentView];
            v66 = [v65 topAnchor];
            v135 = [v64 constraintEqualToAnchor:v66 constant:5.0];
          }
          v67 = v11;

          v68 = [(UILabel *)v37 leadingAnchor];
          v69 = [(AXUISettingsInstructionsView *)self contentView];
          v70 = [v69 leadingAnchor];
          uint64_t v71 = [v68 constraintEqualToAnchor:v70 constant:0.0];

          [(NSMutableArray *)self->_marginConstraints addObject:v71];
          v161[0] = v135;
          v161[1] = v71;
          v72 = [(UILabel *)v37 trailingAnchor];
          v73 = [(AXUISettingsInstructionsView *)self contentView];
          v74 = [v73 trailingAnchor];
          v75 = [v72 constraintLessThanOrEqualToAnchor:v74 constant:-15.0];
          v161[2] = v75;
          v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:3];
          [v123 addObjectsFromArray:v76];

          __int16 v141 = 8226;
          v77 = [(UILabel *)v37 accessibilityLabel];
          v78 = [NSString stringWithCharacters:&v141 length:1];
          v79 = [(UILabel *)v37 accessibilityLabel];
          v80 = objc_msgSend(v77, "stringByReplacingOccurrencesOfString:withString:options:range:", v78, &stru_1F1F0EB90, 1, 0, objc_msgSend(v79, "length"));
          [(UILabel *)v37 setAccessibilityLabel:v80];

          v54 = (void *)v71;
          id v7 = v124;
          goto LABEL_36;
        }
        if (v136 && (AXProcessIsSetup() & 1) == 0)
        {
          v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DD8]), "initWithFrame:", v12, v13, v14, v15);
          v56 = [*(id *)(v16 + 3648) appearance];
          v57 = [v56 footerHyperlinkColor];
          if (v57)
          {
            v58 = [*(id *)(v16 + 3648) appearance];
            uint64_t v59 = [v58 footerHyperlinkColor];

            unint64_t v60 = 0x1E4FB1000;
          }
          else
          {
            unint64_t v60 = 0x1E4FB1000uLL;
            uint64_t v59 = [MEMORY[0x1E4FB1618] systemBlueColor];
          }

          v81 = [*(id *)(v60 + 1560) clearColor];
          [v55 setBackgroundColor:v81];

          [v55 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v55 setShowsVerticalScrollIndicator:0];
          [v55 setEditable:0];
          [v55 setSelectable:1];
          [v55 setScrollEnabled:0];
          v82 = [v55 textContainer];
          [v82 setLineFragmentPadding:0.0];

          [v55 _setInteractiveTextSelectionDisabled:1];
          [v55 setDelegate:self];
          v83 = [v18 objectForKey:@"additionalContent"];
          [v55 _accessibilitySetRetainedValue:v83 forKey:@"additionalContent"];

          v84 = [v18 objectForKey:@"additionalTitleLabel"];
          [v55 _accessibilitySetRetainedValue:v84 forKey:@"additionalTitleLabel"];

          v85 = [v18 objectForKey:@"additionalSubtitleLabel"];
          [v55 _accessibilitySetRetainedValue:v85 forKey:@"additionalSubtitleLabel"];

          v86 = [v18 objectForKey:@"symbolName"];
          [v55 _accessibilitySetRetainedValue:v86 forKey:@"symbolName"];

          v87 = [v18 objectForKey:@"image"];
          [v55 _accessibilitySetRetainedValue:v87 forKey:@"image"];

          v88 = [v18 objectForKey:@"customActionBlock"];
          [v55 _accessibilitySetRetainedValue:v88 forKey:@"customActionBlock"];

          [v55 _accessibilitySetRetainedValue:v124 forKey:@"tableIdentifier"];
          if (v139)
          {
            id v89 = v136;
          }
          else
          {
            id v89 = [(AXUISettingsInstructionsView *)self settingsLocString:v136 table:v124];
          }
          id v90 = v89;
          id v91 = objc_alloc(MEMORY[0x1E4F28B18]);
          v159[0] = v119;
          v92 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F1F0EB90];
          v160[0] = v92;
          v160[1] = MEMORY[0x1E4F1CC28];
          v159[1] = v118;
          v159[2] = v117;
          v135 = (void *)v59;
          v93 = [(AXUISettingsInstructionsView *)self _accessibilityHigherContrastTintColorForColor:v59];
          v160[2] = v93;
          v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v160 forKeys:v159 count:3];
          v130 = v90;
          uint64_t v95 = [v91 initWithString:v90 attributes:v94];

          v126 = (void *)v95;
          [v55 setAttributedText:v95];
          v96 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v122];
          [v55 setFont:v96];

          [v55 setAdjustsFontForContentSizeCategory:1];
          [v55 sizeToFit];
          v97 = [(AXUISettingsInstructionsView *)self contentView];
          [v97 addSubview:v55];

          v98 = [v55 topAnchor];
          if (v11)
          {
            v99 = [(UILabel *)v11 bottomAnchor];
            uint64_t v100 = [v98 constraintEqualToAnchor:v99 constant:0.0];
          }
          else
          {
            v99 = [(AXUISettingsInstructionsView *)self contentView];
            v101 = [v99 topAnchor];
            uint64_t v100 = [v98 constraintEqualToAnchor:v101 constant:5.0];
          }
          v102 = v11;

          v103 = [v55 leadingAnchor];
          v104 = [(AXUISettingsInstructionsView *)self contentView];
          v105 = [v104 leadingAnchor];
          v106 = [v103 constraintEqualToAnchor:v105 constant:0.0];

          [(NSMutableArray *)self->_marginConstraints addObject:v106];
          v158[0] = v100;
          v158[1] = v106;
          v107 = [v55 trailingAnchor];
          v108 = [(AXUISettingsInstructionsView *)self contentView];
          v109 = [v108 trailingAnchor];
          [v107 constraintLessThanOrEqualToAnchor:v109 constant:-15.0];
          v111 = v110 = (void *)v100;
          v158[2] = v111;
          v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:3];
          [v123 addObjectsFromArray:v112];

          v37 = v55;
          [(NSMutableArray *)self->_moreLabels addObject:v37];

          v10 = v121;
          id v7 = v124;
          v54 = v130;
LABEL_36:

          objc_super v11 = v37;
          unint64_t v16 = 0x1E4F92000;
          v24 = v132;
          uint64_t v17 = v133;
          v27 = v137;
          v26 = v138;
        }

        if ((v139 & 1) == 0) {
      }
        }
      ++v17;
    }
    while (v131 != v17);
    uint64_t v113 = [v10 countByEnumeratingWithState:&v154 objects:v163 count:16];
    uint64_t v131 = v113;
  }
  while (v113);

  if (v11)
  {
    v10 = [(UILabel *)v11 bottomAnchor];
    v114 = [(AXUISettingsInstructionsView *)self contentView];
    v115 = [v114 bottomAnchor];
    v116 = [v10 constraintLessThanOrEqualToAnchor:v115 constant:-5.0];
    [v123 addObject:v116];

    goto LABEL_53;
  }
LABEL_54:
  [MEMORY[0x1E4F28DC8] activateConstraints:v123];
}

uint64_t __50__AXUISettingsInstructionsView__initializeContent__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) settingsLocString:a2 table:*(void *)(a1 + 40)];
}

uint64_t __50__AXUISettingsInstructionsView__initializeContent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) settingsLocString:a2 table:*(void *)(a1 + 40)];
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v34 = a4;
  id v35 = a5;
  v42 = v7;
  v37 = [v7 _accessibilityValueForKey:@"additionalContent"];
  v43 = [v7 _accessibilityValueForKey:@"tableIdentifier"];
  v38 = [v7 _accessibilityValueForKey:@"additionalTitleLabel"];
  v39 = [v7 _accessibilityValueForKey:@"additionalSubtitleLabel"];
  v36 = [v7 _accessibilityValueForKey:@"image"];
  v40 = [v7 _accessibilityValueForKey:@"symbolName"];
  v8 = [v7 _accessibilityValueForKey:@"customActionBlock"];
  v41 = v8;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4FB13F0];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke;
    v73[3] = &unk_1E649BE88;
    id v74 = v8;
    v10 = [v9 actionWithHandler:v73];
    objc_super v11 = v74;
    goto LABEL_39;
  }
  if (v39)
  {
    uint64_t v33 = [(AXUISettingsInstructionsView *)self settingsLocString:v39 table:v43];
  }
  else
  {
    uint64_t v33 = 0;
  }
  if (v40)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F83AE8]);
    double v13 = [(AXUISettingsInstructionsView *)self settingsLocString:v38 table:v43];
    uint64_t v14 = [v12 initWithTitle:v13 detailText:v33 symbolName:v40];
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F83AE8]);
    double v13 = [(AXUISettingsInstructionsView *)self settingsLocString:v38 table:v43];
    if (v36)
    {
      uint64_t v14 = [v15 initWithTitle:v13 detailText:v33 icon:v36];
    }
    else
    {
      unint64_t v16 = (void *)[v15 initWithTitle:v13];

      if (!v33)
      {
LABEL_43:
        uint64_t v45 = v16;
        goto LABEL_13;
      }
      double v13 = [v16 headerView];
      [v13 setDetailText:v33];
      uint64_t v14 = (uint64_t)v16;
    }
  }
  uint64_t v45 = (void *)v14;

LABEL_13:
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v37;
  uint64_t v17 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
  if (v17)
  {
    uint64_t v47 = *(void *)v70;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v70 != v47) {
          objc_enumerationMutation(obj);
        }
        unint64_t v16 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        v19 = objc_msgSend(v16, "objectForKeyedSubscript:", @"identifier", v33, v34);
        if (![v19 isEqualToString:@"REACHABILITY"]) {
          goto LABEL_24;
        }
        if (MGGetBoolAnswer())
        {
          uint64_t v76 = 0;
          v77 = &v76;
          uint64_t v78 = 0x2020000000;
          int v20 = (unsigned int (*)(void))getSBSIsReachabilityEnabledSymbolLoc_ptr;
          v79 = getSBSIsReachabilityEnabledSymbolLoc_ptr;
          if (!getSBSIsReachabilityEnabledSymbolLoc_ptr)
          {
            v75[0] = MEMORY[0x1E4F143A8];
            v75[1] = 3221225472;
            v75[2] = __getSBSIsReachabilityEnabledSymbolLoc_block_invoke;
            v75[3] = &unk_1E649BF00;
            v75[4] = &v76;
            __getSBSIsReachabilityEnabledSymbolLoc_block_invoke((uint64_t)v75);
            int v20 = (unsigned int (*)(void))v77[3];
          }
          _Block_object_dispose(&v76, 8);
          if (!v20)
          {
            -[AXUISettingsInstructionsView textView:primaryActionForTextItem:defaultAction:]();
            __break(1u);
            goto LABEL_43;
          }
          if (v20())
          {
LABEL_24:
            v21 = [v16 objectForKeyedSubscript:@"alreadyLocalized"];
            int v22 = [v21 BOOLValue];

            v23 = [v16 objectForKeyedSubscript:@"contentLabel"];
            v24 = [v16 objectForKeyedSubscript:@"headerLabel"];
            id v25 = [v16 objectForKeyedSubscript:@"sectionLabel"];
            if (v22)
            {
              id v26 = v23;
              id v27 = v24;
              id v28 = v25;
            }
            else
            {
              uint64_t v63 = MEMORY[0x1E4F143A8];
              uint64_t v64 = 3221225472;
              v65 = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_2;
              v66 = &unk_1E649BE60;
              v67 = self;
              id v68 = v43;
              AXLocStringForDeviceVariant();
              id v26 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v57 = MEMORY[0x1E4F143A8];
              uint64_t v58 = 3221225472;
              uint64_t v59 = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_3;
              unint64_t v60 = &unk_1E649BE60;
              v61 = self;
              id v62 = v68;
              AXLocStringForDeviceVariant();
              id v27 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v51 = MEMORY[0x1E4F143A8];
              uint64_t v52 = 3221225472;
              v53 = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_4;
              v54 = &unk_1E649BE60;
              v55 = self;
              id v56 = v62;
              AXLocStringForDeviceVariant();
              id v28 = (id)objc_claimAutoreleasedReturnValue();
            }
            v29 = v28;
            if ([v28 length]) {
              [v45 addSectionWithHeader:v29 content:&stru_1F1F0EB90];
            }
            if ([v26 length] || objc_msgSend(v27, "length")) {
              [v45 addBulletedListItemWithTitle:v27 description:v26];
            }

            if (v22)
            {
            }
            else
            {
            }
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  [v45 addSectionWithHeader:@" " content:@" "];
  [(AXUISettingsInstructionsView *)self setMoreInfoController:v45];
  id v30 = (void *)MEMORY[0x1E4FB13F0];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_5;
  v48[3] = &unk_1E649BEB0;
  id v49 = v45;
  v50 = self;
  id v31 = v45;
  v10 = [v30 actionWithHandler:v48];

  objc_super v11 = (void *)v33;
LABEL_39:

  return v10;
}

uint64_t __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) settingsLocString:a2 table:*(void *)(a1 + 40)];
}

uint64_t __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) settingsLocString:a2 table:*(void *)(a1 + 40)];
}

uint64_t __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) settingsLocString:a2 table:*(void *)(a1 + 40)];
}

void __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_5(uint64_t a1)
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F83AC0]) initWithRootViewController:*(void *)(a1 + 32)];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:*(void *)(a1 + 40) action:sel_doneButtonTapped_];
  v3 = [*(id *)(a1 + 32) navigationItem];
  [v3 setRightBarButtonItem:v2];

  v4 = [*(id *)(a1 + 40) window];
  id v5 = [v4 rootViewController];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)doneButtonTapped:(id)a3
{
  v4 = [(AXUISettingsInstructionsView *)self moreInfoController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AXUISettingsInstructionsView_doneButtonTapped___block_invoke;
  v5[3] = &unk_1E649BED8;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

uint64_t __49__AXUISettingsInstructionsView_doneButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMoreInfoController:0];
}

- (void)setNeedsLayout
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)AXUISettingsInstructionsView;
  [(AXUISettingsInstructionsView *)&v12 setNeedsLayout];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_marginConstraints;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setConstant:", 15.0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (double)preferredHeightForWidth:(double)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v4 = a3 + -15.0;
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", a3 + -15.0, 3.40282347e38);
  double v6 = v5 + 5.0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = self->_contentLabels;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v11), "sizeThatFits:", v4, 3.40282347e38);
        double v6 = v6 + v12;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v13 = self->_moreLabels;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "sizeThatFits:", v4, 3.40282347e38, (void)v20);
        double v6 = v6 + v18;
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  return v6 + 5.0;
}

- (OBWelcomeController)moreInfoController
{
  return self->_moreInfoController;
}

- (void)setMoreInfoController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreInfoController, 0);
  objc_storeStrong((id *)&self->_marginConstraints, 0);
  objc_storeStrong((id *)&self->_moreLabels, 0);
  objc_storeStrong((id *)&self->_contentLabels, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

- (OS_os_log)textView:primaryActionForTextItem:defaultAction:.cold.1()
{
  return __getBFFStyleClass_block_invoke_cold_1();
}

@end