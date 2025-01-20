@interface ASCMiniProductPagePresenter
- (ASCLockup)lockup;
- (ASCMiniProductPagePresenter)initWithView:(id)a3 lockupPresenter:(id)a4;
- (ASCMiniProductPagePresenterView)view;
- (NSString)description;
- (void)dealloc;
- (void)lockupPresenterDidChange:(id)a3;
- (void)setAgeRating:(id)a3;
- (void)setDescription:(id)a3;
- (void)setLockup:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation ASCMiniProductPagePresenter

- (ASCMiniProductPagePresenter)initWithView:(id)a3 lockupPresenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASCMiniProductPagePresenter;
  v8 = [(ASCMiniProductPagePresenter *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    v10 = [v7 lockup];
    uint64_t v11 = [v10 copy];
    lockup = v9->_lockup;
    v9->_lockup = (ASCLockup *)v11;

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v9 selector:sel_lockupPresenterDidChange_ name:0x1F1E03F58 object:v7];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCMiniProductPagePresenter;
  [(ASCMiniProductPagePresenter *)&v4 dealloc];
}

- (void)lockupPresenterDidChange:(id)a3
{
  id v5 = [a3 object];
  objc_super v4 = [v5 lockup];
  [(ASCMiniProductPagePresenter *)self setLockup:v4];
}

- (void)setLockup:(id)a3
{
  objc_super v4 = (ASCLockup *)a3;
  lockup = self->_lockup;
  v17 = v4;
  if (v4 && lockup)
  {
    BOOL v6 = [(ASCLockup *)lockup isEqual:v4];
    objc_super v4 = v17;
    if (v6) {
      goto LABEL_11;
    }
  }
  else if (lockup == v4)
  {
    goto LABEL_11;
  }
  id v7 = (ASCLockup *)[(ASCLockup *)v4 copy];
  v8 = self->_lockup;
  self->_lockup = v7;

  if (v17)
  {
    v9 = [(ASCLockup *)v17 productPageMetadata];
    [(ASCMiniProductPagePresenter *)self setMetadata:v9];

    v10 = [(ASCLockup *)v17 productPageDescription];
    [(ASCMiniProductPagePresenter *)self setDescription:v10];

    uint64_t v11 = [(ASCLockup *)v17 ageRating];
    [(ASCMiniProductPagePresenter *)self setAgeRating:v11];

    uint64_t v12 = [(ASCLockup *)v17 developerName];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [(ASCLockup *)v17 developerName];
      uint64_t v15 = [v14 length];

      if (v15)
      {
        v16 = [(ASCLockup *)v17 developerName];
        [(ASCMiniProductPagePresenter *)self setSubtitle:v16];
      }
    }
  }
  else
  {
    [(ASCMiniProductPagePresenter *)self setMetadata:0];
    [(ASCMiniProductPagePresenter *)self setDescription:0];
    [(ASCMiniProductPagePresenter *)self setAgeRating:0];
  }
LABEL_11:

  MEMORY[0x1F41817F8]();
}

- (void)setSubtitle:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(ASCMiniProductPagePresenter *)self view];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(ASCMiniProductPagePresenter *)self view];
    [v6 setSubtitle:v7];
  }
}

- (void)setMetadata:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(ASCMiniProductPagePresenter *)self view];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(ASCMiniProductPagePresenter *)self view];
    [v6 setMetadata:v7];
  }
}

- (NSString)description
{
  return [(ASCLockup *)self->_lockup productPageDescription];
}

- (void)setDescription:(id)a3
{
  id v8 = a3;
  objc_super v4 = [(ASCMiniProductPagePresenter *)self view];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(ASCMiniProductPagePresenter *)self view];
    id v7 = [v8 collapsingNewlines];
    [v6 setDescription:v7];
  }
}

- (void)setAgeRating:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(ASCMiniProductPagePresenter *)self view];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(ASCMiniProductPagePresenter *)self view];
    [v6 setAgeRating:v7];
  }
}

- (ASCMiniProductPagePresenterView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (ASCMiniProductPagePresenterView *)WeakRetained;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockup, 0);

  objc_destroyWeak((id *)&self->_view);
}

@end