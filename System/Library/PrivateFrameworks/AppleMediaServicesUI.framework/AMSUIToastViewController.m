@interface AMSUIToastViewController
- (AMSUIToastAppearance)preferredAppearance;
- (AMSUIToastAppearance)requestAppearance;
- (AMSUIToastTransitioningDelegate)transitionDelegate;
- (AMSUIToastViewController)initWithRequest:(id)a3;
- (AMSUIToastViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (id)_effectiveImageSymbolConfiguration;
- (id)_messageFontCompatibleWith:(id)a3;
- (id)_messageTextColor;
- (id)_titleFontCompatibleWith:(id)a3;
- (id)_titleTextColor;
- (int64_t)_iconAnimationPlayCount;
- (int64_t)_primaryImageRenderingMode;
- (unint64_t)_messageStyle;
- (void)_commitAppearance;
- (void)_setDialogRequest:(id)a3;
- (void)setPreferredAppearance:(id)a3;
- (void)setRequestAppearance:(id)a3;
- (void)setTransitionDelegate:(id)a3;
@end

@implementation AMSUIToastViewController

- (AMSUIToastViewController)initWithRequest:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIToastViewController;
  v5 = [(AMSUIBaseMessageViewController *)&v16 initWithRequest:v4];
  if (v5)
  {
    v6 = objc_alloc_init(AMSUIToastAppearance);
    preferredAppearance = v5->_preferredAppearance;
    v5->_preferredAppearance = v6;

    v8 = [AMSUIToastAppearance alloc];
    v9 = [v4 appearanceInfo];
    uint64_t v10 = [(AMSUIToastAppearance *)v8 initWithDictionary:v9];
    requestAppearance = v5->_requestAppearance;
    v5->_requestAppearance = (AMSUIToastAppearance *)v10;

    v12 = objc_alloc_init(AMSUIToastTransitioningDelegate);
    transitionDelegate = v5->_transitionDelegate;
    v5->_transitionDelegate = v12;

    [(AMSUIToastViewController *)v5 setModalPresentationStyle:4];
    v14 = [(AMSUIToastViewController *)v5 transitionDelegate];
    [(AMSUIToastViewController *)v5 setTransitioningDelegate:v14];

    [(AMSUIToastViewController *)v5 setViewRespectsSystemMinimumLayoutMargins:0];
  }

  return v5;
}

- (AMSUIToastViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIToastViewController;
  return [(AMSUIBaseMessageViewController *)&v6 initWithRequest:a3 bag:a4 account:a5];
}

- (void)_setDialogRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIToastViewController;
  [(AMSUIBaseMessageViewController *)&v9 _setDialogRequest:v4];
  v5 = [(AMSUIBaseMessageViewController *)self _messageView];
  objc_super v6 = [v4 buttonActions];
  uint64_t v7 = [v6 firstObject];
  if (v7)
  {
    v8 = (void *)v7;

LABEL_4:
    [v5 setAccessoryViewForDialogAction:v8 target:self action:sel__didTapActionButton_];

    goto LABEL_5;
  }
  v8 = [v4 defaultAction];

  if (v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (id)_messageFontCompatibleWith:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIToastViewController *)self requestAppearance];
  objc_super v6 = [v5 _messageFontDictionary];
  uint64_t v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIToastViewController *)self requestAppearance];
    id v9 = [v10 messageFont];
  }
  if (!v9)
  {
    v11 = [(AMSUIToastViewController *)self preferredAppearance];
    v12 = [v11 _messageFontDictionary];
    v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      v15 = [(AMSUIToastViewController *)self preferredAppearance];
      id v9 = [v15 messageFont];
    }
  }

  return v9;
}

- (id)_messageTextColor
{
  v3 = [(AMSUIToastViewController *)self requestAppearance];
  id v4 = [v3 messageTextColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(AMSUIToastViewController *)self preferredAppearance];
    id v6 = [v7 messageTextColor];
  }
  return v6;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIToastViewController *)self requestAppearance];
  id v6 = [v5 _titleFontDictionary];
  uint64_t v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIToastViewController *)self requestAppearance];
    id v9 = [v10 titleFont];
  }
  if (!v9)
  {
    v11 = [(AMSUIToastViewController *)self preferredAppearance];
    v12 = [v11 _titleFontDictionary];
    v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      v15 = [(AMSUIToastViewController *)self preferredAppearance];
      id v9 = [v15 titleFont];
    }
  }

  return v9;
}

- (id)_titleTextColor
{
  v3 = [(AMSUIToastViewController *)self requestAppearance];
  id v4 = [v3 titleTextColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(AMSUIToastViewController *)self preferredAppearance];
    id v6 = [v7 titleTextColor];
  }
  return v6;
}

- (void)_commitAppearance
{
  id v4 = [(AMSUIToastViewController *)self viewIfLoaded];

  if (!v4) {
    return;
  }
  id v30 = [(AMSUIBaseMessageViewController *)self _messageView];
  v5 = [(AMSUIToastViewController *)self requestAppearance];
  id v6 = [v5 accessoryButtonColor];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(AMSUIToastViewController *)self preferredAppearance];
    id v8 = [v9 accessoryButtonColor];
  }
  uint64_t v10 = [v30 accessoryView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v11 && v8) {
    [v11 setPreferredForegroundColor:v8];
  }
  v12 = [(AMSUIToastViewController *)self requestAppearance];
  uint64_t v13 = [v12 accessoryButtonFont];
  if (v13)
  {
    v14 = (void *)v13;
  }
  else
  {
    v2 = [(AMSUIToastViewController *)self preferredAppearance];
    v14 = [v2 accessoryButtonFont];

    if (!v14) {
      goto LABEL_16;
    }
  }
  [v11 setPreferredFont:v14];

LABEL_16:
  v15 = [(AMSUIToastViewController *)self requestAppearance];
  uint64_t v16 = [v15 backgroundColor];
  if (v16)
  {
    v17 = (void *)v16;
  }
  else
  {
    v2 = [(AMSUIToastViewController *)self preferredAppearance];
    v17 = [v2 backgroundColor];

    if (!v17) {
      goto LABEL_20;
    }
  }
  [v30 setBackgroundColor:v17];

LABEL_20:
  v18 = [(AMSUIToastViewController *)self requestAppearance];
  v19 = [v18 backgroundImage];
  v20 = v19;
  if (!v19)
  {
    v2 = [(AMSUIToastViewController *)self preferredAppearance];
    v20 = [v2 backgroundImage];
  }
  v21 = [v30 backgroundImageView];
  [v21 setImage:v20];

  if (!v19)
  {
  }
  v22 = [(AMSUIToastViewController *)self requestAppearance];
  uint64_t v23 = [v22 imageTintColor];
  if (v23)
  {
    v24 = (void *)v23;

LABEL_27:
    [v30 setIconColor:v24];

    goto LABEL_28;
  }
  v25 = [(AMSUIToastViewController *)self preferredAppearance];
  v24 = [v25 imageTintColor];

  if (v24) {
    goto LABEL_27;
  }
LABEL_28:
  v26 = [(AMSUIBaseMessageViewController *)self _loadedImage];

  if (v26)
  {
    v27 = [(AMSUIBaseMessageViewController *)self _loadedImage];
    v28 = objc_msgSend(v27, "ams_imageWithRenderingMode:", -[AMSUIToastViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v29 = [v30 imageView];
    [v29 setImage:v28];
  }
  [(AMSUIBaseMessageViewController *)self _updateTextWithAttributes];
  [v11 commitAppearance];
}

- (int64_t)_iconAnimationPlayCount
{
  int64_t v3 = 1;
  uint64_t v4 = [(AMSUIToastViewController *)self preferredAppearance];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(AMSUIToastViewController *)self preferredAppearance];
    uint64_t v7 = [v6 iconAnimationPlayCount];

    if (v7 != -90)
    {
      id v8 = [(AMSUIToastViewController *)self preferredAppearance];
      int64_t v3 = [v8 iconAnimationPlayCount];
    }
  }
  uint64_t v9 = [(AMSUIToastViewController *)self requestAppearance];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    id v11 = [(AMSUIToastViewController *)self requestAppearance];
    uint64_t v12 = [v11 iconAnimationPlayCount];

    if (v12 != -90)
    {
      uint64_t v13 = [(AMSUIToastViewController *)self requestAppearance];
      int64_t v3 = [v13 iconAnimationPlayCount];
    }
  }
  return v3;
}

- (id)_effectiveImageSymbolConfiguration
{
  int64_t v3 = [(AMSUIToastViewController *)self preferredAppearance];
  uint64_t v4 = [v3 imageSymbolConfiguration];

  v5 = [(AMSUIToastViewController *)self requestAppearance];
  id v6 = [v5 imageSymbolConfiguration];
  if (v4)
  {
    uint64_t v7 = [v4 configurationByApplyingConfiguration:v6];

    id v6 = (void *)v7;
  }

  return v6;
}

- (unint64_t)_messageStyle
{
  return 4;
}

- (AMSUIToastAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  [(AMSUIToastViewController *)self _commitAppearance];
}

- (int64_t)_primaryImageRenderingMode
{
  int64_t v3 = [(AMSUIToastViewController *)self preferredAppearance];
  int64_t v4 = [v3 primaryImageRenderingMode];

  v5 = [(AMSUIToastViewController *)self requestAppearance];
  uint64_t v6 = [v5 primaryImageRenderingMode];

  if (v6)
  {
    uint64_t v7 = [(AMSUIToastViewController *)self requestAppearance];
    int64_t v4 = [v7 primaryImageRenderingMode];
  }
  return v4;
}

- (AMSUIToastAppearance)requestAppearance
{
  return self->_requestAppearance;
}

- (void)setRequestAppearance:(id)a3
{
}

- (AMSUIToastTransitioningDelegate)transitionDelegate
{
  return self->_transitionDelegate;
}

- (void)setTransitionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionDelegate, 0);
  objc_storeStrong((id *)&self->_requestAppearance, 0);
  objc_storeStrong((id *)&self->_preferredAppearance, 0);
}

@end