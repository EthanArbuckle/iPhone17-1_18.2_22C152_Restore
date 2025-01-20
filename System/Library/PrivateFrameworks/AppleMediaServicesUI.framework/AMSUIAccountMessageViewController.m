@interface AMSUIAccountMessageViewController
- (AMSUIAccountMessageAppearance)preferredAppearance;
- (AMSUIAccountMessageAppearance)requestAppearance;
- (AMSUIAccountMessageViewController)initWithRequest:(id)a3;
- (AMSUIAccountMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (BOOL)didAnimateFirstImpression;
- (id)_defaultPreferredImageSymbolConfiguration;
- (id)_effectiveImageSymbolConfiguration;
- (id)_messageFontCompatibleWith:(id)a3;
- (id)_messageTextColor;
- (id)_titleFontCompatibleWith:(id)a3;
- (id)_titleTextColor;
- (int64_t)_iconAnimationPlayCount;
- (int64_t)_impressionAnimationStyle;
- (int64_t)_primaryImageRenderingMode;
- (unint64_t)_messageStyle;
- (void)_commitAnimationLaunch;
- (void)_commitAppearance;
- (void)_prepareAnimationLaunch;
- (void)_setDialogRequest:(id)a3;
- (void)setDidAnimateFirstImpression:(BOOL)a3;
- (void)setPreferredAppearance:(id)a3;
- (void)setRequestAppearance:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AMSUIAccountMessageViewController

- (AMSUIAccountMessageViewController)initWithRequest:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AMSUIAccountMessageViewController;
  v5 = [(AMSUIBaseMessageViewController *)&v14 initWithRequest:v4];
  v6 = v5;
  if (v5)
  {
    v5->_didAnimateFirstImpression = 0;
    v7 = objc_alloc_init(AMSUIAccountMessageAppearance);
    preferredAppearance = v6->_preferredAppearance;
    v6->_preferredAppearance = v7;

    v9 = [AMSUIAccountMessageAppearance alloc];
    v10 = [v4 appearanceInfo];
    uint64_t v11 = [(AMSUIAccountMessageAppearance *)v9 initWithDictionary:v10];
    requestAppearance = v6->_requestAppearance;
    v6->_requestAppearance = (AMSUIAccountMessageAppearance *)v11;
  }
  return v6;
}

- (AMSUIAccountMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIAccountMessageViewController;
  return [(AMSUIBaseMessageViewController *)&v6 initWithRequest:a3 bag:a4 account:a5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIAccountMessageViewController;
  [(AMSUIAccountMessageViewController *)&v4 viewWillAppear:a3];
  if (![(AMSUIAccountMessageViewController *)self didAnimateFirstImpression]) {
    [(AMSUIAccountMessageViewController *)self _prepareAnimationLaunch];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIAccountMessageViewController;
  [(AMSUIBaseMessageViewController *)&v4 viewDidAppear:a3];
  if (![(AMSUIAccountMessageViewController *)self didAnimateFirstImpression]) {
    [(AMSUIAccountMessageViewController *)self _commitAnimationLaunch];
  }
}

- (void)_setDialogRequest:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AMSUIAccountMessageViewController;
  [(AMSUIBaseMessageViewController *)&v28 _setDialogRequest:v4];
  v5 = [(AMSUIBaseMessageViewController *)self _messageView];
  objc_super v6 = [v4 defaultAction];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [v4 buttonActions];
  id v8 = (id)[v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (!v8)
  {
    v9 = 0;
    goto LABEL_24;
  }
  v22 = v6;
  v23 = v5;
  v9 = 0;
  v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v25;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v7);
      }
      objc_super v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if (v11 || [*(id *)(*((void *)&v24 + 1) + 8 * i) style] != 2)
      {
        if (v10)
        {
          if (v9)
          {
            v16 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
            if (!v16)
            {
              v16 = [MEMORY[0x263F27CB8] sharedConfig];
            }
            v17 = objc_msgSend(v16, "OSLogObject", v22, v23);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v30 = v18;
              id v19 = v18;
              _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_INFO, "%{public}@: Warning ignoring extraneous action", buf, 0xCu);
            }
            goto LABEL_21;
          }
          v9 = v14;
        }
        else
        {
          v10 = v14;
        }
      }
      else
      {
        uint64_t v11 = v14;
      }
      id v15 = v14;
    }
    id v8 = (id)[v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_21:

  if (v11)
  {
    id v7 = v10;

    id v8 = v11;
    v9 = v7;
    objc_super v6 = v22;
    v5 = v23;
LABEL_24:

    v10 = v8;
    goto LABEL_26;
  }
  id v8 = 0;
  objc_super v6 = v22;
  v5 = v23;
LABEL_26:
  v20 = objc_msgSend(MEMORY[0x263EFF980], "array", v22, v23);
  v21 = v20;
  if (v9) {
    [v20 addObject:v9];
  }
  if (v6) {
    [v5 setBodyDialogAction:v6 target:self action:sel__didTapActionButton_];
  }
  if (v10) {
    [v5 setAccessoryViewForDialogAction:v10 target:self action:sel__didTapActionButton_];
  }
  if ([v21 count]) {
    [v5 setFooterForDialogActions:v21 target:self action:sel__didTapActionButton_];
  }
}

- (void)_prepareAnimationLaunch
{
  if ([(AMSUIAccountMessageViewController *)self _impressionAnimationStyle] != -1)
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      v3 = [(AMSUIBaseMessageViewController *)self _messageView];
      id v4 = [v3 imageView];
      v5 = [v4 layer];
      [v5 setOpacity:0.0];
    }
    else
    {
      long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v13.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v13.c = v6;
      *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformScale(&v14, &v13, 0.25, 0.25);
      v3 = [(AMSUIBaseMessageViewController *)self _messageView];
      id v4 = [v3 imageView];
      CGAffineTransform v12 = v14;
      [v4 setTransform:&v12];
    }

    id v7 = [(AMSUIBaseMessageViewController *)self _messageView];
    id v8 = [v7 textView];
    v9 = [v8 layer];
    [v9 setOpacity:0.0];

    v10 = [(AMSUIBaseMessageViewController *)self _messageView];
    uint64_t v11 = [v10 footerButtonViews];
    [v11 enumerateObjectsUsingBlock:&__block_literal_global_0];
  }
}

void __60__AMSUIAccountMessageViewController__prepareAnimationLaunch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 layer];
  [v2 setOpacity:0.0];
}

- (void)_commitAnimationLaunch
{
  if ([(AMSUIAccountMessageViewController *)self _impressionAnimationStyle] != -1)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x263F82BF0]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 65.0, 12.0, 0.0, 0.0);
    id v4 = [MEMORY[0x263F15890] animationWithKeyPath:@"keyPath"];
    [v4 setMass:1.0];
    [v4 setStiffness:65.0];
    [v4 setDamping:12.0];
    [v4 setInitialVelocity:0.0];
    id v5 = objc_alloc(MEMORY[0x263F15808]);
    LODWORD(v6) = 1036831949;
    LODWORD(v7) = 1.0;
    LODWORD(v8) = 1.0;
    v9 = (void *)[v5 initWithControlPoints:v6 :0.0 :v7 :v8];
    [v4 setTimingFunction:v9];

    [v4 settlingDuration];
    objc_msgSend(v4, "setDuration:");
    id v10 = objc_alloc(MEMORY[0x263F82E30]);
    [v4 settlingDuration];
    uint64_t v11 = objc_msgSend(v10, "initWithDuration:timingParameters:", v3);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__AMSUIAccountMessageViewController__commitAnimationLaunch__block_invoke;
    v12[3] = &unk_2643E3118;
    v12[4] = self;
    [v11 addAnimations:v12];
    [v11 startAnimation];
    [(AMSUIAccountMessageViewController *)self setDidAnimateFirstImpression:1];
  }
}

void __59__AMSUIAccountMessageViewController__commitAnimationLaunch__block_invoke(uint64_t a1)
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v3 = [*(id *)(a1 + 32) _messageView];
  id v4 = [v3 imageView];
  id v5 = v4;
  if (IsReduceMotionEnabled)
  {
    double v6 = [v4 layer];
    LODWORD(v7) = 1.0;
    [v6 setOpacity:v7];
  }
  else
  {
    long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v15[0] = *MEMORY[0x263F000D0];
    v15[1] = v8;
    v15[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v4 setTransform:v15];
  }

  v9 = [*(id *)(a1 + 32) _messageView];
  id v10 = [v9 textView];
  uint64_t v11 = [v10 layer];
  LODWORD(v12) = 1.0;
  [v11 setOpacity:v12];

  CGAffineTransform v13 = [*(id *)(a1 + 32) _messageView];
  CGAffineTransform v14 = [v13 footerButtonViews];
  [v14 enumerateObjectsUsingBlock:&__block_literal_global_19];
}

void __59__AMSUIAccountMessageViewController__commitAnimationLaunch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 layer];
  LODWORD(v2) = 1.0;
  [v3 setOpacity:v2];
}

- (int64_t)_impressionAnimationStyle
{
  uint64_t v3 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  if (!v3
    || (id v4 = (void *)v3,
        [(AMSUIAccountMessageViewController *)self requestAppearance],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 impressionAnimationStyle],
        v5,
        v4,
        v6 == -1))
  {
    int64_t v8 = -1;
  }
  else
  {
    double v7 = [(AMSUIAccountMessageViewController *)self requestAppearance];
    int64_t v8 = [v7 impressionAnimationStyle];
  }
  v9 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
  uint64_t v10 = [v9 impressionAnimationStyle];

  if (v10 != -1)
  {
    uint64_t v11 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    int64_t v8 = [v11 impressionAnimationStyle];
  }
  return v8;
}

- (id)_messageFontCompatibleWith:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  uint64_t v6 = [v5 _messageFontDictionary];
  double v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  int64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIAccountMessageViewController *)self requestAppearance];
    id v9 = [v10 messageFont];
  }
  if (!v9)
  {
    uint64_t v11 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    double v12 = [v11 _messageFontDictionary];
    CGAffineTransform v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    CGAffineTransform v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      id v15 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
      id v9 = [v15 messageFont];
    }
  }

  return v9;
}

- (id)_messageTextColor
{
  uint64_t v3 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  id v4 = [v3 messageTextColor];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    id v6 = [v7 messageTextColor];
  }
  return v6;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  id v6 = [v5 _titleFontDictionary];
  double v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  int64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIAccountMessageViewController *)self requestAppearance];
    id v9 = [v10 titleFont];
  }
  if (!v9)
  {
    uint64_t v11 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    double v12 = [v11 _titleFontDictionary];
    CGAffineTransform v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    CGAffineTransform v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      id v15 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
      id v9 = [v15 titleFont];
    }
  }

  return v9;
}

- (id)_titleTextColor
{
  uint64_t v3 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  id v4 = [v3 titleTextColor];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    id v6 = [v7 titleTextColor];
  }
  return v6;
}

- (int64_t)_primaryImageRenderingMode
{
  uint64_t v3 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
  int64_t v4 = [v3 primaryImageRenderingMode];

  id v5 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  uint64_t v6 = [v5 primaryImageRenderingMode];

  if (v6)
  {
    double v7 = [(AMSUIAccountMessageViewController *)self requestAppearance];
    int64_t v4 = [v7 primaryImageRenderingMode];
  }
  return v4;
}

- (void)_commitAppearance
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v57.receiver = self;
  v57.super_class = (Class)AMSUIAccountMessageViewController;
  [(AMSUIBaseMessageViewController *)&v57 _commitAppearance];
  int64_t v4 = [(AMSUIAccountMessageViewController *)self viewIfLoaded];

  if (!v4) {
    return;
  }
  id v5 = [(AMSUIBaseMessageViewController *)self _messageView];
  uint64_t v6 = [v5 accessoryView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  int64_t v8 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  id v9 = [v8 accessoryButtonColor];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    double v2 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    id v11 = [v2 accessoryButtonColor];
  }
  if (v7 && v11) {
    [v7 setPreferredForegroundColor:v11];
  }
  double v12 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  uint64_t v13 = [v12 accessoryButtonFont];
  if (v13)
  {
    CGAffineTransform v14 = (void *)v13;
  }
  else
  {
    double v2 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    CGAffineTransform v14 = [v2 accessoryButtonFont];

    if (!v14) {
      goto LABEL_15;
    }
  }
  [v7 setPreferredFont:v14];

LABEL_15:
  id v15 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  uint64_t v16 = [v15 imageStyle];

  if (v16) {
    [(AMSUIAccountMessageViewController *)self requestAppearance];
  }
  else {
  v17 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
  }
  objc_msgSend(v5, "setImageStyle:", objc_msgSend(v17, "imageStyle"));

  v18 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  uint64_t v19 = [v18 backgroundColor];
  if (v19)
  {
    v20 = (void *)v19;
  }
  else
  {
    double v2 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    v20 = [v2 backgroundColor];

    if (!v20) {
      goto LABEL_22;
    }
  }
  [v5 setBackgroundColor:v20];

LABEL_22:
  v21 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  v22 = [v21 backgroundImage];
  v23 = v22;
  if (!v22)
  {
    double v2 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    v23 = [v2 backgroundImage];
  }
  long long v24 = [v5 backgroundImageView];
  [v24 setImage:v23];

  if (!v22)
  {
  }
  long long v25 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  long long v26 = [v25 footerButtonColor];
  long long v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    v29 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    id v28 = [v29 footerButtonColor];
  }
  v30 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  v31 = [v30 footerButtonFont];
  uint64_t v32 = v31;
  v52 = v7;
  if (v31)
  {
    id v33 = v31;
  }
  else
  {
    v34 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    id v33 = [v34 footerButtonFont];
  }
  v35 = v11;

  v36 = [v5 footerButtonViews];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v37 = v36;
  }
  else {
    id v37 = 0;
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v38 = v37;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if (v28) {
          [*(id *)(*((void *)&v53 + 1) + 8 * i) setPreferredForegroundColor:v28];
        }
        if (v33) {
          [v43 setPreferredFont:v33];
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v40);
  }

  v44 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  uint64_t v45 = [v44 imageTintColor];
  if (v45)
  {
    v46 = (void *)v45;

LABEL_49:
    [v5 setIconColor:v46];

    goto LABEL_50;
  }
  v47 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
  v46 = [v47 imageTintColor];

  if (v46) {
    goto LABEL_49;
  }
LABEL_50:
  v48 = [(AMSUIBaseMessageViewController *)self _loadedImage];

  if (v48)
  {
    v49 = [(AMSUIBaseMessageViewController *)self _loadedImage];
    v50 = objc_msgSend(v49, "ams_imageWithRenderingMode:", -[AMSUIAccountMessageViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v51 = [v5 imageView];
    [v51 setImage:v50];
  }
  [(AMSUIBaseMessageViewController *)self _updateTextWithAttributes];
  [v52 commitAppearance];
}

- (int64_t)_iconAnimationPlayCount
{
  int64_t v3 = 1;
  uint64_t v4 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
    uint64_t v7 = [v6 iconAnimationPlayCount];

    if (v7 != -90)
    {
      int64_t v8 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
      int64_t v3 = [v8 iconAnimationPlayCount];
    }
  }
  uint64_t v9 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    id v11 = [(AMSUIAccountMessageViewController *)self requestAppearance];
    uint64_t v12 = [v11 iconAnimationPlayCount];

    if (v12 != -90)
    {
      uint64_t v13 = [(AMSUIAccountMessageViewController *)self requestAppearance];
      int64_t v3 = [v13 iconAnimationPlayCount];
    }
  }
  return v3;
}

- (id)_defaultPreferredImageSymbolConfiguration
{
  double v2 = [(AMSUIAccountMessageViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 5) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  id v5 = (void *)MEMORY[0x263F83628];
  if (v3 != 5) {
    id v5 = (void *)MEMORY[0x263F83570];
  }
  uint64_t v6 = [MEMORY[0x263F82818] configurationWithTextStyle:*v5 scale:v4];
  return v6;
}

- (id)_effectiveImageSymbolConfiguration
{
  uint64_t v3 = [(AMSUIAccountMessageViewController *)self _defaultPreferredImageSymbolConfiguration];
  uint64_t v4 = [(AMSUIAccountMessageViewController *)self preferredAppearance];
  id v5 = [v4 imageSymbolConfiguration];
  uint64_t v6 = [v3 configurationByApplyingConfiguration:v5];
  uint64_t v7 = [(AMSUIAccountMessageViewController *)self requestAppearance];
  int64_t v8 = [v7 imageSymbolConfiguration];
  uint64_t v9 = [v6 configurationByApplyingConfiguration:v8];

  return v9;
}

- (unint64_t)_messageStyle
{
  return 0;
}

- (AMSUIAccountMessageAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  [(AMSUIAccountMessageViewController *)self _commitAppearance];
}

- (BOOL)didAnimateFirstImpression
{
  return self->_didAnimateFirstImpression;
}

- (void)setDidAnimateFirstImpression:(BOOL)a3
{
  self->_didAnimateFirstImpression = a3;
}

- (AMSUIAccountMessageAppearance)requestAppearance
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