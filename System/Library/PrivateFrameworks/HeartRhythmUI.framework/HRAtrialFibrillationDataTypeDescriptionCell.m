@interface HRAtrialFibrillationDataTypeDescriptionCell
- (BOOL)featureAvailable;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HKAttributionTextView)settingsLinkTextView;
- (HRAtrialFibrillationDataTypeDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)availableVerticalConstraints;
- (NSArray)unavailableVerticalConstraints;
- (UITextView)descriptionTextView;
- (UITextView)settingsDescriptionTextView;
- (void)_setupDescriptionTextView;
- (void)_updateTextForDescriptionTextView;
- (void)setAvailableVerticalConstraints:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setFeatureAvailable:(BOOL)a3;
- (void)setSettingsDescriptionTextView:(id)a3;
- (void)setSettingsLinkTextView:(id)a3;
- (void)setUnavailableVerticalConstraints:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HRAtrialFibrillationDataTypeDescriptionCell

- (HRAtrialFibrillationDataTypeDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HRAtrialFibrillationDataTypeDescriptionCell;
  v4 = [(HRAtrialFibrillationDataTypeDescriptionCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(HRAtrialFibrillationDataTypeDescriptionCell *)v4 _setupDescriptionTextView];
  }
  return v5;
}

- (void)_setupDescriptionTextView
{
  v86[2] = *MEMORY[0x263EF8340];
  v3 = (UITextView *)objc_alloc_init(MEMORY[0x263F1CAC8]);
  descriptionTextView = self->_descriptionTextView;
  self->_descriptionTextView = v3;

  v5 = [MEMORY[0x263F1C550] clearColor];
  [(UITextView *)self->_descriptionTextView setBackgroundColor:v5];

  [(UITextView *)self->_descriptionTextView setEditable:0];
  [(UITextView *)self->_descriptionTextView setSelectable:1];
  [(UITextView *)self->_descriptionTextView _setInteractiveTextSelectionDisabled:1];
  v6 = [(UITextView *)self->_descriptionTextView textContainer];
  [v6 setLineFragmentPadding:0.0];

  [(UITextView *)self->_descriptionTextView setScrollEnabled:0];
  [(UITextView *)self->_descriptionTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v7 = HRHeartRhythmUIFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"ATRIAL_FIBRILLATION_DATA_TYPE_DESCRIPTION_AHA" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  [(UITextView *)self->_descriptionTextView setText:v8];

  uint64_t v9 = *MEMORY[0x263F1D260];
  v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [(UITextView *)self->_descriptionTextView setFont:v10];

  [(UITextView *)self->_descriptionTextView setDelegate:self];
  v11 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  [v11 addSubview:self->_descriptionTextView];

  v12 = (UITextView *)objc_alloc_init(MEMORY[0x263F1CAC8]);
  settingsDescriptionTextView = self->_settingsDescriptionTextView;
  self->_settingsDescriptionTextView = v12;

  [(UITextView *)self->_settingsDescriptionTextView setEditable:0];
  [(UITextView *)self->_settingsDescriptionTextView setSelectable:1];
  [(UITextView *)self->_settingsDescriptionTextView _setInteractiveTextSelectionDisabled:1];
  v14 = [(UITextView *)self->_settingsDescriptionTextView textContainer];
  [v14 setLineFragmentPadding:0.0];

  [(UITextView *)self->_settingsDescriptionTextView setScrollEnabled:0];
  [(UITextView *)self->_settingsDescriptionTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = HRHeartRhythmUIFrameworkBundle();
  v16 = [v15 localizedStringForKey:@"ATRIAL_FIBRILLATION_DATA_TYPE_DESCRIPTION_WATCH" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  [(UITextView *)self->_settingsDescriptionTextView setText:v16];

  v17 = [MEMORY[0x263F1C550] clearColor];
  [(UITextView *)self->_settingsDescriptionTextView setBackgroundColor:v17];

  v18 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v9];
  [(UITextView *)self->_settingsDescriptionTextView setFont:v18];

  [(UITextView *)self->_settingsDescriptionTextView setHidden:1];
  [(UITextView *)self->_settingsDescriptionTextView setDelegate:self];
  v19 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  [v19 addSubview:self->_settingsDescriptionTextView];

  id v20 = objc_alloc(MEMORY[0x263F086A0]);
  v21 = HRHeartRhythmUIFrameworkBundle();
  v22 = [v21 localizedStringForKey:@"ATRIAL_FIBRILLATION_WATCH_SETTINGS_LINK" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v85[0] = *MEMORY[0x263F1C240];
  v23 = HKHealthKeyColor();
  v85[1] = *MEMORY[0x263F1C258];
  v86[0] = v23;
  v86[1] = @"bridge:root=NOTIFICATIONS_ID&path=com.apple.HeartRateSettings";
  v24 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];
  v80 = (void *)[v20 initWithString:v22 attributes:v24];

  v25 = (HKAttributionTextView *)[objc_alloc(MEMORY[0x263F463D0]) initWithAttributedText:v80 selectable:1];
  settingsLinkTextView = self->_settingsLinkTextView;
  self->_settingsLinkTextView = v25;

  [(HKAttributionTextView *)self->_settingsLinkTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKAttributionTextView *)self->_settingsLinkTextView setHidden:1];
  [(HKAttributionTextView *)self->_settingsLinkTextView setDelegate:self];
  [(HKAttributionTextView *)self->_settingsLinkTextView _setInteractiveTextSelectionDisabled:1];
  v27 = [NSString healthAccessibilityIdentifier:2 suffix:@"AboutIRNDescription.WatchSettingsLink"];
  [(HKAttributionTextView *)self->_settingsLinkTextView setAccessibilityIdentifier:v27];

  v28 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  [v28 addSubview:self->_settingsLinkTextView];

  v75 = [(UITextView *)self->_descriptionTextView topAnchor];
  v77 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v73 = [v77 topAnchor];
  v71 = [v75 constraintEqualToAnchor:v73];
  v84[0] = v71;
  v69 = [(UITextView *)self->_settingsDescriptionTextView topAnchor];
  v29 = [(UITextView *)self->_descriptionTextView lastBaselineAnchor];
  v30 = [v69 constraintEqualToAnchor:v29 constant:8.0];
  v84[1] = v30;
  v31 = [(HKAttributionTextView *)self->_settingsLinkTextView topAnchor];
  v32 = [(UITextView *)self->_settingsDescriptionTextView lastBaselineAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:8.0];
  v84[2] = v33;
  v34 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v35 = [v34 bottomAnchor];
  v36 = [(HKAttributionTextView *)self->_settingsLinkTextView bottomAnchor];
  v37 = [v35 constraintEqualToSystemSpacingBelowAnchor:v36 multiplier:1.0];
  v84[3] = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:4];
  availableVerticalConstraints = self->_availableVerticalConstraints;
  self->_availableVerticalConstraints = v38;

  v40 = [(UITextView *)self->_descriptionTextView topAnchor];
  v41 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v42 = [v41 topAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  v83[0] = v43;
  v44 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v45 = [v44 bottomAnchor];
  v46 = [(UITextView *)self->_descriptionTextView bottomAnchor];
  v47 = [v45 constraintEqualToAnchor:v46 constant:8.0];
  v83[1] = v47;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:2];
  unavailableVerticalConstraints = self->_unavailableVerticalConstraints;
  self->_unavailableVerticalConstraints = v48;

  [MEMORY[0x263F08938] activateConstraints:self->_unavailableVerticalConstraints];
  v65 = (void *)MEMORY[0x263F08938];
  v76 = [(UITextView *)self->_descriptionTextView leadingAnchor];
  v78 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v74 = [v78 leadingAnchor];
  v72 = [v76 constraintEqualToAnchor:v74 constant:16.0];
  v82[0] = v72;
  v70 = [(UITextView *)self->_descriptionTextView trailingAnchor];
  v81 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v68 = [v81 trailingAnchor];
  v67 = [v70 constraintEqualToAnchor:v68 constant:-16.0];
  v82[1] = v67;
  v64 = [(UITextView *)self->_settingsDescriptionTextView leadingAnchor];
  v66 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v63 = [v66 leadingAnchor];
  v62 = [v64 constraintEqualToAnchor:v63 constant:16.0];
  v82[2] = v62;
  v61 = [(UITextView *)self->_settingsDescriptionTextView trailingAnchor];
  v79 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v60 = [v79 trailingAnchor];
  v50 = [v61 constraintEqualToAnchor:v60 constant:-16.0];
  v82[3] = v50;
  v51 = [(HKAttributionTextView *)self->_settingsLinkTextView leadingAnchor];
  v52 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v53 = [v52 leadingAnchor];
  v54 = [v51 constraintEqualToAnchor:v53 constant:16.0];
  v82[4] = v54;
  v55 = [(HKAttributionTextView *)self->_settingsLinkTextView trailingAnchor];
  v56 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self contentView];
  v57 = [v56 trailingAnchor];
  v58 = [v55 constraintEqualToAnchor:v57 constant:-16.0];
  v82[5] = v58;
  v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:6];
  [v65 activateConstraints:v59];
}

- (void)setFeatureAvailable:(BOOL)a3
{
  if (self->_featureAvailable != a3)
  {
    self->_featureAvailable = a3;
    [(HRAtrialFibrillationDataTypeDescriptionCell *)self _updateTextForDescriptionTextView];
  }
}

- (void)_updateTextForDescriptionTextView
{
  BOOL v3 = [(HRAtrialFibrillationDataTypeDescriptionCell *)self featureAvailable];
  BOOL v4 = !v3;
  if (v3) {
    v5 = &OBJC_IVAR___HRAtrialFibrillationDataTypeDescriptionCell__unavailableVerticalConstraints;
  }
  else {
    v5 = &OBJC_IVAR___HRAtrialFibrillationDataTypeDescriptionCell__availableVerticalConstraints;
  }
  if (v3) {
    v6 = &OBJC_IVAR___HRAtrialFibrillationDataTypeDescriptionCell__availableVerticalConstraints;
  }
  else {
    v6 = &OBJC_IVAR___HRAtrialFibrillationDataTypeDescriptionCell__unavailableVerticalConstraints;
  }
  [(UITextView *)self->_settingsDescriptionTextView setHidden:v4];
  [(HKAttributionTextView *)self->_settingsLinkTextView setHidden:v4];
  [MEMORY[0x263F08938] deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v5)];
  objc_super v7 = (void *)MEMORY[0x263F08938];
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v6);
  [v7 activateConstraints:v8];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HRAtrialFibrillationDataTypeDescriptionCell;
  [(HRAtrialFibrillationDataTypeDescriptionCell *)&v4 traitCollectionDidChange:a3];
  [(HRAtrialFibrillationDataTypeDescriptionCell *)self _updateTextForDescriptionTextView];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v6 = a4;
  objc_super v7 = [v6 scheme];
  int v8 = [v7 isEqualToString:@"bridge"];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F01880] defaultWorkspace];
    [v9 openSensitiveURL:v6 withOptions:0];
  }
  return 0;
}

- (BOOL)featureAvailable
{
  return self->_featureAvailable;
}

- (UITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
}

- (UITextView)settingsDescriptionTextView
{
  return self->_settingsDescriptionTextView;
}

- (void)setSettingsDescriptionTextView:(id)a3
{
}

- (HKAttributionTextView)settingsLinkTextView
{
  return self->_settingsLinkTextView;
}

- (void)setSettingsLinkTextView:(id)a3
{
}

- (NSArray)availableVerticalConstraints
{
  return self->_availableVerticalConstraints;
}

- (void)setAvailableVerticalConstraints:(id)a3
{
}

- (NSArray)unavailableVerticalConstraints
{
  return self->_unavailableVerticalConstraints;
}

- (void)setUnavailableVerticalConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_availableVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_settingsLinkTextView, 0);
  objc_storeStrong((id *)&self->_settingsDescriptionTextView, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
}

@end