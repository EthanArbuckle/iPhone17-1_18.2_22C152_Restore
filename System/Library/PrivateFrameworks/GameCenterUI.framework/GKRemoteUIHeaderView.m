@interface GKRemoteUIHeaderView
- (BOOL)isFirstSection;
- (GKLabel)textLabel;
- (GKRemoteUIHeaderView)initWithAttributes:(id)a3;
- (double)bottomMargin;
- (double)headerHeightForWidth:(double)a3 inTableView:(id)a4;
- (double)height;
- (void)setBottomMargin:(double)a3;
- (void)setHeight:(double)a3;
- (void)setIsFirstSection:(BOOL)a3;
- (void)setSectionIsFirst:(BOOL)a3;
- (void)setTextLabel:(id)a3;
@end

@implementation GKRemoteUIHeaderView

- (GKRemoteUIHeaderView)initWithAttributes:(id)a3
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)GKRemoteUIHeaderView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[GKRemoteUIHeaderView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  if (v9)
  {
    v10 = [v4 objectForKeyedSubscript:@"GKLayoutStyle"];
    uint64_t v11 = [v10 intValue];

    v12 = [v4 objectForKeyedSubscript:@"GKApplyTheme"];
    int v13 = [v12 BOOLValue];

    v14 = @"settingsHeader";
    if (v13) {
      v14 = @"remoteUISectionHeader";
    }
    v15 = (void *)MEMORY[0x1E4F639F8];
    v16 = v14;
    v17 = [v15 textStyle];
    v18 = [v4 objectForKeyedSubscript:@"headerStyle"];
    v19 = [v17 styleWithName:v18 fallback:v16 layoutMode:v11];

    v20 = [v19 lineBreakMode:0];

    v21 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v5, v6, v7, v8);
    textLabel = v9->_textLabel;
    v9->_textLabel = v21;

    v23 = [v4 objectForKeyedSubscript:@"header"];
    [(GKLabel *)v9->_textLabel setText:v23];

    [(GKLabel *)v9->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKLabel *)v9->_textLabel setNumberOfLines:0];
    if (v20) {
      [(GKLabel *)v9->_textLabel applyTextStyle:v20];
    }
    v24 = [v4 objectForKeyedSubscript:@"headerHeight"];
    v25 = v24;
    if (v24)
    {
      [v24 floatValue];
      double v27 = v26;
    }
    else
    {
      double v27 = 45.0;
    }
    v9->_height = v27;
    v28 = [v4 objectForKeyedSubscript:@"headerBottomMargin"];
    v29 = v28;
    if (v28)
    {
      [v28 floatValue];
      double v31 = v30;
    }
    else
    {
      double v31 = 10.0;
    }
    v9->_bottomMargin = v31;
    [(GKRemoteUIHeaderView *)v9 addSubview:v9->_textLabel];
    v32 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_textLabel attribute:11 relatedBy:0 toItem:v9 attribute:4 multiplier:1.0 constant:-v9->_bottomMargin];
    v33 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_textLabel attribute:1 relatedBy:0 toItem:v9 attribute:1 multiplier:1.0 constant:0.0];
    v34 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_textLabel attribute:2 relatedBy:0 toItem:v9 attribute:2 multiplier:1.0 constant:0.0];
    v39[0] = v32;
    v39[1] = v33;
    v39[2] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
    [(GKRemoteUIHeaderView *)v9 addConstraints:v35];

    v36 = v9;
  }

  return v9;
}

- (void)setSectionIsFirst:(BOOL)a3
{
  if (self->_isFirstSection != a3) {
    self->_isFirstSection = a3;
  }
}

- (double)headerHeightForWidth:(double)a3 inTableView:(id)a4
{
  return self->_height + self->_bottomMargin;
}

- (BOOL)isFirstSection
{
  return self->_isFirstSection;
}

- (void)setIsFirstSection:(BOOL)a3
{
  self->_isFirstSection = a3;
}

- (GKLabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (void).cxx_destruct
{
}

@end