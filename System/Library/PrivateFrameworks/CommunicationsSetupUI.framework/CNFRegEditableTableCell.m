@interface CNFRegEditableTableCell
- (BOOL)_textFieldIsCurrentlyEmpty;
- (BOOL)skipDelegateCallback;
- (CNFRegShadowView)shadowView;
- (UIImage)customCheckmarkImage;
- (UIImage)customCheckmarkImageSelected;
- (UIImage)shadowImage;
- (void)_handleTextChanged;
- (void)_startListeningForTextChanges;
- (void)_stopListeningForTextChanges;
- (void)_updateTextFieldOffsetWithDict:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)notifyTextFieldDidBeginEditing;
- (void)notifyTextFieldDidEndEditing;
- (void)notifyTextFieldEmptyStateChanged:(BOOL)a3;
- (void)setChecked:(BOOL)a3;
- (void)setCustomCheckmarkImage:(id)a3;
- (void)setCustomCheckmarkImageSelected:(id)a3;
- (void)setShadowImage:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setSkipDelegateCallback:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation CNFRegEditableTableCell

- (void)_updateTextFieldOffsetWithDict:(id)a3
{
  v4 = [a3 propertyForKey:@"cnf-textFieldOffset"];
  if (v4)
  {
    id v6 = v4;
    [v4 floatValue];
    [(CNFRegEditableTableCell *)self setTextFieldOffset:v5];
    [(CNFRegEditableTableCell *)self setNeedsLayout];
    v4 = v6;
  }
}

- (void)notifyTextFieldEmptyStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD60]);
  id WeakRetained = objc_loadWeakRetained(v5);
  if (WeakRetained)
  {
    p_emptyStateSelector = &self->_emptyStateSelector;
    if (self->_emptyStateSelector)
    {
      id v15 = WeakRetained;
      v8 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE60]);
      id v9 = objc_loadWeakRetained(v8);
      if (v9)
      {
        v10 = v9;
        BOOL v11 = [(CNFRegEditableTableCell *)self skipDelegateCallback];

        if (v11) {
          return;
        }
        id v15 = [NSNumber numberWithBool:v3];
        id v12 = objc_loadWeakRetained(v5);
        if (*p_emptyStateSelector) {
          SEL v13 = *p_emptyStateSelector;
        }
        else {
          SEL v13 = 0;
        }
        id v14 = objc_loadWeakRetained(v8);
        [v12 performSelector:v13 withObject:v15 withObject:v14];
      }
      id WeakRetained = v15;
    }
  }
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegEditableTableCell;
  [(PSEditableTableCell *)&v5 setTitle:a3];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE60]));
  [(CNFRegEditableTableCell *)self _updateTextFieldOffsetWithDict:WeakRetained];
}

- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5
{
  id v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CNFRegEditableTableCell;
  [(PSEditableTableCell *)&v27 setValueChangedTarget:a3 action:a4 specifier:v8];
  id v9 = [v8 propertyForKey:@"cnf-textFieldEmptyStateChangeSelector"];
  v10 = v9;
  if (v9)
  {
    SEL v11 = NSSelectorFromString(v9);
    if (v11)
    {
      id v12 = v11;
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                                + (int)*MEMORY[0x263F5FD60]));
      char v14 = objc_opt_respondsToSelector();

      if (v14) {
        self->_emptyStateSelector = v12;
      }
    }
  }

  id v15 = [v8 propertyForKey:@"cnf-didBeginEditingSelector"];
  v16 = v15;
  if (v15)
  {
    SEL v17 = NSSelectorFromString(v15);
    if (v17)
    {
      v18 = v17;
      id v19 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                       + (int)*MEMORY[0x263F5FD60]));
      char v20 = objc_opt_respondsToSelector();

      if (v20) {
        self->_didBeginEditingSelector = v18;
      }
    }
  }

  v21 = [v8 propertyForKey:@"cnf-didEndEditingSelector"];
  v22 = v21;
  if (v21)
  {
    SEL v23 = NSSelectorFromString(v21);
    if (v23)
    {
      v24 = v23;
      id v25 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                       + (int)*MEMORY[0x263F5FD60]));
      char v26 = objc_opt_respondsToSelector();

      if (v26) {
        self->_didEndEditingSelector = v24;
      }
    }
  }

  [(CNFRegEditableTableCell *)self _updateTextFieldOffsetWithDict:v8];
}

- (BOOL)_textFieldIsCurrentlyEmpty
{
  BOOL v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v4 = [(CNFRegEditableTableCell *)self editableTextField];
  objc_super v5 = [v4 text];
  id v6 = [v5 stringByTrimmingCharactersInSet:v3];
  BOOL v7 = [v6 length] == 0;

  return v7;
}

- (void)_handleTextChanged
{
  BOOL v3 = [(CNFRegEditableTableCell *)self _textFieldIsCurrentlyEmpty];
  if (self->_textFieldIsEmpty != v3)
  {
    self->_textFieldIsEmpty = v3;
    [(CNFRegEditableTableCell *)self notifyTextFieldEmptyStateChanged:v3];
  }
}

- (void)_startListeningForTextChanges
{
  if (!self->_textChangeObserver)
  {
    self->_textFieldIsEmpty = [(CNFRegEditableTableCell *)self _textFieldIsCurrentlyEmpty];
    id v3 = (id)*MEMORY[0x263F83AC8];
    v4 = [(CNFRegEditableTableCell *)self editableTextField];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy__3;
    v10[4] = __Block_byref_object_dispose__3;
    SEL v11 = self;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__CNFRegEditableTableCell__startListeningForTextChanges__block_invoke;
    v9[3] = &unk_2644F1210;
    v9[4] = v10;
    objc_super v5 = (void *)MEMORY[0x223C3AA40](v9);
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    BOOL v7 = [v6 addObserverForName:v3 object:v4 queue:0 usingBlock:v5];

    id textChangeObserver = self->_textChangeObserver;
    self->_id textChangeObserver = v7;

    _Block_object_dispose(v10, 8);
  }
}

uint64_t __56__CNFRegEditableTableCell__startListeningForTextChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _handleTextChanged];
}

- (void)_stopListeningForTextChanges
{
  if (self->_textChangeObserver)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_textChangeObserver];

    id textChangeObserver = self->_textChangeObserver;
    self->_id textChangeObserver = 0;
  }
}

- (void)notifyTextFieldDidBeginEditing
{
  id v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD60]);
  id WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    p_didBeginEditingSelector = &self->_didBeginEditingSelector;
    if (self->_didBeginEditingSelector)
    {
      id v12 = WeakRetained;
      id v6 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE60]);
      id v7 = objc_loadWeakRetained(v6);
      if (v7)
      {
        id v8 = v7;
        BOOL v9 = [(CNFRegEditableTableCell *)self skipDelegateCallback];

        if (v9) {
          return;
        }
        id v12 = objc_loadWeakRetained(v3);
        if (*p_didBeginEditingSelector) {
          SEL v10 = *p_didBeginEditingSelector;
        }
        else {
          SEL v10 = 0;
        }
        id v11 = objc_loadWeakRetained(v6);
        [v12 performSelector:v10 withObject:v11];
      }
      id WeakRetained = v12;
    }
  }
}

- (void)notifyTextFieldDidEndEditing
{
  id v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD60]);
  id WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    p_didEndEditingSelector = &self->_didEndEditingSelector;
    if (self->_didEndEditingSelector)
    {
      id v12 = WeakRetained;
      id v6 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE60]);
      id v7 = objc_loadWeakRetained(v6);
      if (v7)
      {
        id v8 = v7;
        BOOL v9 = [(CNFRegEditableTableCell *)self skipDelegateCallback];

        if (v9) {
          return;
        }
        id v12 = objc_loadWeakRetained(v3);
        if (*p_didEndEditingSelector) {
          SEL v10 = *p_didEndEditingSelector;
        }
        else {
          SEL v10 = 0;
        }
        id v11 = objc_loadWeakRetained(v6);
        [v12 performSelector:v10 withObject:v11];
      }
      id WeakRetained = v12;
    }
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegEditableTableCell;
  [(PSEditableTableCell *)&v4 textFieldDidBeginEditing:a3];
  [(CNFRegEditableTableCell *)self notifyTextFieldDidBeginEditing];
}

- (void)textFieldDidEndEditing:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegEditableTableCell;
  [(PSEditableTableCell *)&v4 textFieldDidEndEditing:a3];
  [(CNFRegEditableTableCell *)self notifyTextFieldDidEndEditing];
}

- (void)setShadowImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  p_shadowImage = &self->_shadowImage;
  if (self->_shadowImage != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_shadowImage, a3);
    [(CNFRegShadowView *)self->_shadowView removeFromSuperview];
    shadowView = self->_shadowView;
    self->_shadowView = 0;

    p_shadowImage = (UIImage **)[(CNFRegEditableTableCell *)self setNeedsLayout];
    objc_super v5 = v8;
  }
  MEMORY[0x270F9A758](p_shadowImage, v5);
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CNFRegEditableTableCell *)self customCheckmarkImage];

  if (!v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)CNFRegEditableTableCell;
    [(PSTableCell *)&v15 setChecked:v3];
    return;
  }
  uint64_t v6 = (int)*MEMORY[0x263F5FE50];
  if (*((unsigned char *)&self->super.super.super.super.super.super.isa + v6) == v3) {
    return;
  }
  *((unsigned char *)&self->super.super.super.super.super.super.isa + v6) = v3;
  if (v3)
  {
    id v7 = objc_alloc(MEMORY[0x263F82828]);
    id v8 = [(CNFRegEditableTableCell *)self customCheckmarkImage];
    BOOL v9 = [(CNFRegEditableTableCell *)self customCheckmarkImageSelected];
    id obj = (id)[v7 initWithImage:v8 highlightedImage:v9];

    if ([(CNFRegEditableTableCell *)self accessoryType] == 1
      || [(CNFRegEditableTableCell *)self accessoryType] == 2)
    {
      SEL v10 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE58]);
      objc_storeStrong(v10, obj);
      id v11 = [(CNFRegEditableTableCell *)self contentView];
      [v11 addSubview:*v10];

      [(CNFRegEditableTableCell *)self setNeedsLayout];
    }
    else
    {
      [(CNFRegEditableTableCell *)self setAccessoryView:obj];
    }
    SEL v13 = obj;
    goto LABEL_14;
  }
  if ([(CNFRegEditableTableCell *)self accessoryType] == 1
    || [(CNFRegEditableTableCell *)self accessoryType] == 2)
  {
    uint64_t v12 = (int)*MEMORY[0x263F5FE58];
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + v12) removeFromSuperview];
    SEL v13 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v12);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v12) = 0;
LABEL_14:

    return;
  }
  [(CNFRegEditableTableCell *)self setAccessoryView:0];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)CNFRegEditableTableCell;
  [(PSEditableTableCell *)&v20 layoutSubviews];
  BOOL v3 = [(CNFRegEditableTableCell *)self backgroundView];

  if (v3)
  {
    objc_super v4 = [(CNFRegEditableTableCell *)self shadowImage];

    objc_super v5 = [(CNFRegEditableTableCell *)self shadowView];
    uint64_t v6 = v5;
    if (v4)
    {

      if (!v6)
      {
        id v7 = [CNFRegShadowView alloc];
        id v8 = [(CNFRegEditableTableCell *)self backgroundView];
        [v8 bounds];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        SEL v17 = [(CNFRegEditableTableCell *)self shadowImage];
        v18 = -[CNFRegShadowView initWithFrame:shadowImage:](v7, "initWithFrame:shadowImage:", v17, v10, v12, v14, v16);

        id v19 = [(CNFRegEditableTableCell *)self backgroundView];
        [v19 addSubview:v18];

        [(CNFRegEditableTableCell *)self setShadowView:v18];
      }
    }
    else
    {
      [v5 removeFromSuperview];

      [(CNFRegEditableTableCell *)self setShadowView:0];
    }
  }
  [(CNFRegEditableTableCell *)self _startListeningForTextChanges];
}

- (void)dealloc
{
  [(CNFRegEditableTableCell *)self _stopListeningForTextChanges];
  v3.receiver = self;
  v3.super_class = (Class)CNFRegEditableTableCell;
  [(PSEditableTableCell *)&v3 dealloc];
}

- (BOOL)skipDelegateCallback
{
  return self->_skipDelegateCallback;
}

- (void)setSkipDelegateCallback:(BOOL)a3
{
  self->_skipDelegateCallback = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (CNFRegShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIImage)customCheckmarkImage
{
  return self->_customCheckmarkImage;
}

- (void)setCustomCheckmarkImage:(id)a3
{
}

- (UIImage)customCheckmarkImageSelected
{
  return self->_customCheckmarkImageSelected;
}

- (void)setCustomCheckmarkImageSelected:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customCheckmarkImageSelected, 0);
  objc_storeStrong((id *)&self->_customCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong(&self->_textChangeObserver, 0);
}

@end