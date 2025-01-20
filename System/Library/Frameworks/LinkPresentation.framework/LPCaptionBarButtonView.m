@interface LPCaptionBarButtonView
- (BOOL)_menuButtonShowsChevron;
- (BOOL)_menuButtonShowsImages;
- (BOOL)_menuButtonShowsIndicator;
- (BOOL)_menuButtonShowsSingleImage;
- (BOOL)hasAnyText;
- (BOOL)isCollapsed;
- (BOOL)shouldShowDownloadingIndicator;
- (CGSize)collapsedSizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPCaptionBarButtonView)initWithHost:(id)a3;
- (LPCaptionBarButtonView)initWithHost:(id)a3 properties:(id)a4 style:(id)a5;
- (id)createButton;
- (id)createCollapsedButton;
- (id)createMenu;
- (id)createSegmentedControl;
- (id)createUIActionsFromLPActionsWithHandler:(id)a3;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)configureMenuButton:(id)a3;
- (void)configurePillButton:(id)a3;
- (void)configureSegmentedControl:(id)a3;
- (void)createProgressIndicator;
- (void)layoutComponentView;
- (void)performAction:(id)a3;
- (void)removeTarget:(id)a3 action:(SEL)a4;
- (void)selectAction:(id)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)updateProgressIndicator;
@end

@implementation LPCaptionBarButtonView

- (LPCaptionBarButtonView)initWithHost:(id)a3
{
  return 0;
}

- (LPCaptionBarButtonView)initWithHost:(id)a3 properties:(id)a4 style:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)LPCaptionBarButtonView;
  v11 = [(LPComponentView *)&v26 initWithHost:v8];
  v12 = v11;
  v13 = v11;
  if (!v11) {
    goto LABEL_12;
  }
  p_properties = (id *)&v11->_properties;
  objc_storeStrong((id *)&v11->_properties, a4);
  objc_storeStrong((id *)&v12->_style, a5);
  v15 = [*p_properties actions];
  if ((unint64_t)[v15 count] < 2)
  {

    goto LABEL_6;
  }
  BOOL v16 = [(LPButtonStyle *)v12->_style useSegmentedControl];

  if (!v16)
  {
LABEL_6:
    uint64_t v17 = [(LPCaptionBarButtonView *)v13 createButton];
    uint64_t v18 = 432;
    goto LABEL_7;
  }
  uint64_t v17 = [(LPCaptionBarButtonView *)v13 createSegmentedControl];
  uint64_t v18 = 448;
LABEL_7:
  v19 = (uint64_t *)((char *)v12 + v18);
  v20 = (void *)*v19;
  uint64_t *v19 = v17;

  [(LPCaptionBarButtonView *)v13 addSubview:*v19];
  v21 = [*p_properties collapsedButton];

  if (v21)
  {
    uint64_t v22 = [(LPCaptionBarButtonView *)v13 createCollapsedButton];
    collapsedButton = v13->_collapsedButton;
    v13->_collapsedButton = (UIButton *)v22;

    [(LPCaptionBarButtonView *)v13 addSubview:v13->_collapsedButton];
  }
  if ([(LPCaptionBarButtonView *)v13 shouldShowDownloadingIndicator]) {
    [(LPCaptionBarButtonView *)v13 createProgressIndicator];
  }
  [(UIView *)v13 _lp_setClipsToBounds:0];
  v24 = v13;
LABEL_12:

  return v13;
}

- (void)layoutComponentView
{
  if (self->_collapsed)
  {
    -[UIButton setFrame:](self->_button, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v3 = self->_collapsed || self->_progressIndicator != 0;
    [(UIButton *)self->_button setHidden:v3];
    [(LPCaptionBarButtonView *)self bounds];
    -[UIButton setFrame:](self->_collapsedButton, "setFrame:");
    [(UIButton *)self->_collapsedButton setHidden:!self->_collapsed];
    collapsedButton = self->_collapsedButton;
    [(UIButton *)collapsedButton frame];
    [(UIButton *)collapsedButton _lp_setCornerRadius:v14 * 0.5];
  }
  else
  {
    double v4 = *MEMORY[0x1E4FB2848];
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    [(LPCaptionBarButtonView *)self bounds];
    -[UIButton setFrame:](self->_button, "setFrame:", v8 - v5, v9 - v4, v10 - (-v7 - v5), v11 - (-v6 - v4));
    BOOL v12 = self->_collapsed || self->_progressIndicator != 0;
    [(UIButton *)self->_button setHidden:v12];
    -[UIButton setFrame:](self->_collapsedButton, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIButton *)self->_collapsedButton setHidden:!self->_collapsed];
    [(LPCaptionBarButtonView *)self bounds];
    -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:");
    if (self->_progressIndicator)
    {
      [(UIButton *)self->_button frame];
      -[LPCircularProgressIndicator setFrame:](self->_progressIndicator, "setFrame:");
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__LPCaptionBarButtonView_layoutComponentView__block_invoke;
    v18[3] = &unk_1E5B07078;
    v18[4] = self;
    int v15 = __45__LPCaptionBarButtonView_layoutComponentView__block_invoke((uint64_t)v18);
    button = self->_button;
    [(UIButton *)button frame];
    [(UIButton *)button _lp_setCornerRadius:v17 / (double)v15];
  }
}

uint64_t __45__LPCaptionBarButtonView_layoutComponentView__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 416) shape];
  if (v2 == 2) {
    return 4;
  }
  if (v2 == 1) {
    return 2;
  }
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 416) actions];

  if (!v3) {
    return 2;
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 432) configuration];
  if (!v4) {
    return 4;
  }
  double v5 = (void *)v4;
  double v6 = [*(id *)(*(void *)(a1 + 32) + 432) configuration];
  double v7 = [v6 attributedTitle];

  if (v7) {
    return 4;
  }
  else {
    return 2;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    -[UISegmentedControl systemLayoutSizeFittingSize:](segmentedControl, "systemLayoutSizeFittingSize:", a3.width, a3.height);
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    -[UIButton systemLayoutSizeFittingSize:](self->_button, "systemLayoutSizeFittingSize:", a3.width, a3.height);
    double v6 = v9;
    double v8 = v10;
    double v11 = [(UIButton *)self->_button menu];

    if (v11)
    {
      BOOL v12 = [(LPButtonStyle *)self->_style indicatorSpacing];
      [v12 value];
      double v14 = v13;

      int v15 = [(LPButtonStyle *)self->_style menuMinimumWidth];
      [v15 value];
      double v6 = fmax(v6 + v14, v16);
    }
    double v17 = [(UIButton *)self->_button configuration];

    if (v17)
    {
      if (![(LPCaptionBarButtonView *)self _menuButtonShowsSingleImage])
      {
        uint64_t v18 = [(LPButtonStyle *)self->_style additionalVerticalPadding];
        [v18 value];
        double v8 = v8 + v19;
      }
      v20 = [(UIButton *)self->_button configuration];
      v21 = [v20 attributedTitle];

      if (v21)
      {
        [(LPCaptionButtonPresentationProperties *)self->_properties minimumWidth];
        if (v22 == 0.0)
        {
          v23 = [(LPButtonStyle *)self->_style minimumWidth];
          [v23 value];
          double v6 = fmax(v6, v24);
        }
        else
        {
          double v6 = fmax(v6, v22);
        }
      }
      else
      {
        double v6 = v8;
      }
    }
    if ([(LPCaptionBarButtonView *)self hasAnyText])
    {
      v25 = [(LPButtonStyle *)self->_style minimumWidth];
      [v25 value];
      double v27 = v26;

      v28 = [(LPButtonStyle *)self->_style height];
      [v28 value];
      double v30 = v29;
      if (v29 == 0.0)
      {
        v31 = [(LPButtonStyle *)self->_style minimumHeight];
        [v31 value];
        double v30 = v32;
      }
      double v6 = fmax(v6, v27);

      if (v30 != 0.0) {
        double v8 = fmax(v8, v30);
      }
    }
  }
  double v33 = v6;
  double v34 = v8;
  result.height = v34;
  result.width = v33;
  return result;
}

- (BOOL)hasAnyText
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(LPCaptionButtonPresentationProperties *)self->_properties text];
  if (v3)
  {

    return 1;
  }
  uint64_t v4 = [(LPCaptionButtonPresentationProperties *)self->_properties attributedText];

  if (v4) {
    return 1;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) visibleTitle];

        if (v9)
        {

          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  return 0;
}

- (CGSize)collapsedSizeThatFits:(CGSize)a3
{
  -[UIButton systemLayoutSizeFittingSize:](self->_collapsedButton, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:");
  [(UIButton *)self->_collapsedButton addTarget:v6 action:a4 forControlEvents:0x2000];
}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  -[UIButton removeTarget:action:forControlEvents:](self->_button, "removeTarget:action:forControlEvents:");
  [(UIButton *)self->_collapsedButton removeTarget:v6 action:a4 forControlEvents:0x2000];
}

- (void)createProgressIndicator
{
  double v3 = [LPCircularProgressIndicator alloc];
  double v4 = [(LPComponentView *)self host];
  double v5 = [(LPButtonStyle *)self->_style progressIndicatorStyle];
  id v6 = [(LPCircularProgressIndicator *)v3 initWithHost:v4 style:v5];
  progressIndicator = self->_progressIndicator;
  self->_progressIndicator = v6;

  [(LPCaptionBarButtonView *)self addSubview:self->_progressIndicator];

  [(LPCaptionBarButtonView *)self updateProgressIndicator];
}

- (void)updateProgressIndicator
{
  if (self->_progressIndicator)
  {
    double v3 = [(LPComponentView *)self host];
    id v5 = [v3 downloadProgressForComponentView:self];

    progressIndicator = self->_progressIndicator;
    [v5 progress];
    -[LPCircularProgressIndicator setProgress:](progressIndicator, "setProgress:");
  }
}

- (BOOL)shouldShowDownloadingIndicator
{
  double v3 = [(LPComponentView *)self host];
  uint64_t v4 = [v3 sharedObjectDownloadStateForComponentView:self];

  return v4 == 1;
}

- (void)selectAction:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setSelected:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [v4 setSelected:1];
}

- (void)performAction:(id)a3
{
  id v5 = a3;
  double v3 = [v5 handler];

  if (v3)
  {
    id v4 = [v5 handler];
    v4[2]();
  }
}

- (id)createSegmentedControl
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  unint64_t v3 = [v2 count];

  if (v3 < 2)
  {
    uint64_t v18 = 0;
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CA48];
    id v5 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
    uint64_t v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
    uint64_t v8 = 0;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v13 = [v12 visibleTitle];
          BOOL v14 = v13 == 0;

          if (!v14)
          {
            if ([v12 isSelected]) {
              uint64_t v8 = [v6 count];
            }
            int v15 = (void *)MEMORY[0x1E4FB13F0];
            uint64_t v16 = [v12 visibleTitle];
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __48__LPCaptionBarButtonView_createSegmentedControl__block_invoke;
            v24[3] = &unk_1E5B070A0;
            v24[4] = self;
            v24[5] = v12;
            double v17 = [v15 actionWithTitle:v16 image:0 identifier:0 handler:v24];
            [v6 addObject:v17];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:v6];
    [v18 setSelectedSegmentIndex:v8];
    [(LPCaptionBarButtonView *)self configureSegmentedControl:v18];
  }
  objc_msgSend(v18, "setAccessibilityIgnoresInvertColors:", -[LPButtonStyle ignoresInvertColors](self->_style, "ignoresInvertColors"));
  [v18 _setAutosizeText:1];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v19 = [v18 widthAnchor];
  v20 = [(LPButtonStyle *)self->_style minimumWidth];
  [v20 value];
  v21 = objc_msgSend(v19, "constraintGreaterThanOrEqualToConstant:");
  [v21 setActive:1];

  return v18;
}

uint64_t __48__LPCaptionBarButtonView_createSegmentedControl__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) selectAction:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 performAction:v3];
}

- (id)createButton
{
  uint64_t v3 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];

  id v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  if (v3) {
    [(LPCaptionBarButtonView *)self configureMenuButton:v4];
  }
  else {
    [(LPCaptionBarButtonView *)self configurePillButton:v4];
  }
  id v5 = [(LPButtonStyle *)self->_style padding];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [(LPCaptionButtonPresentationProperties *)self->_properties icon];
  if (v7)
  {
    uint64_t v8 = [(LPCaptionButtonPresentationProperties *)self->_properties text];
    if (v8 && v6)
    {
      uint64_t v9 = [(LPButtonStyle *)self->_style imagePadding];

      if (!v9) {
        goto LABEL_10;
      }
      uint64_t v10 = [LPPointUnit alloc];
      uint64_t v7 = [v6 leading];
      [v7 value];
      double v12 = v11;
      uint64_t v8 = [(LPButtonStyle *)self->_style imagePadding];
      [v8 value];
      BOOL v14 = [(LPPointUnit *)v10 initWithValue:v12 + v13];
      [v6 setLeading:v14];
    }
  }
LABEL_10:
  objc_msgSend(v6, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
  objc_msgSend(v4, "setContentEdgeInsets:");
  objc_msgSend(v4, "setAccessibilityIgnoresInvertColors:", -[LPButtonStyle ignoresInvertColors](self->_style, "ignoresInvertColors"));

  return v4;
}

- (id)createCollapsedButton
{
  uint64_t v3 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  id v4 = [(LPCaptionButtonPresentationProperties *)self->_properties collapsedButton];
  id v5 = [v4 backgroundColor];
  [v3 setBackgroundColor:v5];

  uint64_t v6 = [(LPCaptionButtonPresentationProperties *)self->_properties collapsedButton];
  uint64_t v7 = [v6 icon];
  uint64_t v8 = [v7 platformImage];
  [v3 setImage:v8 forState:0];

  return v3;
}

- (void)configurePillButton:(id)a3
{
  id v21 = a3;
  id v4 = [(LPCaptionButtonPresentationProperties *)self->_properties backgroundColor];
  id v5 = v4;
  if (!v4)
  {
    id v5 = [(LPButtonStyle *)self->_style backgroundColor];
  }
  [v21 setBackgroundColor:v5];
  if (!v4) {

  }
  uint64_t v6 = [(LPCaptionButtonPresentationProperties *)self->_properties attributedText];

  if (v6)
  {
    uint64_t v7 = [(LPCaptionButtonPresentationProperties *)self->_properties attributedText];
    [v21 setAttributedTitle:v7 forState:0];
  }
  else
  {
    uint64_t v8 = [(LPButtonStyle *)self->_style font];
    uint64_t v9 = [v21 titleLabel];
    [v9 setFont:v8];

    uint64_t v10 = [(LPCaptionButtonPresentationProperties *)self->_properties text];
    [v21 setTitle:v10 forState:0];

    uint64_t v7 = [(LPButtonStyle *)self->_style foregroundColor];
    [v21 setTitleColor:v7 forState:0];
  }

  [v21 setAccessibilityIdentifier:@"LPCaptionBarPillButton"];
  double v11 = [(LPCaptionButtonPresentationProperties *)self->_properties icon];

  if (v11)
  {
    double v12 = [(LPCaptionButtonPresentationProperties *)self->_properties icon];
    double v13 = [v12 platformImage];
    [v21 setImage:v13 forState:0];

    BOOL v14 = [(LPButtonStyle *)self->_style imagePadding];
    [v14 value];
    double v16 = v15;

    BOOL v17 = [(UIView *)self _lp_isLTR];
    if (v17) {
      double v18 = -v16;
    }
    else {
      double v18 = 0.0;
    }
    if (v17) {
      double v19 = 0.0;
    }
    else {
      double v19 = -v16;
    }
    objc_msgSend(v21, "setImageEdgeInsets:", 2.0, v18, 2.0, v19);
    v20 = [v21 imageView];
    [v20 setContentMode:1];
  }
  if ([(LPCaptionButtonPresentationProperties *)self->_properties disabled])
  {
    [v21 setEnabled:0];
    +[LPTheme disabledButtonOpacity];
    objc_msgSend(v21, "_lp_setOpacity:");
  }
}

- (void)configureSegmentedControl:(id)a3
{
}

- (void)configureMenuButton:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v4 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v67;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v67 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void **)(*((void *)&v66 + 1) + 8 * v7);
      if ([v8 isSelected]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v66 objects:v72 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v62 = v8;

    if (v62) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  uint64_t v9 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  id v62 = [v9 firstObject];

LABEL_12:
  uint64_t v10 = +[LPButtonConfiguration filledButtonConfiguration];
  double v11 = [v62 visibleTitle];
  if (v11 && (BOOL v12 = [(LPButtonStyle *)self->_style behavior] == 0, v11, v12))
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
    BOOL v17 = [v62 visibleTitle];
    uint64_t v70 = *MEMORY[0x1E4FB12B0];
    double v18 = [(LPButtonStyle *)self->_style menuFont];
    v71 = v18;
    double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    id v15 = (id)[v16 initWithString:v17 attributes:v19];

    [v10 setAttributedTitle:v15];
  }
  else
  {
    if ([(LPButtonStyle *)self->_style behavior] != 1) {
      goto LABEL_21;
    }
    double v13 = [(LPCaptionButtonPresentationProperties *)self->_properties attributedText];
    BOOL v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v21 = [(LPCaptionButtonPresentationProperties *)self->_properties text];
      id v15 = (id)[v20 initWithString:v21];
    }
    [v10 setAttributedTitle:v15];
  }

LABEL_21:
  id v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  if ([(LPCaptionBarButtonView *)self _menuButtonShowsIndicator])
  {
    objc_msgSend(v10, "_dci_setIndicator:", 2);
    [v63 setContentHorizontalAlignment:4];
  }
  else if ([(LPCaptionBarButtonView *)self _menuButtonShowsChevron])
  {
    v23 = [v10 attributedTitle];
    BOOL v24 = v23 == 0;

    if (!v24)
    {
      long long v25 = [(LPButtonStyle *)self->_style menuFont];
      long long v26 = [v25 fontDescriptor];
      v60 = [v26 objectForKey:*MEMORY[0x1E4FB2878]];

      v59 = objc_msgSend(MEMORY[0x1E4FB1830], "_lp_configurationWithTextStyle:weight:scale:", v60, 6, 1);
      id v27 = objc_alloc(MEMORY[0x1E4F28E48]);
      long long v28 = [v10 attributedTitle];
      double v29 = (void *)[v27 initWithAttributedString:v28];

      id v61 = objc_alloc_init(MEMORY[0x1E4FB1398]);
      uint64_t v30 = +[LPResources chevron];
      v31 = [v30 platformImage];
      double v32 = [v31 imageWithConfiguration:v59];
      double v33 = [v32 imageWithTintColor:v22];
      [v61 setImage:v33];

      double v34 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
      [v29 appendAttributedString:v34];

      v35 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v61];
      [v29 appendAttributedString:v35];

      [v10 setAttributedTitle:v29];
    }
  }
  if (![(LPButtonStyle *)self->_style useSystemButtonAppearance])
  {
    [v10 setButtonSize:0];
    v36 = [MEMORY[0x1E4FB1618] labelColor];
    [v10 setBaseForegroundColor:v36];

    v37 = [(LPButtonStyle *)self->_style menuBackgroundColor];
    [v10 setBaseBackgroundColor:v37];

    v38 = [v10 baseBackgroundColor];
    v39 = [MEMORY[0x1E4FB1618] clearColor];
    int v40 = [v38 isEqual:v39];

    if (v40)
    {
      uint64_t v41 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];

      v42 = [v63 layer];
      [v42 setBorderWidth:1.0];

      objc_msgSend(MEMORY[0x1E4FB1618], "_lp_systemFillColor");
      id v43 = objc_claimAutoreleasedReturnValue();
      uint64_t v44 = [v43 CGColor];
      v45 = [v63 layer];
      [v45 setBorderColor:v44];

      id v22 = (id)v41;
    }
    if ([(LPCaptionBarButtonView *)self _menuButtonShowsIndicator])
    {
      objc_msgSend(v10, "set_lp_indicatorColor:", v22);
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __46__LPCaptionBarButtonView_configureMenuButton___block_invoke;
      v64[3] = &unk_1E5B068E8;
      id v22 = v22;
      id v65 = v22;
      objc_msgSend(v10, "_dci_setIndicatorColorTransformer:", v64);
    }
  }
  if ([(LPCaptionBarButtonView *)self _menuButtonShowsImages])
  {
    v46 = [v62 visibleImage];
    v47 = [v46 platformImage];
    [v10 setImage:v47];

    if (![(LPButtonStyle *)self->_style useSystemButtonAppearance])
    {
      BOOL v48 = [(LPCaptionBarButtonView *)self _menuButtonShowsSingleImage];
      style = self->_style;
      if (v48)
      {
        v50 = [(LPButtonStyle *)style symbolConfiguration];
        [v10 setPreferredSymbolConfigurationForImage:v50];
      }
      else
      {
        v51 = [(LPButtonStyle *)style menuFont];
        v52 = [v51 fontDescriptor];
        v50 = [v52 objectForKey:*MEMORY[0x1E4FB2878]];

        v53 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v50 scale:1];
        [v10 setPreferredSymbolConfigurationForImage:v53];
      }
    }
    [v10 setImagePadding:4.0];
  }
  [v63 setConfiguration:v10];
  if ([(LPCaptionBarButtonView *)self _menuButtonShowsSingleImage]
    || [(LPButtonStyle *)self->_style prefersBehavioralStylePad])
  {
    [v63 setPreferredBehavioralStyle:1];
  }
  v54 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  BOOL v55 = (unint64_t)[v54 count] > 1;

  if (v55)
  {
    v56 = [(LPCaptionBarButtonView *)self createMenu];
    [v63 setMenu:v56];

    [v63 setShowsMenuAsPrimaryAction:1];
    [v63 setPreferredMenuElementOrder:2];
  }
  else
  {
    v57 = [v62 handler];
    BOOL v58 = v57 == 0;

    if (v58) {
      objc_msgSend(v63, "setUserInteractionEnabled:", -[LPButtonStyle enableUserInteractionForDecorativeButton](self->_style, "enableUserInteractionForDecorativeButton"));
    }
  }
}

id __46__LPCaptionBarButtonView_configureMenuButton___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)createUIActionsFromLPActionsWithHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  uint64_t v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([(LPCaptionBarButtonView *)self _menuButtonShowsImages])
        {
          double v11 = [v10 image];
          BOOL v12 = [v11 platformImage];
        }
        else
        {
          BOOL v12 = 0;
        }
        double v13 = (void *)MEMORY[0x1E4FB13F0];
        BOOL v14 = [v10 title];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __66__LPCaptionBarButtonView_createUIActionsFromLPActionsWithHandler___block_invoke;
        v20[3] = &unk_1E5B070C8;
        id v15 = v19;
        v20[4] = v10;
        id v21 = v15;
        id v16 = [v13 actionWithTitle:v14 image:v12 identifier:0 handler:v20];

        if ([v10 isSelected]) {
          [v16 setState:1];
        }
        [v6 addObject:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  return v6;
}

uint64_t __66__LPCaptionBarButtonView_createUIActionsFromLPActionsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)createMenu
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__LPCaptionBarButtonView_createMenu__block_invoke;
  aBlock[3] = &unk_1E5B070F0;
  aBlock[4] = self;
  uint64_t v3 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__LPCaptionBarButtonView_createMenu__block_invoke_2;
  v10[3] = &unk_1E5B07140;
  v10[4] = self;
  id v4 = v3;
  id v11 = v4;
  uint64_t v5 = __36__LPCaptionBarButtonView_createMenu__block_invoke_2((uint64_t)v10);
  uint64_t v6 = (void *)MEMORY[0x1E4FB1970];
  uint64_t v7 = [(LPCaptionBarButtonView *)self createUIActionsFromLPActionsWithHandler:v5];
  uint64_t v8 = [v6 menuWithChildren:v7];

  return v8;
}

void __36__LPCaptionBarButtonView_createMenu__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "performAction:");
  uint64_t v3 = [*(id *)(a1 + 32) createMenu];
  [*(id *)(*(void *)(a1 + 32) + 432) setMenu:v3];

  id v4 = [*(id *)(a1 + 32) host];
  [v4 componentViewDidChangeIntrinsicContentSize:*(void *)(a1 + 32)];
}

id __36__LPCaptionBarButtonView_createMenu__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 424) behavior];
  if (v3 == 1)
  {
    v1 = _Block_copy(*(const void **)(a1 + 40));
  }
  else if (!v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__LPCaptionBarButtonView_createMenu__block_invoke_3;
    v6[3] = &unk_1E5B07118;
    id v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    v1 = _Block_copy(v6);
  }

  return v1;
}

void __36__LPCaptionBarButtonView_createMenu__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __36__LPCaptionBarButtonView_createMenu__block_invoke_4;
  uint64_t v9 = &unk_1E5B04E18;
  uint64_t v10 = *(void *)(a1 + 32);
  id v4 = v3;
  id v11 = v4;
  id v5 = _Block_copy(&v6);
  objc_msgSend(MEMORY[0x1E4FB1EB0], "performWithoutAnimation:", v5, v6, v7, v8, v9, v10);
  [*(id *)(a1 + 32) selectAction:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __36__LPCaptionBarButtonView_createMenu__block_invoke_4(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 32) + 432);
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v5 = [v2[1] visibleTitle];
  uint64_t v13 = *MEMORY[0x1E4FB12B0];
  uint64_t v6 = [*((id *)*v2 + 53) menuFont];
  v14[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v8 = (void *)[v4 initWithString:v5 attributes:v7];
  [v3 setAttributedTitle:v8 forState:0];

  if ([*(id *)(a1 + 32) _menuButtonShowsImages])
  {
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 432);
    uint64_t v10 = [*(id *)(a1 + 40) visibleImage];
    id v11 = [v10 platformImage];
    [v9 setImage:v11 forState:0];
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "_lp_layoutIfNeeded");
}

- (BOOL)_menuButtonShowsImages
{
  return 1;
}

- (BOOL)_menuButtonShowsIndicator
{
  uint64_t v2 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (BOOL)_menuButtonShowsChevron
{
  if (![(LPButtonStyle *)self->_style showsChevronForSingleAction]) {
    return 0;
  }
  BOOL v3 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  if ([v3 count] == 1)
  {
    id v4 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
    id v5 = [v4 firstObject];
    uint64_t v6 = [v5 handler];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_menuButtonShowsSingleImage
{
  BOOL v3 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  id v5 = [(LPCaptionButtonPresentationProperties *)self->_properties actions];
  uint64_t v6 = [v5 firstObject];

  BOOL v7 = [v6 image];
  if (v7)
  {
    uint64_t v8 = [v6 title];
    BOOL v9 = v8 == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_collapsedButton, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end