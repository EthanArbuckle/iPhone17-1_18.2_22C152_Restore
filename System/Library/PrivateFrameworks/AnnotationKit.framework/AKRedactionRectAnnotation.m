@interface AKRedactionRectAnnotation
+ (BOOL)supportsSecureCoding;
- (AKRedactionRectAnnotation)init;
- (AKRedactionRectAnnotation)initWithCoder:(id)a3;
- (BOOL)isHighlighted;
- (BOOL)isOpaque;
- (BOOL)shouldBurnIn;
- (CGRect)hitTestBounds;
- (id)displayName;
- (id)keysForValuesToObserveForRedrawing;
- (void)encodeWithCoder:(id)a3;
- (void)setIsHighlighted:(BOOL)a3;
- (void)setIsOpaque:(BOOL)a3;
@end

@implementation AKRedactionRectAnnotation

- (AKRedactionRectAnnotation)init
{
  v5.receiver = self;
  v5.super_class = (Class)AKRedactionRectAnnotation;
  v2 = [(AKRectangularShapeAnnotation *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C550] blackColor];
    [(AKShapeAnnotation *)v2 setFillColor:v3];

    [(AKRedactionRectAnnotation *)v2 setIsOpaque:1];
  }
  return v2;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Redaction" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (BOOL)shouldBurnIn
{
  return 1;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKRedactionRectAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76358];

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
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  CGRect v26 = CGRectInset(v25, v12, v14);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  [(AKRectangularShapeAnnotation *)self rotationAngle];

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v19);
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKRedactionRectAnnotation;
  id v4 = a3;
  [(AKRectangularShapeAnnotation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[AKRedactionRectAnnotation isOpaque](self, "isOpaque", v5.receiver, v5.super_class), @"isOpaque");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKRedactionRectAnnotation isOpaque](self, "isOpaque"), @"isHighlighted");
}

- (AKRedactionRectAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKRedactionRectAnnotation;
  objc_super v5 = [(AKRectangularShapeAnnotation *)&v7 initWithCoder:v4];
  if (v5)
  {
    -[AKRedactionRectAnnotation setIsOpaque:](v5, "setIsOpaque:", [v4 decodeBoolForKey:@"isOpaque"]);
    -[AKRedactionRectAnnotation setIsOpaque:](v5, "setIsOpaque:", [v4 decodeBoolForKey:@"isHighlighted"]);
  }

  return v5;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setIsHighlighted:(BOOL)a3
{
  self->_isHighlighted = a3;
}

@end