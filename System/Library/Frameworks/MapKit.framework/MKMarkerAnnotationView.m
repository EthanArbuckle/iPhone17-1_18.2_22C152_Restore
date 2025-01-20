@interface MKMarkerAnnotationView
+ (Class)_mapkitLeafClass;
+ (float)_defaultDisplayPriority;
- ($6B7908791D228771F6825F21952C9673)_metricsForState:(SEL)a3;
- (BOOL)_hasDataRequiringCallout;
- (BOOL)_shouldDeselectWhenDragged;
- (BOOL)_shouldRenderGradient;
- (BOOL)animatesWhenAdded;
- (BOOL)canShowCallout;
- (BOOL)isProvidingCustomFeature;
- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3;
- (CGPoint)_anchorPointForCalloutAnchorPosition:(int64_t)a3;
- (CGRect)_frameForSelectionAdjustment;
- (CGSize)sizeThatFits:(CGSize)a3;
- (GEOFeatureStyleAttributes)_styleAttributes;
- (MKMarkerAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (MKWalletMerchantStylingInfo)_walletMerchantStylingInfo;
- (NSString)glyphText;
- (UIColor)glyphTintColor;
- (UIColor)markerStrokeTintColor;
- (UIColor)markerTintColor;
- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets;
- (UIImage)glyphImage;
- (UIImage)selectedGlyphImage;
- (UIView)selectedContentView;
- (double)_effectiveMarkerStrokeWidthForState:(int64_t)a3;
- (double)_effectiveShadowAlphaForState:(int64_t)a3;
- (double)markerStrokeWidth;
- (id)_effectiveGlyphImageForState:(int64_t)a3 isSystemProvided:(BOOL *)a4;
- (id)_effectiveGlyphText;
- (id)_effectiveGlyphTintColorForState:(int64_t)a3;
- (id)_effectiveMarkerStrokeTintColorForState:(int64_t)a3;
- (id)_effectiveMarkerTintColorForState:(int64_t)a3;
- (int)_blendMode;
- (int64_t)_currentMarkerState;
- (int64_t)_stateForIsSelected:(BOOL)a3;
- (void)_configureAnimated:(BOOL)a3 fromState:(int64_t)a4 toState:(int64_t)a5;
- (void)_configureViewsForState:(int64_t)a3 usesCallout:(BOOL)a4 animated:(BOOL)a5;
- (void)_didDragWithVelocity:(CGPoint)a3;
- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)_setShadowAlpha:(double)a3 transform:(CGAffineTransform *)a4 duration:(double)a5;
- (void)_setStyleAttributes:(id)a3;
- (void)_setWalletMerchantStylingInfo:(id)a3;
- (void)_setupNormalViewsIfNeeded;
- (void)_setupSelectedViewsIfNeededUsesCallout:(BOOL)a3;
- (void)_swayAnimation;
- (void)_unhideForDisplay;
- (void)_updateContentForState:(int64_t)a3;
- (void)_updateContentForState:(int64_t)a3 forceUpdate:(BOOL)a4;
- (void)_updateFromMap;
- (void)_updateStyle;
- (void)dealloc;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)prepareForSnapshotting;
- (void)setAnimatesWhenAdded:(BOOL)animatesWhenAdded;
- (void)setAnnotation:(id)a3;
- (void)setDragState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setGlyphImage:(UIImage *)glyphImage;
- (void)setGlyphText:(NSString *)glyphText;
- (void)setGlyphTintColor:(UIColor *)glyphTintColor;
- (void)setMarkerStrokeTintColor:(id)a3;
- (void)setMarkerStrokeWidth:(double)a3;
- (void)setMarkerTintColor:(UIColor *)markerTintColor;
- (void)setSelectedContentView:(id)a3;
- (void)setSelectedGlyphImage:(UIImage *)selectedGlyphImage;
- (void)setSubtitleVisibility:(MKFeatureVisibility)subtitleVisibility;
- (void)setTitleVisibility:(MKFeatureVisibility)titleVisibility;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation MKMarkerAnnotationView

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_hasDataRequiringCallout
{
  v3 = [(MKAnnotationView *)self rightCalloutAccessoryView];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(MKAnnotationView *)self leftCalloutAccessoryView];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [(MKAnnotationView *)self detailCalloutAccessoryView];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (BOOL)canShowCallout
{
  v5.receiver = self;
  v5.super_class = (Class)MKMarkerAnnotationView;
  unsigned __int8 v3 = [(MKAnnotationView *)&v5 canShowCallout];
  return v3 & [(MKMarkerAnnotationView *)self _hasDataRequiringCallout];
}

- (void)setMarkerTintColor:(UIColor *)markerTintColor
{
  objc_storeStrong((id *)&self->_markerTintColor, markerTintColor);
  int64_t v4 = [(MKMarkerAnnotationView *)self _currentMarkerState];

  [(MKMarkerAnnotationView *)self _updateContentForState:v4];
}

- (void)_setStyleAttributes:(id)a3
{
  objc_super v5 = (GEOFeatureStyleAttributes *)a3;
  if (self->_customStyleAttributes != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customStyleAttributes, a3);
    [(MKMarkerAnnotationView *)self _updateContentForState:[(MKMarkerAnnotationView *)self _currentMarkerState]];
    objc_super v5 = v6;
  }
}

- (id)_effectiveMarkerTintColorForState:(int64_t)a3
{
  markerTintColor = self->_markerTintColor;
  if (markerTintColor)
  {
    int64_t v4 = markerTintColor;
  }
  else
  {
    v7 = [(MKMarkerAnnotationView *)self traitCollection];
    customStyleAttributes = self->_customStyleAttributes;
    [(MKAnnotationView *)self coordinate];
    v9 = +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v7, a3, customStyleAttributes);
    int64_t v4 = [v9 markerColor];
  }

  return v4;
}

- (double)_effectiveShadowAlphaForState:(int64_t)a3
{
  id v3 = [(MKMarkerAnnotationView *)self _effectiveMarkerTintColorForState:a3];
  double Alpha = CGColorGetAlpha((CGColorRef)[v3 CGColor]);

  return Alpha;
}

- (void)setMarkerStrokeTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_markerStrokeTintColor, a3);
  int64_t v4 = [(MKMarkerAnnotationView *)self _currentMarkerState];

  [(MKMarkerAnnotationView *)self _updateContentForState:v4];
}

- (void)setMarkerStrokeWidth:(double)a3
{
  self->_markerStrokeWidth = a3;
  int64_t v4 = [(MKMarkerAnnotationView *)self _currentMarkerState];

  [(MKMarkerAnnotationView *)self _updateContentForState:v4];
}

- (void)setSelectedContentView:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMarkerAnnotationView *)self selectedContentView];

  if (v5 != v4)
  {
    contentMaskView = self->_contentMaskView;
    if (v4)
    {
      if (contentMaskView)
      {
        v7 = [(UIView *)contentMaskView subviews];
        v8 = [v7 firstObject];
        [v8 removeFromSuperview];
      }
      else
      {
        v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 56.0, 56.0);
        v11 = self->_contentMaskView;
        self->_contentMaskView = v10;

        [(UIView *)self->_contentMaskView _setHostsLayoutEngine:1];
        v12 = [(UIView *)self->_contentMaskView layer];
        objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);

        v13 = [(UIView *)self->_contentMaskView layer];
        [v13 setMasksToBounds:1];

        v14 = [(UIView *)self->_contentMaskView layer];
        [v14 setCornerRadius:28.0];

        if ([(MKAnnotationView *)self isSelected]) {
          double v15 = 1.0;
        }
        else {
          double v15 = 0.5;
        }
        CGAffineTransformMakeScale(&v18, v15, v15);
        v16 = self->_contentMaskView;
        CGAffineTransform v17 = v18;
        [(UIView *)v16 setTransform:&v17];
        [(MKMarkerAnnotationView *)self addSubview:self->_contentMaskView];
        [(UIView *)self _mapkit_setNeedsLayout];
      }
      [(UIView *)self->_contentMaskView bounds];
      objc_msgSend(v4, "setFrame:");
      [(UIView *)self->_contentMaskView addSubview:v4];
    }
    else
    {
      [(UIView *)contentMaskView removeFromSuperview];
      v9 = self->_contentMaskView;
      self->_contentMaskView = 0;
    }
  }
}

- (UIView)selectedContentView
{
  v2 = [(UIView *)self->_contentMaskView subviews];
  id v3 = [v2 firstObject];

  return (UIView *)v3;
}

- (double)_effectiveMarkerStrokeWidthForState:(int64_t)a3
{
  double result = self->_markerStrokeWidth;
  if (result < 0.0)
  {
    v6 = [(MKMarkerAnnotationView *)self traitCollection];
    customStyleAttributes = self->_customStyleAttributes;
    [(MKAnnotationView *)self coordinate];
    v8 = +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v6, a3, customStyleAttributes);
    [v8 strokeWidth];
    double v10 = v9;

    return v10;
  }
  return result;
}

- (id)_effectiveMarkerStrokeTintColorForState:(int64_t)a3
{
  markerStrokeTintColor = self->_markerStrokeTintColor;
  if (markerStrokeTintColor || self->_markerTintColor)
  {
    id v5 = markerStrokeTintColor;
  }
  else
  {
    v8 = [(MKMarkerAnnotationView *)self traitCollection];
    customStyleAttributes = self->_customStyleAttributes;
    [(MKAnnotationView *)self coordinate];
    double v10 = +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v8, a3, customStyleAttributes);
    id v5 = [v10 strokeColor];
  }

  return v5;
}

- (void)setGlyphTintColor:(UIColor *)glyphTintColor
{
  objc_storeStrong((id *)&self->_glyphTintColor, glyphTintColor);
  int64_t v4 = [(MKMarkerAnnotationView *)self _currentMarkerState];

  [(MKMarkerAnnotationView *)self _updateContentForState:v4];
}

- (id)_effectiveGlyphTintColorForState:(int64_t)a3
{
  glyphTintColor = self->_glyphTintColor;
  if (glyphTintColor)
  {
    int64_t v4 = glyphTintColor;
  }
  else if (self->_markerTintColor && _MKLinkedOnOrAfterReleaseSet(2310))
  {
    markerTintColor = self->_markerTintColor;
    v8 = [(MKMarkerAnnotationView *)self traitCollection];
    double v9 = [(UIColor *)markerTintColor resolvedColorWithTraitCollection:v8];

    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F43228]) initWithContentColor:v9];
    int64_t v4 = [v10 primaryColor];
  }
  else
  {
    v11 = [(MKMarkerAnnotationView *)self traitCollection];
    customStyleAttributes = self->_customStyleAttributes;
    [(MKAnnotationView *)self coordinate];
    v13 = +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v11, a3, customStyleAttributes);
    int64_t v4 = [v13 glyphColor];
  }

  return v4;
}

- (void)setGlyphImage:(UIImage *)glyphImage
{
  int64_t v4 = glyphImage;
  id v5 = [(MKAnnotationView *)self annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = [(UIImage *)v4 imageWithRenderingMode:v7];

  double v9 = self->_glyphImage;
  self->_glyphImage = v8;

  int64_t v10 = [(MKMarkerAnnotationView *)self _currentMarkerState];

  [(MKMarkerAnnotationView *)self _updateContentForState:v10];
}

- (void)setSelectedGlyphImage:(UIImage *)selectedGlyphImage
{
  int64_t v4 = selectedGlyphImage;
  id v5 = [(MKAnnotationView *)self annotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = [(UIImage *)v4 imageWithRenderingMode:v7];

  double v9 = self->_selectedGlyphImage;
  self->_selectedGlyphImage = v8;

  int64_t v10 = [(MKMarkerAnnotationView *)self _currentMarkerState];

  [(MKMarkerAnnotationView *)self _updateContentForState:v10];
}

- (id)_effectiveGlyphImageForState:(int64_t)a3 isSystemProvided:(BOOL *)a4
{
  if (a3 && (selectedGlyphImage = self->_selectedGlyphImage) != 0 || (selectedGlyphImage = self->_glyphImage) != 0)
  {
    uint64_t v7 = selectedGlyphImage;
  }
  else
  {
    *a4 = 1;
    v8 = [(MKMarkerAnnotationView *)self traitCollection];
    customStyleAttributes = self->_customStyleAttributes;
    [(MKAnnotationView *)self coordinate];
    int64_t v10 = +[_MKMarkerStyle markerStyleForTraitCollection:state:styleAttributes:coordinate:](_MKMarkerStyle, "markerStyleForTraitCollection:state:styleAttributes:coordinate:", v8, a3, customStyleAttributes);
    uint64_t v7 = [v10 glyphImage];
  }

  return v7;
}

- (void)setGlyphText:(NSString *)glyphText
{
  int64_t v4 = (NSString *)[(NSString *)glyphText copy];
  id v5 = self->_glyphText;
  self->_glyphText = v4;

  int64_t v6 = [(MKMarkerAnnotationView *)self _currentMarkerState];

  [(MKMarkerAnnotationView *)self _updateContentForState:v6];
}

- (id)_effectiveGlyphText
{
  glyphText = self->_glyphText;
  if (glyphText)
  {
    id v3 = glyphText;
  }
  else
  {
    int64_t v4 = [(MKAnnotationView *)self annotation];
    if ([v4 _isMKClusterAnnotation])
    {
      if (qword_1EB315BC0 != -1) {
        dispatch_once(&qword_1EB315BC0, &__block_literal_global_48);
      }
      id v5 = (void *)qword_1EB315BB8;
      int64_t v6 = NSNumber;
      uint64_t v7 = [v4 memberAnnotations];
      v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      id v3 = [v5 stringFromNumber:v8];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

void __45__MKMarkerAnnotationView__effectiveGlyphText__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)qword_1EB315BB8;
  qword_1EB315BB8 = (uint64_t)v0;

  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  [(id)qword_1EB315BB8 setLocale:v2];
}

+ (float)_defaultDisplayPriority
{
  return 250.0;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  if (!_MKLinkedOnOrAfterReleaseSet(1796)) {
    [(MKMarkerAnnotationView *)self prepareForDisplay];
  }
  v5.receiver = self;
  v5.super_class = (Class)MKMarkerAnnotationView;
  [(MKMarkerAnnotationView *)&v5 layoutSublayersOfLayer:v4];
}

- (void)_updateFromMap
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)MKMarkerAnnotationView;
    [(MKAnnotationView *)&v5 _updateFromMap];
    self->super._titleVisibility = 1;
    self->super._subtitleVisibility = 1;
    id v3 = [(MKAnnotationView *)self annotation];
    id v4 = [v3 marker];

    [v4 calloutAnchorPointWithSnapToPixels:1];
    -[MKMarkerAnnotationView setCenter:](self, "setCenter:");
  }
}

- (MKMarkerAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MKMarkerAnnotationView;
  id v4 = [(MKAnnotationView *)&v9 initWithAnnotation:a3 reuseIdentifier:a4];
  objc_super v5 = v4;
  if (v4)
  {
    [(MKAnnotationView *)v4 setCollisionMode:1];
    -[MKAnnotationView setBounds:](v5, "setBounds:", 0.0, 0.0, 28.0, 28.0);
    -[MKAnnotationView setCenterOffset:](v5, "setCenterOffset:", 0.0, -14.0);
    -[MKAnnotationView setCalloutOffset:](v5, "setCalloutOffset:", 0.0, 19.5);
    v5->_markerStrokeWidth = -1.0;
    v5->super._titleVisibility = 0;
    v5->super._subtitleVisibility = 0;
    int64_t v6 = [MEMORY[0x1E4F42F80] systemTraitsAffectingColorAppearance];
    id v7 = (id)[(MKMarkerAnnotationView *)v5 registerForTraitChanges:v6 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v5;
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MKMarkerAnnotationView;
  -[MKMarkerAnnotationView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, 28.0, 28.0);
}

- (void)setAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(MKAnnotationView *)self annotation];
  int64_t v6 = v5;
  if (v5 != v4)
  {
    if (v5)
    {
      self->_isObserving = 0;
      [v5 removeObserver:self forKeyPath:@"title"];
      [v6 removeObserver:self forKeyPath:@"subtitle"];
    }
    v7.receiver = self;
    v7.super_class = (Class)MKMarkerAnnotationView;
    [(MKAnnotationView *)&v7 setAnnotation:v4];
    if (v4)
    {
      self->_isObserving = 1;
      [v4 addObserver:self forKeyPath:@"title" options:0 context:0];
      [v4 addObserver:self forKeyPath:@"subtitle" options:0 context:0];
    }
  }
}

- (void)setTitleVisibility:(MKFeatureVisibility)titleVisibility
{
  if (self->super._titleVisibility != titleVisibility)
  {
    self->super._titleVisibility = titleVisibility;
    [(MKAnnotationView *)self invalidateCustomFeatureForced:0];
  }
}

- (void)setSubtitleVisibility:(MKFeatureVisibility)subtitleVisibility
{
  if (self->super._subtitleVisibility != subtitleVisibility)
  {
    self->super._subtitleVisibility = subtitleVisibility;
    [(MKAnnotationView *)self invalidateCustomFeatureForced:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"title"] & 1) != 0
    || [v10 isEqualToString:@"subtitle"])
  {
    [(MKAnnotationView *)self invalidateCustomFeatureForced:0];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MKMarkerAnnotationView;
    [(MKMarkerAnnotationView *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (CGPoint)_anchorPointForCalloutAnchorPosition:(int64_t)a3
{
  [(MKMarkerAnnotationView *)self _frameForSelectionAdjustment];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(MKMarkerAnnotationView *)self superview];
  -[MKMarkerAnnotationView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  switch(a3)
  {
    case 4:
      v31.origin.x = v15;
      v31.origin.y = v17;
      v31.size.width = v19;
      v31.size.height = v21;
      double MinX = CGRectGetMinX(v31);
LABEL_7:
      CGFloat MidX = MinX;
      v33.origin.x = v15;
      v33.origin.y = v17;
      v33.size.width = v19;
      v33.size.height = v21;
      double MinY = CGRectGetMinY(v33) + 28.0;
      break;
    case 3:
      v32.origin.x = v15;
      v32.origin.y = v17;
      v32.size.width = v19;
      v32.size.height = v21;
      double MinX = CGRectGetMaxX(v32);
      goto LABEL_7;
    case 2:
      v29.origin.x = v15;
      v29.origin.y = v17;
      v29.size.width = v19;
      v29.size.height = v21;
      CGFloat MidX = CGRectGetMidX(v29);
      v30.origin.x = v15;
      v30.origin.y = v17;
      v30.size.width = v19;
      v30.size.height = v21;
      double MinY = CGRectGetMinY(v30);
      break;
    default:
      v27.receiver = self;
      v27.super_class = (Class)MKMarkerAnnotationView;
      [(MKAnnotationView *)&v27 _anchorPointForCalloutAnchorPosition:a3];
      CGFloat MidX = v25;
      break;
  }
  double v26 = MidX;
  result.y = MinY;
  result.x = v26;
  return result;
}

- (CGRect)_frameForSelectionAdjustment
{
  [(MKMarkerAnnotationView *)self frame];
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat v5 = CGRectGetMidX(v10) + -28.0;
  v11.origin.x = v5;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double v6 = CGRectGetMaxY(v11) + -69.0;
  double v7 = 56.0;
  double v8 = 69.0;
  double v9 = v5;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.x = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(MKMarkerAnnotationView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  result.CGFloat height = v6;
  result.CGFloat width = v4;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MKMarkerAnnotationView;
  [(MKAnnotationView *)&v13 layoutSubviews];
  [(MKMarkerAnnotationView *)self bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v15);
  double v9 = [(UIView *)self->_contentMaskView layer];
  objc_msgSend(v9, "setPosition:", MidX, MaxY);

  -[UIImageView setCenter:](self->_shadow, "setCenter:", MidX, MaxY);
  CGRect v10 = [(_MKMarkerAnnotationBaseImageView *)self->_markerView layer];
  objc_msgSend(v10, "setPosition:", MidX, MaxY);

  CGRect v11 = [(_MKMarkerAnnotationBaseImageView *)self->_selectedDotView layer];
  objc_msgSend(v11, "setPosition:", MidX, MaxY);

  double v12 = [(_MKMarkerAnnotationBaseImageView *)self->_selectedMarkerView layer];
  objc_msgSend(v12, "setPosition:", MidX, MaxY + -8.5);
}

- (void)_updateContentForState:(int64_t)a3
{
}

- (void)_updateContentForState:(int64_t)a3 forceUpdate:(BOOL)a4
{
  if (a4
    || ([(MKMarkerAnnotationView *)self window],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    double v7 = [(MKMarkerAnnotationView *)self _effectiveMarkerTintColorForState:a3];
    double v8 = [(MKMarkerAnnotationView *)self _effectiveMarkerStrokeTintColorForState:a3];
    double v9 = [(MKMarkerAnnotationView *)self _effectiveGlyphTintColorForState:a3];
    [(MKMarkerAnnotationView *)self _effectiveMarkerStrokeWidthForState:a3];
    double v11 = v10;
    double v12 = [(MKMarkerAnnotationView *)self _effectiveGlyphText];
    if (!v8) {
      double v11 = 0.0;
    }
    if (a3)
    {
      CGRect v29 = v9;
      selectedMarkerView = self->_selectedMarkerView;
      CGRect v14 = [_MKMarkerAnnotationBaseImageContent alloc];
      uint64_t v15 = [(MKMarkerAnnotationView *)self _blendMode];
      if ([(MKMarkerAnnotationView *)self _shouldRenderGradient]) {
        uint64_t v16 = 5;
      }
      else {
        uint64_t v16 = 4;
      }
      CGFloat v17 = -[_MKMarkerAnnotationBaseImageContent initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:](v14, "initWithFillColor:strokeColor:strokeWidth:blendMode:baseImageType:", v7, v8, v15, v16, v11, v29);
      [(_MKMarkerAnnotationBaseImageView *)selectedMarkerView _setBaseImageContent:v17];

      selectedDotView = self->_selectedDotView;
      CGFloat v19 = [[_MKMarkerAnnotationBaseImageContent alloc] initWithFillColor:v7 strokeColor:v8 strokeWidth:[(MKMarkerAnnotationView *)self _blendMode] blendMode:[(MKMarkerAnnotationView *)self _shouldRenderGradient] baseImageType:v11];
      [(_MKMarkerAnnotationBaseImageView *)selectedDotView _setBaseImageContent:v19];

      if (v12)
      {
        [(_MKUILabel *)self->_selectedGlyphLabel setHidden:0];
        double v9 = v30;
        [(_MKUILabel *)self->_selectedGlyphLabel setTextColor:v30];
        [(_MKUILabel *)self->_selectedGlyphLabel setText:v12];
        [(UIImageView *)self->_selectedGlyphImageView setHidden:1];
        [(UIImageView *)self->_selectedGlyphImageView setImage:0];
      }
      else
      {
        [(UIImageView *)self->_selectedGlyphImageView setHidden:0];
        double v9 = v30;
        [(UIImageView *)self->_selectedGlyphImageView setTintColor:v30];
        char v31 = 0;
        double v25 = [(MKMarkerAnnotationView *)self _effectiveGlyphImageForState:a3 isSystemProvided:&v31];
        [(UIImageView *)self->_selectedGlyphImageView setImage:v25];

        if (v31) {
          uint64_t v26 = 4;
        }
        else {
          uint64_t v26 = 1;
        }
        [(UIImageView *)self->_selectedGlyphImageView setContentMode:v26];
        [(_MKUILabel *)self->_selectedGlyphLabel setHidden:1];
        [(_MKUILabel *)self->_selectedGlyphLabel setText:0];
      }
    }
    else
    {
      markerView = self->_markerView;
      CGFloat v21 = [_MKMarkerAnnotationBaseImageContent alloc];
      uint64_t v22 = [(MKMarkerAnnotationView *)self _blendMode];
      if ([(MKMarkerAnnotationView *)self _shouldRenderGradient]) {
        uint64_t v23 = 3;
      }
      else {
        uint64_t v23 = 2;
      }
      v24 = [(_MKMarkerAnnotationBaseImageContent *)v21 initWithFillColor:v7 strokeColor:v8 strokeWidth:v22 blendMode:v23 baseImageType:v11];
      [(_MKMarkerAnnotationBaseImageView *)markerView _setBaseImageContent:v24];

      if (v12)
      {
        [(_MKUILabel *)self->_glyphLabel setHidden:0];
        [(_MKUILabel *)self->_glyphLabel setTextColor:v9];
        [(_MKUILabel *)self->_glyphLabel setText:v12];
        [(UIImageView *)self->_glyphImageView setHidden:1];
        [(UIImageView *)self->_glyphImageView setImage:0];
      }
      else
      {
        [(UIImageView *)self->_glyphImageView setHidden:0];
        [(UIImageView *)self->_glyphImageView setTintColor:v9];
        char v32 = 0;
        objc_super v27 = [(MKMarkerAnnotationView *)self _effectiveGlyphImageForState:0 isSystemProvided:&v32];
        [(UIImageView *)self->_glyphImageView setImage:v27];

        if (v32) {
          uint64_t v28 = 4;
        }
        else {
          uint64_t v28 = 1;
        }
        [(UIImageView *)self->_glyphImageView setContentMode:v28];
        [(_MKUILabel *)self->_glyphLabel setHidden:1];
        [(_MKUILabel *)self->_glyphLabel setText:0];
      }
    }
  }
}

- (int64_t)_currentMarkerState
{
  if (![(MKAnnotationView *)self isSelected]) {
    return 0;
  }
  if ([(MKAnnotationView *)self dragState]) {
    return 2;
  }
  return 1;
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)MKMarkerAnnotationView;
  [(MKAnnotationView *)&v10 prepareForReuse];
  customStyleAttributes = self->_customStyleAttributes;
  self->_customStyleAttributes = 0;

  markerTintColor = self->_markerTintColor;
  self->_markerTintColor = 0;

  markerStrokeTintColor = self->_markerStrokeTintColor;
  self->_markerStrokeTintColor = 0;

  self->_markerStrokeWidth = 0.0;
  glyphImage = self->_glyphImage;
  self->_glyphImage = 0;

  selectedGlyphImage = self->_selectedGlyphImage;
  self->_selectedGlyphImage = 0;

  glyphText = self->_glyphText;
  self->_glyphText = 0;

  glyphTintColor = self->_glyphTintColor;
  self->_glyphTintColor = 0;

  [(MKMarkerAnnotationView *)self setSelectedContentView:0];
}

- (void)prepareForDisplay
{
  v5.receiver = self;
  v5.super_class = (Class)MKMarkerAnnotationView;
  [(MKAnnotationView *)&v5 prepareForDisplay];
  [(MKMarkerAnnotationView *)self _setupNormalViewsIfNeeded];
  BOOL v3 = [(MKAnnotationView *)self _shouldShowCalloutIfSelected];
  if ([(MKAnnotationView *)self isSelected]) {
    [(MKMarkerAnnotationView *)self _setupSelectedViewsIfNeededUsesCallout:v3];
  }
  int64_t v4 = [(MKMarkerAnnotationView *)self _currentMarkerState];
  [(MKMarkerAnnotationView *)self _configureViewsForState:v4 usesCallout:v3 animated:0];
  [(MKMarkerAnnotationView *)self _updateContentForState:v4 forceUpdate:1];
}

- (void)_unhideForDisplay
{
  if (self->_animatesWhenAdded)
  {
    [(MKAnnotationView *)self _setHidden:0 forReason:1 animated:1];
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v7.c = v3;
    *(_OWORD *)&v7.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v9.a = *(_OWORD *)&v7.a;
    *(_OWORD *)&v9.c = v3;
    *(_OWORD *)&v9.tCGFloat x = *(_OWORD *)&v7.tx;
    CGAffineTransformTranslate(&v7, &v9, 0.0, 56.0);
    CGAffineTransform v8 = v7;
    CGAffineTransformScale(&v9, &v8, 0.25, 0.25);
    CGAffineTransform v7 = v9;
    CGAffineTransform v6 = v9;
    [(MKMarkerAnnotationView *)self setTransform:&v6];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__MKMarkerAnnotationView__unhideForDisplay__block_invoke;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v5 usingSpringWithDamping:0 initialSpringVelocity:0.4 options:0.0 animations:0.666666687 completion:0.0];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MKMarkerAnnotationView;
    [(MKAnnotationView *)&v4 _unhideForDisplay];
  }
}

uint64_t __43__MKMarkerAnnotationView__unhideForDisplay__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)prepareForSnapshotting
{
  v3.receiver = self;
  v3.super_class = (Class)MKMarkerAnnotationView;
  [(MKAnnotationView *)&v3 prepareForSnapshotting];
  -[MKAnnotationView _updateAnchorPosition:alignToPixels:](self, "_updateAnchorPosition:alignToPixels:", 1, 0.0, 0.0);
  [(UIView *)self _mapkit_setNeedsLayout];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  CGAffineTransform v6 = [(MKMarkerAnnotationView *)self traitCollection];
  int v7 = [v6 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v7)
  {
    [(MKMarkerAnnotationView *)self _updateStyle];
  }
}

- (void)_updateStyle
{
  int64_t v3 = [(MKMarkerAnnotationView *)self _currentMarkerState];

  [(MKMarkerAnnotationView *)self _updateContentForState:v3];
}

- ($6B7908791D228771F6825F21952C9673)_metricsForState:(SEL)a3
{
  [(_MKMarkerAnnotationBaseImageView *)self->_markerView bounds];
  double v8 = v7;
  double v10 = v9;
  CGSize result = ($6B7908791D228771F6825F21952C9673 *)[(_MKMarkerAnnotationBaseImageView *)self->_selectedMarkerView bounds];
  if (a4)
  {
    double v14 = v12 / v8;
    double v15 = 1.0;
    __asm { FMOV            V1.2D, #1.0 }
    CGFloat v21 = -8.5;
    CGFloat v22 = 0.0;
    double v23 = 1.0;
    double v24 = v13 / v10;
  }
  else
  {
    double v15 = v8 / v12;
    _Q1 = xmmword_18BD1ADE0;
    double v14 = 1.0;
    CGFloat v21 = 0.0;
    CGFloat v22 = 7.5;
    double v24 = 1.0;
    double v23 = v10 / v13;
  }
  retstr->var0.CGFloat width = v14;
  retstr->var0.CGFloat height = v24;
  retstr->var1.CGFloat width = v15;
  retstr->var1.CGFloat height = v23;
  *(_OWORD *)&retstr->var2 = _Q1;
  retstr->var4.CGFloat width = 0.0;
  retstr->var4.CGFloat height = v21;
  retstr->var5.CGFloat width = 0.0;
  retstr->var5.CGFloat height = v22;
  double v25 = 0.0;
  if (a4 == 2) {
    double v25 = -20.0;
  }
  retstr->var6.CGFloat width = 0.0;
  retstr->var6.CGFloat height = v25;
  return result;
}

- (void)_configureViewsForState:(int64_t)a3 usesCallout:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v54[1] = *MEMORY[0x1E4F143B8];
  *(_OWORD *)tCGFloat x = 0u;
  *(_OWORD *)v48 = 0u;
  if (a3) {
    LODWORD(v8) = a4;
  }
  else {
    LODWORD(v8) = 0;
  }
  *(_OWORD *)sCGFloat x = 0uLL;
  *(_OWORD *)tCGFloat y = 0uLL;
  long long v43 = 0uLL;
  long long v44 = 0uLL;
  -[MKMarkerAnnotationView _metricsForState:](self, "_metricsForState:");
  if (v5) {
    double v9 = 0.5;
  }
  else {
    double v9 = 0.0;
  }
  if (v8 != 1)
  {
    if (a3)
    {
      double v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_selectedDotView, self->_selectedMarkerView, 0);
      markerView = self->_markerView;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&markerView count:1];
    }
    else
    {
      v52 = self->_markerView;
      double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_selectedDotView, self->_selectedMarkerView, 0);
    double v11 = };
    if (!v5) {
      goto LABEL_9;
    }
LABEL_21:
    if (a3) {
      double v18 = 0.0;
    }
    else {
      double v18 = 0.0833333333;
    }
    double v19 = dbl_18BD1ADF0[a3 != 0];
    _setAlphaForViews(v10, 1, 1.0, 0.0833333333, v18);
    _setAlphaForViews(v11, 1, 0.0, 0.0833333333, v19);
    goto LABEL_25;
  }
  v54[0] = self->_selectedDotView;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  double v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_markerView, self->_selectedMarkerView, 0);
  if (v5) {
    goto LABEL_21;
  }
LABEL_9:
  char v30 = (char)v8;
  double v8 = v10;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  double v12 = v11;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        [(UIView *)self _mapkit_bringSubviewToFront:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v15);
  }

  double v10 = v8;
  _setAlphaForViews(v8, 0, 1.0, 0.0, 0.0);
  _setAlphaForViews(v13, 0, 0.0, 0.0, 0.0);
  double v11 = v12;
  LOBYTE(v8) = v30;
LABEL_25:
  CGFloat v21 = *((double *)&v43 + 1);
  CGFloat v20 = *(double *)&v43;
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v31 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v38.a = v31;
  *(_OWORD *)&v38.c = v29;
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v38.tCGFloat x = v28;
  *(_OWORD *)&v50.a = v31;
  *(_OWORD *)&v50.c = v29;
  *(_OWORD *)&v50.tCGFloat x = v28;
  CGAffineTransformTranslate(&v38, &v50, ty[0], ty[1]);
  CGAffineTransform v49 = v38;
  CGAffineTransformScale(&v50, &v49, v20, v21);
  CGAffineTransform v38 = v50;
  _setViewTransform(self->_markerView, &v50, v9);
  CGFloat v22 = sx[0];
  *(_OWORD *)&v37.a = v31;
  *(_OWORD *)&v37.c = v29;
  *(_OWORD *)&v37.tCGFloat x = v28;
  *(_OWORD *)&v50.a = v31;
  *(_OWORD *)&v50.c = v29;
  *(_OWORD *)&v50.tCGFloat x = v28;
  double v23 = 0.0;
  CGAffineTransformTranslate(&v37, &v50, 0.0, 0.0);
  CGAffineTransform v49 = v37;
  CGAffineTransformScale(&v50, &v49, v22, v22);
  CGAffineTransform v37 = v50;
  _setViewTransform(self->_selectedDotView, &v50, v9);
  long long v24 = v44;
  *(_OWORD *)&v36.a = v31;
  *(_OWORD *)&v36.c = v29;
  *(_OWORD *)&v36.tCGFloat x = v28;
  *(_OWORD *)&v50.a = v31;
  *(_OWORD *)&v50.c = v29;
  *(_OWORD *)&v50.tCGFloat x = v28;
  CGAffineTransformTranslate(&v36, &v50, tx[0], tx[1]);
  CGAffineTransform v49 = v36;
  CGAffineTransformScale(&v50, &v49, *(CGFloat *)&v24, *((CGFloat *)&v24 + 1));
  CGAffineTransform v36 = v50;
  _setViewTransform(self->_selectedMarkerView, &v50, v9);
  if ((v8 & 1) == 0)
  {
    [(MKMarkerAnnotationView *)self _effectiveShadowAlphaForState:a3];
    double v23 = v25;
  }
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeScale(&v35, sx[1], sx[1]);
  if (a3 == 2)
  {
    CGAffineTransform v49 = v35;
    CGAffineTransformTranslate(&v50, &v49, 0.0, 20.0);
    CGAffineTransform v35 = v50;
  }
  CGAffineTransform v50 = v35;
  [(MKMarkerAnnotationView *)self _setShadowAlpha:&v50 transform:v23 duration:v9];
  contentMaskView = self->_contentMaskView;
  if (contentMaskView)
  {
    CGAffineTransformMakeScale(&v34, sx[1], sx[1]);
    CGAffineTransform v33 = v34;
    [(UIView *)contentMaskView setTransform:&v33];
    [(UIView *)self _mapkit_bringSubviewToFront:self->_contentMaskView];
  }
  BOOL v27 = contentMaskView != 0;
  [(UIImageView *)self->_selectedGlyphImageView setHidden:v27];
  [(_MKUILabel *)self->_selectedGlyphLabel setHidden:v27];
  *(_OWORD *)&v32.a = v31;
  *(_OWORD *)&v32.c = v29;
  *(_OWORD *)&v32.tCGFloat x = v28;
  *(_OWORD *)&v50.a = v31;
  *(_OWORD *)&v50.c = v29;
  *(_OWORD *)&v50.tCGFloat x = v28;
  CGAffineTransformTranslate(&v32, &v50, v48[0], v48[1]);
  CGAffineTransform v49 = v32;
  CGAffineTransformScale(&v50, &v49, 1.0, 1.0);
  CGAffineTransform v32 = v50;
  _setViewTransform(self, &v50, v9);
}

- (void)_setShadowAlpha:(double)a3 transform:(CGAffineTransform *)a4 duration:(double)a5
{
  if (a5 <= 0.0)
  {
    long long v9 = *(_OWORD *)&a4->c;
    v11[0] = *(_OWORD *)&a4->a;
    v11[1] = v9;
    v11[2] = *(_OWORD *)&a4->tx;
    [(UIImageView *)self->_shadow setTransform:v11];
    float v10 = a3;
    [(UIImageView *)self->_shadow setAlpha:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    long long v8 = *(_OWORD *)&a4->c;
    long long v13 = *(_OWORD *)&a4->a;
    v12[2] = __61__MKMarkerAnnotationView__setShadowAlpha_transform_duration___block_invoke;
    v12[3] = &unk_1E54B8D38;
    v12[4] = self;
    long long v14 = v8;
    long long v15 = *(_OWORD *)&a4->tx;
    double v16 = a3;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v12 usingSpringWithDamping:0 initialSpringVelocity:a5 options:0.0 animations:0.666666687 completion:0.0];
  }
}

uint64_t __61__MKMarkerAnnotationView__setShadowAlpha_transform_duration___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(*(void *)(a1 + 32) + 1024);
  long long v3 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v3;
  v6[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v6];
  float v4 = *(double *)(a1 + 88);
  return [*(id *)(*(void *)(a1 + 32) + 1024) setAlpha:v4];
}

- (int64_t)_stateForIsSelected:(BOOL)a3
{
  return a3;
}

- (void)_didDragWithVelocity:(CGPoint)a3
{
  long long v4 = *MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v17.c = v5;
  *(_OWORD *)&v17.tCGFloat x = v6;
  double v7 = a3.x / 1000.0;
  double v8 = 1.0;
  BOOL v9 = v7 <= -1.0 || v7 > 1.0;
  if (v7 <= -1.0 || v7 <= 1.0) {
    double v8 = -1.0;
  }
  if (v9) {
    double v10 = v8;
  }
  else {
    double v10 = v7;
  }
  *(_OWORD *)&v16.a = v4;
  *(_OWORD *)&v16.c = v5;
  *(_OWORD *)&v16.tCGFloat x = v6;
  *(_OWORD *)&v17.a = v4;
  CGAffineTransformRotate(&v17, &v16, -v10);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, 0.0, 10.0);
  CGAffineTransform v14 = v16;
  CGAffineTransformRotate(&v15, &v14, v10 * -0.5);
  CGAffineTransform v16 = v15;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__MKMarkerAnnotationView__didDragWithVelocity___block_invoke;
  _OWORD v11[3] = &unk_1E54B8D60;
  v11[4] = self;
  CGAffineTransform v12 = v17;
  CGAffineTransform v13 = v15;
  [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v11 options:0 animations:0.2 completion:0.0];
}

uint64_t __47__MKMarkerAnnotationView__didDragWithVelocity___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(*(void *)(a1 + 32) + 1048);
  long long v3 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v3;
  v8[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v8];
  long long v4 = *(void **)(*(void *)(a1 + 32) + 1024);
  long long v5 = *(_OWORD *)(a1 + 104);
  v7[0] = *(_OWORD *)(a1 + 88);
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 120);
  return [v4 setTransform:v7];
}

- (void)_setupNormalViewsIfNeeded
{
  if (!self->_shadow)
  {
    if (qword_1EB315BD0 != -1) {
      dispatch_once(&qword_1EB315BD0, &__block_literal_global_87);
    }
    id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
    long long v4 = (UIImageView *)[v3 initWithImage:qword_1EB315BC8];
    shadow = self->_shadow;
    self->_shadow = v4;

    [(id)qword_1EB315BC8 size];
    double v7 = -11.0 / v6 + 1.0;
    double v8 = [(UIImageView *)self->_shadow layer];
    objc_msgSend(v8, "setAnchorPoint:", 0.5, v7);

    CGAffineTransformMakeScale(&v23, 0.5, 0.5);
    BOOL v9 = self->_shadow;
    CGAffineTransform v22 = v23;
    [(UIImageView *)v9 setTransform:&v22];
    [(MKMarkerAnnotationView *)self addSubview:self->_shadow];
    double v10 = [[_MKMarkerAnnotationBaseImageView alloc] initWithBalloonRadius:14.0 tailLength:5.0];
    markerView = self->_markerView;
    self->_markerView = v10;

    CGAffineTransform v12 = [(_MKMarkerAnnotationBaseImageView *)self->_markerView layer];
    objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);

    CGAffineTransform v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", 4.0, 4.0, 20.0, 20.0);
    glyphImageView = self->_glyphImageView;
    self->_glyphImageView = v13;

    [(UIImageView *)self->_glyphImageView setContentMode:1];
    CGAffineTransform v15 = -[_MKUILabel initWithFrame:]([_MKUILabel alloc], "initWithFrame:", 4.0, 4.0, 20.0, 20.0);
    glyphLabel = self->_glyphLabel;
    self->_glyphLabel = v15;

    [(_MKUILabel *)self->_glyphLabel setTextAlignment:1];
    [(_MKUILabel *)self->_glyphLabel setAdjustsFontSizeToFitWidth:1];
    [(_MKUILabel *)self->_glyphLabel setBaselineAdjustment:1];
    CGAffineTransform v17 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:16.0];
    [(_MKUILabel *)self->_glyphLabel setFont:v17];

    [(_MKMarkerAnnotationBaseImageView *)self->_markerView addSubview:self->_glyphImageView];
    [(_MKMarkerAnnotationBaseImageView *)self->_markerView addSubview:self->_glyphLabel];
    contentMaskView = self->_contentMaskView;
    if (contentMaskView)
    {
      [(UIView *)contentMaskView bounds];
      double v20 = 5.0 / v19 + 1.0;
      CGFloat v21 = [(UIView *)self->_contentMaskView layer];
      objc_msgSend(v21, "setAnchorPoint:", 0.5, v20);
    }
    [(MKMarkerAnnotationView *)self addSubview:self->_markerView];
  }
}

void __51__MKMarkerAnnotationView__setupNormalViewsIfNeeded__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"balloon_shadow");
  v1 = (void *)qword_1EB315BC8;
  qword_1EB315BC8 = v0;
}

- (void)_setupSelectedViewsIfNeededUsesCallout:(BOOL)a3
{
  selectedDotView = self->_selectedDotView;
  BOOL v6 = selectedDotView == 0;
  if (selectedDotView)
  {
    if (a3) {
      goto LABEL_7;
    }
  }
  else
  {
    double v7 = -[_MKMarkerAnnotationBaseImageView initWithOvalInSize:]([_MKMarkerAnnotationBaseImageView alloc], "initWithOvalInSize:", 7.0, 7.0);
    double v8 = self->_selectedDotView;
    self->_selectedDotView = v7;

    BOOL v9 = [(_MKMarkerAnnotationBaseImageView *)self->_selectedDotView layer];
    [v9 setCornerRadius:3.0];

    double v10 = [(_MKMarkerAnnotationBaseImageView *)self->_selectedDotView layer];
    objc_msgSend(v10, "setAnchorPoint:", 0.5, 1.0);

    [(MKMarkerAnnotationView *)self addSubview:self->_selectedDotView];
    if (a3) {
      goto LABEL_7;
    }
  }
  if (!self->_selectedMarkerView)
  {
    double v11 = [[_MKMarkerAnnotationBaseImageView alloc] initWithBalloonRadius:28.0 tailLength:6.0];
    selectedMarkerView = self->_selectedMarkerView;
    self->_selectedMarkerView = v11;

    CGAffineTransform v13 = [(_MKMarkerAnnotationBaseImageView *)self->_selectedMarkerView layer];
    objc_msgSend(v13, "setAnchorPoint:", 0.5, 1.0);

    CGAffineTransform v14 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", 8.0, 8.0, 40.0, 40.0);
    selectedGlyphImageView = self->_selectedGlyphImageView;
    self->_selectedGlyphImageView = v14;

    BOOL v6 = 1;
    [(UIImageView *)self->_selectedGlyphImageView setContentMode:1];
    CGAffineTransform v16 = -[_MKUILabel initWithFrame:]([_MKUILabel alloc], "initWithFrame:", 8.0, 8.0, 40.0, 40.0);
    selectedGlyphLabel = self->_selectedGlyphLabel;
    self->_selectedGlyphLabel = v16;

    [(_MKUILabel *)self->_selectedGlyphLabel setTextAlignment:1];
    [(_MKUILabel *)self->_selectedGlyphLabel setAdjustsFontSizeToFitWidth:1];
    [(_MKUILabel *)self->_selectedGlyphLabel setBaselineAdjustment:1];
    double v18 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:32.0];
    [(_MKUILabel *)self->_selectedGlyphLabel setFont:v18];

    [(_MKMarkerAnnotationBaseImageView *)self->_selectedMarkerView addSubview:self->_selectedGlyphImageView];
    [(_MKMarkerAnnotationBaseImageView *)self->_selectedMarkerView addSubview:self->_selectedGlyphLabel];
    [(MKMarkerAnnotationView *)self addSubview:self->_selectedMarkerView];
  }
LABEL_7:
  contentMaskView = self->_contentMaskView;
  if (contentMaskView)
  {
    [(UIView *)contentMaskView bounds];
    double v21 = 14.5 / v20 + 1.0;
    CGAffineTransform v22 = [(UIView *)self->_contentMaskView layer];
    objc_msgSend(v22, "setAnchorPoint:", 0.5, v21);
  }
  if (v6)
  {
    [(MKMarkerAnnotationView *)self _updateContentForState:1 forceUpdate:1];
    [(UIView *)self _mapkit_setNeedsLayout];
  }
}

- (void)_configureAnimated:(BOOL)a3 fromState:(int64_t)a4 toState:(int64_t)a5
{
  BOOL v7 = a3;
  BOOL v9 = [(MKAnnotationView *)self _shouldShowCalloutIfSelected];
  [(MKMarkerAnnotationView *)self _setupNormalViewsIfNeeded];
  if (v7)
  {
    [(MKMarkerAnnotationView *)self _updateContentForState:a4];
    [(MKMarkerAnnotationView *)self _setupSelectedViewsIfNeededUsesCallout:v9];
    [(MKMarkerAnnotationView *)self _updateContentForState:a5];
    [(MKMarkerAnnotationView *)self _configureViewsForState:a4 usesCallout:v9 animated:0];
  }
  else
  {
    [(MKMarkerAnnotationView *)self _setupSelectedViewsIfNeededUsesCallout:v9];
    [(MKMarkerAnnotationView *)self _updateContentForState:a5];
  }
  [(MKMarkerAnnotationView *)self _configureViewsForState:a5 usesCallout:v9 animated:v7];
  [(MKAnnotationView *)self _updateEffectiveZPriority];
  char v11 = a5 != 1 || (unint64_t)(a4 - 1) < 2 || v9;
  if ((v11 & 1) == 0 && v7 && _MKMarkerAnnotationViewSelectionShouldSway())
  {
    [(MKMarkerAnnotationView *)self _swayAnimation];
  }
}

- (void)setDragState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(MKAnnotationView *)self dragState] != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)MKMarkerAnnotationView;
    [(MKAnnotationView *)&v9 setDragState:a3 animated:v4];
    if (a3 == 1)
    {
      int64_t v7 = 2;
      [(MKMarkerAnnotationView *)self setDragState:2 animated:v4];
      int64_t v8 = [(MKMarkerAnnotationView *)self _stateForIsSelected:[(MKAnnotationView *)self isSelected]];
    }
    else
    {
      if (a3 - 3 > 1) {
        return;
      }
      if (!_MKLinkedOnOrAfterReleaseSet(2053) || _MKLinkedOnOrAfterReleaseSet(2310)) {
        [(MKMarkerAnnotationView *)self setDragState:0 animated:v4];
      }
      int64_t v7 = [(MKMarkerAnnotationView *)self _stateForIsSelected:[(MKAnnotationView *)self isSelected]];
      int64_t v8 = 2;
    }
    [(MKMarkerAnnotationView *)self _configureAnimated:1 fromState:v8 toState:v7];
    [(MKAnnotationView *)self invalidateCustomFeatureForced:a3 != 1];
  }
}

- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(MKAnnotationView *)self isSelected];
  v8.receiver = self;
  v8.super_class = (Class)MKMarkerAnnotationView;
  [(MKAnnotationView *)&v8 _setSelected:v5 animated:v4];
  if (v7 != v5)
  {
    [(MKMarkerAnnotationView *)self _configureAnimated:v4 fromState:[(MKMarkerAnnotationView *)self _stateForIsSelected:v5 ^ 1] toState:[(MKMarkerAnnotationView *)self _stateForIsSelected:v5]];
    [(MKAnnotationView *)self invalidateCustomFeatureForced:0];
  }
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MKAnnotationView *)self isSelected]) {
    [(MKMarkerAnnotationView *)self _configureAnimated:v3 fromState:1 toState:1];
  }
  v6.receiver = self;
  v6.super_class = (Class)MKMarkerAnnotationView;
  return [(MKAnnotationView *)&v6 updateCalloutViewIfNeededAnimated:v3];
}

- (void)dealloc
{
  if (self->_isObserving)
  {
    BOOL v3 = [(MKAnnotationView *)self annotation];
    [v3 removeObserver:self forKeyPath:@"title"];
    [v3 removeObserver:self forKeyPath:@"subtitle"];
    self->_isObserving = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MKMarkerAnnotationView;
  [(MKAnnotationView *)&v4 dealloc];
}

- (void)_swayAnimation
{
  _MKMarkerAnnotationViewSelectionSwayAnimation();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [(_MKMarkerAnnotationBaseImageView *)self->_selectedMarkerView layer];
  [v3 addAnimation:v4 forKey:@"rotate"];
}

- (BOOL)_shouldRenderGradient
{
  BOOL v3 = [MEMORY[0x1E4F64860] sharedPlatform];
  if ([v3 supportsAdvancedMap])
  {
    id v4 = [(MKMarkerAnnotationView *)self traitCollection];
    BOOL v5 = [v4 userInterfaceIdiom] != 3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int)_blendMode
{
  if (self->_customStyleAttributes) {
    return 3;
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldDeselectWhenDragged
{
  return 0;
}

- (BOOL)isProvidingCustomFeature
{
  if ([(MKAnnotationView *)self dragState]) {
    return 0;
  }
  else {
    return ![(MKAnnotationView *)self isHidden];
  }
}

- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets
{
  double v2 = -0.0;
  double v3 = -10.0;
  double v4 = -5.0;
  double v5 = -5.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  return self->_customStyleAttributes;
}

- (UIColor)markerTintColor
{
  return self->_markerTintColor;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (NSString)glyphText
{
  return self->_glyphText;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (UIImage)selectedGlyphImage
{
  return self->_selectedGlyphImage;
}

- (BOOL)animatesWhenAdded
{
  return self->_animatesWhenAdded;
}

- (void)setAnimatesWhenAdded:(BOOL)animatesWhenAdded
{
  self->_animatesWhenAdded = animatesWhenAdded;
}

- (UIColor)markerStrokeTintColor
{
  return self->_markerStrokeTintColor;
}

- (double)markerStrokeWidth
{
  return self->_markerStrokeWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerStrokeTintColor, 0);
  objc_storeStrong((id *)&self->_selectedGlyphImage, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphText, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_markerTintColor, 0);
  objc_storeStrong((id *)&self->_walletMerchantStylingInfo, 0);
  objc_storeStrong((id *)&self->_customStyleAttributes, 0);
  objc_storeStrong((id *)&self->_contentMaskView, 0);
  objc_storeStrong((id *)&self->_selectedGlyphLabel, 0);
  objc_storeStrong((id *)&self->_selectedGlyphImageView, 0);
  objc_storeStrong((id *)&self->_glyphLabel, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_selectedMarkerView, 0);
  objc_storeStrong((id *)&self->_selectedDotView, 0);
  objc_storeStrong((id *)&self->_markerView, 0);

  objc_storeStrong((id *)&self->_shadow, 0);
}

- (MKWalletMerchantStylingInfo)_walletMerchantStylingInfo
{
  return self->_walletMerchantStylingInfo;
}

- (void)_setWalletMerchantStylingInfo:(id)a3
{
  objc_super v6 = (MKWalletMerchantStylingInfo *)a3;
  if (self->_walletMerchantStylingInfo != v6)
  {
    objc_storeStrong((id *)&self->_walletMerchantStylingInfo, a3);
    double v5 = [(MKWalletMerchantStylingInfo *)v6 _featureStyleAttributes];
    [(MKMarkerAnnotationView *)self _setStyleAttributes:v5];
  }
}

@end