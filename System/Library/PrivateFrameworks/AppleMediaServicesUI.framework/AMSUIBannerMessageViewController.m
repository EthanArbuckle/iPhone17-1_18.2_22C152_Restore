@interface AMSUIBannerMessageViewController
- (AMSUIBannerAppearance)preferredAppearance;
- (AMSUIBannerAppearance)requestAppearance;
- (AMSUIBannerMessageViewController)initWithRequest:(id)a3;
- (AMSUIBannerMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (id)_defaultPreferredImageSymbolConfiguration;
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
@end

@implementation AMSUIBannerMessageViewController

- (AMSUIBannerMessageViewController)initWithRequest:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIBannerMessageViewController;
  v5 = [(AMSUIBaseMessageViewController *)&v13 initWithRequest:v4];
  if (v5)
  {
    v6 = objc_alloc_init(AMSUIBannerAppearance);
    preferredAppearance = v5->_preferredAppearance;
    v5->_preferredAppearance = v6;

    v8 = [AMSUIBannerAppearance alloc];
    v9 = [v4 appearanceInfo];
    uint64_t v10 = [(AMSUIBannerAppearance *)v8 initWithDictionary:v9];
    requestAppearance = v5->_requestAppearance;
    v5->_requestAppearance = (AMSUIBannerAppearance *)v10;
  }
  return v5;
}

- (AMSUIBannerMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIBannerMessageViewController;
  return [(AMSUIBaseMessageViewController *)&v6 initWithRequest:a3 bag:a4 account:a5];
}

- (void)_setDialogRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AMSUIBannerMessageViewController;
  [(AMSUIBaseMessageViewController *)&v25 _setDialogRequest:v4];
  v5 = [(AMSUIBaseMessageViewController *)self _messageView];
  objc_super v6 = [v4 defaultAction];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = [v4 buttonActions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (!v8)
  {

    v11 = 0;
    uint64_t v10 = 0;
    if (!v6) {
      goto LABEL_24;
    }
LABEL_23:
    [v5 setBodyDialogAction:v6 target:self action:sel__didTapActionButton_];
    goto LABEL_24;
  }
  uint64_t v9 = v8;
  v20 = v5;
  uint64_t v10 = 0;
  v11 = 0;
  uint64_t v12 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (v11 || [*(id *)(*((void *)&v21 + 1) + 8 * i) style] != 2)
      {
        if (v10)
        {
          v16 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
          if (!v16)
          {
            v16 = [MEMORY[0x263F27CB8] sharedConfig];
          }
          v17 = [v16 OSLogObject];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v27 = v18;
            id v19 = v18;
            _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_INFO, "%{public}@: Warning ignoring extraneous action", buf, 0xCu);
          }
          goto LABEL_19;
        }
        uint64_t v10 = v14;
      }
      else
      {
        v11 = v14;
      }
      id v15 = v14;
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_19:

  if (v11)
  {
    v5 = v20;
    [v20 setAccessoryViewForDialogAction:v11 target:self action:sel__didTapActionButton_];
    if (!v6) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v5 = v20;
  if (v10) {
    [v20 setAccessoryViewForDialogAction:v10 target:self action:sel__didTapActionButton_];
  }
  v11 = 0;
  if (v6) {
    goto LABEL_23;
  }
LABEL_24:
}

- (id)_messageFontCompatibleWith:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  objc_super v6 = [v5 _messageFontDictionary];
  v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIBannerMessageViewController *)self requestAppearance];
    id v9 = [v10 messageFont];
  }
  if (!v9)
  {
    v11 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    uint64_t v12 = [v11 _messageFontDictionary];
    objc_super v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      id v15 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
      id v9 = [v15 messageFont];
    }
  }

  return v9;
}

- (id)_messageTextColor
{
  v3 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  id v4 = [v3 messageTextColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    id v6 = [v7 messageTextColor];
  }
  return v6;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  id v6 = [v5 _titleFontDictionary];
  v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIBannerMessageViewController *)self requestAppearance];
    id v9 = [v10 titleFont];
  }
  if (!v9)
  {
    v11 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    uint64_t v12 = [v11 _titleFontDictionary];
    objc_super v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      id v15 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
      id v9 = [v15 titleFont];
    }
  }

  return v9;
}

- (id)_titleTextColor
{
  v3 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  id v4 = [v3 titleTextColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    id v6 = [v7 titleTextColor];
  }
  return v6;
}

- (void)_commitAppearance
{
  id v4 = [(AMSUIBannerMessageViewController *)self viewIfLoaded];

  if (!v4) {
    return;
  }
  id v33 = [(AMSUIBaseMessageViewController *)self _messageView];
  v5 = [v33 accessoryView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  uint64_t v8 = [v7 accessoryButtonColor];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v2 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    id v10 = [v2 accessoryButtonColor];
  }
  if (v6 && v10) {
    [v6 setPreferredForegroundColor:v10];
  }
  v11 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  uint64_t v12 = [v11 accessoryButtonFont];
  if (v12)
  {
    objc_super v13 = (void *)v12;
  }
  else
  {
    v2 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    objc_super v13 = [v2 accessoryButtonFont];

    if (!v13) {
      goto LABEL_16;
    }
  }
  [v6 setPreferredFont:v13];

LABEL_16:
  v14 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  uint64_t v15 = [v14 backgroundColor];
  if (v15)
  {
    v16 = (void *)v15;
  }
  else
  {
    v2 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    v16 = [v2 backgroundColor];

    if (!v16) {
      goto LABEL_20;
    }
  }
  [v33 setBackgroundColor:v16];

LABEL_20:
  v17 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  v18 = [v17 backgroundImage];
  id v19 = v18;
  if (!v18)
  {
    v2 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    id v19 = [v2 backgroundImage];
  }
  v20 = [v33 backgroundImageView];
  [v20 setImage:v19];

  if (!v18)
  {
  }
  long long v21 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  uint64_t v22 = [v21 imageTintColor];
  if (v22)
  {
    long long v23 = (void *)v22;
  }
  else
  {
    long long v24 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    long long v23 = [v24 imageTintColor];

    if (!v23) {
      goto LABEL_28;
    }
  }
  [v33 setIconColor:v23];

LABEL_28:
  objc_super v25 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  uint64_t v26 = [v25 separatorColor];
  if (v26)
  {
    v27 = (void *)v26;

LABEL_31:
    [v33 setSeparatorColor:v27];

    goto LABEL_32;
  }
  v28 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
  v27 = [v28 separatorColor];

  if (v27) {
    goto LABEL_31;
  }
LABEL_32:
  uint64_t v29 = [(AMSUIBaseMessageViewController *)self _loadedImage];

  if (v29)
  {
    v30 = [(AMSUIBaseMessageViewController *)self _loadedImage];
    v31 = objc_msgSend(v30, "ams_imageWithRenderingMode:", -[AMSUIBannerMessageViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v32 = [v33 imageView];
    [v32 setImage:v31];
  }
  [(AMSUIBaseMessageViewController *)self _updateTextWithAttributes];
  [v6 commitAppearance];
}

- (int64_t)_iconAnimationPlayCount
{
  int64_t v3 = 1;
  uint64_t v4 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
    uint64_t v7 = [v6 iconAnimationPlayCount];

    if (v7 != -90)
    {
      uint64_t v8 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
      int64_t v3 = [v8 iconAnimationPlayCount];
    }
  }
  uint64_t v9 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  if (v9)
  {
    id v10 = (void *)v9;
    v11 = [(AMSUIBannerMessageViewController *)self requestAppearance];
    uint64_t v12 = [v11 iconAnimationPlayCount];

    if (v12 != -90)
    {
      objc_super v13 = [(AMSUIBannerMessageViewController *)self requestAppearance];
      int64_t v3 = [v13 iconAnimationPlayCount];
    }
  }
  return v3;
}

- (id)_defaultPreferredImageSymbolConfiguration
{
  v2 = [(AMSUIBannerMessageViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 5)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F835E0] scale:2];
  }
  return v4;
}

- (id)_effectiveImageSymbolConfiguration
{
  uint64_t v3 = [(AMSUIBannerMessageViewController *)self _defaultPreferredImageSymbolConfiguration];
  uint64_t v4 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
  v5 = [v4 imageSymbolConfiguration];
  id v6 = [v3 configurationByApplyingConfiguration:v5];
  uint64_t v7 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  uint64_t v8 = [v7 imageSymbolConfiguration];
  uint64_t v9 = [v6 configurationByApplyingConfiguration:v8];

  return v9;
}

- (unint64_t)_messageStyle
{
  return 1;
}

- (AMSUIBannerAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  [(AMSUIBannerMessageViewController *)self _commitAppearance];
}

- (int64_t)_primaryImageRenderingMode
{
  uint64_t v3 = [(AMSUIBannerMessageViewController *)self preferredAppearance];
  int64_t v4 = [v3 primaryImageRenderingMode];

  v5 = [(AMSUIBannerMessageViewController *)self requestAppearance];
  uint64_t v6 = [v5 primaryImageRenderingMode];

  if (v6)
  {
    uint64_t v7 = [(AMSUIBannerMessageViewController *)self requestAppearance];
    int64_t v4 = [v7 primaryImageRenderingMode];
  }
  return v4;
}

- (AMSUIBannerAppearance)requestAppearance
{
  return self->_requestAppearance;
}

- (void)setRequestAppearance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAppearance, 0);
  objc_storeStrong((id *)&self->_preferredAppearance, 0);
}

@end