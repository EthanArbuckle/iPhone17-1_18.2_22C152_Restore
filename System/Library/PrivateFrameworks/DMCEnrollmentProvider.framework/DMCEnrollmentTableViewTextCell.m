@interface DMCEnrollmentTableViewTextCell
- (BOOL)bold;
- (BOOL)isMultipleLines:(id)a3;
- (BOOL)linkTextOnNextLine;
- (BOOL)shouldCalculateLinkTextLineBreak;
- (DMCEnrollmentTableViewTextCell)initWithText:(id)a3 bold:(BOOL)a4;
- (DMCEnrollmentTableViewTextCell)initWithText:(id)a3 bold:(BOOL)a4 subText:(id)a5 layoutStyle:(unint64_t)a6;
- (NSString)linkText;
- (NSString)text;
- (UIButton)button;
- (UILabel)label;
- (UILabel)subLabel;
- (UITextView)hiddenTextView;
- (double)_horizontalMargin;
- (double)_verticalMargin;
- (double)cellHeight;
- (double)estimatedCellHeight;
- (double)previousWidth;
- (id)_rectsOfLinkText;
- (id)_subTextFont;
- (id)_textFontIsBold:(BOOL)a3;
- (id)linkAction;
- (int64_t)textAlignment;
- (unint64_t)layoutStyle;
- (void)_updateTextFont;
- (void)configureLinkText:(id)a3 forceLineBreak:(BOOL)a4 linkAction:(id)a5;
- (void)layoutSubviews;
- (void)setBold:(BOOL)a3;
- (void)setButton:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHiddenTextView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLayoutStyle:(unint64_t)a3;
- (void)setLinkAction:(id)a3;
- (void)setLinkText:(id)a3;
- (void)setLinkTextOnNextLine:(BOOL)a3;
- (void)setPreviousWidth:(double)a3;
- (void)setShouldCalculateLinkTextLineBreak:(BOOL)a3;
- (void)setSubLabel:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation DMCEnrollmentTableViewTextCell

- (DMCEnrollmentTableViewTextCell)initWithText:(id)a3 bold:(BOOL)a4
{
  return [(DMCEnrollmentTableViewTextCell *)self initWithText:a3 bold:a4 subText:0 layoutStyle:0];
}

- (DMCEnrollmentTableViewTextCell)initWithText:(id)a3 bold:(BOOL)a4 subText:(id)a5 layoutStyle:(unint64_t)a6
{
  BOOL v8 = a4;
  v63[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v54 = a5;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v58.receiver = self;
  v58.super_class = (Class)DMCEnrollmentTableViewTextCell;
  v13 = [(DMCEnrollmentTableViewTextCell *)&v58 initWithStyle:0 reuseIdentifier:v12];

  if (v13)
  {
    [(DMCEnrollmentTableViewTextCell *)v13 setSelectionStyle:0];
    [(DMCEnrollmentTableViewTextCell *)v13 setUserInteractionEnabled:0];
    v14 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(DMCEnrollmentTableViewTextCell *)v13 setBackgroundColor:v14];

    v13->_shouldCalculateLinkTextLineBreak = 1;
    v13->_layoutStyle = a6;
    v13->_textAlignment = 1;
    v13->_bold = v8;
    uint64_t v15 = [MEMORY[0x263F1C488] buttonWithType:1];
    button = v13->_button;
    v13->_button = (UIButton *)v15;

    [(UIButton *)v13->_button setHidden:1];
    v17 = [(DMCEnrollmentTableViewTextCell *)v13 contentView];
    [v17 addSubview:v13->_button];

    v18 = objc_opt_new();
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v18 setNumberOfLines:0];
    v19 = [(DMCEnrollmentTableViewTextCell *)v13 _textFontIsBold:v8];
    [v18 setFont:v19];

    v20 = [MEMORY[0x263F1C550] labelColor];
    [v18 setTextColor:v20];

    [v18 setTextAlignment:v13->_textAlignment];
    [v18 setText:v10];
    v21 = [(DMCEnrollmentTableViewTextCell *)v13 contentView];
    [v21 addSubview:v18];

    [(DMCEnrollmentTableViewTextCell *)v13 _horizontalMargin];
    uint64_t v23 = v22;
    [(DMCEnrollmentTableViewTextCell *)v13 _verticalMargin];
    uint64_t v25 = v24;
    if (v54)
    {
      v26 = (UILabel *)objc_opt_new();
      [(UILabel *)v26 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)v26 setNumberOfLines:1];
      v27 = [(DMCEnrollmentTableViewTextCell *)v13 _subTextFont];
      [(UILabel *)v26 setFont:v27];

      v28 = [MEMORY[0x263F1C550] secondaryLabelColor];
      [(UILabel *)v26 setTextColor:v28];

      [(UILabel *)v26 setTextAlignment:v13->_textAlignment];
      [(UILabel *)v26 setText:v54];
      [(UILabel *)v26 sizeToFit];
      v29 = [(DMCEnrollmentTableViewTextCell *)v13 contentView];
      [v29 addSubview:v26];

      v60[0] = @"label";
      v60[1] = @"subLabel";
      v61[0] = v18;
      v61[1] = v26;
      v30 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
      v31 = (void *)MEMORY[0x263F08938];
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"|-%f-[label]-%f-|", v23, v23);
      v33 = [v31 constraintsWithVisualFormat:v32 options:0 metrics:0 views:v30];

      v34 = (void *)MEMORY[0x263F08938];
      v35 = [NSString stringWithFormat:@"|-[subLabel]-|"];
      v36 = [v34 constraintsWithVisualFormat:v35 options:0 metrics:0 views:v30];

      v37 = (void *)MEMORY[0x263F08938];
      v38 = objc_msgSend(NSString, "stringWithFormat:", @"V:|-%f-[label]-0-[subLabel]-%f-|", v25, v25);
      v39 = [v37 constraintsWithVisualFormat:v38 options:0 metrics:0 views:v30];

      v40 = [(DMCEnrollmentTableViewTextCell *)v13 contentView];
      [v40 addConstraints:v33];

      v41 = [(DMCEnrollmentTableViewTextCell *)v13 contentView];
      [v41 addConstraints:v36];

      v42 = [(DMCEnrollmentTableViewTextCell *)v13 contentView];
      [v42 addConstraints:v39];

      subLabel = v13->_subLabel;
      v13->_subLabel = v26;
    }
    else
    {
      v62 = @"label";
      v63[0] = v18;
      v30 = [NSDictionary dictionaryWithObjects:v63 forKeys:&v62 count:1];
      v44 = (void *)MEMORY[0x263F08938];
      v45 = objc_msgSend(NSString, "stringWithFormat:", @"|-%f-[label]-%f-|", v23, v23);
      v33 = [v44 constraintsWithVisualFormat:v45 options:0 metrics:0 views:v30];

      v46 = (void *)MEMORY[0x263F08938];
      v47 = objc_msgSend(NSString, "stringWithFormat:", @"V:|-%f-[label]-%f-|", v25, v25);
      v36 = [v46 constraintsWithVisualFormat:v47 options:0 metrics:0 views:v30];

      v48 = [(DMCEnrollmentTableViewTextCell *)v13 contentView];
      [v48 addConstraints:v33];

      v39 = [(DMCEnrollmentTableViewTextCell *)v13 contentView];
      [v39 addConstraints:v36];
    }

    uint64_t v49 = [v10 copy];
    text = v13->_text;
    v13->_text = (NSString *)v49;

    objc_storeStrong((id *)&v13->_label, v18);
    objc_initWeak(&location, v13);
    uint64_t v59 = objc_opt_class();
    v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __72__DMCEnrollmentTableViewTextCell_initWithText_bold_subText_layoutStyle___block_invoke;
    v55[3] = &unk_2645E8EB0;
    objc_copyWeak(&v56, &location);
    id v52 = (id)[(DMCEnrollmentTableViewTextCell *)v13 registerForTraitChanges:v51 withHandler:v55];

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }
  return v13;
}

void __72__DMCEnrollmentTableViewTextCell_initWithText_bold_subText_layoutStyle___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_msgSend(WeakRetained, "_textFontIsBold:", objc_msgSend(WeakRetained, "bold"));
    v2 = [WeakRetained label];
    [v2 setFont:v1];

    v3 = [WeakRetained _subTextFont];
    v4 = [WeakRetained subLabel];
    [v4 setFont:v3];

    if (WeakRetained[133])
    {
      v5 = [WeakRetained label];
      v6 = [v5 font];
      v7 = [WeakRetained hiddenTextView];
      [v7 setFont:v6];
    }
    [WeakRetained _updateTextFont];
  }
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)DMCEnrollmentTableViewTextCell;
  [(DMCEnrollmentTableViewTextCell *)&v31 layoutSubviews];
  [(DMCEnrollmentTableViewTextCell *)self bounds];
  -[DMCEnrollmentTableViewTextCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v32), 0.0, 0.0);
  v3 = [(DMCEnrollmentTableViewTextCell *)self linkText];

  if (v3)
  {
    [(DMCEnrollmentTableViewTextCell *)self setUserInteractionEnabled:1];
    if (self->_hiddenTextView)
    {
      v4 = [(DMCEnrollmentTableViewTextCell *)self label];
      [v4 frame];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;

      v11 = [(DMCEnrollmentTableViewTextCell *)self contentView];
      [v11 bounds];
      CGFloat v12 = CGRectGetHeight(v33) - v8;

      v13 = [(DMCEnrollmentTableViewTextCell *)self hiddenTextView];
      objc_msgSend(v13, "setFrame:", v6 + -5.0, v8, v10 + 10.0, v12);
    }
    double previousWidth = self->_previousWidth;
    [(DMCEnrollmentTableViewTextCell *)self bounds];
    if (previousWidth != CGRectGetWidth(v34))
    {
      [(DMCEnrollmentTableViewTextCell *)self bounds];
      self->_double previousWidth = CGRectGetWidth(v35);
      if ([(DMCEnrollmentTableViewTextCell *)self shouldCalculateLinkTextLineBreak]) {
        [(DMCEnrollmentTableViewTextCell *)self setLinkTextOnNextLine:0];
      }
    }
    uint64_t v15 = [(DMCEnrollmentTableViewTextCell *)self _rectsOfLinkText];
    if ([(DMCEnrollmentTableViewTextCell *)self shouldCalculateLinkTextLineBreak]) {
      [(DMCEnrollmentTableViewTextCell *)self setLinkTextOnNextLine:[(DMCEnrollmentTableViewTextCell *)self isMultipleLines:v15] | [(DMCEnrollmentTableViewTextCell *)self linkTextOnNextLine]];
    }
    v16 = [v15 firstObject];
    [v16 rect];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    [(DMCEnrollmentTableViewTextCell *)self _horizontalMargin];
    double v26 = v25 + v18 + -15.0;
    [(DMCEnrollmentTableViewTextCell *)self _verticalMargin];
    double v28 = v20 + -10.0 + v27;
    v29 = [(DMCEnrollmentTableViewTextCell *)self button];
    objc_msgSend(v29, "setFrame:", v26, v28, v22 + 20.0, v24 + 20.0);

    v30 = [(DMCEnrollmentTableViewTextCell *)self button];
    [v30 setHidden:0];
  }
  else
  {
    uint64_t v15 = [(DMCEnrollmentTableViewTextCell *)self button];
    [v15 setHidden:1];
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:");
  }
}

- (void)configureLinkText:(id)a3 forceLineBreak:(BOOL)a4 linkAction:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v8 = a5;
  if (v6)
  {
    [(DMCEnrollmentTableViewTextCell *)self setShouldCalculateLinkTextLineBreak:0];
    [(DMCEnrollmentTableViewTextCell *)self setLinkTextOnNextLine:1];
  }
  [(DMCEnrollmentTableViewTextCell *)self setLinkText:v9];
  [(DMCEnrollmentTableViewTextCell *)self setLinkAction:v8];
}

- (void)setLinkText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_linkText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_linkText, a3);
    [(DMCEnrollmentTableViewTextCell *)self _updateTextFont];
  }
}

- (void)setLinkAction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223C90320]();
  id linkAction = self->_linkAction;
  self->_id linkAction = v5;

  if (v4)
  {
    double v7 = [(DMCEnrollmentTableViewTextCell *)self button];
    id v8 = (void *)MEMORY[0x263F1C3C0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__DMCEnrollmentTableViewTextCell_setLinkAction___block_invoke;
    v10[3] = &unk_2645E9640;
    id v11 = v4;
    id v9 = [v8 actionWithHandler:v10];
    [v7 addAction:v9 forControlEvents:64];
  }
}

uint64_t __48__DMCEnrollmentTableViewTextCell_setLinkAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setText:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    id v4 = (NSString *)[v8 copy];
    text = self->_text;
    self->_text = v4;

    BOOL v6 = self->_text;
    double v7 = [(DMCEnrollmentTableViewTextCell *)self label];
    [v7 setText:v6];

    [(DMCEnrollmentTableViewTextCell *)self setNeedsDisplay];
  }
}

- (void)setLinkTextOnNextLine:(BOOL)a3
{
  if (self->_linkTextOnNextLine != a3)
  {
    self->_linkTextOnNextLine = a3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__DMCEnrollmentTableViewTextCell_setLinkTextOnNextLine___block_invoke;
    block[3] = &unk_2645E90A0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __56__DMCEnrollmentTableViewTextCell_setLinkTextOnNextLine___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTextFont];
}

- (void)setEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__DMCEnrollmentTableViewTextCell_setEnabled___block_invoke;
  v3[3] = &unk_2645E9668;
  v3[4] = self;
  BOOL v4 = a3;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v3];
}

void __45__DMCEnrollmentTableViewTextCell_setEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) button];
  [v3 setEnabled:v2];

  id v4 = [*(id *)(a1 + 32) button];
  [v4 layoutIfNeeded];
}

- (double)cellHeight
{
  return *MEMORY[0x263F1D600];
}

- (double)estimatedCellHeight
{
  return 100.0;
}

- (id)_rectsOfLinkText
{
  v3 = [(DMCEnrollmentTableViewTextCell *)self hiddenTextView];
  id v4 = [v3 endOfDocument];
  id v5 = [v3 positionFromPosition:v4 offset:0];

  BOOL v6 = [v3 endOfDocument];
  double v7 = [(DMCEnrollmentTableViewTextCell *)self linkText];
  id v8 = objc_msgSend(v3, "positionFromPosition:offset:", v6, -objc_msgSend(v7, "length"));

  id v9 = [v3 textRangeFromPosition:v8 toPosition:v5];
  double v10 = [v3 selectionRectsForRange:v9];

  return v10;
}

- (UITextView)hiddenTextView
{
  hiddenTextView = self->_hiddenTextView;
  if (!hiddenTextView)
  {
    id v4 = (UITextView *)objc_opt_new();
    [(UITextView *)v4 setEditable:0];
    [(UITextView *)v4 setScrollEnabled:0];
    id v5 = [MEMORY[0x263F1C550] clearColor];
    [(UITextView *)v4 setBackgroundColor:v5];

    BOOL v6 = [MEMORY[0x263F1C550] clearColor];
    [(UITextView *)v4 setTextColor:v6];

    [(UITextView *)v4 setTextAlignment:self->_textAlignment];
    double v7 = [(DMCEnrollmentTableViewTextCell *)self label];
    id v8 = [v7 font];
    [(UITextView *)v4 setFont:v8];

    -[UITextView setTextContainerInset:](v4, "setTextContainerInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    id v9 = [(DMCEnrollmentTableViewTextCell *)self label];
    [v9 frame];
    -[UITextView setFrame:](v4, "setFrame:");

    [(UITextView *)v4 setAutoresizingMask:18];
    double v10 = [(DMCEnrollmentTableViewTextCell *)self contentView];
    [v10 addSubview:v4];

    id v11 = [(DMCEnrollmentTableViewTextCell *)self contentView];
    [v11 sendSubviewToBack:v4];

    CGFloat v12 = self->_hiddenTextView;
    self->_hiddenTextView = v4;

    hiddenTextView = self->_hiddenTextView;
  }
  return hiddenTextView;
}

- (void)_updateTextFont
{
  v53[2] = *MEMORY[0x263EF8340];
  v43 = [(DMCEnrollmentTableViewTextCell *)self text];
  v39 = objc_opt_new();
  uint64_t v51 = *MEMORY[0x263F814F0];
  uint64_t v3 = v51;
  id v4 = [(DMCEnrollmentTableViewTextCell *)self _textFontIsBold:[(DMCEnrollmentTableViewTextCell *)self bold]];
  v53[0] = v4;
  uint64_t v52 = *MEMORY[0x263F81500];
  uint64_t v5 = v52;
  BOOL v6 = [MEMORY[0x263F1C550] labelColor];
  v53[1] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v51 count:2];

  id v8 = objc_opt_new();
  [v8 setLineBreakMode:4];
  v48[0] = v3;
  id v9 = [(DMCEnrollmentTableViewTextCell *)self _textFontIsBold:[(DMCEnrollmentTableViewTextCell *)self bold]];
  v50[0] = v9;
  v48[1] = v5;
  double v10 = [MEMORY[0x263F1C550] systemBlueColor];
  uint64_t v49 = *MEMORY[0x263F81540];
  uint64_t v11 = v49;
  v50[1] = v10;
  v50[2] = v8;
  uint64_t v42 = [NSDictionary dictionaryWithObjects:v50 forKeys:v48 count:3];

  CGFloat v12 = (void *)v7;
  v46[0] = v3;
  v13 = [(DMCEnrollmentTableViewTextCell *)self _textFontIsBold:[(DMCEnrollmentTableViewTextCell *)self bold]];
  v47[0] = v13;
  v46[1] = v5;
  v14 = [MEMORY[0x263F1C550] placeholderTextColor];
  v46[2] = v11;
  v47[1] = v14;
  v47[2] = v8;
  v40 = v8;
  uint64_t v41 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];

  v44[0] = v3;
  uint64_t v15 = [(DMCEnrollmentTableViewTextCell *)self _textFontIsBold:[(DMCEnrollmentTableViewTextCell *)self bold]];
  v44[1] = v5;
  v45[0] = v15;
  v16 = v39;
  double v17 = [MEMORY[0x263F1C550] clearColor];
  v45[1] = v17;
  double v18 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];

  if (v43)
  {
    double v19 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v43 attributes:v12];
    [v39 appendAttributedString:v19];
  }
  double v20 = [(DMCEnrollmentTableViewTextCell *)self linkText];

  if (v20)
  {
    double v21 = NSString;
    if ([(DMCEnrollmentTableViewTextCell *)self linkTextOnNextLine]) {
      double v22 = @"\n%@";
    }
    else {
      double v22 = @" %@";
    }
    double v23 = [(DMCEnrollmentTableViewTextCell *)self linkText];
    v38 = objc_msgSend(v21, "stringWithFormat:", v22, v23);

    double v24 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v38 attributes:v18];
    [v39 appendAttributedString:v24];

    id v25 = objc_alloc(MEMORY[0x263F086A0]);
    double v26 = [(DMCEnrollmentTableViewTextCell *)self linkText];
    double v27 = (void *)v42;
    double v28 = (void *)[v25 initWithString:v26 attributes:v42];

    id v29 = objc_alloc(MEMORY[0x263F086A0]);
    v30 = [(DMCEnrollmentTableViewTextCell *)self linkText];
    objc_super v31 = (void *)v41;
    CGRect v32 = (void *)[v29 initWithString:v30 attributes:v41];

    CGRect v33 = [v39 string];
    CGRect v34 = [(DMCEnrollmentTableViewTextCell *)self hiddenTextView];
    [v34 setText:v33];

    v16 = v39;
  }
  else
  {
    CGRect v32 = 0;
    double v28 = 0;
    objc_super v31 = (void *)v41;
    double v27 = (void *)v42;
  }
  CGRect v35 = [(DMCEnrollmentTableViewTextCell *)self label];
  [v35 setAttributedText:v16];

  v36 = [(DMCEnrollmentTableViewTextCell *)self button];
  [v36 setAttributedTitle:v28 forState:0];

  v37 = [(DMCEnrollmentTableViewTextCell *)self button];
  [v37 setAttributedTitle:v32 forState:2];

  [(DMCEnrollmentTableViewTextCell *)self setNeedsLayout];
}

- (id)_textFontIsBold:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260]];
  uint64_t v5 = v4;
  BOOL v6 = (void *)MEMORY[0x263F81708];
  if (v3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [v4 fontDescriptorWithSymbolicTraits:v7];
  id v9 = [v6 fontWithDescriptor:v8 size:0.0];

  return v9;
}

- (id)_subTextFont
{
  uint64_t v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D268]];
  BOOL v3 = (void *)MEMORY[0x263F81708];
  id v4 = [v2 fontDescriptorWithSymbolicTraits:0];
  uint64_t v5 = [v3 fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (BOOL)isMultipleLines:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) rect];
        if (v8 > 0.0) {
          ++v5;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
    LOBYTE(v4) = v5 > 1;
  }

  return v4;
}

- (double)_horizontalMargin
{
  double result = 5.0;
  if (self->_layoutStyle == 1) {
    return 2.5;
  }
  return result;
}

- (double)_verticalMargin
{
  double result = 10.0;
  if (self->_layoutStyle == 1) {
    return 5.0;
  }
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)subLabel
{
  return self->_subLabel;
}

- (void)setSubLabel:(id)a3
{
}

- (void)setHiddenTextView:(id)a3
{
}

- (NSString)linkText
{
  return self->_linkText;
}

- (id)linkAction
{
  return self->_linkAction;
}

- (BOOL)bold
{
  return self->_bold;
}

- (void)setBold:(BOOL)a3
{
  self->_bold = a3;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_double previousWidth = a3;
}

- (BOOL)shouldCalculateLinkTextLineBreak
{
  return self->_shouldCalculateLinkTextLineBreak;
}

- (void)setShouldCalculateLinkTextLineBreak:(BOOL)a3
{
  self->_shouldCalculateLinkTextLineBreak = a3;
}

- (BOOL)linkTextOnNextLine
{
  return self->_linkTextOnNextLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_linkAction, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_hiddenTextView, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end