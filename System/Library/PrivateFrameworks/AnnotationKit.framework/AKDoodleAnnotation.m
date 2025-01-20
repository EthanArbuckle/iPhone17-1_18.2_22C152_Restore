@interface AKDoodleAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKDoodleAnnotation)initWithCoder:(id)a3;
- (BOOL)hasShadow;
- (BOOL)isDashed;
- (BOOL)pathIsDot;
- (BOOL)pathIsPrestroked;
- (CGRect)hitTestBounds;
- (CGRect)rectangle;
- (UIBezierPath)path;
- (UIColor)strokeColor;
- (double)rotationAngle;
- (double)strokeWidth;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (int64_t)brushStyle;
- (void)adjustModelToCompensateForOriginalExif;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setBrushStyle:(int64_t)a3;
- (void)setDashed:(BOOL)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)setPathIsDot:(BOOL)a3;
- (void)setPathIsPrestroked:(BOOL)a3;
- (void)setRectangle:(CGRect)a3;
- (void)setRotationAngle:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKDoodleAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKDoodleAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76010];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKDoodleAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76028];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"rectangle"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Bounds";
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"path"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Doodle Shape";
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"strokeWidth"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Line Width";
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"strokeColor"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Color";
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"dashed"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Dashed";
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"hasShadow"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Shadow";
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"brushStyle"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Brush Style";
LABEL_15:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_17;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKDoodleAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_17:

  return v8;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Doodle" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKDoodleAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76040];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKDoodleAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76058];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKDoodleAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForAdornments];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76070];

  return v4;
}

- (CGRect)hitTestBounds
{
  [(AKDoodleAnnotation *)self rectangle];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:self];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v10;
  CGRect v32 = CGRectInset(v31, v12, v14);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  [(AKDoodleAnnotation *)self strokeWidth];
  CGFloat v20 = v19 * -0.5;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRect v34 = CGRectInset(v33, v20, v20);
  double v21 = v34.origin.x;
  double v22 = v34.origin.y;
  double v23 = v34.size.width;
  double v24 = v34.size.height;
  [(AKDoodleAnnotation *)self rotationAngle];

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v21, v22, v23, v24, v25);
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (void)adjustModelToCompensateForOriginalExif
{
  v8.receiver = self;
  v8.super_class = (Class)AKDoodleAnnotation;
  [(AKAnnotation *)&v8 adjustModelToCompensateForOriginalExif];
  [(AKDoodleAnnotation *)self rectangle];
  double x = v9.origin.x;
  double y = v9.origin.y;
  double width = v9.size.width;
  double height = v9.size.height;
  double MidX = CGRectGetMidX(v9);
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:[(AKAnnotation *)self originalExifOrientation]], x, y, width, height, MidX, CGRectGetMidY(v10));
  -[AKDoodleAnnotation setRectangle:](self, "setRectangle:");
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:self flatteningOriginalModelExif:a3];
  [(AKDoodleAnnotation *)self rectangle];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  memset(&v16[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  v16[0] = v16[1];
  v17.origin.double x = v9;
  v17.origin.double y = v11;
  v17.size.double width = v13;
  v17.size.double height = v15;
  CGRect v18 = CGRectApplyAffineTransform(v17, v16);
  -[AKDoodleAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    BOOL v7 = [(AKAnnotation *)self isTranslating];
    [(AKAnnotation *)self setIsTranslating:1];
    [(AKDoodleAnnotation *)self rectangle];
    -[AKDoodleAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
    [(AKAnnotation *)self setIsTranslating:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AKDoodleAnnotation;
  id v4 = a3;
  [(AKAnnotation *)&v10 encodeWithCoder:v4];
  [(AKDoodleAnnotation *)self rectangle];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v11);
  [v4 encodeObject:DictionaryRepresentation forKey:@"rectangle"];
  CGFloat v6 = [(AKDoodleAnnotation *)self path];
  BOOL v7 = (const CGPath *)[v6 newCGPathForPlatformBezierPath];

  double v8 = [MEMORY[0x263EFF8F8] encodeCGPath:v7];
  [v4 encodeObject:v8 forKey:@"path"];
  CGPathRelease(v7);
  double v9 = [(AKDoodleAnnotation *)self strokeColor];
  [v4 akEncodeColor:v9 forKey:@"strokeColorString"];

  [(AKDoodleAnnotation *)self strokeWidth];
  objc_msgSend(v4, "encodeDouble:forKey:", @"strokeWidth");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKDoodleAnnotation isDashed](self, "isDashed"), @"dashed");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKDoodleAnnotation hasShadow](self, "hasShadow"), @"hasShadow");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKDoodleAnnotation brushStyle](self, "brushStyle"), @"brushStyle");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKDoodleAnnotation pathIsPrestroked](self, "pathIsPrestroked"), @"pathIsPrestroked");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKDoodleAnnotation pathIsDot](self, "pathIsDot"), @"pathIsDot");
}

- (AKDoodleAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AKDoodleAnnotation;
  double v5 = [(AKAnnotation *)&v20 initWithCoder:v4];
  if (v5)
  {
    CGFloat v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    double v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rectangle"];

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_rectangle);
    CGRect v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    uint64_t v12 = [MEMORY[0x263EFF8F8] newCGPathDecodedFromData:v11];
    if (v12)
    {
      CGFloat v13 = (const CGPath *)v12;
      double v14 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v12];
      [(AKDoodleAnnotation *)v5 setPath:v14];

      CGPathRelease(v13);
    }
    if ([v4 containsValueForKey:@"pathIsPrestroked"]) {
      uint64_t v15 = [v4 decodeBoolForKey:@"pathIsPrestroked"];
    }
    else {
      uint64_t v15 = 0;
    }
    [(AKDoodleAnnotation *)v5 setPathIsPrestroked:v15];
    if ([v4 containsValueForKey:@"pathIsDot"]) {
      uint64_t v16 = [v4 decodeBoolForKey:@"pathIsDot"];
    }
    else {
      uint64_t v16 = 0;
    }
    [(AKDoodleAnnotation *)v5 setPathIsDot:v16];
    if ([v4 containsValueForKey:@"strokeColorString"])
    {
      CGRect v17 = [v4 akDecodeColorForKey:@"strokeColorString"];
      [(AKDoodleAnnotation *)v5 setStrokeColor:v17];
    }
    else
    {
      if (![v4 containsValueForKey:@"strokeColor"])
      {
LABEL_16:
        [v4 decodeDoubleForKey:@"strokeWidth"];
        -[AKDoodleAnnotation setStrokeWidth:](v5, "setStrokeWidth:");
        -[AKDoodleAnnotation setDashed:](v5, "setDashed:", [v4 decodeBoolForKey:@"dashed"]);
        -[AKDoodleAnnotation setHasShadow:](v5, "setHasShadow:", [v4 decodeBoolForKey:@"hasShadow"]);
        -[AKDoodleAnnotation setBrushStyle:](v5, "setBrushStyle:", [v4 decodeIntegerForKey:@"brushStyle"]);

        goto LABEL_17;
      }
      CGRect v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"strokeColor"];
      if (v17)
      {
        CGRect v18 = [MEMORY[0x263F1C550] akColorWithCIColor:v17];
        [(AKDoodleAnnotation *)v5 setStrokeColor:v18];
      }
    }

    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

- (CGRect)rectangle
{
  objc_copyStruct(v6, &self->_rectangle, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_rectangle, &v3, 32, 1, 0);
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (UIColor)strokeColor
{
  return (UIColor *)objc_getProperty(self, a2, 208, 1);
}

- (void)setStrokeColor:(id)a3
{
}

- (BOOL)isDashed
{
  return self->_dashed;
}

- (void)setDashed:(BOOL)a3
{
  self->_dashed = a3;
}

- (int64_t)brushStyle
{
  return self->_brushStyle;
}

- (void)setBrushStyle:(int64_t)a3
{
  self->_brushStyle = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (UIBezierPath)path
{
  return (UIBezierPath *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPath:(id)a3
{
}

- (BOOL)pathIsPrestroked
{
  return self->_pathIsPrestroked;
}

- (void)setPathIsPrestroked:(BOOL)a3
{
  self->_pathIsPrestroked = a3;
}

- (BOOL)pathIsDot
{
  return self->_pathIsDot;
}

- (void)setPathIsDot:(BOOL)a3
{
  self->_pathIsDot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end