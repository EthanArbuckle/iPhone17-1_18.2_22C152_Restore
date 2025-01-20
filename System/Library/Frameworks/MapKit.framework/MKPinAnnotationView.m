@interface MKPinAnnotationView
+ (CGPoint)_calloutOffset;
+ (CGPoint)_leftCalloutOffset;
+ (CGPoint)_perceivedAnchorPoint;
+ (CGPoint)_rightCalloutOffset;
+ (CGPoint)_shadowAnchorPoint;
+ (CGRect)_pinFrameForPosition:(CGPoint)a3;
+ (CGSize)_perceivedSize;
+ (Class)_mapkitLeafClass;
+ (Class)layerClass;
+ (UIColor)greenPinColor;
+ (UIColor)purplePinColor;
+ (UIColor)redPinColor;
+ (id)_bounceAnimation;
+ (id)_dropBounceAnimation;
+ (id)_imageCache;
+ (id)_imageForLayer:(int64_t)a3 state:(int64_t)a4 mapType:(unint64_t)a5 traits:(id)a6;
+ (id)_imageForState:(int64_t)a3 mapType:(unint64_t)a4 pinColor:(id)a5 traits:(id)a6;
+ (id)_pinsWithMapType:(unint64_t)a3 pinColor:(id)a4 traits:(id)a5;
+ (id)_reuseIdentifier;
+ (id)_shadowImage;
- (BOOL)animatesDrop;
- (BOOL)isHighlighted;
- (CGPoint)_draggingDropOffset;
- (CGRect)_significantBounds;
- (MKPinAnnotationColor)pinColor;
- (MKPinAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (UIColor)pinTintColor;
- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets;
- (_MKPinAnnotationViewDelegate)_delegate;
- (id)_bounceAnimation:(BOOL)a3 withDelay:(double)a4 addToLayer:(BOOL)a5;
- (id)_floatingImage;
- (id)_highlightedImage;
- (id)_image;
- (id)_pinBounceImages;
- (id)_pinJumpImages;
- (id)_pins;
- (id)description;
- (int)_state;
- (void)_cleanupAfterPinDropAnimation;
- (void)_didUpdatePosition;
- (void)_dropAfterDraggingAndRevertPosition:(BOOL)a3 animated:(BOOL)a4;
- (void)_dropFromDistance:(double)a3 maxDistance:(double)a4 withDelay:(double)a5;
- (void)_invalidateImage;
- (void)_liftDidEnd:(id)a3;
- (void)_liftForDraggingAfterBounceAnimated:(BOOL)a3;
- (void)_liftForDraggingAnimated:(BOOL)a3;
- (void)_removeAllAnimations;
- (void)_setDelegate:(id)a3;
- (void)_setMapType:(unint64_t)a3;
- (void)_setRotationRadians:(double)a3 withAnimation:(id)a4;
- (void)_updateAnchorPosition:(CGPoint)a3 alignToPixels:(BOOL)a4;
- (void)_updateShadowLayer;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setAnimatesDrop:(BOOL)animatesDrop;
- (void)setCenter:(CGPoint)a3;
- (void)setDragState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setPinColor:(MKPinAnnotationColor)pinColor;
- (void)setPinTintColor:(UIColor *)pinTintColor;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation MKPinAnnotationView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

+ (CGSize)_perceivedSize
{
  double v2 = 35.0;
  double v3 = 15.0;
  result.height = v2;
  result.width = v3;
  return result;
}

+ (UIColor)redPinColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] systemRedColor];
}

+ (UIColor)greenPinColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] systemGreenColor];
}

+ (UIColor)purplePinColor
{
  if (qword_1EB315AA8 != -1) {
    dispatch_once(&qword_1EB315AA8, &__block_literal_global_42);
  }
  double v2 = (void *)_MergedGlobals_3_1;

  return (UIColor *)v2;
}

void __37__MKPinAnnotationView_purplePinColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.788235307 green:0.411764711 blue:0.87843138 alpha:1.0];
  v1 = (void *)_MergedGlobals_3_1;
  _MergedGlobals_3_1 = v0;
}

+ (CGRect)_pinFrameForPosition:(CGPoint)a3
{
  double v3 = a3.x + -8.0;
  double v4 = a3.y + -35.0;
  double v5 = 35.0;
  double v6 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (id)_bounceAnimation
{
  double v2 = (void *)_bounceAnimation__pinBounceAnimation;
  if (!_bounceAnimation__pinBounceAnimation)
  {
    double v3 = [MEMORY[0x1E4F39BD8] animation];
    [v3 setKeyPath:@"contents"];
    [v3 setCalculationMode:*MEMORY[0x1E4F39D78]];
    LODWORD(v4) = 1.0;
    [v3 setRepeatCount:v4];
    [v3 setDuration:0.116666667];
    double v5 = (void *)_bounceAnimation__pinBounceAnimation;
    _bounceAnimation__pinBounceAnimation = (uint64_t)v3;

    double v2 = (void *)_bounceAnimation__pinBounceAnimation;
  }
  double v6 = (void *)[v2 copy];

  return v6;
}

+ (id)_dropBounceAnimation
{
  double v2 = (void *)_dropBounceAnimation__pinDropBounceAnimation;
  if (!_dropBounceAnimation__pinDropBounceAnimation)
  {
    double v3 = [MEMORY[0x1E4F39B38] animation];
    [v3 setFillMode:*MEMORY[0x1E4F39FA8]];
    [v3 setRemovedOnCompletion:0];
    double v4 = (void *)_dropBounceAnimation__pinDropBounceAnimation;
    _dropBounceAnimation__pinDropBounceAnimation = (uint64_t)v3;

    double v2 = (void *)_dropBounceAnimation__pinDropBounceAnimation;
  }
  double v5 = (void *)[v2 copy];

  return v5;
}

+ (id)_imageForLayer:(int64_t)a3 state:(int64_t)a4 mapType:(unint64_t)a5 traits:(id)a6
{
  id v9 = a6;
  v10 = [MEMORY[0x1E4F28E78] stringWithString:@"pin"];
  v11 = v10;
  if ((unint64_t)(a4 - 1) <= 3) {
    [v10 appendString:off_1E54BACF0[a4 - 1]];
  }
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_8;
    }
    v12 = @"_base";
  }
  else
  {
    v12 = @"_head";
  }
  [v11 appendString:v12];
LABEL_8:
  if (a5 - 1 <= 3) {
    [v11 appendString:@"_sat"];
  }
  if ([v9 userInterfaceIdiom] == 3) {
    [v11 appendString:@"_car"];
  }
  v13 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:compatibleWithTraitCollection:", v11, v9);

  return v13;
}

+ (id)_imageForState:(int64_t)a3 mapType:(unint64_t)a4 pinColor:(id)a5 traits:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = [a1 _imageForLayer:0 state:a3 mapType:a4 traits:v11];
  uint64_t v13 = [a1 _imageForLayer:1 state:a3 mapType:a4 traits:v11];
  v14 = (void *)v13;
  v15 = 0;
  if (v12 && v13)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __62__MKPinAnnotationView__imageForState_mapType_pinColor_traits___block_invoke;
    v25 = &unk_1E54BAC58;
    id v26 = v10;
    int64_t v27 = a3;
    v16 = (uint64_t (**)(void, void, void))MEMORY[0x18C139AE0](&v22);
    v17 = objc_msgSend(MEMORY[0x1E4F42F80], "_currentTraitCollection", v22, v23, v24, v25);
    [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v11];
    id v18 = v12;
    v19 = (CGImage *)v16[2](v16, [v18 CGImage], objc_msgSend(v14, "CGImage"));
    id v20 = objc_alloc(MEMORY[0x1E4F42A80]);
    [v18 scale];
    v15 = objc_msgSend(v20, "initWithCGImage:scale:orientation:", v19, 0);
    CGImageRelease(v19);
    [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v17];
  }

  return v15;
}

CGImageRef __62__MKPinAnnotationView__imageForState_mapType_pinColor_traits___block_invoke(uint64_t a1, CGImageRef image, CGImage *a3)
{
  double Width = (double)CGImageGetWidth(image);
  double Height = (double)CGImageGetHeight(image);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  id v10 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = Width;
  v16.size.height = Height;
  CGContextClearRect(v10, v16);
  CGContextSaveGState(v10);
  CGContextSetFillColorWithColor(v10, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = Width;
  v17.size.height = Height;
  CGContextFillRect(v10, v17);
  CGContextSetBlendMode(v10, kCGBlendModeDestinationIn);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = Width;
  v18.size.height = Height;
  CGContextDrawImage(v10, v18, image);
  CGContextRestoreGState(v10);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = Width;
  v19.size.height = Height;
  CGContextDrawImage(v10, v19, a3);
  if (*(void *)(a1 + 40) == 5)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    v12 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, 8 * (unint64_t)Width, DeviceGray, 0);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = Width;
    v20.size.height = Height;
    CGContextDrawImage(v12, v20, image);
    uint64_t v13 = CGBitmapContextCreateImage(v12);
    CGContextRelease(v12);
    CGColorSpaceRelease(DeviceGray);
    CGContextSaveGState(v10);
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = Width;
    v21.size.height = Height;
    CGContextClipToMask(v10, v21, image);
    CGContextSetRGBFillColor(v10, 0.0, 0.0, 0.0, 0.200000003);
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = Width;
    v22.size.height = Height;
    CGContextFillRect(v10, v22);
    CGContextRestoreGState(v10);
    CGImageRelease(v13);
  }
  CGImageRef v14 = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  CGColorSpaceRelease(DeviceRGB);
  return v14;
}

+ (id)_imageCache
{
  if (qword_1EB315AB8 != -1) {
    dispatch_once(&qword_1EB315AB8, &__block_literal_global_38);
  }
  double v2 = (void *)qword_1EB315AB0;

  return v2;
}

void __34__MKPinAnnotationView__imageCache__block_invoke()
{
  uint64_t v0 = objc_alloc_init(_MKPinAnnotationViewImageCache);
  v1 = (void *)qword_1EB315AB0;
  qword_1EB315AB0 = (uint64_t)v0;
}

+ (id)_pinsWithMapType:(unint64_t)a3 pinColor:(id)a4 traits:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a1 _imageCache];
  id v11 = [v10 pinsWithMapType:a3 pinColor:v8 traits:v9];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
    for (uint64_t i = 0; i != 6; ++i)
    {
      v15 = [a1 _imageForState:i mapType:a3 pinColor:v8 traits:v9];
      if (v15)
      {
        CGRect v16 = [NSNumber numberWithInteger:i];
        [v13 setObject:v15 forKey:v16];
      }
    }
    [v10 setPins:v13 forMapType:a3 pinColor:v8 traits:v9];
  }

  return v13;
}

+ (id)_reuseIdentifier
{
  return @"MKPinAnnotationView";
}

+ (id)_shadowImage
{
  double v2 = (void *)_shadowImage_pinShadowImage;
  if (!_shadowImage_pinShadowImage)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"pin_shadow.png");
    double v4 = (void *)_shadowImage_pinShadowImage;
    _shadowImage_pinShadowImage = v3;

    double v2 = (void *)_shadowImage_pinShadowImage;
  }

  return v2;
}

+ (CGPoint)_perceivedAnchorPoint
{
  double v2 = 8.0;
  double v3 = 5.0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGPoint)_shadowAnchorPoint
{
  double v2 = 2.0;
  double v3 = 3.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_draggingDropOffset
{
  [(MKAnnotationView *)self centerOffset];
  double v4 = v3 + -3.0;
  result.y = v4;
  result.x = v2;
  return result;
}

+ (CGPoint)_calloutOffset
{
  double v2 = -8.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGPoint)_leftCalloutOffset
{
  double v2 = -3.0;
  double v3 = -13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGPoint)_rightCalloutOffset
{
  double v2 = -14.0;
  double v3 = -13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (MKPinAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)MKPinAnnotationView;
  double v4 = [(MKAnnotationView *)&v22 initWithAnnotation:a3 reuseIdentifier:a4];
  if (v4)
  {
    double v5 = objc_opt_class();
    uint64_t v6 = [v5 redPinColor];
    pinTintColor = v4->_pinTintColor;
    v4->_pinTintColor = (UIColor *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F42AA0]);
    id v9 = [v5 _shadowImage];
    uint64_t v10 = [v8 initWithImage:v9];
    shadowView = v4->_shadowView;
    v4->_shadowView = (UIImageView *)v10;

    [(MKPinAnnotationView *)v4 setUserInteractionEnabled:1];
    [v5 _calloutOffset];
    [(MKAnnotationView *)v4 setCalloutOffset:"setCalloutOffset:"];
    [v5 _leftCalloutOffset];
    [(MKAnnotationView *)v4 setLeftCalloutOffset:"setLeftCalloutOffset:"];
    [v5 _rightCalloutOffset];
    [(MKAnnotationView *)v4 setRightCalloutOffset:"setRightCalloutOffset:"];
    v12 = [(MKPinAnnotationView *)v4 layer];
    objc_msgSend(v12, "setHitOffset:", -8.0, -2.0);
    objc_msgSend(v12, "setHitOutset:", 0.0, 5.0);
    id v13 = [(MKPinAnnotationView *)v4 _image];
    [(MKAnnotationView *)v4 setImage:v13];

    CGImageRef v14 = [(MKPinAnnotationView *)v4 traitCollection];
    uint64_t v15 = [v14 userInterfaceIdiom];
    double v16 = 8.0;
    if (v15 == 3) {
      double v16 = 7.5;
    }
    double v17 = -15.0;
    if (v15 == 3) {
      double v17 = -13.5;
    }
    -[MKAnnotationView setCenterOffset:](v4, "setCenterOffset:", v16, v17);

    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    CGRect v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v19 = (id)[(MKPinAnnotationView *)v4 registerForTraitChanges:v18 withAction:sel_traitEnvironment_didChangeTraitCollection_];

    CGRect v20 = v4;
  }

  return v4;
}

- (void)setPinColor:(MKPinAnnotationColor)pinColor
{
  if (pinColor == MKPinAnnotationColorPurple)
  {
    uint64_t v4 = [(id)objc_opt_class() purplePinColor];
  }
  else
  {
    if (pinColor == MKPinAnnotationColorGreen) {
      [(id)objc_opt_class() greenPinColor];
    }
    else {
    uint64_t v4 = [(id)objc_opt_class() redPinColor];
    }
  }
  id v5 = (id)v4;
  [(MKPinAnnotationView *)self setPinTintColor:v4];
}

- (MKPinAnnotationColor)pinColor
{
  double v3 = [(MKPinAnnotationView *)self pinTintColor];
  uint64_t v4 = [(id)objc_opt_class() greenPinColor];
  char v5 = [v3 isEqual:v4];

  if (v5) {
    return 1;
  }
  v7 = [(MKPinAnnotationView *)self pinTintColor];
  id v8 = [(id)objc_opt_class() purplePinColor];
  int v9 = [v7 isEqual:v8];

  if (v9) {
    return 2;
  }
  else {
    return 0;
  }
}

- (UIColor)pinTintColor
{
  return self->_pinTintColor;
}

- (void)setPinTintColor:(UIColor *)pinTintColor
{
  id v8 = pinTintColor;
  char v4 = [(UIColor *)v8 isEqual:self->_pinTintColor];
  char v5 = v8;
  if ((v4 & 1) == 0)
  {
    if (v8)
    {
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v6 = [(id)objc_opt_class() redPinColor];
    }
    v7 = self->_pinTintColor;
    self->_pinTintColor = v6;

    [(MKPinAnnotationView *)self _removeAllAnimations];
    [(MKPinAnnotationView *)self _invalidateImage];
    char v5 = v8;
  }
}

- (void)setAnimatesDrop:(BOOL)animatesDrop
{
  self->_animatesDrop = animatesDrop;
}

- (BOOL)animatesDrop
{
  return self->_animatesDrop;
}

- (CGRect)_significantBounds
{
  double v2 = 35.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 15.0;
  result.size.height = v2;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets
{
  double v2 = 11.0;
  double v3 = -5.0;
  double v4 = -5.0;
  double v5 = 13.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_setMapType:(unint64_t)a3
{
  if ([(MKAnnotationView *)self _mapType] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MKPinAnnotationView;
    [(MKAnnotationView *)&v5 _setMapType:a3];
    [(MKPinAnnotationView *)self _removeAllAnimations];
    [(MKPinAnnotationView *)self _invalidateImage];
  }
}

- (id)description
{
  double v3 = [(MKPinAnnotationView *)self superview];
  double v4 = [v3 superview];

  [(MKPinAnnotationView *)self bounds];
  objc_msgSend(v4, "convertRect:fromView:", self);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 bounds];
  v28.origin.x = v13;
  v28.origin.y = v14;
  v28.size.width = v15;
  v28.size.height = v16;
  v27.origin.x = v6;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  LODWORD(v3) = CGRectIntersectsRect(v27, v28);
  double v17 = NSString;
  v25.receiver = self;
  v25.super_class = (Class)MKPinAnnotationView;
  CGRect v18 = [(MKPinAnnotationView *)&v25 description];
  id v19 = [(MKAnnotationView *)self annotation];
  [v19 coordinate];
  objc_super v22 = [NSString stringWithFormat:@"%+.8f, %+.8f", v20, v21];
  uint64_t v23 = [v17 stringWithFormat:@"%@ visible:%d %@", v18, v3, v22];

  return v23;
}

- (id)_pins
{
  unint64_t v3 = [(MKAnnotationView *)self _mapType];
  double v4 = [(MKPinAnnotationView *)self pinTintColor];
  double v5 = [(MKPinAnnotationView *)self traitCollection];
  CGFloat v6 = +[MKPinAnnotationView _pinsWithMapType:v3 pinColor:v4 traits:v5];

  return v6;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v17 = a4;
  double v5 = [(MKPinAnnotationView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];
  if (v6 == [v17 userInterfaceIdiom])
  {
    double v7 = [(MKPinAnnotationView *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceStyle];
    uint64_t v9 = [v17 userInterfaceStyle];

    if (v8 == v9) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  [(MKPinAnnotationView *)self _removeAllAnimations];
  [(MKPinAnnotationView *)self _invalidateImage];
  CGFloat v10 = [(MKPinAnnotationView *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];
  uint64_t v12 = [v17 userInterfaceIdiom];

  if (v11 != v12)
  {
    CGFloat v13 = [(MKPinAnnotationView *)self traitCollection];
    uint64_t v14 = [v13 userInterfaceIdiom];
    double v15 = 8.0;
    if (v14 == 3) {
      double v15 = 7.5;
    }
    double v16 = -15.0;
    if (v14 == 3) {
      double v16 = -13.5;
    }
    -[MKAnnotationView setCenterOffset:](self, "setCenterOffset:", v15, v16);
  }
LABEL_11:
}

- (id)_image
{
  double v2 = [(MKPinAnnotationView *)self _pins];
  unint64_t v3 = [v2 objectForKey:&unk_1ED97E610];

  return v3;
}

- (id)_highlightedImage
{
  double v2 = [(MKPinAnnotationView *)self _pins];
  unint64_t v3 = [v2 objectForKey:&unk_1ED97E628];

  return v3;
}

- (id)_floatingImage
{
  double v2 = [(MKPinAnnotationView *)self _pins];
  unint64_t v3 = [v2 objectForKey:&unk_1ED97E640];

  return v3;
}

- (id)_pinBounceImages
{
  double v2 = [(MKPinAnnotationView *)self _pins];
  double v15 = (void *)MEMORY[0x1E4F1C978];
  double v16 = [v2 objectForKey:&unk_1ED97E610];
  uint64_t v14 = [v16 CGImage];
  unint64_t v3 = [v2 objectForKey:&unk_1ED97E658];
  uint64_t v4 = [v3 CGImage];
  double v5 = [v2 objectForKey:&unk_1ED97E670];
  uint64_t v6 = [v5 CGImage];
  double v7 = [v2 objectForKey:&unk_1ED97E688];
  uint64_t v8 = [v7 CGImage];
  uint64_t v9 = [v2 objectForKey:&unk_1ED97E670];
  uint64_t v10 = [v9 CGImage];
  uint64_t v11 = [v2 objectForKey:&unk_1ED97E658];
  uint64_t v12 = objc_msgSend(v15, "arrayWithObjects:", v14, v4, v6, v8, v10, objc_msgSend(v11, "CGImage"), 0);

  return v12;
}

- (id)_pinJumpImages
{
  double v2 = [(MKPinAnnotationView *)self _pins];
  double v15 = (void *)MEMORY[0x1E4F1C978];
  double v16 = [v2 objectForKey:&unk_1ED97E610];
  uint64_t v14 = [v16 CGImage];
  unint64_t v3 = [v2 objectForKey:&unk_1ED97E658];
  uint64_t v4 = [v3 CGImage];
  double v5 = [v2 objectForKey:&unk_1ED97E670];
  uint64_t v6 = [v5 CGImage];
  double v7 = [v2 objectForKey:&unk_1ED97E688];
  uint64_t v8 = [v7 CGImage];
  uint64_t v9 = [v2 objectForKey:&unk_1ED97E670];
  uint64_t v10 = [v9 CGImage];
  uint64_t v11 = [v2 objectForKey:&unk_1ED97E658];
  uint64_t v12 = objc_msgSend(v15, "arrayWithObjects:", v14, v4, v6, v8, v10, objc_msgSend(v11, "CGImage"), 0);

  return v12;
}

- (void)_invalidateImage
{
  id v3 = [(MKPinAnnotationView *)self _image];
  [(MKAnnotationView *)self setImage:v3];
}

- (void)_setRotationRadians:(double)a3 withAnimation:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)MKPinAnnotationView;
  [(MKAnnotationView *)&v31 _setRotationRadians:a4 withAnimation:a3];
  uint64_t v5 = [(UIImageView *)self->_shadowView superview];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    v30.receiver = self;
    v30.super_class = (Class)MKPinAnnotationView;
    id v7 = [(MKAnnotationView *)&v30 dragState];

    if (v7 == (id)2)
    {
      [(MKPinAnnotationView *)self center];
      double v9 = v8;
      double v11 = v10;
      uint64_t v12 = [(MKPinAnnotationView *)self superview];
      -[MKPinAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v12, v9, v11);
      double v14 = v13;
      double v16 = v15;

      id v17 = [(MKPinAnnotationView *)self superview];
      objc_msgSend(v17, "convertPoint:fromView:", self, v14 + 42.8947487, v16 + -40.0);
      double v19 = v18;
      double v21 = v20;

      objc_super v22 = [(UIImageView *)self->_shadowView layer];
      objc_msgSend(v22, "setPosition:", v19, v21);

      uint64_t v23 = [(MKAnnotationView *)self _contentLayer];
      v24 = v23;
      if (v23)
      {
        [v23 affineTransform];
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v27 = 0u;
      }
      objc_super v25 = [(UIImageView *)self->_shadowView layer];
      v26[0] = v27;
      v26[1] = v28;
      v26[2] = v29;
      [v25 setAffineTransform:v26];
    }
  }
}

- (void)_updateShadowLayer
{
  id v3 = [(UIImageView *)self->_shadowView superview];

  if (v3)
  {
    uint64_t v4 = [(MKPinAnnotationView *)self layer];
    [v4 position];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6 + 42.8947487;
    if (self->_state == 4)
    {
      double v8 = v8 + -40.0;
      double v6 = v6 + 42.8947487;
    }
    id v10 = [(UIImageView *)self->_shadowView layer];
    objc_msgSend(v10, "setPosition:", v6, v8);
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MKPinAnnotationView *)self _removeAllAnimations];
  if ((self->_state - 3) >= 2) {
    double v6 = y;
  }
  else {
    double v6 = y + -40.0;
  }
  v7.receiver = self;
  v7.super_class = (Class)MKPinAnnotationView;
  -[MKPinAnnotationView setCenter:](&v7, sel_setCenter_, x, v6);
  [(MKPinAnnotationView *)self _updateShadowLayer];
}

- (void)_didUpdatePosition
{
  v3.receiver = self;
  v3.super_class = (Class)MKPinAnnotationView;
  [(MKAnnotationView *)&v3 _didUpdatePosition];
  [(MKPinAnnotationView *)self _updateShadowLayer];
}

- (void)_removeAllAnimations
{
  id v5 = [(MKPinAnnotationView *)self layer];
  [(CALayer *)self->super._imageLayer removeAnimationForKey:@"contents"];
  [(CALayer *)self->super._imageLayer removeAnimationForKey:@"jump"];
  [v5 removeAnimationForKey:@"dropGroup"];
  [v5 removeAnimationForKey:@"jump"];
  objc_super v3 = [(UIImageView *)self->_shadowView layer];
  [v3 removeAnimationForKey:@"position"];

  uint64_t v4 = [(UIImageView *)self->_shadowView layer];
  [v4 removeAnimationForKey:@"jump"];
}

- (void)_cleanupAfterPinDropAnimation
{
  if (self->_state == 2) {
    [(UIImageView *)self->_shadowView removeFromSuperview];
  }
  self->_state = 0;
  [(MKPinAnnotationView *)self _removeAllAnimations];
  objc_super v3 = [(MKPinAnnotationView *)self _image];
  [(MKAnnotationView *)self setImage:v3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pinDidDrop:self animated:1];
}

- (id)_bounceAnimation:(BOOL)a3 withDelay:(double)a4 addToLayer:(BOOL)a5
{
  double v9 = [(id)objc_opt_class() _bounceAnimation];
  if (v9)
  {
    id v10 = v9;
    [v9 setDelegate:self];
    if (a3) {
      [(MKPinAnnotationView *)self _pinBounceImages];
    }
    else {
    uint64_t v12 = [(MKPinAnnotationView *)self _pinJumpImages];
    }
    [v10 setValues:v12];

    [v10 setDuration:0.116666667];
    [v10 setRemovedOnCompletion:0];
    [v10 setFillMode:*MEMORY[0x1E4F39FA8]];
    if (a5)
    {
      double v13 = [(MKPinAnnotationView *)self layer];
      [v13 convertTime:0 fromLayer:CACurrentMediaTime() + a4];
      objc_msgSend(v10, "setBeginTime:");

      [(CALayer *)self->super._imageLayer addAnimation:v10 forKey:@"contents"];
      double v11 = 0;
    }
    else
    {
      [v10 setBeginTime:a4];
      double v11 = (void *)[v10 copy];
    }
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (void)_dropFromDistance:(double)a3 maxDistance:(double)a4 withDelay:(double)a5
{
  v55[2] = *MEMORY[0x1E4F143B8];
  double v9 = [(MKPinAnnotationView *)self superview];
  if (v9)
  {
    self->_state = 2;
    id v10 = [(MKPinAnnotationView *)self _floatingImage];
    [(MKAnnotationView *)self setImage:v10];
    double v11 = [(MKPinAnnotationView *)self layer];
    [v10 size];
    double v13 = v12;
    v47 = v10;
    [v10 size];
    v46 = v11;
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, v13, v14);
    double v15 = [(UIImageView *)self->_shadowView layer];
    [v9 insertSubview:self->_shadowView atIndex:0];
    [(MKPinAnnotationView *)self center];
    v49 = v15;
    objc_msgSend(v15, "setPosition:");
    double v16 = [(MKAnnotationView *)self _contentLayer];
    id v17 = v16;
    v48 = v9;
    if (v16)
    {
      [v16 affineTransform];
    }
    else
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v52 = 0u;
    }
    v51[0] = v52;
    v51[1] = v53;
    v51[2] = v54;
    [v49 setAffineTransform:v51];

    [(MKAnnotationView *)self setHidden:1];
    [(UIImageView *)self->_shadowView setHidden:1];
    double v18 = CACurrentMediaTime();
    UIAnimationDragCoefficient();
    double v20 = v18 + v19 * a5;
    double v21 = fmin((a3 / a4 + (1.0 - a3 / a4) * 0.5) * 0.349999994, 3.0);
    objc_super v22 = +[MKPinAnnotationView _dropBounceAnimation];
    [v22 setDuration:v21 + 0.116666667];
    uint64_t v23 = [(MKPinAnnotationView *)self layer];
    [v23 convertTime:0 fromLayer:v20];
    objc_msgSend(v22, "setBeginTime:");

    [v22 setDelegate:self];
    v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.y"];
    uint64_t v25 = *MEMORY[0x1E4F3A4A0];
    id v26 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v24 setTimingFunction:v26];

    [v24 setDuration:v21];
    long long v27 = [NSNumber numberWithDouble:-4.0 - a3];
    [v24 setFromValue:v27];

    [v24 setToValue:&unk_1ED97E6A0];
    long long v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    [v28 addObject:v24];
    long long v29 = [(MKPinAnnotationView *)self _bounceAnimation:1 withDelay:0 addToLayer:v21];
    objc_super v30 = [(MKPinAnnotationView *)self layer];
    [v30 convertTime:0 fromLayer:v21 + v20];
    objc_msgSend(v29, "setBeginTime:");

    v45 = v28;
    [v22 setAnimations:v28];
    objc_super v31 = [MEMORY[0x1E4F39B38] animation];
    v32 = [MEMORY[0x1E4F39C10] functionWithName:v25];
    [v31 setTimingFunction:v32];

    [v31 setDuration:v21];
    [v49 convertTime:0 fromLayer:v20];
    objc_msgSend(v31, "setBeginTime:");
    [v31 setRemovedOnCompletion:1];
    v33 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.x"];
    v34 = [NSNumber numberWithDouble:(-4.0 - a3) * -1.07236872];
    [v33 setFromValue:v34];

    [v33 setToValue:&unk_1ED97E6A0];
    v35 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.y"];
    v36 = [NSNumber numberWithDouble:-4.0 - a3];
    [v35 setFromValue:v36];

    [v35 setToValue:&unk_1ED97E6A0];
    v55[0] = v33;
    v55[1] = v35;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    [v31 setAnimations:v37];

    id v38 = v22;
    UIAnimationDragCoefficient();
    if (*(float *)&v39 != 0.0 && *(float *)&v39 != 1.0)
    {
      *(float *)&double v39 = 1.0 / *(float *)&v39;
      [v38 setSpeed:v39];
    }

    id v40 = v29;
    UIAnimationDragCoefficient();
    if (*(float *)&v41 != 0.0 && *(float *)&v41 != 1.0)
    {
      *(float *)&double v41 = 1.0 / *(float *)&v41;
      [v40 setSpeed:v41];
    }

    id v42 = v31;
    UIAnimationDragCoefficient();
    if (*(float *)&v43 != 0.0 && *(float *)&v43 != 1.0)
    {
      *(float *)&double v43 = 1.0 / *(float *)&v43;
      [v42 setSpeed:v43];
    }

    v44 = [(MKPinAnnotationView *)self layer];
    [v44 addAnimation:v38 forKey:@"dropGroup"];

    [(CALayer *)self->super._imageLayer addAnimation:v40 forKey:@"contents"];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __63__MKPinAnnotationView__dropFromDistance_maxDistance_withDelay___block_invoke;
    v50[3] = &unk_1E54B86F0;
    v50[4] = self;
    objc_msgSend(v49, "_mapkit_addAnimation:forKey:completion:", v42, @"position", v50);

    double v9 = v48;
  }
}

uint64_t __63__MKPinAnnotationView__dropFromDistance_maxDistance_withDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1024) setHidden:1];
}

- (void)_dropAfterDraggingAndRevertPosition:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v7 = [(MKAnnotationView *)self _containerView];
  [(MKAnnotationView *)self coordinate];
  objc_msgSend(v7, "pointForCoordinate:");
  double v9 = v8;
  double v11 = v10;

  [(MKAnnotationView *)self centerOffset];
  double v13 = v9 + v12;
  [(MKAnnotationView *)self centerOffset];
  double v15 = v11 + v14;
  double v16 = [(MKPinAnnotationView *)self _floatingImage];
  [(MKAnnotationView *)self setImage:v16];

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke;
  v53[3] = &unk_1E54B8188;
  v53[4] = self;
  id v17 = (void *)MEMORY[0x18C139AE0](v53);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_2;
  v48[3] = &unk_1E54BACD0;
  BOOL v52 = v4;
  v48[4] = self;
  double v50 = v13;
  double v51 = v15;
  id v18 = v17;
  id v49 = v18;
  uint64_t v19 = MEMORY[0x18C139AE0](v48);
  double v20 = (void *)v19;
  if (a3)
  {
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
  else
  {
    [(MKPinAnnotationView *)self center];
    double v22 = v21;
    double v24 = v23;
    uint64_t v25 = [(MKPinAnnotationView *)self superview];
    -[MKPinAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v25, v22, v24);
    double v27 = v26;
    double v29 = v28;

    double v30 = v29 + -36.0;
    double v31 = v27 + 42.8947487;
    double v32 = v30 + -40.0;
    v33 = [(MKPinAnnotationView *)self superview];
    objc_msgSend(v33, "convertPoint:fromView:", self, v27, v30);
    uint64_t v35 = v34;
    uint64_t v37 = v36;

    id v38 = [(MKPinAnnotationView *)self superview];
    objc_msgSend(v38, "convertPoint:fromView:", self, v31, v32);
    uint64_t v40 = v39;
    uint64_t v42 = v41;

    double v43 = (void *)MEMORY[0x1E4F42FF0];
    if (v4) {
      double v44 = 0.200000003;
    }
    else {
      double v44 = 0.0;
    }
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_5;
    v47[3] = &unk_1E54B9040;
    v47[4] = self;
    v47[5] = v35;
    v47[6] = v37;
    v47[7] = v40;
    v47[8] = v42;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_6;
    v45[3] = &unk_1E54B89C0;
    id v46 = v20;
    [v43 animateWithDuration:0 delay:v47 options:v45 animations:v44 completion:0.0];
  }
}

id __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 1048) = 5;
  return (id)[*(id *)(a1 + 32) _bounceAnimation:1 withDelay:1 addToLayer:0.0];
}

void __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F42FF0];
  char v2 = *(unsigned char *)(a1 + 64);
  if (v2) {
    double v3 = 0.200000003;
  }
  else {
    double v3 = 0.0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_3;
  v7[3] = &unk_1E54BAC80;
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_4;
  v4[3] = &unk_1E54BACA8;
  v4[4] = v8;
  char v6 = v2;
  id v5 = *(id *)(a1 + 40);
  [v1 animateWithDuration:4 delay:v7 options:v4 animations:v3 completion:0.0];
}

void __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_3(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  BOOL v4 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v4, "setPosition:", v2, v3);

  double v5 = *(double *)(a1 + 40);
  double v6 = *(double *)(a1 + 48);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 1024) layer];
  objc_msgSend(v7, "setPosition:", v5, v6);
}

uint64_t __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1024) removeFromSuperview];
  double v2 = *(void **)(a1 + 32);
  double v3 = [v2 _image];
  [v2 setImage:v3];

  [*(id *)(a1 + 32) _updateEffectiveZPriority];
  if (!_MKLinkedOnOrAfterReleaseSet(2053) || (uint64_t result = _MKLinkedOnOrAfterReleaseSet(2310), result)) {
    uint64_t result = [*(id *)(a1 + 32) setDragState:0 animated:0];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    double v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 1048) = 0;
  }
  return result;
}

void __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_5(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  BOOL v4 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v4, "setPosition:", v2, v3);

  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 1024) layer];
  objc_msgSend(v7, "setPosition:", v5, v6);
}

uint64_t __68__MKPinAnnotationView__dropAfterDraggingAndRevertPosition_animated___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDragState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MKPinAnnotationView;
  if ([(MKAnnotationView *)&v8 dragState] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)MKPinAnnotationView;
    [(MKAnnotationView *)&v7 setDragState:a3 animated:v4];
    if (a3 == 1)
    {
      [(MKPinAnnotationView *)self _liftForDraggingAnimated:v4];
    }
    else if (a3 - 3 <= 1)
    {
      [(MKPinAnnotationView *)self _dropAfterDraggingAndRevertPosition:a3 == 3 animated:v4];
    }
  }
}

- (void)_liftForDraggingAnimated:(BOOL)a3
{
  self->_state = 6;
  if (a3)
  {
    id v3 = [(MKPinAnnotationView *)self _bounceAnimation:0 withDelay:1 addToLayer:0.0];
  }
  else
  {
    -[MKPinAnnotationView _liftForDraggingAfterBounceAnimated:](self, "_liftForDraggingAfterBounceAnimated:");
  }
}

- (void)_liftForDraggingAfterBounceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_state = 3;
  [(CALayer *)self->super._imageLayer removeAnimationForKey:@"contents"];
  double v5 = [(MKPinAnnotationView *)self _floatingImage];
  [(MKAnnotationView *)self setImage:v5];

  double v6 = [(MKPinAnnotationView *)self layer];
  [v6 position];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(UIImageView *)self->_shadowView superview];

  if (v11) {
    [(UIImageView *)self->_shadowView removeFromSuperview];
  }
  double v12 = [(UIImageView *)self->_shadowView layer];
  [v12 removeAllAnimations];

  double v13 = [(MKPinAnnotationView *)self superview];
  [v13 insertSubview:self->_shadowView atIndex:0];

  -[UIImageView setCenter:](self->_shadowView, "setCenter:", v8, v10);
  double v14 = [(MKPinAnnotationView *)self superview];
  -[MKPinAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v14, v8, v10);
  double v16 = v15;
  double v18 = v17;

  double v19 = v18 + -40.0;
  double v20 = v16 + 42.8947487;
  double v21 = v19 + -40.0;
  double v22 = [(MKPinAnnotationView *)self superview];
  objc_msgSend(v22, "convertPoint:fromView:", self, v16, v19);
  uint64_t v24 = v23;
  uint64_t v26 = v25;

  double v27 = [(MKPinAnnotationView *)self superview];
  objc_msgSend(v27, "convertPoint:fromView:", self, v20, v21);
  uint64_t v29 = v28;
  uint64_t v31 = v30;

  double v32 = 0.200000003;
  if (!v3) {
    double v32 = 0.0;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __59__MKPinAnnotationView__liftForDraggingAfterBounceAnimated___block_invoke;
  v35[3] = &unk_1E54B9040;
  v35[4] = self;
  v35[5] = v24;
  v35[6] = v26;
  v35[7] = v29;
  v35[8] = v31;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __59__MKPinAnnotationView__liftForDraggingAfterBounceAnimated___block_invoke_2;
  v33[3] = &unk_1E54B8740;
  v33[4] = self;
  BOOL v34 = v3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v35 animations:v33 completion:v32];
}

void __59__MKPinAnnotationView__liftForDraggingAfterBounceAnimated___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  BOOL v4 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v4, "setPosition:", v2, v3);

  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = [*(id *)(*(void *)(a1 + 32) + 1024) layer];
  objc_msgSend(v7, "setPosition:", v5, v6);

  double v8 = [*(id *)(a1 + 32) _contentLayer];
  double v9 = v8;
  if (v8)
  {
    [v8 affineTransform];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  double v10 = [*(id *)(*(void *)(a1 + 32) + 1024) layer];
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  [v10 setAffineTransform:v11];
}

uint64_t __59__MKPinAnnotationView__liftForDraggingAfterBounceAnimated___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    v1 = @"MKPinAnnotationView_LiftAnimation";
  }
  else {
    v1 = 0;
  }
  return [*(id *)(a1 + 32) _liftDidEnd:v1];
}

- (void)_liftDidEnd:(id)a3
{
  id v5 = a3;
  self->_state = 4;
  if ([(MKAnnotationView *)self dragState] == MKAnnotationViewDragStateStarting)
  {
    -[MKPinAnnotationView setDragState:animated:](self, "setDragState:animated:", 2, [v5 length] != 0);
    BOOL v4 = [(MKPinAnnotationView *)self _floatingImage];
    [(MKAnnotationView *)self setImage:v4];
  }
  else
  {
    [(MKPinAnnotationView *)self _dropAfterDraggingAndRevertPosition:1 animated:1];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  int state = self->_state;
  if (state == 2 || state == 5)
  {
    id v8 = v5;
    [(MKPinAnnotationView *)self _cleanupAfterPinDropAnimation];
  }
  else
  {
    if (state != 6) {
      goto LABEL_10;
    }
    self->_int state = 3;
    id v8 = v5;
    [(MKPinAnnotationView *)self _liftForDraggingAfterBounceAnimated:1];
  }
  id v5 = v8;
LABEL_10:
}

- (void)animationDidStart:(id)a3
{
  [(MKAnnotationView *)self setHidden:0];
  shadowView = self->_shadowView;

  [(UIImageView *)shadowView setHidden:0];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPinAnnotationView;
  if ([(MKAnnotationView *)&v11 isHighlighted] != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)MKPinAnnotationView;
    [(MKAnnotationView *)&v10 setHighlighted:v3];
    if ([(MKAnnotationView *)self dragState] == MKAnnotationViewDragStateNone)
    {
      unsigned int state = self->_state;
      BOOL v6 = state > 5;
      int v7 = (1 << state) & 0x34;
      if (v6 || v7 == 0)
      {
        if (v3) {
          [(MKPinAnnotationView *)self _highlightedImage];
        }
        else {
        double v9 = [(MKPinAnnotationView *)self _image];
        }
        [(MKAnnotationView *)self setImage:v9];
      }
    }
  }
}

- (BOOL)isHighlighted
{
  if ([(MKAnnotationView *)self dragState]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MKPinAnnotationView;
  return [(MKAnnotationView *)&v4 isHighlighted];
}

- (int)_state
{
  return self->_state;
}

- (void)_updateAnchorPosition:(CGPoint)a3 alignToPixels:(BOOL)a4
{
  if (self->_state != 4)
  {
    v4.receiver = self;
    v4.super_class = (Class)MKPinAnnotationView;
    -[MKAnnotationView _updateAnchorPosition:alignToPixels:](&v4, sel__updateAnchorPosition_alignToPixels_, a4, a3.x, a3.y);
  }
}

- (_MKPinAnnotationViewDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MKPinAnnotationViewDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinTintColor, 0);

  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end