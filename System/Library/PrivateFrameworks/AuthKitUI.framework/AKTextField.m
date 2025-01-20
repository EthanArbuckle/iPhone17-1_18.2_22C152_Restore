@interface AKTextField
- (AKTextField)initWithCoder:(id)a3;
- (AKTextField)initWithFrame:(CGRect)a3;
- (BOOL)isEnabled;
- (BOOL)usesVibrancy;
- (NSMutableArray)constraints;
- (UIColor)entryDescriptionTextColor;
- (UIColor)entryFieldTextColor;
- (UIColor)fieldBackgroundColor;
- (UIImageView)backgroundImageView;
- (UITextField)entryField;
- (UIVisualEffectView)visualEffectView;
- (id)_fieldTextColor;
- (id)_setupBackgroundViewConstriants;
- (id)backgroundImage;
- (id)cachedImageUsingBlock:(id)a3;
- (int64_t)blurEffectStyle;
- (int64_t)rowIdentifier;
- (void)_commonInit;
- (void)_drawBackgroundForPathRect:(CGRect)a3 roundedCorners:(unint64_t)a4 cornerRadius:(double)a5 pathSegments:(int)a6;
- (void)_setupInlineEntryStyleViews;
- (void)_setupLabelAndFieldStyles;
- (void)_updateFonts:(id)a3;
- (void)dealloc;
- (void)drawFillForPathRect:(CGRect)a3 roundedCorners:(unint64_t)a4 cornerRadius:(double)a5;
- (void)drawStrokeForPathRect:(CGRect)a3 roundedCorners:(unint64_t)a4 cornerRadius:(double)a5 pathSegments:(int)a6;
- (void)setBackgroundImageView:(id)a3;
- (void)setBlurEffectStyle:(int64_t)a3;
- (void)setConstraints:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEntryDescriptionTextColor:(id)a3;
- (void)setEntryFieldTextColor:(id)a3;
- (void)setFieldBackgroundColor:(id)a3;
- (void)setRowIdentifier:(int64_t)a3;
- (void)setUsesVibrancy:(BOOL)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation AKTextField

- (AKTextField)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKTextField;
  v3 = -[AKTextField initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AKTextField *)v3 _commonInit];
  }
  return v4;
}

- (AKTextField)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKTextField;
  v3 = [(AKTextField *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AKTextField *)v3 _commonInit];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43788] object:0];

  v4.receiver = self;
  v4.super_class = (Class)AKTextField;
  [(AKTextField *)&v4 dealloc];
}

- (void)_commonInit
{
  [(AKTextField *)self _setupInlineEntryStyleViews];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__updateFonts_ name:*MEMORY[0x1E4F43788] object:0];
}

- (void)setEnabled:(BOOL)a3
{
  [(UITextField *)self->_entryField setEnabled:a3];
  id v4 = [(AKTextField *)self _fieldTextColor];
  [(UITextField *)self->_entryField setTextColor:v4];
}

- (BOOL)isEnabled
{
  return [(UITextField *)self->_entryField isEnabled];
}

- (id)_setupBackgroundViewConstriants
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__AKTextField__setupBackgroundViewConstriants__block_invoke;
  v22[3] = &unk_1E648F678;
  v22[4] = self;
  id v4 = [(AKTextField *)self cachedImageUsingBlock:v22];
  if ([(AKTextField *)self usesVibrancy])
  {
    uint64_t v5 = [v4 imageWithRenderingMode:2];

    id v4 = (void *)v5;
  }
  objc_super v6 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4];
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = v6;

  v8 = v6;
  [(UIImageView *)self->_backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  if ([(AKTextField *)self usesVibrancy])
  {
    v9 = objc_msgSend(MEMORY[0x1E4F427D8], "effectWithStyle:", -[AKTextField blurEffectStyle](self, "blurEffectStyle"));
    v10 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v9];
    v11 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v10];
    visualEffectView = self->_visualEffectView;
    self->_visualEffectView = v11;

    [(UIVisualEffectView *)self->_visualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(UIVisualEffectView *)self->_visualEffectView contentView];
    [v13 addSubview:self->_backgroundImageView];

    v14 = _NSDictionaryOfVariableBindings(&cfstr_Backgroundimag.isa, self->_backgroundImageView, 0);
    v15 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[_backgroundImageView]|" options:0 metrics:0 views:v14];
    v16 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_backgroundImageView]|" options:0 metrics:0 views:v14];
    [v3 addObjectsFromArray:v15];
    [v3 addObjectsFromArray:v16];
    v17 = self->_visualEffectView;

    v8 = (UIImageView *)v17;
  }
  [(AKTextField *)self insertSubview:v8 atIndex:0];
  v18 = _NSDictionaryOfVariableBindings(&cfstr_Backgroundview.isa, v8, 0);
  v19 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[backgroundView]|" options:0 metrics:0 views:v18];
  v20 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[backgroundView]|" options:0 metrics:0 views:v18];
  [v3 addObjectsFromArray:v19];
  [v3 addObjectsFromArray:v20];

  return v3;
}

uint64_t __46__AKTextField__setupBackgroundViewConstriants__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundImage];
}

- (void)_updateFonts:(id)a3
{
  [(AKTextField *)self _setupLabelAndFieldStyles];

  [(AKTextField *)self setNeedsUpdateConstraints];
}

- (id)_fieldTextColor
{
  v2 = [(AKTextField *)self entryFieldTextColor];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F428B8] labelColor];
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)_setupLabelAndFieldStyles
{
  id v8 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890] addingSymbolicTraits:0 options:2];
  id v3 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v8 size:0.0];
  id v4 = [(AKTextField *)self _fieldTextColor];
  [(UITextField *)self->_entryField setTextColor:v4];

  [(UITextField *)self->_entryField setFont:v3];
  uint64_t v5 = [(UITextField *)self->_entryField _placeholderLabel];
  [v5 setFont:v3];

  objc_super v6 = [MEMORY[0x1E4F428B8] placeholderTextColor];
  v7 = [(UITextField *)self->_entryField _placeholderLabel];
  [v7 setTextColor:v6];

  [(UITextField *)self->_entryField setKeyboardAppearance:0];
}

- (void)_setupInlineEntryStyleViews
{
  v33[3] = *MEMORY[0x1E4F143B8];
  [(UIImageView *)self->_backgroundImageView removeFromSuperview];
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = 0;

  [(UIVisualEffectView *)self->_visualEffectView removeFromSuperview];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = 0;

  [(UITextField *)self->_entryField removeFromSuperview];
  if (self->_constraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  constraints = self->_constraints;
  self->_constraints = v5;

  v7 = self;
  [(AKTextField *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v8) = 1144750080;
  [(AKTextField *)v7 setContentCompressionResistancePriority:1 forAxis:v8];
  LODWORD(v9) = 1144750080;
  [(AKTextField *)v7 setContentHuggingPriority:1 forAxis:v9];
  v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7 attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:44.0];
  LODWORD(v11) = 1148846080;
  [v10 setPriority:v11];
  v32 = v10;
  [(NSMutableArray *)self->_constraints addObject:v10];
  v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7 attribute:7 relatedBy:0 toItem:0 attribute:7 multiplier:1.0 constant:288.0];
  LODWORD(v13) = 1148846080;
  [v12 setPriority:v13];
  v31 = v12;
  [(NSMutableArray *)self->_constraints addObject:v12];
  entryField = self->_entryField;
  if (!entryField)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F42F10]);
    v16 = (UITextField *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v17 = self->_entryField;
    self->_entryField = v16;

    [(UITextField *)self->_entryField setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v18) = 1132068864;
    [(UITextField *)self->_entryField setContentHuggingPriority:0 forAxis:v18];
    entryField = self->_entryField;
  }
  [(AKTextField *)v7 addSubview:entryField];
  [(AKTextField *)v7 _setupLabelAndFieldStyles];
  v30 = [(UITextField *)self->_entryField leadingAnchor];
  v29 = [(AKTextField *)v7 leadingAnchor];
  v19 = [v30 constraintEqualToAnchor:v29 constant:16.0];
  v33[0] = v19;
  v20 = [(UITextField *)self->_entryField trailingAnchor];
  v21 = [(AKTextField *)v7 trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:-16.0];
  v33[1] = v22;
  v23 = [(UITextField *)self->_entryField centerYAnchor];
  v24 = [(AKTextField *)v7 centerYAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v33[2] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];

  [(NSMutableArray *)self->_constraints addObjectsFromArray:v26];
  v27 = self->_constraints;
  v28 = [(AKTextField *)v7 _setupBackgroundViewConstriants];
  [(NSMutableArray *)v27 addObjectsFromArray:v28];

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
}

- (void)setUsesVibrancy:(BOOL)a3
{
  self->_usesVibrancy = a3;
  [(AKTextField *)self _commonInit];
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  self->_blurEffectStyle = a3;
  [(AKTextField *)self _commonInit];
}

- (void)setFieldBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_fieldBackgroundColor, a3);

  [(AKTextField *)self _commonInit];
}

- (void)setRowIdentifier:(int64_t)a3
{
  self->_rowIdentifier = a3;
  [(UIImageView *)self->_backgroundImageView removeFromSuperview];
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = 0;

  uint64_t v5 = (void *)MEMORY[0x1E4F28DC8];
  id v6 = [(AKTextField *)self _setupBackgroundViewConstriants];
  [v5 activateConstraints:v6];
}

- (id)backgroundImage
{
  double v3 = 35.0;
  double v4 = 0.0;
  v21.width = 35.0;
  v21.height = 35.0;
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  switch(self->_rowIdentifier)
  {
    case 0:
      UIRectInset();
      double v4 = v7;
      double v3 = v8;
      uint64_t v9 = 13;
      uint64_t v10 = 3;
      break;
    case 1:
      UIRectInset();
      double v4 = v11;
      double v3 = v12;
      uint64_t v9 = 16;
      uint64_t v10 = 12;
      break;
    case 2:
      UIRectInset();
      double v4 = v13;
      double v3 = v14;
      uint64_t v10 = 0;
      uint64_t v9 = 13;
      break;
    case 3:
      UIRectInset();
      double v4 = v15;
      double v3 = v16;
      uint64_t v9 = 16;
      uint64_t v10 = -1;
      break;
    default:
      uint64_t v10 = 0;
      uint64_t v9 = 16;
      double v6 = 35.0;
      double v5 = 0.0;
      break;
  }
  -[AKTextField _drawBackgroundForPathRect:roundedCorners:cornerRadius:pathSegments:](self, "_drawBackgroundForPathRect:roundedCorners:cornerRadius:pathSegments:", v10, v9, v5, v4, v6, v3, 10.5);
  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  double v18 = objc_msgSend(v17, "resizableImageWithCapInsets:", 17.0, 17.0, 17.0, 17.0);

  return v18;
}

- (void)_drawBackgroundForPathRect:(CGRect)a3 roundedCorners:(unint64_t)a4 cornerRadius:(double)a5 pathSegments:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_blurEffectStyle == 4 && self->_fieldBackgroundColor)
  {
    if (self->_usesVibrancy) {
      -[AKTextField drawFillForPathRect:roundedCorners:cornerRadius:](self, "drawFillForPathRect:roundedCorners:cornerRadius:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
    }
    -[AKTextField drawStrokeForPathRect:roundedCorners:cornerRadius:pathSegments:](self, "drawStrokeForPathRect:roundedCorners:cornerRadius:pathSegments:", a4, v6, x, y, width, height, a5);
  }
  else
  {
    -[AKTextField drawStrokeForPathRect:roundedCorners:cornerRadius:pathSegments:](self, "drawStrokeForPathRect:roundedCorners:cornerRadius:pathSegments:", a4, *(void *)&a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
    if (self->_usesVibrancy)
    {
      -[AKTextField drawFillForPathRect:roundedCorners:cornerRadius:](self, "drawFillForPathRect:roundedCorners:cornerRadius:", a4, x, y, width, height, a5);
    }
  }
}

- (void)drawStrokeForPathRect:(CGRect)a3 roundedCorners:(unint64_t)a4 cornerRadius:(double)a5 pathSegments:(int)a6
{
  objc_msgSend(MEMORY[0x1E4F427D0], "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", a4, *(void *)&a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  [v9 setLineWidth:1.5 / v7];

  [v9 setUsesEvenOddFillRule:1];
  double v8 = [MEMORY[0x1E4F428B8] opaqueSeparatorColor];
  [v8 set];

  [v9 stroke];
}

- (void)drawFillForPathRect:(CGRect)a3 roundedCorners:(unint64_t)a4 cornerRadius:(double)a5
{
  objc_msgSend(MEMORY[0x1E4F427D0], "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", a4, 16, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  [v11 setLineWidth:1.0 / v7];

  [v11 setUsesEvenOddFillRule:1];
  fieldBackgroundColor = self->_fieldBackgroundColor;
  if (fieldBackgroundColor)
  {
    id v9 = fieldBackgroundColor;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
  }
  uint64_t v10 = v9;
  [(UIColor *)v9 set];
  [v11 fill];
}

- (id)cachedImageUsingBlock:(id)a3
{
  double v16 = (void (**)(id, int64_t, int64_t))a3;
  if (cachedImageUsingBlock__onceToken != -1) {
    dispatch_once(&cachedImageUsingBlock__onceToken, &__block_literal_global_3);
  }
  double v4 = NSString;
  int64_t rowIdentifier = self->_rowIdentifier;
  int64_t blurEffectStyle = self->_blurEffectStyle;
  usesVibrancdouble y = self->_usesVibrancy;
  double v8 = [(AKTextField *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceStyle];
  uint64_t v10 = [(UIColor *)self->_fieldBackgroundColor description];
  id v11 = [v4 stringWithFormat:@"%llu-%llu-%llu-%llu-%@", rowIdentifier, blurEffectStyle, usesVibrancy, v9, v10];

  double v12 = [(id)cachedImageUsingBlock__imageCache objectForKeyedSubscript:v11];

  if (!v12)
  {
    double v13 = v16[2](v16, self->_rowIdentifier, self->_blurEffectStyle);
    [(id)cachedImageUsingBlock__imageCache setObject:v13 forKeyedSubscript:v11];
  }
  double v14 = [(id)cachedImageUsingBlock__imageCache objectForKeyedSubscript:v11];

  return v14;
}

void __37__AKTextField_cachedImageUsingBlock___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)cachedImageUsingBlock__imageCache;
  cachedImageUsingBlock__imageCache = (uint64_t)v0;

  object = dispatch_source_create(MEMORY[0x1E4F14468], 0, 4uLL, MEMORY[0x1E4F14428]);
  dispatch_source_set_event_handler(object, &__block_literal_global_39);
  dispatch_resume(object);
}

uint64_t __37__AKTextField_cachedImageUsingBlock___block_invoke_2()
{
  return [(id)cachedImageUsingBlock__imageCache removeAllObjects];
}

- (UITextField)entryField
{
  return self->_entryField;
}

- (int64_t)rowIdentifier
{
  return self->_rowIdentifier;
}

- (BOOL)usesVibrancy
{
  return self->_usesVibrancy;
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (UIColor)fieldBackgroundColor
{
  return self->_fieldBackgroundColor;
}

- (UIColor)entryDescriptionTextColor
{
  return self->_entryDescriptionTextColor;
}

- (void)setEntryDescriptionTextColor:(id)a3
{
}

- (UIColor)entryFieldTextColor
{
  return self->_entryFieldTextColor;
}

- (void)setEntryFieldTextColor:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
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
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_entryFieldTextColor, 0);
  objc_storeStrong((id *)&self->_entryDescriptionTextColor, 0);
  objc_storeStrong((id *)&self->_fieldBackgroundColor, 0);

  objc_storeStrong((id *)&self->_entryField, 0);
}

@end