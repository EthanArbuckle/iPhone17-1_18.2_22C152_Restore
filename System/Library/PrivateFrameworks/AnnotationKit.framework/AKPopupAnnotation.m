@interface AKPopupAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKAnnotation)parentAnnotation;
- (AKPopupAnnotation)initWithCoder:(id)a3;
- (CGRect)openRectangle;
- (CGRect)rectangle;
- (NSString)contents;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForUndo;
- (int64_t)visualStyle;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setContents:(id)a3;
- (void)setOpenRectangle:(CGRect)a3;
- (void)setParentAnnotation:(id)a3;
- (void)setRectangle:(CGRect)a3;
- (void)setVisualStyle:(int64_t)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKPopupAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKPopupAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76268];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKPopupAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForAdornments];
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76280];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"rectangle"] & 1) != 0
    || [v4 isEqualToString:@"openRectangle"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Bounds";
    goto LABEL_4;
  }
  if ([v4 isEqualToString:@"contents"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Contents";
LABEL_4:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_9;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKPopupAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_9:

  return v8;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKPopupAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76298];

  return v4;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Popup" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:self flatteningOriginalModelExif:a3];
  [(AKPopupAnnotation *)self rectangle];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  memset(&v16[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  v16[0] = v16[1];
  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.double width = v13;
  v17.size.double height = v15;
  CGRect v18 = CGRectApplyAffineTransform(v17, v16);
  -[AKPopupAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    BOOL v7 = [(AKAnnotation *)self isTranslating];
    [(AKAnnotation *)self setIsTranslating:1];
    [(AKPopupAnnotation *)self rectangle];
    -[AKPopupAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
    [(AKPopupAnnotation *)self openRectangle];
    -[AKPopupAnnotation setOpenRectangle:](self, "setOpenRectangle:", x + v10, y + v11);
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
  v8.super_class = (Class)AKPopupAnnotation;
  id v4 = a3;
  [(AKAnnotation *)&v8 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKPopupAnnotation visualStyle](self, "visualStyle", v8.receiver, v8.super_class), @"visualStyle");
  [(AKPopupAnnotation *)self rectangle];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v9);
  [v4 encodeObject:DictionaryRepresentation forKey:@"rectangle"];
  [(AKPopupAnnotation *)self openRectangle];
  CFDictionaryRef v6 = CGRectCreateDictionaryRepresentation(v10);

  [v4 encodeObject:v6 forKey:@"openRectangle"];
  BOOL v7 = [(AKPopupAnnotation *)self contents];
  [v4 encodeObject:v7 forKey:@"contents"];
}

- (AKPopupAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AKPopupAnnotation;
  v5 = [(AKAnnotation *)&v19 initWithCoder:v4];
  if (v5)
  {
    v5->_visualStyle = [v4 decodeIntegerForKey:@"visualStyle"];
    CFDictionaryRef v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    CGRect v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    CFDictionaryRef v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rectangle"];

    if (v10) {
      CGRectMakeWithDictionaryRepresentation(v10, &v5->_rectangle);
    }
    double v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    double v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    CFDictionaryRef v15 = [v4 decodeObjectOfClasses:v14 forKey:@"openRectangle"];

    if (v15) {
      CGRectMakeWithDictionaryRepresentation(v15, &v5->_openRectangle);
    }
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contents"];
    contents = v5->_contents;
    v5->_contents = (NSString *)v16;
  }
  return v5;
}

- (int64_t)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(int64_t)a3
{
  self->_visualStyle = a3;
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

- (CGRect)openRectangle
{
  objc_copyStruct(v6, &self->_openRectangle, 32, 1, 0);
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

- (void)setOpenRectangle:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_openRectangle, &v3, 32, 1, 0);
}

- (AKAnnotation)parentAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnnotation);

  return (AKAnnotation *)WeakRetained;
}

- (void)setParentAnnotation:(id)a3
{
}

- (NSString)contents
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setContents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);

  objc_destroyWeak((id *)&self->_parentAnnotation);
}

@end