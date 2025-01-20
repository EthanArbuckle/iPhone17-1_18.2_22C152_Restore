@interface AKTriangleAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
- (AKTriangleAnnotation)initWithCoder:(id)a3;
- (BOOL)horizontallyFlipped;
- (BOOL)verticallyFlipped;
- (CGRect)hitTestBounds;
- (UIBezierPath)path;
- (id)displayName;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)encodeWithCoder:(id)a3;
- (void)setHorizontallyFlipped:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)setVerticallyFlipped:(BOOL)a3;
@end

@implementation AKTriangleAnnotation

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    v5 = +[AKController akBundle];
    v6 = v5;
    v7 = @"Triangle Shape";
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"horizontallyFlipped"]
    || [v4 isEqualToString:@"verticallyFlipped"])
  {
    v5 = +[AKController akBundle];
    v6 = v5;
    v7 = @"Bounds";
LABEL_6:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_8;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKTriangleAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_8:

  return v8;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Triangle" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKTriangleAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA760E8];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKTriangleAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76100];

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
  v8.receiver = self;
  v8.super_class = (Class)AKTriangleAnnotation;
  id v4 = a3;
  [(AKRectangularShapeAnnotation *)&v8 encodeWithCoder:v4];
  double v5 = [(AKTriangleAnnotation *)self path];
  CGFloat v6 = (const CGPath *)[v5 newCGPathForPlatformBezierPath];

  double v7 = [MEMORY[0x263EFF8F8] encodeCGPath:v6];
  [v4 encodeObject:v7 forKey:@"path"];
  CGPathRelease(v6);
  objc_msgSend(v4, "encodeBool:forKey:", -[AKTriangleAnnotation verticallyFlipped](self, "verticallyFlipped"), @"verticallyFlipped");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKTriangleAnnotation horizontallyFlipped](self, "horizontallyFlipped"), @"horizontallyFlipped");
}

- (AKTriangleAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKTriangleAnnotation;
  double v5 = [(AKRectangularShapeAnnotation *)&v11 initWithCoder:v4];
  if (v5)
  {
    CGFloat v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    uint64_t v7 = [MEMORY[0x263EFF8F8] newCGPathDecodedFromData:v6];
    if (v7)
    {
      objc_super v8 = (const CGPath *)v7;
      double v9 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v7];
      [(AKTriangleAnnotation *)v5 setPath:v9];

      CGPathRelease(v8);
    }
    if ([v4 containsValueForKey:@"verticallyFlipped"]) {
      -[AKTriangleAnnotation setVerticallyFlipped:](v5, "setVerticallyFlipped:", [v4 decodeBoolForKey:@"verticallyFlipped"]);
    }
    if ([v4 containsValueForKey:@"horizontallyFlipped"]) {
      -[AKTriangleAnnotation setHorizontallyFlipped:](v5, "setHorizontallyFlipped:", [v4 decodeBoolForKey:@"horizontallyFlipped"]);
    }
  }
  return v5;
}

- (UIBezierPath)path
{
  return (UIBezierPath *)objc_getProperty(self, a2, 312, 1);
}

- (void)setPath:(id)a3
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

- (void).cxx_destruct
{
}

@end