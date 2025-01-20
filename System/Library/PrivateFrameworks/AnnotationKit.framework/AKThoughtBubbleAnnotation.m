@interface AKThoughtBubbleAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKThoughtBubbleAnnotation)initWithCoder:(id)a3;
- (CGPoint)pointyBitPoint;
- (CGRect)hitTestBounds;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)adjustModelToCompensateForOriginalExif;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setPointyBitPoint:(CGPoint)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKThoughtBubbleAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKThoughtBubbleAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA759F8];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKThoughtBubbleAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75A10];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:@"pointyBitPoint"]
    || (+[AKController akBundle],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 localizedStringForKey:@"Thought Bubble Tail" value:&stru_26EA57918 table:@"AnnotationStrings"], objc_super v6 = objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKThoughtBubbleAnnotation;
    objc_super v6 = objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
  }

  return v6;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Thought Bubble" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKThoughtBubbleAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75A28];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKThoughtBubbleAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75A40];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKThoughtBubbleAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForAdornments];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75A58];

  return v4;
}

- (CGRect)hitTestBounds
{
  [(AKRectangularShapeAnnotation *)self rectangle];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:self];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v41.origin.double x = v4;
  v41.origin.double y = v6;
  v41.size.double width = v8;
  v41.size.double height = v10;
  CGRect v42 = CGRectInset(v41, v12, v14);
  double x = v42.origin.x;
  double y = v42.origin.y;
  double width = v42.size.width;
  double height = v42.size.height;
  [(AKThoughtBubbleAnnotation *)self pointyBitPoint];
  +[AKGeometryHelper expandCGRect:toContainPoint:](AKGeometryHelper, "expandCGRect:toContainPoint:", x, y, width, height, v19, v20);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  [(AKStrokedAnnotation *)self strokeWidth];
  CGFloat v30 = v29 * -0.5;
  v43.origin.double x = v22;
  v43.origin.double y = v24;
  v43.size.double width = v26;
  v43.size.double height = v28;
  CGRect v44 = CGRectInset(v43, v30, v30);
  double v31 = v44.origin.x;
  double v32 = v44.origin.y;
  double v33 = v44.size.width;
  double v34 = v44.size.height;
  [(AKRectangularShapeAnnotation *)self rotationAngle];

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v31, v32, v33, v34, v35);
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (void)adjustModelToCompensateForOriginalExif
{
  v12.receiver = self;
  v12.super_class = (Class)AKThoughtBubbleAnnotation;
  [(AKRectangularShapeAnnotation *)&v12 adjustModelToCompensateForOriginalExif];
  [(AKThoughtBubbleAnnotation *)self pointyBitPoint];
  double v4 = v3;
  double v6 = v5;
  [(AKRectangularShapeAnnotation *)self rectangle];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:[(AKAnnotation *)self originalExifOrientation]], v4, v6, MidX, CGRectGetMidY(v14));
  -[AKThoughtBubbleAnnotation setPointyBitPoint:](self, "setPointyBitPoint:");
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v12.receiver = self;
  v12.super_class = (Class)AKThoughtBubbleAnnotation;
  -[AKRectangularShapeAnnotation flattenModelExifOrientation:withModelSize:](&v12, sel_flattenModelExifOrientation_withModelSize_);
  [(AKThoughtBubbleAnnotation *)self pointyBitPoint];
  double v10 = v9;
  double v11 = v8;
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  [(AKThoughtBubbleAnnotation *)self setPointyBitPoint:vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v10), (float64x2_t)0, v11))];
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    BOOL v7 = [(AKAnnotation *)self isTranslating];
    [(AKAnnotation *)self setIsTranslating:1];
    v10.receiver = self;
    v10.super_class = (Class)AKThoughtBubbleAnnotation;
    -[AKRectangularShapeAnnotation translateBy:](&v10, sel_translateBy_, x, y);
    [(AKThoughtBubbleAnnotation *)self pointyBitPoint];
    -[AKThoughtBubbleAnnotation setPointyBitPoint:](self, "setPointyBitPoint:", x + v8, y + v9);
    [(AKAnnotation *)self setIsTranslating:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKThoughtBubbleAnnotation;
  id v4 = a3;
  [(AKRectangularShapeAnnotation *)&v6 encodeWithCoder:v4];
  [(AKThoughtBubbleAnnotation *)self pointyBitPoint];
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v7);
  [v4 encodeObject:DictionaryRepresentation forKey:@"pointyBitPoint"];
}

- (AKThoughtBubbleAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKThoughtBubbleAnnotation;
  double v5 = [(AKRectangularShapeAnnotation *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    double v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"pointyBitPoint"];

    CGPointMakeWithDictionaryRepresentation(v10, &v5->_pointyBitPoint);
  }

  return v5;
}

- (CGPoint)pointyBitPoint
{
  objc_copyStruct(v4, &self->_pointyBitPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setPointyBitPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_pointyBitPoint, &v3, 16, 1, 0);
}

@end