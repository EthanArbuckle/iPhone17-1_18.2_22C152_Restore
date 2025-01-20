@interface HUAboutResidentDeviceFooterView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HUAboutResidentDeviceFooterView)init;
- (HUAboutResidentDeviceFooterView)initWithCoder:(id)a3;
- (HUAboutResidentDeviceFooterView)initWithFrame:(CGRect)a3;
- (HUAboutResidentDeviceFooterView)initWithReuseIdentifier:(id)a3;
- (HUAboutResidentDeviceFooterViewDelegate)delegate;
- (NSMutableArray)constraints;
- (UIEdgeInsets)messageInsets;
- (UITextView)messageView;
- (id)_linkTextAttributes;
- (id)_textAttributes;
- (void)_setupViews;
- (void)setConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageInsets:(UIEdgeInsets)a3;
- (void)setMessageView:(id)a3;
- (void)updateConstraints;
@end

@implementation HUAboutResidentDeviceFooterView

- (HUAboutResidentDeviceFooterView)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUAboutResidentDeviceFooterView;
  v3 = [(HUAboutResidentDeviceFooterView *)&v6 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3) {
    [(HUAboutResidentDeviceFooterView *)v3 _setupViews];
  }
  return v4;
}

- (HUAboutResidentDeviceFooterView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUAboutResidentDeviceFooterView;
  v3 = [(HUAboutResidentDeviceFooterView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(HUAboutResidentDeviceFooterView *)v3 _setupViews];
  }
  return v4;
}

- (HUAboutResidentDeviceFooterView)init
{
  return -[HUAboutResidentDeviceFooterView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (HUAboutResidentDeviceFooterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUAboutResidentDeviceFooterView;
  v3 = -[HUAboutResidentDeviceFooterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HUAboutResidentDeviceFooterView *)v3 _setupViews];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(HUAboutResidentDeviceFooterView *)self messageInsets];
  double v7 = v6;
  [(HUAboutResidentDeviceFooterView *)self messageInsets];
  double v9 = width - (v7 + v8);
  v10 = [(HUAboutResidentDeviceFooterView *)self messageView];
  objc_msgSend(v10, "sizeThatFits:", v9, height);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)setMessageInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_messageInsets.left
    || a3.top != self->_messageInsets.top
    || a3.right != self->_messageInsets.right
    || a3.bottom != self->_messageInsets.bottom)
  {
    self->_messageInsets = a3;
    [(HUAboutResidentDeviceFooterView *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  v3 = [(HUAboutResidentDeviceFooterView *)self constraints];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC8];
    v5 = [(HUAboutResidentDeviceFooterView *)self constraints];
    [v4 deactivateConstraints:v5];

    double v6 = [(HUAboutResidentDeviceFooterView *)self constraints];
    [v6 removeAllObjects];
  }
  else
  {
    double v6 = objc_opt_new();
    [(HUAboutResidentDeviceFooterView *)self setConstraints:v6];
  }

  double v7 = [(HUAboutResidentDeviceFooterView *)self constraints];
  double v8 = [(HUAboutResidentDeviceFooterView *)self messageView];
  double v9 = [v8 leadingAnchor];
  v10 = [(HUAboutResidentDeviceFooterView *)self contentView];
  double v11 = [v10 leadingAnchor];
  [(HUAboutResidentDeviceFooterView *)self messageInsets];
  double v13 = [v9 constraintEqualToAnchor:v11 constant:v12];
  [v7 addObject:v13];

  double v14 = [(HUAboutResidentDeviceFooterView *)self constraints];
  double v15 = [(HUAboutResidentDeviceFooterView *)self messageView];
  double v16 = [v15 trailingAnchor];
  v17 = [(HUAboutResidentDeviceFooterView *)self contentView];
  v18 = [v17 trailingAnchor];
  [(HUAboutResidentDeviceFooterView *)self messageInsets];
  v20 = [v16 constraintEqualToAnchor:v18 constant:-v19];
  [v14 addObject:v20];

  v21 = [(HUAboutResidentDeviceFooterView *)self constraints];
  v22 = [(HUAboutResidentDeviceFooterView *)self messageView];
  v23 = [v22 topAnchor];
  v24 = [(HUAboutResidentDeviceFooterView *)self contentView];
  v25 = [v24 topAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v21 addObject:v26];

  v27 = [(HUAboutResidentDeviceFooterView *)self constraints];
  v28 = [(HUAboutResidentDeviceFooterView *)self messageView];
  v29 = [v28 bottomAnchor];
  v30 = [(HUAboutResidentDeviceFooterView *)self contentView];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  [v27 addObject:v32];

  v33 = (void *)MEMORY[0x1E4F28DC8];
  v34 = [(HUAboutResidentDeviceFooterView *)self constraints];
  [v33 activateConstraints:v34];

  v35.receiver = self;
  v35.super_class = (Class)HUAboutResidentDeviceFooterView;
  [(HUAboutResidentDeviceFooterView *)&v35 updateConstraints];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    double v12 = self;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v11, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained learnMoreLinkTapped:self];

  return 0;
}

- (void)_setupViews
{
  id v3 = objc_alloc(MEMORY[0x1E4F42F58]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HUAboutResidentDeviceFooterView *)self setMessageView:v4];

  v5 = [MEMORY[0x1E4F428B8] clearColor];
  double v6 = [(HUAboutResidentDeviceFooterView *)self messageView];
  [v6 setBackgroundColor:v5];

  double v7 = *MEMORY[0x1E4F437F8];
  double v8 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  int v11 = [(HUAboutResidentDeviceFooterView *)self messageView];
  objc_msgSend(v11, "setContentInset:", v7, v8, v9, v10);

  double v12 = [(HUAboutResidentDeviceFooterView *)self messageView];
  __int16 v13 = [v12 textContainer];
  [v13 setLineFragmentPadding:0.0];

  id v14 = [(HUAboutResidentDeviceFooterView *)self messageView];
  [v14 setEditable:0];

  uint64_t v15 = [(HUAboutResidentDeviceFooterView *)self messageView];
  [v15 setScrollEnabled:0];

  double v16 = [(HUAboutResidentDeviceFooterView *)self messageView];
  [v16 setDelegate:self];

  v17 = [(HUAboutResidentDeviceFooterView *)self messageView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(HUAboutResidentDeviceFooterView *)self messageView];
  [v18 _setInteractiveTextSelectionDisabled:1];

  _HULocalizedStringWithDefaultValue(@"HUUsersAccessWithoutRemoteCapabilityFooter", @"HUUsersAccessWithoutRemoteCapabilityFooter", 1);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  double v19 = _HULocalizedStringWithDefaultValue(@"HUUsersAccessWithoutRemoteCapabilityFooterLearnMore", @"HUUsersAccessWithoutRemoteCapabilityFooterLearnMore", 1);
  v20 = [(HUAboutResidentDeviceFooterView *)self _textAttributes];
  v21 = (void *)[v20 mutableCopy];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v28 attributes:v21];
  v23 = [(HUAboutResidentDeviceFooterView *)self _linkTextAttributes];
  [v21 addEntriesFromDictionary:v23];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v19 attributes:v21];
  [v22 appendAttributedString:v24];
  [(UITextView *)self->_messageView setAttributedText:v22];
  v25 = [(HUAboutResidentDeviceFooterView *)self messageView];
  [v25 setLinkTextAttributes:v23];

  v26 = [(HUAboutResidentDeviceFooterView *)self contentView];
  v27 = [(HUAboutResidentDeviceFooterView *)self messageView];
  [v26 addSubview:v27];
}

- (id)_textAttributes
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F42670]);
  [v2 setAlignment:4];
  v9[0] = *MEMORY[0x1E4F42508];
  id v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  uint64_t v4 = *MEMORY[0x1E4F42540];
  v10[0] = v3;
  v10[1] = v2;
  uint64_t v5 = *MEMORY[0x1E4F42510];
  v9[1] = v4;
  v9[2] = v5;
  double v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v10[2] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)_linkTextAttributes
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F42510];
  id v2 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  uint64_t v3 = *MEMORY[0x1E4F425C8];
  v9[0] = v2;
  v9[1] = &unk_1F19B47F0;
  uint64_t v4 = *MEMORY[0x1E4F42530];
  v8[1] = v3;
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F696F8] aboutResidentDeviceURL];
  v9[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (HUAboutResidentDeviceFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAboutResidentDeviceFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)messageInsets
{
  double top = self->_messageInsets.top;
  double left = self->_messageInsets.left;
  double bottom = self->_messageInsets.bottom;
  double right = self->_messageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UITextView)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_messageView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end