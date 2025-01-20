@interface PKPaletteBarButton
+ (id)_imageByApplyingDefaultImageSymbolConfigurationWithImage:(id)a3;
- (PKPaletteBarButton)initWithBarButtonItem:(id)a3;
- (UIBarButtonItem)barButtonItem;
- (UIView)customView;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)menuProvider;
- (void)_checkCurrentBarButtonItemState;
- (void)_handleTouchUpInside:(id)a3 event:(id)a4;
- (void)_updateForButtonItemChange;
- (void)_updateMenu;
- (void)dismissContextMenu;
- (void)layoutSubviews;
- (void)setCustomView:(id)a3;
- (void)setMenuProvider:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setTintColor:(id)a3;
@end

@implementation PKPaletteBarButton

- (PKPaletteBarButton)initWithBarButtonItem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaletteBarButton;
  v6 = -[PKPaletteButton initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_barButtonItem = (id *)&v6->_barButtonItem;
    objc_storeStrong((id *)&v6->_barButtonItem, a3);
    [(PKPaletteBarButton *)v7 _updateForButtonItemChange];
    [(PKPaletteBarButton *)v7 addTarget:v7 action:sel__handleTouchUpInside_event_ forControlEvents:64];
    [*p_barButtonItem _setViewOwner:v7];
    v9 = [(PKPaletteButton *)v7 button];
    [*p_barButtonItem setView:v9];
  }
  return v7;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)PKPaletteBarButton;
  [(PKPaletteButton *)&v22 layoutSubviews];
  v3 = [(PKPaletteBarButton *)self customView];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v21[0] = *MEMORY[0x1E4F1DAB8];
  v21[1] = v4;
  v21[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v21];

  [(PKPaletteBarButton *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(PKPaletteBarButton *)self customView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  v14 = [(PKPaletteButton *)self button];
  v15 = v14;
  if (v14)
  {
    [v14 transform];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
  }
  v16 = [(PKPaletteBarButton *)self customView];
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  [v16 setTransform:v17];
}

- (void)setCustomView:(id)a3
{
  double v5 = (UIView *)a3;
  p_customView = &self->_customView;
  customView = self->_customView;
  double v9 = v5;
  if (customView != v5)
  {
    double v8 = [(UIView *)customView superview];

    if (v8 == self) {
      [(UIView *)*p_customView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_customView, a3);
    if (*p_customView) {
      -[PKPaletteBarButton addSubview:](self, "addSubview:");
    }
  }
}

- (void)dismissContextMenu
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteBarButton;
  [(PKPaletteButton *)&v4 dismissContextMenu];
  if ([(PKPaletteButton *)self hasContextMenuVisible])
  {
    v3 = [(PKPaletteBarButton *)self contextMenuInteraction];
    [v3 dismissMenu];

    [(PKPaletteBarButton *)self setContextMenuInteractionEnabled:0];
    [(PKPaletteBarButton *)self setContextMenuInteractionEnabled:1];
  }
}

- (void)setScalingFactor:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteBarButton;
  [(PKPaletteButton *)&v4 setScalingFactor:a3];
  [(PKPaletteBarButton *)self setNeedsLayout];
}

- (void)_updateForButtonItemChange
{
  v3 = [(PKPaletteBarButton *)self barButtonItem];
  objc_super v4 = [v3 customView];

  if (v4)
  {
    double v5 = [(PKPaletteButton *)self button];
    [v5 setHidden:1];

    double v6 = [(PKPaletteBarButton *)self barButtonItem];
    double v7 = [v6 customView];
    [(PKPaletteBarButton *)self setCustomView:v7];
    goto LABEL_9;
  }
  [(PKPaletteBarButton *)self setCustomView:0];
  double v8 = [(PKPaletteButton *)self button];
  [v8 setHidden:0];

  double v9 = [(PKPaletteBarButton *)self barButtonItem];
  double v6 = [v9 _imageForState:0 compact:0 type:5];

  double v10 = [(PKPaletteBarButton *)self barButtonItem];
  double v7 = [v10 resolvedTitle];

  double v11 = [(PKPaletteButton *)self button];
  double v12 = v11;
  if (v6)
  {
    v13 = [(id)objc_opt_class() _imageByApplyingDefaultImageSymbolConfigurationWithImage:v6];
    [v12 setImage:v13 forState:0];
    [v12 setTitle:0 forState:0];
  }
  else
  {
    [v11 setImage:0 forState:0];
    if (!v7)
    {
      [v12 setTitle:0 forState:0];
      goto LABEL_8;
    }
    [v12 setTitle:v7 forState:0];
    v13 = [v12 titleLabel];
    [v13 setLineBreakMode:4];
  }

LABEL_8:
LABEL_9:

  v14 = [(PKPaletteBarButton *)self barButtonItem];
  v15 = [v14 accessibilityIdentifier];
  v16 = [(PKPaletteButton *)self button];
  [v16 setAccessibilityIdentifier:v15];

  v17 = [(PKPaletteBarButton *)self barButtonItem];
  -[PKPaletteButton setEnabled:](self, "setEnabled:", [v17 isEnabled]);

  long long v18 = [(PKPaletteBarButton *)self barButtonItem];
  -[PKPaletteButton setHidden:](self, "setHidden:", [v18 isHidden]);

  long long v19 = [(PKPaletteBarButton *)self barButtonItem];
  -[PKPaletteButton setSelected:](self, "setSelected:", [v19 isSelected]);

  [(PKPaletteBarButton *)self _updateMenu];
}

- (void)_updateMenu
{
  v3 = [(PKPaletteBarButton *)self barButtonItem];
  objc_super v4 = [v3 menu];

  double v5 = [(PKPaletteBarButton *)self barButtonItem];
  uint64_t v6 = [v5 _menuIsPrimary];

  double v7 = [(PKPaletteBarButton *)self barButtonItem];
  double v8 = [v7 _secondaryActionsProvider];

  if (v8)
  {
    double v9 = [(PKPaletteBarButton *)self barButtonItem];
    objc_initWeak(&location, v9);

    if (v6)
    {
      double v10 = v20;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __33__PKPaletteBarButton__updateMenu__block_invoke;
      v20[3] = &unk_1E64C8B90;
      v20[4] = v8;
      double v11 = &v21;
      objc_copyWeak(&v21, &location);
      [(PKPaletteBarButton *)self setMenuProvider:v20];
    }
    else
    {
      double v10 = v18;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __33__PKPaletteBarButton__updateMenu__block_invoke_3;
      v18[3] = &unk_1E64C8B90;
      v18[4] = v8;
      double v11 = &v19;
      objc_copyWeak(&v19, &location);
      [(PKPaletteBarButton *)self setMenuProvider:v18];
    }
    objc_destroyWeak(v11);

    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __33__PKPaletteBarButton__updateMenu__block_invoke_4;
    v16 = &unk_1E64C8BB8;
    id v17 = v4;
    [(PKPaletteBarButton *)self setMenuProvider:&v13];
  }
  else
  {
    [(PKPaletteBarButton *)self setMenuProvider:0];
  }
  -[PKPaletteBarButton setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", self->_menuProvider != 0, v13, v14, v15, v16);
  [(PKPaletteBarButton *)self setShowsMenuAsPrimaryAction:v6];
  double v12 = [(PKPaletteBarButton *)self barButtonItem];
  [(PKPaletteBarButton *)self _setProxySender:v12];
}

id __33__PKPaletteBarButton__updateMenu__block_invoke(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v7 = (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, WeakRetained, v3);

  if (!v7)
  {
    double v8 = (void *)MEMORY[0x1E4FB13F0];
    id v9 = objc_loadWeakRetained(v5);
    double v10 = [v9 title];
    id v11 = objc_loadWeakRetained(v5);
    double v12 = [v11 image];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __33__PKPaletteBarButton__updateMenu__block_invoke_2;
    _OWORD v17[3] = &unk_1E64C8B68;
    objc_copyWeak(&v18, v5);
    uint64_t v13 = [v8 actionWithTitle:v10 image:v12 identifier:0 handler:v17];

    uint64_t v14 = (void *)MEMORY[0x1E4FB1970];
    v19[0] = v13;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    double v7 = [v14 menuWithTitle:&stru_1F1FB2C00 children:v15];

    objc_destroyWeak(&v18);
  }

  return v7;
}

void __33__PKPaletteBarButton__updateMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _triggerActionForEvent:0];
}

id __33__PKPaletteBarButton__updateMenu__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);

  return v6;
}

id __33__PKPaletteBarButton__updateMenu__block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double v5 = (void *)MEMORY[0x1E4FB1678];
  uint64_t v6 = [(PKPaletteBarButton *)self menuProvider];
  double v7 = [v5 configurationWithIdentifier:@"PK-UIBarButtonItemContextMenu" previewProvider:0 actionProvider:v6];

  double v8 = [(PKPaletteBarButton *)self barButtonItem];
  objc_msgSend(v7, "setPreferredMenuElementOrder:", objc_msgSend(v8, "preferredMenuElementOrder"));

  return v7;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  v33.receiver = self;
  v33.super_class = (Class)PKPaletteBarButton;
  double v5 = [(PKPaletteBarButton *)&v33 _contextMenuInteraction:a3 styleForMenuWithConfiguration:a4];
  uint64_t v6 = [(PKPaletteBarButton *)self window];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v8 = [(PKPaletteBarButton *)self window];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    id v17 = [(PKPaletteBarButton *)self window];
    [v17 actualSceneBounds];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    v35.origin.x = v10;
    v35.origin.y = v12;
    v35.size.width = v14;
    v35.size.height = v16;
    v38.origin.x = v19;
    v38.origin.y = v21;
    v38.size.width = v23;
    v38.size.height = v25;
    if (!CGRectEqualToRect(v35, v38))
    {
      double v26 = *MEMORY[0x1E4FB2848];
      double v27 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v28 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      v29 = [(PKPaletteBarButton *)self window];
      [v29 bounds];
      double Width = CGRectGetWidth(v36);
      v37.origin.x = v19;
      v37.origin.y = v21;
      v37.size.width = v23;
      v37.size.height = v25;
      double v31 = Width - CGRectGetWidth(v37);

      objc_msgSend(v5, "setPreferredEdgeInsets:", v26, v27, v28, v31);
    }
  }

  return v5;
}

- (void)setTintColor:(id)a3
{
  if (a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)PKPaletteBarButton;
    -[PKPaletteBarButton setTintColor:](&v3, sel_setTintColor_);
  }
}

- (void)_handleTouchUpInside:(id)a3 event:(id)a4
{
  id v5 = a4;
  [(PKPaletteBarButton *)self _checkCurrentBarButtonItemState];
  id v6 = [(PKPaletteBarButton *)self barButtonItem];
  [v6 _triggerActionForEvent:v5];
}

- (void)_checkCurrentBarButtonItemState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PKPaletteBarButton *)self barButtonItem];
  id v4 = [v3 view];

  id v5 = [(PKPaletteBarButton *)self barButtonItem];
  id v6 = [v5 _viewOwner];

  double v7 = [(PKPaletteButton *)self button];

  if (v4 != v7 || v6 != self)
  {
    double v8 = NSString;
    uint64_t v9 = objc_opt_class();
    CGFloat v10 = [v8 stringWithFormat:@"Unexpected view(%@) or viewOwner(%@) for UIBarButtonItem represented by PKPaletteBarButton", v9, objc_opt_class()];
    double v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CGFloat v14 = v10;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    [(UIBarButtonItem *)self->_barButtonItem _setViewOwner:self];
    CGFloat v12 = [(PKPaletteButton *)self button];
    [(UIBarButtonItem *)self->_barButtonItem setView:v12];
  }
}

+ (id)_imageByApplyingDefaultImageSymbolConfigurationWithImage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 isSymbolImage])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4FB1830], "pk_defaultImageSymbolConfiguration");
    uint64_t v6 = [v4 imageByApplyingSymbolConfiguration:v5];

    id v4 = (void *)v6;
  }

  return v4;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (UIView)customView
{
  return self->_customView;
}

- (id)menuProvider
{
  return self->_menuProvider;
}

- (void)setMenuProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuProvider, 0);
  objc_storeStrong((id *)&self->_customView, 0);

  objc_storeStrong((id *)&self->_barButtonItem, 0);
}

@end