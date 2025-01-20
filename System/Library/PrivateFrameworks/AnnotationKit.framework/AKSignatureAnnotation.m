@interface AKSignatureAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKSignature)signature;
- (AKSignatureAnnotation)initWithCoder:(id)a3;
- (BOOL)shouldBurnIn;
- (CGRect)hitTestBounds;
- (CGRect)rectangle;
- (UIColor)strokeColor;
- (double)rotationAngle;
- (id)displayName;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)adjustModelToCompensateForOriginalExif;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setRectangle:(CGRect)a3;
- (void)setRotationAngle:(double)a3;
- (void)setSignature:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKSignatureAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKSignatureAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75998];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKSignatureAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA759B0];

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
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"signature"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Signature Shape";
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"strokeColor"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Signature Color";
LABEL_7:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_9;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKSignatureAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_9:

  return v8;
}

- (id)displayName
{
  v3 = [(AKSignatureAnnotation *)self signature];
  uint64_t v4 = [v3 descriptionTag];

  if (v4)
  {
    v5 = [(AKSignatureAnnotation *)self signature];
    if (v4 == -1) {
      [v5 customDescription];
    }
    else {
    uint64_t v6 = +[AKSignatureDescription stringValueForSignatureDescriptionTag:](AKSignatureDescription, "stringValueForSignatureDescriptionTag:", [v5 descriptionTag]);
    }
  }
  else
  {
    v5 = +[AKController akBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"Signature" value:&stru_26EA57918 table:@"AnnotationStrings"];
  }
  v7 = (void *)v6;

  return v7;
}

- (BOOL)shouldBurnIn
{
  return 1;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKSignatureAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForUndo];
  uint64_t v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA759C8];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKSignatureAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  uint64_t v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA759E0];

  return v4;
}

- (CGRect)hitTestBounds
{
  [(AKSignatureAnnotation *)self rectangle];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:self];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  CGRect v26 = CGRectInset(v25, v12, v14);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  [(AKSignatureAnnotation *)self rotationAngle];

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v19);
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)adjustModelToCompensateForOriginalExif
{
  v8.receiver = self;
  v8.super_class = (Class)AKSignatureAnnotation;
  [(AKAnnotation *)&v8 adjustModelToCompensateForOriginalExif];
  [(AKSignatureAnnotation *)self rectangle];
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
  -[AKSignatureAnnotation setRectangle:](self, "setRectangle:");
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:self flatteningOriginalModelExif:a3];
  [(AKSignatureAnnotation *)self rectangle];
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
  -[AKSignatureAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    BOOL v7 = [(AKAnnotation *)self isTranslating];
    [(AKAnnotation *)self setIsTranslating:1];
    [(AKSignatureAnnotation *)self rectangle];
    -[AKSignatureAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
    [(AKAnnotation *)self setIsTranslating:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKSignatureAnnotation;
  id v4 = a3;
  [(AKAnnotation *)&v8 encodeWithCoder:v4];
  [(AKSignatureAnnotation *)self rectangle];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v9);
  [v4 encodeObject:DictionaryRepresentation forKey:@"rectangle"];
  CGFloat v6 = [(AKSignatureAnnotation *)self signature];
  [v4 encodeObject:v6 forKey:@"signature"];

  BOOL v7 = [(AKSignatureAnnotation *)self strokeColor];
  [v4 akEncodeColor:v7 forKey:@"strokeColorString"];
}

- (AKSignatureAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKSignatureAnnotation;
  double v5 = [(AKAnnotation *)&v15 initWithCoder:v4];
  if (v5)
  {
    CGFloat v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    CGRect v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rectangle"];

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_rectangle);
    CGFloat v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    [(AKSignatureAnnotation *)v5 setSignature:v11];

    if ([v4 containsValueForKey:@"strokeColorString"])
    {
      double v12 = [v4 akDecodeColorForKey:@"strokeColorString"];
      [(AKSignatureAnnotation *)v5 setStrokeColor:v12];
    }
    else
    {
      if (![v4 containsValueForKey:@"strokeColor"])
      {
LABEL_8:

        goto LABEL_9;
      }
      double v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"strokeColor"];
      if (v12)
      {
        CGFloat v13 = [MEMORY[0x263F1C550] akColorWithCIColor:v12];
        [(AKSignatureAnnotation *)v5 setStrokeColor:v13];
      }
    }

    goto LABEL_8;
  }
LABEL_9:

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

- (AKSignature)signature
{
  return (AKSignature *)objc_getProperty(self, a2, 184, 1);
}

- (void)setSignature:(id)a3
{
}

- (UIColor)strokeColor
{
  return (UIColor *)objc_getProperty(self, a2, 192, 1);
}

- (void)setStrokeColor:(id)a3
{
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_signature, 0);
}

@end