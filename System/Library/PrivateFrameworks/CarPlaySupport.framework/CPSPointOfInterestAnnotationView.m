@interface CPSPointOfInterestAnnotationView
+ (CGPath)_createPathForBalloonRadius:(double)a3 tailLength:(double)a4;
+ (id)balloonWithText:(id)a3 traitCollection:(id)a4;
- (BOOL)isAccessibilityElement;
- (CPImageSet)imageSet;
- (CPImageSet)selectedImageSet;
- (CPSPointOfInterestAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (id)_defaultPOI;
- (void)_configure;
- (void)_updateImage;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setImageSet:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectedImageSet:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSPointOfInterestAnnotationView

- (CPSPointOfInterestAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)CPSPointOfInterestAnnotationView;
  v9 = [(MKAnnotationView *)&v10 initWithAnnotation:location[0] reuseIdentifier:v11];
  v13 = v9;
  objc_storeStrong((id *)&v13, v9);
  if (v9)
  {
    id v7 = [(CPSPointOfInterestAnnotationView *)v13 _defaultPOI];
    -[MKAnnotationView setImage:](v13, "setImage:");

    [(CPSPointOfInterestAnnotationView *)v13 _configure];
  }
  v6 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointOfInterestAnnotationView;
  [(CPSPointOfInterestAnnotationView *)&v3 traitCollectionDidChange:location[0]];
  [(CPSPointOfInterestAnnotationView *)v5 _updateImage];
  objc_storeStrong(location, 0);
}

- (void)setImageSet:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([(CPImageSet *)v4->_imageSet isEqual:location[0]] & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_imageSet, location[0]);
    [(CPSPointOfInterestAnnotationView *)v4 _updateImage];
  }
  objc_storeStrong(location, 0);
}

- (void)setSelectedImageSet:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([(CPImageSet *)v4->_selectedImageSet isEqual:location[0]] & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_selectedImageSet, location[0]);
    [(CPSPointOfInterestAnnotationView *)v4 _updateImage];
  }
  objc_storeStrong(location, 0);
}

- (void)_updateImage
{
  if ([(MKAnnotationView *)self isSelected])
  {
    v9 = [(CPSPointOfInterestAnnotationView *)self selectedImageSet];

    if (v9)
    {
      v8 = [(CPSPointOfInterestAnnotationView *)self selectedImageSet];
      id v7 = (id)[(CPImageSet *)v8 image];
      -[MKAnnotationView setImage:](self, "setImage:");
    }
    else
    {
      id v6 = [(CPSPointOfInterestAnnotationView *)self _defaultPOI];
      -[MKAnnotationView setImage:](self, "setImage:");
    }
  }
  else
  {
    v5 = [(CPSPointOfInterestAnnotationView *)self imageSet];

    if (v5)
    {
      v4 = [(CPSPointOfInterestAnnotationView *)self imageSet];
      id v3 = (id)[(CPImageSet *)v4 image];
      -[MKAnnotationView setImage:](self, "setImage:");
    }
    else
    {
      id v2 = [(CPSPointOfInterestAnnotationView *)self _defaultPOI];
      -[MKAnnotationView setImage:](self, "setImage:");
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSPointOfInterestAnnotationView;
  [(MKAnnotationView *)&v3 setSelected:a3];
  [(CPSPointOfInterestAnnotationView *)v6 setSelected:v4 animated:1];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  BOOL v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)CPSPointOfInterestAnnotationView;
  [(MKAnnotationView *)&v4 setSelected:a3 animated:a4];
  [(CPSPointOfInterestAnnotationView *)v8 _updateImage];
}

- (void)prepareForDisplay
{
  objc_super v4 = self;
  SEL v3 = a2;
  [(CPSPointOfInterestAnnotationView *)self _configure];
  v2.receiver = v4;
  v2.super_class = (Class)CPSPointOfInterestAnnotationView;
  [(MKAnnotationView *)&v2 prepareForDisplay];
}

- (void)prepareForReuse
{
  objc_super v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointOfInterestAnnotationView;
  [(MKAnnotationView *)&v2 prepareForReuse];
  [(CPSPointOfInterestAnnotationView *)v4 _configure];
}

- (void)_configure
{
  LODWORD(v2) = 1148846080;
  [(MKAnnotationView *)self setDisplayPriority:v2];
  [(MKAnnotationView *)self setCollisionMode:1];
  [(MKAnnotationView *)self setCanShowCallout:0];
}

- (id)_defaultPOI
{
  id v3 = (id)[(CPSPointOfInterestAnnotationView *)self traitCollection];
  id v4 = +[CPSPointOfInterestAnnotationView balloonWithText:traitCollection:](CPSPointOfInterestAnnotationView, "balloonWithText:traitCollection:", 0);

  return v4;
}

+ (id)balloonWithText:(id)a3 traitCollection:(id)a4
{
  id v39 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  id v36 = +[CPSEntityStyles mapAnnotationDropShadow];
  id v35 = (id)[MEMORY[0x263F1C658] systemFontOfSize:12.0 weight:*MEMORY[0x263F1D320]];
  memset(v34, 0, sizeof(v34));
  long long v32 = 0u;
  long long v33 = 0u;
  memset(__b, 0, sizeof(__b));
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v36;
  CGRectMake_11();
  v28[1] = v4;
  v28[2] = v5;
  v28[3] = v6;
  v28[4] = v7;
  objc_msgSend(v15, "rectsForSource:shadowRect:unionRect:positionTransform:", v34, &v32, __b, *(double *)&v4, *(double *)&v5, *(double *)&v6, *(double *)&v7);
  *(void *)&long long v29 = v8;
  *((void *)&v29 + 1) = v9;
  *(void *)&long long v30 = v10;
  *((void *)&v30 + 1) = v11;
  id v12 = objc_alloc(MEMORY[0x263F1C680]);
  v28[0] = (id)objc_msgSend(v12, "initWithSize:", *(double *)&v33, *((double *)&v33 + 1));
  id v16 = v28[0];
  id v18 = v37;
  id v19 = v36;
  v21[1] = v39;
  long long v22 = v29;
  long long v23 = v30;
  memcpy(v24, __b, sizeof(v24));
  id v20 = location[0];
  v21[0] = v35;
  long long v25 = v32;
  long long v26 = v33;
  id v27 = (id)objc_msgSend(v16, "imageWithActions:");
  id v17 = v27;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v28, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);

  return v17;
}

void __68__CPSPointOfInterestAnnotationView_balloonWithText_traitCollection___block_invoke(uint64_t a1, void *a2)
{
  v28[2] = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v25[1] = (id)a1;
  v25[0] = (id)[MEMORY[0x263F1CB00] _currentTraitCollection];
  [MEMORY[0x263F1CB00] _setCurrentTraitCollection:*(void *)(a1 + 32)];
  v24.width = 0.0;
  v24.height = 0.0;
  [*(id *)(a1 + 40) offset];
  v24.width = v2;
  v24.height = v3;
  CGFloat v23 = 0.0;
  [*(id *)(a1 + 40) radius];
  CGFloat v23 = v4;
  c = (CGContext *)[location[0] CGContext];
  id v13 = (id)[*(id *)(a1 + 40) color];
  CGContextSetShadowWithColor(c, v24, v23, (CGColorRef)[v13 CGColor]);

  id v22 = (id)objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithCGPath:", objc_msgSend(*(id *)(a1 + 64), "_createPathForBalloonRadius:tailLength:", *(double *)(a1 + 88) / 2.0, *(double *)(a1 + 96) - *(double *)(a1 + 88)));
  memcpy(__dst, (const void *)(a1 + 104), sizeof(__dst));
  [v22 applyTransform:__dst];
  id v14 = (id)[MEMORY[0x263F1C550] systemRedColor];
  [v14 setFill];

  [v22 fill];
  BOOL v5 = (CGContext *)[location[0] CGContext];
  CGContextSetShadowWithColor(v5, v24, v23, 0);
  if (*(void *)(a1 + 48))
  {
    v27[0] = *MEMORY[0x263F1C238];
    v28[0] = *(void *)(a1 + 56);
    v27[1] = *MEMORY[0x263F1C240];
    id v10 = (id)[MEMORY[0x263F1C550] systemWhiteColor];
    v28[1] = v10;
    id v20 = (id)[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

    [*(id *)(a1 + 48) sizeWithAttributes:v20];
    CGRectMake_11();
    double v16 = v6;
    double v17 = v7;
    double v18 = v8;
    double v19 = v9;
    id v11 = (id)[MEMORY[0x263F1C550] systemWhiteColor];
    [v11 setStroke];

    objc_msgSend(*(id *)(a1 + 48), "drawInRect:withAttributes:", v20, v16, v17, v18, v19);
    objc_storeStrong(&v20, 0);
  }
  CGContextTranslateCTM((CGContextRef)[location[0] CGContext], -*(double *)(a1 + 152), -*(double *)(a1 + 160));
  [MEMORY[0x263F1CB00] _setCurrentTraitCollection:v25[0]];
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v25, 0);
  objc_storeStrong(location, 0);
}

+ (CGPath)_createPathForBalloonRadius:(double)a3 tailLength:(double)a4
{
  double v11 = a4 / 4.0;
  double v10 = a4 / 5.0;
  CGFloat v9 = a3 * 2.0;
  double cp2x = 0.448000014 * a3;
  double cp1x = 0.38499999 * a3;
  path = CGPathCreateMutable();
  CGPathMoveToPoint(path, 0, v9, a3);
  double v5 = 3.0;
  CGPathAddCurveToPoint(path, 0, v9, a3 * 1.5, v9 - cp1x, v9 - a4 / 3.0, a3 + a4 / 2.0 + v10, v9);
  CGPathAddCurveToPoint(path, 0, a3 + a4 / v5, v9 + a4 / v5, a3 + v11, v9 + a4, a3, v9 + a4);
  CGPathAddCurveToPoint(path, 0, a3 - v11, v9 + a4, a3 - a4 / v5, v9 + a4 / v5, a3 - (a4 / 2.0 + v10), v9);
  CGPathAddCurveToPoint(path, 0, cp1x, v9 - a4 / 3.0, 0.0, a3 * 1.5, 0.0, a3);
  CGPathAddCurveToPoint(path, 0, 0.0, cp2x, cp2x, 0.0, a3, 0.0);
  CGPathAddCurveToPoint(path, 0, v9 - cp2x, 0.0, v9, cp2x, v9, a3);
  CGPathCloseSubpath(path);
  return path;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (CPImageSet)selectedImageSet
{
  return self->_selectedImageSet;
}

- (void).cxx_destruct
{
}

@end