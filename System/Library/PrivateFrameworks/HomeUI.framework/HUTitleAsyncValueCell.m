@interface HUTitleAsyncValueCell
- (BOOL)showSpinner;
- (HUTitleAsyncValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)spinnerView;
- (void)createSpinner;
- (void)prepareForReuse;
- (void)setShowSpinner:(BOOL)a3;
- (void)setSpinnerView:(id)a3;
@end

@implementation HUTitleAsyncValueCell

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    BOOL v3 = a3;
    self->_showSpinner = a3;
    BOOL v5 = !a3;
    v6 = [(HUTitleAsyncValueCell *)self spinnerView];
    [v6 setHidden:v5];

    v7 = [(HUTitleValueCell *)self valueLabel];
    [v7 setHidden:v3];

    v8 = [(HUTitleAsyncValueCell *)self spinnerView];
    id v9 = v8;
    if (v5) {
      [v8 stopAnimating];
    }
    else {
      [v8 startAnimating];
    }
  }
}

- (HUTitleAsyncValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HUTitleAsyncValueCell;
  v4 = [(HUTitleValueCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  BOOL v5 = v4;
  if (v4) {
    [(HUTitleAsyncValueCell *)v4 createSpinner];
  }
  return v5;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUTitleAsyncValueCell;
  [(HUTitleValueCell *)&v3 prepareForReuse];
  [(HUTitleAsyncValueCell *)self setShowSpinner:1];
}

- (void)createSpinner
{
  v20[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HUTitleAsyncValueCell *)self spinnerView];

  if (v3) {
    NSLog(&cfstr_AlreadyHaveSpi.isa, self);
  }
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [(HUTitleAsyncValueCell *)self setSpinnerView:v4];

  BOOL v5 = [(HUTitleAsyncValueCell *)self spinnerView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(HUTitleAsyncValueCell *)self contentView];
  objc_super v7 = [(HUTitleAsyncValueCell *)self spinnerView];
  [v6 addSubview:v7];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(HUTitleAsyncValueCell *)self spinnerView];
  v8 = [v19 centerYAnchor];
  id v9 = [(HUTitleAsyncValueCell *)self contentView];
  v10 = [v9 centerYAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v20[0] = v11;
  v12 = [(HUTitleAsyncValueCell *)self spinnerView];
  v13 = [v12 trailingAnchor];
  v14 = [(HUTitleValueCell *)self labelsStackView];
  v15 = [v14 trailingAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v20[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v18 activateConstraints:v17];
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (UIActivityIndicatorView)spinnerView
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setSpinnerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end