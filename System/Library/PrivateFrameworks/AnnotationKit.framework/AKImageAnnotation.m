@interface AKImageAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKImageAnnotation)initWithCoder:(id)a3;
- (BOOL)hasShadow;
- (BOOL)horizontallyFlipped;
- (BOOL)verticallyFlipped;
- (CGRect)hitTestBounds;
- (CGRect)rectangle;
- (UIImage)image;
- (double)rotationAngle;
- (id)displayName;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)adjustModelToCompensateForOriginalExif;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setHasShadow:(BOOL)a3;
- (void)setHorizontallyFlipped:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setRectangle:(CGRect)a3;
- (void)setRotationAngle:(double)a3;
- (void)setVerticallyFlipped:(BOOL)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKImageAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKImageAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75F08];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKImageAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75F20];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"rectangle"]) {
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"hasShadow"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Shadow";
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"horizontallyFlipped"]
    || [v4 isEqualToString:@"verticallyFlipped"])
  {
LABEL_6:
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Bounds";
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"image"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Image";
LABEL_7:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_9;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKImageAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_9:

  return v8;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"IMAGE_ANNOTATION_NAME" value:@"Image" table:@"AnnotationStrings"];

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKImageAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75F38];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKImageAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75F50];

  return v4;
}

- (CGRect)hitTestBounds
{
  [(AKImageAnnotation *)self rectangle];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(AKImageAnnotation *)self rotationAngle];

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v4, v6, v8, v10, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)adjustModelToCompensateForOriginalExif
{
  v8.receiver = self;
  v8.super_class = (Class)AKImageAnnotation;
  [(AKAnnotation *)&v8 adjustModelToCompensateForOriginalExif];
  [(AKImageAnnotation *)self rectangle];
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
  -[AKImageAnnotation setRectangle:](self, "setRectangle:");
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:self flatteningOriginalModelExif:a3];
  [(AKImageAnnotation *)self rectangle];
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
  -[AKImageAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    BOOL v7 = [(AKAnnotation *)self isTranslating];
    [(AKAnnotation *)self setIsTranslating:1];
    [(AKImageAnnotation *)self rectangle];
    -[AKImageAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
    [(AKAnnotation *)self setIsTranslating:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AKImageAnnotation;
  id v4 = a3;
  [(AKAnnotation *)&v7 encodeWithCoder:v4];
  [(AKImageAnnotation *)self rectangle];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v8);
  [v4 encodeObject:DictionaryRepresentation forKey:@"rectangle"];
  objc_msgSend(v4, "encodeBool:forKey:", -[AKImageAnnotation hasShadow](self, "hasShadow"), @"hasShadow");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKImageAnnotation verticallyFlipped](self, "verticallyFlipped"), @"verticallyFlipped");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKImageAnnotation horizontallyFlipped](self, "horizontallyFlipped"), @"horizontallyFlipped");
  double v6 = [(AKImageAnnotation *)self image];
  [v4 akEncodeImage:v6 forKey:@"imageAsData"];
}

- (AKImageAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AKImageAnnotation;
  double v5 = [(AKAnnotation *)&v13 initWithCoder:v4];
  if (v5)
  {
    double v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    double v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rectangle"];

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_rectangle);
    -[AKImageAnnotation setHasShadow:](v5, "setHasShadow:", [v4 decodeBoolForKey:@"hasShadow"]);
    -[AKImageAnnotation setVerticallyFlipped:](v5, "setVerticallyFlipped:", [v4 decodeBoolForKey:@"verticallyFlipped"]);
    -[AKImageAnnotation setHorizontallyFlipped:](v5, "setHorizontallyFlipped:", [v4 decodeBoolForKey:@"horizontallyFlipped"]);
    if ([v4 containsValueForKey:@"imageAsData"])
    {
      CGFloat v11 = [v4 akDecodeImageForKey:@"imageAsData"];
      [(AKImageAnnotation *)v5 setImage:v11];
    }
    else
    {
      if (![v4 containsValueForKey:@"image"])
      {
LABEL_8:

        goto LABEL_9;
      }
      CGFloat v11 = os_log_create("com.apple.annotationkit", "Serialization");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_2376DA29C(v11);
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

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 192, 1);
}

- (void)setImage:(id)a3
{
}

- (BOOL)verticallyFlipped
{
  return self->_verticallyFlipped;
}

- (void)setVerticallyFlipped:(BOOL)a3
{
  self->_verticallyFlipped = a3;
}

- (BOOL)horizontallyFlipped
{
  return self->_horizontallyFlipped;
}

- (void)setHorizontallyFlipped:(BOOL)a3
{
  self->_horizontallyFlipped = a3;
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
}

@end