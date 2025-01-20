@interface AKStarAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKStarAnnotation)initWithCoder:(id)a3;
- (double)innerRadiusFactor;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)encodeWithCoder:(id)a3;
- (void)setInnerRadiusFactor:(double)a3;
@end

@implementation AKStarAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStarAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75CB0];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStarAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75CC8];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:@"innerRadiusFactor"]
    || (+[AKController akBundle],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 localizedStringForKey:@"Inner Radius" value:&stru_26EA57918 table:@"AnnotationStrings"], objc_super v6 = objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKStarAnnotation;
    objc_super v6 = objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
  }

  return v6;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Star" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKStarAnnotation;
  v3 = [(AKPolygonAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75CE0];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKStarAnnotation;
  v3 = [(AKPolygonAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75CF8];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKStarAnnotation;
  v3 = [(AKPolygonAnnotation *)&v6 keysForValuesToObserveForAdornments];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75D10];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKStarAnnotation;
  id v4 = a3;
  [(AKPolygonAnnotation *)&v5 encodeWithCoder:v4];
  [(AKStarAnnotation *)self innerRadiusFactor];
  objc_msgSend(v4, "encodeDouble:forKey:", @"innerRadiusFactor");
}

- (AKStarAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKStarAnnotation;
  objc_super v5 = [(AKPolygonAnnotation *)&v7 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"innerRadiusFactor"];
    -[AKStarAnnotation setInnerRadiusFactor:](v5, "setInnerRadiusFactor:");
  }

  return v5;
}

- (double)innerRadiusFactor
{
  return self->_innerRadiusFactor;
}

- (void)setInnerRadiusFactor:(double)a3
{
  self->_innerRadiusFactor = a3;
}

@end