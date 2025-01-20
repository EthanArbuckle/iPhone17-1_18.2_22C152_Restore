@interface AKAuthorizationSubPaneInfoLabel
- (AKAuthorizationSubPaneInfoLabel)infoLabelWithString:(id)a3;
- (AKAuthorizationSubPaneInfoLabel)initWithString:(id)a3;
- (NSString)string;
- (UILabel)infoLabel;
- (double)marginInset;
- (unint64_t)internalInfoLabelType;
- (void)addToConstraints:(id)a3 context:(id)a4;
- (void)addToStackView:(id)a3 context:(id)a4;
- (void)setInfoLabelType:(unint64_t)a3;
- (void)setInternalInfoLabelType:(unint64_t)a3;
- (void)setLabel:(id)a3 toInfoLabelType:(unint64_t)a4;
- (void)setLabelColor:(id)a3;
- (void)setMarginInset:(double)a3;
- (void)setString:(id)a3;
- (void)setString:(id)a3 animated:(BOOL)a4;
@end

@implementation AKAuthorizationSubPaneInfoLabel

- (AKAuthorizationSubPaneInfoLabel)initWithString:(id)a3
{
  v4 = [(AKAuthorizationSubPaneInfoLabel *)self infoLabelWithString:a3];
  infoLabel = self->_infoLabel;
  self->_infoLabel = v4;

  v6 = self->_infoLabel;
  v10.receiver = self;
  v10.super_class = (Class)AKAuthorizationSubPaneInfoLabel;
  v7 = [(AKAuthorizationSubPane *)&v10 initWithView:v6];
  if (v7)
  {
    +[AKAuthorizationSubPaneMetrics infoLabelMarginInset];
    v7->_marginInset = v8;
  }
  return v7;
}

- (NSString)string
{
  v2 = [(AKAuthorizationSubPaneInfoLabel *)self infoLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setString:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAuthorizationSubPaneInfoLabel *)self infoLabel];
  [v5 setText:v4];
}

- (void)setString:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E4F42FF0];
    double v8 = [(AKAuthorizationSubPaneInfoLabel *)self infoLabel];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__AKAuthorizationSubPaneInfoLabel_setString_animated___block_invoke;
    v9[3] = &unk_1E648F2C8;
    v9[4] = self;
    id v10 = v6;
    [v7 transitionWithView:v8 duration:5242880 options:v9 animations:0 completion:0.25];
  }
  else
  {
    [(AKAuthorizationSubPaneInfoLabel *)self setString:v6];
  }
}

void __54__AKAuthorizationSubPaneInfoLabel_setString_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) infoLabel];
  [v2 setText:v1];
}

- (void)addToStackView:(id)a3 context:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPaneInfoLabel;
  [(AKAuthorizationSubPane *)&v4 addToStackView:a3 context:a4];
}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v19 = [(AKAuthorizationSubPaneInfoLabel *)self infoLabel];
  v18 = [v19 leadingAnchor];
  double v8 = [v6 stackView];
  v9 = [v8 leadingAnchor];
  [(AKAuthorizationSubPaneInfoLabel *)self marginInset];
  id v10 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v9);
  v20[0] = v10;
  v11 = [(AKAuthorizationSubPaneInfoLabel *)self infoLabel];
  v12 = [v11 trailingAnchor];
  v13 = [v6 stackView];

  v14 = [v13 trailingAnchor];
  [(AKAuthorizationSubPaneInfoLabel *)self marginInset];
  v16 = [v12 constraintEqualToAnchor:v14 constant:-v15];
  v20[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v7 addObjectsFromArray:v17];
}

- (AKAuthorizationSubPaneInfoLabel)infoLabelWithString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F42B38];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setTextAlignment:1];
  [v5 setNumberOfLines:0];
  [v5 setAdjustsFontSizeToFitWidth:0];
  [v5 setAdjustsFontForContentSizeCategory:1];
  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setBackgroundColor:v6];

  [v5 setText:v4];
  id v7 = +[AKAuthorizationAppearance messageFont];
  [v5 setFont:v7];

  return (AKAuthorizationSubPaneInfoLabel *)v5;
}

- (void)setLabel:(id)a3 toInfoLabelType:(unint64_t)a4
{
  id v5 = a3;
  id v11 = v5;
  switch(a4)
  {
    case 0uLL:
      uint64_t v6 = +[AKAuthorizationAppearance messageFont];
      goto LABEL_7;
    case 1uLL:
      uint64_t v6 = +[AKAuthorizationAppearance titleFont];
      goto LABEL_7;
    case 2uLL:
      id v7 = +[AKAuthorizationAppearance scopeSubtitleTextColor];
      [v11 setColor:v7];

      uint64_t v6 = +[AKAuthorizationAppearance scopeSubtitleFont];
      goto LABEL_7;
    case 3uLL:
      double v8 = +[AKAuthorizationAppearance smallTitleTextColor];
      [v11 setColor:v8];

      uint64_t v6 = +[AKAuthorizationAppearance smallTitleFont];
      goto LABEL_7;
    case 4uLL:
      v9 = +[AKAuthorizationAppearance captionTextColor];
      [v11 setColor:v9];

      uint64_t v6 = +[AKAuthorizationAppearance captionFont];
LABEL_7:
      id v10 = (void *)v6;
      [v11 setFont:v6];

      id v5 = v11;
      break;
    default:
      break;
  }
}

- (void)setInfoLabelType:(unint64_t)a3
{
  if ([(AKAuthorizationSubPaneInfoLabel *)self internalInfoLabelType] != a3)
  {
    [(AKAuthorizationSubPaneInfoLabel *)self setInternalInfoLabelType:a3];
    id v5 = [(AKAuthorizationSubPaneInfoLabel *)self infoLabel];
    [(AKAuthorizationSubPaneInfoLabel *)self setLabel:v5 toInfoLabelType:a3];
  }
}

- (void)setLabelColor:(id)a3
{
}

- (double)marginInset
{
  return self->_marginInset;
}

- (void)setMarginInset:(double)a3
{
  self->_marginInset = a3;
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (unint64_t)internalInfoLabelType
{
  return self->_internalInfoLabelType;
}

- (void)setInternalInfoLabelType:(unint64_t)a3
{
  self->_internalInfoLabelType = a3;
}

- (void).cxx_destruct
{
}

@end