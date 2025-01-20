@interface AKShapeAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKShapeAnnotation)initWithCoder:(id)a3;
- (UIColor)fillColor;
- (id)displayName;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)encodeWithCoder:(id)a3;
- (void)setFillColor:(id)a3;
@end

@implementation AKShapeAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKShapeAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKShapeAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:@"fillColor"]
    || (+[AKController akBundle],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 localizedStringForKey:@"Fill Color" value:&stru_26EA57918 table:@"AnnotationStrings"], objc_super v6 = objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKShapeAnnotation;
    objc_super v6 = objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
  }

  return v6;
}

- (id)displayName
{
  v4.receiver = self;
  v4.super_class = (Class)AKShapeAnnotation;
  v2 = [(AKStrokedAnnotation *)&v4 displayName];

  return v2;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKShapeAnnotation;
  v3 = [(AKStrokedAnnotation *)&v6 keysForValuesToObserveForUndo];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA761C0];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKShapeAnnotation;
  v3 = [(AKStrokedAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA761D8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKShapeAnnotation;
  id v4 = a3;
  [(AKStrokedAnnotation *)&v6 encodeWithCoder:v4];
  v5 = [(AKShapeAnnotation *)self fillColor];
  [v4 akEncodeColor:v5 forKey:@"fillColorString"];
}

- (AKShapeAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKShapeAnnotation;
  v5 = [(AKStrokedAnnotation *)&v9 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"fillColorString"])
    {
      objc_super v6 = [v4 akDecodeColorForKey:@"fillColorString"];
      [(AKShapeAnnotation *)v5 setFillColor:v6];
LABEL_7:

      goto LABEL_8;
    }
    if ([v4 containsValueForKey:@"fillColor"])
    {
      objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fillColor"];
      if (v6)
      {
        v7 = [MEMORY[0x263F1C550] akColorWithCIColor:v6];
        [(AKShapeAnnotation *)v5 setFillColor:v7];
      }
      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

- (UIColor)fillColor
{
  return (UIColor *)objc_getProperty(self, a2, 216, 1);
}

- (void)setFillColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end