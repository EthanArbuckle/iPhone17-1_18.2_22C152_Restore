@interface _SFFindOnPageToolbar
- (BOOL)_keyboardIsSplit;
- (BOOL)_updateEditing:(BOOL)a3;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)usesNarrowLayout;
- (CGRect)_toolbarFrame;
- (CGSize)intrinsicContentSize;
- (NSString)searchText;
- (UITextField)inputField;
- (_SFFindOnPageToolbar)initWithDelegate:(id)a3;
- (double)_accessoryViewHeight;
- (double)_toolbarVerticalInset;
- (id)_matchLabelText;
- (void)_doUpdateSearchText;
- (void)_done;
- (void)_initializeToolbarItems;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)layoutSubviews;
- (void)next:(id)a3;
- (void)previous:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setUsesNarrowLayout:(BOOL)a3;
- (void)updateUI;
@end

@implementation _SFFindOnPageToolbar

- (_SFFindOnPageToolbar)initWithDelegate:(id)a3
{
  id v4 = a3;
  [(_SFFindOnPageToolbar *)self _accessoryViewHeight];
  v13.receiver = self;
  v13.super_class = (Class)_SFFindOnPageToolbar;
  v6 = -[UIInputView initWithFrame:inputViewStyle:](&v13, sel_initWithFrame_inputViewStyle_, 1, 0.0, 0.0, 320.0, v5);
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB1DF0]);
    [(_SFFindOnPageToolbar *)v6 _toolbarFrame];
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:");
    toolbar = v6->_toolbar;
    v6->_toolbar = (UIToolbar *)v8;

    [(UIToolbar *)v6->_toolbar setBarStyle:4];
    [(UIToolbar *)v6->_toolbar _setHidesShadow:1];
    [(UIToolbar *)v6->_toolbar setCenterTextButtons:1];
    [(_SFFindOnPageToolbar *)v6 addSubview:v6->_toolbar];
    [(_SFFindOnPageToolbar *)v6 _initializeToolbarItems];
    [(UIToolbar *)v6->_toolbar setItems:v6->_toolbarItems];
    objc_storeWeak((id *)&v6->_findDelegate, v4);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4FB2C48] object:0];

    v11 = v6;
  }

  return v6;
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  CGRect v27 = CGRectIntersection(v26, v29);
  double Height = CGRectGetHeight(v27);
  [(_SFFindOnPageToolbar *)self bounds];
  BOOL v24 = Height - CGRectGetHeight(v28) == 0.0;
  if (self->_useBottomInset != v24)
  {
    self->_useBottomInset = v24;
    [(_SFFindOnPageToolbar *)self invalidateIntrinsicContentSize];
  }
}

- (CGRect)_toolbarFrame
{
  [(_SFFindOnPageToolbar *)self _toolbarVerticalInset];
  CGFloat v4 = v3;
  [(_SFFindOnPageToolbar *)self bounds];
  CGFloat Width = CGRectGetWidth(v14);
  double v6 = 0.0;
  if ((_SFDeviceIsPad() & 1) != 0 || self->_usesNarrowLayout)
  {
    double v7 = 44.0;
  }
  else
  {
    v15.size.height = 44.0;
    v15.origin.x = 0.0;
    v15.origin.y = v4;
    v15.size.width = Width;
    *(CGRect *)(&v7 - 3) = CGRectInset(v15, 56.0, 0.0);
    double v6 = v8;
    CGFloat v4 = v9;
    CGFloat Width = v10;
  }
  double v11 = v6;
  double v12 = v4;
  double v13 = Width;
  result.size.height = v7;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)_toolbarVerticalInset
{
  int IsPad = _SFDeviceIsPad();
  double result = 5.0;
  if (IsPad) {
    return 4.0;
  }
  return result;
}

- (double)_accessoryViewHeight
{
  [(_SFFindOnPageToolbar *)self _toolbarVerticalInset];
  return v2 + 44.0;
}

- (CGSize)intrinsicContentSize
{
  [(UIToolbar *)self->_toolbar intrinsicContentSize];
  double v4 = v3;
  [(_SFFindOnPageToolbar *)self safeAreaInsets];
  double v6 = v5;
  if (self->_useBottomInset) {
    [(_SFFindOnPageToolbar *)self _toolbarVerticalInset];
  }
  else {
    double v7 = 0.0;
  }
  double v8 = fmax(v6, v7);
  [(_SFFindOnPageToolbar *)self _accessoryViewHeight];
  double v10 = v9 + v8;
  double v11 = v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_SFFindOnPageToolbar;
  [(_SFFindOnPageToolbar *)&v3 safeAreaInsetsDidChange];
  [(_SFFindOnPageToolbar *)self invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_SFFindOnPageToolbar;
  [(_SFFindOnPageToolbar *)&v5 layoutSubviews];
  [(_SFFindOnPageToolbar *)self _toolbarFrame];
  -[UIToolbar setFrame:](self->_toolbar, "setFrame:");
  objc_super v3 = [(_SFFindOnPageInputBar *)self->_inputBar searchField];
  double v4 = [v3 font];
  [(UILabel *)self->_inFieldMatchLabel setFont:v4];
}

- (void)updateUI
{
  [(_SFFindOnPageToolbar *)self _toolbarFrame];
  -[UIToolbar setFrame:](self->_toolbar, "setFrame:");
  id v40 = [(_SFFindOnPageInputBar *)self->_inputBar searchField];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  uint64_t v4 = [WeakRetained hasMatches];

  [(UIBarButtonItem *)self->_previousButtonItem setEnabled:v4];
  [(UIBarButtonItem *)self->_nextButtonItem setEnabled:v4];
  objc_super v5 = [(_SFFindOnPageInputBar *)self->_inputBar text];
  LOBYTE(v4) = [v5 isEqualToString:self->_searchText];

  if ((v4 & 1) == 0) {
    [(_SFFindOnPageInputBar *)self->_inputBar setText:self->_searchText];
  }
  [v40 setRightViewMode:3];
  double v6 = [(_SFFindOnPageToolbar *)self _matchLabelText];
  [(UILabel *)self->_inFieldMatchLabel setText:v6];

  [(UILabel *)self->_inFieldMatchLabel frame];
  double v37 = v8;
  double v38 = v7;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[UILabel sizeThatFits:](self->_inFieldMatchLabel, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v10);
  double v39 = v11;
  [v40 bounds];
  double v13 = v12;
  objc_msgSend(v40, "textRectForBounds:");
  CGFloat v36 = v14;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  objc_msgSend(v40, "sizeThatFits:", v9, v10);
  double v22 = v21;
  [v40 _contentMargin];
  double v24 = v23;
  [v40 _imageButtonMargin];
  double v26 = v25;
  [v40 _textButtonMargin];
  if (self->_usesNarrowLayout
    && (double v28 = v27, [(_SFFindOnPageInputBar *)self->_inputBar isFirstResponder])
    && v39 + v22 - v24 - v26 - v28 >= v13)
  {
    [v40 setRightViewMode:0];
  }
  else
  {
    [v40 setRightViewMode:3];
    CGRect v29 = [v40 font];
    [v29 lineHeight];
    double v31 = floor((v20 - v30) * 0.5);

    v42.origin.x = v36;
    v42.origin.y = v16;
    v42.size.width = v18;
    v42.size.height = v20;
    CGFloat v32 = CGRectGetMinY(v42) + v31;
    v43.origin.x = v36;
    v43.origin.y = v16;
    v43.size.width = v18;
    v43.size.height = v20;
    CGFloat v33 = CGRectGetMaxY(v43) - v31;
    [(UILabel *)self->_inFieldMatchLabel textSize];
    CGFloat v35 = v32 - (v33 - ceil(v34));
    v44.origin.x = v36;
    v44.origin.y = v16;
    v44.size.width = v18;
    v44.size.height = v20;
    -[UILabel setFrame:](self->_inFieldMatchLabel, "setFrame:", v38, v37, v39, CGRectGetMaxY(v44) - v35);
    objc_msgSend(v40, "_setRightViewOffset:", 0.0, v35);
  }
}

- (id)_matchLabelText
{
  if ([(NSString *)self->_searchText length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
    uint64_t v4 = [WeakRetained matchLabelText];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (UITextField)inputField
{
  return (UITextField *)[(_SFFindOnPageInputBar *)self->_inputBar searchField];
}

- (void)setUsesNarrowLayout:(BOOL)a3
{
  if (self->_usesNarrowLayout != a3)
  {
    self->_usesNarrowLayout = a3;
    [(_SFFindOnPageToolbar *)self updateUI];
  }
}

- (void)previous:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  [WeakRetained previous];

  [(_SFFindOnPageToolbar *)self updateUI];
}

- (void)next:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  [WeakRetained next];

  [(_SFFindOnPageToolbar *)self updateUI];
}

- (void)_done
{
  [(_SFFindOnPageToolbar *)self _updateEditing:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  [WeakRetained done];
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  BOOL v4 = [(_SFFindOnPageToolbar *)self _updateEditing:1];
  if (v4) {
    [(_SFFindOnPageInputBar *)self->_inputBar performSelector:sel_becomeFirstResponder withObject:0 afterDelay:0.0];
  }
  return !v4;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  [(_SFFindOnPageToolbar *)self updateUI];
  id v5 = [v4 searchField];

  [v5 performSelector:sel_selectAll_ withObject:0 afterDelay:0.0];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  if ([a3 isFirstResponder])
  {
    textChangedUpdateTimer = self->_textChangedUpdateTimer;
    if (textChangedUpdateTimer) {
      [(NSTimer *)textChangedUpdateTimer invalidate];
    }
    double v6 = [(_SFFindOnPageInputBar *)self->_inputBar text];
    double v7 = (NSString *)[v6 copy];
    searchText = self->_searchText;
    self->_searchText = v7;

    double v9 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__doUpdateSearchText selector:0 userInfo:0 repeats:0.25];
    double v10 = self->_textChangedUpdateTimer;
    self->_textChangedUpdateTimer = v9;
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)_initializeToolbarItems
{
  v37[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:103 target:self action:sel_previous_];
  previousButtonItem = self->_previousButtonItem;
  self->_previousButtonItem = v3;

  id v5 = [MEMORY[0x1E4FB1618] labelColor];
  [(UIBarButtonItem *)self->_previousButtonItem setTintColor:v5];

  double v6 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:104 target:self action:sel_next_];
  nextButtonItem = self->_nextButtonItem;
  self->_nextButtonItem = v6;

  double v8 = [MEMORY[0x1E4FB1618] labelColor];
  [(UIBarButtonItem *)self->_nextButtonItem setTintColor:v8];

  CGFloat v33 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v33 setWidth:2.0];
  double v9 = objc_alloc_init(_SFFindOnPageInputBar);
  inputBar = self->_inputBar;
  self->_inputBar = v9;

  [(_SFFindOnPageInputBar *)self->_inputBar setDelegate:self];
  [(_SFFindOnPageInputBar *)self->_inputBar _setDisableDictationButton:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  double v12 = [WeakRetained textForToolbarLabel];
  [(_SFFindOnPageInputBar *)self->_inputBar setPlaceholder:v12];

  -[_SFFindOnPageInputBar setContentInset:](self->_inputBar, "setContentInset:", 0.0, 4.0, 0.0, 7.0);
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_inputBar];
  [v13 _setFlexible:1];
  double v14 = [(_SFFindOnPageInputBar *)self->_inputBar searchField];
  double v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  inFieldMatchLabel = self->_inFieldMatchLabel;
  self->_inFieldMatchLabel = v15;

  double v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_inFieldMatchLabel setTextColor:v17];

  [v14 setRightView:self->_inFieldMatchLabel];
  [v14 setClearButtonMode:1];
  CGFloat v18 = [MEMORY[0x1E4FB1438] sharedApplication];
  if (objc_msgSend(v18, "safari_prefersRTLLayout")) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 0;
  }
  [v14 setTextAlignment:v19];

  double v20 = [MEMORY[0x1E4FB1618] labelColor];
  [v14 setTextColor:v20];

  double v21 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismiss_];
  doneBarButtonItem = self->_doneBarButtonItem;
  self->_doneBarButtonItem = v21;

  double v23 = [MEMORY[0x1E4FB17A0] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:2 options:0];
  uint64_t v36 = *MEMORY[0x1E4FB12B0];
  double v24 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v23 size:0.0];
  v37[0] = v24;
  double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];

  [(UIBarButtonItem *)self->_doneBarButtonItem setTitleTextAttributes:v25 forState:0];
  [(UIBarButtonItem *)self->_doneBarButtonItem setTitleTextAttributes:v25 forState:1];
  double v26 = [MEMORY[0x1E4FB1618] labelColor];
  [(UIBarButtonItem *)self->_doneBarButtonItem setTintColor:v26];

  if (_SFDeviceIsPad())
  {
    double v27 = (NSArray *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
    [(NSArray *)v27 setWidth:16.0];
    double v28 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v35[0] = v28;
    v35[1] = v27;
    v35[2] = self->_doneBarButtonItem;
    v35[3] = v13;
    CGRect v29 = v33;
    v35[4] = self->_previousButtonItem;
    v35[5] = v33;
    v35[6] = self->_nextButtonItem;
    v35[7] = v28;
    double v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:8];
    toolbarItems = self->_toolbarItems;
    self->_toolbarItems = v30;
  }
  else
  {
    v34[0] = self->_doneBarButtonItem;
    v34[1] = v13;
    CGRect v29 = v33;
    v34[2] = self->_previousButtonItem;
    v34[3] = v33;
    v34[4] = self->_nextButtonItem;
    CGFloat v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
    double v27 = self->_toolbarItems;
    self->_toolbarItems = v32;
  }
}

- (void)_doUpdateSearchText
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  [WeakRetained updateSearchText:self->_searchText];

  textChangedUpdateTimer = self->_textChangedUpdateTimer;
  self->_textChangedUpdateTimer = 0;
}

- (BOOL)_updateEditing:(BOOL)a3
{
  int v3 = a3;
  int editing = self->_editing;
  if (editing != a3)
  {
    self->_int editing = a3;
    if (!a3) {
      [(_SFFindOnPageInputBar *)self->_inputBar resignFirstResponder];
    }
    [(_SFFindOnPageToolbar *)self updateUI];
  }
  return editing != v3;
}

- (BOOL)_keyboardIsSplit
{
  double v2 = self;
  int v3 = [(UIInputView *)self leftContentView];
  [v3 frame];
  double Width = CGRectGetWidth(v8);
  id v5 = [(UIInputView *)v2 rightContentView];
  [v5 frame];
  CGFloat v6 = Width + CGRectGetWidth(v9);
  [(_SFFindOnPageToolbar *)v2 bounds];
  LOBYTE(v2) = v6 < CGRectGetWidth(v10);

  return (char)v2;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (BOOL)usesNarrowLayout
{
  return self->_usesNarrowLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_inFieldMatchLabel, 0);
  objc_storeStrong((id *)&self->_textChangedUpdateTimer, 0);
  objc_destroyWeak((id *)&self->_findDelegate);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_inputBar, 0);
  objc_storeStrong((id *)&self->_nextButtonItem, 0);
  objc_storeStrong((id *)&self->_previousButtonItem, 0);

  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end