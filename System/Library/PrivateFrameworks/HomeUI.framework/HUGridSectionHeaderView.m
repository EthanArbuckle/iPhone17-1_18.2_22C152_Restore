@interface HUGridSectionHeaderView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)showsDisclosureIndicator;
- (HUGridSectionHeaderView)initWithFrame:(CGRect)a3;
- (NSArray)layoutConstraints;
- (UIImageView)chevronView;
- (UIListContentView)listContentView;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)actionHandler;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_didRecognizeLongPressGesture:(id)a3;
- (void)_didRecognizeTapGesture:(id)a3;
- (void)_installGestureRecognizers;
- (void)_uninstallGestureRecognizers;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setActionHandler:(id)a3;
- (void)setChevronView:(id)a3;
- (void)setContentConfiguration:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setListContentView:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setShowsDisclosureIndicator:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)updateConstraints;
@end

@implementation HUGridSectionHeaderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridSectionHeaderView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)HUGridSectionHeaderView;
  v3 = -[HUGridSectionHeaderView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F42B58] groupedHeaderConfiguration];
    [v4 setText:&stru_1F18F92B8];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F42B60]) initWithConfiguration:v4];
    listContentView = v3->_listContentView;
    v3->_listContentView = (UIListContentView *)v5;

    [(UIListContentView *)v3->_listContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(HUGridSectionHeaderView *)v3 contentView];
    [v7 addSubview:v3->_listContentView];

    v8 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43870]];
    v9 = [MEMORY[0x1E4F42A98] configurationWithWeight:6];
    v10 = [v8 configurationByApplyingConfiguration:v9];
    id v11 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.forward" withConfiguration:v10];
    uint64_t v13 = [v11 initWithImage:v12];
    chevronView = v3->_chevronView;
    v3->_chevronView = (UIImageView *)v13;

    [(UIImageView *)v3->_chevronView setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.35];
    [(UIImageView *)v3->_chevronView setTintColor:v15];

    v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    v17 = [(UIImageView *)v3->_chevronView layer];
    [v17 setCompositingFilter:v16];

    [(UIImageView *)v3->_chevronView setHidden:[(HUGridSectionHeaderView *)v3 showsDisclosureIndicator] ^ 1];
    LODWORD(v18) = 1148846080;
    [(UIImageView *)v3->_chevronView setContentCompressionResistancePriority:0 forAxis:v18];
    v19 = [(HUGridSectionHeaderView *)v3 contentView];
    [v19 addSubview:v3->_chevronView];
  }
  return v3;
}

- (BOOL)showsDisclosureIndicator
{
  return self->_showsDisclosureIndicator;
}

- (void)updateConstraints
{
  v39[6] = *MEMORY[0x1E4F143B8];
  v3 = [(HUGridSectionHeaderView *)self layoutConstraints];
  if (v3)
  {
  }
  else
  {
    v4 = [(HUGridSectionHeaderView *)self listContentView];
    uint64_t v5 = [v4 textLayoutGuide];

    if (v5)
    {
      v6 = [(HUGridSectionHeaderView *)self contentView];
      v37 = [(HUGridSectionHeaderView *)self listContentView];
      v36 = [v37 topAnchor];
      v35 = [v6 topAnchor];
      v34 = [v36 constraintEqualToAnchor:v35];
      v39[0] = v34;
      v33 = [(HUGridSectionHeaderView *)self listContentView];
      v32 = [v33 bottomAnchor];
      v31 = [v6 bottomAnchor];
      v30 = [v32 constraintEqualToAnchor:v31];
      v39[1] = v30;
      v29 = [(HUGridSectionHeaderView *)self listContentView];
      v27 = [v29 leadingAnchor];
      v28 = v6;
      v26 = [v6 leadingAnchor];
      v25 = [v27 constraintEqualToAnchor:v26];
      v39[2] = v25;
      v24 = [(HUGridSectionHeaderView *)self chevronView];
      v22 = [v24 leadingAnchor];
      v23 = [(HUGridSectionHeaderView *)self listContentView];
      objc_super v21 = [v23 trailingAnchor];
      v20 = [v22 constraintEqualToAnchor:v21 constant:6.0];
      v39[3] = v20;
      v19 = [(HUGridSectionHeaderView *)self chevronView];
      double v18 = [v19 trailingAnchor];
      v7 = [v6 trailingAnchor];
      v8 = [v18 constraintLessThanOrEqualToAnchor:v7];
      v39[4] = v8;
      v9 = [(HUGridSectionHeaderView *)self chevronView];
      v10 = [v9 centerYAnchor];
      id v11 = [(HUGridSectionHeaderView *)self listContentView];
      v12 = [v11 textLayoutGuide];
      uint64_t v13 = [v12 centerYAnchor];
      v14 = [v10 constraintEqualToAnchor:v13];
      v39[5] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:6];
      [(HUGridSectionHeaderView *)self setLayoutConstraints:v15];

      v16 = (void *)MEMORY[0x1E4F28DC8];
      v17 = [(HUGridSectionHeaderView *)self layoutConstraints];
      [v16 activateConstraints:v17];
    }
  }
  v38.receiver = self;
  v38.super_class = (Class)HUGridSectionHeaderView;
  [(HUGridSectionHeaderView *)&v38 updateConstraints];
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void)setContentConfiguration:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v9 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v9;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [v6 image];

    if (!v7) {
      [v6 setImageToTextPadding:0.0];
    }
    [v6 setAxesPreservingSuperviewLayoutMargins:0];
    v8 = [(HUGridSectionHeaderView *)self listContentView];
    [v8 setConfiguration:v6];
  }
}

- (void)setActionHandler:(id)a3
{
  id v4 = a3;
  if (self->_actionHandler != v4)
  {
    id v7 = v4;
    uint64_t v5 = _Block_copy(v4);
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = v5;

    if (v7) {
      [(HUGridSectionHeaderView *)self _installGestureRecognizers];
    }
    else {
      [(HUGridSectionHeaderView *)self _uninstallGestureRecognizers];
    }
    id v4 = v7;
  }
}

- (void)setShowsDisclosureIndicator:(BOOL)a3
{
  if (self->_showsDisclosureIndicator != a3)
  {
    self->_showsDisclosureIndicator = a3;
    BOOL v3 = !a3;
    id v4 = [(HUGridSectionHeaderView *)self chevronView];
    [v4 setHidden:v3];
  }
}

- (void)_installGestureRecognizers
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__didRecognizeTapGesture_];
  [(HUGridSectionHeaderView *)self setTapGestureRecognizer:v3];

  id v4 = [(HUGridSectionHeaderView *)self contentView];
  uint64_t v5 = [(HUGridSectionHeaderView *)self tapGestureRecognizer];
  [v4 addGestureRecognizer:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__didRecognizeLongPressGesture_];
  [(HUGridSectionHeaderView *)self setLongPressGestureRecognizer:v6];

  id v7 = [(HUGridSectionHeaderView *)self longPressGestureRecognizer];
  [v7 setMinimumPressDuration:0.0];

  v8 = [(HUGridSectionHeaderView *)self longPressGestureRecognizer];
  [v8 setDelegate:self];

  id v10 = [(HUGridSectionHeaderView *)self contentView];
  id v9 = [(HUGridSectionHeaderView *)self longPressGestureRecognizer];
  [v10 addGestureRecognizer:v9];
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (void)dealloc
{
  [(HUGridSectionHeaderView *)self _uninstallGestureRecognizers];
  v3.receiver = self;
  v3.super_class = (Class)HUGridSectionHeaderView;
  [(HUGridSectionHeaderView *)&v3 dealloc];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUGridSectionHeaderView;
  [(HUGridSectionHeaderView *)&v3 prepareForReuse];
  [(HUGridSectionHeaderView *)self setActionHandler:0];
  [(HUGridSectionHeaderView *)self setShowsDisclosureIndicator:0];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HUGridSectionHeaderView;
  uint64_t v5 = -[HUGridSectionHeaderView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if ([v5 isDescendantOfView:self])
  {
    id v6 = [(HUGridSectionHeaderView *)self actionHandler];
    if (v6) {
      id v7 = v5;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUGridSectionHeaderView;
  -[HUGridSectionHeaderView setHighlighted:](&v7, sel_setHighlighted_);
  if (v3) {
    double v5 = 0.5;
  }
  else {
    double v5 = 1.0;
  }
  id v6 = [(HUGridSectionHeaderView *)self contentView];
  [v6 setAlpha:v5];
}

- (void)_uninstallGestureRecognizers
{
  BOOL v3 = [(HUGridSectionHeaderView *)self tapGestureRecognizer];

  if (v3)
  {
    id v4 = [(HUGridSectionHeaderView *)self contentView];
    double v5 = [(HUGridSectionHeaderView *)self tapGestureRecognizer];
    [v4 removeGestureRecognizer:v5];
  }
  id v6 = [(HUGridSectionHeaderView *)self longPressGestureRecognizer];

  if (v6)
  {
    id v8 = [(HUGridSectionHeaderView *)self contentView];
    objc_super v7 = [(HUGridSectionHeaderView *)self longPressGestureRecognizer];
    [v8 removeGestureRecognizer:v7];
  }
}

- (void)_didRecognizeTapGesture:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([a3 state] == 3)
  {
    id v4 = [(HUGridSectionHeaderView *)self actionHandler];

    if (v4)
    {
      uint64_t v5 = [(HUGridSectionHeaderView *)self actionHandler];
      (*(void (**)(void))(v5 + 16))();
    }
    else
    {
      uint64_t v5 = HFLogForCategory();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 138412290;
        objc_super v7 = self;
        _os_log_error_impl(&dword_1BE345000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "%@ Section header view tapped with no tap action set", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  [(HUGridSectionHeaderView *)self setHighlighted:0];
}

- (void)_didRecognizeLongPressGesture:(id)a3
{
  unint64_t v4 = [a3 state] - 1;
  if (v4 <= 4)
  {
    [(HUGridSectionHeaderView *)self setHighlighted:(v4 & 0x1F) == 0];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUGridSectionHeaderView *)self longPressGestureRecognizer];

  if (v8 == v7)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v9 = [(HUGridSectionHeaderView *)self longPressGestureRecognizer];
    BOOL v10 = v9 == v6;
  }
  return v10;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setListContentView:(id)a3
{
}

- (void)setChevronView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);

  objc_storeStrong(&self->_actionHandler, 0);
}

@end