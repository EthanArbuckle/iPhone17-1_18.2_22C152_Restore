@interface WKSelectPickerGroupHeaderView
+ (double)preferredHeight;
+ (double)preferredMargin;
+ (id)preferredFont;
- (BOOL)isCollapsible;
- (WKSelectPickerGroupHeaderView)initWithGroupName:(id)a3 section:(int64_t)a4 isCollapsible:(BOOL)a5;
- (id).cxx_construct;
- (int64_t)section;
- (void)didTapHeader:(id)a3;
- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4;
- (void)setTableViewController:(id)a3;
@end

@implementation WKSelectPickerGroupHeaderView

- (WKSelectPickerGroupHeaderView)initWithGroupName:(id)a3 section:(int64_t)a4 isCollapsible:(BOOL)a5
{
  v34[3] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)WKSelectPickerGroupHeaderView;
  v8 = [(WKSelectPickerGroupHeaderView *)&v31 init];
  v9 = v8;
  if (v8)
  {
    v8->_section = a4;
    v8->_isCollapsible = a5;
    v10 = (const void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v8 action:sel_didTapHeader_];
    [(WKSelectPickerGroupHeaderView *)v9 addGestureRecognizer:v10];
    id v11 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    m_ptr = v9->_label.m_ptr;
    v9->_label.m_ptr = v11;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      id v11 = v9->_label.m_ptr;
    }
    [v11 setText:a3];
    objc_msgSend(v9->_label.m_ptr, "setFont:", +[WKSelectPickerGroupHeaderView preferredFont](WKSelectPickerGroupHeaderView, "preferredFont"));
    [v9->_label.m_ptr setAdjustsFontForContentSizeCategory:1];
    [v9->_label.m_ptr setAdjustsFontSizeToFitWidth:0];
    [v9->_label.m_ptr setLineBreakMode:4];
    [v9->_label.m_ptr setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WKSelectPickerGroupHeaderView *)v9 addSubview:v9->_label.m_ptr];
    if (v9->_isCollapsible)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F42AA0]);
      uint64_t v14 = objc_msgSend(v13, "initWithImage:", objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", @"chevron.down"));
      v15 = v9->_collapseIndicatorView.m_ptr;
      v9->_collapseIndicatorView.m_ptr = (void *)v14;
      if (v15) {
        CFRelease(v15);
      }
      [v9->_label.m_ptr setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_msgSend(v9->_collapseIndicatorView.m_ptr, "setPreferredSymbolConfiguration:", objc_msgSend(MEMORY[0x1E4F42A98], "configurationWithFont:scale:", +[WKSelectPickerGroupHeaderView preferredFont](WKSelectPickerGroupHeaderView, "preferredFont"), 1));
      LODWORD(v16) = 1148846080;
      [v9->_collapseIndicatorView.m_ptr setContentCompressionResistancePriority:0 forAxis:v16];
      [v9->_collapseIndicatorView.m_ptr setTranslatesAutoresizingMaskIntoConstraints:0];
      [(WKSelectPickerGroupHeaderView *)v9 addSubview:v9->_collapseIndicatorView.m_ptr];
      v17 = (void *)MEMORY[0x1E4F28DC8];
      v18 = (void *)[v9->_label.m_ptr leadingAnchor];
      uint64_t v19 = [(WKSelectPickerGroupHeaderView *)v9 leadingAnchor];
      +[WKSelectPickerGroupHeaderView preferredMargin];
      v34[0] = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
      v34[1] = objc_msgSend((id)objc_msgSend(v9->_label.m_ptr, "trailingAnchor"), "constraintEqualToAnchor:constant:", objc_msgSend(v9->_collapseIndicatorView.m_ptr, "leadingAnchor"), -4.0);
      v34[2] = objc_msgSend((id)objc_msgSend(v9->_label.m_ptr, "topAnchor"), "constraintEqualToAnchor:constant:", -[WKSelectPickerGroupHeaderView topAnchor](v9, "topAnchor"), 0.0);
      objc_msgSend(v17, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v34, 3));
      v20 = (void *)MEMORY[0x1E4F28DC8];
      v21 = (void *)[v9->_collapseIndicatorView.m_ptr trailingAnchor];
      uint64_t v22 = [(WKSelectPickerGroupHeaderView *)v9 trailingAnchor];
      +[WKSelectPickerGroupHeaderView preferredMargin];
      v33[0] = [v21 constraintEqualToAnchor:v22 constant:-v23];
      v33[1] = objc_msgSend((id)objc_msgSend(v9->_collapseIndicatorView.m_ptr, "topAnchor"), "constraintEqualToAnchor:constant:", objc_msgSend(v9->_label.m_ptr, "topAnchor"), 0.0);
      v33[2] = objc_msgSend((id)objc_msgSend(v9->_collapseIndicatorView.m_ptr, "bottomAnchor"), "constraintEqualToAnchor:constant:", objc_msgSend(v9->_label.m_ptr, "bottomAnchor"), 0.0);
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28DC8];
      v25 = (void *)[v9->_label.m_ptr leadingAnchor];
      uint64_t v26 = [(WKSelectPickerGroupHeaderView *)v9 leadingAnchor];
      +[WKSelectPickerGroupHeaderView preferredMargin];
      v32[0] = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26);
      v27 = (void *)[v9->_label.m_ptr trailingAnchor];
      uint64_t v28 = [(WKSelectPickerGroupHeaderView *)v9 trailingAnchor];
      +[WKSelectPickerGroupHeaderView preferredMargin];
      v32[1] = [v27 constraintEqualToAnchor:v28 constant:-v29];
      v32[2] = objc_msgSend((id)objc_msgSend(v9->_label.m_ptr, "topAnchor"), "constraintEqualToAnchor:", -[WKSelectPickerGroupHeaderView topAnchor](v9, "topAnchor"));
      v32[3] = objc_msgSend((id)objc_msgSend(v9->_label.m_ptr, "bottomAnchor"), "constraintEqualToAnchor:", -[WKSelectPickerGroupHeaderView bottomAnchor](v9, "bottomAnchor"));
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    }
    [v20 activateConstraints:v24];
    if (v10) {
      CFRelease(v10);
    }
  }
  return v9;
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isCollapsible && self->_collapsed != a3)
  {
    BOOL v5 = a4;
    self->_collapsed = a3;
    CFRetain(self);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F42FF0];
      *(void *)&v13.a = MEMORY[0x1E4F143A8];
      *(void *)&v13.b = 3321888768;
      *(void *)&v13.c = ___ZZ55__WKSelectPickerGroupHeaderView_setCollapsed_animated__ENK3__3cvU13block_pointerFvvEEv_block_invoke;
      *(void *)&v13.d = &__block_descriptor_40_e8_32c68_ZTSKZ55__WKSelectPickerGroupHeaderView_setCollapsed_animated__E3__3_e5_v8__0l;
      *(void *)&v13.CGFloat tx = self;
      CFRetain(self);
      uint64_t v7 = objc_msgSend((id)objc_msgSend(&v13, "copy"), "autorelease");
      CGFloat tx = v13.tx;
      v13.CGFloat tx = 0.0;
      if (tx != 0.0) {
        CFRelease(*(CFTypeRef *)&tx);
      }
      [v6 animateWithDuration:v7 animations:0.300000012];
    }
    else
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F42FF0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[WKSelectPickerGroupHeaderView semanticContentAttribute](self, "semanticContentAttribute"));
      memset(&v13, 0, sizeof(v13));
      if (self->_collapsed)
      {
        CGAffineTransformMakeRotation(&v13, dbl_1994F6F50[v9 == 0]);
      }
      else
      {
        long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v13.c = v10;
        *(_OWORD *)&v13.CGFloat tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      m_ptr = self->_collapseIndicatorView.m_ptr;
      CGAffineTransform v12 = v13;
      [m_ptr setTransform:&v12];
    }
    CFRelease(self);
  }
}

- (void)setTableViewController:(id)a3
{
}

- (void)didTapHeader:(id)a3
{
  [objc_loadWeak(&self->_tableViewController.m_weakReference) didTapSelectPickerGroupHeaderView:self];
  BOOL v4 = !self->_collapsed;

  [(WKSelectPickerGroupHeaderView *)self setCollapsed:v4 animated:1];
}

+ (id)preferredFont
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438F8]];
  uint64_t v7 = *MEMORY[0x1E4F43848];
  uint64_t v5 = *MEMORY[0x1E4F43940];
  uint64_t v6 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43930]];
  v8[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  uint64_t v3 = objc_msgSend(v2, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  return (id)[MEMORY[0x1E4F42A30] fontWithDescriptor:v3 size:0.0];
}

+ (double)preferredMargin
{
  return 16.0;
}

+ (double)preferredHeight
{
  objc_msgSend(+[WKSelectPickerGroupHeaderView preferredFont](WKSelectPickerGroupHeaderView, "preferredFont"), "lineHeight");
  double v3 = v2;
  +[WKSelectPickerGroupHeaderView preferredMargin];
  return v3 + v4;
}

- (int64_t)section
{
  return self->_section;
}

- (BOOL)isCollapsible
{
  return self->_isCollapsible;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_tableViewController.m_weakReference);
  m_ptr = self->_collapseIndicatorView.m_ptr;
  self->_collapseIndicatorView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  double v4 = self->_label.m_ptr;
  self->_label.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  *((void *)self + 53) = 0;
  return self;
}

@end