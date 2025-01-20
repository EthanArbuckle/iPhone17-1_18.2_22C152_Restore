@interface AKArrowShapeAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKArrowShapeAnnotation)init;
- (AKArrowShapeAnnotation)initWithCoder:(id)a3;
- (CGRect)hitTestBounds;
- (double)arrowHeadLength;
- (double)arrowHeadWidth;
- (double)arrowLineWidth;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)encodeWithCoder:(id)a3;
- (void)setArrowHeadLength:(double)a3;
- (void)setArrowHeadWidth:(double)a3;
- (void)setArrowLineWidth:(double)a3;
@end

@implementation AKArrowShapeAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKArrowShapeAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA762B0];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKArrowShapeAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA762C8];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"arrowHeadLength"] & 1) == 0
    && ([v4 isEqualToString:@"arrowLineWidth"] & 1) == 0
    && ![v4 isEqualToString:@"arrowHeadWidth"]
    || (+[AKController akBundle],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 localizedStringForKey:@"Arrow Shape" value:&stru_26EA57918 table:@"AnnotationStrings"], objc_super v6 = objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKArrowShapeAnnotation;
    objc_super v6 = objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
  }

  return v6;
}

- (AKArrowShapeAnnotation)init
{
  v5.receiver = self;
  v5.super_class = (Class)AKArrowShapeAnnotation;
  v2 = [(AKArrowAnnotation *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AKAnnotation *)v2 setTextIsFixedWidth:1];
    [(AKAnnotation *)v3 setTextIsFixedHeight:1];
  }
  return v3;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Arrow" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKArrowShapeAnnotation;
  v3 = [(AKArrowAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA762E0];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKArrowShapeAnnotation;
  v3 = [(AKArrowAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA762F8];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKArrowShapeAnnotation;
  v3 = [(AKArrowAnnotation *)&v6 keysForValuesToObserveForAdornments];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76310];

  return v4;
}

- (CGRect)hitTestBounds
{
  [(AKArrowAnnotation *)self startPoint];
  double v4 = v3;
  double v6 = v5;
  [(AKArrowAnnotation *)self endPoint];
  double v8 = v7;
  double v10 = v9;
  [(AKArrowShapeAnnotation *)self arrowHeadWidth];
  double v12 = v11 * -0.5;
  v14.size.width = v8 - v4;
  v14.size.height = v10 - v6;
  v14.origin.x = v4;
  v14.origin.y = v6;
  CGRect v15 = CGRectStandardize(v14);

  return CGRectInset(v15, v12, v12);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKArrowShapeAnnotation;
  id v4 = a3;
  [(AKArrowAnnotation *)&v5 encodeWithCoder:v4];
  [(AKArrowShapeAnnotation *)self arrowHeadLength];
  objc_msgSend(v4, "encodeDouble:forKey:", @"arrowHeadLength");
  [(AKArrowShapeAnnotation *)self arrowHeadWidth];
  objc_msgSend(v4, "encodeDouble:forKey:", @"arrowHeadWidth");
  [(AKArrowShapeAnnotation *)self arrowLineWidth];
  objc_msgSend(v4, "encodeDouble:forKey:", @"arrowLineWidth");
}

- (AKArrowShapeAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKArrowShapeAnnotation;
  objc_super v5 = [(AKArrowAnnotation *)&v7 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"arrowHeadLength"];
    -[AKArrowShapeAnnotation setArrowHeadLength:](v5, "setArrowHeadLength:");
    [v4 decodeDoubleForKey:@"arrowHeadWidth"];
    -[AKArrowShapeAnnotation setArrowHeadWidth:](v5, "setArrowHeadWidth:");
    [v4 decodeDoubleForKey:@"arrowLineWidth"];
    -[AKArrowShapeAnnotation setArrowLineWidth:](v5, "setArrowLineWidth:");
  }

  return v5;
}

- (double)arrowLineWidth
{
  return self->_arrowLineWidth;
}

- (void)setArrowLineWidth:(double)a3
{
  self->_arrowLineWidth = a3;
}

- (double)arrowHeadWidth
{
  return self->_arrowHeadWidth;
}

- (void)setArrowHeadWidth:(double)a3
{
  self->_arrowHeadWidth = a3;
}

- (double)arrowHeadLength
{
  return self->_arrowHeadLength;
}

- (void)setArrowHeadLength:(double)a3
{
  self->_arrowHeadLength = a3;
}

@end