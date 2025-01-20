@interface CNStarkHeaderPlatterView
- (BOOL)canBecomeFocused;
- (CNStarkHeaderPlatterView)initWithLabelText:(id)a3 accessoryImage:(id)a4;
- (NSString)labelText;
- (UIImage)accessoryImage;
- (UIImageView)accessory;
- (UILabel)label;
- (void)_updateForFocusedState:(BOOL)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAccessory:(id)a3;
- (void)setAccessoryImage:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelText:(id)a3;
@end

@implementation CNStarkHeaderPlatterView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);

  objc_storeStrong((id *)&self->_labelText, 0);
}

- (void)setAccessory:(id)a3
{
}

- (UIImageView)accessory
{
  return self->_accessory;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setAccessoryImage:(id)a3
{
}

- (UIImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setLabelText:(id)a3
{
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)_updateForFocusedState:(BOOL)a3
{
  if (a3)
  {
    v4 = +[CNUIColorRepository carPlaySiriButtonBackgroundHighlightedColor];
    [(CNStarkHeaderPlatterView *)self setBackgroundColor:v4];

    v5 = +[CNUIColorRepository carPlaySiriButtonTextHighlightedColor];
    v6 = [(CNStarkHeaderPlatterView *)self label];
    [v6 setTextColor:v5];

    +[CNUIColorRepository carPlaySiriButtonTextHighlightedColor];
  }
  else
  {
    v7 = +[CNUIColorRepository carPlaySiriButtonBackgroundColor];
    [(CNStarkHeaderPlatterView *)self setBackgroundColor:v7];

    v8 = +[CNUIColorRepository carPlaySiriButtonTextColor];
    v9 = [(CNStarkHeaderPlatterView *)self label];
    [v9 setTextColor:v8];

    +[CNUIColorRepository carPlaySiriButtonTextColor];
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = [(CNStarkHeaderPlatterView *)self accessory];
  [v10 setTintColor:v11];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNStarkHeaderPlatterView;
  [(CNStarkHeaderPlatterView *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  v7 = [v6 nextFocusedView];
  if (v7 == self)
  {

LABEL_5:
    v10 = [v6 nextFocusedView];
    [(CNStarkHeaderPlatterView *)self _updateForFocusedState:v10 == self];

    goto LABEL_6;
  }
  v8 = v7;
  v9 = [v6 previouslyFocusedView];

  if (v9 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (CNStarkHeaderPlatterView)initWithLabelText:(id)a3 accessoryImage:(id)a4
{
  v52[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)CNStarkHeaderPlatterView;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v12 = -[CNStarkHeaderPlatterView initWithFrame:](&v51, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v9, v10, v11);
  if (v12)
  {
    v13 = +[CNUIColorRepository carPlaySiriButtonBackgroundColor];
    [(CNStarkHeaderPlatterView *)v12 setBackgroundColor:v13];

    [(CNStarkHeaderPlatterView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(CNStarkHeaderPlatterView *)v12 traitCollection];
    _UITableViewDefaultSectionCornerRadiusForTraitCollection();
    double v16 = v15;
    v17 = [(CNStarkHeaderPlatterView *)v12 layer];
    [v17 setCornerRadius:v16];

    uint64_t v18 = *MEMORY[0x1E4F39EA8];
    v19 = [(CNStarkHeaderPlatterView *)v12 layer];
    [v19 setCornerCurve:v18];

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v8, v9, v10, v11);
    label = v12->_label;
    v12->_label = (UILabel *)v20;

    [(UILabel *)v12->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = (void *)[v6 copy];
    [(UILabel *)v12->_label setText:v22];

    v23 = +[CNUIFontRepository carPlayNoContentViewSiriButtonFont];
    [(UILabel *)v12->_label setFont:v23];

    v24 = +[CNUIColorRepository carPlaySiriButtonTextColor];
    [(UILabel *)v12->_label setTextColor:v24];

    [(UILabel *)v12->_label setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v12->_label setMinimumScaleFactor:0.7];
    [(CNStarkHeaderPlatterView *)v12 addSubview:v12->_label];
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
    accessory = v12->_accessory;
    v12->_accessory = (UIImageView *)v25;

    [(UIImageView *)v12->_accessory setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v27) = 1148846080;
    [(UIImageView *)v12->_accessory setContentHuggingPriority:0 forAxis:v27];
    LODWORD(v28) = 1148846080;
    [(UIImageView *)v12->_accessory setContentHuggingPriority:1 forAxis:v28];
    LODWORD(v29) = 1148846080;
    [(UIImageView *)v12->_accessory setContentCompressionResistancePriority:0 forAxis:v29];
    v30 = +[CNUIColorRepository carPlaySiriButtonTextColor];
    [(UIImageView *)v12->_accessory setTintColor:v30];

    [(CNStarkHeaderPlatterView *)v12 addSubview:v12->_accessory];
    v42 = (void *)MEMORY[0x1E4F28DC8];
    v48 = [(UILabel *)v12->_label firstBaselineAnchor];
    v47 = [(CNStarkHeaderPlatterView *)v12 topAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:28.0];
    v52[0] = v46;
    v45 = [(UILabel *)v12->_label leadingAnchor];
    v44 = [(CNStarkHeaderPlatterView *)v12 leadingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:12.0];
    v52[1] = v43;
    v41 = [(UILabel *)v12->_label trailingAnchor];
    v31 = [(UIImageView *)v12->_accessory leadingAnchor];
    v32 = [v41 constraintEqualToAnchor:v31 constant:-12.0];
    v52[2] = v32;
    v33 = [(UIImageView *)v12->_accessory centerYAnchor];
    [(CNStarkHeaderPlatterView *)v12 centerYAnchor];
    v34 = id v50 = v6;
    [v33 constraintEqualToAnchor:v34];
    v35 = id v49 = v7;
    v52[3] = v35;
    v36 = [(UIImageView *)v12->_accessory trailingAnchor];
    v37 = [(CNStarkHeaderPlatterView *)v12 trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37 constant:-17.0];
    v52[4] = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:5];
    [v42 activateConstraints:v39];

    id v7 = v49;
    id v6 = v50;
  }
  return v12;
}

@end