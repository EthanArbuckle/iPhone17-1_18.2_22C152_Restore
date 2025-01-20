@interface PKTextInputDebugRadarEntryCell
- (BOOL)includedEntry;
- (NSLayoutConstraint)_drawingViewAspectRatioConstraint;
- (NSString)intendedText;
- (PKTextInputDebugLogEntry)logEntry;
- (PKTextInputDebugRadarEntryCell)initWithFrame:(CGRect)a3;
- (PKTextInputDebugRadarEntryCellDelegate)delegate;
- (UIButton)_includedButton;
- (UIImageView)_drawingImageView;
- (UILabel)_resultTextLabel;
- (UITextField)_intendedResultField;
- (UIView)_borderView;
- (UIView)_lineSeparator;
- (id)_attributedResultTextWithReferenceString:(id)a3 referenceStringOffset:(int64_t)a4 recognitionResult:(id)a5 affectedRange:(_NSRange)a6 resultType:(int64_t)a7 contentLength:(int64_t)a8;
- (id)_createIncludedButton;
- (id)_createIntendedField;
- (int64_t)contentLevel;
- (int64_t)entryIndex;
- (void)_handleIncludedButton;
- (void)_handleIntendedFieldChanged;
- (void)_setIncludedEntry:(BOOL)a3 notifyDelegate:(BOOL)a4;
- (void)_setIntendedText:(id)a3 notifyDelegate:(BOOL)a4;
- (void)_setupViews;
- (void)_updateBorderView;
- (void)_updateDrawingView;
- (void)_updateIncludedButton;
- (void)_updateIntendedTextField;
- (void)_updateResultTextLabel;
- (void)setDelegate:(id)a3;
- (void)setEntryIndex:(int64_t)a3;
- (void)setIncludedEntry:(BOOL)a3;
- (void)setIntendedText:(id)a3;
- (void)setLogEntry:(id)a3 contentLevel:(int64_t)a4;
- (void)set_drawingViewAspectRatioConstraint:(id)a3;
@end

@implementation PKTextInputDebugRadarEntryCell

- (PKTextInputDebugRadarEntryCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputDebugRadarEntryCell;
  v3 = -[PKTextInputDebugRadarEntryCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKTextInputDebugRadarEntryCell *)v3 _setupViews];
  }
  return v4;
}

- (void)setLogEntry:(id)a3 contentLevel:(int64_t)a4
{
  id v7 = a3;
  if (*(_OWORD *)&self->_logEntry != __PAIR128__(a4, (unint64_t)v7))
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_logEntry, a3);
    self->_contentLevel = a4;
    [(PKTextInputDebugRadarEntryCell *)self _updateDrawingView];
    [(PKTextInputDebugRadarEntryCell *)self _updateResultTextLabel];
    id v7 = v8;
  }
}

- (void)setIntendedText:(id)a3
{
  if (self->_intendedText != a3)
  {
    -[PKTextInputDebugRadarEntryCell _setIntendedText:notifyDelegate:](self, "_setIntendedText:notifyDelegate:");
    [(PKTextInputDebugRadarEntryCell *)self _updateIntendedTextField];
  }
}

- (void)_setIntendedText:(id)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  v16 = self->_intendedText;
  id v7 = (NSString *)[a3 copy];
  intendedText = self->_intendedText;
  self->_intendedText = v7;

  v9 = v16;
  if (v4)
  {
    v10 = self->_intendedText;
    v11 = v16;
    v12 = v10;
    if (v11 == v12)
    {

LABEL_12:
      v9 = v16;
      goto LABEL_13;
    }
    v13 = v12;
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {

LABEL_11:
      v11 = [(PKTextInputDebugRadarEntryCell *)self delegate];
      [(NSString *)v11 entryCellIntendedTextDidChange:self];
      goto LABEL_12;
    }
    BOOL v15 = [(NSString *)v11 isEqualToString:v12];

    v9 = v16;
    if (!v15) {
      goto LABEL_11;
    }
  }
LABEL_13:
}

- (void)setIncludedEntry:(BOOL)a3
{
  if (self->_includedEntry != a3) {
    -[PKTextInputDebugRadarEntryCell _setIncludedEntry:notifyDelegate:](self, "_setIncludedEntry:notifyDelegate:");
  }
}

- (void)_setIncludedEntry:(BOOL)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  self->_includedEntry = a3;
  [(PKTextInputDebugRadarEntryCell *)self _updateIncludedButton];
  [(PKTextInputDebugRadarEntryCell *)self _updateBorderView];
  if (v4)
  {
    id v6 = [(PKTextInputDebugRadarEntryCell *)self delegate];
    [v6 entryCellIncludedEntryDidChange:self];
  }
}

- (void)_setupViews
{
  v113[22] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.7 alpha:1.0];
  BOOL v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  borderView = self->__borderView;
  self->__borderView = v4;

  [(UIView *)self->__borderView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = self->__borderView;
  id v7 = [(UIView *)v6 layer];
  [v7 setBorderWidth:1.0];

  id v112 = v3;
  uint64_t v8 = [v112 CGColor];
  v9 = [(UIView *)v6 layer];
  [v9 setBorderColor:v8];

  v10 = [(UIView *)v6 layer];
  [v10 setCornerRadius:12.0];

  v11 = [(PKTextInputDebugRadarEntryCell *)self _createIncludedButton];
  includedButton = self->__includedButton;
  self->__includedButton = v11;

  v13 = [(PKTextInputDebugRadarEntryCell *)self _createIntendedField];
  intendedResultField = self->__intendedResultField;
  self->__intendedResultField = v13;

  id v15 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v16 = *MEMORY[0x1E4F1DB28];
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v20 = (UIImageView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], v17, v18, v19);
  drawingImageView = self->__drawingImageView;
  self->__drawingImageView = v20;

  [(UIImageView *)self->__drawingImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  lineSeparator = self->__lineSeparator;
  self->__lineSeparator = v22;

  [(UIView *)self->__lineSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->__lineSeparator setBackgroundColor:v112];
  v24 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v16, v17, v18, v19);
  resultTextLabel = self->__resultTextLabel;
  self->__resultTextLabel = v24;

  [(UILabel *)self->__resultTextLabel setLineBreakMode:0];
  [(UILabel *)self->__resultTextLabel setNumberOfLines:0];
  [(UILabel *)self->__resultTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v26) = 1148846080;
  [(UILabel *)self->__resultTextLabel setContentCompressionResistancePriority:1 forAxis:v26];
  LODWORD(v27) = 1148846080;
  [(UILabel *)self->__resultTextLabel setContentHuggingPriority:1 forAxis:v27];
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v16, v17, v18, v19);
  v29 = _PencilKitBundle();
  v30 = [v29 localizedStringForKey:@"Expected:" value:@"Expected:" table:@"Localizable"];
  [v28 setText:v30];

  v31 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
  [v28 setFont:v31];

  v32 = [MEMORY[0x1E4FB1618] labelColor];
  [v28 setTextColor:v32];

  [v28 setAdjustsFontSizeToFitWidth:1];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v33) = 1148846080;
  [v28 setContentHuggingPriority:0 forAxis:v33];
  LODWORD(v34) = 1148846080;
  [v28 setContentHuggingPriority:1 forAxis:v34];
  v35 = [(PKTextInputDebugRadarEntryCell *)self contentView];
  [v35 addSubview:v6];

  [(UIView *)v6 addSubview:self->__drawingImageView];
  [(UIView *)v6 addSubview:self->__lineSeparator];
  [(UIView *)v6 addSubview:self->__resultTextLabel];
  [(UIView *)v6 addSubview:v28];
  [(UIView *)v6 addSubview:self->__intendedResultField];
  v36 = [(PKTextInputDebugRadarEntryCell *)self contentView];
  [v36 addSubview:self->__includedButton];

  [(PKTextInputDebugRadarEntryCell *)self _updateIncludedButton];
  [(PKTextInputDebugRadarEntryCell *)self _updateBorderView];
  [(PKTextInputDebugRadarEntryCell *)self _updateIntendedTextField];
  v83 = (void *)MEMORY[0x1E4F28DC8];
  v110 = [(UIView *)v6 topAnchor];
  v111 = [(PKTextInputDebugRadarEntryCell *)self contentView];
  v109 = [v111 topAnchor];
  v108 = [v110 constraintEqualToAnchor:v109 constant:0.0];
  v113[0] = v108;
  v106 = [(UIView *)v6 bottomAnchor];
  v107 = [(PKTextInputDebugRadarEntryCell *)self contentView];
  v105 = [v107 bottomAnchor];
  v104 = [v106 constraintEqualToAnchor:v105 constant:-20.0];
  v113[1] = v104;
  v102 = [(UIView *)v6 leadingAnchor];
  v103 = [(PKTextInputDebugRadarEntryCell *)self contentView];
  v101 = [v103 leadingAnchor];
  v100 = [v102 constraintEqualToAnchor:v101];
  v113[2] = v100;
  v98 = [(UIView *)v6 trailingAnchor];
  v99 = [(PKTextInputDebugRadarEntryCell *)self contentView];
  v97 = [v99 trailingAnchor];
  v96 = [v98 constraintEqualToAnchor:v97];
  v113[3] = v96;
  v95 = [(UIImageView *)self->__drawingImageView topAnchor];
  v94 = [(UIView *)v6 topAnchor];
  v93 = [v95 constraintEqualToAnchor:v94 constant:10.0];
  v113[4] = v93;
  v92 = [(UIImageView *)self->__drawingImageView centerXAnchor];
  v91 = [(UIView *)v6 centerXAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v113[5] = v90;
  v89 = [(UIImageView *)self->__drawingImageView widthAnchor];
  v88 = [(UIView *)v6 widthAnchor];
  v87 = [v89 constraintLessThanOrEqualToAnchor:v88 multiplier:1.0 constant:-20.0];
  v113[6] = v87;
  v86 = [(UIView *)self->__lineSeparator topAnchor];
  v85 = [(UIImageView *)self->__drawingImageView bottomAnchor];
  v84 = [v86 constraintEqualToAnchor:v85 constant:15.0];
  v113[7] = v84;
  v82 = [(UIView *)self->__lineSeparator heightAnchor];
  v81 = [v82 constraintEqualToConstant:1.0];
  v113[8] = v81;
  v80 = [(UIView *)self->__lineSeparator leadingAnchor];
  v79 = [(UIView *)v6 leadingAnchor];
  v78 = [v80 constraintEqualToAnchor:v79 constant:10.0];
  v113[9] = v78;
  v77 = [(UIView *)self->__lineSeparator trailingAnchor];
  v76 = [(UIView *)v6 trailingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:-10.0];
  v113[10] = v75;
  v74 = [(UILabel *)self->__resultTextLabel topAnchor];
  v73 = [(UIView *)self->__lineSeparator bottomAnchor];
  v72 = [v74 constraintEqualToAnchor:v73 constant:15.0];
  v113[11] = v72;
  v70 = [(UILabel *)self->__resultTextLabel centerXAnchor];
  v69 = [(UIView *)v6 centerXAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v113[12] = v68;
  v66 = [(UILabel *)self->__resultTextLabel widthAnchor];
  v65 = [(UIView *)v6 widthAnchor];
  v64 = [v66 constraintEqualToAnchor:v65 multiplier:1.0 constant:-20.0];
  v113[13] = v64;
  v37 = v28;
  v63 = [v28 centerYAnchor];
  v62 = [(UITextField *)self->__intendedResultField centerYAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v113[14] = v61;
  v60 = [v28 leadingAnchor];
  v59 = [(UIButton *)self->__includedButton trailingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59 constant:30.0];
  v113[15] = v58;
  v71 = v28;
  v57 = [v28 trailingAnchor];
  v56 = [(UITextField *)self->__intendedResultField leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56 constant:-5.0];
  v113[16] = v55;
  v54 = [(UITextField *)self->__intendedResultField topAnchor];
  v53 = [(UILabel *)self->__resultTextLabel bottomAnchor];
  v52 = [v54 constraintEqualToAnchor:v53 constant:20.0];
  v113[17] = v52;
  v51 = [(UITextField *)self->__intendedResultField bottomAnchor];
  v38 = v6;
  v50 = [(UIView *)v6 bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:-10.0];
  v113[18] = v49;
  v39 = [(UITextField *)self->__intendedResultField trailingAnchor];
  v67 = v6;
  v40 = [(UIView *)v6 trailingAnchor];
  v41 = [v39 constraintEqualToAnchor:v40 constant:-10.0];
  v113[19] = v41;
  v42 = [(UIButton *)self->__includedButton centerYAnchor];
  v43 = [v37 centerYAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v113[20] = v44;
  v45 = [(UIButton *)self->__includedButton leadingAnchor];
  v46 = [(UIView *)v38 leadingAnchor];
  v47 = [v45 constraintEqualToAnchor:v46 constant:10.0];
  v113[21] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:22];
  [v83 activateConstraints:v48];
}

- (id)_createIncludedButton
{
  v3 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  v5 = [v3 titleLabel];
  [v5 setFont:v4];

  id v6 = [v3 layer];
  [v6 setBorderWidth:1.0];

  id v7 = [v3 layer];
  [v7 setCornerRadius:12.0];

  objc_msgSend(v3, "setContentEdgeInsets:", 4.5, 10.0, 4.5, 9.0);
  objc_msgSend(v3, "setImageEdgeInsets:", 0.0, -5.0, 0.0, 0.0);
  objc_msgSend(v3, "setTitleEdgeInsets:", 0.0, 1.0, 0.0, -1.0);
  uint64_t v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v8];

  LODWORD(v9) = 1148846080;
  [v3 setContentHuggingPriority:0 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v10];
  v11 = _PencilKitBundle();
  v12 = [v11 localizedStringForKey:@"Excluded" value:@"Excluded" table:@"Localizable"];
  [v3 setTitle:v12 forState:0];

  v13 = _PencilKitBundle();
  BOOL v14 = [v13 localizedStringForKey:@"Included" value:@"Included" table:@"Localizable"];
  [v3 setTitle:v14 forState:4];

  id v15 = (void *)MEMORY[0x1E4FB1830];
  double v16 = [v3 titleLabel];
  double v17 = [v16 font];
  double v18 = [v15 configurationWithFont:v17];

  double v19 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark" withConfiguration:v18];
  v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v18];
  [v3 setImage:v19 forState:0];
  [v3 setImage:v20 forState:4];
  v21 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v3 setTitleColor:v21 forState:0];

  v22 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v3 setTitleColor:v22 forState:4];

  [v3 addTarget:self action:sel__handleIncludedButton forControlEvents:64];

  return v3;
}

- (id)_createIntendedField
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D70]);
  BOOL v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
  [v4 setFont:v5];

  [v4 setBorderStyle:3];
  [v4 setAutocapitalizationType:0];
  [v4 setAutocorrectionType:0];
  [v4 setSmartQuotesType:1];
  [v4 setSmartDashesType:1];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addTarget:self action:sel__handleIntendedFieldChanged forControlEvents:0x20000];

  return v4;
}

- (void)_updateResultTextLabel
{
  id v19 = [(PKTextInputDebugRadarEntryCell *)self logEntry];
  id v3 = objc_msgSend(v19, "referenceSubstringWithTargetContentLevel:", -[PKTextInputDebugRadarEntryCell contentLevel](self, "contentLevel"));
  BOOL v4 = [v19 inputTargetContentInfo];
  uint64_t v5 = [v4 referenceSubstringRange];

  id v6 = [v19 inputTargetContentInfo];
  uint64_t v7 = [v6 textContentLength];

  uint64_t v8 = [v19 resultAffectedRange];
  uint64_t v10 = v9;
  uint64_t v11 = [v19 resultCommittedText];
  v12 = (void *)v11;
  v13 = &stru_1F1FB2C00;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  BOOL v14 = v13;

  id v15 = -[PKTextInputDebugRadarEntryCell _attributedResultTextWithReferenceString:referenceStringOffset:recognitionResult:affectedRange:resultType:contentLength:](self, "_attributedResultTextWithReferenceString:referenceStringOffset:recognitionResult:affectedRange:resultType:contentLength:", v3, v5, v14, v8, v10, [v19 resultType], v7);

  BOOL v16 = (unint64_t)[v15 length] < 0x14;
  double v17 = [(PKTextInputDebugRadarEntryCell *)self _resultTextLabel];
  [v17 setTextAlignment:v16];

  double v18 = [(PKTextInputDebugRadarEntryCell *)self _resultTextLabel];
  [v18 setAttributedText:v15];
}

- (void)_updateDrawingView
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKTextInputDebugRadarEntryCell *)self logEntry];
  BOOL v4 = [v3 inputDrawing];

  if (v4)
  {
    uint64_t v5 = +[PKMetalUtility defaultDevice];
    if (v5)
    {
      +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v5);
      id v6 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = -[PKMetalResourceHandler strokeRenderCache](v6);
      -[PKLRUCache removeAllObjects]((uint64_t)v7);
    }
    uint64_t v8 = v4;
    uint64_t v9 = [(PKTextInputDebugRadarEntryCell *)self logEntry];
    uint64_t v10 = [v9 tokenizedTextResult];

    if (v10)
    {
      v40 = v5;
      v41 = v4;
      uint64_t v11 = [(PKTextInputDebugRadarEntryCell *)self logEntry];
      uint64_t v12 = [v11 resultCommittedTokenColumnCount];

      v13 = [(PKTextInputDebugRadarEntryCell *)self logEntry];
      BOOL v14 = [v13 tokenizedTextResult];
      id v15 = objc_msgSend(v14, "strokeIndexesForColumnsInRange:", 0, v12);

      BOOL v16 = (void *)MEMORY[0x1E4F1CA48];
      double v17 = [(PKDrawing *)v8 strokes];
      double v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v19 = [(PKDrawing *)v8 strokes];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = 0;
        uint64_t v23 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v43 != v23) {
              objc_enumerationMutation(v19);
            }
            uint64_t v25 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            if ([v15 containsIndex:v22 + i]) {
              [v18 addObject:v25];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
          v22 += i;
        }
        while (v21);
      }

      double v26 = [[PKDrawing alloc] initWithStrokes:v18];
      uint64_t v8 = v26;
      uint64_t v5 = v40;
      BOOL v4 = v41;
    }
    [(PKDrawing *)v8 bounds];
    double v27 = -[PKDrawing imageFromRect:scale:](v8, "imageFromRect:scale:");
    [(PKDrawing *)v8 bounds];
    double v29 = v28;
    double v31 = v30;
  }
  else
  {
    double v27 = 0;
    double v29 = *MEMORY[0x1E4F1DB30];
    double v31 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v32 = [(PKTextInputDebugRadarEntryCell *)self _drawingImageView];
  [v32 setImage:v27];
  double v33 = [(PKTextInputDebugRadarEntryCell *)self _drawingViewAspectRatioConstraint];

  if (v33)
  {
    double v34 = [(PKTextInputDebugRadarEntryCell *)self _drawingViewAspectRatioConstraint];
    [v32 removeConstraint:v34];
  }
  if (v29 <= 0.0) {
    double v35 = 0.0;
  }
  else {
    double v35 = v31 / v29;
  }
  v36 = [v32 heightAnchor];
  v37 = [v32 widthAnchor];
  v38 = [v36 constraintEqualToAnchor:v37 multiplier:v35];
  [(PKTextInputDebugRadarEntryCell *)self set_drawingViewAspectRatioConstraint:v38];

  v39 = [(PKTextInputDebugRadarEntryCell *)self _drawingViewAspectRatioConstraint];
  [v39 setActive:1];
}

- (void)_updateBorderView
{
  BOOL v3 = [(PKTextInputDebugRadarEntryCell *)self includedEntry];
  BOOL v4 = [(PKTextInputDebugRadarEntryCell *)self _borderView];
  uint64_t v5 = v4;
  if (v3)
  {
    [v4 setAlpha:1.0];

    [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  else
  {
    [v4 setAlpha:0.3];

    [MEMORY[0x1E4FB1618] systemGray4Color];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(PKTextInputDebugRadarEntryCell *)self _borderView];
  [v6 setBackgroundColor:v7];
}

- (void)_updateIncludedButton
{
  id v8 = [(PKTextInputDebugRadarEntryCell *)self _includedButton];
  if ([(PKTextInputDebugRadarEntryCell *)self includedEntry])
  {
    BOOL v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v8 setTintColor:v3];

    [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [v8 setTintColor:v4];

    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 CGColor];
  id v7 = [v8 layer];
  [v7 setBorderColor:v6];

  objc_msgSend(v8, "setSelected:", -[PKTextInputDebugRadarEntryCell includedEntry](self, "includedEntry"));
}

- (void)_updateIntendedTextField
{
  id v4 = [(PKTextInputDebugRadarEntryCell *)self intendedText];
  BOOL v3 = [(PKTextInputDebugRadarEntryCell *)self _intendedResultField];
  [v3 setText:v4];
}

- (void)_handleIntendedFieldChanged
{
  id v4 = [(PKTextInputDebugRadarEntryCell *)self _intendedResultField];
  BOOL v3 = [v4 text];
  [(PKTextInputDebugRadarEntryCell *)self _setIntendedText:v3 notifyDelegate:1];
}

- (void)_handleIncludedButton
{
  uint64_t v3 = [(PKTextInputDebugRadarEntryCell *)self includedEntry] ^ 1;

  [(PKTextInputDebugRadarEntryCell *)self _setIncludedEntry:v3 notifyDelegate:1];
}

- (id)_attributedResultTextWithReferenceString:(id)a3 referenceStringOffset:(int64_t)a4 recognitionResult:(id)a5 affectedRange:(_NSRange)a6 resultType:(int64_t)a7 contentLength:(int64_t)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v50 = self;
  v78[2] = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v9 = a5;
  uint64_t v10 = [v54 length];
  v62 = v9;
  uint64_t v11 = [v9 length] + v10;
  if ((unint64_t)v11 >= 0x12C) {
    uint64_t v11 = 300;
  }
  double v12 = ceil(cos((double)v11 * 0.01) * 10.0 + 24.0);
  uint64_t v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v12 weight:*MEMORY[0x1E4FB09D8]];
  uint64_t v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v12 weight:*MEMORY[0x1E4FB09D0]];
  uint64_t v76 = *MEMORY[0x1E4FB0700];
  uint64_t v15 = v76;
  BOOL v16 = [MEMORY[0x1E4FB1618] darkGrayColor];
  uint64_t v77 = *MEMORY[0x1E4FB06F8];
  uint64_t v17 = v77;
  v78[0] = v16;
  v52 = (void *)v13;
  v78[1] = v13;
  v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v76 count:2];

  v74[0] = v15;
  double v18 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  v74[1] = v17;
  v75[0] = v18;
  v75[1] = v14;
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];

  uint64_t v70 = v15;
  id v19 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  v73[0] = v19;
  uint64_t v71 = *MEMORY[0x1E4FB06C0];
  uint64_t v20 = v71;
  uint64_t v21 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  uint64_t v22 = [v21 colorWithAlphaComponent:0.5];
  uint64_t v72 = v17;
  v73[1] = v22;
  v73[2] = v14;
  v51 = (void *)v14;
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v70 count:3];

  uint64_t v23 = *MEMORY[0x1E4FB0768];
  v69[0] = &unk_1F200E460;
  v67[0] = v23;
  v67[1] = v15;
  v24 = [MEMORY[0x1E4FB1618] systemGray4Color];
  uint64_t v68 = *MEMORY[0x1E4FB06C8];
  uint64_t v25 = v68;
  v69[1] = v24;
  v69[2] = &unk_1F200E478;
  v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v67 count:3];

  uint64_t v65 = v20;
  double v26 = [MEMORY[0x1E4FB1618] systemBlueColor];
  double v27 = [v26 colorWithAlphaComponent:0.4];
  v66 = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];

  v64[0] = &unk_1F200E460;
  v63[0] = v23;
  v63[1] = v15;
  double v29 = [MEMORY[0x1E4FB1618] systemRedColor];
  v63[2] = v25;
  v64[1] = v29;
  v64[2] = &unk_1F200E478;
  v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];

  double v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E48]), "initWithString:attributes:", v54);
  BOOL v31 = location != 0x7FFFFFFFFFFFFFFFLL;
  BOOL v32 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  if (v32 && v31) {
    NSUInteger v33 = length;
  }
  else {
    NSUInteger v33 = 0;
  }
  if (v32 && v31) {
    uint64_t v34 = location - a4;
  }
  else {
    uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v34 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v35 = [(PKTextInputDebugRadarEntryCell *)v50 logEntry];
    uint64_t v36 = [v35 resultType];

    switch(v36)
    {
      case 1:
        if (length) {
          objc_msgSend(v30, "addAttributes:range:", v58, v34, v33);
        }
        id v39 = objc_alloc(MEMORY[0x1E4F28B18]);
        v40 = v62;
        v41 = v60;
        goto LABEL_21;
      case 2:
      case 3:
      case 4:
      case 5:
        v37 = v30;
        v38 = (void *)v28;
        goto LABEL_12;
      case 6:
        v37 = v30;
        v38 = v61;
LABEL_12:
        objc_msgSend(v37, "addAttributes:range:", v38, v34, v33, v50);
        break;
      case 7:
        if (length) {
          objc_msgSend(v30, "addAttributes:range:", v61, v34, v33);
        }
        if (objc_msgSend(v62, "length", v50))
        {
          id v39 = objc_alloc(MEMORY[0x1E4F28B18]);
          v40 = v62;
          v41 = v59;
LABEL_21:
          long long v42 = objc_msgSend(v39, "initWithString:attributes:", v40, v41, v50);
          [v30 insertAttributedString:v42 atIndex:v34 + v33];
        }
        break;
      default:
        break;
    }
  }
  long long v43 = (void *)v28;
  uint64_t v44 = objc_msgSend(v54, "length", v50);
  if ((unint64_t)(a4 - 1) <= 0x7FFFFFFFFFFFFFFDLL && v44)
  {
    long long v45 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"…" attributes:v53];
    [v30 insertAttributedString:v45 atIndex:0];

    uint64_t v47 = v51;
    v46 = v52;
  }
  else
  {
    uint64_t v47 = v51;
    v46 = v52;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_28;
    }
  }
  if ([v54 length] + a4 < (unint64_t)a8)
  {
    v48 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"…" attributes:v53];
    [v30 appendAttributedString:v48];
  }
LABEL_28:

  return v30;
}

- (PKTextInputDebugRadarEntryCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputDebugRadarEntryCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKTextInputDebugLogEntry)logEntry
{
  return self->_logEntry;
}

- (int64_t)contentLevel
{
  return self->_contentLevel;
}

- (BOOL)includedEntry
{
  return self->_includedEntry;
}

- (int64_t)entryIndex
{
  return self->_entryIndex;
}

- (void)setEntryIndex:(int64_t)a3
{
  self->_entryIndex = a3;
}

- (NSString)intendedText
{
  return self->_intendedText;
}

- (UIView)_borderView
{
  return self->__borderView;
}

- (UIButton)_includedButton
{
  return self->__includedButton;
}

- (UIImageView)_drawingImageView
{
  return self->__drawingImageView;
}

- (UILabel)_resultTextLabel
{
  return self->__resultTextLabel;
}

- (UITextField)_intendedResultField
{
  return self->__intendedResultField;
}

- (UIView)_lineSeparator
{
  return self->__lineSeparator;
}

- (NSLayoutConstraint)_drawingViewAspectRatioConstraint
{
  return self->__drawingViewAspectRatioConstraint;
}

- (void)set_drawingViewAspectRatioConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__drawingViewAspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->__lineSeparator, 0);
  objc_storeStrong((id *)&self->__intendedResultField, 0);
  objc_storeStrong((id *)&self->__resultTextLabel, 0);
  objc_storeStrong((id *)&self->__drawingImageView, 0);
  objc_storeStrong((id *)&self->__includedButton, 0);
  objc_storeStrong((id *)&self->__borderView, 0);
  objc_storeStrong((id *)&self->_intendedText, 0);
  objc_storeStrong((id *)&self->_logEntry, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end