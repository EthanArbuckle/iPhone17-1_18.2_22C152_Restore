@interface AKRectangularShapeAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKRectangularShapeAnnotation)init;
- (AKRectangularShapeAnnotation)initWithCoder:(id)a3;
- (BOOL)isHighlighted;
- (CGRect)rectangle;
- (NSDictionary)typingAttributes;
- (NSTextStorage)annotationText;
- (UIColor)highlightColor;
- (double)rotationAngle;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (unint64_t)maximumNumberOfCharacters;
- (void)adjustModelToCompensateForOriginalExif;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setAnnotationText:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaximumNumberOfCharacters:(unint64_t)a3;
- (void)setRectangle:(CGRect)a3;
- (void)setRotationAngle:(double)a3;
- (void)setTypingAttributes:(id)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKRectangularShapeAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKRectangularShapeAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75DA0];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKRectangularShapeAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75DB8];

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
    goto LABEL_6;
  }
  if (([v4 isEqualToString:@"annotationText"] & 1) != 0
    || [v4 isEqualToString:@"typingAttributes"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Text";
LABEL_6:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_8;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKRectangularShapeAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_8:

  return v8;
}

- (AKRectangularShapeAnnotation)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  v2 = [(AKAnnotation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(AKAnnotation *)v2 setTextIsFixedWidth:1];
    [(AKAnnotation *)v3 setTextIsFixedHeight:1];
    id v4 = [NSDictionary dictionary];
    [(AKRectangularShapeAnnotation *)v3 setTypingAttributes:v4];
  }
  return v3;
}

- (id)displayName
{
  v4.receiver = self;
  v4.super_class = (Class)AKRectangularShapeAnnotation;
  v2 = [(AKShapeAnnotation *)&v4 displayName];

  return v2;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  v3 = [(AKShapeAnnotation *)&v6 keysForValuesToObserveForUndo];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75DD0];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  v3 = [(AKShapeAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75DE8];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForAdornments];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75E00];

  return v4;
}

- (void)adjustModelToCompensateForOriginalExif
{
  v8.receiver = self;
  v8.super_class = (Class)AKRectangularShapeAnnotation;
  [(AKAnnotation *)&v8 adjustModelToCompensateForOriginalExif];
  [(AKRectangularShapeAnnotation *)self rectangle];
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
  -[AKRectangularShapeAnnotation setRectangle:](self, "setRectangle:");
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:self flatteningOriginalModelExif:a3];
  [(AKRectangularShapeAnnotation *)self rectangle];
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
  -[AKRectangularShapeAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    BOOL v7 = [(AKAnnotation *)self isTranslating];
    [(AKAnnotation *)self setIsTranslating:1];
    [(AKRectangularShapeAnnotation *)self rectangle];
    -[AKRectangularShapeAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
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
  v6.super_class = (Class)AKRectangularShapeAnnotation;
  id v4 = a3;
  [(AKShapeAnnotation *)&v6 encodeWithCoder:v4];
  [(AKRectangularShapeAnnotation *)self rectangle];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v7);
  [v4 encodeObject:DictionaryRepresentation forKey:@"rectangle"];
  +[AKSecureSerializationHelper encodeTextPropertiesOfAnnotation:self withCoder:v4];
}

- (AKRectangularShapeAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKRectangularShapeAnnotation;
  v5 = [(AKShapeAnnotation *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    double v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rectangle"];

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_rectangle);
    +[AKSecureSerializationHelper decodeTextPropertiesOfAnnotation:v5 withSecureCoder:v4];
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

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (unint64_t)maximumNumberOfCharacters
{
  return self->_maximumNumberOfCharacters;
}

- (void)setMaximumNumberOfCharacters:(unint64_t)a3
{
  self->_maximumNumberOfCharacters = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_typingAttributes, 0);

  objc_storeStrong((id *)&self->_annotationText, 0);
}

@end