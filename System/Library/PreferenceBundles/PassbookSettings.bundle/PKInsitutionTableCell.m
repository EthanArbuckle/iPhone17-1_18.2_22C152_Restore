@interface PKInsitutionTableCell
+ (double)estimatedHeightForCell;
+ (id)bankConnectImageProvider;
+ (id)subTitleFont;
+ (id)titleFont;
- (PKInsitutionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_configureCellWithSpecifier:(id)a3;
- (void)_configureMainLabelWithText:(id)a3;
- (void)_configureSubTextLabelWithText:(id)a3 textColor:(id)a4;
- (void)layoutSubviews;
- (void)setConnectedInstitution:(id)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation PKInsitutionTableCell

- (PKInsitutionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PKInsitutionTableCell;
  v9 = [(PKInsitutionTableCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(PKInsitutionTableCell *)v9 setSpecifier:v8];
    [(PKInsitutionTableCell *)v10 setAutoresizingMask:18];
  }

  return v10;
}

+ (id)titleFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

+ (id)subTitleFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
}

- (void)setConnectedInstitution:(id)a3
{
  v5 = (FKBankConnectInstitutionsProviderResponse *)a3;
  if (self->_connectedInstitution != v5)
  {
    objc_storeStrong((id *)&self->_connectedInstitution, a3);
    v6 = [(PKInsitutionTableCell *)self contentView];
    snapshotSpinner = self->_snapshotSpinner;
    if (!snapshotSpinner)
    {
      id v8 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      v9 = self->_snapshotSpinner;
      self->_snapshotSpinner = v8;

      [(UIActivityIndicatorView *)self->_snapshotSpinner startAnimating];
      snapshotSpinner = self->_snapshotSpinner;
    }
    [v6 addSubview:snapshotSpinner];
    [(UIImageView *)self->_iconImageView setImage:0];
    PKUIScreenScale();
    double v11 = v10;
    objc_super v12 = +[PKInsitutionTableCell bankConnectImageProvider];
    v13 = [(FKBankConnectInstitutionsProviderResponse *)self->_connectedInstitution institution];
    v14 = [v13 institutionIdentifier];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_8DA8;
    v18[3] = &unk_10B20;
    id v19 = v14;
    v20 = self;
    id v21 = v6;
    id v22 = v12;
    id v15 = v12;
    id v16 = v6;
    id v17 = v14;
    objc_msgSend(v15, "logoForInstitutionID:size:scale:completion:", v17, v18, 29.0, 29.0, v11);
  }
}

+ (id)bankConnectImageProvider
{
  if (qword_15BF0 != -1) {
    dispatch_once(&qword_15BF0, &stru_10B40);
  }
  v2 = (void *)qword_15BE8;

  return v2;
}

- (void)_configureMainLabelWithText:(id)a3
{
  id v4 = a3;
  titleLabel = self->_titleLabel;
  id v11 = v4;
  if (!titleLabel)
  {
    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    v7 = self->_titleLabel;
    self->_titleLabel = v6;

    id v8 = self->_titleLabel;
    v9 = [(id)objc_opt_class() titleFont];
    [(UILabel *)v8 setFont:v9];

    id v4 = v11;
    titleLabel = self->_titleLabel;
  }
  [(UILabel *)titleLabel setText:v4];
  [(UILabel *)self->_titleLabel sizeToFit];
  double v10 = [(PKInsitutionTableCell *)self contentView];
  [v10 addSubview:self->_titleLabel];
}

- (void)_configureSubTextLabelWithText:(id)a3 textColor:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  subTitleLabel = self->_subTitleLabel;
  if (subTitleLabel)
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  double v10 = self->_subTitleLabel;
  self->_subTitleLabel = v9;

  id v11 = self->_subTitleLabel;
  objc_super v12 = [(id)objc_opt_class() subTitleFont];
  [(UILabel *)v11 setFont:v12];

  subTitleLabel = self->_subTitleLabel;
  if (v6)
  {
LABEL_3:
    [(UILabel *)subTitleLabel setTextColor:v6];
    subTitleLabel = self->_subTitleLabel;
  }
LABEL_4:
  [(UILabel *)subTitleLabel setText:v13];
  [(UILabel *)self->_subTitleLabel sizeToFit];
  id v8 = [(PKInsitutionTableCell *)self contentView];
  [v8 addSubview:self->_subTitleLabel];
}

- (void)_configureCellWithSpecifier:(id)a3
{
  id v4 = [(FKBankConnectInstitutionsProviderResponse *)self->_connectedInstitution institution];
  v5 = [v4 name];
  [(PKInsitutionTableCell *)self _configureMainLabelWithText:v5];

  [(PKInsitutionTableCell *)self setAccessoryType:1];
  if ([(FKBankConnectInstitutionsProviderResponse *)self->_connectedInstitution consentStatus] == (char *)&dword_0 + 1)
  {
    PKLocalizedBankConnectString(@"BANK_CONNECT_DISCONNECTED");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  id v6 = +[UIColor systemBlueColor];
  [(PKInsitutionTableCell *)self _configureSubTextLabelWithText:v7 textColor:v6];
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  unsigned __int8 v6 = [WeakRetained isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKInsitutionTableCell;
    [(PKInsitutionTableCell *)&v8 setSpecifier:v4];
    id v7 = [v4 objectForKeyedSubscript:@"pkConnectedInsitution"];
    [(PKInsitutionTableCell *)self setConnectedInstitution:v7];
    [(PKInsitutionTableCell *)self _configureCellWithSpecifier:v4];
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PKInsitutionTableCell;
  [(PKInsitutionTableCell *)&v26 layoutSubviews];
  if ([(PKInsitutionTableCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v3 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v3 = CGRectMinXEdge;
  }
  id v4 = [(PKInsitutionTableCell *)self contentView];
  [v4 bounds];
  memset(&slice, 0, sizeof(slice));
  memset(&rect, 0, sizeof(rect));
  CGRect remainder = v27;
  CGRectDivide(v27, &slice, &remainder, 16.0, v3);
  CGRectDivide(remainder, &rect, &remainder, 29.0, v3);
  CGRectDivide(remainder, &slice, &remainder, 16.0, v3);
  double width = remainder.size.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  double v7 = v6;
  -[UILabel sizeThatFits:](self->_subTitleLabel, "sizeThatFits:", width, 1.79769313e308);
  double v9 = v8;
  double v10 = v7 + 8.0 + 2.0 + v8 + 8.0;
  PKSizeAlignedInRect();
  double x = v28.origin.x;
  CGFloat v13 = v12;
  double v14 = v28.size.width;
  v28.origin.CGFloat y = v12 + 8.0;
  CGFloat y = v28.origin.y;
  v28.size.height = v7;
  -[UILabel setFrame:](self->_subTitleLabel, "setFrame:", v28.origin.x, CGRectGetMaxY(v28) + 2.0, v28.size.width, v9);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", x, y, v14, v7);
  double v16 = 60.0;
  if (v10 >= 60.0) {
    double v16 = v10;
  }
  id v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16, *(void *)&rect.origin.x, *(void *)&rect.origin.y);
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  [WeakRetained setObject:v17 forKeyedSubscript:PSTableCellHeightKey];

  rect.size.height = v10;
  rect.origin.CGFloat y = v13;
  snapshotSpinner = self->_snapshotSpinner;
  v29.origin.double x = rect.origin.x;
  v29.size.double width = rect.size.width;
  v29.origin.CGFloat y = v13;
  v29.size.height = v10;
  double MidX = CGRectGetMidX(v29);
  -[UIActivityIndicatorView setCenter:](snapshotSpinner, "setCenter:", MidX, CGRectGetMidY(rect));
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    id v22 = [(UIImageView *)iconImageView image];

    if (v22)
    {
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
    }
  }
}

+ (double)estimatedHeightForCell
{
  CGRectEdge v3 = [a1 titleFont];
  [v3 lineHeight];
  double v5 = v4;
  double v6 = [a1 subTitleFont];
  [v6 lineHeight];
  double v8 = v5 + v7;

  return fmax(fmax(v8 + 2.0 + 16.0, 45.0), 60.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_snapshotSpinner, 0);

  objc_storeStrong((id *)&self->_connectedInstitution, 0);
}

@end