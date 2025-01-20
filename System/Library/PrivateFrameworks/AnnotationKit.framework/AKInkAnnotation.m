@interface AKInkAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKInkAnnotation)initWithCoder:(id)a3;
- (BOOL)shouldBurnIn;
- (CGRect)hitTestBounds;
- (CGRect)rectangle;
- (CGSize)drawingSize;
- (PKDrawing)drawing;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)adjustModelToCompensateForOriginalExif;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setDrawing:(id)a3;
- (void)setDrawingSize:(CGSize)a3;
- (void)setRectangle:(CGRect)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKInkAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKInkAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76088];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKInkAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA760A0];

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
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"drawing"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Drawing";
LABEL_5:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_7;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKInkAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_7:

  return v8;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Drawing_Annotation" value:@"Drawing" table:@"AnnotationStrings"];

  return v3;
}

- (BOOL)shouldBurnIn
{
  return 0;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKInkAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA760B8];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKInkAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA760D0];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (CGRect)hitTestBounds
{
  [(AKInkAnnotation *)self rectangle];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:self];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  uint64_t v15 = v4;
  uint64_t v16 = v6;
  uint64_t v17 = v8;
  uint64_t v18 = v10;

  return CGRectInset(*(CGRect *)&v15, v12, v14);
}

- (void)adjustModelToCompensateForOriginalExif
{
  v8.receiver = self;
  v8.super_class = (Class)AKInkAnnotation;
  [(AKAnnotation *)&v8 adjustModelToCompensateForOriginalExif];
  [(AKInkAnnotation *)self rectangle];
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
  -[AKInkAnnotation setRectangle:](self, "setRectangle:");
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:self flatteningOriginalModelExif:a3];
  [(AKInkAnnotation *)self rectangle];
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
  -[AKInkAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    BOOL v7 = [(AKAnnotation *)self isTranslating];
    [(AKAnnotation *)self setIsTranslating:1];
    [(AKInkAnnotation *)self rectangle];
    -[AKInkAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
    [(AKAnnotation *)self setIsTranslating:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AKInkAnnotation;
  id v4 = a3;
  [(AKAnnotation *)&v9 encodeWithCoder:v4];
  [(AKInkAnnotation *)self rectangle];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v11);
  [v4 encodeObject:DictionaryRepresentation forKey:@"rectangle"];
  uint64_t v6 = [(AKInkAnnotation *)self drawing];
  BOOL v7 = [v6 serialize];

  [v4 encodeObject:v7 forKey:@"drawing"];
  [(AKInkAnnotation *)self drawingSize];
  CFDictionaryRef v8 = CGSizeCreateDictionaryRepresentation(v10);

  [v4 encodeObject:v8 forKey:@"drawingSize"];
}

- (AKInkAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AKInkAnnotation;
  uint64_t v5 = [(AKAnnotation *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rectangle"];

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_rectangle);
    CGRect v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    CGFloat v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    double v14 = [v4 decodeObjectOfClasses:v13 forKey:@"drawing"];

    id v24 = 0;
    CGFloat v15 = (void *)[objc_alloc(MEMORY[0x263F14AE0]) initWithData:v14 error:&v24];
    id v16 = v24;
    if (v16)
    {
      CGRect v17 = os_log_create("com.apple.annotationkit", "Serialization");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_2376DA4B0((uint64_t)v16, v17);
      }
    }
    [(AKInkAnnotation *)v5 setDrawing:v15];
    if ([v4 containsValueForKey:@"drawingSize"])
    {
      CGRect v18 = (void *)MEMORY[0x263EFFA08];
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
      CFDictionaryRef v22 = [v4 decodeObjectOfClasses:v21 forKey:@"drawingSize"];

      CGSizeMakeWithDictionaryRepresentation(v22, &v5->_drawingSize);
    }
  }
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

- (PKDrawing)drawing
{
  return (PKDrawing *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDrawing:(id)a3
{
}

- (CGSize)drawingSize
{
  objc_copyStruct(v4, &self->_drawingSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setDrawingSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_drawingSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
}

@end