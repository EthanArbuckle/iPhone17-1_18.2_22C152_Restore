@interface AMSUIBubbleTipViewController
- (AMSUIBubbleTipAppearance)preferredAppearance;
- (AMSUIBubbleTipAppearance)requestAppearance;
- (AMSUIBubbleTipInlineAnchorInfo)inlineAnchorInfo;
- (AMSUIBubbleTipViewController)initWithRequest:(id)a3;
- (AMSUIBubbleTipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (BOOL)isSelfSizing;
- (CGPoint)anchorPoint;
- (CGSize)preferredContentSize;
- (id)_defaultPreferredImageSymbolConfiguration;
- (id)_effectiveImageSymbolConfiguration;
- (id)_messageFontCompatibleWith:(id)a3;
- (id)_messageTextColor;
- (id)_titleFontCompatibleWith:(id)a3;
- (id)_titleTextColor;
- (int64_t)_iconAnimationPlayCount;
- (int64_t)_primaryImageRenderingMode;
- (unint64_t)_messageStyle;
- (unint64_t)directionForAMSUIPopoverArrowDirection:(unint64_t)a3;
- (void)_commitAppearance;
- (void)_endObservations;
- (void)_preferredContentSizeCategoryDidChange:(id)a3;
- (void)_setDialogRequest:(id)a3;
- (void)_startObservations;
- (void)_transferBackgroundColorForPopover;
- (void)_updateArrowProperties;
- (void)_updateSelfSizedContentSize;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setInlineAnchorInfo:(id)a3;
- (void)setIsSelfSizing:(BOOL)a3;
- (void)setPreferredAppearance:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setRequestAppearance:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AMSUIBubbleTipViewController

- (AMSUIBubbleTipViewController)initWithRequest:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIBubbleTipViewController;
  v5 = [(AMSUIBaseMessageViewController *)&v13 initWithRequest:v4];
  if (v5)
  {
    v6 = objc_alloc_init(AMSUIBubbleTipAppearance);
    preferredAppearance = v5->_preferredAppearance;
    v5->_preferredAppearance = v6;

    v8 = [AMSUIBubbleTipAppearance alloc];
    v9 = [v4 appearanceInfo];
    uint64_t v10 = [(AMSUIBubbleTipAppearance *)v8 initWithDictionary:v9];
    requestAppearance = v5->_requestAppearance;
    v5->_requestAppearance = (AMSUIBubbleTipAppearance *)v10;

    v5->_isSelfSizing = 1;
    [(AMSUIBubbleTipViewController *)v5 _startObservations];
  }

  return v5;
}

- (AMSUIBubbleTipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIBubbleTipViewController;
  return [(AMSUIBaseMessageViewController *)&v6 initWithRequest:a3 bag:a4 account:a5];
}

- (void)dealloc
{
  [(AMSUIBubbleTipViewController *)self _endObservations];
  v3.receiver = self;
  v3.super_class = (Class)AMSUIBubbleTipViewController;
  [(AMSUIBubbleTipViewController *)&v3 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIBubbleTipViewController;
  [(AMSUIBubbleTipViewController *)&v3 viewDidLayoutSubviews];
  [(AMSUIBubbleTipViewController *)self _updateArrowProperties];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)AMSUIBubbleTipViewController;
  [(AMSUIBubbleTipViewController *)&v11 viewWillAppear:a3];
  [(AMSUIBubbleTipViewController *)self _updateSelfSizedContentSize];
  if ([(AMSUIBubbleTipViewController *)self modalPresentationStyle] == 7)
  {
    id v4 = [(AMSUIBubbleTipViewController *)self popoverPresentationController];

    if (v4)
    {
      v5 = [(AMSUIBubbleTipViewController *)self popoverPresentationController];
      objc_super v6 = [v5 passthroughViews];

      if (!v6)
      {
        v7 = [(AMSUIBubbleTipViewController *)self presentingViewController];
        v8 = [v7 view];
        v12[0] = v8;
        v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
        uint64_t v10 = [(AMSUIBubbleTipViewController *)self popoverPresentationController];
        [v10 setPassthroughViews:v9];
      }
      [(AMSUIBubbleTipViewController *)self _transferBackgroundColorForPopover];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIBubbleTipViewController;
  id v7 = a4;
  -[AMSUIBubbleTipViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__AMSUIBubbleTipViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_2643E3610;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __83__AMSUIBubbleTipViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSelfSizedContentSize];
}

- (void)_preferredContentSizeCategoryDidChange:(id)a3
{
  [(AMSUIBaseMessageViewController *)self _updateTextWithAttributes:a3];
  [(AMSUIBubbleTipViewController *)self updateTraitsIfNeeded];
  [(AMSUIBubbleTipViewController *)self _updateSelfSizedContentSize];
}

- (void)_startObservations
{
}

- (void)_endObservations
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  objc_super v11 = (AMSUIBubbleTipViewController *)a4;
  id v12 = a5;
  if (v11 == self && [v10 isEqualToString:@"modalPresentationStyle"])
  {
    uint64_t v13 = [(AMSUIBubbleTipViewController *)v11 _messageStyle];
    uint64_t v14 = [(AMSUIBubbleTipViewController *)v11 viewIfLoaded];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [(AMSUIBaseMessageViewController *)v11 _messageView];
      uint64_t v17 = [v16 style];

      if (v17 != v13)
      {
        v18 = [(AMSUIBaseMessageViewController *)v11 _messageView];
        [v18 setStyle:v13];

        v19 = [(AMSUIBaseMessageViewController *)v11 _messageView];
        [v19 setNeedsLayout];
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)AMSUIBubbleTipViewController;
    [(AMSUIBubbleTipViewController *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_setDialogRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AMSUIBubbleTipViewController;
  [(AMSUIBaseMessageViewController *)&v25 _setDialogRequest:v4];
  objc_super v20 = self;
  v18 = [(AMSUIBaseMessageViewController *)self _messageView];
  uint64_t v17 = [v4 defaultAction];
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
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v9 || [*(id *)(*((void *)&v21 + 1) + 8 * i) style] != 2)
        {
          if ((unint64_t)[v5 count] > 1)
          {
            uint64_t v13 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
            if (!v13)
            {
              uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
            }
            uint64_t v14 = [v13 OSLogObject];
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
  v5 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  objc_super v6 = [v5 _messageFontDictionary];
  uint64_t v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIBubbleTipViewController *)self requestAppearance];
    id v9 = [v10 messageFont];
  }
  if (!v9)
  {
    objc_super v11 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    id v12 = [v11 _messageFontDictionary];
    uint64_t v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    uint64_t v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      v15 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
      id v9 = [v15 messageFont];
    }
  }

  return v9;
}

- (id)_messageTextColor
{
  objc_super v3 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  id v4 = [v3 messageTextColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    id v6 = [v7 messageTextColor];
  }
  return v6;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  id v6 = [v5 _titleFontDictionary];
  uint64_t v7 = +[AMSUIFontParser fontWithDictionary:v6 compatibleWith:v4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIBubbleTipViewController *)self requestAppearance];
    id v9 = [v10 titleFont];
  }
  if (!v9)
  {
    objc_super v11 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    id v12 = [v11 _titleFontDictionary];
    uint64_t v13 = +[AMSUIFontParser fontWithDictionary:v12 compatibleWith:v4];
    uint64_t v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      v15 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
      id v9 = [v15 titleFont];
    }
  }

  return v9;
}

- (id)_titleTextColor
{
  objc_super v3 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  id v4 = [v3 titleTextColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    id v6 = [v7 titleTextColor];
  }
  return v6;
}

- (void)_commitAppearance
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = [(AMSUIBubbleTipViewController *)self viewIfLoaded];

  if (!v4) {
    return;
  }
  v5 = [(AMSUIBaseMessageViewController *)self _messageView];
  id v6 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  uint64_t v7 = [v6 accessoryButtonColor];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    id v9 = [v10 accessoryButtonColor];
  }
  objc_super v11 = [v5 accessoryView];
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
  uint64_t v13 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  uint64_t v14 = [v13 accessoryButtonFont];
  if (v14)
  {
    v15 = (void *)v14;
  }
  else
  {
    v2 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    v15 = [v2 accessoryButtonFont];

    if (!v15) {
      goto LABEL_15;
    }
  }
  [v12 setPreferredFont:v15];

LABEL_15:
  id v16 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  uint64_t v17 = [v16 imageStyle];

  if (v17) {
    [(AMSUIBubbleTipViewController *)self requestAppearance];
  }
  else {
  v18 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
  }
  objc_msgSend(v5, "setImageStyle:", objc_msgSend(v18, "imageStyle"));

  v19 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  uint64_t v20 = [v19 backgroundColor];
  if (v20)
  {
    long long v21 = (void *)v20;
  }
  else
  {
    v2 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    long long v21 = [v2 backgroundColor];

    if (!v21) {
      goto LABEL_22;
    }
  }
  [v5 setBackgroundColor:v21];

LABEL_22:
  long long v22 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  long long v23 = [v22 backgroundImage];
  long long v24 = v23;
  if (!v23)
  {
    v2 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    long long v24 = [v2 backgroundImage];
  }
  objc_super v25 = [v5 backgroundImageView];
  [v25 setImage:v24];

  if (!v23)
  {
  }
  v26 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  v27 = [v26 footerButtonColor];
  v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    v30 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    id v29 = [v30 footerButtonColor];
  }
  v31 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  v32 = [v31 footerButtonFont];
  v33 = v32;
  v57 = v12;
  if (v32)
  {
    id v34 = v32;
  }
  else
  {
    v35 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    id v34 = [v35 footerButtonFont];
  }
  v36 = v9;

  v37 = [v5 footerButtonViews];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v38 = v37;
  }
  else {
    id v38 = 0;
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v39 = v38;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if (v29) {
          [*(id *)(*((void *)&v58 + 1) + 8 * i) setPreferredForegroundColor:v29];
        }
        if (v34) {
          [v44 setPreferredFont:v34];
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v41);
  }

  v45 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  uint64_t v46 = [v45 imageTintColor];
  if (v46)
  {
    v47 = (void *)v46;
  }
  else
  {
    v48 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    v47 = [v48 imageTintColor];

    if (!v47) {
      goto LABEL_50;
    }
  }
  [v5 setIconColor:v47];

LABEL_50:
  v49 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  uint64_t v50 = [v49 separatorColor];
  if (v50)
  {
    v51 = (void *)v50;

LABEL_53:
    [v5 setSeparatorColor:v51];

    goto LABEL_54;
  }
  v52 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
  v51 = [v52 separatorColor];

  if (v51) {
    goto LABEL_53;
  }
LABEL_54:
  v53 = [(AMSUIBaseMessageViewController *)self _loadedImage];

  if (v53)
  {
    v54 = [(AMSUIBaseMessageViewController *)self _loadedImage];
    v55 = objc_msgSend(v54, "ams_imageWithRenderingMode:", -[AMSUIBubbleTipViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v56 = [v5 imageView];
    [v56 setImage:v55];
  }
  [(AMSUIBaseMessageViewController *)self _updateTextWithAttributes];
  [v57 commitAppearance];
}

- (unint64_t)directionForAMSUIPopoverArrowDirection:(unint64_t)a3
{
  if (a3 + 1 > 4) {
    return 1;
  }
  else {
    return qword_21C2CE1F0[a3 + 1];
  }
}

- (void)_transferBackgroundColorForPopover
{
  if ([(AMSUIBubbleTipViewController *)self modalPresentationStyle] == 7)
  {
    objc_super v3 = [(AMSUIBubbleTipViewController *)self popoverPresentationController];

    if (v3)
    {
      id v4 = [(AMSUIBaseMessageViewController *)self _messageView];
      id v8 = [v4 backgroundColor];

      v5 = [MEMORY[0x263F825C8] clearColor];
      id v6 = [(AMSUIBaseMessageViewController *)self _messageView];
      [v6 setBackgroundColor:v5];

      uint64_t v7 = [(AMSUIBubbleTipViewController *)self popoverPresentationController];
      [v7 setBackgroundColor:v8];
    }
  }
}

- (void)_updateArrowProperties
{
  objc_super v3 = [(AMSUIBubbleTipViewController *)self inlineAnchorInfo];

  if (v3)
  {
    id v4 = [(AMSUIBubbleTipViewController *)self inlineAnchorInfo];
    unint64_t v5 = -[AMSUIBubbleTipViewController directionForAMSUIPopoverArrowDirection:](self, "directionForAMSUIPopoverArrowDirection:", [v4 arrowDirection]);

    if (v5 + 1 < 2) {
      return;
    }
    id v6 = [(AMSUIBubbleTipViewController *)self inlineAnchorInfo];
    [v6 arrowOffset];
    double v8 = v7;

    id v9 = [(AMSUIBubbleTipViewController *)self inlineAnchorInfo];
    uint64_t v10 = v9;
    if (v8 == 2.22507386e-308)
    {
      [v9 relativeArrowOffset];
      double v17 = v16;

      if (v17 == 2.22507386e-308) {
        return;
      }
      v18 = [(AMSUIBubbleTipViewController *)self inlineAnchorInfo];
      [v18 relativeArrowOffset];
      double v20 = v19;

      if (v5 - 1 < 2)
      {
        uint64_t v10 = [(AMSUIBubbleTipViewController *)self view];
        [v10 frame];
        double v12 = v20 * v27;
      }
      else
      {
        if (v5 != 4 && v5 != 8) {
          return;
        }
        uint64_t v10 = [(AMSUIBubbleTipViewController *)self view];
        [v10 frame];
        double v12 = v20 * v21;
      }
    }
    else
    {
      [v9 arrowOffset];
      double v12 = v11;
    }

    if (v5 - 1 < 2)
    {
      uint64_t v13 = [(AMSUIBubbleTipViewController *)self view];
      [v13 frame];
      double v15 = v22;
    }
    else
    {
      if (v5 != 4 && v5 != 8) {
        return;
      }
      uint64_t v13 = [(AMSUIBubbleTipViewController *)self view];
      [v13 frame];
      double v15 = v14;
    }

    long long v23 = [(AMSUIBaseMessageViewController *)self _messageView];
    [v23 setupBubbleArrowMaskView];

    long long v24 = [(AMSUIBaseMessageViewController *)self _messageView];
    objc_super v25 = [v24 maskShapeView];
    [v25 setArrowOffset:v12 + v15 * -0.5];

    id v28 = [(AMSUIBaseMessageViewController *)self _messageView];
    v26 = [v28 maskShapeView];
    [v26 setArrowDirection:v5];
  }
  else
  {
    id v28 = [(AMSUIBaseMessageViewController *)self _messageView];
    [v28 removeBubbleArrowMaskView];
  }
}

- (void)_updateSelfSizedContentSize
{
  if ([(AMSUIBubbleTipViewController *)self modalPresentationStyle] == 7)
  {
    objc_super v3 = [(AMSUIBubbleTipViewController *)self popoverPresentationController];

    if (v3)
    {
      if ([(AMSUIBubbleTipViewController *)self isSelfSizing]
        || ([(AMSUIBubbleTipViewController *)self viewIfLoaded],
            id v4 = objc_claimAutoreleasedReturnValue(),
            v4,
            !v4))
      {
        unint64_t v5 = [(AMSUIBubbleTipViewController *)self presentingViewController];
        id v6 = [v5 view];
        [v6 directionalLayoutMargins];
        double v8 = v7;
        double v10 = v9;

        double v11 = [(AMSUIBubbleTipViewController *)self presentingViewController];
        double v12 = [v11 view];
        [v12 frame];
        double v14 = v13;

        double v15 = fmin(v14 - (v8 + v10), 327.0);
        double v16 = [(AMSUIBubbleTipViewController *)self presentingViewController];
        double v17 = [v16 view];
        v18 = [v17 window];
        [v18 frame];
        double v20 = v19 * 0.5;

        double v21 = [(AMSUIBubbleTipViewController *)self view];
        [v21 setNeedsLayout];

        double v22 = [(AMSUIBubbleTipViewController *)self view];
        objc_msgSend(v22, "sizeThatFits:", v15, v20);
        double v24 = v23;
        double v26 = v25;

        [(AMSUIBubbleTipViewController *)self preferredContentSize];
        if (v28 != v24 || v27 != v26)
        {
          -[AMSUIBubbleTipViewController setPreferredContentSize:](self, "setPreferredContentSize:", v24, v26);
          [(AMSUIBubbleTipViewController *)self setIsSelfSizing:1];
        }
      }
    }
  }
}

- (int64_t)_iconAnimationPlayCount
{
  int64_t v3 = 1;
  uint64_t v4 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    id v6 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
    uint64_t v7 = [v6 iconAnimationPlayCount];

    if (v7 != -90)
    {
      double v8 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
      int64_t v3 = [v8 iconAnimationPlayCount];
    }
  }
  uint64_t v9 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  if (v9)
  {
    double v10 = (void *)v9;
    double v11 = [(AMSUIBubbleTipViewController *)self requestAppearance];
    uint64_t v12 = [v11 iconAnimationPlayCount];

    if (v12 != -90)
    {
      double v13 = [(AMSUIBubbleTipViewController *)self requestAppearance];
      int64_t v3 = [v13 iconAnimationPlayCount];
    }
  }
  return v3;
}

- (id)_defaultPreferredImageSymbolConfiguration
{
  v2 = [(AMSUIBubbleTipViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F835E0] scale:2];
  if (v3 != 5)
  {
    unint64_t v5 = [MEMORY[0x263F82818] configurationWithWeight:6];
    uint64_t v6 = [v4 configurationByApplyingConfiguration:v5];

    uint64_t v4 = (void *)v6;
  }
  return v4;
}

- (id)_effectiveImageSymbolConfiguration
{
  uint64_t v3 = [(AMSUIBubbleTipViewController *)self _defaultPreferredImageSymbolConfiguration];
  uint64_t v4 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
  unint64_t v5 = [v4 imageSymbolConfiguration];
  uint64_t v6 = [v3 configurationByApplyingConfiguration:v5];
  uint64_t v7 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  double v8 = [v7 imageSymbolConfiguration];
  uint64_t v9 = [v6 configurationByApplyingConfiguration:v8];

  return v9;
}

- (unint64_t)_messageStyle
{
  uint64_t v3 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  uint64_t v4 = [v3 style];

  if (v4 == 8) {
    unint64_t v5 = 6;
  }
  else {
    unint64_t v5 = 3;
  }
  if ([(AMSUIBubbleTipViewController *)self modalPresentationStyle] == 7) {
    return 2;
  }
  else {
    return v5;
  }
}

- (AMSUIBubbleTipInlineAnchorInfo)inlineAnchorInfo
{
  return self->_inlineAnchorInfo;
}

- (void)setInlineAnchorInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inlineAnchorInfo, a3);
  [(AMSUIBubbleTipViewController *)self _updateArrowProperties];
}

- (AMSUIBubbleTipAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  [(AMSUIBubbleTipViewController *)self _commitAppearance];
}

- (CGSize)preferredContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIBubbleTipViewController;
  [(AMSUIBubbleTipViewController *)&v4 preferredContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(AMSUIBubbleTipViewController *)self setIsSelfSizing:0];
  v6.receiver = self;
  v6.super_class = (Class)AMSUIBubbleTipViewController;
  -[AMSUIBubbleTipViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_, width, height);
}

- (int64_t)_primaryImageRenderingMode
{
  double v3 = [(AMSUIBubbleTipViewController *)self preferredAppearance];
  int64_t v4 = [v3 primaryImageRenderingMode];

  unint64_t v5 = [(AMSUIBubbleTipViewController *)self requestAppearance];
  uint64_t v6 = [v5 primaryImageRenderingMode];

  if (v6)
  {
    uint64_t v7 = [(AMSUIBubbleTipViewController *)self requestAppearance];
    int64_t v4 = [v7 primaryImageRenderingMode];
  }
  return v4;
}

- (CGPoint)anchorPoint
{
  objc_copyStruct(v4, &self->_anchorPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_anchorPoint, &v3, 16, 1, 0);
}

- (AMSUIBubbleTipAppearance)requestAppearance
{
  return self->_requestAppearance;
}

- (void)setRequestAppearance:(id)a3
{
}

- (BOOL)isSelfSizing
{
  return self->_isSelfSizing;
}

- (void)setIsSelfSizing:(BOOL)a3
{
  self->_isSelfSizing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAppearance, 0);
  objc_storeStrong((id *)&self->_preferredAppearance, 0);
  objc_storeStrong((id *)&self->_inlineAnchorInfo, 0);
}

@end