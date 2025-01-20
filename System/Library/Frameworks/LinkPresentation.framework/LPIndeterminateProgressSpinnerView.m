@interface LPIndeterminateProgressSpinnerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPIndeterminateProgressSpinnerView)initWithHost:(id)a3 style:(id)a4 properties:(id)a5;
- (void)ensureIndicatorView;
- (void)ensureURLLabel;
- (void)layoutComponentView;
@end

@implementation LPIndeterminateProgressSpinnerView

- (LPIndeterminateProgressSpinnerView)initWithHost:(id)a3 style:(id)a4 properties:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LPIndeterminateProgressSpinnerView;
  v11 = [(LPComponentView *)&v15 initWithHost:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_style, a4);
    objc_storeStrong((id *)&v12->_properties, a5);
    v13 = v12;
  }

  return v12;
}

- (void)ensureIndicatorView
{
  p_indicatorView = &self->_indicatorView;
  if (!self->_indicatorView)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__LPIndeterminateProgressSpinnerView_ensureIndicatorView__block_invoke;
    v7[3] = &unk_1E5B059C8;
    v7[4] = self;
    v4 = [[LPUIActivityIndicatorView alloc] initWithActivityIndicatorStyle:__57__LPIndeterminateProgressSpinnerView_ensureIndicatorView__block_invoke((uint64_t)v7)];
    v5 = [(LPIndeterminateProgressSpinnerStyle *)self->_style indicatorColor];

    if (v5)
    {
      v6 = [(LPIndeterminateProgressSpinnerStyle *)self->_style indicatorColor];
      [(LPUIActivityIndicatorView *)v4 setColor:v6];
    }
    [(LPUIActivityIndicatorView *)v4 startAnimating];
    objc_storeStrong((id *)p_indicatorView, v4);
    [(LPIndeterminateProgressSpinnerView *)self addSubview:*p_indicatorView];
  }
}

uint64_t __57__LPIndeterminateProgressSpinnerView_ensureIndicatorView__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 432) indicatorColor];
  if (v2)
  {
    v3 = (void *)v2;
    char v4 = [*(id *)(*(void *)(a1 + 32) + 432) useLargeIndicatorStyle];

    if (v4) {
      return 10;
    }
  }
  v6 = [*(id *)(*(void *)(a1 + 32) + 432) indicatorColor];

  if (v6) {
    return 9;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 432) useLargeIndicatorStyle]) {
    return 101;
  }
  return 100;
}

- (void)ensureURLLabel
{
  if (!self->_text)
  {
    v3 = [(LPIndeterminateProgressSpinnerPresentationProperties *)self->_properties text];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      v5 = [LPTextView alloc];
      v6 = [(LPComponentView *)self host];
      id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
      v8 = [(LPIndeterminateProgressSpinnerPresentationProperties *)self->_properties text];
      id v9 = (void *)[v7 initWithString:v8];
      id v10 = [(LPIndeterminateProgressSpinnerStyle *)self->_style label];
      v11 = [(LPTextView *)v5 initWithHost:v6 text:v9 style:v10];
      text = self->_text;
      self->_text = v11;

      v13 = self->_text;
      [(LPIndeterminateProgressSpinnerView *)self addSubview:v13];
    }
  }
}

- (void)layoutComponentView
{
  [(LPIndeterminateProgressSpinnerView *)self ensureIndicatorView];
  [(LPIndeterminateProgressSpinnerView *)self ensureURLLabel];
  [(LPIndeterminateProgressSpinnerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIActivityIndicatorView *)self->_indicatorView bounds];
  double v8 = v7;
  double v10 = v9;
  text = self->_text;
  [(LPIndeterminateProgressSpinnerView *)self bounds];
  -[LPTextView sizeThatFits:](text, "sizeThatFits:", v12, v13);
  double v15 = v14;
  double v17 = v16;
  if (self->_text)
  {
    v18 = [(LPIndeterminateProgressSpinnerStyle *)self->_style spacing];
    [v18 value];
    double v20 = v19 * 0.5;
  }
  else
  {
    double v20 = 0.0;
  }
  double v33 = v15;
  v21 = [(LPIndeterminateProgressSpinnerStyle *)self->_style verticalOffset];
  [v21 value];
  double v22 = v6 - v10;
  double v23 = v4;
  double v24 = (v4 - v8) * 0.5;
  double v25 = v10;
  double v26 = v8;
  double v28 = v22 * 0.5 - v17 * 0.5 + v20 + v27;

  -[UIActivityIndicatorView setFrame:](self->_indicatorView, "setFrame:", v24, v28, v26, v25);
  v29 = [(LPIndeterminateProgressSpinnerStyle *)self->_style verticalOffset];
  [v29 value];
  double v31 = v25 * 0.5 + (v6 - v17) * 0.5 + v20 + v30;

  v32 = self->_text;

  -[LPTextView setFrame:](v32, "setFrame:", (v23 - v33) * 0.5, v31, v33, v17);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(LPIndeterminateProgressSpinnerView *)self traitCollection];
  if ([v6 userInterfaceIdiom] == 6)
  {
    double v7 = [(LPIndeterminateProgressSpinnerPresentationProperties *)self->_properties text];
    uint64_t v8 = [v7 length];

    if (!v8)
    {
      double v9 = 64.0;
      double v10 = 64.0;
      goto LABEL_9;
    }
  }
  else
  {
  }
  [(LPIndeterminateProgressSpinnerView *)self ensureIndicatorView];
  [(LPIndeterminateProgressSpinnerView *)self ensureURLLabel];
  -[LPTextView sizeThatFits:](self->_text, "sizeThatFits:", width, height);
  double v12 = v11;
  double v14 = v13;
  -[UIActivityIndicatorView sizeThatFits:](self->_indicatorView, "sizeThatFits:", width, height);
  double v16 = v15;
  double v18 = v17;
  if (self->_text)
  {
    double v19 = [(LPIndeterminateProgressSpinnerStyle *)self->_style spacing];
    [v19 value];
    double v21 = v20;
  }
  else
  {
    double v21 = 0.0;
  }
  double v22 = [(LPIndeterminateProgressSpinnerStyle *)self->_style padding];
  double v23 = [v22 leading];
  [v23 value];
  double v25 = v24;
  double v26 = [(LPIndeterminateProgressSpinnerStyle *)self->_style padding];
  double v27 = [v26 trailing];
  [v27 value];
  double v29 = v28;

  double v30 = [(LPIndeterminateProgressSpinnerStyle *)self->_style padding];
  double v31 = [v30 top];
  [v31 value];
  double v33 = v32;
  v34 = [(LPIndeterminateProgressSpinnerStyle *)self->_style padding];
  v35 = [v34 bottom];
  [v35 value];
  double v9 = v12 + v16 + v25 + v29;
  double v10 = v14 + v18 + v21 + v33 + v36;

LABEL_9:
  double v37 = v9;
  double v38 = v10;
  result.double height = v38;
  result.double width = v37;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_indicatorView, 0);
}

@end