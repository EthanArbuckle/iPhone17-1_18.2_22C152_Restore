@interface _WKWarningView
- (BOOL)forMainFrameNavigation;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (RefPtr<const)warning;
- (_WKWarningView)initWithFrame:(CGRect)a3 browsingWarning:(const void *)a4 completionHandler:(void *)a5;
- (id).cxx_construct;
- (uint64_t)dealloc;
- (uint64_t)initWithFrame:(uint64_t)a1 browsingWarning:completionHandler:;
- (void)addContent;
- (void)clickedOnLink:(id)a3;
- (void)continueClicked;
- (void)dealloc;
- (void)goBackClicked;
- (void)layoutSubviews;
- (void)layoutText;
- (void)showDetailsClicked;
- (void)updateContentSize;
@end

@implementation _WKWarningView

- (_WKWarningView)initWithFrame:(CGRect)a3 browsingWarning:(const void *)a4 completionHandler:(void *)a5
{
  v19.receiver = self;
  v19.super_class = (Class)_WKWarningView;
  v7 = -[_WKWarningView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    id location = 0;
    objc_initWeak(&location, v7);
    uint64_t v8 = *(void *)a5;
    *(void *)a5 = 0;
    uint64_t v17 = v8;
    uint64_t v9 = WTF::fastMalloc((WTF *)0x18);
    *(void *)uint64_t v9 = &unk_1EE9B2610;
    *(void *)(v9 + 8) = 0;
    objc_moveWeak((id *)(v9 + 8), &location);
    uint64_t v10 = v17;
    uint64_t v17 = 0;
    *(void *)(v9 + 16) = v10;
    value = v7->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
    v7->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = (void *)v9;
    if (value)
    {
      (*(void (**)(void *))(*(void *)value + 8))(value);
      uint64_t v12 = v17;
      uint64_t v17 = 0;
      if (v12) {
        (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
      }
    }
    objc_destroyWeak(&location);
    ++*(_DWORD *)a4;
    m_ptr = v7->_warning.m_ptr;
    v7->_warning.m_ptr = (BrowsingWarning *)a4;
    if (m_ptr) {
      WTF::RefCounted<WebKit::BrowsingWarning>::deref(m_ptr, v13);
    }
    [(_WKWarningView *)v7 setBackgroundColor:colorForItem(0, v7)];
  }
  else
  {
    LOBYTE(location) = 1;
    int v18 = 0;
    WTF::CompletionHandler<void ()(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &&)>::operator()((uint64_t *)a5);
    ((void (*)(char *, id *))off_1EE9B25E0[v18])(&v20, &location);
  }
  return v7;
}

- (void)addContent
{
  v62[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = colorForItem(2, self);
  uint64_t v4 = *MEMORY[0x1E4F438B8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42A30], "preferredFontForTextStyle:", *MEMORY[0x1E4F438B8]), "pointSize");
  double v7 = v6;
  if (self)
  {
    [(_WKWarningView *)self warning];
    Class isa = v52.super.isa;
  }
  else
  {
    Class isa = 0;
    v52.super.Class isa = 0;
  }
  int v9 = *((_DWORD *)isa + 22);
  if (v9)
  {
    if (v9 != 1)
    {
      std::__throw_bad_variant_access[abi:sn180100]();
LABEL_43:
      __break(1u);
      return;
    }
    uint64_t v10 = @"lock.slash.fill";
  }
  else
  {
    uint64_t v10 = @"exclamationmark.circle.fill";
  }
  v52.super.Class isa = 0;
  WTF::RefCounted<WebKit::BrowsingWarning>::deref(isa, v5);
  id v11 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v46 = objc_msgSend(v11, "initWithImage:", objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", v10));
  [v46 setTintColor:v3];
  objc_msgSend(v46, "setPreferredSymbolConfiguration:", objc_msgSend(MEMORY[0x1E4F42A98], "configurationWithPointSize:", v7 * 0.9));
  [v46 setContentMode:1];
  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (*((void *)self->_warning.m_ptr + 6)) {
    v13 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v13 = &stru_1EEA10550;
  }
  uint64_t v14 = *MEMORY[0x1E4F42508];
  v61[0] = *MEMORY[0x1E4F42508];
  v62[0] = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v4];
  uint64_t v15 = *MEMORY[0x1E4F42510];
  v61[1] = *MEMORY[0x1E4F42510];
  v62[1] = colorForItem(3, self);
  v16 = (const void *)objc_msgSend(v12, "initWithString:attributes:", v13, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v62, v61, 2));
  makeLabel(&v52, (uint64_t)v16);
  if (v16) {
    CFRelease(v16);
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (*((void *)self->_warning.m_ptr + 7)) {
    int v18 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    int v18 = &stru_1EEA10550;
  }
  v59[0] = v14;
  uint64_t v19 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  v59[1] = v15;
  v60[0] = v19;
  v60[1] = colorForItem(4, self);
  char v20 = (const void *)objc_msgSend(v17, "initWithString:attributes:", v18, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v60, v59, 2));
  makeLabel(&v51, (uint64_t)v20);
  if (v20) {
    CFRelease(v20);
  }
  int v21 = *((_DWORD *)self->_warning.m_ptr + 22);
  if (!v21)
  {
    int v22 = 5;
    v23 = &selRef_showDetailsClicked;
    goto LABEL_20;
  }
  if (v21 != 1)
  {
    std::__throw_bad_variant_access[abi:sn180100]();
    goto LABEL_43;
  }
  int v22 = 7;
  v23 = &selRef_continueClicked;
LABEL_20:
  Button = makeButton(v22, (__CFString *)self, (uint64_t)*v23);
  v25 = makeButton(6, (__CFString *)self, (uint64_t)sel_goBackClicked);
  v26 = objc_opt_new();
  objc_storeWeak(&self->_box.m_weakReference, v26);
  objc_msgSend(v26, "setWarningViewBackgroundColor:", colorForItem(1, self));
  objc_msgSend((id)objc_msgSend(v26, "layer"), "setCornerRadius:", 6.0);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  Class v27 = v52.super.isa;
  v57[0] = v46;
  v57[1] = v52.super.isa;
  Class cf = v51.super.isa;
  v57[2] = v51.super.isa;
  v57[3] = v25;
  v28 = v25;
  v29 = Button;
  v57[4] = Button;
  v30 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:5];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v48 != v32) {
          objc_enumerationMutation(v30);
        }
        v34 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v26 addSubview:v34];
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v31);
  }
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_WKWarningView *)self addSubview:v26];
  v35 = (void *)MEMORY[0x1E4F28DC8];
  v56[0] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "leadingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v46, "leadingAnchor")), "constraintEqualToConstant:", 20.0);
  v56[1] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "leadingAnchor"), "anchorWithOffsetToAnchor:", -[objc_class leadingAnchor](v27, "leadingAnchor")), "constraintEqualToConstant:", 60.0);
  v56[2] = objc_msgSend((id)objc_msgSend((id)-[objc_class topAnchor](v27, "topAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v46, "topAnchor")), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend(v46, "bottomAnchor"), "anchorWithOffsetToAnchor:", -[objc_class bottomAnchor](v27, "bottomAnchor")));
  v56[3] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "topAnchor"), "anchorWithOffsetToAnchor:", -[objc_class topAnchor](v27, "topAnchor")), "constraintEqualToConstant:", 20.0);
  v56[4] = objc_msgSend((id)objc_msgSend((id)-[objc_class bottomAnchor](v27, "bottomAnchor"), "anchorWithOffsetToAnchor:", -[objc_class topAnchor](cf, "topAnchor")), "constraintEqualToConstant:", 20.0);
  v56[5] = objc_msgSend((id)objc_msgSend((id)-[_WKWarningView topAnchor](self, "topAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v26, "topAnchor")), "constraintEqualToAnchor:multiplier:", objc_msgSend((id)objc_msgSend(v26, "bottomAnchor"), "anchorWithOffsetToAnchor:", -[_WKWarningView bottomAnchor](self, "bottomAnchor")), 0.5);
  objc_msgSend(v35, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v56, 6));
  v36 = (void *)MEMORY[0x1E4F28DC8];
  v55[0] = objc_msgSend((id)objc_msgSend((id)-[_WKWarningView leftAnchor](self, "leftAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v26, "leftAnchor")), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend(v26, "rightAnchor"), "anchorWithOffsetToAnchor:", -[_WKWarningView rightAnchor](self, "rightAnchor")));
  v55[1] = objc_msgSend((id)objc_msgSend(v26, "widthAnchor"), "constraintLessThanOrEqualToConstant:", 675.0);
  v55[2] = objc_msgSend((id)objc_msgSend(v26, "widthAnchor"), "constraintLessThanOrEqualToAnchor:", -[_WKWarningView widthAnchor](self, "widthAnchor"));
  v55[3] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "leadingAnchor"), "anchorWithOffsetToAnchor:", -[objc_class leadingAnchor](cf, "leadingAnchor")), "constraintEqualToConstant:", 20.0);
  v55[4] = objc_msgSend((id)objc_msgSend((id)-[objc_class trailingAnchor](v27, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v26, "trailingAnchor")), "constraintGreaterThanOrEqualToConstant:", 20.0);
  v55[5] = objc_msgSend((id)objc_msgSend((id)-[objc_class trailingAnchor](cf, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v26, "trailingAnchor")), "constraintGreaterThanOrEqualToConstant:", 20.0);
  v55[6] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v28, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v26, "trailingAnchor")), "constraintEqualToConstant:", 20.0);
  v55[7] = objc_msgSend((id)objc_msgSend((id)-[objc_class bottomAnchor](cf, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v28, "topAnchor")), "constraintEqualToConstant:", 20.0);
  objc_msgSend(v36, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v55, 8));
  objc_msgSend((id)objc_msgSend(v29, "titleLabel"), "intrinsicContentSize");
  double v38 = v37;
  objc_msgSend((id)objc_msgSend(v28, "titleLabel"), "intrinsicContentSize");
  double v40 = v39;
  [(_WKWarningView *)self frame];
  v41 = (void *)MEMORY[0x1E4F28DC8];
  if (v38 + v40 + 60.0 <= v42)
  {
    v53[0] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v28, "leadingAnchor")), "constraintEqualToConstant:", 20.0);
    v53[1] = objc_msgSend((id)objc_msgSend(v28, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v29, "topAnchor"));
    v53[2] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v28, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v26, "bottomAnchor")), "constraintEqualToConstant:", 20.0);
    objc_msgSend(v41, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v53, 3));
  }
  else
  {
    v54[0] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v26, "trailingAnchor")), "constraintEqualToConstant:", 20.0);
    v54[1] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v28, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v29, "topAnchor")), "constraintEqualToConstant:", 20.0);
    v43 = objc_msgSend((id)objc_msgSend(v28, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v26, "bottomAnchor"));
    objc_msgSend((id)objc_msgSend(v29, "titleLabel"), "intrinsicContentSize");
    v54[2] = [v43 constraintEqualToConstant:v44 + 40.0];
    objc_msgSend(v41, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v54, 3));
  }
  [(_WKWarningView *)self updateContentSize];
  if (v26) {
    CFRelease(v26);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v46) {
    CFRelease(v46);
  }
}

- (void)showDetailsClicked
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(&self->_box.m_weakReference);
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "subviews"), "lastObject"), "removeFromSuperview");
  m_ptr = self->_warning.m_ptr;
  double v6 = (void *)*((void *)m_ptr + 9);
  if (v6) {
    CFRetain(*((CFTypeRef *)m_ptr + 9));
  }
  double v7 = (void *)[v6 mutableCopy];
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v23 = *MEMORY[0x1E4F42508];
  v24[0] = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  objc_msgSend(v7, "addAttributes:range:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1), 0, objc_msgSend(v7, "length"));
  uint64_t v8 = [[_WKWarningViewTextView alloc] initWithAttributedString:v7 forWarning:self];
  objc_storeWeak(&self->_details.m_weakReference, v8);
  int v9 = objc_opt_new();
  objc_msgSend(v9, "setWarningViewBackgroundColor:", colorForItem(1, self));
  objc_msgSend((id)objc_msgSend(v9, "layer"), "setCornerRadius:", 6.0);
  objc_msgSend((id)objc_msgSend(v4, "layer"), "setMaskedCorners:", 3);
  objc_msgSend((id)objc_msgSend(v9, "layer"), "setMaskedCorners:", 12);
  uint64_t v10 = objc_opt_new();
  objc_msgSend(v10, "setWarningViewBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "lightGrayColor"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v21[0] = v8;
  v21[1] = v9;
  v21[2] = v10;
  id v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 3, 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v14++) setTranslatesAutoresizingMaskIntoConstraints:0];
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v12);
  }
  [(_WKWarningView *)self addSubview:v9];
  [v9 addSubview:v10];
  [v9 addSubview:v8];
  uint64_t v15 = (void *)MEMORY[0x1E4F28DC8];
  v20[0] = objc_msgSend((id)objc_msgSend(v4, "widthAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "widthAnchor"));
  v20[1] = objc_msgSend((id)objc_msgSend(v4, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "topAnchor"));
  v20[2] = objc_msgSend((id)objc_msgSend(v4, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "leadingAnchor"));
  v20[3] = objc_msgSend((id)objc_msgSend(v10, "widthAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "widthAnchor"));
  v20[4] = objc_msgSend((id)objc_msgSend(v10, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "leadingAnchor"));
  v20[5] = objc_msgSend((id)objc_msgSend(v10, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v9, "topAnchor"));
  v20[6] = objc_msgSend((id)objc_msgSend(v10, "heightAnchor"), "constraintEqualToConstant:", 1.0);
  v20[7] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "topAnchor"), "anchorWithOffsetToAnchor:", -[_WKWarningViewTextView topAnchor](v8, "topAnchor")), "constraintEqualToConstant:", 20.0);
  v20[8] = objc_msgSend((id)objc_msgSend((id)-[_WKWarningViewTextView bottomAnchor](v8, "bottomAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v9, "bottomAnchor")), "constraintEqualToConstant:", 20.0);
  v20[9] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "leadingAnchor"), "anchorWithOffsetToAnchor:", -[_WKWarningViewTextView leadingAnchor](v8, "leadingAnchor")), "constraintEqualToConstant:", 20.0);
  v20[10] = objc_msgSend((id)objc_msgSend((id)-[_WKWarningViewTextView trailingAnchor](v8, "trailingAnchor"), "anchorWithOffsetToAnchor:", objc_msgSend(v9, "trailingAnchor")), "constraintEqualToConstant:", 20.0);
  objc_msgSend(v15, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 11));
  [(_WKWarningView *)self layoutText];
  [(_WKWarningView *)self updateContentSize];
  if (v10) {
    CFRelease(v10);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v7) {
    CFRelease(v7);
  }
}

- (void)updateContentSize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(_WKWarningView *)self layoutIfNeeded];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = (void *)[(_WKWarningView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) frame];
        double v7 = v7 + v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }
  [(_WKWarningView *)self frame];
  double v11 = v10;
  [(_WKWarningView *)self frame];
  -[_WKWarningView setContentSize:](self, "setContentSize:", v11, v7 + v12 * 0.5);
}

- (void)layoutText
{
  id Weak = objc_loadWeak(&self->_details.m_weakReference);

  [Weak invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_WKWarningView;
  [(_WKWarningView *)&v3 layoutSubviews];
  [(_WKWarningView *)self layoutText];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (void)dealloc
{
  *a1 = &unk_1EE9B2638;
  objc_super v3 = (_DWORD *)a1[2];
  a1[2] = 0;
  if (v3) {
    WTF::RefCounted<WebKit::BrowsingWarning>::deref(v3, a2);
  }
  uint64_t v4 = a1[1];
  a1[1] = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

- (void)goBackClicked
{
  p_completionHandler = (uint64_t *)&self->_completionHandler;
  if (*p_completionHandler)
  {
    v3[0] = 0;
    int v4 = 0;
    WTF::CompletionHandler<void ()(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &&)>::operator()(p_completionHandler);
    ((void (*)(char *, unsigned char *))off_1EE9B25E0[v4])(&v5, v3);
  }
}

- (void)continueClicked
{
  p_completionHandler = (uint64_t *)&self->_completionHandler;
  if (*p_completionHandler)
  {
    v3[0] = 1;
    int v4 = 0;
    WTF::CompletionHandler<void ()(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &&)>::operator()(p_completionHandler);
    ((void (*)(char *, char *))off_1EE9B25E0[v4])(&v5, v3);
  }
}

- (void)clickedOnLink:(id)a3
{
  p_completionHandler = (uint64_t *)&self->_completionHandler;
  if (self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_)
  {
    char v5 = (WebKit::BrowsingWarning *)[a3 isEqual:WebKit::BrowsingWarning::visitUnsafeWebsiteSentinel((WebKit::BrowsingWarning *)self)];
    if (v5 || [a3 isEqual:WebKit::BrowsingWarning::confirmMalwareSentinel(v5)])
    {
      v6[0] = 1;
      int v7 = 0;
      WTF::CompletionHandler<void ()(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &&)>::operator()(p_completionHandler);
    }
    else
    {
      MEMORY[0x19972E8A0](v6, a3);
      int v7 = 1;
      WTF::CompletionHandler<void ()(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &&)>::operator()(p_completionHandler);
    }
    if (v7 != -1) {
      ((void (*)(char *, unsigned char *))off_1EE9B25E0[v7])(&v8, v6);
    }
  }
}

- (BOOL)forMainFrameNavigation
{
  return *((unsigned char *)self->_warning.m_ptr + 64);
}

- (RefPtr<const)warning
{
  m_ptr = self->_warning.m_ptr;
  if (m_ptr) {
    ++*(_DWORD *)m_ptr;
  }
  *v2 = m_ptr;
  return (RefPtr<const WebKit::BrowsingWarning, WTF::RawPtrTraits<const WebKit::BrowsingWarning>, WTF::DefaultRefDerefTraits<const WebKit::BrowsingWarning>>)self;
}

- (void).cxx_destruct
{
  m_ptr = self->_warning.m_ptr;
  self->_warning.m_ptr = 0;
  if (m_ptr) {
    WTF::RefCounted<WebKit::BrowsingWarning>::deref(m_ptr, (WTF::StringImpl *)a2);
  }
  objc_destroyWeak(&self->_box.m_weakReference);
  objc_destroyWeak(&self->_details.m_weakReference);
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
  {
    char v5 = *(void (**)(void))(*(void *)value + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 258) = 0;
  *((void *)self + 259) = 0;
  *((void *)self + 260) = 0;
  *((void *)self + 261) = 0;
  return self;
}

- (uint64_t)initWithFrame:(uint64_t)a1 browsingWarning:completionHandler:
{
  return WTF::CompletionHandler<void ()(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &&)>::operator()((uint64_t *)(a1 + 16));
}

- (uint64_t)dealloc
{
  uint64_t v2 = *(void *)(a1 + 8);
  result = (uint64_t *)(a1 + 8);
  if (v2)
  {
    v3[0] = 0;
    int v4 = 0;
    WTF::CompletionHandler<void ()(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &&)>::operator()(result);
    return (uint64_t *)((uint64_t (*)(char *, unsigned char *))off_1EE9B25E0[v4])(&v5, v3);
  }
  return result;
}

@end