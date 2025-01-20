@interface CKDetailsSharedWithYouCheckboxCell
+ (BOOL)shouldHighlight;
+ (id)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDetailsSharedWithYouCheckboxCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)titleLabel;
- (UISwitch)controlSwitch;
- (void)_configureNewControlSwitch;
- (void)_configureNewTitleLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setControlSwitch:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CKDetailsSharedWithYouCheckboxCell

- (CKDetailsSharedWithYouCheckboxCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CKDetailsSharedWithYouCheckboxCell;
  v4 = [(CKTranscriptDetailsResizableCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CKDetailsSharedWithYouCheckboxCell *)v4 _configureNewControlSwitch];
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 theme];
    v8 = [v7 detailsCellStaticTextColor];
    v9 = [(CKDetailsSharedWithYouCheckboxCell *)v5 controlSwitch];
    [v9 setOnTintColor:v8];

    [(CKDetailsSharedWithYouCheckboxCell *)v5 _configureNewTitleLabel];
    v10 = [(CKDetailsCell *)v5 topSeperator];
    [v10 setHidden:1];

    v11 = [(CKDetailsCell *)v5 bottomSeperator];
    [v11 setHidden:1];
  }
  return v5;
}

+ (id)reuseIdentifier
{
  return @"CKDetailsSharedWithYouCheckboxCell_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (CKIsRunningInMacCatalyst())
  {
    v6 = +[CKUIBehavior sharedBehaviors];
    [v6 detailsContactCellMinimumHeight];
    double v8 = v7 + 16.0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKDetailsSharedWithYouCheckboxCell;
    -[CKDetailsSharedWithYouCheckboxCell sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
    double width = v9;
    double v8 = v10;
  }
  double v11 = width;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (UISwitch)controlSwitch
{
  controlSwitch = self->_controlSwitch;
  if (!controlSwitch)
  {
    [(CKDetailsSharedWithYouCheckboxCell *)self _configureNewControlSwitch];
    controlSwitch = self->_controlSwitch;
  }

  return controlSwitch;
}

- (void)_configureNewControlSwitch
{
  controlSwitch = self->_controlSwitch;
  if (controlSwitch)
  {
    [(UISwitch *)controlSwitch removeFromSuperview];
    [(UISwitch *)self->_controlSwitch removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
  }
  id v4 = objc_alloc(MEMORY[0x1E4F42E78]);
  v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = self->_controlSwitch;
  self->_controlSwitch = v5;

  [(UISwitch *)self->_controlSwitch setPreferredStyle:1];
  id v7 = [(CKDetailsSharedWithYouCheckboxCell *)self contentView];
  [v7 addSubview:self->_controlSwitch];
}

- (void)_configureNewTitleLabel
{
  titleLabel = self->_titleLabel;
  if (titleLabel) {
    [(UILabel *)titleLabel removeFromSuperview];
  }
  id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = self->_titleLabel;
  self->_titleLabel = v5;

  id v7 = CKFrameworkBundle();
  double v8 = [v7 localizedStringForKey:@"SHARED_WITH_YOU_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  double v9 = [v8 localizedUppercaseString];
  [(UILabel *)self->_titleLabel setText:v9];

  double v10 = self->_titleLabel;
  double v11 = [MEMORY[0x1E4F428B8] clearColor];
  [(UILabel *)v10 setBackgroundColor:v11];

  double v12 = self->_titleLabel;
  objc_super v13 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(UILabel *)v12 setTextColor:v13];

  v14 = self->_titleLabel;
  v15 = +[CKUIBehavior sharedBehaviors];
  v16 = [v15 headerFont];
  [(UILabel *)v14 setFont:v16];

  id v17 = [(CKDetailsSharedWithYouCheckboxCell *)self contentView];
  [v17 addSubview:self->_titleLabel];
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)CKDetailsSharedWithYouCheckboxCell;
  [(CKDetailsCell *)&v31 layoutSubviews];
  v3 = [(CKDetailsSharedWithYouCheckboxCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CKDetailsSharedWithYouCheckboxCell *)self layoutMargins];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 - (v12 + v16);
  double v19 = v11 - (v14 + v18);

  double v20 = v13 + -2.0;
  v21 = [(CKDetailsSharedWithYouCheckboxCell *)self controlSwitch];
  objc_msgSend(v21, "setFrame:", v20, v15 + 8.0, v17, v19);
  [(UILabel *)self->_titleLabel sizeToFit];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection])
  {
    v32.origin.x = v20;
    v32.origin.y = v15;
    v32.size.double width = v17;
    v32.size.double height = v19;
    double MaxX = CGRectGetMaxX(v32);
    [(UILabel *)self->_titleLabel bounds];
    double v20 = MaxX - v23 + 2.0;
  }
  [(CKDetailsSharedWithYouCheckboxCell *)self layoutMargins];
  double v25 = v24;
  [(UILabel *)self->_titleLabel bounds];
  double v27 = v26;
  [(UILabel *)self->_titleLabel bounds];
  double v29 = v28;
  [(CKDetailsSharedWithYouCheckboxCell *)self layoutMargins];
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v20, v25, v27, v29 + v30 * 2.0);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKDetailsSharedWithYouCheckboxCell;
  [(CKDetailsCell *)&v3 prepareForReuse];
  [(CKDetailsSharedWithYouCheckboxCell *)self _configureNewControlSwitch];
  [(CKDetailsSharedWithYouCheckboxCell *)self _configureNewTitleLabel];
}

- (void)setControlSwitch:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_controlSwitch, 0);
}

@end