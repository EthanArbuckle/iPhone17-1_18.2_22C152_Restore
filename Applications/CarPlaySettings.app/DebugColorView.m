@interface DebugColorView
- (BOOL)canBecomeFocused;
- (BOOL)isCellFocused;
- (BOOL)isCellHighlighted;
- (BOOL)isCellSelected;
- (CGSize)contentSize;
- (DebugColorModel)colorModel;
- (DebugColorView)initWithModel:(id)a3;
- (DebugColorViewDelegate)delegate;
- (UIImageView)selectedImageView;
- (UILabel)nameLabel;
- (UIView)colorView;
- (void)_tappyTap;
- (void)setCellFocused:(BOOL)a3;
- (void)setCellHighlighted:(BOOL)a3;
- (void)setCellSelected:(BOOL)a3;
- (void)setColorModel:(id)a3;
- (void)setColorView:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setSelectedImageView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DebugColorView

- (DebugColorView)initWithModel:(id)a3
{
  id v5 = a3;
  v77.receiver = self;
  v77.super_class = (Class)DebugColorView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[DebugColorView initWithFrame:](&v77, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    p_contentSize = &v9->_contentSize;
    v9->_contentSize = CGSizeZero;
    id v11 = +[UIColor labelColor];
    id v12 = [v11 CGColor];
    v13 = [(DebugColorView *)v10 layer];
    [v13 setBorderColor:v12];

    v14 = [(DebugColorView *)v10 layer];
    [v14 setBorderWidth:0.5];

    objc_storeStrong((id *)&v10->_colorModel, a3);
    v15 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    colorView = v10->_colorView;
    v10->_colorView = v15;

    [(UIView *)v10->_colorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [v5 color];
    [(UIView *)v10->_colorView setBackgroundColor:v17];

    v18 = [(UIView *)v10->_colorView layer];
    [v18 setCornerRadius:10.0];

    [(DebugColorView *)v10 addSubview:v10->_colorView];
    v19 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    nameLabel = v10->_nameLabel;
    v10->_nameLabel = v19;

    [(UILabel *)v10->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_nameLabel setAdjustsFontForContentSizeCategory:1];
    v21 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption2];
    UIFontDescriptorTraitKey v81 = UIFontWeightTrait;
    v22 = +[NSNumber numberWithDouble:UIFontWeightRegular];
    v82 = v22;
    v74 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];

    UIFontDescriptorAttributeName v79 = UIFontDescriptorTraitsAttribute;
    v80 = v74;
    v23 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    v73 = [v21 fontDescriptorByAddingAttributes:v23];

    v24 = +[UIFont fontWithDescriptor:v73 size:0.0];
    [(UILabel *)v10->_nameLabel setFont:v24];

    [(UILabel *)v10->_nameLabel setTextAlignment:1];
    v25 = [v5 name];
    [(UILabel *)v10->_nameLabel setText:v25];

    v26 = +[UIColor tableBackgroundColor];
    [(UILabel *)v10->_nameLabel setBackgroundColor:v26];

    [(DebugColorView *)v10 addSubview:v10->_nameLabel];
    id v27 = objc_alloc((Class)UIImageView);
    v28 = +[UIImage systemImageNamed:@"checkmark.circle"];
    v29 = (UIImageView *)[v27 initWithImage:v28];
    selectedImageView = v10->_selectedImageView;
    v10->_selectedImageView = v29;

    [(UIImageView *)v10->_selectedImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = +[UIColor greenColor];
    [(UIImageView *)v10->_selectedImageView setTintColor:v31];

    [(DebugColorView *)v10 addSubview:v10->_selectedImageView];
    [(UIImageView *)v10->_selectedImageView setHidden:1];
    v72 = [(UIView *)v10->_colorView topAnchor];
    v71 = [(DebugColorView *)v10 topAnchor];
    v70 = [v72 constraintEqualToAnchor:v71 constant:5.0];
    v78[0] = v70;
    v69 = [(UIView *)v10->_colorView centerXAnchor];
    v68 = [(DebugColorView *)v10 centerXAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v78[1] = v67;
    v65 = [(UIView *)v10->_colorView heightAnchor];
    v66 = [(UIView *)v10->_colorView layer];
    [v66 cornerRadius];
    v64 = [v65 constraintEqualToConstant:v32 + v32];
    v78[2] = v64;
    v63 = [(UIView *)v10->_colorView widthAnchor];
    v62 = [(UIView *)v10->_colorView heightAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v78[3] = v61;
    v60 = [(UILabel *)v10->_nameLabel topAnchor];
    v59 = [(UIView *)v10->_colorView bottomAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:5.0];
    v78[4] = v58;
    v57 = [(UILabel *)v10->_nameLabel bottomAnchor];
    v56 = [(DebugColorView *)v10 bottomAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:-5.0];
    v78[5] = v55;
    v54 = [(UILabel *)v10->_nameLabel leftAnchor];
    v53 = [(DebugColorView *)v10 leftAnchor];
    v52 = [v54 constraintEqualToAnchor:v53 constant:5.0];
    v78[6] = v52;
    v51 = [(UILabel *)v10->_nameLabel rightAnchor];
    v50 = [(DebugColorView *)v10 rightAnchor];
    v49 = [v51 constraintEqualToAnchor:v50 constant:-5.0];
    v78[7] = v49;
    v48 = [(UILabel *)v10->_nameLabel widthAnchor];
    v47 = [v48 constraintEqualToConstant:100.0];
    v78[8] = v47;
    v46 = [(UIImageView *)v10->_selectedImageView leftAnchor];
    v45 = [(DebugColorView *)v10 leftAnchor];
    v44 = [v46 constraintEqualToAnchor:v45 constant:5.0];
    v78[9] = v44;
    v33 = [(UIImageView *)v10->_selectedImageView bottomAnchor];
    [(DebugColorView *)v10 bottomAnchor];
    v34 = id v76 = v5;
    v35 = [v33 constraintEqualToAnchor:v34 constant:-5.0];
    v78[10] = v35;
    v36 = [(UIImageView *)v10->_selectedImageView heightAnchor];
    v37 = [v36 constraintEqualToConstant:20.0];
    v78[11] = v37;
    v38 = [(UIImageView *)v10->_selectedImageView widthAnchor];
    v39 = [v38 constraintEqualToConstant:20.0];
    v78[12] = v39;
    v40 = +[NSArray arrayWithObjects:v78 count:13];
    +[NSLayoutConstraint activateConstraints:v40];

    id v5 = v76;
    -[DebugColorView systemLayoutSizeFittingSize:](v10, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    *(void *)&p_contentSize->double width = v41;
    *(void *)&p_contentSize->double height = v42;
    [(DebugColorView *)v10 invalidateIntrinsicContentSize];
  }
  return v10;
}

- (void)_tappyTap
{
  v3 = [(DebugColorView *)self delegate];

  if (v3)
  {
    id v4 = [(DebugColorView *)self delegate];
    [v4 colorViewWasTapped:self];
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DebugColorView;
  [(DebugColorView *)&v7 traitCollectionDidChange:a3];
  id v4 = +[UIColor labelColor];
  id v5 = [v4 CGColor];
  v6 = [(DebugColorView *)self layer];
  [v6 setBorderColor:v5];
}

- (void)setCellFocused:(BOOL)a3
{
  if (a3) {
    +[UIColor _carSystemFocusColor];
  }
  else {
  id v4 = +[UIColor clearColor];
  }
  [(DebugColorView *)self setBackgroundColor:v4];
}

- (BOOL)isCellFocused
{
  v2 = [(DebugColorView *)self backgroundColor];
  v3 = +[UIColor _carSystemFocusColor];
  unsigned __int8 v4 = [v2 isEqual:v3];

  return v4;
}

- (void)setCellSelected:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(DebugColorView *)self selectedImageView];
  [v4 setHidden:v3];
}

- (BOOL)isCellSelected
{
  v2 = [(DebugColorView *)self selectedImageView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setCellHighlighted:(BOOL)a3
{
  double v3 = 0.800000012;
  if (!a3) {
    double v3 = 1.0;
  }
  [(DebugColorView *)self setAlpha:v3];
}

- (BOOL)isCellHighlighted
{
  [(DebugColorView *)self alpha];
  return v2 == 0.800000012;
}

- (DebugColorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DebugColorViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DebugColorModel)colorModel
{
  return self->_colorModel;
}

- (void)setColorModel:(id)a3
{
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UIImageView)selectedImageView
{
  return self->_selectedImageView;
}

- (void)setSelectedImageView:(id)a3
{
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImageView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_colorModel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end