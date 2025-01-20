@interface LACUIKeyboard
+ (id)activeKeyboard;
- (CGRect)frame;
- (void)setRenderInProcess:(BOOL)a3;
- (void)setupInParentView:(id)a3;
- (void)updateTopLayoutGuide:(id)a3;
@end

@implementation LACUIKeyboard

+ (id)activeKeyboard
{
  if (activeKeyboard_onceToken != -1) {
    dispatch_once(&activeKeyboard_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)activeKeyboard_sharedInstance;
  return v2;
}

uint64_t __31__LACUIKeyboard_activeKeyboard__block_invoke()
{
  activeKeyboard_sharedInstance = objc_alloc_init(LACUIKeyboard);
  return MEMORY[0x270F9A758]();
}

- (void)setupInParentView:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(LACUIKeyboard *)self setRenderInProcess:1];
  id v5 = objc_alloc_init(MEMORY[0x263F82BF8]);
  [v5 setAxis:1];
  [v5 setAlignment:3];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = objc_alloc_init(LACUIKeyboardView);
  [v5 addArrangedSubview:v6];

  objc_msgSend(v5, "setDirectionalLayoutMargins:", 0.0, 0.0, 40.0, 0.0);
  [v5 setLayoutMarginsRelativeArrangement:1];
  [v4 addSubview:v5];
  v7 = [v5 centerXAnchor];
  v8 = [v4 centerXAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  keyboardAnchorHorizontal = self->_keyboardAnchorHorizontal;
  self->_keyboardAnchorHorizontal = v9;

  v11 = [v5 bottomAnchor];
  v12 = [v4 bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  keyboardAnchorVertical = self->_keyboardAnchorVertical;
  self->_keyboardAnchorVertical = v13;

  [(NSLayoutConstraint *)self->_keyboardAnchorVertical setIdentifier:@"default.vertical"];
  [(NSLayoutConstraint *)self->_keyboardAnchorHorizontal setIdentifier:@"default.horizontal"];
  v15 = (void *)MEMORY[0x263F08938];
  v16 = self->_keyboardAnchorVertical;
  v18[0] = self->_keyboardAnchorHorizontal;
  v18[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [v15 activateConstraints:v17];

  objc_storeWeak((id *)&self->_keyboardContainer, v5);
  objc_storeWeak((id *)&self->_parentView, v4);
}

- (void)updateTopLayoutGuide:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = [v4 owningView];
    id v8 = objc_loadWeakRetained((id *)&self->_parentView);
    int v9 = [v7 isDescendantOfView:v8];

    if (v9)
    {
      v10 = [(NSLayoutConstraint *)self->_keyboardAnchorVertical identifier];
      if ([v10 isEqualToString:@"default.vertical"]) {
        double v11 = 0.0;
      }
      else {
        double v11 = 0.2;
      }

      objc_initWeak(&location, self);
      v12 = (void *)MEMORY[0x263F82E00];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __38__LACUIKeyboard_updateTopLayoutGuide___block_invoke;
      v13[3] = &unk_2653BCB40;
      objc_copyWeak(&v15, &location);
      id v14 = v4;
      [v12 animateWithDuration:v13 animations:v11];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __38__LACUIKeyboard_updateTopLayoutGuide___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v9 = WeakRetained;
    [WeakRetained[3] setActive:0];
    id v3 = objc_loadWeakRetained(v9 + 1);
    id v4 = [v3 topAnchor];
    id v5 = [*(id *)(a1 + 32) bottomAnchor];
    uint64_t v6 = [v4 constraintEqualToAnchor:v5];
    id v7 = v9[3];
    v9[3] = (id)v6;

    [v9[3] setActive:1];
    id v8 = objc_loadWeakRetained(v9 + 2);
    [v8 layoutIfNeeded];

    id WeakRetained = v9;
  }
}

- (void)setRenderInProcess:(BOOL)a3
{
}

- (CGRect)frame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardContainer);
  [WeakRetained frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardAnchorHorizontal, 0);
  objc_storeStrong((id *)&self->_keyboardAnchorVertical, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_keyboardContainer);
}

@end