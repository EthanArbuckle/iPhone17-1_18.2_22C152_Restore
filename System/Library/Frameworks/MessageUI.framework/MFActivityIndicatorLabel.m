@interface MFActivityIndicatorLabel
- (MFActivityIndicatorLabel)init;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)textLabel;
- (id)accessibilityLabel;
- (void)setActivityIndicator:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation MFActivityIndicatorLabel

- (MFActivityIndicatorLabel)init
{
  v38.receiver = self;
  v38.super_class = (Class)MFActivityIndicatorLabel;
  v2 = [(MFActivityIndicatorLabel *)&v38 init];
  v3 = v2;
  if (v2)
  {
    [(MFActivityIndicatorLabel *)v2 setAutoresizingMask:18];
    id v4 = objc_alloc(MEMORY[0x1E4FB1400]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(MFActivityIndicatorLabel *)v3 setActivityIndicator:v9];

    v10 = [(MFActivityIndicatorLabel *)v3 activityIndicator];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    v11 = [(MFActivityIndicatorLabel *)v3 activityIndicator];
    [(MFActivityIndicatorLabel *)v3 addSubview:v11];

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    [(MFActivityIndicatorLabel *)v3 setTextLabel:v12];

    v13 = [(MFActivityIndicatorLabel *)v3 textLabel];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v14 = [(MFActivityIndicatorLabel *)v3 textLabel];
    [(MFActivityIndicatorLabel *)v3 addSubview:v14];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16 = [(MFActivityIndicatorLabel *)v3 textLabel];
    v17 = [v16 leadingAnchor];
    v18 = [(MFActivityIndicatorLabel *)v3 leadingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v15 addObject:v19];

    v20 = [(MFActivityIndicatorLabel *)v3 textLabel];
    v21 = [v20 trailingAnchor];
    v22 = [(MFActivityIndicatorLabel *)v3 trailingAnchor];
    v23 = [v21 constraintLessThanOrEqualToAnchor:v22];
    [v15 addObject:v23];

    v24 = [(MFActivityIndicatorLabel *)v3 activityIndicator];
    v25 = [v24 centerYAnchor];
    v26 = [(MFActivityIndicatorLabel *)v3 centerYAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v15 addObject:v27];

    v28 = [(MFActivityIndicatorLabel *)v3 activityIndicator];
    v29 = [v28 leadingAnchor];
    v30 = [(MFActivityIndicatorLabel *)v3 leadingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v15 addObject:v31];

    v32 = [(MFActivityIndicatorLabel *)v3 activityIndicator];
    v33 = [v32 widthAnchor];
    v34 = [(MFActivityIndicatorLabel *)v3 activityIndicator];
    v35 = [v34 heightAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    [v15 addObject:v36];

    [MEMORY[0x1E4F28DC8] activateConstraints:v15];
  }
  return v3;
}

- (void)startAnimating
{
  id v3 = [(MFActivityIndicatorLabel *)self textLabel];
  [v3 setHidden:1];

  id v4 = [(MFActivityIndicatorLabel *)self activityIndicator];
  [v4 startAnimating];
}

- (void)stopAnimating
{
  id v3 = [(MFActivityIndicatorLabel *)self textLabel];
  [v3 setHidden:0];

  id v4 = [(MFActivityIndicatorLabel *)self activityIndicator];
  [v4 stopAnimating];
}

- (void)setActivityIndicator:(id)a3
{
  double v5 = (UIActivityIndicatorView *)a3;
  if (self->_activityIndicator != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_activityIndicator, a3);
    double v5 = v6;
  }
}

- (id)accessibilityLabel
{
  v2 = [(MFActivityIndicatorLabel *)self textLabel];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end