@interface MKPlaceCardActionSectionView
+ (id)_font:(BOOL)a3;
- (BOOL)singleItemIsFullWidth;
- (MKPlaceCardActionItem)leftItem;
- (MKPlaceCardActionItem)rightItem;
- (MKPlaceCardActionSectionView)initWithLeftActionItem:(id)a3 rightActionItem:(id)a4 useSmallFonts:(BOOL)a5 singleItemIsFullWidth:(BOOL)a6;
- (MKPlaceCardActionSectionView)initWithLeftActionItem:(id)a3 rightActionItem:(id)a4 useSmallFonts:(BOOL)a5 singleItemIsFullWidth:(BOOL)a6 useMarginLayout:(BOOL)a7;
- (MKPlaceCardActionSectionViewDelegate)delegate;
- (UIButton)leftButton;
- (UIButton)rightButton;
- (UIView)accessoryView;
- (id)_makePlaceActionButtonWithActionItem:(id)a3 isLeftItem:(BOOL)a4 useSmallFonts:(BOOL)a5;
- (id)currentLeftItem;
- (id)glyphFont;
- (void)_contentSizeDidChange;
- (void)_leftButtonIsPressed:(id)a3;
- (void)_rightButtonIsPressed:(id)a3;
- (void)_setUpViewWithButtons;
- (void)dealloc;
- (void)infoCardThemeChanged;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAccessoryView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeftButton:(id)a3;
- (void)setLeftItem:(id)a3;
- (void)setRightButton:(id)a3;
- (void)setRightItem:(id)a3;
- (void)setSingleItemIsFullWidth:(BOOL)a3;
- (void)setTopHairlineHidden:(BOOL)a3;
@end

@implementation MKPlaceCardActionSectionView

- (MKPlaceCardActionSectionView)initWithLeftActionItem:(id)a3 rightActionItem:(id)a4 useSmallFonts:(BOOL)a5 singleItemIsFullWidth:(BOOL)a6
{
  return [(MKPlaceCardActionSectionView *)self initWithLeftActionItem:a3 rightActionItem:a4 useSmallFonts:a5 singleItemIsFullWidth:a6 useMarginLayout:1];
}

- (MKPlaceCardActionSectionView)initWithLeftActionItem:(id)a3 rightActionItem:(id)a4 useSmallFonts:(BOOL)a5 singleItemIsFullWidth:(BOOL)a6 useMarginLayout:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MKPlaceCardActionSectionView;
  v15 = [(MKPlaceCardActionSectionView *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15[456] = a7;
    v17 = (id *)(v15 + 504);
    objc_storeStrong((id *)v15 + 63, a3);
    [*v17 addObserver:v16 forKeyPath:@"enabled" options:1 context:0];
    [*v17 addObserver:v16 forKeyPath:@"selected" options:1 context:0];
    objc_storeStrong((id *)v16 + 64, a4);
    v16[457] = a5;
    v16[496] = a6;
    [v16 setPreservesSuperviewLayoutMargins:1];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v16 _setUpViewWithButtons];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v16 selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
  }
  return (MKPlaceCardActionSectionView *)v16;
}

- (id)currentLeftItem
{
  uint64_t v3 = [*(id *)&self->_singleItemIsFullWidth selectedItem];
  if (v3
    && (v4 = (void *)v3, int v5 = [*(id *)&self->_singleItemIsFullWidth selected], v4, v5))
  {
    id v6 = [*(id *)&self->_singleItemIsFullWidth selectedItem];
  }
  else
  {
    id v6 = *(id *)&self->_singleItemIsFullWidth;
  }

  return v6;
}

- (void)_setUpViewWithButtons
{
  [(UIButton *)self->_rightButton removeFromSuperview];
  rightButton = self->_rightButton;
  self->_rightButton = 0;

  [(MKPlaceCardActionItem *)self->_rightItem removeFromSuperview];
  rightItem = self->_rightItem;
  self->_rightItem = 0;

  [(MKPlaceCardActionSectionViewDelegate *)self->_delegate removeFromSuperview];
  delegate = self->_delegate;
  self->_delegate = 0;

  id v53 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(MKPlaceCardActionSectionView *)self heightAnchor];
  uint64_t v7 = [v6 constraintEqualToConstant:0.0];
  v8 = *(void **)&self->_useMarginLayout;
  *(void *)&self->_useMarginLayout = v7;

  [v53 addObject:*(void *)&self->_useMarginLayout];
  leftItem = self->_leftItem;
  if (leftItem)
  {
    v10 = [(MKPlaceCardActionSectionView *)self _makePlaceActionButtonWithActionItem:leftItem isLeftItem:0 useSmallFonts:self->super._highlighted];
    v11 = self->_rightItem;
    self->_rightItem = v10;

    [(MKPlaceCardActionSectionView *)self addSubview:self->_rightItem];
    v12 = [(MKPlaceCardActionItem *)self->_rightItem centerYAnchor];
    id v13 = [(MKPlaceCardActionSectionView *)self centerYAnchor];
    id v14 = [v12 constraintEqualToAnchor:v13];
    uint64_t v15 = 480;
    leftButtonYConstraint = self->_leftButtonYConstraint;
    self->_leftButtonYConstraint = v14;

    [v53 addObject:self->_leftButtonYConstraint];
    v17 = [(MKPlaceCardActionItem *)self->_rightItem trailingAnchor];
    BOOL selected = self->super._selected;
    if (self->super._selected)
    {
      uint64_t v15 = [(MKPlaceCardActionSectionView *)self layoutMarginsGuide];
      [(id)v15 trailingAnchor];
    }
    else
    {
      [(MKPlaceCardActionSectionView *)self trailingAnchor];
    v19 = };
    objc_super v20 = [v17 constraintEqualToAnchor:v19];
    [v53 addObject:v20];

    if (selected)
    {

      v19 = (void *)v15;
    }
  }
  v21 = [(MKPlaceCardActionSectionView *)self currentLeftItem];

  if (v21)
  {
    v22 = [(MKPlaceCardActionSectionView *)self currentLeftItem];
    v23 = [(MKPlaceCardActionSectionView *)self _makePlaceActionButtonWithActionItem:v22 isLeftItem:1 useSmallFonts:self->super._highlighted];
    v24 = self->_rightButton;
    self->_rightButton = v23;

    [(MKPlaceCardActionSectionView *)self addSubview:self->_rightButton];
    v25 = [(UIButton *)self->_rightButton centerYAnchor];
    v26 = [(MKPlaceCardActionSectionView *)self centerYAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    heightAnchor = self->_heightAnchor;
    self->_heightAnchor = v27;

    [v53 addObject:self->_heightAnchor];
    v29 = [(UIButton *)self->_rightButton topAnchor];
    v30 = [(MKPlaceCardActionSectionView *)self topAnchor];
    v31 = [v29 constraintGreaterThanOrEqualToAnchor:v30];
    [v53 addObject:v31];

    v32 = [(UIButton *)self->_rightButton bottomAnchor];
    v33 = [(MKPlaceCardActionSectionView *)self bottomAnchor];
    v34 = [v32 constraintLessThanOrEqualToAnchor:v33];
    [v53 addObject:v34];

    v35 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v36 = [v35 userInterfaceIdiom];

    v37 = [(UIButton *)self->_rightButton leadingAnchor];
    BOOL v38 = self->super._selected;
    if (v36 == 5)
    {
      if (self->super._selected)
      {
        v39 = [(MKPlaceCardActionSectionView *)self layoutMarginsGuide];
        v40 = [v39 leadingAnchor];
      }
      else
      {
        v40 = [(MKPlaceCardActionSectionView *)self leadingAnchor];
        v39 = v40;
      }
      uint64_t v41 = [v37 constraintEqualToAnchor:v40 constant:30.0];
    }
    else
    {
      if (self->super._selected)
      {
        v39 = [(MKPlaceCardActionSectionView *)self layoutMarginsGuide];
        v40 = [v39 leadingAnchor];
      }
      else
      {
        v40 = [(MKPlaceCardActionSectionView *)self leadingAnchor];
        v39 = v40;
      }
      uint64_t v41 = [v37 constraintEqualToAnchor:v40];
    }
    v42 = (void *)v41;
    [v53 addObject:v41];

    if (v38) {
    if (!self->_leftItem)
    }
    {
      v43 = [(UIButton *)self->_rightButton trailingAnchor];
      BOOL v44 = self->super._selected;
      if (self->super._selected)
      {
        v39 = [(MKPlaceCardActionSectionView *)self layoutMarginsGuide];
        [v39 trailingAnchor];
      }
      else
      {
        [(MKPlaceCardActionSectionView *)self trailingAnchor];
      v45 = };
      v46 = [v43 constraintLessThanOrEqualToAnchor:v45];
      [v53 addObject:v46];

      if (v44)
      {

        v45 = v39;
      }
    }
    if (self->_rightItem)
    {
      v47 = [(MKPlaceCardActionSectionView *)self currentLeftItem];

      if (v47)
      {
        LODWORD(v48) = 1148846080;
        [(UIButton *)self->_rightButton _mapkit_setContentCompressionResistancePriority:0 forAxis:v48];
        v49 = [(UIButton *)self->_rightButton trailingAnchor];
        v50 = [(MKPlaceCardActionItem *)self->_rightItem leadingAnchor];
        v51 = [v49 constraintLessThanOrEqualToAnchor:v50 constant:-20.0];

        v52 = [(MKPlaceCardActionItem *)self->_rightItem titleLabel];
        [v52 setLineBreakMode:3];

        [v53 addObject:v51];
      }
    }
  }
  [(MKPlaceCardActionSectionView *)self _contentSizeDidChange];
  [MEMORY[0x1E4F28DC8] activateConstraints:v53];
}

- (id)glyphFont
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 5)
  {
    int v5 = [(id)objc_opt_class() _font:self->super._highlighted];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    [v6 pointSize];
    double v8 = v7 / 13.0;

    double v9 = round(v8 * 16.0);
    if (v9 > 42.0) {
      double v9 = 42.0;
    }
    int v5 = [MEMORY[0x1E4F42A30] systemFontOfSize:v9];
  }

  return v5;
}

- (void)setTopHairlineHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MKViewWithHairline *)self isTopHairlineHidden] != a3)
  {
    if (v3) {
      double v5 = -6.0;
    }
    else {
      double v5 = 6.0;
    }
    id v6 = *(void **)&self->_useMarginLayout;
    [v6 constant];
    [v6 setConstant:v5 + v7];
    leftButtonYConstraint = self->_leftButtonYConstraint;
    double v9 = v5 * 0.5;
    [(NSLayoutConstraint *)leftButtonYConstraint constant];
    [(NSLayoutConstraint *)leftButtonYConstraint setConstant:v9 + v10];
    heightAnchor = self->_heightAnchor;
    [(NSLayoutConstraint *)heightAnchor constant];
    [(NSLayoutConstraint *)heightAnchor setConstant:v9 + v12];
  }
  v13.receiver = self;
  v13.super_class = (Class)MKPlaceCardActionSectionView;
  [(MKViewWithHairline *)&v13 setTopHairlineHidden:v3];
}

- (void)infoCardThemeChanged
{
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceCardActionSectionView;
  [(MKPlaceSectionItemView *)&v9 infoCardThemeChanged];
  rightButton = self->_rightButton;
  uint64_t v4 = [(UIView *)self mk_theme];
  double v5 = [v4 tintColor];
  [(UIButton *)rightButton setTitleColor:v5 forState:0];

  rightItem = self->_rightItem;
  double v7 = [(UIView *)self mk_theme];
  double v8 = [v7 tintColor];
  [(MKPlaceCardActionItem *)rightItem setTitleColor:v8 forState:0];
}

+ (id)_font:(BOOL)a3
{
  uint64_t v4 = +[MKFontManager sharedManager];
  double v5 = v4;
  if (a3) {
    [v4 attributionFont];
  }
  else {
  id v6 = [v4 bodyFont];
  }

  return v6;
}

- (void)_contentSizeDidChange
{
  BOOL v3 = [(id)objc_opt_class() _font:self->super._highlighted];
  id v9 = v3;
  double v4 = 40.0;
  if (!self->super._highlighted) {
    double v4 = 60.0;
  }
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", v4);
  double v6 = v5;
  BOOL v7 = [(MKViewWithHairline *)self isTopHairlineHidden];
  double v8 = 6.0;
  if (v7) {
    double v8 = 0.0;
  }
  [*(id *)&self->_useMarginLayout setConstant:v6 + v8];
}

- (id)_makePlaceActionButtonWithActionItem:(id)a3 isLeftItem:(BOOL)a4 useSmallFonts:(BOOL)a5
{
  BOOL v5 = a4;
  double v6 = (objc_class *)MEMORY[0x1E4F427E0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(id)objc_opt_class() _setButtonString:v8 forActionItem:v7 isLeftItem:v5];

  return v8;
}

- (void)_leftButtonIsPressed:(id)a3
{
  double v4 = [(MKPlaceCardActionSectionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(MKPlaceCardActionSectionView *)self delegate];
    double v6 = [(MKPlaceCardActionSectionView *)self currentLeftItem];
    [v7 placeCardActionSectionView:self buttonWithActionItemPressed:v6];
  }
}

- (void)_rightButtonIsPressed:(id)a3
{
  double v4 = [(MKPlaceCardActionSectionView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MKPlaceCardActionSectionView *)self delegate];
    [v6 placeCardActionSectionView:self buttonWithActionItemPressed:self->_leftItem];
  }
}

- (void)dealloc
{
  [*(id *)&self->_singleItemIsFullWidth removeObserver:self forKeyPath:@"enabled"];
  [*(id *)&self->_singleItemIsFullWidth removeObserver:self forKeyPath:@"selected"];
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceCardActionSectionView;
  [(MKPlaceCardActionSectionView *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  if (([v7 isEqualToString:@"enabled"] & 1) != 0
    || [v7 isEqualToString:@"selected"])
  {
    [(MKPlaceCardActionSectionView *)self _setUpViewWithButtons];
  }
}

- (MKPlaceCardActionItem)leftItem
{
  return *(MKPlaceCardActionItem **)&self->_singleItemIsFullWidth;
}

- (void)setLeftItem:(id)a3
{
}

- (MKPlaceCardActionItem)rightItem
{
  return self->_leftItem;
}

- (void)setRightItem:(id)a3
{
}

- (BOOL)singleItemIsFullWidth
{
  return (BOOL)self->_platterSizeConstraint;
}

- (void)setSingleItemIsFullWidth:(BOOL)a3
{
  LOBYTE(self->_platterSizeConstraint) = a3;
}

- (UIButton)rightButton
{
  return (UIButton *)self->_rightItem;
}

- (void)setRightButton:(id)a3
{
}

- (UIButton)leftButton
{
  return self->_rightButton;
}

- (void)setLeftButton:(id)a3
{
}

- (MKPlaceCardActionSectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leftButton);

  return (MKPlaceCardActionSectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)accessoryView
{
  return (UIView *)self->_delegate;
}

- (void)setAccessoryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_leftButton);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_rightItem, 0);
  objc_storeStrong((id *)&self->_leftItem, 0);
  objc_storeStrong((id *)&self->_singleItemIsFullWidth, 0);
  objc_storeStrong((id *)&self->_rightButtonYConstraint, 0);
  objc_storeStrong((id *)&self->_leftButtonYConstraint, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);

  objc_storeStrong((id *)&self->_useMarginLayout, 0);
}

@end