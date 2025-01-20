@interface AKArrowAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKArrowAnnotation)init;
- (AKArrowAnnotation)initWithCoder:(id)a3;
- (CGPoint)endPoint;
- (CGPoint)midPoint;
- (CGPoint)startPoint;
- (CGRect)hitTestBounds;
- (NSDictionary)typingAttributes;
- (NSTextStorage)annotationText;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (unint64_t)arrowHeadStyle;
- (void)adjustModelToCompensateForOriginalExif;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setAnnotationText:(id)a3;
- (void)setArrowHeadStyle:(unint64_t)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setMidPoint:(CGPoint)a3;
- (void)setStartPoint:(CGPoint)a3;
- (void)setTypingAttributes:(id)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKArrowAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKArrowAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75BC0];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKArrowAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75BD8];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"startPoint"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Start Point";
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"endPoint"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"End Point";
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"midPoint"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Mid Point";
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"arrowHeadStyle"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Line Style";
    goto LABEL_12;
  }
  if (([v4 isEqualToString:@"annotationText"] & 1) != 0
    || [v4 isEqualToString:@"typingAttributes"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Text";
LABEL_12:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_14;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKArrowAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_14:

  return v8;
}

- (AKArrowAnnotation)init
{
  v5.receiver = self;
  v5.super_class = (Class)AKArrowAnnotation;
  v2 = [(AKAnnotation *)&v5 init];
  if (v2)
  {
    v3 = [NSDictionary dictionary];
    [(AKArrowAnnotation *)v2 setTypingAttributes:v3];
  }
  return v2;
}

- (id)displayName
{
  unint64_t v2 = [(AKArrowAnnotation *)self arrowHeadStyle];
  v3 = +[AKController akBundle];
  id v4 = v3;
  if (v2) {
    objc_super v5 = @"Arrow Line";
  }
  else {
    objc_super v5 = @"Line";
  }
  objc_super v6 = [v3 localizedStringForKey:v5 value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v6;
}

- (id)keysForValuesToObserveForUndo
{
  unint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKArrowAnnotation;
  v3 = [(AKShapeAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75BF0];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  unint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKArrowAnnotation;
  v3 = [(AKShapeAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75C08];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  unint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKArrowAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForAdornments];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75C20];

  return v4;
}

- (CGRect)hitTestBounds
{
  [(AKArrowAnnotation *)self startPoint];
  double v4 = v3;
  double v35 = v3;
  double v6 = v5;
  [(AKArrowAnnotation *)self endPoint];
  double v8 = v7;
  double v10 = v9;
  [(AKArrowAnnotation *)self midPoint];
  double v12 = v11;
  double v14 = v13;
  double v15 = v8 - v4;
  double v16 = hypot(v8 - v4, v10 - v6);
  double v17 = hypot(v8 - v12, v10 - v14);
  if (v16 >= v17) {
    double v17 = v16;
  }
  CGFloat v18 = -v17;
  +[AKGeometryHelper expandCGRect:toContainPoint:](AKGeometryHelper, "expandCGRect:toContainPoint:", v35, v6, v15, v10 - v6, v12, v14);
  CGRect v37 = CGRectStandardize(v36);
  CGRect v38 = CGRectInset(v37, v18, v18);
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  uint64_t v23 = [(AKArrowAnnotation *)self annotationText];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(AKArrowAnnotation *)self annotationText];
    uint64_t v26 = [v25 length];

    if (v26)
    {
      +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", self, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      v42.origin.CGFloat x = v27;
      v42.origin.CGFloat y = v28;
      v42.size.CGFloat width = v29;
      v42.size.CGFloat height = v30;
      v39.origin.CGFloat x = x;
      v39.origin.CGFloat y = y;
      v39.size.CGFloat width = width;
      v39.size.CGFloat height = height;
      CGRect v40 = CGRectUnion(v39, v42);
      CGFloat x = v40.origin.x;
      CGFloat y = v40.origin.y;
      CGFloat width = v40.size.width;
      CGFloat height = v40.size.height;
    }
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (void)adjustModelToCompensateForOriginalExif
{
  v30.receiver = self;
  v30.super_class = (Class)AKArrowAnnotation;
  [(AKAnnotation *)&v30 adjustModelToCompensateForOriginalExif];
  [(AKArrowAnnotation *)self startPoint];
  double v4 = v3;
  double v6 = v5;
  [(AKArrowAnnotation *)self endPoint];
  double v8 = v7;
  double v10 = v9;
  [(AKArrowAnnotation *)self midPoint];
  double v12 = v11;
  double v14 = v13;
  double v15 = v4 + (v8 - v4) * 0.5;
  double v16 = v6 + (v10 - v6) * 0.5;
  int64_t v17 = +[AKGeometryHelper inverseExifOrientation:[(AKAnnotation *)self originalExifOrientation]];
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v17, v4, v6, v15, v16);
  double v19 = v18;
  double v21 = v20;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v17, v8, v10, v15, v16);
  double v23 = v22;
  double v25 = v24;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v17, v12, v14, v15, v16);
  double v27 = v26;
  double v29 = v28;
  -[AKArrowAnnotation setStartPoint:](self, "setStartPoint:", v19, v21);
  -[AKArrowAnnotation setEndPoint:](self, "setEndPoint:", v23, v25);
  -[AKArrowAnnotation setMidPoint:](self, "setMidPoint:", v27, v29);
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:self flatteningOriginalModelExif:a3];
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  [(AKArrowAnnotation *)self startPoint];
  double v9 = v8;
  double v11 = v10;
  [(AKArrowAnnotation *)self endPoint];
  double v13 = v12;
  double v15 = v14;
  [(AKArrowAnnotation *)self midPoint];
  double v16 = v11 * 0.0 + 0.0 * v9 + 0.0;
  double v17 = v15 * 0.0 + 0.0 * v13 + 0.0;
  double v20 = v18 * 0.0 + 0.0 * v19 + 0.0;
  -[AKArrowAnnotation setStartPoint:](self, "setStartPoint:", v16, v16);
  -[AKArrowAnnotation setEndPoint:](self, "setEndPoint:", v17, v17);
  -[AKArrowAnnotation setMidPoint:](self, "setMidPoint:", v20, v20);
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    BOOL v7 = [(AKAnnotation *)self isTranslating];
    [(AKAnnotation *)self setIsTranslating:1];
    [(AKArrowAnnotation *)self startPoint];
    double v9 = v8;
    double v11 = v10;
    [(AKArrowAnnotation *)self endPoint];
    double v13 = v12;
    double v15 = v14;
    [(AKArrowAnnotation *)self midPoint];
    double v16 = x + v9;
    double v17 = y + v11;
    double v18 = x + v13;
    double v19 = y + v15;
    double v21 = x + v20;
    double v23 = y + v22;
    -[AKArrowAnnotation setStartPoint:](self, "setStartPoint:", v16, v17);
    -[AKArrowAnnotation setEndPoint:](self, "setEndPoint:", v18, v19);
    -[AKArrowAnnotation setMidPoint:](self, "setMidPoint:", v21, v23);
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
  v8.super_class = (Class)AKArrowAnnotation;
  id v4 = a3;
  [(AKShapeAnnotation *)&v8 encodeWithCoder:v4];
  [(AKArrowAnnotation *)self startPoint];
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v9);
  [v4 encodeObject:DictionaryRepresentation forKey:@"startPoint"];
  [(AKArrowAnnotation *)self endPoint];
  CFDictionaryRef v6 = CGPointCreateDictionaryRepresentation(v10);

  [v4 encodeObject:v6 forKey:@"endPoint"];
  [(AKArrowAnnotation *)self midPoint];
  CFDictionaryRef v7 = CGPointCreateDictionaryRepresentation(v11);

  [v4 encodeObject:v7 forKey:@"midPoint"];
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKArrowAnnotation arrowHeadStyle](self, "arrowHeadStyle"), @"arrowHeadStyle");
  +[AKSecureSerializationHelper encodeTextPropertiesOfAnnotation:self withCoder:v4];
}

- (AKArrowAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AKArrowAnnotation;
  double v5 = [(AKShapeAnnotation *)&v28 initWithCoder:v4];
  if (v5)
  {
    CFDictionaryRef v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    CGPoint v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"startPoint"];

    CGPointMakeWithDictionaryRepresentation(v10, &v5->_startPoint);
    CGPoint v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    double v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    CFDictionaryRef v15 = [v4 decodeObjectOfClasses:v14 forKey:@"endPoint"];

    CGPointMakeWithDictionaryRepresentation(v15, &v5->_endPoint);
    double v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    double v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    CFDictionaryRef v20 = [v4 decodeObjectOfClasses:v19 forKey:@"midPoint"];

    p_midPoint = &v5->_midPoint;
    if (v20)
    {
      CGPointMakeWithDictionaryRepresentation(v20, p_midPoint);
    }
    else
    {
      __asm { FMOV            V1.2D, #0.5 }
      *(float64x2_t *)p_midPoint = vmulq_f64(vaddq_f64((float64x2_t)v5->_startPoint, (float64x2_t)v5->_endPoint), _Q1);
    }
    -[AKArrowAnnotation setArrowHeadStyle:](v5, "setArrowHeadStyle:", [v4 decodeIntegerForKey:@"arrowHeadStyle"]);
    +[AKSecureSerializationHelper decodeTextPropertiesOfAnnotation:v5 withSecureCoder:v4];
  }
  return v5;
}

- (CGPoint)startPoint
{
  objc_copyStruct(v4, &self->_startPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_startPoint, &v3, 16, 1, 0);
}

- (CGPoint)endPoint
{
  objc_copyStruct(v4, &self->_endPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_endPoint, &v3, 16, 1, 0);
}

- (CGPoint)midPoint
{
  objc_copyStruct(v4, &self->_midPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setMidPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_midPoint, &v3, 16, 1, 0);
}

- (unint64_t)arrowHeadStyle
{
  return self->_arrowHeadStyle;
}

- (void)setArrowHeadStyle:(unint64_t)a3
{
  self->_arrowHeadStyle = a3;
}

- (NSTextStorage)annotationText
{
  return (NSTextStorage *)objc_getProperty(self, a2, 232, 1);
}

- (void)setAnnotationText:(id)a3
{
}

- (NSDictionary)typingAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTypingAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingAttributes, 0);

  objc_storeStrong((id *)&self->_annotationText, 0);
}

@end