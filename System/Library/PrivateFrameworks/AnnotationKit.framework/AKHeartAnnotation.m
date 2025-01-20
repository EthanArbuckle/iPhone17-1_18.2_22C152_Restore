@interface AKHeartAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
- (AKHeartAnnotation)initWithCoder:(id)a3;
- (BOOL)verticallyFlipped;
- (CGRect)hitTestBounds;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)encodeWithCoder:(id)a3;
- (void)setVerticallyFlipped:(BOOL)a3;
@end

@implementation AKHeartAnnotation

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Heart" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:@"verticallyFlipped"]
    || (+[AKController akBundle],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 localizedStringForKey:@"Bounds" value:&stru_26EA57918 table:@"AnnotationStrings"], v6 = objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKHeartAnnotation;
    v6 = objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
  }

  return v6;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKHeartAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75EC0];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKHeartAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75ED8];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKHeartAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForAdornments];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75EF0];

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
  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v10;
  CGRect v32 = CGRectInset(v31, v12, v14);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  [(AKStrokedAnnotation *)self strokeWidth];
  CGFloat v20 = v19 * -0.5;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRect v34 = CGRectInset(v33, v20, v20);
  double v21 = v34.origin.x;
  double v22 = v34.origin.y;
  double v23 = v34.size.width;
  double v24 = v34.size.height;
  [(AKRectangularShapeAnnotation *)self rotationAngle];

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v21, v22, v23, v24, v25);
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKHeartAnnotation;
  id v4 = a3;
  [(AKRectangularShapeAnnotation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[AKHeartAnnotation verticallyFlipped](self, "verticallyFlipped", v5.receiver, v5.super_class), @"verticallyFlipped");
}

- (AKHeartAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKHeartAnnotation;
  objc_super v5 = [(AKRectangularShapeAnnotation *)&v7 initWithCoder:v4];
  if (v5) {
    -[AKHeartAnnotation setVerticallyFlipped:](v5, "setVerticallyFlipped:", [v4 decodeBoolForKey:@"verticallyFlipped"]);
  }

  return v5;
}

- (BOOL)verticallyFlipped
{
  return self->_verticallyFlipped;
}

- (void)setVerticallyFlipped:(BOOL)a3
{
  self->_verticallyFlipped = a3;
}

@end