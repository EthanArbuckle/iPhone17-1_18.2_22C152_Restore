@interface GKRemoteUIFooterView
- (BOOL)shouldApplyGameCenterTheme;
- (GKLabel)textLabel;
- (GKRemoteUIFooterView)initWithAttributes:(id)a3;
- (double)bottomMargin;
- (double)footerHeightForWidth:(double)a3 inTableView:(id)a4;
- (double)leftMargin;
- (double)paragraphMargin;
- (double)rightMargin;
- (id)attributedStringForString:(id)a3 withStyle:(id)a4;
- (int)layoutStyle;
- (void)setBottomMargin:(double)a3;
- (void)setLayoutStyle:(int)a3;
- (void)setLeftMargin:(double)a3;
- (void)setParagraphMargin:(double)a3;
- (void)setRightMargin:(double)a3;
- (void)setShouldApplyGameCenterTheme:(BOOL)a3;
- (void)setTextLabel:(id)a3;
@end

@implementation GKRemoteUIFooterView

- (GKRemoteUIFooterView)initWithAttributes:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)GKRemoteUIFooterView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[GKRemoteUIFooterView initWithFrame:](&v50, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  if (!v9) {
    goto LABEL_14;
  }
  v10 = [v4 objectForKeyedSubscript:@"GKApplyTheme"];
  v9->_shouldApplyGameCenterTheme = [v10 BOOLValue];

  v11 = [v4 objectForKeyedSubscript:@"GKLayoutStyle"];
  v9->_uint64_t layoutStyle = [v11 integerValue];

  if (v9->_shouldApplyGameCenterTheme) {
    v12 = @"remoteUISectionFooter";
  }
  else {
    v12 = @"settingsFooter";
  }
  v13 = (void *)MEMORY[0x1E4F639F8];
  v14 = v12;
  v15 = [v13 textStyle];
  v16 = [v4 objectForKeyedSubscript:@"footerStyle"];
  v49 = v15;
  uint64_t v17 = [v15 styleWithName:v16 fallback:v14 layoutMode:v9->_layoutStyle];

  v18 = [v4 objectForKeyedSubscript:@"addBullets"];
  int v19 = [v18 BOOLValue];

  if (!v9->_shouldApplyGameCenterTheme)
  {
    v9->_leftMargin = 15.0;
    v9->_rightMargin = 15.0;
    double v22 = 22.0;
    double v21 = 18.0;
    goto LABEL_9;
  }
  v9->_leftMargin = 0.0;
  v9->_rightMargin = 0.0;
  uint64_t layoutStyle = v9->_layoutStyle;
  if (layoutStyle < 3)
  {
    double v21 = dbl_1AF7CAC78[layoutStyle];
    double v22 = dbl_1AF7CAC90[layoutStyle];
LABEL_9:
    v9->_paragraphMargin = v21;
    v9->_double bottomMargin = v22;
  }
  v23 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v5, v6, v7, v8);
  textLabel = v9->_textLabel;
  v9->_textLabel = v23;

  [(GKRemoteUIFooterView *)v9 addSubview:v9->_textLabel];
  v25 = [v4 objectForKeyedSubscript:@"footer"];
  v26 = [v25 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

  [(GKLabel *)v9->_textLabel setNumberOfLines:0];
  [(GKLabel *)v9->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v48 = (void *)v17;
  if (v19) {
    [(GKRemoteUIFooterView *)v9 attributedStringForString:v26 withStyle:v17];
  }
  else {
  v27 = [v26 _gkAttributedStringByApplyingStyle:v17];
  }
  [(GKLabel *)v9->_textLabel setAttributedText:v27];

  v28 = [MEMORY[0x1E4F1CA48] array];
  v29 = _NSDictionaryOfVariableBindings(&cfstr_Textlabel.isa, v9->_textLabel, 0);
  v51[0] = @"top";
  v30 = [NSNumber numberWithDouble:v9->_paragraphMargin];
  v51[1] = @"bottom";
  v52[0] = v30;
  v31 = NSNumber;
  double bottomMargin = v9->_bottomMargin;
  v33 = [(GKLabel *)v9->_textLabel font];
  [v33 descender];
  v35 = [v31 numberWithDouble:bottomMargin - fabs(v34)];
  v52[1] = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];

  v37 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(top)-[_textLabel]-(bottom)-|" options:0 metrics:v36 views:v29];
  [v28 addObjectsFromArray:v37];

  v38 = (void *)MEMORY[0x1E4F28DC8];
  v39 = v9->_textLabel;
  [(GKRemoteUIFooterView *)v9 leftMargin];
  v41 = [v38 constraintWithItem:v39 attribute:1 relatedBy:0 toItem:v9 attribute:1 multiplier:1.0 constant:v40];
  [v28 addObject:v41];

  v42 = (void *)MEMORY[0x1E4F28DC8];
  v43 = v9->_textLabel;
  [(GKRemoteUIFooterView *)v9 rightMargin];
  v45 = [v42 constraintWithItem:v43 attribute:2 relatedBy:0 toItem:v9 attribute:2 multiplier:1.0 constant:-v44];
  [v28 addObject:v45];

  [(GKRemoteUIFooterView *)v9 addConstraints:v28];
  v46 = v9;

LABEL_14:
  return v9;
}

- (double)footerHeightForWidth:(double)a3 inTableView:(id)a4
{
  id v5 = a4;
  [(GKRemoteUIFooterView *)self layoutIfNeeded];
  double v6 = [(GKRemoteUIFooterView *)self textLabel];
  double v7 = [v6 font];

  [v5 frame];
  double v9 = v8;

  [(GKRemoteUIFooterView *)self leftMargin];
  double v11 = v9 - v10;
  [(GKRemoteUIFooterView *)self rightMargin];
  double v13 = v11 - v12;
  v14 = [(GKRemoteUIFooterView *)self textLabel];
  [v14 setPreferredMaxLayoutWidth:v13];

  v15 = [(GKRemoteUIFooterView *)self textLabel];
  [v15 intrinsicContentSize];
  double v17 = v16;

  double v18 = v17 + self->_paragraphMargin + self->_bottomMargin;
  [v7 descender];
  double v20 = v18 - fabs(v19);

  return v20;
}

- (id)attributedStringForString:(id)a3 withStyle:(id)a4
{
  double v6 = (void *)MEMORY[0x1E4FB16C8];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  double v11 = (Class *)0x1E4F63A08;
  if (v10 == 1 && (*MEMORY[0x1E4F63A38] || *MEMORY[0x1E4F63830] == 0)) {
    double v11 = (Class *)0x1E4F63A00;
  }
  id v13 = objc_alloc_init(*v11);
  v14 = [v7 replayOnBaseStyle:v13 systemContentSizeDidChange:0];

  v15 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  double v16 = (void *)[v15 mutableCopy];

  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v18 = [v14 attributes];
  double v19 = (void *)[v17 initWithString:@"•  " attributes:v18];

  [v19 size];
  objc_msgSend(v16, "setHeadIndent:");
  [v16 setFirstLineHeadIndent:0.0];
  [v16 setParagraphSpacing:self->_paragraphMargin];
  double v20 = [v8 componentsSeparatedByString:@"\n"];

  double v21 = [NSString stringWithFormat:@"\n%@", @"•  "];
  double v22 = [v20 componentsJoinedByString:v21];
  v23 = [@"•  " stringByAppendingString:v22];

  id v24 = objc_alloc(MEMORY[0x1E4F28E48]);
  v25 = [v14 attributes];
  v26 = (void *)[v24 initWithString:v23 attributes:v25];

  objc_msgSend(v26, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v16, 0, objc_msgSend(v23, "length"));

  return v26;
}

- (GKLabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->_leftMargin = a3;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (void)setRightMargin:(double)a3
{
  self->_rightMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_double bottomMargin = a3;
}

- (double)paragraphMargin
{
  return self->_paragraphMargin;
}

- (void)setParagraphMargin:(double)a3
{
  self->_paragraphMargin = a3;
}

- (BOOL)shouldApplyGameCenterTheme
{
  return self->_shouldApplyGameCenterTheme;
}

- (void)setShouldApplyGameCenterTheme:(BOOL)a3
{
  self->_shouldApplyGameCenterTheme = a3;
}

- (int)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int)a3
{
  self->_uint64_t layoutStyle = a3;
}

- (void).cxx_destruct
{
}

@end