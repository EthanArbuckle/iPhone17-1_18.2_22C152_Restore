@interface EKReminderTitleDetailCell
- (BOOL)showExtraSpaceAtBottom;
- (EKReminderTitleDetailCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 delegate:(id)a6;
- (id)_buttonConfigForReminder:(id)a3;
- (void)_editButtonTapped;
- (void)setShowExtraSpaceAtBottom:(BOOL)a3;
- (void)setupConstraintsWithExtraSpace:(BOOL)a3;
@end

@implementation EKReminderTitleDetailCell

- (EKReminderTitleDetailCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 delegate:(id)a6
{
  BOOL v7 = a5;
  v152[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id obj = a6;
  v143.receiver = self;
  v143.super_class = (Class)EKReminderTitleDetailCell;
  v131 = v10;
  v132 = v11;
  v12 = [(EKReminderDetailCell *)&v143 initWithEvent:v10 reminder:v11 editable:v7];
  v13 = v12;
  if (v12)
  {
    -[EKReminderTitleDetailCell setSeparatorInset:](v12, "setSeparatorInset:", 0.0, 0.0, 0.0, 1.79769313e308);
    objc_storeWeak((id *)&v13->_delegate, obj);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    title = v13->_title;
    v13->_title = v14;

    [(UILabel *)v13->_title setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v13->_title setNumberOfLines:0];
    id v136 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
    uint64_t v127 = *MEMORY[0x1E4FB06F8];
    objc_msgSend(v136, "setObject:forKeyedSubscript:", v16);

    v17 = [(EKEvent *)v13->super.super._event title];
    [(UILabel *)v13->_title setText:v17];

    if (([(EKEvent *)v13->super.super._event completed] & 1) != 0
      || ([(EKEvent *)v13->super.super._event CUIK_reminderShouldBeEditable] & 1) == 0)
    {
      v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v136 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
    }
    id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
    p_event = (id *)&v13->super.super._event;
    uint64_t v21 = [(EKEvent *)v13->super.super._event title];
    v22 = (void *)v21;
    if (v21) {
      v23 = (__CFString *)v21;
    }
    else {
      v23 = &stru_1F0CC2140;
    }
    v126 = (void *)[v19 initWithString:v23 attributes:v136];

    [(UILabel *)v13->_title setAttributedText:v126];
    v24 = [(EKReminderTitleDetailCell *)v13 contentView];
    [v24 addSubview:v13->_title];

    LODWORD(v25) = 1148846080;
    [(UILabel *)v13->_title setContentCompressionResistancePriority:1 forAxis:v25];
    id v139 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    objc_msgSend(v139, "setTimeStyle:", objc_msgSend(*p_event, "isAllDay") ^ 1);
    [v139 setDateStyle:1];
    [v139 setDoesRelativeDateFormatting:1];
    v26 = [*p_event startDate];
    v125 = [v139 stringFromDate:v26];

    if ([*p_event hasRecurrenceRules])
    {
      v27 = (void *)MEMORY[0x1E4FB0870];
      v28 = [MEMORY[0x1E4FB1818] systemImageNamed:@"repeat"];
      v29 = [v27 textAttachmentWithImage:v28];

      v30 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v29];
      id v31 = objc_alloc(MEMORY[0x1E4F28B18]);
      v32 = EventKitUIBundle();
      v33 = [v32 localizedStringForKey:@"%@, %@ %@", &stru_1F0CC2140, 0 value table];
      v34 = (void *)[v31 initWithString:v33];

      uint64_t v145 = 0;
      v146 = &v145;
      uint64_t v147 = 0x2050000000;
      v35 = (void *)getREMRecurrenceRuleFormatterClass_softClass_0;
      uint64_t v148 = getREMRecurrenceRuleFormatterClass_softClass_0;
      if (!getREMRecurrenceRuleFormatterClass_softClass_0)
      {
        location[0] = (id)MEMORY[0x1E4F143A8];
        location[1] = (id)3221225472;
        location[2] = __getREMRecurrenceRuleFormatterClass_block_invoke_0;
        location[3] = &unk_1E6087D90;
        location[4] = &v145;
        __getREMRecurrenceRuleFormatterClass_block_invoke_0((uint64_t)location);
        v35 = (void *)v146[3];
      }
      id v36 = v35;
      _Block_object_dispose(&v145, 8);
      v37 = [v132 recurrenceRules];
      v38 = [v37 firstObject];
      v39 = [(EKEvent *)v13->super.super._event startDate];
      v40 = [(EKEvent *)v13->super.super._event eventStore];
      v41 = [v40 timeZone];
      v42 = [v36 shortNaturalLanguageDescriptionForRecurrenceRule:v38 date:v39 timeZone:v41 lowercase:0];

      v137 = objc_msgSend(MEMORY[0x1E4F28E48], "localizedAttributedStringWithFormat:", v34, v125, v30, v42);
    }
    else
    {
      v137 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v125];
    }
    id v138 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v43 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [v138 setObject:v43 forKeyedSubscript:v127];

    v44 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v138 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    objc_msgSend(v137, "addAttributes:range:", v138, 0, objc_msgSend(v137, "length"));
    v45 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitle = v13->_subtitle;
    v13->_subtitle = v45;

    [(UILabel *)v13->_subtitle setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v13->_subtitle setNumberOfLines:0];
    [(UILabel *)v13->_subtitle setAttributedText:v137];
    v47 = [(EKReminderTitleDetailCell *)v13 contentView];
    [v47 addSubview:v13->_subtitle];

    LODWORD(v48) = 1148846080;
    [(UILabel *)v13->_subtitle setContentCompressionResistancePriority:1 forAxis:v48];
    v49 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    background = v13->_background;
    v13->_background = v49;

    [(UIView *)v13->_background setTranslatesAutoresizingMaskIntoConstraints:0];
    v51 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [(UIView *)v13->_background setBackgroundColor:v51];

    v52 = [(UIView *)v13->_background layer];
    [v52 setCornerRadius:12.0];

    v53 = [(EKReminderTitleDetailCell *)v13 contentView];
    [v53 addSubview:v13->_background];

    uint64_t v54 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    editButton = v13->_editButton;
    v13->_editButton = (UIButton *)v54;

    LODWORD(v56) = 1148846080;
    [(UIButton *)v13->_editButton setContentCompressionResistancePriority:0 forAxis:v56];
    [(UIButton *)v13->_editButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v124 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v57 = EventKitUIBundle();
    v123 = [v57 localizedStringForKey:@"Edit" value:&stru_1F0CC2140 table:0];

    v58 = v13->_editButton;
    id v59 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v151 = v127;
    v152[0] = v124;
    v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:&v151 count:1];
    v61 = (void *)[v59 initWithString:v123 attributes:v60];
    [(UIButton *)v58 setAttributedTitle:v61 forState:0];

    [(UIButton *)v13->_editButton addTarget:v13 action:sel__editButtonTapped forControlEvents:64];
    v62 = [(EKReminderTitleDetailCell *)v13 contentView];
    [v62 addSubview:v13->_editButton];

    objc_initWeak(location, v13);
    v63 = (void *)MEMORY[0x1E4FB13F0];
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = __70__EKReminderTitleDetailCell_initWithEvent_reminder_editable_delegate___block_invoke;
    v141[3] = &unk_1E6088B78;
    objc_copyWeak(&v142, location);
    v128 = [v63 actionWithHandler:v141];
    v64 = (void *)MEMORY[0x1E4FB14D0];
    v65 = [(EKReminderTitleDetailCell *)v13 _buttonConfigForReminder:v13->super.super._event];
    uint64_t v66 = [v64 buttonWithConfiguration:v65 primaryAction:v128];
    circle = v13->_circle;
    v13->_circle = (UIButton *)v66;

    LODWORD(v68) = 1148846080;
    [(UIButton *)v13->_circle setContentCompressionResistancePriority:0 forAxis:v68];
    LODWORD(v69) = 1144750080;
    [(UIButton *)v13->_circle setContentHuggingPriority:0 forAxis:v69];
    [(UIButton *)v13->_circle setTranslatesAutoresizingMaskIntoConstraints:0];
    v70 = [(EKReminderTitleDetailCell *)v13 contentView];
    [v70 addSubview:v13->_circle];

    v71 = [(EKEventDetailCell *)v13 event];
    -[UIButton setUserInteractionEnabled:](v13->_circle, "setUserInteractionEnabled:", objc_msgSend(v71, "CUIK_reminderShouldBeEditable"));

    v133 = (void *)MEMORY[0x1E4F1CA48];
    v121 = [(UIButton *)v13->_circle leadingAnchor];
    v119 = [(UIView *)v13->_background leadingAnchor];
    v118 = [v121 constraintEqualToAnchor:v119 constant:11.0];
    v150[0] = v118;
    v116 = [(UIButton *)v13->_circle firstBaselineAnchor];
    v117 = [(UILabel *)v13->_title firstBaselineAnchor];
    v115 = [v116 constraintEqualToAnchor:v117];
    v150[1] = v115;
    v114 = [(UILabel *)v13->_title leadingAnchor];
    v113 = [(UIButton *)v13->_circle trailingAnchor];
    v112 = [v114 constraintEqualToAnchor:v113 constant:11.0];
    v150[2] = v112;
    v110 = [(UILabel *)v13->_title topAnchor];
    v111 = [(UIView *)v13->_background topAnchor];
    v109 = [v110 constraintEqualToAnchor:v111 constant:11.0];
    v150[3] = v109;
    v108 = [(UILabel *)v13->_title bottomAnchor];
    v107 = [(UILabel *)v13->_subtitle topAnchor];
    v106 = [v108 constraintEqualToAnchor:v107 constant:-4.0];
    v150[4] = v106;
    v104 = [(UILabel *)v13->_title trailingAnchor];
    v105 = [(UIView *)v13->_background trailingAnchor];
    v103 = [v104 constraintEqualToAnchor:v105 constant:-11.0];
    v150[5] = v103;
    v102 = [(UILabel *)v13->_subtitle leadingAnchor];
    v101 = [(UILabel *)v13->_title leadingAnchor];
    v100 = [v102 constraintEqualToAnchor:v101];
    v150[6] = v100;
    v98 = [(UILabel *)v13->_subtitle bottomAnchor];
    v99 = [(UIView *)v13->_background bottomAnchor];
    v97 = [v98 constraintEqualToAnchor:v99 constant:-11.0];
    v150[7] = v97;
    v96 = [(UILabel *)v13->_subtitle trailingAnchor];
    v129 = [(UILabel *)v13->_title trailingAnchor];
    v95 = [v96 constraintEqualToAnchor:v129];
    v150[8] = v95;
    v93 = [(UIView *)v13->_background leadingAnchor];
    v94 = [(EKReminderTitleDetailCell *)v13 contentView];
    v72 = [v94 layoutMarginsGuide];
    v73 = [v72 leadingAnchor];
    v74 = [v93 constraintEqualToAnchor:v73];
    v150[9] = v74;
    v75 = [(UIView *)v13->_background trailingAnchor];
    v76 = [(EKReminderTitleDetailCell *)v13 contentView];
    v77 = [v76 layoutMarginsGuide];
    v78 = [v77 trailingAnchor];
    v79 = [v75 constraintEqualToAnchor:v78];
    v150[10] = v79;
    v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:11];
    v134 = [v133 arrayWithArray:v80];

    id WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
    LODWORD(v73) = [WeakRetained shouldShowEditButtonInline];

    v82 = v13->_editButton;
    if (v73)
    {
      [(UIButton *)v82 setHidden:0];
      v140 = [(UIView *)v13->_background topAnchor];
      v83 = [(UIButton *)v13->_editButton bottomAnchor];
      v84 = [v140 constraintEqualToAnchor:v83];
      v149[0] = v84;
      v85 = [(UIButton *)v13->_editButton trailingAnchor];
      v130 = [(EKReminderTitleDetailCell *)v13 contentView];
      v122 = [v130 layoutMarginsGuide];
      v120 = [v122 trailingAnchor];
      v86 = [v85 constraintEqualToAnchor:v120];
      v149[1] = v86;
      v87 = [(UIButton *)v13->_editButton topAnchor];
      v88 = [(EKReminderTitleDetailCell *)v13 contentView];
      v89 = [v88 topAnchor];
      v90 = [v87 constraintEqualToAnchor:v89];
      v149[2] = v90;
      v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:3];
      [v134 addObjectsFromArray:v91];
    }
    else
    {
      [(UIButton *)v82 setHidden:1];
      v140 = [(UIView *)v13->_background topAnchor];
      v83 = [(EKReminderTitleDetailCell *)v13 contentView];
      v84 = [v83 topAnchor];
      v85 = [v140 constraintEqualToAnchor:v84];
      [v134 addObject:v85];
    }

    [MEMORY[0x1E4F28DC8] activateConstraints:v134];
    [(EKReminderTitleDetailCell *)v13 setupConstraintsWithExtraSpace:v13->_showExtraSpaceAtBottom];

    objc_destroyWeak(&v142);
    objc_destroyWeak(location);
  }
  return v13;
}

void __70__EKReminderTitleDetailCell_initWithEvent_reminder_editable_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = [WeakRetained event];
    int v3 = objc_msgSend(v2, "CUIK_reminderShouldBeEditable");

    id WeakRetained = v5;
    if (v3)
    {
      id v4 = objc_loadWeakRetained(v5 + 146);
      [v4 reminderToggled];

      id WeakRetained = v5;
    }
  }
}

- (void)setupConstraintsWithExtraSpace:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  if (self->_bottomConstraint)
  {
    v5 = (void *)MEMORY[0x1E4F28DC8];
    v15[0] = self->_bottomConstraint;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v5 deactivateConstraints:v6];
  }
  BOOL v7 = [(UIView *)self->_background bottomAnchor];
  v8 = [(EKReminderTitleDetailCell *)self contentView];
  v9 = [v8 bottomAnchor];
  if (v3) {
    [v7 constraintEqualToAnchor:v9 constant:-15.0];
  }
  else {
  id v10 = [v7 constraintEqualToAnchor:v9];
  }
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v10;

  v12 = (void *)MEMORY[0x1E4F28DC8];
  v14 = self->_bottomConstraint;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v12 activateConstraints:v13];
}

- (void)setShowExtraSpaceAtBottom:(BOOL)a3
{
  if (self->_showExtraSpaceAtBottom != a3)
  {
    self->_showExtraSpaceAtBottom = a3;
    -[EKReminderTitleDetailCell setupConstraintsWithExtraSpace:](self, "setupConstraintsWithExtraSpace:");
  }
}

- (void)_editButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained editButtonPressed];
}

- (id)_buttonConfigForReminder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  [v4 contentInsets];
  objc_msgSend(v4, "setContentInsets:");
  v5 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] weight:*MEMORY[0x1E4FB09E0]];
  v6 = [MEMORY[0x1E4FB1830] configurationWithFont:v5 scale:2];
  BOOL v7 = (void *)MEMORY[0x1E4FB1818];
  if (v3)
  {
    v8 = objc_msgSend(v3, "CUIK_symbolName:", objc_msgSend(v3, "isAllDay"));
    v9 = [v7 systemImageNamed:v8 withConfiguration:v6];
    [v4 setImage:v9];

    if (objc_msgSend(v3, "CUIK_reminderShouldBeEditable")) {
      objc_msgSend(v3, "CUIK_symbolColor");
    }
    else {
    id v10 = objc_msgSend(v3, "CUIK_disabledSymbolColor");
    }
    [v4 setBaseForegroundColor:v10];
  }
  else
  {
    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F57AA0] withConfiguration:v6];
    [v4 setImage:v10];
  }

  return v4;
}

- (BOOL)showExtraSpaceAtBottom
{
  return self->_showExtraSpaceAtBottom;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end