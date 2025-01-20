@interface MKCompassView
+ (id)_parameterForSize:(int64_t)a3;
+ (id)_parameterForStyle:(int64_t)a3;
- (BOOL)isPointInNorthEastHalf:(CGPoint)a3;
- (CGSize)intrinsicContentSize;
- (MKCompassView)initWithCoder:(id)a3;
- (MKCompassView)initWithFrame:(CGRect)a3;
- (double)mapHeading;
- (id)_compassDirectionImageForKey:(id)a3 sizeParams:(id)a4 styleParams:(id)a5 scale:(double)a6;
- (id)stringForCompassPoint:(int)a3;
- (int64_t)compassViewSize;
- (int64_t)compassViewStyle;
- (void)_adaptCompassStyleToUserInterfaceStyle;
- (void)_commonInit;
- (void)_populateCompassPointLocalizedAbbreviationsArray;
- (void)_setupImageView:(id)a3;
- (void)_updateImageForCompassDirection:(int)a3;
- (void)_updateLayerForCurrentSizeAndStyle;
- (void)_updateStyle;
- (void)dealloc;
- (void)layoutSubviews;
- (void)movedToWindow:(id)a3;
- (void)setCompassViewSize:(int64_t)a3;
- (void)setCompassViewSize:(int64_t)a3 style:(int64_t)a4;
- (void)setMapHeading:(double)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateLocale:(id)a3;
@end

@implementation MKCompassView

+ (id)_parameterForSize:(int64_t)a3
{
  if (_parameterForSize__onceToken != -1) {
    dispatch_once(&_parameterForSize__onceToken, &__block_literal_global_24);
  }
  if ((unint64_t)a3 <= 2) {
    a1 = (id)*(&off_1E54BD090)[a3];
  }

  return a1;
}

void __35__MKCompassView__parameterForSize___block_invoke()
{
  v0 = objc_alloc_init(_MKCompassViewSizeParameter);
  v1 = (void *)qword_1EB315B18;
  qword_1EB315B18 = (uint64_t)v0;

  [(id)qword_1EB315B18 setImageNamePart:@"Small"];
  [(id)qword_1EB315B18 setDiameter:36.0];
  double v2 = *MEMORY[0x1E4F43920];
  v3 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0 weight:*MEMORY[0x1E4F43920]];
  [(id)qword_1EB315B18 setFont:v3];

  v4 = objc_alloc_init(_MKCompassViewSizeParameter);
  v5 = (void *)qword_1EB315B20;
  qword_1EB315B20 = (uint64_t)v4;

  [(id)qword_1EB315B20 setImageNamePart:@"Medium"];
  [(id)qword_1EB315B20 setDiameter:44.0];
  v6 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0 weight:v2];
  [(id)qword_1EB315B20 setFont:v6];

  v7 = objc_alloc_init(_MKCompassViewSizeParameter);
  v8 = (void *)qword_1EB315B28;
  qword_1EB315B28 = (uint64_t)v7;

  [(id)qword_1EB315B28 setImageNamePart:@"Large"];
  [(id)qword_1EB315B28 setDiameter:60.0];
  id v9 = [MEMORY[0x1E4F42A30] systemFontOfSize:20.0 weight:*MEMORY[0x1E4F43930]];
  [(id)qword_1EB315B28 setFont:v9];
}

- (MKCompassView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKCompassView;
  v3 = -[MKCompassView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MKCompassView *)v3 _commonInit];
  }
  return v4;
}

- (MKCompassView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKCompassView;
  v3 = [(MKCompassView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MKCompassView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v15[1] = *MEMORY[0x1E4F143B8];
  LODWORD(v2) = 1144750080;
  [(MKCompassView *)self setContentCompressionResistancePriority:0 forAxis:v2];
  LODWORD(v4) = 1144750080;
  [(MKCompassView *)self setContentCompressionResistancePriority:1 forAxis:v4];
  LODWORD(v5) = 1144750080;
  [(MKCompassView *)self setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1144750080;
  [(MKCompassView *)self setContentHuggingPriority:1 forAxis:v6];
  v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:0];
  containerImageView = self->_containerImageView;
  self->_containerImageView = v7;

  [(MKCompassView *)self addSubview:self->_containerImageView];
  id v9 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:0];
  assetImageView = self->_assetImageView;
  self->_assetImageView = v9;

  [(UIImageView *)self->_containerImageView addSubview:self->_assetImageView];
  [(MKCompassView *)self _populateCompassPointLocalizedAbbreviationsArray];
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v12 = MNLocaleDidChangeNotification();
  [v11 addObserver:self selector:sel_updateLocale_ name:v12 object:0];

  v15[0] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v14 = (id)[(MKCompassView *)self registerForTraitChanges:v13 withAction:sel_traitEnvironment_didChangeTraitCollection_];
}

- (void)movedToWindow:(id)a3
{
  if (a3) {
    [(MKCompassView *)self _updateStyle];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MKCompassView;
  [(MKCompassView *)&v4 dealloc];
}

- (void)updateLocale:(id)a3
{
  [(MKCompassView *)self _populateCompassPointLocalizedAbbreviationsArray];

  [(MKCompassView *)self _updateLayerForCurrentSizeAndStyle];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MKCompassView;
  [(MKCompassView *)&v3 layoutSubviews];
  [(MKCompassView *)self _setupImageView:self->_containerImageView];
  [(MKCompassView *)self _setupImageView:self->_assetImageView];
}

- (void)_setupImageView:(id)a3
{
  id v4 = a3;
  id v18 = [v4 image];
  [v18 size];
  double v6 = v5;
  [v18 size];
  double v8 = v7;
  [(MKCompassView *)self bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v6, v8);
  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  double MidX = CGRectGetMidX(v20);
  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  objc_msgSend(v4, "setCenter:", MidX, CGRectGetMidY(v21));
}

- (void)_updateStyle
{
  [(MKCompassView *)self _adaptCompassStyleToUserInterfaceStyle];

  [(MKCompassView *)self _updateLayerForCurrentSizeAndStyle];
}

- (void)_adaptCompassStyleToUserInterfaceStyle
{
  id v3 = [(MKCompassView *)self traitCollection];
  self->_compassViewStyle = [v3 userInterfaceStyle] != 2;
}

- (void)setCompassViewSize:(int64_t)a3
{
}

- (void)setCompassViewSize:(int64_t)a3 style:(int64_t)a4
{
  if (self->_compassViewSize != a3 || self->_compassViewStyle != a4)
  {
    self->_compassViewSize = a3;
    self->_compassViewStyle = a4;
    [(MKCompassView *)self _updateLayerForCurrentSizeAndStyle];
    [(MKCompassView *)self layoutIfNeeded];
  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  double v6 = [(MKCompassView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  uint64_t v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    [(MKCompassView *)self _updateStyle];
  }
}

- (void)_updateLayerForCurrentSizeAndStyle
{
  objc_msgSend((id)objc_opt_class(), "_parameterForSize:", -[MKCompassView compassViewSize](self, "compassViewSize"));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_msgSend((id)objc_opt_class(), "_parameterForStyle:", -[MKCompassView compassViewStyle](self, "compassViewStyle"));
  id v4 = [v3 backgroundColor];
  [(MKCompassView *)self setBackgroundColor:v4];

  [v20 diameter];
  double v6 = v5 * 0.5;
  uint64_t v7 = [(MKCompassView *)self layer];
  [v7 setCornerRadius:v6];

  uint64_t v8 = [(MKCompassView *)self layer];
  [v8 setShadowRadius:8.0];

  double v9 = [(MKCompassView *)self layer];
  objc_msgSend(v9, "setShadowOffset:", 0.0, 2.0);

  id v10 = [v3 shadowColor];
  uint64_t v11 = [v10 CGColor];
  CGFloat v12 = [(MKCompassView *)self layer];
  [v12 setShadowColor:v11];

  double v13 = [(MKCompassView *)self layer];
  LODWORD(v14) = 1034147594;
  [v13 setShadowOpacity:v14];

  double v15 = (void *)MEMORY[0x1E4F427D0];
  [(MKCompassView *)self bounds];
  objc_msgSend(v15, "bezierPathWithOvalInRect:");
  id v16 = objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 CGPath];
  id v18 = [(MKCompassView *)self layer];
  [v18 setShadowPath:v17];

  [(MKCompassView *)self mapHeading];
  [(MKCompassView *)self _updateImageForCompassDirection:MKCompassPointNEWSForHeading(v19)];
}

- (void)_updateImageForCompassDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_msgSend((id)objc_opt_class(), "_parameterForSize:", -[MKCompassView compassViewSize](self, "compassViewSize"));
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  double v5 = objc_msgSend((id)objc_opt_class(), "_parameterForStyle:", -[MKCompassView compassViewStyle](self, "compassViewStyle"));
  double v6 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v7 = NSString;
  uint64_t v8 = [v23 imageNamePart];
  double v9 = [v5 imageNamePart];
  id v10 = [v7 stringWithFormat:@"Compass%@%@", v8, v9];

  uint64_t v11 = objc_msgSend(v6, "_mapkit_imageNamed:", v10);
  [(UIImageView *)self->_assetImageView setImage:v11];

  CGFloat v12 = [(UIImageView *)self->_assetImageView image];

  if (v12)
  {
    double v13 = [_MKCompassDirectionImageKey alloc];
    double v14 = [(UIImageView *)self->_assetImageView image];
    [v14 size];
    double v16 = v15;
    double v18 = v17;
    double v19 = [(MKCompassView *)self stringForCompassPoint:v3];
    id v20 = -[_MKCompassDirectionImageKey initWithSize:headingString:compassViewStyle:](v13, "initWithSize:headingString:compassViewStyle:", v19, [(MKCompassView *)self compassViewStyle], v16, v18);

    CGRect v21 = [(MKCompassView *)self traitCollection];
    [v21 displayScale];
    v22 = -[MKCompassView _compassDirectionImageForKey:sizeParams:styleParams:scale:](self, "_compassDirectionImageForKey:sizeParams:styleParams:scale:", v20, v23, v5);
    [(UIImageView *)self->_containerImageView setImage:v22];

    [(MKCompassView *)self invalidateIntrinsicContentSize];
  }
  else
  {
    [(MKCompassView *)self setHidden:1];
  }
}

- (id)_compassDirectionImageForKey:(id)a3 sizeParams:(id)a4 styleParams:(id)a5 scale:(double)a6
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (qword_1EB315B10 != -1) {
    dispatch_once(&qword_1EB315B10, &__block_literal_global_86);
  }
  CGFloat v12 = [(id)_MergedGlobals_3_5 objectForKey:v9];
  if (!v12)
  {
    [v9 size];
    UIGraphicsBeginImageContextWithOptions(v27, 0, a6);
    v24[0] = *MEMORY[0x1E4F42508];
    double v13 = [v10 font];
    v25[0] = v13;
    v24[1] = *MEMORY[0x1E4F42510];
    double v14 = [v11 textColor];
    v25[1] = v14;
    double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

    id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v17 = [v9 headingString];
    double v18 = (void *)[v16 initWithString:v17 attributes:v15];

    [v9 size];
    [v9 size];
    double v19 = [v9 headingString];
    [v19 sizeWithAttributes:v15];

    UIRoundToViewScale();
    double v21 = v20;
    UIRoundToViewScale();
    objc_msgSend(v18, "drawAtPoint:", v21, v22);
    CGFloat v12 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(id)_MergedGlobals_3_5 setObject:v12 forKey:v9];
  }

  return v12;
}

void __75__MKCompassView__compassDirectionImageForKey_sizeParams_styleParams_scale___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_3_5;
  _MergedGlobals_3_5 = v0;
}

- (void)setMapHeading:(double)a3
{
  uint64_t v5 = MKCompassPointNEWSForHeading(a3);
  if (v5 != self->_lastDrawnCompassDirection)
  {
    int v6 = v5;
    [(MKCompassView *)self _updateImageForCompassDirection:v5];
    self->_lastDrawnCompassDirection = v6;
  }
  memset(&v12, 0, sizeof(v12));
  CATransform3DMakeRotation(&v12, a3 * -0.0174532925, 0.0, 0.0, 1.0);
  uint64_t v7 = +[MKThreadContext currentContext];
  objc_msgSend(v7, "_CA_setDisableActions:", 1);

  CATransform3D v11 = v12;
  uint64_t v8 = [(UIImageView *)self->_assetImageView layer];
  CATransform3D v10 = v11;
  [v8 setTransform:&v10];

  id v9 = +[MKThreadContext currentContext];
  objc_msgSend(v9, "_CA_setDisableActions:", 0);
}

- (double)mapHeading
{
  double v2 = [(UIImageView *)self->_assetImageView layer];
  uint64_t v3 = [v2 valueForKeyPath:@"transform.rotation.z"];
  [v3 doubleValue];
  double v5 = v4;

  return v5 * -57.2957795;
}

- (CGSize)intrinsicContentSize
{
  double v2 = objc_msgSend((id)objc_opt_class(), "_parameterForSize:", -[MKCompassView compassViewSize](self, "compassViewSize"));
  [v2 diameter];
  double v4 = v3;

  double v5 = v4;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (id)_parameterForStyle:(int64_t)a3
{
  if (qword_1EB315B40 != -1)
  {
    dispatch_once(&qword_1EB315B40, &__block_literal_global_37_1);
    if (a3) {
      goto LABEL_3;
    }
LABEL_6:
    double v4 = &qword_1EB315B38;
    goto LABEL_7;
  }
  if (!a3) {
    goto LABEL_6;
  }
LABEL_3:
  if (a3 != 1) {
    goto LABEL_8;
  }
  double v4 = &qword_1EB315B30;
LABEL_7:
  a1 = (id)*v4;
LABEL_8:

  return a1;
}

void __36__MKCompassView__parameterForStyle___block_invoke()
{
  uint64_t v0 = objc_alloc_init(_MKCompassViewStyleParameter);
  v1 = (void *)qword_1EB315B30;
  qword_1EB315B30 = (uint64_t)v0;

  [(id)qword_1EB315B30 setImageNamePart:@"Light"];
  double v2 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.639999986];
  [(id)qword_1EB315B30 setTextColor:v2];

  double v3 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
  [(id)qword_1EB315B30 setBackgroundColor:v3];

  double v4 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0500000007];
  [(id)qword_1EB315B30 setBorderColor:v4];

  double v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [(id)qword_1EB315B30 setShadowColor:v5];

  double v6 = objc_alloc_init(_MKCompassViewStyleParameter);
  uint64_t v7 = (void *)qword_1EB315B38;
  qword_1EB315B38 = (uint64_t)v6;

  [(id)qword_1EB315B38 setImageNamePart:@"Dark"];
  uint64_t v8 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.639999986];
  [(id)qword_1EB315B38 setTextColor:v8];

  id v9 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:1.0];
  [(id)qword_1EB315B38 setBackgroundColor:v9];

  CATransform3D v10 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0500000007];
  [(id)qword_1EB315B38 setBorderColor:v10];

  id v11 = [MEMORY[0x1E4F428B8] systemBlackColor];
  [(id)qword_1EB315B38 setShadowColor:v11];
}

- (BOOL)isPointInNorthEastHalf:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MKCompassView *)self center];
  double v7 = v6;
  [(MKCompassView *)self center];
  double v9 = y - v8;
  double v10 = 0.0;
  if (vabdd_f64(y, v8) >= 0.000001) {
    double v10 = atan((x - v7) / -v9);
  }
  if (v9 > 0.0) {
    double v10 = v10 + 3.14159265;
  }
  return v10 < 2.35619449 && v10 >= -0.785398163;
}

- (id)stringForCompassPoint:(int)a3
{
  if (a3) {
    uint64_t v3 = (a3 - 1);
  }
  else {
    uint64_t v3 = 1;
  }
  return [(NSArray *)self->_compassPointLocalizedAbbreviations objectAtIndexedSubscript:v3];
}

- (void)_populateCompassPointLocalizedAbbreviationsArray
{
  v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MKLocalizedAbbreviationForCompassPointNEWS(1);
  v9[0] = v3;
  double v4 = MKLocalizedAbbreviationForCompassPointNEWS(2);
  v9[1] = v4;
  double v5 = MKLocalizedAbbreviationForCompassPointNEWS(3);
  v9[2] = v5;
  double v6 = MKLocalizedAbbreviationForCompassPointNEWS(4);
  v9[3] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  compassPointLocalizedAbbreviations = self->_compassPointLocalizedAbbreviations;
  self->_compassPointLocalizedAbbreviations = v7;
}

- (int64_t)compassViewSize
{
  return self->_compassViewSize;
}

- (int64_t)compassViewStyle
{
  return self->_compassViewStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compassPointLocalizedAbbreviations, 0);
  objc_storeStrong((id *)&self->_assetImageView, 0);

  objc_storeStrong((id *)&self->_containerImageView, 0);
}

@end