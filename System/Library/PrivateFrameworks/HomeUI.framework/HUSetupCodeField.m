@interface HUSetupCodeField
- (BOOL)isComplete;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (HUSetupCodeField)init;
- (HUSetupCodeField)initWithCodeDigits:(unint64_t)a3;
- (HUSetupCodeFieldDelegate)delegate;
- (HUSetupCodeFieldItem)activeItem;
- (NSArray)items;
- (NSString)setupCode;
- (UIStackView)codeFieldItemsView;
- (UITextField)hiddenInputField;
- (double)itemSpacing;
- (void)_activateLast;
- (void)_activateNext;
- (void)_setupCodeFieldItems;
- (void)_updateInterfaceForCurrentTraitCollection;
- (void)clear;
- (void)fieldTapped:(id)a3;
- (void)hideKeypad;
- (void)setActiveItem:(id)a3;
- (void)setCodeFieldItemsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHiddenInputField:(id)a3;
- (void)setItemSpacing:(double)a3;
- (void)showKeypad;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HUSetupCodeField

- (HUSetupCodeField)init
{
  return [(HUSetupCodeField *)self initWithCodeDigits:8];
}

- (HUSetupCodeField)initWithCodeDigits:(unint64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HUSetupCodeField;
  v4 = [(HUSetupCodeField *)&v17 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    if (a3)
    {
      unint64_t v6 = 0;
      unsigned int v7 = 1;
      do
      {
        v8 = objc_alloc_init(HUSetupCodeFieldItem);
        [(HUSetupCodeFieldItem *)v8 setItemNumber:v6];
        [v5 setObject:v8 atIndexedSubscript:v6];

        unint64_t v6 = v7++;
      }
      while (v6 < a3);
    }
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
    items = v4->_items;
    v4->_items = (NSArray *)v9;

    v11 = [(NSArray *)v4->_items firstObject];
    objc_storeWeak((id *)&v4->_activeItem, v11);

    v4->_itemSpacing = 2.0;
    v12 = (UITextField *)objc_alloc_init(MEMORY[0x1E4F42F10]);
    hiddenInputField = v4->_hiddenInputField;
    v4->_hiddenInputField = v12;

    [(UITextField *)v4->_hiddenInputField setDelegate:v4];
    [(UITextField *)v4->_hiddenInputField setKeyboardType:4];
    [(HUSetupCodeField *)v4 _updateInterfaceForCurrentTraitCollection];
    [(UITextField *)v4->_hiddenInputField setHidden:1];
    [(HUSetupCodeField *)v4 addSubview:v4->_hiddenInputField];
    [(HUSetupCodeField *)v4 _setupCodeFieldItems];
    v14 = [(NSArray *)v4->_items firstObject];
    [v14 activate];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel_fieldTapped_];
    [(HUSetupCodeField *)v4 addGestureRecognizer:v15];
  }
  return v4;
}

- (NSString)setupCode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(HUSetupCodeField *)self items];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      v10 = [v9 value];

      if (!v10) {
        break;
      }
      v11 = [v9 value];
      v12 = [v11 stringValue];
      [v3 appendString:v12];

      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v13 = (void *)[v3 copy];

  return (NSString *)v13;
}

- (BOOL)isComplete
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(HUSetupCodeField *)self items];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) value];

        if (!v7)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (void)clear
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(HUSetupCodeField *)self items];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v7++) setValue:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  BOOL v8 = [(HUSetupCodeField *)self activeItem];

  if (v8)
  {
    uint64_t v9 = [(HUSetupCodeField *)self activeItem];
    [v9 deactivate];
  }
  long long v10 = [(HUSetupCodeField *)self items];
  long long v11 = [v10 objectAtIndexedSubscript:0];
  [(HUSetupCodeField *)self setActiveItem:v11];

  long long v12 = [(HUSetupCodeField *)self activeItem];
  [v12 activate];
}

- (void)showKeypad
{
  id v2 = [(HUSetupCodeField *)self hiddenInputField];
  [v2 becomeFirstResponder];
}

- (void)hideKeypad
{
  id v2 = [(HUSetupCodeField *)self hiddenInputField];
  [v2 resignFirstResponder];
}

- (void)fieldTapped:(id)a3
{
  uint64_t v4 = [(HUSetupCodeField *)self hiddenInputField];
  char v5 = [v4 isFirstResponder];

  if ((v5 & 1) == 0)
  {
    [(HUSetupCodeField *)self showKeypad];
  }
}

- (void)_setupCodeFieldItems
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!self->_codeFieldItemsView)
  {
    uint64_t v3 = (UIStackView *)objc_opt_new();
    codeFieldItemsView = self->_codeFieldItemsView;
    self->_codeFieldItemsView = v3;

    [(UIStackView *)self->_codeFieldItemsView setDistribution:1];
    [(UIStackView *)self->_codeFieldItemsView setAxis:0];
    [(UIStackView *)self->_codeFieldItemsView setSpacing:2.0];
    [(UIStackView *)self->_codeFieldItemsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_codeFieldItemsView setSemanticContentAttribute:3];
    [(HUSetupCodeField *)self addSubview:self->_codeFieldItemsView];
    char v5 = [(UIStackView *)self->_codeFieldItemsView leftAnchor];
    uint64_t v6 = [(HUSetupCodeField *)self leftAnchor];
    uint64_t v7 = [v5 constraintEqualToAnchor:v6];
    [v7 setActive:1];

    BOOL v8 = [(UIStackView *)self->_codeFieldItemsView rightAnchor];
    uint64_t v9 = [(HUSetupCodeField *)self rightAnchor];
    long long v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    long long v11 = [(UIStackView *)self->_codeFieldItemsView topAnchor];
    long long v12 = [(HUSetupCodeField *)self topAnchor];
    long long v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    long long v14 = [(UIStackView *)self->_codeFieldItemsView bottomAnchor];
    long long v15 = [(HUSetupCodeField *)self bottomAnchor];
    long long v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v17 = [(HUSetupCodeField *)self items];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v28 + 1) + 8 * v21);
        v23 = [(HUSetupCodeField *)self codeFieldItemsView];
        [v23 addArrangedSubview:v22];

        v24 = [v22 widthAnchor];
        v25 = [v24 constraintEqualToConstant:36.0];
        [v25 setActive:1];

        v26 = [v22 heightAnchor];
        v27 = [v26 constraintEqualToConstant:56.0];
        [v27 setActive:1];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  BOOL v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v6];
  int v9 = [v7 isSupersetOfSet:v8];
  if (v9)
  {
    if ([v6 length])
    {
      long long v10 = [(HUSetupCodeField *)self activeItem];

      if (v10)
      {
        long long v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
        long long v12 = [(HUSetupCodeField *)self activeItem];
        [v12 setValue:v11];
      }
      [(HUSetupCodeField *)self _activateNext];
    }
    else
    {
      [(HUSetupCodeField *)self _activateLast];
    }
  }

  return v9;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if ([(HUSetupCodeField *)self isComplete])
  {
    uint64_t v4 = [(HUSetupCodeField *)self delegate];
    if (![v4 conformsToProtocol:&unk_1F1AD9510])
    {
LABEL_5:

      return 1;
    }
    char v5 = [(HUSetupCodeField *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v4 = [(HUSetupCodeField *)self delegate];
      [v4 setupCodeFieldDidReturn:self];
      goto LABEL_5;
    }
  }
  return 1;
}

- (void)_activateNext
{
  uint64_t v3 = [(HUSetupCodeField *)self activeItem];

  if (v3)
  {
    uint64_t v4 = [(HUSetupCodeField *)self activeItem];
    unint64_t v5 = [v4 itemNumber] + 1;

    char v6 = [(HUSetupCodeField *)self items];
    unint64_t v7 = [v6 count];

    if (v5 <= v7)
    {
      BOOL v8 = [(HUSetupCodeField *)self activeItem];
      [v8 deactivate];

      int v9 = [(HUSetupCodeField *)self items];
      uint64_t v10 = [v9 count];

      if (v5 == v10)
      {
        [(HUSetupCodeField *)self setActiveItem:0];
      }
      else
      {
        long long v11 = [(HUSetupCodeField *)self items];
        long long v12 = [v11 objectAtIndexedSubscript:v5];
        [(HUSetupCodeField *)self setActiveItem:v12];

        long long v13 = [(HUSetupCodeField *)self activeItem];
        [v13 activate];
      }
    }
    long long v14 = [(HUSetupCodeField *)self activeItem];
    if (!v14)
    {
      id v17 = [(HUSetupCodeField *)self delegate];
      if ([v17 conformsToProtocol:&unk_1F1AD9510])
      {
        long long v15 = [(HUSetupCodeField *)self delegate];
        char v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) == 0) {
          return;
        }
        id v17 = [(HUSetupCodeField *)self delegate];
        [v17 setupCodeFieldDidBecomeComplete:self];
      }
      long long v14 = v17;
    }
  }
}

- (void)_activateLast
{
  BOOL v3 = [(HUSetupCodeField *)self isComplete];
  uint64_t v4 = [(HUSetupCodeField *)self activeItem];
  if (v4
    && (unint64_t v5 = (void *)v4,
        [(HUSetupCodeField *)self activeItem],
        char v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 itemNumber],
        v6,
        v5,
        v7))
  {
    if (!v3)
    {
      BOOL v8 = [(HUSetupCodeField *)self activeItem];

      if (v8)
      {
        int v9 = [(HUSetupCodeField *)self activeItem];
        uint64_t v10 = [v9 itemNumber];

        long long v11 = [(HUSetupCodeField *)self activeItem];
        [v11 deactivate];
        goto LABEL_8;
      }
    }
  }
  else if (!v3)
  {
    return;
  }
  long long v11 = [(HUSetupCodeField *)self items];
  uint64_t v10 = [v11 count];
LABEL_8:

  long long v12 = [(HUSetupCodeField *)self items];
  long long v13 = [v12 objectAtIndexedSubscript:v10 - 1];
  [(HUSetupCodeField *)self setActiveItem:v13];

  long long v14 = [(HUSetupCodeField *)self activeItem];
  [v14 clear];

  long long v15 = [(HUSetupCodeField *)self activeItem];
  [v15 activate];

  if (!v3) {
    return;
  }
  id v18 = [(HUSetupCodeField *)self delegate];
  if ([v18 conformsToProtocol:&unk_1F1AD9510])
  {
    char v16 = [(HUSetupCodeField *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0) {
      return;
    }
    id v18 = [(HUSetupCodeField *)self delegate];
    [v18 setupCodeFieldDidBecomeIncomplete:self];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUSetupCodeField;
  [(HUSetupCodeField *)&v4 traitCollectionDidChange:a3];
  [(HUSetupCodeField *)self _updateInterfaceForCurrentTraitCollection];
}

- (void)_updateInterfaceForCurrentTraitCollection
{
  BOOL v3 = [(HUSetupCodeField *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  unint64_t v5 = [(HUSetupCodeField *)self hiddenInputField];
  id v7 = v5;
  if (v4 == 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 setKeyboardAppearance:v6];
}

- (HUSetupCodeFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSetupCodeFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (HUSetupCodeFieldItem)activeItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeItem);

  return (HUSetupCodeFieldItem *)WeakRetained;
}

- (void)setActiveItem:(id)a3
{
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (UITextField)hiddenInputField
{
  return self->_hiddenInputField;
}

- (void)setHiddenInputField:(id)a3
{
}

- (UIStackView)codeFieldItemsView
{
  return self->_codeFieldItemsView;
}

- (void)setCodeFieldItemsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeFieldItemsView, 0);
  objc_storeStrong((id *)&self->_hiddenInputField, 0);
  objc_destroyWeak((id *)&self->_activeItem);
  objc_storeStrong((id *)&self->_items, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end