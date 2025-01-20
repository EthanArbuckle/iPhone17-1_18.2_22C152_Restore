@interface SFBarButtonItemLongPressGestureRecognizer
+ (id)gestureRecognizerTarget:(id)a3 longPressAction:(SEL)a4 touchDownAction:(SEL)a5 attachedToBarButtonItem:(id)a6;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_invokeLongPressAction;
- (void)_updateMinimumPressDurationForContentSizeCategory:(id)a3;
- (void)longPress:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SFBarButtonItemLongPressGestureRecognizer

+ (id)gestureRecognizerTarget:(id)a3 longPressAction:(SEL)a4 touchDownAction:(SEL)a5 attachedToBarButtonItem:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = (id *)objc_alloc_init((Class)a1);
  [v12 addTarget:v12 action:sel_longPress_];
  objc_msgSend(MEMORY[0x1E4FB14A8], "_sf_longPressAllowableMovement");
  objc_msgSend(v12, "setAllowableMovement:");
  [v12 setDelegate:v12];
  objc_storeWeak(v12 + 62, v10);

  if (a4) {
    SEL v13 = a4;
  }
  else {
    SEL v13 = 0;
  }
  v12[64] = (id)v13;
  objc_storeWeak(v12 + 63, v11);

  if (a5) {
    SEL v14 = a5;
  }
  else {
    SEL v14 = 0;
  }
  v12[65] = (id)v14;
  [v12 setButtonMaskRequired:3];
  v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  v16 = [v15 preferredContentSizeCategory];

  [v12 _updateMinimumPressDurationForContentSizeCategory:v16];
  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:v12 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  return v12;
}

- (void)_updateMinimumPressDurationForContentSizeCategory:(id)a3
{
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  double v5 = 0.5;
  if (IsAccessibilityCategory) {
    double v5 = 1.0;
  }

  [(SFBarButtonItemLongPressGestureRecognizer *)self setMinimumPressDuration:v5];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFBarButtonItemLongPressGestureRecognizer;
  [(SFBarButtonItemLongPressGestureRecognizer *)&v15 touchesBegan:v6 withEvent:v7];
  if (![(SFBarButtonItemLongPressGestureRecognizer *)self state])
  {
    id v8 = v7;
    if (([v8 _keyModifierFlags] & 0x40000) != 0)
    {
    }
    else
    {
      char v9 = [v8 buttonMask];

      if ((v9 & 2) == 0) {
        goto LABEL_7;
      }
    }
    [(SFBarButtonItemLongPressGestureRecognizer *)self setState:1];
  }
LABEL_7:
  if (![(SFBarButtonItemLongPressGestureRecognizer *)self state])
  {
    p_touchDownAction = &self->_touchDownAction;
    if (self->_touchDownAction)
    {
      id v11 = [MEMORY[0x1E4FB1438] sharedApplication];
      if (*p_touchDownAction) {
        SEL v12 = *p_touchDownAction;
      }
      else {
        SEL v12 = 0;
      }
      id WeakRetained = objc_loadWeakRetained(&self->_target);
      id v14 = objc_loadWeakRetained((id *)&self->_barButtonItem);
      [v11 sendAction:v12 to:WeakRetained from:v14 forEvent:0];
    }
  }
}

- (void)longPress:(id)a3
{
  if ([(SFBarButtonItemLongPressGestureRecognizer *)self state] == 1)
  {
    [(SFBarButtonItemLongPressGestureRecognizer *)self _invokeLongPressAction];
  }
}

- (void)_invokeLongPressAction
{
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  if (self->_longPressAction) {
    SEL longPressAction = self->_longPressAction;
  }
  else {
    SEL longPressAction = 0;
  }
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  id v5 = objc_loadWeakRetained((id *)&self->_barButtonItem);
  [v6 sendAction:longPressAction to:WeakRetained from:v5 forEvent:0];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB27E0]];

  [(SFBarButtonItemLongPressGestureRecognizer *)self _updateMinimumPressDurationForContentSizeCategory:v5];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_longPressAction) {
      SEL longPressAction = self->_longPressAction;
    }
    else {
      SEL longPressAction = 0;
    }
    id v8 = objc_loadWeakRetained((id *)&self->_barButtonItem);
    char v7 = [WeakRetained canPerformAction:longPressAction withSender:v8];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);

  objc_destroyWeak((id *)&self->_barButtonItem);
}

@end