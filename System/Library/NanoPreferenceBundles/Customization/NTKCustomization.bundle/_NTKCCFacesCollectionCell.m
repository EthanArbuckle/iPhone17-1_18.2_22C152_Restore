@interface _NTKCCFacesCollectionCell
+ (id)agaveReuseIdentifier;
+ (id)aloeReuseIdentifier;
+ (id)avoniaReuseIdentifier;
+ (id)classicReuseIdentifier;
+ (id)luxoReuseIdentifier;
+ (id)reuseIdentifier;
- (BOOL)active;
- (CGSize)faceSize;
- (NSString)name;
- (NTKCFaceContainerView)faceContainerView;
- (UIView)faceView;
- (_NTKCCFacesCollectionCell)initWithFrame:(CGRect)a3;
- (void)_fontSizeDidChange;
- (void)_highlight;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setFaceContainerView:(id)a3;
- (void)setFaceSize:(CGSize)a3;
- (void)setFaceView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation _NTKCCFacesCollectionCell

+ (id)agaveReuseIdentifier
{
  v2 = [a1 classicReuseIdentifier];
  v3 = [v2 stringByAppendingString:@"-agave"];

  return v3;
}

+ (id)luxoReuseIdentifier
{
  v2 = [a1 classicReuseIdentifier];
  v3 = [v2 stringByAppendingString:@"-luxo"];

  return v3;
}

+ (id)avoniaReuseIdentifier
{
  v2 = [a1 classicReuseIdentifier];
  v3 = [v2 stringByAppendingString:@"-avonia"];

  return v3;
}

+ (id)classicReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)aloeReuseIdentifier
{
  v2 = [a1 classicReuseIdentifier];
  v3 = [v2 stringByAppendingString:@"-aloe"];

  return v3;
}

+ (id)reuseIdentifier
{
  v3 = +[CLKDevice currentDevice];
  id v4 = [v3 deviceCategory];

  switch((unint64_t)v4)
  {
    case 2uLL:
      v5 = [a1 luxoReuseIdentifier];
      break;
    case 3uLL:
      v5 = [a1 aloeReuseIdentifier];
      break;
    case 4uLL:
      v5 = [a1 agaveReuseIdentifier];
      break;
    case 5uLL:
      v5 = [a1 avoniaReuseIdentifier];
      break;
    default:
      v5 = [a1 classicReuseIdentifier];
      break;
  }

  return v5;
}

- (_NTKCCFacesCollectionCell)initWithFrame:(CGRect)a3
{
  v41.receiver = self;
  v41.super_class = (Class)_NTKCCFacesCollectionCell;
  v3 = -[_NTKCCFacesCollectionCell initWithFrame:](&v41, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    sub_5D90((uint64_t)&v32);
    id v4 = -[NTKCFaceContainerView initWithFaceSize:style:]([NTKCFaceContainerView alloc], "initWithFaceSize:style:", 1, CGSizeZero.width, CGSizeZero.height);
    faceContainerView = v3->_faceContainerView;
    v3->_faceContainerView = v4;

    [(NTKCFaceContainerView *)v3->_faceContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(_NTKCCFacesCollectionCell *)v3 contentView];
    [v6 addSubview:v3->_faceContainerView];

    uint64_t v7 = objc_opt_new();
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v7;

    [(UILabel *)v3->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = +[UIColor whiteColor];
    [(UILabel *)v3->_nameLabel setTextColor:v9];

    v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v3->_nameLabel setFont:v10];

    [(UILabel *)v3->_nameLabel setMinimumScaleFactor:0.2];
    [(UILabel *)v3->_nameLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v3->_nameLabel setTextAlignment:1];
    [(UILabel *)v3->_nameLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_nameLabel setNumberOfLines:0];
    HIDWORD(v11) = HIDWORD(v40);
    *(float *)&double v11 = *((double *)&v40 + 1);
    [(UILabel *)v3->_nameLabel _setHyphenationFactor:v11];
    v12 = [(_NTKCCFacesCollectionCell *)v3 contentView];
    [v12 addSubview:v3->_nameLabel];

    v13 = [(UILabel *)v3->_nameLabel firstBaselineAnchor];
    v14 = [(NTKCFaceContainerView *)v3->_faceContainerView bottomAnchor];
    v15 = [(UILabel *)v3->_nameLabel font];
    [v15 _scaledValueForValue:*(double *)&v37];
    uint64_t v16 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14);
    faceNameFirstBaselineToFaceConstraint = v3->_faceNameFirstBaselineToFaceConstraint;
    v3->_faceNameFirstBaselineToFaceConstraint = (NSLayoutConstraint *)v16;

    v29 = objc_opt_new();
    v30 = [(NTKCFaceContainerView *)v3->_faceContainerView centerXAnchor];
    v31 = [(_NTKCCFacesCollectionCell *)v3 contentView];
    v18 = [v31 centerXAnchor];
    v19 = [v30 constraintEqualToAnchor:v18];
    v42[0] = v19;
    v20 = [(NTKCFaceContainerView *)v3->_faceContainerView topAnchor];
    v21 = [(_NTKCCFacesCollectionCell *)v3 contentView];
    v22 = [v21 topAnchor];
    v23 = [v20 constraintEqualToAnchor:v22 constant:*(double *)&v33];
    v42[1] = v23;
    v42[2] = v3->_faceNameFirstBaselineToFaceConstraint;
    v24 = +[NSArray arrayWithObjects:v42 count:3];
    [v29 addObjectsFromArray:v24];

    v25 = _NSDictionaryOfVariableBindings(@"_nameLabel", v3->_nameLabel, 0);
    v26 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_nameLabel]|" options:0 metrics:0 views:v25];
    [v29 addObjectsFromArray:v26];

    +[NSLayoutConstraint activateConstraints:v29];
    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v3 selector:"_fontSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)_NTKCCFacesCollectionCell;
  [(_NTKCCFacesCollectionCell *)&v4 dealloc];
}

- (void)_fontSizeDidChange
{
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  sub_5D90((uint64_t)v4);
  [v3 _scaledValueForValue:v5];
  -[NSLayoutConstraint setConstant:](self->_faceNameFirstBaselineToFaceConstraint, "setConstant:");
}

- (CGSize)faceSize
{
  [(NTKCFaceContainerView *)self->_faceContainerView faceSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFaceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(NTKCFaceContainerView *)self->_faceContainerView faceSize];
  if (width != v7 || height != v6)
  {
    -[NTKCFaceContainerView setFaceSize:](self->_faceContainerView, "setFaceSize:", width, height);
    [(_NTKCCFacesCollectionCell *)self setNeedsLayout];
  }
}

- (UIView)faceView
{
  return [(NTKCFaceContainerView *)self->_faceContainerView faceView];
}

- (void)setFaceView:(id)a3
{
}

- (NSString)name
{
  return [(UILabel *)self->_nameLabel text];
}

- (void)setName:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(UILabel *)self->_nameLabel text];
  unsigned __int8 v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_nameLabel setText:v6];
    [(_NTKCCFacesCollectionCell *)self _fontSizeDidChange];
  }
}

- (BOOL)active
{
  return [(NTKCFaceContainerView *)self->_faceContainerView active];
}

- (void)setActive:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_NTKCCFacesCollectionCell;
  [(_NTKCCFacesCollectionCell *)&v4 setHighlighted:a3];
  [(_NTKCCFacesCollectionCell *)self _highlight];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_NTKCCFacesCollectionCell;
  [(_NTKCCFacesCollectionCell *)&v4 setSelected:a3];
  [(_NTKCCFacesCollectionCell *)self _highlight];
}

- (void)_highlight
{
  if ([(_NTKCCFacesCollectionCell *)self isSelected]) {
    id v3 = &dword_0 + 1;
  }
  else {
    id v3 = [(_NTKCCFacesCollectionCell *)self isHighlighted];
  }
  faceContainerView = self->_faceContainerView;

  [(NTKCFaceContainerView *)faceContainerView setHighlighted:v3];
}

- (NTKCFaceContainerView)faceContainerView
{
  return self->_faceContainerView;
}

- (void)setFaceContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceContainerView, 0);
  objc_storeStrong((id *)&self->_faceNameFirstBaselineToFaceConstraint, 0);

  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end