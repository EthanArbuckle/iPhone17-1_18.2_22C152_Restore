@interface HUActivityIndicatorCell
- (BOOL)isAnimating;
- (BOOL)isDisabled;
- (HFStringGenerator)descriptionText;
- (HFStringGenerator)titleText;
- (HUActivityIndicatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUTitleDescriptionContentView)titleDescriptionView;
- (NSString)description;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImage)icon;
- (UIImageView)iconImageView;
- (void)_setupConstraints;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAnimating:(BOOL)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation HUActivityIndicatorCell

- (HUActivityIndicatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HUActivityIndicatorCell;
  v4 = [(HUActivityIndicatorCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(HUTitleDescriptionContentView);
    titleDescriptionView = v4->_titleDescriptionView;
    v4->_titleDescriptionView = v5;

    [(HUTitleDescriptionContentView *)v4->_titleDescriptionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(HUActivityIndicatorCell *)v4 contentView];
    [v7 addSubview:v4->_titleDescriptionView];

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v8;

    [(UIImageView *)v4->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_iconImageView setContentMode:1];
    v10 = [(HUActivityIndicatorCell *)v4 contentView];
    [v10 addSubview:v4->_iconImageView];

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    activityIndicatorView = v4->_activityIndicatorView;
    v4->_activityIndicatorView = (UIActivityIndicatorView *)v11;

    [(UIActivityIndicatorView *)v4->_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v4->_activityIndicatorView setHidesWhenStopped:1];
    v13 = [(HUActivityIndicatorCell *)v4 contentView];
    [v13 addSubview:v4->_activityIndicatorView];

    [(HUActivityIndicatorCell *)v4 _setupConstraints];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUActivityIndicatorCell;
  [(HUActivityIndicatorCell *)&v3 prepareForReuse];
  [(HUActivityIndicatorCell *)self setTitleText:0];
  [(HUActivityIndicatorCell *)self setDescriptionText:0];
  [(HUActivityIndicatorCell *)self setIcon:0];
  [(HUActivityIndicatorCell *)self setAnimating:0];
}

- (void)layoutSubviews
{
  objc_super v3 = [(HUActivityIndicatorCell *)self contentView];
  [v3 layoutMargins];
  double v5 = v4;

  -[HUActivityIndicatorCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v5 + 35.0, 0.0, 0.0);
  v6.receiver = self;
  v6.super_class = (Class)HUActivityIndicatorCell;
  [(HUActivityIndicatorCell *)&v6 layoutSubviews];
}

- (HFStringGenerator)titleText
{
  v2 = [(HUActivityIndicatorCell *)self titleDescriptionView];
  objc_super v3 = [v2 titleText];

  return (HFStringGenerator *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(HUActivityIndicatorCell *)self titleDescriptionView];
  [v5 setTitleText:v4];
}

- (HFStringGenerator)descriptionText
{
  v2 = [(HUActivityIndicatorCell *)self titleDescriptionView];
  objc_super v3 = [v2 descriptionText];

  return (HFStringGenerator *)v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  id v5 = [(HUActivityIndicatorCell *)self titleDescriptionView];
  [v5 setDescriptionText:v4];
}

- (UIImage)icon
{
  v2 = [(HUActivityIndicatorCell *)self iconImageView];
  objc_super v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(HUActivityIndicatorCell *)self iconImageView];
  [v5 setImage:v4];
}

- (void)setAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  self->_animating = a3;
  id v5 = [(HUActivityIndicatorCell *)self activityIndicatorView];
  objc_super v6 = v5;
  if (v3)
  {
    [v5 startAnimating];

    v7 = [(HUActivityIndicatorCell *)self iconImageView];
    id v9 = v7;
    uint64_t v8 = 1;
  }
  else
  {
    [v5 stopAnimating];

    v7 = [(HUActivityIndicatorCell *)self iconImageView];
    id v9 = v7;
    uint64_t v8 = 0;
  }
  [v7 setHidden:v8];
}

- (NSString)description
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_super v6 = [(HUActivityIndicatorCell *)self titleText];
  v7 = [v3 stringWithFormat:@"<%@ %p \"%@\" (animating=%d)>", v5, self, v6, -[HUActivityIndicatorCell isAnimating](self, "isAnimating")];

  return (NSString *)v7;
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disabled = a3;
  id v4 = [(HUActivityIndicatorCell *)self titleDescriptionView];
  [v4 setDisabled:v3];
}

- (void)_setupConstraints
{
  v56[10] = *MEMORY[0x1E4F143B8];
  v33 = (void *)MEMORY[0x1E4F28DC8];
  v55 = [(HUActivityIndicatorCell *)self iconImageView];
  v53 = [v55 leadingAnchor];
  v54 = [(HUActivityIndicatorCell *)self contentView];
  v52 = [v54 layoutMarginsGuide];
  v51 = [v52 leadingAnchor];
  v50 = [v53 constraintEqualToAnchor:v51];
  v56[0] = v50;
  v49 = [(HUActivityIndicatorCell *)self iconImageView];
  v47 = [v49 centerYAnchor];
  v48 = [(HUActivityIndicatorCell *)self contentView];
  v46 = [v48 layoutMarginsGuide];
  v45 = [v46 centerYAnchor];
  v44 = [v47 constraintEqualToAnchor:v45];
  v56[1] = v44;
  v43 = [(HUActivityIndicatorCell *)self iconImageView];
  v42 = [v43 widthAnchor];
  v41 = [v42 constraintEqualToConstant:20.0];
  v56[2] = v41;
  v40 = [(HUActivityIndicatorCell *)self iconImageView];
  v39 = [v40 heightAnchor];
  v38 = [v39 constraintEqualToConstant:20.0];
  v56[3] = v38;
  v37 = [(HUActivityIndicatorCell *)self titleDescriptionView];
  v35 = [v37 topAnchor];
  v36 = [(HUActivityIndicatorCell *)self contentView];
  v34 = [v36 layoutMarginsGuide];
  v32 = [v34 topAnchor];
  v31 = [v35 constraintEqualToAnchor:v32];
  v56[4] = v31;
  v30 = [(HUActivityIndicatorCell *)self titleDescriptionView];
  v28 = [v30 bottomAnchor];
  v29 = [(HUActivityIndicatorCell *)self contentView];
  v27 = [v29 layoutMarginsGuide];
  v26 = [v27 bottomAnchor];
  v25 = [v28 constraintEqualToAnchor:v26];
  v56[5] = v25;
  v24 = [(HUActivityIndicatorCell *)self titleDescriptionView];
  v22 = [v24 leadingAnchor];
  v23 = [(HUActivityIndicatorCell *)self iconImageView];
  v21 = [v23 trailingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21 constant:15.0];
  v56[6] = v20;
  v19 = [(HUActivityIndicatorCell *)self titleDescriptionView];
  v17 = [v19 trailingAnchor];
  v18 = [(HUActivityIndicatorCell *)self contentView];
  v16 = [v18 layoutMarginsGuide];
  objc_super v15 = [v16 trailingAnchor];
  v14 = [v17 constraintEqualToAnchor:v15];
  v56[7] = v14;
  v13 = [(HUActivityIndicatorCell *)self activityIndicatorView];
  BOOL v3 = [v13 centerXAnchor];
  id v4 = [(HUActivityIndicatorCell *)self iconImageView];
  id v5 = [v4 centerXAnchor];
  objc_super v6 = [v3 constraintEqualToAnchor:v5];
  v56[8] = v6;
  v7 = [(HUActivityIndicatorCell *)self activityIndicatorView];
  uint64_t v8 = [v7 centerYAnchor];
  id v9 = [(HUActivityIndicatorCell *)self iconImageView];
  v10 = [v9 centerYAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10];
  v56[9] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:10];
  [v33 activateConstraints:v12];
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (HUTitleDescriptionContentView)titleDescriptionView
{
  return self->_titleDescriptionView;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);

  objc_storeStrong((id *)&self->_titleDescriptionView, 0);
}

@end