@interface GKNoContentView
- (BOOL)isLoading;
- (GKNoContentView)initWithFrame:(CGRect)a3;
- (GKUIContentUnavailableView)contentUnavailableView;
- (NSString)buttonTitle;
- (NSString)message;
- (NSString)title;
- (UIActivityIndicatorView)loadingIndicatorView;
- (UIStackView)stackView;
- (id)buttonAction;
- (void)setButtonAction:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setContentUnavailableView:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLoadingIndicatorView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation GKNoContentView

- (GKNoContentView)initWithFrame:(CGRect)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)GKNoContentView;
  v3 = -[GKNoContentView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [GKUIContentUnavailableView alloc];
    uint64_t v5 = -[_UIContentUnavailableView initWithFrame:title:style:](v4, "initWithFrame:title:style:", 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    contentUnavailableView = v3->_contentUnavailableView;
    v3->_contentUnavailableView = (GKUIContentUnavailableView *)v5;

    objc_initWeak(&location, v3);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __33__GKNoContentView_initWithFrame___block_invoke;
    v27[3] = &unk_1E5F634E8;
    objc_copyWeak(&v28, &location);
    [(_UIContentUnavailableView *)v3->_contentUnavailableView setButtonAction:v27];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:0];
    loadingIndicatorView = v3->_loadingIndicatorView;
    v3->_loadingIndicatorView = (UIActivityIndicatorView *)v7;

    v9 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    stackView = v3->_stackView;
    v3->_stackView = v9;

    [(UIStackView *)v3->_stackView setAlignment:0];
    [(UIStackView *)v3->_stackView setAxis:1];
    v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIActivityIndicatorView *)v3->_loadingIndicatorView setColor:v11];

    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_loadingIndicatorView];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_contentUnavailableView];
    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKNoContentView *)v3 addSubview:v3->_stackView];
    v26 = [(UIStackView *)v3->_stackView centerXAnchor];
    v25 = [(GKNoContentView *)v3 centerXAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v31[0] = v24;
    v23 = [(UIStackView *)v3->_stackView centerYAnchor];
    v22 = [(GKNoContentView *)v3 centerYAnchor];
    v12 = [v23 constraintEqualToAnchor:v22];
    v31[1] = v12;
    v13 = [(UIStackView *)v3->_stackView widthAnchor];
    v14 = [(GKNoContentView *)v3 widthAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v31[2] = v15;
    v16 = [(GKUIContentUnavailableView *)v3->_contentUnavailableView widthAnchor];
    v17 = [(GKNoContentView *)v3 stackView];
    v18 = [v17 widthAnchor];
    v19 = [v16 constraintEqualToAnchor:v18];
    v31[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];

    [(GKNoContentView *)v3 addConstraints:v20];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __33__GKNoContentView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained buttonAction];

    id WeakRetained = v4;
    if (v2)
    {
      v3 = [v4 buttonAction];
      ((void (**)(void, id))v3)[2](v3, v4);

      id WeakRetained = v4;
    }
  }
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(_UIContentUnavailableView *)self->_contentUnavailableView title];
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return [(_UIContentUnavailableView *)self->_contentUnavailableView message];
}

- (void)setButtonTitle:(id)a3
{
}

- (NSString)buttonTitle
{
  return [(_UIContentUnavailableView *)self->_contentUnavailableView buttonTitle];
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    BOOL v3 = a3;
    self->_loading = a3;
    uint64_t v5 = [(GKNoContentView *)self loadingIndicatorView];
    v6 = v5;
    if (v3) {
      [v5 startAnimating];
    }
    else {
      [v5 stopAnimating];
    }

    id v7 = [(GKNoContentView *)self stackView];
    [v7 layoutIfNeeded];
  }
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (GKUIContentUnavailableView)contentUnavailableView
{
  return self->_contentUnavailableView;
}

- (void)setContentUnavailableView:(id)a3
{
}

- (UIActivityIndicatorView)loadingIndicatorView
{
  return self->_loadingIndicatorView;
}

- (void)setLoadingIndicatorView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);

  objc_storeStrong(&self->_buttonAction, 0);
}

@end