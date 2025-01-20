@interface AKCropAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKCropAnnotation)init;
- (AKCropAnnotation)initWithCoder:(id)a3;
- (BOOL)cropApplied;
- (BOOL)hidden;
- (BOOL)showHandles;
- (CGColor)color;
- (CGRect)hitTestBounds;
- (CGRect)rectangle;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)adjustModelToCompensateForOriginalExif;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setColor:(CGColor *)a3;
- (void)setCropApplied:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setRectangle:(CGRect)a3;
- (void)setShowHandles:(BOOL)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKCropAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKCropAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75E48];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKCropAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75E60];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"rectangle"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Cropped Area";
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"hidden"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Hidden";
LABEL_5:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_7;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKCropAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_7:

  return v8;
}

- (AKCropAnnotation)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKCropAnnotation;
  v2 = [(AKAnnotation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(AKCropAnnotation *)v2 setHidden:1];
    [(AKCropAnnotation *)v3 setCropApplied:0];
    id v4 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
    -[AKCropAnnotation setColor:](v3, "setColor:", [v4 CGColor]);
  }
  return v3;
}

- (void)dealloc
{
  color = self->_color;
  if (color) {
    CGColorRelease(color);
  }
  v4.receiver = self;
  v4.super_class = (Class)AKCropAnnotation;
  [(AKAnnotation *)&v4 dealloc];
}

- (void)setColor:(CGColor *)a3
{
  color = self->_color;
  if (color) {
    CGColorRelease(color);
  }
  self->_color = CGColorRetain(a3);
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Crop" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKCropAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForUndo];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75E78];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKCropAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75E90];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKCropAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForAdornments];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75EA8];

  return v4;
}

- (CGRect)hitTestBounds
{
  double v2 = *MEMORY[0x263F00190];
  double v3 = *(double *)(MEMORY[0x263F00190] + 8);
  double v4 = *(double *)(MEMORY[0x263F00190] + 16);
  double v5 = *(double *)(MEMORY[0x263F00190] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)adjustModelToCompensateForOriginalExif
{
  v8.receiver = self;
  v8.super_class = (Class)AKCropAnnotation;
  [(AKAnnotation *)&v8 adjustModelToCompensateForOriginalExif];
  [(AKCropAnnotation *)self rectangle];
  double x = v9.origin.x;
  double y = v9.origin.y;
  double width = v9.size.width;
  double height = v9.size.height;
  if (!CGRectIsInfinite(v9))
  {
    v10.origin.double x = x;
    v10.origin.double y = y;
    v10.size.double width = width;
    v10.size.double height = height;
    double MidX = CGRectGetMidX(v10);
    v11.origin.double x = x;
    v11.origin.double y = y;
    v11.size.double width = width;
    v11.size.double height = height;
    +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:[(AKAnnotation *)self originalExifOrientation]], x, y, width, height, MidX, CGRectGetMidY(v11));
    -[AKCropAnnotation setRectangle:](self, "setRectangle:");
  }
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:self flatteningOriginalModelExif:a3];
  [(AKCropAnnotation *)self rectangle];
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
  -[AKCropAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    [(AKCropAnnotation *)self rectangle];
    double v8 = x + v7;
    double v10 = y + v9;
    -[AKCropAnnotation setRectangle:](self, "setRectangle:", v8, v10);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKCropAnnotation;
  id v4 = a3;
  [(AKAnnotation *)&v6 encodeWithCoder:v4];
  [(AKCropAnnotation *)self rectangle];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v7);
  [v4 encodeObject:DictionaryRepresentation forKey:@"rectangle"];
}

- (AKCropAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKCropAnnotation;
  double v5 = [(AKAnnotation *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    double v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rectangle"];

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_rectangle);
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

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)cropApplied
{
  return self->_cropApplied;
}

- (void)setCropApplied:(BOOL)a3
{
  self->_cropApplied = a3;
}

- (BOOL)showHandles
{
  return self->_showHandles;
}

- (void)setShowHandles:(BOOL)a3
{
  self->_showHandles = a3;
}

- (CGColor)color
{
  return self->_color;
}

@end