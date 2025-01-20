@interface AMSUIDashboardMessageViewController
- (AMSUIDashboardMessageAppearance)preferredAppearance;
- (AMSUIDashboardMessageAppearance)requestAppearance;
- (AMSUIDashboardMessageViewController)initWithRequest:(id)a3;
- (AMSUIDashboardMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
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

@implementation AMSUIDashboardMessageViewController

- (AMSUIDashboardMessageViewController)initWithRequest:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIDashboardMessageViewController;
  v5 = [(AMSUIBaseMessageViewController *)&v13 initWithRequest:v4];
  if (v5)
  {
    v6 = objc_alloc_init(AMSUIDashboardMessageAppearance);
    preferredAppearance = v5->_preferredAppearance;
    v5->_preferredAppearance = v6;

    v8 = [AMSUIDashboardMessageAppearance alloc];
    v9 = [v4 appearanceInfo];
    uint64_t v10 = [(AMSUIDashboardMessageAppearance *)v8 initWithDictionary:v9];
    requestAppearance = v5->_requestAppearance;
    v5->_requestAppearance = (AMSUIDashboardMessageAppearance *)v10;
  }
  return v5;
}

- (AMSUIDashboardMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIDashboardMessageViewController;
  return [(AMSUIBaseMessageViewController *)&v6 initWithRequest:a3 bag:a4 account:a5];
}

- (void)_setDialogRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AMSUIDashboardMessageViewController;
  [(AMSUIBaseMessageViewController *)&v25 _setDialogRequest:v4];
  v20 = self;
  v18 = [(AMSUIBaseMessageViewController *)self _messageView];
  v17 = [v4 defaultAction];
  v5 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v19 = v4;
  objc_super v6 = [v4 buttonActions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v9 || [*(id *)(*((void *)&v21 + 1) + 8 * i) style] != 2)
        {
          if ((unint64_t)[v5 count] > 1)
          {
            objc_super v13 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
            if (!v13)
            {
              objc_super v13 = [MEMORY[0x263F27CB8] sharedConfig];
            }
            v14 = [v13 OSLogObject];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v15 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v27 = v15;
              id v16 = v15;
              _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_INFO, "%{public}@: Warning ignoring extraneous action", buf, 0xCu);
            }
          }
          else
          {
            [v5 addObject:v12];
          }
        }
        else
        {
          id v9 = v12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  if (v17) {
    [v18 setBodyDialogAction:v17 target:v20 action:sel__didTapActionButton_];
  }
  if (v9) {
    [v18 setAccessoryViewForDialogAction:v9 target:v20 action:sel__didTapActionButton_];
  }
  if ([v5 count]) {
    [v18 setFooterForDialogActions:v5 target:v20 action:sel__didTapActionButton_];
  }
}

- (id)_messageFontCompatibleWith:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  objc_super v6 = [v5 _messageFontDictionary];
  uint64_t v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
    id v9 = [v10 messageFont];
  }
  if (!v9)
  {
    v11 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    v12 = [v11 _messageFontDictionary];
    objc_super v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      v15 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
      id v9 = [v15 messageFont];
    }
  }

  return v9;
}

- (id)_messageTextColor
{
  v3 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  id v4 = [v3 messageTextColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    id v6 = [v7 messageTextColor];
  }
  return v6;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  id v6 = [v5 _titleFontDictionary];
  uint64_t v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
    id v9 = [v10 titleFont];
  }
  if (!v9)
  {
    v11 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    v12 = [v11 _titleFontDictionary];
    objc_super v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      v15 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
      id v9 = [v15 titleFont];
    }
  }

  return v9;
}

- (id)_titleTextColor
{
  v3 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  id v4 = [v3 titleTextColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    id v6 = [v7 titleTextColor];
  }
  return v6;
}

- (void)_commitAppearance
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = [(AMSUIDashboardMessageViewController *)self viewIfLoaded];

  if (!v4) {
    return;
  }
  v5 = [(AMSUIBaseMessageViewController *)self _messageView];
  id v6 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  uint64_t v7 = [v6 accessoryButtonColor];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    id v9 = [v10 accessoryButtonColor];
  }
  v11 = [v5 accessoryView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12 && v9) {
    [v12 setPreferredForegroundColor:v9];
  }
  objc_super v13 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  uint64_t v14 = [v13 accessoryButtonFont];
  if (v14)
  {
    v15 = (void *)v14;
  }
  else
  {
    v2 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    v15 = [v2 accessoryButtonFont];

    if (!v15) {
      goto LABEL_15;
    }
  }
  [v12 setPreferredFont:v15];

LABEL_15:
  id v16 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  uint64_t v17 = [v16 backgroundColor];
  if (v17)
  {
    v18 = (void *)v17;
  }
  else
  {
    v2 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    v18 = [v2 backgroundColor];

    if (!v18) {
      goto LABEL_19;
    }
  }
  [v5 setBackgroundColor:v18];

LABEL_19:
  v19 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  v20 = [v19 backgroundImage];
  long long v21 = v20;
  if (!v20)
  {
    v2 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    long long v21 = [v2 backgroundImage];
  }
  long long v22 = [v5 backgroundImageView];
  [v22 setImage:v21];

  if (!v20)
  {
  }
  long long v23 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  long long v24 = [v23 footerButtonColor];
  objc_super v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    v27 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    id v26 = [v27 footerButtonColor];
  }
  v28 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  uint64_t v29 = [v28 footerButtonFont];
  v30 = v29;
  v54 = v12;
  if (v29)
  {
    id v31 = v29;
  }
  else
  {
    v32 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    id v31 = [v32 footerButtonFont];
  }
  v33 = v9;

  v34 = [v5 footerButtonViews];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v35 = v34;
  }
  else {
    id v35 = 0;
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v36 = v35;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v56 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (v26) {
          [*(id *)(*((void *)&v55 + 1) + 8 * i) setPreferredForegroundColor:v26];
        }
        if (v31) {
          [v41 setPreferredFont:v31];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v38);
  }

  v42 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  uint64_t v43 = [v42 imageTintColor];
  if (v43)
  {
    v44 = (void *)v43;
  }
  else
  {
    v45 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    v44 = [v45 imageTintColor];

    if (!v44) {
      goto LABEL_47;
    }
  }
  [v5 setIconColor:v44];

LABEL_47:
  v46 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  uint64_t v47 = [v46 separatorColor];
  if (v47)
  {
    v48 = (void *)v47;

LABEL_50:
    [v5 setSeparatorColor:v48];

    goto LABEL_51;
  }
  v49 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
  v48 = [v49 separatorColor];

  if (v48) {
    goto LABEL_50;
  }
LABEL_51:
  v50 = [(AMSUIBaseMessageViewController *)self _loadedImage];

  if (v50)
  {
    v51 = [(AMSUIBaseMessageViewController *)self _loadedImage];
    v52 = objc_msgSend(v51, "ams_imageWithRenderingMode:", -[AMSUIDashboardMessageViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v53 = [v5 imageView];
    [v53 setImage:v52];
  }
  [(AMSUIBaseMessageViewController *)self _updateTextWithAttributes];
  [v54 commitAppearance];
}

- (int64_t)_iconAnimationPlayCount
{
  int64_t v3 = 1;
  uint64_t v4 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
    uint64_t v7 = [v6 iconAnimationPlayCount];

    if (v7 != -90)
    {
      uint64_t v8 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
      int64_t v3 = [v8 iconAnimationPlayCount];
    }
  }
  uint64_t v9 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    v11 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
    uint64_t v12 = [v11 iconAnimationPlayCount];

    if (v12 != -90)
    {
      objc_super v13 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
      int64_t v3 = [v13 iconAnimationPlayCount];
    }
  }
  return v3;
}

- (unint64_t)_messageStyle
{
  return 5;
}

- (id)_defaultPreferredImageSymbolConfiguration
{
  v2 = [(AMSUIDashboardMessageViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F835E0] scale:2];
  if (v3 != 5)
  {
    v5 = [MEMORY[0x263F82818] configurationWithWeight:6];
    uint64_t v6 = [v4 configurationByApplyingConfiguration:v5];

    uint64_t v4 = (void *)v6;
  }
  return v4;
}

- (id)_effectiveImageSymbolConfiguration
{
  uint64_t v3 = [(AMSUIDashboardMessageViewController *)self _defaultPreferredImageSymbolConfiguration];
  uint64_t v4 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
  v5 = [v4 imageSymbolConfiguration];
  uint64_t v6 = [v3 configurationByApplyingConfiguration:v5];
  uint64_t v7 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  uint64_t v8 = [v7 imageSymbolConfiguration];
  uint64_t v9 = [v6 configurationByApplyingConfiguration:v8];

  return v9;
}

- (AMSUIDashboardMessageAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  [(AMSUIDashboardMessageViewController *)self _commitAppearance];
}

- (int64_t)_primaryImageRenderingMode
{
  uint64_t v3 = [(AMSUIDashboardMessageViewController *)self preferredAppearance];
  int64_t v4 = [v3 primaryImageRenderingMode];

  v5 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
  uint64_t v6 = [v5 primaryImageRenderingMode];

  if (v6)
  {
    uint64_t v7 = [(AMSUIDashboardMessageViewController *)self requestAppearance];
    int64_t v4 = [v7 primaryImageRenderingMode];
  }
  return v4;
}

- (AMSUIDashboardMessageAppearance)requestAppearance
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