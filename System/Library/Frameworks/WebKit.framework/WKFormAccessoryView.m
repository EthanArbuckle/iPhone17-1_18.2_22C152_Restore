@interface WKFormAccessoryView
- (BOOL)isNextEnabled;
- (BOOL)isPreviousEnabled;
- (UIBarButtonItem)autoFillButtonItem;
- (WKFormAccessoryView)initWithInputAssistantItem:(id)a3 delegate:(id)a4;
- (double)contentRatio;
- (id).cxx_construct;
- (id)_autoFillButton;
- (id)_initForUniversalControlBar:(id)a3;
- (void)_applyTreatmentToAutoFillLabel;
- (void)_autoFill;
- (void)_done;
- (void)_nextTapped;
- (void)_previousTapped;
- (void)_refreshAutofillPresentation;
- (void)_updateFrame;
- (void)hideAutoFillButton;
- (void)layoutSubviews;
- (void)setNextEnabled:(BOOL)a3;
- (void)setNextPreviousItemsVisible:(BOOL)a3;
- (void)setPreviousEnabled:(BOOL)a3;
- (void)showAutoFillButtonWithTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WKFormAccessoryView

- (id)_initForUniversalControlBar:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  self->_usesUniversalControlBar = 1;
  v5 = (void *)[MEMORY[0x1E4F427E0] buttonWithType:1];
  [v5 addTarget:self action:sel__autoFill forControlEvents:64];
  [(WKFormAccessoryView *)self bounds];
  double v7 = v6;
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 0.0);
  objc_msgSend(v5, "setTintColor:", objc_msgSend(MEMORY[0x1E4F428B8], "labelColor"));
  v8 = (void *)[v5 titleLabel];
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, 0.0, v7);
  [v8 setNumberOfLines:2];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v5];
  m_ptr = self->_autoFillButtonItem.m_ptr;
  self->_autoFillButtonItem.m_ptr = v9;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  id v11 = objc_alloc(MEMORY[0x1E4F427C0]);
  v12 = objc_msgSend(v11, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"chevron.up"), 0, self, sel__previousTapped);
  v13 = self->_previousItem.m_ptr;
  self->_previousItem.m_ptr = v12;
  if (v13)
  {
    CFRelease(v13);
    v12 = self->_previousItem.m_ptr;
  }
  objc_msgSend(v12, "setTintColor:", objc_msgSend(MEMORY[0x1E4F428B8], "blackColor"));
  [self->_previousItem.m_ptr setEnabled:0];
  id v14 = objc_alloc(MEMORY[0x1E4F427C0]);
  v15 = objc_msgSend(v14, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"chevron.down"), 0, self, sel__nextTapped);
  v16 = self->_nextItem.m_ptr;
  self->_nextItem.m_ptr = v15;
  if (v16)
  {
    CFRelease(v16);
    v15 = self->_nextItem.m_ptr;
  }
  objc_msgSend(v15, "setTintColor:", objc_msgSend(MEMORY[0x1E4F428B8], "blackColor"));
  [self->_nextItem.m_ptr setEnabled:0];
  id v17 = objc_alloc(MEMORY[0x1E4F427C8]);
  v28[0] = self->_autoFillButtonItem.m_ptr;
  v18 = objc_msgSend(v17, "initWithBarButtonItems:representativeItem:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 1), 0);
  v19 = self->_buttonGroupAutoFill.m_ptr;
  self->_buttonGroupAutoFill.m_ptr = v18;
  if (v19)
  {
    CFRelease(v19);
    v18 = self->_buttonGroupAutoFill.m_ptr;
  }
  [v18 setHidden:1];
  id v20 = objc_alloc(MEMORY[0x1E4F427C8]);
  v21 = self->_nextItem.m_ptr;
  v27[0] = self->_previousItem.m_ptr;
  v27[1] = v21;
  v22 = objc_msgSend(v20, "initWithBarButtonItems:representativeItem:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 2), 0);
  v23 = self->_buttonGroupNavigation.m_ptr;
  self->_buttonGroupNavigation.m_ptr = v22;
  if (v23) {
    CFRelease(v23);
  }
  v24 = objc_msgSend((id)objc_msgSend(a3, "leadingBarButtonGroups"), "mutableCopy");
  [v24 addObject:self->_buttonGroupAutoFill.m_ptr];
  [a3 setLeadingBarButtonGroups:v24];
  v25 = objc_msgSend((id)objc_msgSend(a3, "trailingBarButtonGroups"), "mutableCopy");
  [v25 addObject:self->_buttonGroupNavigation.m_ptr];
  [a3 setTrailingBarButtonGroups:v25];
  if (v25) {
    CFRelease(v25);
  }
  if (v24) {
    CFRelease(v24);
  }
  return self;
}

- (WKFormAccessoryView)initWithInputAssistantItem:(id)a3 delegate:(id)a4
{
  double v6 = [(WKFormAccessoryView *)self init];
  double v7 = v6;
  if (!v6) {
    return v7;
  }
  objc_storeWeak((id *)&v6->_delegate, a4);
  v8 = (void *)[(WKFormAccessoryView *)v7 subviews];
  v9 = (void *)[v8 firstObject];
  v10 = v9;
  if (v9) {
    CFRetain(v9);
  }
  m_ptr = v7->_leftContainerView.m_ptr;
  v7->_leftContainerView.m_ptr = v10;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v12 = (void *)[v8 lastObject];
  v13 = v12;
  if (v12) {
    CFRetain(v12);
  }
  id v14 = v7->_rightContainerView.m_ptr;
  v7->_rightContainerView.m_ptr = v13;
  if (v14) {
    CFRelease(v14);
  }
  if (PAL::currentUserInterfaceIdiomIsSmallScreen((PAL *)v14))
  {
    v15 = (void *)[MEMORY[0x1E4F1CA48] array];
    id v16 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v17 = objc_msgSend(v16, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"chevron.up"), 0, v7, sel__previousTapped);
    v18 = v7->_previousItem.m_ptr;
    v7->_previousItem.m_ptr = v17;
    if (v18)
    {
      CFRelease(v18);
      id v17 = v7->_previousItem.m_ptr;
    }
    [v17 setEnabled:0];
    [v15 addObject:v7->_previousItem.m_ptr];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:6 target:0 action:0];
    id v20 = v7->_nextPreviousSpacer.m_ptr;
    v7->_nextPreviousSpacer.m_ptr = v19;
    if (v20)
    {
      CFRelease(v20);
      v19 = v7->_nextPreviousSpacer.m_ptr;
    }
    [v19 setWidth:6.0];
    [v15 addObject:v7->_nextPreviousSpacer.m_ptr];
    id v21 = objc_alloc(MEMORY[0x1E4F427C0]);
    v22 = objc_msgSend(v21, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"chevron.down"), 0, v7, sel__nextTapped);
    v23 = v7->_nextItem.m_ptr;
    v7->_nextItem.m_ptr = v22;
    if (v23)
    {
      CFRelease(v23);
      v22 = v7->_nextItem.m_ptr;
    }
    [v22 setEnabled:0];
    [v15 addObject:v7->_nextItem.m_ptr];
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:5 target:0 action:0];
    v25 = v7->_flexibleSpaceItem.m_ptr;
    v7->_flexibleSpaceItem.m_ptr = (void *)v24;
    if (v25) {
      CFRelease(v25);
    }
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:6 target:0 action:0];
    v27 = v7->_autoFillButtonItemSpacer.m_ptr;
    v7->_autoFillButtonItemSpacer.m_ptr = v26;
    if (v27)
    {
      CFRelease(v27);
      v26 = v7->_autoFillButtonItemSpacer.m_ptr;
    }
    [v26 setWidth:6.0];
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v7 action:sel__done];
    v29 = v7->_doneButton.m_ptr;
    v7->_doneButton.m_ptr = (void *)v28;
    if (v29) {
      CFRelease(v29);
    }
    [v15 addObject:v7->_flexibleSpaceItem.m_ptr];
    [v15 addObject:v7->_doneButton.m_ptr];
    id v30 = objc_alloc_init(MEMORY[0x1E4F42F60]);
    [v30 setBarStyle:0];
    [v30 setTranslucent:1];
    [v30 setAutoresizingMask:18];
    [v30 setItems:v15];
    v31 = v7->_leftToolbar.m_ptr;
    v7->_leftToolbar.m_ptr = v30;
    if (v31)
    {
      CFRelease(v31);
      id v30 = v7->_leftToolbar.m_ptr;
    }
    [v7->_leftContainerView.m_ptr addSubview:v30];
    id v32 = objc_alloc_init(MEMORY[0x1E4F42F60]);
    [v32 setBarStyle:0];
    [v32 setTranslucent:1];
    [v32 setAutoresizingMask:18];
    [v32 setItems:MEMORY[0x1E4F1CBF0]];
    v33 = v7->_rightToolbar.m_ptr;
    v7->_rightToolbar.m_ptr = v32;
    if (v33)
    {
      CFRelease(v33);
      id v32 = v7->_rightToolbar.m_ptr;
    }
    [v7->_rightContainerView.m_ptr addSubview:v32];
    [(WKFormAccessoryView *)v7 _updateFrame];
    v34 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v7 selector:sel__updateFrame name:*MEMORY[0x1E4F43658] object:0];
    return v7;
  }

  return (WKFormAccessoryView *)[(WKFormAccessoryView *)v7 _initForUniversalControlBar:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WKFormAccessoryView;
  -[WKFormAccessoryView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_);
  v5 = (void *)[(WKFormAccessoryView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:a3])
  {
    double v6 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    v8 = (void *)[v6 dictionaryWithObject:v7 forKey:*MEMORY[0x1E4F42508]];
    if ([v5 userInterfaceStyle] == 2)
    {
      uint64_t v9 = [MEMORY[0x1E4F428B8] whiteColor];
      [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F42510]];
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(WKFormAccessoryView *)self setTintColor:v9];
    [self->_doneButton.m_ptr setTitleTextAttributes:v8 forState:0];
  }
}

- (void)_updateFrame
{
  [(WKFormAccessoryView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  objc_msgSend(self->_leftToolbar.m_ptr, "sizeThatFits:", v7, v9);

  -[UIInputView setFrame:](self, "setFrame:", v4, v6, v8, v10);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)WKFormAccessoryView;
  [(WKFormAccessoryView *)&v5 layoutSubviews];
  if (!self->_usesUniversalControlBar || ([self->_buttonGroupAutoFill.m_ptr isHidden] & 1) == 0)
  {
    if (self->_autoFillButtonItem.m_ptr)
    {
      [(WKFormAccessoryView *)self _refreshAutofillPresentation];
      [(WKFormAccessoryView *)self _applyTreatmentToAutoFillLabel];
      m_ptr = self->_autoFillButtonItem.m_ptr;
      objc_msgSend(-[WKFormAccessoryView _autoFillButton](self, "_autoFillButton"), "frame");
      [m_ptr setWidth:v4];
    }
  }
}

- (void)_done
{
  id Weak = objc_loadWeak((id *)&self->_delegate);

  [Weak accessoryViewDone:self];
}

- (void)_previousTapped
{
  id Weak = objc_loadWeak((id *)&self->_delegate);

  [Weak accessoryView:self tabInDirection:1];
}

- (void)_nextTapped
{
  id Weak = objc_loadWeak((id *)&self->_delegate);

  [Weak accessoryView:self tabInDirection:0];
}

- (void)_autoFill
{
  id Weak = objc_loadWeak((id *)&self->_delegate);

  [Weak accessoryViewAutoFill:self];
}

- (id)_autoFillButton
{
  v2 = (void *)[self->_autoFillButtonItem.m_ptr customView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (void)_refreshAutofillPresentation
{
  if (self->_autoFillButtonItem.m_ptr)
  {
    [self->_leftContainerView.m_ptr frame];
    double MaxX = CGRectGetMaxX(v9);
    [self->_rightContainerView.m_ptr frame];
    double MinX = CGRectGetMinX(v10);
    objc_super v5 = objc_msgSend((id)objc_msgSend(self->_leftToolbar.m_ptr, "items"), "mutableCopy");
    double v6 = objc_msgSend((id)objc_msgSend(self->_rightToolbar.m_ptr, "items"), "mutableCopy");
    [v5 removeObject:self->_autoFillButtonItemSpacer.m_ptr];
    [v5 removeObject:self->_autoFillButtonItem.m_ptr];
    [v6 removeObject:self->_flexibleSpaceItem.m_ptr];
    [v6 removeObject:self->_autoFillButtonItem.m_ptr];
    if (MaxX == MinX)
    {
      if ([v5 containsObject:self->_nextItem.m_ptr]) {
        uint64_t v7 = [v5 indexOfObject:self->_nextItem.m_ptr] + 1;
      }
      else {
        uint64_t v7 = 0;
      }
      [v5 insertObject:self->_autoFillButtonItemSpacer.m_ptr atIndex:v7];
      [v5 insertObject:self->_autoFillButtonItem.m_ptr atIndex:v7 + 1];
    }
    else
    {
      [v6 insertObject:self->_flexibleSpaceItem.m_ptr atIndex:0];
      [v6 addObject:self->_autoFillButtonItem.m_ptr];
    }
    [self->_leftToolbar.m_ptr setItems:v5];
    [self->_rightToolbar.m_ptr setItems:v6];
    if (v6) {
      CFRelease(v6);
    }
    if (v5)
    {
      CFRelease(v5);
    }
  }
}

- (void)_applyTreatmentToAutoFillLabel
{
  id v3 = [(WKFormAccessoryView *)self _autoFillButton];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  id v20 = __Block_byref_object_copy__557;
  id v21 = __Block_byref_object_dispose__558;
  uint64_t v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__WKFormAccessoryView__applyTreatmentToAutoFillLabel__block_invoke;
  v16[3] = &unk_1E58137C8;
  v16[4] = v3;
  v16[5] = &v17;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v16];
  [(id)v18[5] frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F42A30], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E4F42A38], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F438C8]), 0.0);
  [(id)v18[5] setFont:v10];
  uint64_t v11 = objc_msgSend((id)-[WKFormAccessoryView traitCollection](self, "traitCollection"), "horizontalSizeClass");
  objc_msgSend((id)v18[5], "sizeThatFits:", 1.79769313e308, v9);
  if (v11 == 1) {
    double v13 = 180.0;
  }
  else {
    double v13 = 200.0;
  }
  if (v12 > v13)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F42A30], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E4F42A38], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F43890]), 0.0);
    [(id)v18[5] setFont:v14];
  }
  objc_msgSend((id)v18[5], "sizeThatFits:", v13, 1.79769313e308);
  objc_msgSend((id)v18[5], "setFrame:", v5, v7, v15, v9);
  [v3 frame];
  objc_msgSend(v3, "setFrame:");
  _Block_object_dispose(&v17, 8);
}

uint64_t __53__WKFormAccessoryView__applyTreatmentToAutoFillLabel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) titleLabel];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)hideAutoFillButton
{
  if (self->_autoFillButtonItem.m_ptr)
  {
    id v3 = objc_msgSend((id)objc_msgSend(self->_leftToolbar.m_ptr, "items"), "mutableCopy");
    [v3 removeObject:self->_autoFillButtonItem.m_ptr];
    [self->_leftToolbar.m_ptr setItems:v3];
    if (self->_usesUniversalControlBar)
    {
      [self->_buttonGroupAutoFill.m_ptr setHidden:1];
    }
    else
    {
      m_ptr = self->_autoFillButtonItem.m_ptr;
      self->_autoFillButtonItem.m_ptr = 0;
      if (m_ptr) {
        CFRelease(m_ptr);
      }
    }
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

- (void)showAutoFillButtonWithTitle:(id)a3
{
  id v5 = [(WKFormAccessoryView *)self _autoFillButton];
  if (!v5)
  {
    id v5 = (id)[MEMORY[0x1E4F427E0] buttonWithType:1];
    [v5 addTarget:self action:sel__autoFill forControlEvents:64];
    [(WKFormAccessoryView *)self bounds];
    double v7 = v6;
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, 0.0);
    double v8 = (void *)[v5 titleLabel];
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 0.0, v7);
    [v8 setNumberOfLines:2];
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v5];
    m_ptr = self->_autoFillButtonItem.m_ptr;
    self->_autoFillButtonItem.m_ptr = v9;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(v5, "titleForState:", 0)) & 1) == 0) {
    [v5 setTitle:a3 forState:0];
  }
  if (self->_usesUniversalControlBar) {
    [self->_buttonGroupAutoFill.m_ptr setHidden:0];
  }

  [(WKFormAccessoryView *)self setNeedsLayout];
}

- (UIBarButtonItem)autoFillButtonItem
{
  return (UIBarButtonItem *)self->_autoFillButtonItem.m_ptr;
}

- (void)setNextPreviousItemsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_usesUniversalControlBar)
  {
    m_ptr = self->_buttonGroupNavigation.m_ptr;
    BOOL v6 = !a3;
    [m_ptr setHidden:v6];
  }
  else
  {
    double v7 = (void *)[self->_leftToolbar.m_ptr items];
    int v8 = [v7 containsObject:self->_previousItem.m_ptr];
    int v9 = [v7 containsObject:self->_nextPreviousSpacer.m_ptr];
    int v10 = [v7 containsObject:self->_nextItem.m_ptr];
    int v11 = v10;
    if (!v3 || (v8 ? (BOOL v12 = v9 == 0) : (BOOL v12 = 1), v12 || (v10 & 1) == 0))
    {
      if ((v3 | v8 | v9 | v10) == 1)
      {
        double v13 = (void *)[v7 mutableCopy];
        uint64_t v14 = v13;
        if (v3)
        {
          if ((v11 & 1) == 0) {
            [v13 insertObject:self->_nextItem.m_ptr atIndex:0];
          }
          if ((v9 & 1) == 0) {
            [v14 insertObject:self->_nextPreviousSpacer.m_ptr atIndex:0];
          }
          if ((v8 & 1) == 0) {
            [v14 insertObject:self->_previousItem.m_ptr atIndex:0];
          }
        }
        else
        {
          if (v8) {
            [v13 removeObject:self->_previousItem.m_ptr];
          }
          if (v9) {
            [v14 removeObject:self->_nextPreviousSpacer.m_ptr];
          }
          if (v11) {
            [v14 removeObject:self->_nextItem.m_ptr];
          }
        }
        [self->_leftToolbar.m_ptr setItems:v14];
        [(WKFormAccessoryView *)self setNeedsLayout];
        if (v14)
        {
          CFRelease(v14);
        }
      }
    }
  }
}

- (void)setNextEnabled:(BOOL)a3
{
}

- (BOOL)isNextEnabled
{
  return [self->_nextItem.m_ptr isEnabled];
}

- (void)setPreviousEnabled:(BOOL)a3
{
}

- (BOOL)isPreviousEnabled
{
  return [self->_previousItem.m_ptr isEnabled];
}

- (double)contentRatio
{
  return 1.0;
}

- (void).cxx_destruct
{
  m_ptr = self->_rightContainerView.m_ptr;
  self->_rightContainerView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  double v4 = self->_leftContainerView.m_ptr;
  self->_leftContainerView.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  id v5 = self->_buttonGroupNavigation.m_ptr;
  self->_buttonGroupNavigation.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  BOOL v6 = self->_buttonGroupAutoFill.m_ptr;
  self->_buttonGroupAutoFill.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  double v7 = self->_autoFillButtonItemSpacer.m_ptr;
  self->_autoFillButtonItemSpacer.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  int v8 = self->_autoFillButtonItem.m_ptr;
  self->_autoFillButtonItem.m_ptr = 0;
  if (v8) {
    CFRelease(v8);
  }
  int v9 = self->_nextPreviousSpacer.m_ptr;
  self->_nextPreviousSpacer.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  int v10 = self->_nextItem.m_ptr;
  self->_nextItem.m_ptr = 0;
  if (v10) {
    CFRelease(v10);
  }
  int v11 = self->_previousItem.m_ptr;
  self->_previousItem.m_ptr = 0;
  if (v11) {
    CFRelease(v11);
  }
  BOOL v12 = self->_flexibleSpaceItem.m_ptr;
  self->_flexibleSpaceItem.m_ptr = 0;
  if (v12) {
    CFRelease(v12);
  }
  double v13 = self->_doneButton.m_ptr;
  self->_doneButton.m_ptr = 0;
  if (v13) {
    CFRelease(v13);
  }
  uint64_t v14 = self->_rightToolbar.m_ptr;
  self->_rightToolbar.m_ptr = 0;
  if (v14) {
    CFRelease(v14);
  }
  double v15 = self->_leftToolbar.m_ptr;
  self->_leftToolbar.m_ptr = 0;
  if (v15) {
    CFRelease(v15);
  }

  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((void *)self + 79) = 0;
  *((void *)self + 80) = 0;
  *((void *)self + 81) = 0;
  *((void *)self + 82) = 0;
  *((void *)self + 83) = 0;
  *((void *)self + 84) = 0;
  *((void *)self + 85) = 0;
  *((void *)self + 86) = 0;
  *((void *)self + 87) = 0;
  *((void *)self + 88) = 0;
  *((void *)self + 89) = 0;
  *((void *)self + 90) = 0;
  *((void *)self + 91) = 0;
  return self;
}

@end