@interface MCActivityViewController
- (BOOL)isInProgress;
- (MCActivityViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSString)completionText;
- (NSString)inProgresText;
- (NSString)longWaitingWarningText;
- (UIActivityIndicatorView)spinnerView;
- (UIImageView)completionIconImageView;
- (UILabel)longWaitingWarningLabel;
- (UILabel)textLabel;
- (double)longWaitingWarningThreshold;
- (void)_scheduleLongWaitingWarning;
- (void)completeActivityAnimated:(BOOL)a3;
- (void)loadView;
- (void)setCompletionIconImageView:(id)a3;
- (void)setCompletionText:(id)a3;
- (void)setInProgresText:(id)a3;
- (void)setIsInProgress:(BOOL)a3;
- (void)setLongWaitingWarningLabel:(id)a3;
- (void)setLongWaitingWarningText:(id)a3;
- (void)setLongWaitingWarningThreshold:(double)a3;
- (void)setSpinnerView:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MCActivityViewController

- (MCActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MCActivityViewController;
  result = [(MCActivityViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_isInProgress = 1;
  }
  return result;
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)MCActivityViewController;
  [(MCActivityViewController *)&v13 loadView];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v4 = [(MCActivityViewController *)self view];
  [v4 setBackgroundColor:v3];

  objc_super v5 = [(MCActivityViewController *)self view];
  v6 = [(MCActivityViewController *)self spinnerView];
  [v5 addSubview:v6];

  v7 = [(MCActivityViewController *)self view];
  v8 = [(MCActivityViewController *)self textLabel];
  [v7 addSubview:v8];

  v9 = [(MCActivityViewController *)self view];
  v10 = [(MCActivityViewController *)self completionIconImageView];
  [v9 addSubview:v10];

  v11 = [(MCActivityViewController *)self view];
  v12 = [(MCActivityViewController *)self longWaitingWarningLabel];
  [v11 addSubview:v12];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCActivityViewController;
  [(MCActivityViewController *)&v5 viewWillAppear:a3];
  if ([(MCActivityViewController *)self isInProgress])
  {
    v4 = [(MCActivityViewController *)self spinnerView];
    [v4 startAnimating];

    [(MCActivityViewController *)self _scheduleLongWaitingWarning];
  }
}

- (void)viewDidLayoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)MCActivityViewController;
  [(MCActivityViewController *)&v37 viewDidLayoutSubviews];
  v3 = [(MCActivityViewController *)self view];
  [v3 center];
  double v5 = v4;
  double v7 = v6;
  v8 = [(MCActivityViewController *)self spinnerView];
  objc_msgSend(v8, "setCenter:", v5, v7);

  v9 = [(MCActivityViewController *)self spinnerView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(MCActivityViewController *)self completionIconImageView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [(MCActivityViewController *)self textLabel];
  v20 = [(MCActivityViewController *)self view];
  [v20 bounds];
  objc_msgSend(v19, "sizeThatFits:", CGRectGetWidth(v38) + -16.0, 1.79769313e308);
  double v22 = v21;

  v23 = [(MCActivityViewController *)self spinnerView];
  [v23 frame];
  CGFloat v24 = CGRectGetMaxY(v39) + 8.0;
  v25 = [(MCActivityViewController *)self view];
  [v25 bounds];
  CGFloat v26 = CGRectGetWidth(v40) + -16.0;
  v27 = [(MCActivityViewController *)self textLabel];
  objc_msgSend(v27, "setFrame:", 8.0, v24, v26, v22);

  v28 = [(MCActivityViewController *)self longWaitingWarningLabel];
  v29 = [(MCActivityViewController *)self view];
  [v29 bounds];
  objc_msgSend(v28, "sizeThatFits:", CGRectGetWidth(v41) + -16.0, 1.79769313e308);
  double v31 = v30;

  v32 = [(MCActivityViewController *)self textLabel];
  [v32 frame];
  CGFloat v33 = CGRectGetMaxY(v42) + 8.0;
  v34 = [(MCActivityViewController *)self view];
  [v34 bounds];
  CGFloat v35 = CGRectGetWidth(v43) + -16.0;
  v36 = [(MCActivityViewController *)self longWaitingWarningLabel];
  objc_msgSend(v36, "setFrame:", 8.0, v33, v35, v31);
}

- (void)completeActivityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCActivityViewController *)self setIsInProgress:0];
  double v5 = 0.200000003;
  if (!v3) {
    double v5 = 0.0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__MCActivityViewController_completeActivityAnimated___block_invoke;
  v6[3] = &unk_1E6EAD1D0;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:v5];
}

void __53__MCActivityViewController_completeActivityAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) spinnerView];
  [v2 stopAnimating];

  BOOL v3 = [*(id *)(a1 + 32) completionText];
  double v4 = [*(id *)(a1 + 32) textLabel];
  [v4 setText:v3];

  double v5 = [*(id *)(a1 + 32) completionIconImageView];
  [v5 setAlpha:1.0];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 setNeedsDisplay];
}

- (void)setInProgresText:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_inProgresText, "isEqualToString:"))
  {
    double v4 = (NSString *)[v8 copy];
    inProgresText = self->_inProgresText;
    self->_inProgresText = v4;
  }
  if ([(MCActivityViewController *)self isInProgress])
  {
    id v6 = self->_inProgresText;
    double v7 = [(MCActivityViewController *)self textLabel];
    [v7 setText:v6];
  }
}

- (void)setIsInProgress:(BOOL)a3
{
  self->_isInProgress = a3;
  if (!a3)
  {
    id v3 = [(MCActivityViewController *)self longWaitingWarningLabel];
    [v3 setHidden:1];
  }
}

- (void)setCompletionText:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_completionText, "isEqualToString:"))
  {
    double v4 = (NSString *)[v8 copy];
    completionText = self->_completionText;
    self->_completionText = v4;
  }
  if (![(MCActivityViewController *)self isInProgress])
  {
    id v6 = self->_completionText;
    double v7 = [(MCActivityViewController *)self textLabel];
    [v7 setText:v6];
  }
}

- (UIActivityIndicatorView)spinnerView
{
  spinnerView = self->_spinnerView;
  if (!spinnerView)
  {
    double v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    double v5 = self->_spinnerView;
    self->_spinnerView = v4;

    spinnerView = self->_spinnerView;
  }
  return spinnerView;
}

- (UIImageView)completionIconImageView
{
  completionIconImageView = self->_completionIconImageView;
  if (!completionIconImageView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.circle.fill"];
    id v6 = (UIImageView *)[v4 initWithImage:v5];

    double v7 = [MEMORY[0x1E4F428B8] DMCProfileVerifiedColor];
    [(UIImageView *)v6 setTintColor:v7];

    id v8 = [(UIImageView *)v6 image];
    v9 = [v8 imageWithRenderingMode:2];
    [(UIImageView *)v6 setImage:v9];

    [(UIImageView *)v6 setContentMode:1];
    [(UIImageView *)v6 setAlpha:0.0];
    double v10 = self->_completionIconImageView;
    self->_completionIconImageView = v6;

    completionIconImageView = self->_completionIconImageView;
  }
  return completionIconImageView;
}

- (UILabel)textLabel
{
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    double v5 = self->_textLabel;
    self->_textLabel = v4;

    [(UILabel *)self->_textLabel setLineBreakMode:0];
    [(UILabel *)self->_textLabel setNumberOfLines:0];
    [(UILabel *)self->_textLabel setTextAlignment:1];
    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (UILabel)longWaitingWarningLabel
{
  longWaitingWarningLabel = self->_longWaitingWarningLabel;
  if (!longWaitingWarningLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    double v5 = self->_longWaitingWarningLabel;
    self->_longWaitingWarningLabel = v4;

    [(UILabel *)self->_longWaitingWarningLabel setLineBreakMode:0];
    [(UILabel *)self->_longWaitingWarningLabel setNumberOfLines:0];
    [(UILabel *)self->_longWaitingWarningLabel setTextAlignment:1];
    id v6 = self->_longWaitingWarningLabel;
    double v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)self->_longWaitingWarningLabel setHidden:1];
    longWaitingWarningLabel = self->_longWaitingWarningLabel;
  }
  return longWaitingWarningLabel;
}

- (void)_scheduleLongWaitingWarning
{
  objc_initWeak(&location, self);
  [(MCActivityViewController *)self longWaitingWarningThreshold];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MCActivityViewController__scheduleLongWaitingWarning__block_invoke;
  v5[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __55__MCActivityViewController__scheduleLongWaitingWarning__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v7 = WeakRetained;
    if ([WeakRetained isInProgress])
    {
      v2 = [v7 longWaitingWarningText];
      double v3 = [v7 longWaitingWarningLabel];
      [v3 setText:v2];

      dispatch_time_t v4 = [v7 longWaitingWarningLabel];
      [v4 setHidden:0];

      double v5 = [v7 view];
      [v5 setNeedsLayout];
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (NSString)inProgresText
{
  return self->_inProgresText;
}

- (NSString)completionText
{
  return self->_completionText;
}

- (NSString)longWaitingWarningText
{
  return self->_longWaitingWarningText;
}

- (void)setLongWaitingWarningText:(id)a3
{
}

- (double)longWaitingWarningThreshold
{
  return self->_longWaitingWarningThreshold;
}

- (void)setLongWaitingWarningThreshold:(double)a3
{
  self->_longWaitingWarningThreshold = a3;
}

- (void)setSpinnerView:(id)a3
{
}

- (void)setCompletionIconImageView:(id)a3
{
}

- (void)setTextLabel:(id)a3
{
}

- (void)setLongWaitingWarningLabel:(id)a3
{
}

- (BOOL)isInProgress
{
  return self->_isInProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longWaitingWarningLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_completionIconImageView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_longWaitingWarningText, 0);
  objc_storeStrong((id *)&self->_completionText, 0);
  objc_storeStrong((id *)&self->_inProgresText, 0);
}

@end