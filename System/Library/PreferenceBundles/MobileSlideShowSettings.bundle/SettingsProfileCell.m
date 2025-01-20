@interface SettingsProfileCell
- (SettingsProfileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)detailTextLabel;
- (id)imageView;
- (id)textLabel;
@end

@implementation SettingsProfileCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

- (id)detailTextLabel
{
  return self->_detailTextLabel;
}

- (id)textLabel
{
  return self->_textLabel;
}

- (id)imageView
{
  return self->_imageView;
}

- (SettingsProfileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v54.receiver = self;
  v54.super_class = (Class)SettingsProfileCell;
  v5 = [(SettingsProfileCell *)&v54 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(SettingsProfileCell *)v5 contentView];
    v8 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v6->_imageView;
    v6->_imageView = v8;

    [(UIImageView *)v6->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v6->_imageView setContentMode:4];
    [v7 addSubview:v6->_imageView];
    v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    textLabel = v6->_textLabel;
    v6->_textLabel = v10;

    [(UILabel *)v6->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [(UILabel *)v6->_textLabel setFont:v12];

    v13 = (UILabel *)objc_alloc_init((Class)UILabel);
    detailTextLabel = v6->_detailTextLabel;
    v6->_detailTextLabel = v13;

    [(UILabel *)v6->_detailTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v6->_detailTextLabel setFont:v15];

    id v16 = objc_alloc((Class)UIStackView);
    v56[0] = v6->_textLabel;
    v56[1] = v6->_detailTextLabel;
    v17 = +[NSArray arrayWithObjects:v56 count:2];
    id v18 = [v16 initWithArrangedSubviews:v17];

    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v18 setAxis:1];
    [v7 addSubview:v18];
    v53 = [(UIImageView *)v6->_imageView widthAnchor];
    v52 = [v53 constraintEqualToConstant:38.0];
    v55[0] = v52;
    v51 = [(UIImageView *)v6->_imageView heightAnchor];
    v50 = [v51 constraintEqualToConstant:38.0];
    v55[1] = v50;
    v49 = [(UIImageView *)v6->_imageView leadingAnchor];
    v48 = [v7 leadingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48 constant:17.0];
    v55[2] = v47;
    v46 = [(UIImageView *)v6->_imageView centerYAnchor];
    v45 = [v7 centerYAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v55[3] = v44;
    v43 = [(UIImageView *)v6->_imageView topAnchor];
    v42 = [v7 topAnchor];
    v41 = [v43 constraintGreaterThanOrEqualToAnchor:v42 constant:5.0];
    v55[4] = v41;
    v40 = [v7 bottomAnchor];
    v39 = [(UIImageView *)v6->_imageView bottomAnchor];
    v38 = [v40 constraintGreaterThanOrEqualToAnchor:v39 constant:5.0];
    v55[5] = v38;
    v36 = [v18 leadingAnchor];
    v35 = [(UIImageView *)v6->_imageView trailingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:10.0];
    v55[6] = v34;
    v33 = [v18 topAnchor];
    v19 = v7;
    v32 = [v7 topAnchor];
    v31 = [v33 constraintGreaterThanOrEqualToAnchor:v32 constant:5.0];
    v55[7] = v31;
    v30 = [v18 centerYAnchor];
    v29 = [v7 centerYAnchor];
    v20 = [v30 constraintEqualToAnchor:v29];
    v55[8] = v20;
    v37 = v19;
    v21 = [v19 trailingAnchor];
    v22 = [v18 trailingAnchor];
    v23 = [v21 constraintGreaterThanOrEqualToAnchor:v22 constant:17.0];
    v55[9] = v23;
    v24 = [v19 bottomAnchor];
    v25 = [v18 bottomAnchor];
    v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25 constant:5.0];
    v55[10] = v26;
    v27 = +[NSArray arrayWithObjects:v55 count:11];
    +[NSLayoutConstraint activateConstraints:v27];
  }
  return v6;
}

@end