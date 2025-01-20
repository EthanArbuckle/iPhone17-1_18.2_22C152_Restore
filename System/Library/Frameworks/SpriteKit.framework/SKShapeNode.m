@interface SKShapeNode
+ (BOOL)supportsSecureCoding;
+ (SKShapeNode)shapeNodeWithCircleOfRadius:(CGFloat)radius;
+ (SKShapeNode)shapeNodeWithEllipseInRect:(CGRect)rect;
+ (SKShapeNode)shapeNodeWithEllipseOfSize:(CGSize)size;
+ (SKShapeNode)shapeNodeWithPath:(CGPathRef)path;
+ (SKShapeNode)shapeNodeWithPath:(CGPathRef)path centered:(BOOL)centered;
+ (SKShapeNode)shapeNodeWithPoints:(CGPoint *)points count:(size_t)numPoints;
+ (SKShapeNode)shapeNodeWithRect:(CGRect)rect;
+ (SKShapeNode)shapeNodeWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;
+ (SKShapeNode)shapeNodeWithRectOfSize:(CGSize)size;
+ (SKShapeNode)shapeNodeWithRectOfSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
+ (SKShapeNode)shapeNodeWithSplinePoints:(CGPoint *)points count:(size_t)numPoints;
+ (SKShapeNode)shapeNodeWithTriangleA:(CGPoint)a3 B:(CGPoint)a4 C:(CGPoint)a5;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isAntialiased;
- (BOOL)isEqualToNode:(id)a3;
- (CGFloat)glowWidth;
- (CGFloat)lineLength;
- (CGFloat)lineWidth;
- (CGFloat)miterLimit;
- (CGLineCap)lineCap;
- (CGLineJoin)lineJoin;
- (CGPathRef)path;
- (SKAttributeValue)valueForAttributeNamed:(NSString *)key;
- (SKBlendMode)blendMode;
- (SKShader)fillShader;
- (SKShader)strokeShader;
- (SKShapeNode)init;
- (SKShapeNode)initWithCoder:(id)a3;
- (SKTexture)fillTexture;
- (SKTexture)strokeTexture;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (double)renderQualityRatio;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_didMakeBackingNode;
- (void)_initialize;
- (void)_makeBackingNode;
- (void)encodeWithCoder:(id)a3;
- (void)setAntialiased:(BOOL)antialiased;
- (void)setBlendMode:(SKBlendMode)blendMode;
- (void)setFillColor:(UIColor *)fillColor;
- (void)setFillShader:(SKShader *)fillShader;
- (void)setFillTexture:(SKTexture *)fillTexture;
- (void)setGlowWidth:(CGFloat)glowWidth;
- (void)setLineCap:(CGLineCap)lineCap;
- (void)setLineJoin:(CGLineJoin)lineJoin;
- (void)setLineWidth:(CGFloat)lineWidth;
- (void)setMiterLimit:(CGFloat)miterLimit;
- (void)setPath:(CGPathRef)path;
- (void)setStrokeColor:(UIColor *)strokeColor;
- (void)setStrokeShader:(SKShader *)strokeShader;
- (void)setStrokeTexture:(SKTexture *)strokeTexture;
- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key;
@end

@implementation SKShapeNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKShapeNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skcShapeNode = [(SKNode *)self _backingNode];
}

+ (SKShapeNode)shapeNodeWithPath:(CGPathRef)path
{
  v4 = [(id)objc_opt_class() node];
  [v4 setPath:path];

  return (SKShapeNode *)v4;
}

+ (SKShapeNode)shapeNodeWithPath:(CGPathRef)path centered:(BOOL)centered
{
  BOOL v4 = centered;
  v6 = [(id)objc_opt_class() node];
  v7 = v6;
  if (v4)
  {
    CGRect PathBoundingBox = CGPathGetPathBoundingBox(path);
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeTranslation(&v10, -(PathBoundingBox.origin.x + PathBoundingBox.size.width * 0.5), -(PathBoundingBox.origin.y + PathBoundingBox.size.height * 0.5));
    v8 = CGPathCreateMutableCopyByTransformingPath(path, &v10);
    [v7 setPath:v8];
    CGPathRelease(v8);
  }
  else
  {
    [v6 setPath:path];
  }

  return (SKShapeNode *)v7;
}

+ (SKShapeNode)shapeNodeWithEllipseInRect:(CGRect)rect
{
  objc_super v3 = CGPathCreateWithEllipseInRect(rect, 0);
  BOOL v4 = [(id)objc_opt_class() shapeNodeWithPath:v3];
  CGPathRelease(v3);

  return (SKShapeNode *)v4;
}

+ (SKShapeNode)shapeNodeWithEllipseOfSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  v5 = objc_opt_class();

  return (SKShapeNode *)objc_msgSend(v5, "shapeNodeWithEllipseInRect:", width * -0.5, height * -0.5, width, height);
}

+ (SKShapeNode)shapeNodeWithCircleOfRadius:(CGFloat)radius
{
  BOOL v4 = objc_opt_class();

  return (SKShapeNode *)objc_msgSend(v4, "shapeNodeWithEllipseOfSize:", radius + radius, radius + radius);
}

+ (SKShapeNode)shapeNodeWithRect:(CGRect)rect
{
  objc_super v3 = CGPathCreateWithRect(rect, 0);
  BOOL v4 = [(id)objc_opt_class() shapeNodeWithPath:v3];
  CGPathRelease(v3);

  return (SKShapeNode *)v4;
}

+ (SKShapeNode)shapeNodeWithRectOfSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  v5 = objc_opt_class();

  return (SKShapeNode *)objc_msgSend(v5, "shapeNodeWithRect:", width * -0.5, height * -0.5, width, height);
}

+ (SKShapeNode)shapeNodeWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  float v7 = cornerRadius;
  float v8 = rect.size.width * 0.5;
  if (v7 <= v8) {
    float v8 = cornerRadius;
  }
  if (v8 < 0.0) {
    float v8 = 0.0;
  }
  float v9 = rect.size.height * 0.5;
  if (v7 > v9) {
    float v7 = rect.size.height * 0.5;
  }
  if (v7 < 0.0) {
    float v7 = 0.0;
  }
  if (((LODWORD(v8) & 0x80000000) != 0 || (LODWORD(v8) & 0x60000000) == 0)
    && ((LODWORD(v7) & 0x80000000) != 0 || (LODWORD(v7) & 0x60000000) == 0))
  {
    uint64_t v19 = objc_msgSend((id)objc_opt_class(), "shapeNodeWithRect:", x, y, width, rect.size.height);
  }
  else
  {
    double v10 = v8;
    double v11 = v7;
    float v12 = -(v8 - width * 0.5);
    if ((LODWORD(v12) & 0x80000000) == 0 && (LODWORD(v12) & 0x60000000) != 0
      || (float v13 = -(v11 - rect.size.height * 0.5), (LODWORD(v13) & 0x80000000) == 0) && (LODWORD(v13) & 0x60000000) != 0)
    {
      double v14 = x;
      double v15 = y;
      double v16 = width;
      v17 = CGPathCreateWithRoundedRect(rect, v10, v11, 0);
      v18 = [(id)objc_opt_class() shapeNodeWithPath:v17];
      CGPathRelease(v17);
      goto LABEL_21;
    }
    uint64_t v19 = objc_msgSend((id)objc_opt_class(), "shapeNodeWithEllipseInRect:", x, y, width, rect.size.height);
  }
  v18 = (void *)v19;
LABEL_21:

  return (SKShapeNode *)v18;
}

+ (SKShapeNode)shapeNodeWithRectOfSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
  double height = size.height;
  double width = size.width;
  float v7 = objc_opt_class();

  return (SKShapeNode *)objc_msgSend(v7, "shapeNodeWithRect:cornerRadius:", width * -0.5, height * -0.5, width, height, cornerRadius);
}

+ (SKShapeNode)shapeNodeWithTriangleA:(CGPoint)a3 B:(CGPoint)a4 C:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v7 = a4.y;
  CGFloat v8 = a4.x;
  CGFloat v9 = a3.x;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v9, v7);
  CGPathAddLineToPoint(Mutable, 0, v8, v7);
  CGPathAddLineToPoint(Mutable, 0, x, y);
  CGPathCloseSubpath(Mutable);
  double v11 = [(id)objc_opt_class() node];
  [v11 setPath:Mutable];
  CGPathRelease(Mutable);

  return (SKShapeNode *)v11;
}

+ (SKShapeNode)shapeNodeWithPoints:(CGPoint *)points count:(size_t)numPoints
{
  Mutable = CGPathCreateMutable();
  CGFloat v7 = Mutable;
  if (numPoints)
  {
    CGFloat x = points->x;
    CGFloat y = points->y;
    p_CGFloat y = &points->y;
    CGPathMoveToPoint(Mutable, 0, x, y);
    do
    {
      CGPathAddLineToPoint(v7, 0, *(p_y - 1), *p_y);
      p_y += 2;
      --numPoints;
    }
    while (numPoints);
  }
  double v11 = [(id)objc_opt_class() node];
  [v11 setPath:v7];
  CGPathRelease(v7);

  return (SKShapeNode *)v11;
}

+ (SKShapeNode)shapeNodeWithSplinePoints:(CGPoint *)points count:(size_t)numPoints
{
  Mutable = CGPathCreateMutable();
  CGFloat v9 = Mutable;
  if (numPoints)
  {
    double x = points->x;
    double y = points->y;
    CGPathMoveToPoint(Mutable, 0, points->x, y);
  }
  uint64_t v10 = 0;
  p_double y = &points->y;
  double v12 = y;
  double v13 = x;
  double v14 = x;
  double v15 = y;
  do
  {
    double v16 = v15;
    double v17 = v14;
    if (numPoints != v10)
    {
      double v14 = *(p_y - 1);
      double v15 = *p_y;
    }
    if (v10)
    {
      if (CGPathIsEmpty(v9)) {
        CGPathMoveToPoint(v9, 0, v14, v15);
      }
      else {
        CGPathAddCurveToPoint(v9, 0, (v17 - (x - v13 * 6.0)) * 0.166666667, (v16 - (y - v12 * 6.0)) * 0.166666667, (v13 + v17 * 6.0 - v14) * 0.166666667, (v12 + v16 * 6.0 - v15) * 0.166666667, v17, v16);
      }
    }
    ++v10;
    p_y += 2;
    double y = v12;
    double x = v13;
    double v12 = v16;
    double v13 = v17;
  }
  while (numPoints + 1 != v10);
  v18 = [(id)objc_opt_class() node];
  [v18 setPath:v9];
  CGPathRelease(v9);

  return (SKShapeNode *)v18;
}

- (BOOL)isEqualToNode:(id)a3
{
  BOOL v4 = (SKShapeNode *)a3;
  if (self == v4)
  {
    BOOL v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v24.receiver = self;
      v24.super_class = (Class)SKShapeNode;
      if ([(SKNode *)&v24 isEqualToNode:v5]
        && CGPathEqualToPath([(SKShapeNode *)self path], [(SKShapeNode *)v5 path]))
      {
        id v6 = [(SKShapeNode *)self fillColor];
        CGFloat v7 = (CGColor *)[v6 CGColor];
        id v8 = [(SKShapeNode *)v5 fillColor];
        if (CGColorEqualToColor(v7, (CGColorRef)[v8 CGColor]))
        {
          id v9 = [(SKShapeNode *)self strokeColor];
          uint64_t v10 = (CGColor *)[v9 CGColor];
          id v11 = [(SKShapeNode *)v5 strokeColor];
          if (!CGColorEqualToColor(v10, (CGColorRef)[v11 CGColor])) {
            goto LABEL_10;
          }
          [(SKShapeNode *)self lineWidth];
          double v13 = v12;
          [(SKShapeNode *)v5 lineWidth];
          float v14 = v13;
          *(float *)&double v15 = v15;
          if ((COERCE_UNSIGNED_INT(v14 - *(float *)&v15) & 0x60000000) != 0) {
            goto LABEL_10;
          }
          [(SKShapeNode *)self glowWidth];
          double v17 = v16;
          [(SKShapeNode *)v5 glowWidth];
          float v18 = v17;
          *(float *)&double v19 = v19;
          if ((COERCE_UNSIGNED_INT(v18 - *(float *)&v19) & 0x60000000) == 0
            && (BOOL v20 = [(SKShapeNode *)self isAntialiased],
                v20 == [(SKShapeNode *)v5 isAntialiased]))
          {
            SKBlendMode v23 = [(SKShapeNode *)self blendMode];
            BOOL v21 = v23 == [(SKShapeNode *)v5 blendMode];
          }
          else
          {
LABEL_10:
            BOOL v21 = 0;
          }
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (void)_initialize
{
  [(SKShapeNode *)self setPath:0];
  [(SKShapeNode *)self setAntialiased:1];
  [(SKShapeNode *)self setGlowWidth:0.0];
  LODWORD(v3) = 1065353216;
  LODWORD(v4) = 1065353216;
  LODWORD(v5) = 1065353216;
  LODWORD(v6) = 1065353216;
  CGFloat v7 = objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v3, v4, v5, v6);
  [(SKShapeNode *)self setStrokeColor:v7];

  LODWORD(v8) = 0;
  LODWORD(v9) = 0;
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  double v12 = objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v8, v9, v10, v11);
  [(SKShapeNode *)self setFillColor:v12];

  [(SKShapeNode *)self setLineCap:0];
  [(SKShapeNode *)self setLineJoin:2];

  [(SKShapeNode *)self setMiterLimit:0.5];
}

- (SKShapeNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKShapeNode;
  v2 = [(SKNode *)&v5 init];
  double v3 = v2;
  if (v2) {
    [(SKShapeNode *)v2 _initialize];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SKShapeNode;
  [(SKNode *)&v19 encodeWithCoder:v4];
  objc_super v5 = PKArrayFromCGPath();
  [v4 encodeObject:v5 forKey:@"_cgPath"];

  double v6 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 155)];
  [v4 encodeObject:v6 forKey:@"_lineWidth"];

  CGFloat v7 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 156)];
  [v4 encodeObject:v7 forKey:@"_smoothWidth"];

  double v8 = [NSNumber numberWithBool:*((unsigned __int8 *)self->_skcShapeNode + 644)];
  [v4 encodeObject:v8 forKey:@"_smoothStroke"];

  double v9 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 148)];
  [v4 encodeObject:v9 forKey:@"_fillColorR"];

  double v10 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 149)];
  [v4 encodeObject:v10 forKey:@"_fillColorG"];

  double v11 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 150)];
  [v4 encodeObject:v11 forKey:@"_fillColorB"];

  double v12 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 151)];
  [v4 encodeObject:v12 forKey:@"_fillColorA"];

  double v13 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 144)];
  [v4 encodeObject:v13 forKey:@"_strokeColorR"];

  float v14 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 145)];
  [v4 encodeObject:v14 forKey:@"_strokeColorG"];

  double v15 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 146)];
  [v4 encodeObject:v15 forKey:@"_strokeColorB"];

  double v16 = [NSNumber numberWithDouble:*((float *)self->_skcShapeNode + 147)];
  [v4 encodeObject:v16 forKey:@"_strokeColorA"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SKShapeNode lineJoin](self, "lineJoin"), @"_lineJoin");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SKShapeNode lineCap](self, "lineCap"), @"_lineCap");
  [(SKShapeNode *)self miterLimit];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_miterLimit");
  double v17 = [(SKShapeNode *)self strokeTexture];
  [v4 encodeObject:v17 forKey:@"_strokeTexture"];

  float v18 = [(SKShapeNode *)self fillTexture];
  [v4 encodeObject:v18 forKey:@"_fillTexture"];
}

- (SKShapeNode)initWithCoder:(id)a3
{
  v52[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SKShapeNode;
  objc_super v5 = [(SKNode *)&v51 initWithCoder:v4];
  if (v5)
  {
    double v6 = (void *)MEMORY[0x263EFFA08];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    v52[2] = objc_opt_class();
    v52[3] = objc_opt_class();
    v52[4] = objc_opt_class();
    v52[5] = objc_opt_class();
    v52[6] = objc_opt_class();
    CGFloat v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:7];
    double v8 = [v6 setWithArray:v7];
    double v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_cgPath"];
    double v10 = (const CGPath *)PKCGPathCreateFromArray();

    [(SKShapeNode *)v5 setPath:v10];
    CGPathRelease(v10);
    double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_smoothWidth"];
    [v11 doubleValue];
    -[SKShapeNode setGlowWidth:](v5, "setGlowWidth:");

    double v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lineWidth"];
    [v12 doubleValue];
    -[SKShapeNode setLineWidth:](v5, "setLineWidth:");

    double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_smoothStroke"];
    -[SKShapeNode setAntialiased:](v5, "setAntialiased:", [v13 BOOLValue]);

    float v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fillColorR"];
    [v14 doubleValue];
    double v16 = v15;

    double v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fillColorG"];
    [v17 doubleValue];
    double v19 = v18;

    BOOL v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fillColorB"];
    [v20 doubleValue];
    double v22 = v21;

    SKBlendMode v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fillColorA"];
    [v23 doubleValue];
    double v25 = v24;

    *(float *)&double v26 = v16;
    *(float *)&double v27 = v19;
    *(float *)&double v28 = v22;
    *(float *)&double v29 = v25;
    v30 = objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v26, v27, v28, v29);
    [(SKShapeNode *)v5 setFillColor:v30];

    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_strokeColorR"];
    [v31 doubleValue];
    double v33 = v32;

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_strokeColorG"];
    [v34 doubleValue];
    double v36 = v35;

    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_strokeColorB"];
    [v37 doubleValue];
    double v39 = v38;

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_strokeColorA"];
    [v40 doubleValue];
    double v42 = v41;

    *(float *)&double v43 = v33;
    *(float *)&double v44 = v36;
    *(float *)&double v45 = v39;
    *(float *)&double v46 = v42;
    v47 = objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v43, v44, v45, v46);
    [(SKShapeNode *)v5 setStrokeColor:v47];

    -[SKShapeNode setLineJoin:](v5, "setLineJoin:", [v4 decodeIntegerForKey:@"_lineJoin"]);
    -[SKShapeNode setLineCap:](v5, "setLineCap:", [v4 decodeIntegerForKey:@"_lineCap"]);
    [v4 decodeDoubleForKey:@"_miterLimit"];
    -[SKShapeNode setMiterLimit:](v5, "setMiterLimit:");
    v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_strokeTexture"];
    [(SKShapeNode *)v5 setStrokeTexture:v48];

    v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fillTexture"];
    [(SKShapeNode *)v5 setFillTexture:v49];
  }
  return v5;
}

- (id)description
{
  double v3 = NSString;
  id v4 = [(SKNode *)self name];
  [(SKNode *)self calculateAccumulatedFrame];
  objc_super v5 = NSStringFromCGRect(v9);
  double v6 = [v3 stringWithFormat:@"<SKShapeNode> name:'%@' accumulatedFrame:%@", v4, v5];

  return v6;
}

- (CGPathRef)path
{
  return (CGPathRef)*((void *)self->_skcShapeNode + 79);
}

- (void)setPath:(CGPathRef)path
{
  if (path)
  {
    uint64_t v4 = MEMORY[0x21052E1E0](path, a2);
    skcShapeNode = self->_skcShapeNode;
    double v6 = (const CGPath *)*((void *)skcShapeNode + 79);
    if (v6)
    {
      CGPathRelease(v6);
      skcShapeNode = self->_skcShapeNode;
    }
    *((void *)skcShapeNode + 79) = v4;
    CGFloat v7 = (SKCompositeBezierPath *)*((void *)self->_skcShapeNode + 70);
    if (v7)
    {
      SKCompositeBezierPath::~SKCompositeBezierPath(v7);
      MEMORY[0x21052EA30]();
    }
    operator new();
  }
  double v8 = self->_skcShapeNode;
  CGRect v9 = (const CGPath *)*((void *)v8 + 79);
  if (v9)
  {
    CGPathRelease(v9);
    double v8 = self->_skcShapeNode;
  }
  double v10 = (SKCompositeBezierPath *)*((void *)v8 + 70);
  if (v10)
  {
    SKCompositeBezierPath::~SKCompositeBezierPath(v10);
    MEMORY[0x21052EA30]();
    double v8 = self->_skcShapeNode;
  }
  *((void *)v8 + 79) = 0;
  *((void *)self->_skcShapeNode + 70) = 0;
  double v11 = (SKCNode *)self->_skcShapeNode;

  SKCNode::setDirty(v11);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  skcShapeNode = self->_skcShapeNode;
  objc_super v5 = (const CGPath *)skcShapeNode[79];
  float x = a3.x;
  float v19 = x;
  float y = a3.y;
  float v20 = y;
  *(double *)v8.i64 = (*(double (**)(void *, SEL))(*skcShapeNode + 112))(skcShapeNode, a2);
  float32x2_t v21 = (float32x2_t)vaddq_f32(v11, vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v8, v19), v9, v20), (float32x4_t)0, v10)).u64[0];
  if (SKCShapeNode::shouldFill((SKCShapeNode *)self->_skcShapeNode))
  {
    CGPoint v12 = (CGPoint)vcvtq_f64_f32(v21);
    CGFloat v13 = v12.y;
    return CGPathContainsPoint(v5, 0, v12, 1);
  }
  else
  {
    CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v5, 0, (float)(*((float *)self->_skcShapeNode + 155) + *((float *)self->_skcShapeNode + 155)), (CGLineCap)*((_DWORD *)self->_skcShapeNode + 153), (CGLineJoin)*((_DWORD *)self->_skcShapeNode + 152), *((float *)self->_skcShapeNode + 154));
    CGPoint v16 = (CGPoint)vcvtq_f64_f32(v21);
    CGFloat v17 = v16.y;
    BOOL v18 = CGPathContainsPoint(v5, 0, v16, 1);
    CGPathRelease(CopyByStrokingPath);
    return v18;
  }
}

- (CGFloat)glowWidth
{
  return *((float *)self->_skcShapeNode + 156);
}

- (void)setGlowWidth:(CGFloat)glowWidth
{
  if (glowWidth < 0.0) {
    glowWidth = 0.0;
  }
  float v3 = glowWidth;
  skcShapeNode = (float *)self->_skcShapeNode;
  skcShapeNode[156] = v3;
  SKCNode::setDirty((SKCNode *)skcShapeNode);
}

- (SKTexture)fillTexture
{
  return (SKTexture *)*((id *)self->_skcShapeNode + 83);
}

- (void)setFillTexture:(SKTexture *)fillTexture
{
  objc_storeStrong((id *)self->_skcShapeNode + 83, fillTexture);
  objc_super v5 = fillTexture;
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);
}

- (void)setFillShader:(SKShader *)fillShader
{
  objc_super v5 = fillShader;
  [*((id *)self->_skcShapeNode + 85) _removeTargetNode:self];
  objc_storeStrong((id *)self->_skcShapeNode + 85, fillShader);
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);
  SKCNode::recomputeFlags((SKCNode *)self->_skcShapeNode, 1);
  [(SKShader *)v5 _addTargetNode:self];
}

- (SKShader)fillShader
{
  return (SKShader *)*((id *)self->_skcShapeNode + 85);
}

- (void)setStrokeTexture:(SKTexture *)strokeTexture
{
  objc_storeStrong((id *)self->_skcShapeNode + 82, strokeTexture);
  objc_super v5 = strokeTexture;
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);
}

- (SKTexture)strokeTexture
{
  return (SKTexture *)*((id *)self->_skcShapeNode + 82);
}

- (void)setStrokeShader:(SKShader *)strokeShader
{
  objc_super v5 = strokeShader;
  [*((id *)self->_skcShapeNode + 84) _removeTargetNode:self];
  objc_storeStrong((id *)self->_skcShapeNode + 84, strokeShader);
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);
  SKCNode::recomputeFlags((SKCNode *)self->_skcShapeNode, 1);
  [(SKShader *)v5 _addTargetNode:self];
}

- (SKShader)strokeShader
{
  return (SKShader *)*((id *)self->_skcShapeNode + 84);
}

- (double)renderQualityRatio
{
  return 1.0;
}

- (SKBlendMode)blendMode
{
  return *((void *)self->super._skcNode + 36);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
}

- (BOOL)isAntialiased
{
  return *((unsigned char *)self->_skcShapeNode + 644);
}

- (void)setAntialiased:(BOOL)antialiased
{
  skcShapeNode = (SKCNode *)self->_skcShapeNode;
  *((unsigned char *)skcShapeNode + 644) = antialiased;
  SKCNode::setDirty(skcShapeNode);
}

- (CGFloat)lineWidth
{
  return *((float *)self->_skcShapeNode + 155);
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  float v3 = lineWidth;
  skcShapeNode = (float *)self->_skcShapeNode;
  skcShapeNode[155] = v3;
  SKCNode::setDirty((SKCNode *)skcShapeNode);
}

- (UIColor)fillColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithRed:*((float *)self->_skcShapeNode + 148) green:*((float *)self->_skcShapeNode + 149) blue:*((float *)self->_skcShapeNode + 150) alpha:*((float *)self->_skcShapeNode + 151)];
}

- (void)setFillColor:(UIColor *)fillColor
{
  objc_super v5 = fillColor;
  [(UIColor *)v5 vectorRGBA];
  *((_OWORD *)self->_skcShapeNode + 37) = v4;
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);
}

- (UIColor)strokeColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithRed:*((float *)self->_skcShapeNode + 144) green:*((float *)self->_skcShapeNode + 145) blue:*((float *)self->_skcShapeNode + 146) alpha:*((float *)self->_skcShapeNode + 147)];
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  objc_super v5 = strokeColor;
  [(UIColor *)v5 vectorRGBA];
  *((_OWORD *)self->_skcShapeNode + 36) = v4;
  SKCNode::setDirty((SKCNode *)self->_skcShapeNode);
}

- (void)setLineCap:(CGLineCap)lineCap
{
  skcShapeNode = (SKCNode *)self->_skcShapeNode;
  *((_DWORD *)skcShapeNode + 153) = lineCap;
  SKCNode::setDirty(skcShapeNode);
}

- (CGLineCap)lineCap
{
  return *((_DWORD *)self->_skcShapeNode + 153);
}

- (void)setLineJoin:(CGLineJoin)lineJoin
{
  skcShapeNode = (SKCNode *)self->_skcShapeNode;
  *((_DWORD *)skcShapeNode + 152) = lineJoin;
  SKCNode::setDirty(skcShapeNode);
}

- (CGLineJoin)lineJoin
{
  return *((_DWORD *)self->_skcShapeNode + 152);
}

- (void)setMiterLimit:(CGFloat)miterLimit
{
  float v3 = miterLimit;
  skcShapeNode = (float *)self->_skcShapeNode;
  skcShapeNode[154] = v3;
  SKCNode::setDirty((SKCNode *)skcShapeNode);
}

- (CGFloat)miterLimit
{
  return *((float *)self->_skcShapeNode + 154);
}

- (CGFloat)lineLength
{
  return SKCShapeNode::strokeLength((SKCShapeNode *)self->_skcShapeNode);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SKShapeNode;
  id v4 = [(SKNode *)&v12 copyWithZone:a3];
  objc_msgSend(v4, "setPath:", -[SKShapeNode path](self, "path"));
  objc_super v5 = [(SKShapeNode *)self fillColor];
  [v4 setFillColor:v5];

  double v6 = [(SKShapeNode *)self strokeColor];
  [v4 setStrokeColor:v6];

  objc_msgSend(v4, "setAntialiased:", -[SKShapeNode isAntialiased](self, "isAntialiased"));
  [(SKShapeNode *)self renderQualityRatio];
  objc_msgSend(v4, "setRenderQualityRatio:");
  [(SKShapeNode *)self lineWidth];
  objc_msgSend(v4, "setLineWidth:");
  [(SKShapeNode *)self glowWidth];
  objc_msgSend(v4, "setGlowWidth:");
  objc_msgSend(v4, "setBlendMode:", -[SKShapeNode blendMode](self, "blendMode"));
  CGFloat v7 = [(SKShapeNode *)self fillShader];
  [v4 setFillShader:v7];

  float32x4_t v8 = [(SKShapeNode *)self fillTexture];
  [v4 setFillTexture:v8];

  float32x4_t v9 = [(SKShapeNode *)self strokeShader];
  [v4 setStrokeShader:v9];

  float32x4_t v10 = [(SKShapeNode *)self strokeTexture];
  [v4 setStrokeTexture:v10];

  objc_msgSend(v4, "setLineJoin:", -[SKShapeNode lineJoin](self, "lineJoin"));
  objc_msgSend(v4, "setLineCap:", -[SKShapeNode lineCap](self, "lineCap"));
  [(SKShapeNode *)self miterLimit];
  objc_msgSend(v4, "setMiterLimit:");
  return v4;
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  v5.receiver = self;
  v5.super_class = (Class)SKShapeNode;
  float v3 = [(SKNode *)&v5 valueForAttributeNamed:key];

  return (SKAttributeValue *)v3;
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  v4.receiver = self;
  v4.super_class = (Class)SKShapeNode;
  [(SKNode *)&v4 setValue:value forAttributeNamed:key];
}

+ (id)debugHierarchyPropertyDescriptions
{
  v29[12] = *MEMORY[0x263EF8340];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  float v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"antialiased");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  double v27 = Mutable;
  v29[0] = Mutable;
  objc_super v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"fillColor");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v5, @"propertyFormat", @"color");
  double v26 = v5;
  v29[1] = v5;
  double v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"fillShader");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v6, @"propertyFormat", @"objectInfo");
  double v25 = v6;
  v29[2] = v6;
  CGFloat v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"glowWidth");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v7, @"propertyFormat", @"color");
  v29[3] = v7;
  float32x4_t v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"lineWidth");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v8, @"propertyFormat", @"CGf");
  v29[4] = v8;
  float32x4_t v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v9, @"propertyName", @"strokeColor");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v9, @"propertyFormat", @"color");
  v29[5] = v9;
  float32x4_t v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v10, @"propertyName", @"strokeShader");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v10, @"propertyFormat", @"objectInfo");
  v29[6] = v10;
  float32x4_t v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v11, @"propertyName", @"blendMode");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"SKBlendMode");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v11, @"propertyFormat", @"integer");
  uint64_t valuePtr = 1;
  CFNumberRef v12 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v11, @"propertyOptions", v12);
  CFRelease(v12);
  v29[7] = v11;
  CGFloat v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v13, @"propertyName", @"fillTexture");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v13, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 1;
  CFNumberRef v14 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v13, @"propertyOptions", v14);
  CFRelease(v14);
  v29[8] = v13;
  double v15 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v15, @"propertyName", @"strokeTexture");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v15, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 1;
  CFNumberRef v16 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v15, @"propertyOptions", v16);
  CFRelease(v16);
  v29[9] = v15;
  CGFloat v17 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v17, @"propertyName", @"visualRepresentation");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v17, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 8;
  CFNumberRef v18 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v17, @"visibility", v18);
  CFRelease(v18);
  uint64_t valuePtr = 1;
  CFNumberRef v19 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v17, @"propertyOptions", v19);
  CFRelease(v19);
  v29[10] = v17;
  float v20 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v20, @"propertyName", @"visualRepresentationOffset");
  CFDictionaryAddValue(v20, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v20, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v20, @"propertyFormat", @"CGf, CGf");
  uint64_t valuePtr = 8;
  CFNumberRef v21 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v20, @"visibility", v21);
  CFRelease(v21);
  uint64_t valuePtr = 1;
  CFNumberRef v22 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v20, @"propertyOptions", v22);
  CFRelease(v22);
  v29[11] = v20;
  SKBlendMode v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:12];

  return v23;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v83 = a4;
  if ([v9 isEqualToString:@"strokeTexture"])
  {
    Mutable = [v83 strokeTexture];

    if (!Mutable) {
      goto LABEL_93;
    }
    float32x4_t v10 = [v83 strokeTexture];
    float32x4_t v11 = (CGImage *)[v10 CGImage];

    if (v11)
    {
      int valuePtr = 1065353216;
      Mutable = (id *)CFDataCreateMutable(0, 0);
      uint64_t v12 = *MEMORY[0x263F01AE0];
      CGFloat v13 = CGImageDestinationCreateWithData((CFMutableDataRef)Mutable, (CFStringRef)*MEMORY[0x263F01AE0], 1uLL, 0);
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFNumberRef v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberFloatType, &valuePtr);
      keys = (void *)*MEMORY[0x263F0EFE8];
      values[0] = v15;
      CFDictionaryRef v16 = CFDictionaryCreate(v14, (const void **)&keys, (const void **)values, 1, 0, 0);
      CGImageDestinationAddImage(v13, v11, v16);
      CGImageDestinationFinalize(v13);
      CFRelease(v16);
      CFRelease(v15);
      CFRelease(v13);
      v89 = @"propertyFormat";
      uint64_t v90 = v12;
      *a5 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    }
    else
    {
      Mutable = 0;
    }
LABEL_30:
    CGImageRelease(v11);
    goto LABEL_93;
  }
  if ([v9 isEqualToString:@"fillTexture"])
  {
    Mutable = [v83 fillTexture];

    if (!Mutable) {
      goto LABEL_93;
    }
    CGFloat v17 = [v83 fillTexture];
    float32x4_t v11 = (CGImage *)[v17 CGImage];

    if (v11)
    {
      int valuePtr = 1065353216;
      Mutable = (id *)CFDataCreateMutable(0, 0);
      uint64_t v18 = *MEMORY[0x263F01AE0];
      CFNumberRef v19 = CGImageDestinationCreateWithData((CFMutableDataRef)Mutable, (CFStringRef)*MEMORY[0x263F01AE0], 1uLL, 0);
      CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFNumberRef v21 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberFloatType, &valuePtr);
      keys = (void *)*MEMORY[0x263F0EFE8];
      values[0] = v21;
      CFDictionaryRef v22 = CFDictionaryCreate(v20, (const void **)&keys, (const void **)values, 1, 0, 0);
      CGImageDestinationAddImage(v19, v11, v22);
      CGImageDestinationFinalize(v19);
      CFRelease(v22);
      CFRelease(v21);
      CFRelease(v19);
      v87 = @"propertyFormat";
      uint64_t v88 = v18;
      *a5 = [NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    }
    else
    {
      Mutable = 0;
    }
    goto LABEL_30;
  }
  if ([v9 isEqualToString:@"strokeColor"])
  {
    id v23 = [v83 strokeColor];
    double v24 = (CGColor *)[v23 CGColor];
    if (v24)
    {
      Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      space = CGColorGetColorSpace(v24);
      CFStringRef value = CGColorSpaceCopyName(space);
      size_t NumberOfComponents = CGColorGetNumberOfComponents(v24);
      uint64_t v26 = NumberOfComponents << 32;
      CFIndex v27 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        double v28 = CFStringCreateMutable(0, 0);
        id v77 = v23;
        CFIndex v29 = v27 - 1;
        if ((unint64_t)v27 <= 1) {
          uint64_t v30 = 1;
        }
        else {
          uint64_t v30 = v27;
        }
        do
        {
          CFStringAppend(v28, @"CGf");
          if (v29) {
            CFStringAppend(v28, @", ");
          }
          --v29;
          --v30;
        }
        while (v30);
        id v23 = v77;
      }
      else
      {
        double v28 = &stru_26BEEFD10;
      }
      Components = CGColorGetComponents(v24);
      double v45 = (const void **)malloc_type_malloc(v26 >> 29, 0x6004044C4A2DFuLL);
      double v46 = v45;
      if (v26 >= 1)
      {
        if (v27 <= 1) {
          uint64_t v47 = 1;
        }
        else {
          uint64_t v47 = v27;
        }
        v48 = (CFNumberRef *)v45;
        do
        {
          *v48++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
          --v47;
        }
        while (v47);
      }
      CFArrayRef v49 = CFArrayCreate(0, v46, v27, MEMORY[0x263EFFF70]);
      if (v26 >= 1)
      {
        if (v27 <= 1) {
          uint64_t v50 = 1;
        }
        else {
          uint64_t v50 = v27;
        }
        objc_super v51 = v46;
        do
        {
          CFRelease(*v51++);
          --v50;
        }
        while (v50);
      }
      free(v46);
      CGColorSpaceGetModel(space);
      if (v49) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValues", v49);
      }
      if (v28) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValuesFormat", v28);
      }
      if (value) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"colorSpaceName", value);
      }
      if (v49) {
        CFRelease(v49);
      }
      if (value) {
        CFRelease(value);
      }
      if (!v28) {
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    goto LABEL_31;
  }
  if ([v9 isEqualToString:@"fillColor"])
  {
    id v23 = [v83 fillColor];
    v31 = (CGColor *)[v23 CGColor];
    if (v31)
    {
      Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      spacea = CGColorGetColorSpace(v31);
      CFStringRef valuea = CGColorSpaceCopyName(spacea);
      size_t v32 = CGColorGetNumberOfComponents(v31);
      uint64_t v33 = v32 << 32;
      CFIndex v34 = (int)v32;
      if (v32 << 32)
      {
        double v28 = CFStringCreateMutable(0, 0);
        id v78 = v23;
        CFIndex v35 = v34 - 1;
        if ((unint64_t)v34 <= 1) {
          uint64_t v36 = 1;
        }
        else {
          uint64_t v36 = v34;
        }
        do
        {
          CFStringAppend(v28, @"CGf");
          if (v35) {
            CFStringAppend(v28, @", ");
          }
          --v35;
          --v36;
        }
        while (v36);
        id v23 = v78;
      }
      else
      {
        double v28 = &stru_26BEEFD10;
      }
      v55 = CGColorGetComponents(v31);
      v56 = (const void **)malloc_type_malloc(v33 >> 29, 0x6004044C4A2DFuLL);
      v57 = v56;
      if (v33 >= 1)
      {
        if (v34 <= 1) {
          uint64_t v58 = 1;
        }
        else {
          uint64_t v58 = v34;
        }
        v59 = (CFNumberRef *)v56;
        do
        {
          *v59++ = CFNumberCreate(0, kCFNumberCGFloatType, v55++);
          --v58;
        }
        while (v58);
      }
      CFArrayRef v60 = CFArrayCreate(0, v57, v34, MEMORY[0x263EFFF70]);
      if (v33 >= 1)
      {
        if (v34 <= 1) {
          uint64_t v61 = 1;
        }
        else {
          uint64_t v61 = v34;
        }
        v62 = v57;
        do
        {
          CFRelease(*v62++);
          --v61;
        }
        while (v61);
      }
      free(v57);
      CGColorSpaceGetModel(spacea);
      if (v60) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValues", v60);
      }
      if (v28) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValuesFormat", v28);
      }
      if (valuea) {
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"colorSpaceName", valuea);
      }
      if (v60) {
        CFRelease(v60);
      }
      if (valuea) {
        CFRelease(valuea);
      }
      if (!v28) {
        goto LABEL_92;
      }
LABEL_91:
      CFRelease(v28);
      goto LABEL_92;
    }
LABEL_31:
    Mutable = 0;
LABEL_92:

    goto LABEL_93;
  }
  if ([v9 isEqualToString:@"visualRepresentationOffset"])
  {
    [v83 _untransformedBounds];
    keys = v37;
    v93 = v38;
    double v39 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
    uint64_t v40 = 0;
    char v41 = 1;
    do
    {
      char v42 = v41;
      CFNumberRef v43 = CFNumberCreate(0, kCFNumberCGFloatType, &keys + v40);
      char v41 = 0;
      v39[v40] = v43;
      uint64_t v40 = 1;
    }
    while ((v42 & 1) != 0);
    Mutable = (id *)CFArrayCreate(0, v39, 2, MEMORY[0x263EFFF70]);
    CFRelease(*v39);
    CFRelease(v39[1]);
    free(v39);
  }
  else if ([v9 isEqualToString:@"visualRepresentation"])
  {
    Mutable = [v83 createDebugHierarchyVisualRepresentation];
    v85 = @"propertyFormat";
    uint64_t v86 = *MEMORY[0x263F01AE0];
    *a5 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
  }
  else
  {
    id v52 = v83;
    id v53 = v9;
    if (![v53 length]) {
      goto LABEL_105;
    }
    NSSelectorFromString((NSString *)v53);
    if (objc_opt_respondsToSelector())
    {
      v54 = (NSString *)v53;
    }
    else
    {
      if ((unint64_t)[v53 length] < 2)
      {
        v67 = [v53 uppercaseString];
      }
      else
      {
        v64 = [v53 substringToIndex:1];
        v65 = [v64 uppercaseString];
        v66 = [v53 substringFromIndex:1];
        v67 = [v65 stringByAppendingString:v66];
      }
      v68 = [@"is" stringByAppendingString:v67];
      NSSelectorFromString(v68);
      v54 = (objc_opt_respondsToSelector() & 1) != 0 ? v68 : 0;
    }
    if (v54)
    {
      Mutable = [v52 valueForKey:v54];
    }
    else
    {
LABEL_105:
      if (Mutable)
      {
        id v69 = v52;
        v70 = (__CFString *)v53;
        if (v69)
        {
          v71 = [NSString stringWithFormat:@"%@", v69];
        }
        else
        {
          v71 = &stru_26BEEFD10;
        }
        if (v70) {
          v72 = v70;
        }
        else {
          v72 = &stru_26BEEFD10;
        }
        v73 = v72;
        values[0] = @"propertyName";
        values[1] = @"objectDescription";
        keys = v73;
        v93 = v71;
        values[2] = @"errorDescription";
        v94 = &stru_26BEEFD10;
        v74 = [NSDictionary dictionaryWithObjects:&keys forKeys:values count:3];
        v75 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v74];

        id v76 = v75;
        __CFDictionary *Mutable = v76;

        v54 = 0;
        Mutable = 0;
      }
      else
      {
        v54 = 0;
      }
    }
  }
LABEL_93:

  return Mutable;
}

@end