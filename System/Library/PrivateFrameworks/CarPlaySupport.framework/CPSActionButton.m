@interface CPSActionButton
- (BOOL)canBecomeFocused;
- (BOOL)disabledButtonFocused;
- (CGSize)intrinsicContentSize;
- (CPSActionButton)initWithFrame:(CGRect)a3;
- (CPSActionButtonLayoutDelegate)layoutDelegate;
- (NSArray)layoutConstraints;
- (NSDictionary)buttonAttributes;
- (NSMutableDictionary)tintColors;
- (NSString)buttonText;
- (UIImage)buttonImage;
- (UIImageView)buttonImageView;
- (UILabel)buttonLabel;
- (void)_updateLayout;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)resetLayoutConstraints;
- (void)setButtonAttributes:(id)a3;
- (void)setButtonImage:(id)a3;
- (void)setButtonImageView:(id)a3;
- (void)setButtonLabel:(id)a3;
- (void)setButtonText:(id)a3;
- (void)setDisabledButtonFocused:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTintColor:(id)a3 forState:(unint64_t)a4;
- (void)setTintColors:(id)a3;
- (void)setupLayoutConstraints;
- (void)setupViews;
- (void)stateUpdated;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updateViews;
@end

@implementation CPSActionButton

- (CPSActionButton)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSActionButton;
  v7 = -[CPSButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    [(CPSActionButton *)v7 setupViews];
    [(CPSActionButton *)v7 setupLayoutConstraints];
  }
  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)layoutSubviews
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSActionButton;
  [(CPSActionButton *)&v2 layoutSubviews];
  [(CPSActionButton *)v4 updateViews];
}

- (void)setButtonImage:(id)a3
{
  v9 = (UIImage **)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v6 = 0;
  char v4 = 0;
  LOBYTE(v3) = 0;
  if (v9[100] != location[0])
  {
    v7 = UIImagePNGRepresentation(v9[100]);
    char v6 = 1;
    objc_super v5 = UIImagePNGRepresentation((UIImage *)location[0]);
    char v4 = 1;
    int v3 = -[NSData isEqual:](v7, "isEqual:") ^ 1;
  }
  if (v4) {

  }
  if (v6) {
  if (v3)
  }
  {
    objc_storeStrong((id *)v9 + 100, location[0]);
    [v9 resetLayoutConstraints];
    [v9 updateViews];
  }
  objc_storeStrong(location, 0);
}

- (void)setButtonText:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (![(NSString *)v4->_buttonText isEqualToString:location[0]])
  {
    objc_storeStrong((id *)&v4->_buttonText, location[0]);
    [(CPSActionButton *)v4 resetLayoutConstraints];
    [(CPSActionButton *)v4 updateViews];
  }
  objc_storeStrong(location, 0);
}

- (void)setupViews
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
  -[CPSActionButton setButtonImageView:](self, "setButtonImageView:");

  int v3 = [(CPSActionButton *)self buttonImageView];
  [(UIImageView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  char v4 = [(CPSActionButton *)self buttonImageView];
  [(UIImageView *)v4 setIsAccessibilityElement:0];

  id v5 = objc_alloc_init(MEMORY[0x263F1C768]);
  -[CPSActionButton setButtonLabel:](self, "setButtonLabel:");

  char v6 = [(CPSActionButton *)self buttonLabel];
  [(UILabel *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(CPSActionButton *)self buttonLabel];
  [(UILabel *)v7 setNumberOfLines:1];

  CGRect v8 = [(CPSActionButton *)self buttonLabel];
  [(UILabel *)v8 setAdjustsFontForContentSizeCategory:1];

  id v10 = (id)[MEMORY[0x263F1C550] _carSystemSecondaryColor];
  v9 = [(CPSActionButton *)self buttonLabel];
  [(UILabel *)v9 setTextColor:v10];

  v11 = [(CPSActionButton *)self buttonLabel];
  [(UILabel *)v11 setIsAccessibilityElement:0];

  [(CPSActionButton *)self _updateLayout];
  v12 = [(CPSActionButton *)self buttonLabel];
  -[CPSActionButton addSubview:](self, "addSubview:");

  v13 = [(CPSActionButton *)self buttonImageView];
  -[CPSActionButton addSubview:](self, "addSubview:");
}

- (void)updateViews
{
  int v3 = [(CPSActionButton *)self buttonText];
  id v2 = [(CPSActionButton *)self buttonLabel];
  [(UILabel *)v2 setText:v3];

  id v5 = [(CPSActionButton *)self buttonImage];
  char v4 = [(CPSActionButton *)self buttonImageView];
  [(UIImageView *)v4 setImage:v5];

  [(CPSActionButton *)self stateUpdated];
}

- (void)setLayoutDelegate:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_layoutDelegate);
  BOOL v4 = WeakRetained == location[0];

  if (!v4)
  {
    objc_storeWeak((id *)&v6->_layoutDelegate, location[0]);
    [(CPSActionButton *)v6 resetLayoutConstraints];
    [(CPSActionButton *)v6 _updateLayout];
  }
  objc_storeStrong(location, 0);
}

- (void)_updateLayout
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = +[CPSEntityStyles actionButtonFont];
  id v10 = [(CPSActionButton *)v14 layoutDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v9 = [(CPSActionButton *)v14 layoutDelegate];
    id v2 = (id)[(CPSActionButtonLayoutDelegate *)v9 font];
    id v3 = location[0];
    location[0] = v2;
  }
  char v6 = [(CPSActionButton *)v14 buttonLabel];
  [(UILabel *)v6 setFont:location[0]];

  double v12 = 8.0;
  v7 = [(CPSActionButton *)v14 layoutDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v5 = [(CPSActionButton *)v14 layoutDelegate];
    [(CPSActionButtonLayoutDelegate *)v5 buttonRadius];
    double v12 = v4;
  }
  [(CPSActionButton *)v14 _setContinuousCornerRadius:v12];
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSActionButton;
  [(CPUIButton *)&v3 traitCollectionDidChange:location[0]];
  [(CPSActionButton *)v5 resetLayoutConstraints];
  [(CPSActionButton *)v5 stateUpdated];
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  double v4 = [(CPSActionButton *)self layoutConstraints];
  uint64_t v5 = [(NSArray *)v4 count];

  if (v5)
  {
    id v2 = (void *)MEMORY[0x263F08938];
    objc_super v3 = [(CPSActionButton *)self layoutConstraints];
    objc_msgSend(v2, "deactivateConstraints:");

    [(CPSActionButton *)self setLayoutConstraints:0];
    [(CPSActionButton *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  char v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSActionButton;
  [(CPSActionButton *)&v4 updateConstraints];
  id v2 = [(CPSActionButton *)v6 layoutConstraints];
  BOOL v3 = [(NSArray *)v2 count] != 0;

  if (!v3) {
    [(CPSActionButton *)v6 setupLayoutConstraints];
  }
}

- (CGSize)intrinsicContentSize
{
  char v6 = [(CPSActionButton *)self layoutDelegate];
  [(CPSActionButtonLayoutDelegate *)v6 buttonSize];
  double v7 = v2;
  double v8 = v3;

  double v4 = v7;
  double v5 = v8;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setupLayoutConstraints
{
  v87[6] = *MEMORY[0x263EF8340];
  v84 = self;
  v83[1] = (id)a2;
  v83[0] = (id)objc_opt_new();
  id v82 = 0;
  v65 = [(CPSActionButton *)v84 layoutDelegate];
  char v78 = 0;
  char v76 = 0;
  char v74 = 0;
  if (objc_opt_respondsToSelector())
  {
    v79 = [(CPSActionButton *)v84 layoutDelegate];
    char v78 = 1;
    [(CPSActionButtonLayoutDelegate *)v79 buttonGlyphSize];
  }
  else
  {
    v77 = [(CPSActionButton *)v84 buttonImageView];
    char v76 = 1;
    v75 = [(UIImageView *)v77 image];
    char v74 = 1;
    [(UIImage *)v75 size];
  }
  double v80 = v2;
  double v81 = v3;
  if (v74) {

  }
  if (v76) {
  if (v78)
  }

  v62 = [(CPSActionButton *)v84 buttonImageView];
  v63 = [(UIImageView *)v62 image];
  char v72 = 0;
  char v70 = 0;
  BOOL v64 = 0;
  if (v63)
  {
    v73 = [(CPSActionButton *)v84 buttonLabel];
    char v72 = 1;
    v71 = [(UILabel *)v73 text];
    char v70 = 1;
    BOOL v64 = [(NSString *)v71 length] != 0;
  }
  if (v70) {

  }
  if (v72) {
  if (v64)
  }
  {
    id v61 = (id)[(CPSActionButton *)v84 centerXAnchor];
    v60 = [(CPSActionButton *)v84 buttonLabel];
    id v59 = (id)[(UILabel *)v60 centerXAnchor];
    id v58 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
    v87[0] = v58;
    id v57 = (id)[(CPSActionButton *)v84 bottomAnchor];
    v56 = [(CPSActionButton *)v84 buttonLabel];
    id v55 = (id)[(UILabel *)v56 bottomAnchor];
    id v54 = (id)objc_msgSend(v57, "constraintEqualToAnchor:");
    v87[1] = v54;
    id v53 = (id)[(CPSActionButton *)v84 centerXAnchor];
    v52 = [(CPSActionButton *)v84 buttonImageView];
    id v51 = (id)[(UIImageView *)v52 centerXAnchor];
    id v50 = (id)objc_msgSend(v53, "constraintEqualToAnchor:");
    v87[2] = v50;
    id v49 = (id)[(CPSActionButton *)v84 topAnchor];
    v48 = [(CPSActionButton *)v84 buttonImageView];
    id v47 = (id)[(UIImageView *)v48 topAnchor];
    id v46 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v87[3] = v46;
    v45 = [(CPSActionButton *)v84 buttonImageView];
    id v44 = (id)[(UIImageView *)v45 widthAnchor];
    id v43 = (id)[v44 constraintEqualToConstant:v80];
    v87[4] = v43;
    v42 = [(CPSActionButton *)v84 buttonImageView];
    id v41 = (id)[(UIImageView *)v42 heightAnchor];
    id v40 = (id)[v41 constraintEqualToConstant:v81];
    v87[5] = v40;
    id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:6];
    id v5 = v82;
    id v82 = v4;
  }
  else
  {
    v37 = [(CPSActionButton *)v84 buttonImageView];
    v38 = [(UIImageView *)v37 image];
    char v68 = 0;
    char v66 = 0;
    BOOL v39 = 0;
    if (v38)
    {
      v69 = [(CPSActionButton *)v84 buttonLabel];
      char v68 = 1;
      v67 = [(UILabel *)v69 text];
      char v66 = 1;
      BOOL v39 = [(NSString *)v67 length] == 0;
    }
    if (v66) {

    }
    if (v68) {
    if (v39)
    }
    {
      v36 = [(CPSActionButton *)v84 buttonImageView];
      id v35 = (id)[(UIImageView *)v36 centerXAnchor];
      id v34 = (id)[(CPSActionButton *)v84 centerXAnchor];
      id v33 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
      v86[0] = v33;
      v32 = [(CPSActionButton *)v84 buttonImageView];
      id v31 = (id)[(UIImageView *)v32 centerYAnchor];
      id v30 = (id)[(CPSActionButton *)v84 centerYAnchor];
      id v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
      v86[1] = v29;
      id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:2];
      id v7 = v82;
      id v82 = v6;
    }
    else
    {
      v28 = [(CPSActionButton *)v84 buttonLabel];
      id v27 = (id)[(UILabel *)v28 centerXAnchor];
      id v26 = (id)[(CPSActionButton *)v84 centerXAnchor];
      id v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
      v85[0] = v25;
      v24 = [(CPSActionButton *)v84 buttonLabel];
      id v23 = (id)[(UILabel *)v24 centerYAnchor];
      id v22 = (id)[(CPSActionButton *)v84 centerYAnchor];
      id v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
      v85[1] = v21;
      id v20 = (id)[(CPSActionButton *)v84 widthAnchor];
      v19 = [(CPSActionButton *)v84 layoutDelegate];
      [(CPSActionButtonLayoutDelegate *)v19 buttonSize];
      id v18 = (id)[v20 constraintEqualToConstant:v8];
      v85[2] = v18;
      id v17 = (id)[(CPSActionButton *)v84 heightAnchor];
      v16 = [(CPSActionButton *)v84 layoutDelegate];
      [(CPSActionButtonLayoutDelegate *)v16 buttonSize];
      id v15 = (id)[v17 constraintEqualToConstant:v9];
      v85[3] = v15;
      id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:4];
      id v11 = v82;
      id v82 = v10;
    }
  }
  [v83[0] addObjectsFromArray:v82];
  id v12 = (id)[v83[0] copy];
  [(CPSActionButton *)v84 setLayoutConstraints:"setLayoutConstraints:"];

  v13 = (void *)MEMORY[0x263F08938];
  v14 = [(CPSActionButton *)v84 layoutConstraints];
  objc_msgSend(v13, "activateConstraints:");

  objc_storeStrong(&v82, 0);
  objc_storeStrong(v83, 0);
}

- (void)setEnabled:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSActionButton;
  [(CPUIButton *)&v3 setEnabled:a3];
}

- (void)setSelected:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSActionButton;
  [(CPSActionButton *)&v3 setSelected:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSActionButton;
  [(CPSActionButton *)&v3 setHighlighted:a3];
  [(CPSActionButton *)v6 stateUpdated];
}

- (void)stateUpdated
{
  id v61 = self;
  v60[1] = (id)a2;
  v60[0] = (id)[MEMORY[0x263F1CB00] _currentTraitCollection];
  id v35 = (id)[(CPSActionButton *)v61 traitCollection];
  objc_msgSend(MEMORY[0x263F1CB00], "_setCurrentTraitCollection:");

  id location = 0;
  id v58 = 0;
  id v57 = 0;
  id v56 = 0;
  id v55 = 0;
  char v54 = 0;
  char v36 = 0;
  if ([(CPSActionButton *)v61 isEnabled])
  {
    char v34 = 1;
    if (([(CPSActionButton *)v61 isSelected] & 1) == 0)
    {
      char v34 = 1;
      if (([(CPSActionButton *)v61 isFocused] & 1) == 0) {
        char v34 = [(CPSActionButton *)v61 isHighlighted];
      }
    }
    char v36 = v34;
  }
  char v54 = v36 & 1;
  if (v36)
  {
    v32 = [(CPSActionButton *)v61 tintColors];
    id v33 = (id)[(NSMutableDictionary *)v32 objectForKeyedSubscript:&unk_26DF069D0];
    char v51 = 0;
    if (v33)
    {
      id v2 = v33;
    }
    else
    {
      id v52 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
      char v51 = 1;
      id v2 = v52;
    }
    id v53 = v2;
    if (v51) {

    }
    id v31 = (id)[(CPSActionButton *)v61 titleColorForState:4];
    char v48 = 0;
    if (v31)
    {
      id v3 = v31;
    }
    else
    {
      id v49 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
      char v48 = 1;
      id v3 = v49;
    }
    id v50 = v3;
    if (v48) {

    }
    objc_storeStrong(&location, v53);
    objc_storeStrong(&v58, v53);
    objc_storeStrong(&v57, v50);
    id v4 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    id v5 = v56;
    id v56 = v4;

    objc_storeStrong(&v55, v56);
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v53, 0);
  }
  else if ([(CPSActionButton *)v61 isEnabled])
  {
    id v29 = [(CPSActionButton *)v61 tintColors];
    id v30 = (id)[(NSMutableDictionary *)v29 objectForKeyedSubscript:&unk_26DF069E8];
    char v45 = 0;
    if (v30)
    {
      id v6 = v30;
    }
    else
    {
      id v46 = (id)[MEMORY[0x263F1C550] _carSystemPrimaryColor];
      char v45 = 1;
      id v6 = v46;
    }
    id v47 = v6;
    if (v45) {

    }
    id v28 = (id)[(CPSActionButton *)v61 titleColorForState:0];
    char v42 = 0;
    if (v28)
    {
      id v7 = v28;
    }
    else
    {
      id v43 = (id)[MEMORY[0x263F1C550] labelColor];
      char v42 = 1;
      id v7 = v43;
    }
    id v44 = v7;
    if (v42) {

    }
    objc_storeStrong(&location, v47);
    objc_storeStrong(&v58, v47);
    objc_storeStrong(&v57, v44);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v47, 0);
  }
  else
  {
    id v8 = (id)[MEMORY[0x263F1C550] _carSystemTertiaryColor];
    id v9 = location;
    id location = v8;

    char v40 = 0;
    char v38 = 0;
    if ([(CPSActionButton *)v61 disabledButtonFocused])
    {
      id v41 = (id)[MEMORY[0x263F1C550] _carSystemTertiaryColor];
      char v40 = 1;
      objc_storeStrong(&v58, v41);
    }
    else
    {
      id v39 = (id)[MEMORY[0x263F1C550] _carSystemQuaternaryColor];
      char v38 = 1;
      objc_storeStrong(&v58, v39);
    }
    if (v38) {

    }
    if (v40) {
    id v10 = (id)[MEMORY[0x263F1C550] labelColor];
    }
    id v11 = v57;
    id v57 = v10;

    objc_storeStrong(&v56, 0);
  }
  uint64_t v22 = [location CGColor];
  id v23 = (id)[(CPSActionButton *)v61 layer];
  [v23 setBorderColor:v22];

  [(CPSActionButton *)v61 setTintColor:v58];
  id v24 = v57;
  id v25 = [(CPSActionButton *)v61 buttonLabel];
  [(UILabel *)v25 setTextColor:v24];

  id v26 = [(CPSActionButton *)v61 layoutDelegate];
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    id v21 = [(CPSActionButton *)v61 layoutDelegate];
    id v12 = (id)[(CPSActionButtonLayoutDelegate *)v21 buttonImageTintColor];
    id v13 = v55;
    id v55 = v12;
  }
  id v17 = v55;
  id v18 = [(CPSActionButton *)v61 buttonImageView];
  [(UIImageView *)v18 setTintColor:v17];

  v19 = [(CPSActionButton *)v61 layoutDelegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v14 = [(CPSActionButton *)v61 layoutDelegate];
    id v37 = (id)[(CPSActionButtonLayoutDelegate *)v14 buttonBackgroundColor];

    uint64_t v15 = [v37 CGColor];
    id v16 = (id)[(CPSActionButton *)v61 layer];
    [v16 setBackgroundColor:v15];

    objc_storeStrong(&v37, 0);
  }
  [MEMORY[0x263F1CB00] _setCurrentTraitCollection:v60[0]];
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v60, 0);
}

- (BOOL)canBecomeFocused
{
  return [(CPSActionButton *)self isEnabled] & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSActionButton *)v7 stateUpdated];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setTintColor:(id)a3 forState:(unint64_t)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(CPSActionButton *)v12 tintColors];
  BOOL v10 = v4 != 0;

  if (!v10)
  {
    id v8 = (id)objc_opt_new();
    -[CPSActionButton setTintColors:](v12, "setTintColors:");
  }
  id v7 = [(CPSActionButton *)v12 tintColors];
  id v6 = (id)[NSNumber numberWithUnsignedInteger:a4];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5);

  objc_storeStrong(location, 0);
}

- (CPSActionButtonLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  return (CPSActionButtonLayoutDelegate *)WeakRetained;
}

- (UIImage)buttonImage
{
  return self->_buttonImage;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (BOOL)disabledButtonFocused
{
  return self->_disabledButtonFocused;
}

- (void)setDisabledButtonFocused:(BOOL)a3
{
  self->_disabledButtonFocused = a3;
}

- (NSDictionary)buttonAttributes
{
  return self->_buttonAttributes;
}

- (void)setButtonAttributes:(id)a3
{
}

- (UILabel)buttonLabel
{
  return self->_buttonLabel;
}

- (void)setButtonLabel:(id)a3
{
}

- (UIImageView)buttonImageView
{
  return self->_buttonImageView;
}

- (void)setButtonImageView:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (NSMutableDictionary)tintColors
{
  return self->_tintColors;
}

- (void)setTintColors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end