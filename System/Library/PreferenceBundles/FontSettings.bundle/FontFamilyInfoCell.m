@interface FontFamilyInfoCell
- (FontFamilyInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImageView)providerIconImageView;
- (UILabel)copyrightLabel;
- (UILabel)familyNameLabel;
- (UILabel)fileSizeLabel;
- (UILabel)providerNameLabel;
- (UILabel)versionLabel;
- (void)layoutSubviews;
- (void)setCopyright:(id)a3;
- (void)setCopyrightLabel:(id)a3;
- (void)setFamilyNameLabel:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileSizeLabel:(id)a3;
- (void)setLocalizedFamilyName:(id)a3;
- (void)setProviderIcon:(id)a3;
- (void)setProviderIconImageView:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setProviderNameLabel:(id)a3;
- (void)setVersion:(id)a3;
- (void)setVersionLabel:(id)a3;
@end

@implementation FontFamilyInfoCell

- (FontFamilyInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)FontFamilyInfoCell;
  return [(FontFamilyInfoCell *)&v6 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)FontFamilyInfoCell;
  [(FontFamilyInfoCell *)&v63 layoutSubviews];
  [(FontFamilyInfoCell *)self bounds];
  double v4 = v3;
  v5 = [(FontFamilyInfoCell *)self familyNameLabel];
  [v5 frame];
  double v7 = v6;

  double v8 = v4 + -24.0;
  v9 = [(FontFamilyInfoCell *)self familyNameLabel];
  objc_msgSend(v9, "setFrame:", 12.0, v7 * 0.5 + 0.0, v4 + -24.0, v7);

  double v10 = v7 + v7 * 0.5 + 0.0;
  v11 = [(FontFamilyInfoCell *)self providerNameLabel];
  [v11 frame];
  double v13 = v12;

  double v14 = v10 + 12.0;
  v15 = +[UIApplication sharedApplication];
  id v16 = [v15 userInterfaceLayoutDirection];

  if (v16) {
    double v17 = v4 + -12.0 + -12.0;
  }
  else {
    double v17 = 12.0;
  }
  if (v16) {
    double v18 = 8.0;
  }
  else {
    double v18 = 32.0;
  }
  v19 = [(FontFamilyInfoCell *)self providerIconImageView];
  objc_msgSend(v19, "setFrame:", v17, v14 + (v13 + -12.0) * 0.5, 12.0, 12.0);

  v20 = [(FontFamilyInfoCell *)self providerNameLabel];
  objc_msgSend(v20, "setFrame:", v18, v14, v8 + -20.0, v13);

  double v21 = v14 + v13;
  v22 = [(FontFamilyInfoCell *)self copyrightLabel];
  [v22 frame];
  double v24 = v23;

  double v25 = v21 + 12.0;
  v26 = [(FontFamilyInfoCell *)self copyrightLabel];
  objc_msgSend(v26, "setFrame:", 12.0, v25, v8, v24);

  v27 = [(FontFamilyInfoCell *)self copyrightLabel];
  [v27 sizeToFit];

  v28 = [(FontFamilyInfoCell *)self copyrightLabel];
  [v28 frame];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  v35 = [(FontFamilyInfoCell *)self copyrightLabel];
  objc_msgSend(v35, "setFrame:", v30, v32, v8, v34);

  v36 = [(FontFamilyInfoCell *)self copyrightLabel];
  [v36 frame];
  double v38 = v25 + v37;

  v39 = [(FontFamilyInfoCell *)self versionLabel];
  v40 = [v39 text];
  id v41 = [v40 length];

  if (v41)
  {
    v42 = [(FontFamilyInfoCell *)self versionLabel];
    [v42 frame];
    double v44 = v43;

    double v45 = v38 + 12.0;
    v46 = [(FontFamilyInfoCell *)self versionLabel];
    objc_msgSend(v46, "setFrame:", 12.0, v38 + 12.0, v8, v44);

    v47 = [(FontFamilyInfoCell *)self versionLabel];
    [v47 sizeToFit];

    v48 = [(FontFamilyInfoCell *)self versionLabel];
    [v48 frame];
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;

    v55 = [(FontFamilyInfoCell *)self versionLabel];
    objc_msgSend(v55, "setFrame:", v50, v52, v8, v54);

    v56 = [(FontFamilyInfoCell *)self versionLabel];
    [v56 frame];
    double v38 = v45 + v57;
  }
  v58 = [(FontFamilyInfoCell *)self fileSizeLabel];
  [v58 frame];
  double v60 = v59;

  v61 = [(FontFamilyInfoCell *)self fileSizeLabel];
  objc_msgSend(v61, "setFrame:", 12.0, v38 + 12.0, v8, v60);

  v62 = [(FontFamilyInfoCell *)self fileSizeLabel];
  [v62 frame];

  [(FontFamilyInfoCell *)self frame];
  -[FontFamilyInfoCell setFrame:](self, "setFrame:");
}

- (void)setLocalizedFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedFamilyName, a3);
  id v5 = a3;
  double v6 = [(FontFamilyInfoCell *)self familyNameLabel];
  [v6 setText:v5];

  id v7 = [(FontFamilyInfoCell *)self familyNameLabel];
  [v7 sizeToFit];
}

- (void)setProviderName:(id)a3
{
  objc_storeStrong((id *)&self->_providerName, a3);
  id v5 = a3;
  double v6 = [(FontFamilyInfoCell *)self providerNameLabel];
  [v6 setText:v5];

  id v7 = [(FontFamilyInfoCell *)self providerNameLabel];
  [v7 sizeToFit];
}

- (void)setProviderIcon:(id)a3
{
  objc_storeStrong((id *)&self->_providerIcon, a3);
  id v5 = a3;
  id v6 = [(FontFamilyInfoCell *)self providerIconImageView];
  [v6 setImage:v5];
}

- (void)setCopyright:(id)a3
{
  double v4 = (__CFString *)a3;
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &stru_1CDF0;
  }
  copyright = self->_copyright;
  self->_copyright = &v5->isa;
  id v7 = v5;

  double v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"COPYRIGHT_TITLE" value:&stru_1CDF0 table:@"FontSettings"];
  double v10 = +[NSString localizedStringWithFormat:@"%@\n", v9];

  id v11 = objc_alloc((Class)NSMutableAttributedString);
  NSAttributedStringKey v25 = NSFontAttributeName;
  double v12 = +[UIFont boldSystemFontOfSize:12.0];
  v26 = v12;
  double v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v14 = [v11 initWithString:v10 attributes:v13];

  id v15 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v23 = NSFontAttributeName;
  id v16 = +[UIFont systemFontOfSize:12.0];
  double v24 = v16;
  double v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v18 = [v15 initWithString:v7 attributes:v17];

  [v14 appendAttributedString:v18];
  v19 = [(FontFamilyInfoCell *)self copyrightLabel];
  [v19 setAttributedText:v14];

  v20 = [(FontFamilyInfoCell *)self copyrightLabel];
  [v20 setLineBreakMode:0];

  double v21 = [(FontFamilyInfoCell *)self copyrightLabel];
  [v21 setNumberOfLines:0];

  v22 = [(FontFamilyInfoCell *)self copyrightLabel];
  [v22 sizeToFit];
}

- (void)setVersion:(id)a3
{
  double v4 = (__CFString *)a3;
  if (![(__CFString *)v4 length])
  {

    double v4 = &stru_1CDF0;
  }
  objc_storeStrong((id *)&self->_versionString, v4);
  if ([(__CFString *)v4 length])
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"VERSION_TITLE" value:&stru_1CDF0 table:@"FontSettings"];
    id v7 = +[NSString localizedStringWithFormat:@"%@\n", v6];

    id v8 = objc_alloc((Class)NSMutableAttributedString);
    NSAttributedStringKey v23 = NSFontAttributeName;
    v9 = +[UIFont boldSystemFontOfSize:12.0];
    double v24 = v9;
    double v10 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v11 = [v8 initWithString:v7 attributes:v10];

    id v12 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v21 = NSFontAttributeName;
    double v13 = +[UIFont systemFontOfSize:12.0];
    v22 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v15 = [v12 initWithString:v4 attributes:v14];
    [v11 appendAttributedString:v15];

    id v16 = [(FontFamilyInfoCell *)self versionLabel];
    [v16 setAttributedText:v11];

    double v17 = [(FontFamilyInfoCell *)self versionLabel];
    [v17 setLineBreakMode:0];

    id v18 = [(FontFamilyInfoCell *)self versionLabel];
    [v18 setNumberOfLines:0];

    v19 = [(FontFamilyInfoCell *)self versionLabel];
    [v19 sizeToFit];
  }
  else
  {
    v20 = [(FontFamilyInfoCell *)self versionLabel];
    [v20 setText:&stru_1CDF0];
  }
}

- (void)setFileSize:(unint64_t)a3
{
  if (a3)
  {
    double v4 = +[NSByteCountFormatter stringFromByteCount:a3 countStyle:0];
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"SIZE_TITLE" value:&stru_1CDF0 table:@"FontSettings"];
    id v7 = +[NSString localizedStringWithFormat:@"%@\n", v6];

    id v8 = objc_alloc((Class)NSMutableAttributedString);
    NSAttributedStringKey v24 = NSFontAttributeName;
    v9 = +[UIFont boldSystemFontOfSize:12.0];
    NSAttributedStringKey v25 = v9;
    double v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v11 = [v8 initWithString:v7 attributes:v10];

    id v12 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v22 = NSFontAttributeName;
    double v13 = +[UIFont systemFontOfSize:12.0];
    NSAttributedStringKey v23 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v15 = [v12 initWithString:v4 attributes:v14];
    [v11 appendAttributedString:v15];

    id v16 = [(FontFamilyInfoCell *)self fileSizeLabel];
    [v16 setAttributedText:v11];

    double v17 = [(FontFamilyInfoCell *)self fileSizeLabel];
    [v17 setLineBreakMode:0];

    id v18 = [(FontFamilyInfoCell *)self fileSizeLabel];
    [v18 setNumberOfLines:0];

    v19 = [(FontFamilyInfoCell *)self fileSizeLabel];
    [v19 sizeToFit];
  }
  else
  {
    v20 = [(FontFamilyInfoCell *)self fileSizeLabel];
    [v20 setText:&stru_1CDF0];

    id v21 = [(FontFamilyInfoCell *)self fileSizeLabel];
    [v21 sizeToFit];
  }
}

- (UILabel)familyNameLabel
{
  familyNameLabel = self->_familyNameLabel;
  if (!familyNameLabel)
  {
    double v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_familyNameLabel;
    self->_familyNameLabel = v4;

    [(UILabel *)self->_familyNameLabel setBackgroundColor:0];
    [(UILabel *)self->_familyNameLabel setOpaque:0];
    id v6 = self->_familyNameLabel;
    id v7 = +[UIFont boldSystemFontOfSize:24.0];
    [(UILabel *)v6 setFont:v7];

    [(FontFamilyInfoCell *)self addSubview:self->_familyNameLabel];
    familyNameLabel = self->_familyNameLabel;
  }

  return familyNameLabel;
}

- (UILabel)providerNameLabel
{
  providerNameLabel = self->_providerNameLabel;
  if (!providerNameLabel)
  {
    double v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_providerNameLabel;
    self->_providerNameLabel = v4;

    [(UILabel *)self->_providerNameLabel setBackgroundColor:0];
    [(UILabel *)self->_providerNameLabel setOpaque:0];
    id v6 = self->_providerNameLabel;
    id v7 = +[UIFont systemFontOfSize:12.0];
    [(UILabel *)v6 setFont:v7];

    [(FontFamilyInfoCell *)self addSubview:self->_providerNameLabel];
    providerNameLabel = self->_providerNameLabel;
  }

  return providerNameLabel;
}

- (UIImageView)providerIconImageView
{
  providerIconImageView = self->_providerIconImageView;
  if (!providerIconImageView)
  {
    double v4 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_providerIconImageView;
    self->_providerIconImageView = v4;

    [(UIImageView *)self->_providerIconImageView setBackgroundColor:0];
    [(UIImageView *)self->_providerIconImageView setOpaque:0];
    [(FontFamilyInfoCell *)self addSubview:self->_providerIconImageView];
    providerIconImageView = self->_providerIconImageView;
  }

  return providerIconImageView;
}

- (UILabel)copyrightLabel
{
  copyrightLabel = self->_copyrightLabel;
  if (!copyrightLabel)
  {
    double v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_copyrightLabel;
    self->_copyrightLabel = v4;

    [(UILabel *)self->_copyrightLabel setBackgroundColor:0];
    [(UILabel *)self->_copyrightLabel setOpaque:0];
    id v6 = self->_copyrightLabel;
    id v7 = +[UIFont systemFontOfSize:12.0];
    [(UILabel *)v6 setFont:v7];

    [(FontFamilyInfoCell *)self addSubview:self->_copyrightLabel];
    copyrightLabel = self->_copyrightLabel;
  }

  return copyrightLabel;
}

- (UILabel)versionLabel
{
  versionLabel = self->_versionLabel;
  if (!versionLabel)
  {
    double v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_versionLabel;
    self->_versionLabel = v4;

    [(UILabel *)self->_versionLabel setBackgroundColor:0];
    [(UILabel *)self->_versionLabel setOpaque:0];
    id v6 = self->_versionLabel;
    id v7 = +[UIFont systemFontOfSize:12.0];
    [(UILabel *)v6 setFont:v7];

    [(FontFamilyInfoCell *)self addSubview:self->_versionLabel];
    versionLabel = self->_versionLabel;
  }

  return versionLabel;
}

- (UILabel)fileSizeLabel
{
  fileSizeLabel = self->_fileSizeLabel;
  if (!fileSizeLabel)
  {
    double v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_fileSizeLabel;
    self->_fileSizeLabel = v4;

    [(UILabel *)self->_fileSizeLabel setBackgroundColor:0];
    [(UILabel *)self->_fileSizeLabel setOpaque:0];
    id v6 = self->_fileSizeLabel;
    id v7 = +[UIFont systemFontOfSize:12.0];
    [(UILabel *)v6 setFont:v7];

    [(FontFamilyInfoCell *)self addSubview:self->_fileSizeLabel];
    fileSizeLabel = self->_fileSizeLabel;
  }

  return fileSizeLabel;
}

- (void)setFamilyNameLabel:(id)a3
{
}

- (void)setProviderNameLabel:(id)a3
{
}

- (void)setProviderIconImageView:(id)a3
{
}

- (void)setCopyrightLabel:(id)a3
{
}

- (void)setVersionLabel:(id)a3
{
}

- (void)setFileSizeLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSizeLabel, 0);
  objc_storeStrong((id *)&self->_versionLabel, 0);
  objc_storeStrong((id *)&self->_copyrightLabel, 0);
  objc_storeStrong((id *)&self->_providerIconImageView, 0);
  objc_storeStrong((id *)&self->_providerNameLabel, 0);
  objc_storeStrong((id *)&self->_familyNameLabel, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_copyright, 0);
  objc_storeStrong((id *)&self->_providerIcon, 0);
  objc_storeStrong((id *)&self->_providerName, 0);

  objc_storeStrong((id *)&self->_localizedFamilyName, 0);
}

@end