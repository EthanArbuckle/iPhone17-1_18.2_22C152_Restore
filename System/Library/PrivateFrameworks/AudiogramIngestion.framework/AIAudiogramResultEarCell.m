@interface AIAudiogramResultEarCell
- (AIAudiogramResultEarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (AIAudiogramResultEarCellDelegate)delegate;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (NSNumber)frequency;
- (NSNumber)hearingLevel;
- (UILabel)titleLabel;
- (UILabel)valueUnitLabel;
- (UIStackView)labelStackView;
- (UIStackView)verticalStackView;
- (UITextField)valueTextField;
- (id)accessibilityLabel;
- (int64_t)ear;
- (void)_textFieldEditingChanged:(id)a3;
- (void)configureLayout;
- (void)setDelegate:(id)a3;
- (void)setEar:(int64_t)a3;
- (void)setFrequency:(id)a3;
- (void)setHearingLevel:(id)a3;
- (void)setKeyboardToolbar:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setValueTextField:(id)a3;
- (void)setValueUnitLabel:(id)a3;
- (void)setVerticalStackView:(id)a3;
- (void)showActive:(BOOL)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation AIAudiogramResultEarCell

- (AIAudiogramResultEarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v86[3] = *MEMORY[0x263EF8340];
  v83.receiver = self;
  v83.super_class = (Class)AIAudiogramResultEarCell;
  v4 = [(AIAudiogramResultEarCell *)&v83 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    BOOL v6 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AIAudiogramResultEarCell semanticContentAttribute](v4, "semanticContentAttribute")) != 1;
    v7 = objc_opt_new();
    [(AIAudiogramResultEarCell *)v5 setTitleLabel:v7];

    v8 = [MEMORY[0x263F825C8] labelColor];
    v9 = [(AIAudiogramResultEarCell *)v5 titleLabel];
    [v9 setTextColor:v8];

    uint64_t v10 = *MEMORY[0x263F83570];
    v11 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v12 = [(AIAudiogramResultEarCell *)v5 titleLabel];
    [v12 setFont:v11];

    v13 = [(AIAudiogramResultEarCell *)v5 titleLabel];
    LODWORD(v14) = 1144750080;
    [v13 setContentHuggingPriority:0 forAxis:v14];

    v15 = objc_opt_new();
    [(AIAudiogramResultEarCell *)v5 setValueUnitLabel:v15];

    uint64_t v16 = 2 * v6;
    v17 = [(AIAudiogramResultEarCell *)v5 valueUnitLabel];
    [v17 setTextAlignment:v16];

    v18 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v19 = [(AIAudiogramResultEarCell *)v5 valueUnitLabel];
    [v19 setTextColor:v18];

    v20 = aiLocString(@"AudiogramIngestionDecibelAbbreviation");
    v21 = [(AIAudiogramResultEarCell *)v5 valueUnitLabel];
    [v21 setText:v20];

    v22 = [MEMORY[0x263F82760] preferredFontForTextStyle:v10];
    v23 = [(AIAudiogramResultEarCell *)v5 valueUnitLabel];
    [v23 setFont:v22];

    v24 = [(AIAudiogramResultEarCell *)v5 valueUnitLabel];
    LODWORD(v25) = 1144750080;
    [v24 setContentHuggingPriority:0 forAxis:v25];

    v26 = objc_opt_new();
    [(AIAudiogramResultEarCell *)v5 setValueTextField:v26];

    v27 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    [v27 setTextAlignment:v16];

    v28 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v29 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    [v29 setTextColor:v28];

    v30 = [MEMORY[0x263F82760] preferredFontForTextStyle:v10];
    v31 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    [v31 setFont:v30];

    v32 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    [v32 setKeyboardType:4];

    v33 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    [v33 setReturnKeyType:9];

    v34 = aiLocString(@"AudiogramIngestionResultsNoData");
    v35 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    [v35 setPlaceholder:v34];

    v36 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    LODWORD(v37) = 1132068864;
    [v36 setContentCompressionResistancePriority:0 forAxis:v37];

    v38 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    [v38 addTarget:v5 action:sel__textFieldEditingChanged_ forControlEvents:0x20000];

    v39 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    [v39 setDelegate:v5];

    id v40 = objc_alloc(MEMORY[0x263F82BF8]);
    v41 = [(AIAudiogramResultEarCell *)v5 titleLabel];
    v86[0] = v41;
    v42 = [(AIAudiogramResultEarCell *)v5 valueTextField];
    v86[1] = v42;
    v43 = [(AIAudiogramResultEarCell *)v5 valueUnitLabel];
    v86[2] = v43;
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:3];
    v45 = (void *)[v40 initWithArrangedSubviews:v44];
    [(AIAudiogramResultEarCell *)v5 setLabelStackView:v45];

    v46 = [(AIAudiogramResultEarCell *)v5 labelStackView];
    [v46 setAxis:0];

    v47 = [(AIAudiogramResultEarCell *)v5 labelStackView];
    [v47 setDistribution:0];

    v48 = [(AIAudiogramResultEarCell *)v5 labelStackView];
    [v48 setAlignment:0];

    v49 = [(AIAudiogramResultEarCell *)v5 labelStackView];
    [v49 setSpacing:8.0];

    id v50 = objc_alloc(MEMORY[0x263F82BF8]);
    v51 = [(AIAudiogramResultEarCell *)v5 labelStackView];
    v85 = v51;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
    v53 = (void *)[v50 initWithArrangedSubviews:v52];
    [(AIAudiogramResultEarCell *)v5 setVerticalStackView:v53];

    v54 = [(AIAudiogramResultEarCell *)v5 verticalStackView];
    [v54 setAxis:1];

    v55 = [(AIAudiogramResultEarCell *)v5 verticalStackView];
    [v55 setDistribution:0];

    v56 = [(AIAudiogramResultEarCell *)v5 verticalStackView];
    [v56 setAlignment:0];

    v57 = [(AIAudiogramResultEarCell *)v5 verticalStackView];
    [v57 setTranslatesAutoresizingMaskIntoConstraints:0];

    v58 = [(AIAudiogramResultEarCell *)v5 contentView];
    v59 = [(AIAudiogramResultEarCell *)v5 verticalStackView];
    [v58 addSubview:v59];

    v74 = (void *)MEMORY[0x263F08938];
    v82 = [(AIAudiogramResultEarCell *)v5 verticalStackView];
    v80 = [v82 leadingAnchor];
    v81 = [(AIAudiogramResultEarCell *)v5 contentView];
    v79 = [v81 leadingAnchor];
    v78 = [v80 constraintEqualToAnchor:v79 constant:16.0];
    v84[0] = v78;
    v77 = [(AIAudiogramResultEarCell *)v5 verticalStackView];
    v75 = [v77 trailingAnchor];
    v76 = [(AIAudiogramResultEarCell *)v5 contentView];
    v73 = [v76 trailingAnchor];
    v72 = [v75 constraintEqualToAnchor:v73 constant:-16.0];
    v84[1] = v72;
    v71 = [(AIAudiogramResultEarCell *)v5 verticalStackView];
    v70 = [v71 topAnchor];
    v60 = [(AIAudiogramResultEarCell *)v5 contentView];
    v61 = [v60 topAnchor];
    v62 = [v70 constraintEqualToAnchor:v61 constant:16.0];
    v84[2] = v62;
    v63 = [(AIAudiogramResultEarCell *)v5 verticalStackView];
    v64 = [v63 bottomAnchor];
    v65 = [(AIAudiogramResultEarCell *)v5 contentView];
    v66 = [v65 bottomAnchor];
    v67 = [v64 constraintEqualToAnchor:v66 constant:-16.0];
    v84[3] = v67;
    v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:4];
    [v74 activateConstraints:v68];

    [(AIAudiogramResultEarCell *)v5 setHearingLevel:0];
  }
  return v5;
}

- (void)configureLayout
{
  v32[1] = *MEMORY[0x263EF8340];
  v3 = [(AIAudiogramResultEarCell *)self titleLabel];
  v4 = [v3 text];
  [(AIAudiogramResultEarCell *)self frame];
  double v6 = v5;
  double v8 = v7;
  uint64_t v31 = *MEMORY[0x263F82270];
  uint64_t v9 = v31;
  uint64_t v10 = [(AIAudiogramResultEarCell *)self titleLabel];
  v11 = [v10 font];
  v32[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v12, 0, v6, v8);
  float Width = CGRectGetWidth(v33);

  double v14 = [(AIAudiogramResultEarCell *)self valueUnitLabel];
  v15 = [v14 text];
  [(AIAudiogramResultEarCell *)self frame];
  double v17 = v16;
  double v19 = v18;
  uint64_t v29 = v9;
  v20 = [(AIAudiogramResultEarCell *)self valueUnitLabel];
  v21 = [v20 font];
  v30 = v21;
  v22 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 32, v22, 0, v17, v19);
  *(float *)&double v17 = CGRectGetWidth(v34);

  v23 = [(AIAudiogramResultEarCell *)self titleLabel];
  [v23 removeFromSuperview];

  [(AIAudiogramResultEarCell *)self frame];
  if (CGRectGetWidth(v35) * 0.6 >= (float)(Width + *(float *)&v17))
  {
    uint64_t v25 = 2
        * (objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AIAudiogramResultEarCell semanticContentAttribute](self, "semanticContentAttribute")) != 1);
    v26 = [(AIAudiogramResultEarCell *)self valueTextField];
    [v26 setTextAlignment:v25];

    [(AIAudiogramResultEarCell *)self labelStackView];
  }
  else
  {
    v24 = [(AIAudiogramResultEarCell *)self valueTextField];
    [v24 setTextAlignment:4];

    [(AIAudiogramResultEarCell *)self verticalStackView];
  v27 = };
  v28 = [(AIAudiogramResultEarCell *)self titleLabel];
  [v27 insertArrangedSubview:v28 atIndex:0];
}

- (void)setFrequency:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_frequency, a3);
  id v16 = v5;
  if ((int)[v16 intValue] < 1000)
  {
    uint64_t v9 = @"AudiogramIngestionHertzAbbreviation";
    uint64_t v10 = v16;
  }
  else
  {
    HIDWORD(v6) = 652835029 * [v16 intValue] + 17179864;
    LODWORD(v6) = HIDWORD(v6);
    if ((v6 >> 3) <= 0x418936)
    {
      objc_msgSend(NSNumber, "numberWithInt:", ((int)objc_msgSend(v16, "intValue") / 1000));
    }
    else
    {
      double v7 = NSString;
      [v16 doubleValue];
      objc_msgSend(v7, "stringWithFormat:", @"%.1f", v8 / 1000.0);
    uint64_t v10 = };

    uint64_t v9 = @"AudiogramIngestionKiloHertzAbbreviation";
  }
  v11 = aiLocString(v9);
  v12 = NSString;
  v13 = aiLocString(@"AudiogramIngestionResultsFrequency");
  double v14 = objc_msgSend(v12, "stringWithFormat:", v13, v10, v11);
  v15 = [(AIAudiogramResultEarCell *)self titleLabel];
  [v15 setText:v14];
}

- (void)setHearingLevel:(id)a3
{
  validateHearingLevel(a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hearingLevel = self->_hearingLevel;
  self->_hearingLevel = v4;

  id v7 = [(NSNumber *)self->_hearingLevel stringValue];
  unint64_t v6 = [(AIAudiogramResultEarCell *)self valueTextField];
  [v6 setText:v7];
}

- (void)showActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = AXLogAudiogram();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = [(AIAudiogramResultEarCell *)self frequency];
    *(_DWORD *)buf = 67109634;
    BOOL v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_23F0D7000, v5, OS_LOG_TYPE_INFO, "Ear cell will activate? %d (%@) %@", buf, 0x1Cu);
  }
  AXPerformBlockOnMainThread();
}

void __39__AIAudiogramResultEarCell_showActive___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = AXLogAudiogram();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    BOOL v3 = [*(id *)(a1 + 32) valueTextField];
    int v4 = [v3 isFirstResponder];
    int v5 = *(unsigned __int8 *)(a1 + 40);
    unint64_t v6 = [*(id *)(a1 + 32) valueTextField];
    int v7 = [v6 canBecomeFirstResponder];
    BOOL v8 = [*(id *)(a1 + 32) valueTextField];
    int v9 = [v8 canResignFirstResponder];
    uint64_t v10 = [*(id *)(a1 + 32) frequency];
    uint64_t v11 = *(void *)(a1 + 32);
    v17[0] = 67110402;
    v17[1] = v4;
    __int16 v18 = 1024;
    int v19 = v5;
    __int16 v20 = 1024;
    int v21 = v7;
    __int16 v22 = 1024;
    int v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    _os_log_impl(&dword_23F0D7000, v2, OS_LOG_TYPE_INFO, "Ear cell is activating %d->%d %d? %d? %@ %@", (uint8_t *)v17, 0x2Eu);
  }
  if (*(unsigned char *)(a1 + 40))
  {
    v12 = [*(id *)(a1 + 32) valueTextField];
    char v13 = [v12 isFirstResponder];

    if ((v13 & 1) == 0)
    {
      id v16 = [*(id *)(a1 + 32) valueTextField];
      [v16 becomeFirstResponder];
      goto LABEL_9;
    }
    if (*(unsigned char *)(a1 + 40)) {
      return;
    }
  }
  double v14 = [*(id *)(a1 + 32) valueTextField];
  int v15 = [v14 isFirstResponder];

  if (!v15) {
    return;
  }
  id v16 = [*(id *)(a1 + 32) valueTextField];
  [v16 resignFirstResponder];
LABEL_9:
}

- (void)setKeyboardToolbar:(id)a3
{
  id v4 = a3;
  id v5 = [(AIAudiogramResultEarCell *)self valueTextField];
  [v5 setInputAccessoryView:v4];
}

- (void)_textFieldEditingChanged:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  unint64_t v6 = [v4 text];

  int v7 = [v5 numberFromString:v6];
  hearingLevel = self->_hearingLevel;
  self->_hearingLevel = v7;

  id v11 = [(AIAudiogramResultEarCell *)self delegate];
  int v9 = [(AIAudiogramResultEarCell *)self hearingLevel];
  uint64_t v10 = [(AIAudiogramResultEarCell *)self frequency];
  objc_msgSend(v11, "earCellDidUpdateHearingLevel:forFrequency:forEar:", v9, v10, -[AIAudiogramResultEarCell ear](self, "ear"));
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v7 = a3;
  id v4 = v7;
  AXPerformBlockOnMainThreadAfterDelay();
  id v5 = [(AIAudiogramResultEarCell *)self delegate];
  unint64_t v6 = [(AIAudiogramResultEarCell *)self frequency];
  objc_msgSend(v5, "earCellDidBeginEditingForFrequency:forEar:", v6, -[AIAudiogramResultEarCell ear](self, "ear"));
}

void __53__AIAudiogramResultEarCell_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) endOfDocument];
  v2 = [*(id *)(a1 + 32) textRangeFromPosition:v3 toPosition:v3];
  [*(id *)(a1 + 32) setSelectedTextRange:v2];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v5 = [(AIAudiogramResultEarCell *)self delegate];
  id v4 = [(AIAudiogramResultEarCell *)self frequency];
  objc_msgSend(v5, "earCellDidEndEditingForFrequency:forEar:", v4, -[AIAudiogramResultEarCell ear](self, "ear"));
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  uint64_t v10 = [a3 text];
  id v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  v12 = objc_opt_new();
  char v13 = [v12 numberFromString:v11];

  double v14 = validateHearingLevel(v13);
  int v15 = [v14 stringValue];
  char v16 = [v11 isEqualToString:v15];
  if ((v16 & 1) == 0)
  {
    [(AIAudiogramResultEarCell *)self setHearingLevel:v14];
    double v17 = [(AIAudiogramResultEarCell *)self delegate];
    __int16 v18 = [(AIAudiogramResultEarCell *)self hearingLevel];
    int v19 = [(AIAudiogramResultEarCell *)self frequency];
    objc_msgSend(v17, "earCellDidUpdateHearingLevel:forFrequency:forEar:", v18, v19, -[AIAudiogramResultEarCell ear](self, "ear"));
  }
  return v16;
}

- (id)accessibilityLabel
{
  id v3 = [(AIAudiogramResultEarCell *)self titleLabel];
  id v4 = [v3 text];

  id v5 = [(AIAudiogramResultEarCell *)self hearingLevel];

  if (v5)
  {
    unint64_t v6 = NSString;
    id v7 = [(AIAudiogramResultEarCell *)self valueTextField];
    BOOL v8 = [v7 text];
    id v9 = [(AIAudiogramResultEarCell *)self valueUnitLabel];
    uint64_t v10 = [v9 text];
    id v11 = [v6 stringWithFormat:@" %@ %@", v8, v10];
    uint64_t v12 = [v4 stringByAppendingString:v11];

    id v4 = (void *)v12;
  }
  return v4;
}

- (AIAudiogramResultEarCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AIAudiogramResultEarCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)ear
{
  return self->_ear;
}

- (void)setEar:(int64_t)a3
{
  self->_ear = a3;
}

- (NSNumber)frequency
{
  return self->_frequency;
}

- (NSNumber)hearingLevel
{
  return self->_hearingLevel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)valueUnitLabel
{
  return self->_valueUnitLabel;
}

- (void)setValueUnitLabel:(id)a3
{
}

- (UITextField)valueTextField
{
  return self->_valueTextField;
}

- (void)setValueTextField:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_valueTextField, 0);
  objc_storeStrong((id *)&self->_valueUnitLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_hearingLevel, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end