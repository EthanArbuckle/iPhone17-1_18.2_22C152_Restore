@interface NTKCCLibraryListCell
+ (id)reuseIdentifier;
- (BOOL)currentFace;
- (NSString)faceName;
- (NTKCCLibraryListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)faceView;
- (void)_fontSizeDidChange;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCurrentFace:(BOOL)a3;
- (void)setFaceName:(id)a3;
- (void)setFaceView:(id)a3;
@end

@implementation NTKCCLibraryListCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NTKCCLibraryListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v37.receiver = self;
  v37.super_class = (Class)NTKCCLibraryListCell;
  v4 = [(NTKCCLibraryListCell *)&v37 initWithStyle:3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = BPSBackgroundColor();
    [(NTKCCLibraryListCell *)v4 setBackgroundColor:v5];

    uint64_t v6 = objc_opt_new();
    horizontalStack = v4->_horizontalStack;
    v4->_horizontalStack = (UIStackView *)v6;

    [(UIStackView *)v4->_horizontalStack setAxis:0];
    uint64_t v8 = NTKCScreenStyle();
    double v9 = 15.0;
    if (v8 == -1) {
      double v9 = 11.0;
    }
    [(UIStackView *)v4->_horizontalStack setSpacing:v9];
    [(UIStackView *)v4->_horizontalStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_horizontalStack setAlignment:3];
    uint64_t v10 = objc_opt_new();
    verticalStack = v4->_verticalStack;
    v4->_verticalStack = (UIStackView *)v10;

    [(UIStackView *)v4->_verticalStack setAxis:1];
    [(UIStackView *)v4->_verticalStack setAlignment:1];
    [(UIStackView *)v4->_verticalStack setSpacing:11.0];
    v12 = +[CLKDevice currentDevice];
    v13 = (char *)[v12 deviceCategory];

    if (v13 == (unsigned char *)&dword_0 + 1) {
      double v14 = 90.0;
    }
    else {
      double v14 = 92.0;
    }
    if (v13 == (unsigned char *)&dword_0 + 1) {
      double v15 = 72.0;
    }
    else {
      double v15 = 75.0;
    }
    v16 = -[NTKCFaceContainerView initWithFaceSize:style:]([NTKCFaceContainerView alloc], "initWithFaceSize:style:", 0, v15, v14);
    faceContainer = v4->_faceContainer;
    v4->_faceContainer = v16;

    LODWORD(v18) = 1148829696;
    [(NTKCFaceContainerView *)v4->_faceContainer setContentCompressionResistancePriority:0 forAxis:v18];
    LODWORD(v19) = 1148829696;
    [(NTKCFaceContainerView *)v4->_faceContainer setContentCompressionResistancePriority:1 forAxis:v19];
    LODWORD(v20) = 1144750080;
    [(NTKCFaceContainerView *)v4->_faceContainer setContentHuggingPriority:0 forAxis:v20];
    [(UIStackView *)v4->_horizontalStack addArrangedSubview:v4->_faceContainer];
    [(UIStackView *)v4->_horizontalStack addArrangedSubview:v4->_verticalStack];
    uint64_t v21 = objc_opt_new();
    name = v4->_name;
    v4->_name = (UILabel *)v21;

    v23 = BPSTextColor();
    [(UILabel *)v4->_name setTextColor:v23];

    [(UILabel *)v4->_name setNumberOfLines:0];
    [(UIStackView *)v4->_verticalStack addArrangedSubview:v4->_name];
    uint64_t v24 = objc_opt_new();
    subtitle = v4->_subtitle;
    v4->_subtitle = (UILabel *)v24;

    v26 = NTKCCustomizationLocalizedString();
    v27 = +[NSAttributedString NTKHyphenatableString:v26];
    [(UILabel *)v4->_subtitle setAttributedText:v27];

    v28 = BPSDetailTextColor();
    [(UILabel *)v4->_subtitle setTextColor:v28];

    [(UILabel *)v4->_subtitle setNumberOfLines:0];
    [(UILabel *)v4->_subtitle setHidden:!v4->_currentFace];
    [(UIStackView *)v4->_verticalStack addArrangedSubview:v4->_subtitle];
    LODWORD(v29) = 1132068864;
    [(UIStackView *)v4->_verticalStack setContentHuggingPriority:1 forAxis:v29];
    v30 = [(NTKCCLibraryListCell *)v4 contentView];
    [v30 addSubview:v4->_horizontalStack];

    v31 = _NSDictionaryOfVariableBindings(@"_horizontalStack", v4->_horizontalStack, 0);
    v32 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(LeadingMargin)-[_horizontalStack]-(TrailingMargin)-|", 0, &off_25BD0, v31);
    +[NSLayoutConstraint activateConstraints:v32];

    v33 = _NSDictionaryOfVariableBindings(@"_horizontalStack", v4->_horizontalStack, 0);
    v34 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(VerticalPadding)-[_horizontalStack]-(VerticalPadding)-|", 0, &off_25BF8, v33);
    +[NSLayoutConstraint activateConstraints:v34];

    v35 = +[NSNotificationCenter defaultCenter];
    [v35 addObserver:v4 selector:"_fontSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(NTKCCLibraryListCell *)v4 _fontSizeDidChange];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKCCLibraryListCell;
  [(NTKCCLibraryListCell *)&v4 dealloc];
}

- (NSString)faceName
{
  return [(UILabel *)self->_name text];
}

- (void)setFaceName:(id)a3
{
  id v4 = +[NSAttributedString NTKHyphenatableString:a3];
  [(UILabel *)self->_name setAttributedText:v4];
}

- (UIView)faceView
{
  return [(NTKCFaceContainerView *)self->_faceContainer faceView];
}

- (void)setFaceView:(id)a3
{
}

- (void)setCurrentFace:(BOOL)a3
{
  if (self->_currentFace != a3)
  {
    self->_currentFace = a3;
    [(UILabel *)self->_subtitle setHidden:!a3];
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)NTKCCLibraryListCell;
  [(NTKCCLibraryListCell *)&v16 layoutSubviews];
  [(NTKCCLibraryListCell *)self separatorInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = [(NTKCFaceContainerView *)self->_faceContainer superview];
  horizontalStack = self->_horizontalStack;

  double v11 = 0.0;
  if (v9 == horizontalStack)
  {
    [(UIStackView *)self->_horizontalStack spacing];
    double v13 = v12 + 80.0 + 23.0;
    double v14 = [(NTKCCLibraryListCell *)self contentView];
    -[NTKCCLibraryListCell convertPoint:fromView:](self, "convertPoint:fromView:", v14, v13, 0.0);
    double v11 = v15;
  }
  -[NTKCCLibraryListCell setSeparatorInset:](self, "setSeparatorInset:", v4, v11, v6, v8);
}

- (void)_fontSizeDidChange
{
  uint64_t v3 = NTKCScreenStyle();
  double v4 = &UIFontTextStyleCallout;
  if (v3 == -1)
  {
    double v5 = (id *)&UIFontTextStyleCaption1;
  }
  else
  {
    double v4 = &UIFontTextStyleTitle2;
    double v5 = (id *)&UIFontTextStyleSubheadline;
  }
  double v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:*v4];
  double v7 = [v6 fontDescriptorWithSymbolicTraits:0x8000];

  double TypographicBounds = 0.0;
  double v9 = +[UIFont fontWithDescriptor:v7 size:0.0];
  [(UILabel *)self->_name setFont:v9];

  id v10 = *v5;
  double v11 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v10];
  double v12 = [v11 fontDescriptorWithSymbolicTraits:0x8000];

  double v13 = +[UIFont fontWithDescriptor:v12 size:0.0];
  [(UILabel *)self->_subtitle setFont:v13];

  double v14 = +[UIFont preferredFontForTextStyle:v10];
  id v15 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v28 = NSFontAttributeName;
  double v29 = v14;
  objc_super v16 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  CFAttributedStringRef v17 = (const __CFAttributedString *)[v15 initWithString:@"M" attributes:v16];

  double v18 = CTLineCreateWithAttributedString(v17);
  if (v18)
  {
    double v19 = v18;
    double TypographicBounds = CTLineGetTypographicBounds(v18, 0, 0, 0);
    CFRelease(v19);
  }
  double v20 = +[UIWindow _applicationKeyWindow];
  [v20 bounds];
  double v22 = v21;

  v23 = [(NTKCFaceContainerView *)self->_faceContainer superview];
  uint64_t v24 = v23;
  if ((unint64_t)(v22 / TypographicBounds) > 0x10) {
    uint64_t v25 = 32;
  }
  else {
    uint64_t v25 = 40;
  }
  v26 = (id *)((char *)&self->super.super.super.super.isa + v25);
  v27 = *(Class *)((char *)&self->super.super.super.super.isa + v25);

  if (v24 != v27)
  {
    [(NTKCFaceContainerView *)self->_faceContainer removeFromSuperview];
    [*v26 insertArrangedSubview:self->_faceContainer atIndex:0];
  }
}

- (BOOL)currentFace
{
  return self->_currentFace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalStack, 0);
  objc_storeStrong((id *)&self->_horizontalStack, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_faceContainer, 0);
}

@end