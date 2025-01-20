@interface ASCAdLockupPresenter
- (ASCAdLockupPresenter)initWithView:(id)a3 lockupPresenter:(id)a4;
- (ASCAdLockupPresenterView)view;
- (ASCLockup)lockup;
- (BOOL)shouldDisplayDescriptionForLockup:(id)a3;
- (void)dealloc;
- (void)lockupPresenterDidChange:(id)a3;
- (void)setAdTransparencyButtonHidden:(BOOL)a3;
- (void)setDeveloperName:(id)a3;
- (void)setEditorsChoice:(BOOL)a3;
- (void)setLockup:(id)a3;
- (void)setProductDescription:(id)a3;
- (void)setProductRating:(float)a3;
- (void)setProductRatingBadge:(id)a3;
@end

@implementation ASCAdLockupPresenter

- (ASCAdLockupPresenter)initWithView:(id)a3 lockupPresenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASCAdLockupPresenter;
  v9 = [(ASCAdLockupPresenter *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_view, a3);
    v11 = [v8 lockup];
    uint64_t v12 = [v11 copy];
    lockup = v10->_lockup;
    v10->_lockup = (ASCLockup *)v12;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v10 selector:sel_lockupPresenterDidChange_ name:0x1F1E03F58 object:v8];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCAdLockupPresenter;
  [(ASCAdLockupPresenter *)&v4 dealloc];
}

- (void)lockupPresenterDidChange:(id)a3
{
  id v5 = [a3 object];
  objc_super v4 = [v5 lockup];
  [(ASCAdLockupPresenter *)self setLockup:v4];
}

- (void)setLockup:(id)a3
{
  objc_super v4 = (ASCLockup *)a3;
  lockup = self->_lockup;
  objc_super v16 = v4;
  if (!v4 || !lockup)
  {
    if (lockup == v4) {
      goto LABEL_18;
    }
LABEL_6:
    id v7 = (ASCLockup *)[(ASCLockup *)v4 copy];
    id v8 = self->_lockup;
    self->_lockup = v7;

    if (!v16)
    {
      [(ASCAdLockupPresenter *)self setEditorsChoice:0];
      [(ASCAdLockupPresenter *)self setProductRating:0.0];
      [(ASCAdLockupPresenter *)self setProductRatingBadge:0];
      [(ASCAdLockupPresenter *)self setProductDescription:0];
      [(ASCAdLockupPresenter *)self setAdTransparencyButtonHidden:1];
      [(ASCAdLockupPresenter *)self setDeveloperName:0];
      goto LABEL_18;
    }
    v9 = [(ASCLockup *)v16 offer];
    char v10 = [v9 flags];

    if ((v10 & 8) != 0)
    {
      v11 = self;
      uint64_t v12 = 0;
    }
    else
    {
      if (![(ASCLockup *)v16 isEditorsChoice])
      {
        [(ASCAdLockupPresenter *)self setEditorsChoice:0];
        [(ASCLockup *)v16 productRating];
        -[ASCAdLockupPresenter setProductRating:](self, "setProductRating:");
        v13 = [(ASCLockup *)v16 productRatingBadge];
        [(ASCAdLockupPresenter *)self setProductRatingBadge:v13];

        goto LABEL_14;
      }
      v11 = self;
      uint64_t v12 = 1;
    }
    [(ASCAdLockupPresenter *)v11 setEditorsChoice:v12];
    [(ASCAdLockupPresenter *)self setProductRating:0.0];
    [(ASCAdLockupPresenter *)self setProductRatingBadge:0];
LABEL_14:
    if ([(ASCAdLockupPresenter *)self shouldDisplayDescriptionForLockup:v16])
    {
      v14 = [(ASCLockup *)v16 productDescription];
      [(ASCAdLockupPresenter *)self setProductDescription:v14];
    }
    else
    {
      [(ASCAdLockupPresenter *)self setProductDescription:0];
    }
    [(ASCAdLockupPresenter *)self setAdTransparencyButtonHidden:0];
    v15 = [(ASCLockup *)v16 developerName];
    [(ASCAdLockupPresenter *)self setDeveloperName:v15];

    goto LABEL_18;
  }
  BOOL v6 = [(ASCLockup *)lockup isEqual:v4];
  objc_super v4 = v16;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_18:

  MEMORY[0x1F41817F8]();
}

- (void)setAdTransparencyButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCAdLockupPresenter *)self view];
  [v4 setAdTransparencyButtonHidden:v3];
}

- (void)setEditorsChoice:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ASCAdLockupPresenter *)self view];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ASCAdLockupPresenter *)self view];
    [v7 setEditorsChoice:v3];
  }
}

- (void)setProductRating:(float)a3
{
  id v5 = [(ASCAdLockupPresenter *)self view];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(ASCAdLockupPresenter *)self view];
    *(float *)&double v7 = a3;
    [v8 setProductRating:v7];
  }
}

- (void)setProductRatingBadge:(id)a3
{
  id v7 = a3;
  id v4 = [(ASCAdLockupPresenter *)self view];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(ASCAdLockupPresenter *)self view];
    [v6 setProductRatingBadge:v7];
  }
}

- (void)setProductDescription:(id)a3
{
  id v7 = a3;
  id v4 = [(ASCAdLockupPresenter *)self view];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(ASCAdLockupPresenter *)self view];
    [v6 setProductDescription:v7];
  }
}

- (void)setDeveloperName:(id)a3
{
  id v7 = a3;
  id v4 = [(ASCAdLockupPresenter *)self view];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(ASCAdLockupPresenter *)self view];
    [v6 setDeveloperName:v7];
  }
}

- (BOOL)shouldDisplayDescriptionForLockup:(id)a3
{
  return [a3 hasMedia] ^ 1;
}

- (ASCAdLockupPresenterView)view
{
  return self->_view;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockup, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end