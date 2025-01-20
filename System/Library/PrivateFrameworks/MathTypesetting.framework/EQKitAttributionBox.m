@interface EQKitAttributionBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)canContainBoxes;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)erasableBounds;
- (EQKitAttributionBox)initWithBox:(id)a3 attribution:(id)a4;
- (EQKitBox)box;
- (EQKitSourceAttribution)attribution;
- (double)depth;
- (double)height;
- (double)opticalAlignWidth;
- (double)width;
- (id)containedBoxes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)hitTest:(CGPoint)a3;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitAttributionBox

- (EQKitAttributionBox)initWithBox:(id)a3 attribution:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EQKitAttributionBox;
  v9 = [(EQKitAttributionBox *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_box, a3);
    objc_storeStrong((id *)&v10->_attribution, a4);
  }

  return v10;
}

- (BOOL)canContainBoxes
{
  return 1;
}

- (id)containedBoxes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(EQKitAttributionBox *)self box];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (double)width
{
  [(EQKitBox *)self->_box width];
  return result;
}

- (double)opticalAlignWidth
{
  [(EQKitBox *)self->_box opticalAlignWidth];
  return result;
}

- (double)height
{
  [(EQKitBox *)self->_box height];
  return result;
}

- (double)depth
{
  [(EQKitBox *)self->_box depth];
  return result;
}

- (CGRect)erasableBounds
{
  [(EQKitBox *)self->_box erasableBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EQKitAttributionBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_, v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_box, "renderIntoContext:offset:", v7, x, y);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->_box, "appendOpticalAlignToSpec:offset:", a3, a4.x, a4.y);
}

- (id)hitTest:(CGPoint)a3
{
  return -[EQKitBox hitTest:](self->_box, "hitTest:", a3.x, a3.y);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  v6 = (EQKitAttributionBox *)a4;
  BOOL v7 = v6 == self || [(EQKitBox *)self->_box p_getTransform:a3 fromDescendant:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double v5 = [(EQKitAttributionBox *)self box];
  v6 = [(EQKitAttributionBox *)self attribution];
  BOOL v7 = (void *)[v4 initWithBox:v5 attribution:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (EQKitAttributionBox *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if ([(EQKitAttributionBox *)v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = v4;
    v6 = [(EQKitAttributionBox *)self box];
    BOOL v7 = [(EQKitAttributionBox *)v5 box];
    if ([v6 isEqual:v7])
    {
      objc_super v8 = [(EQKitAttributionBox *)self attribution];
      v9 = [(EQKitAttributionBox *)v5 attribution];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(EQKitAttributionBox *)self box];
  v6 = [(EQKitAttributionBox *)self attribution];
  BOOL v7 = [v6 source];
  objc_super v8 = [(EQKitAttributionBox *)self attribution];
  v13.location = [v8 range];
  v9 = NSStringFromRange(v13);
  char v10 = [v3 stringWithFormat:@"<%@ %p>: box=%@ source='%@' range=%@", v4, self, v5, v7, v9];

  return v10;
}

- (EQKitBox)box
{
  return self->_box;
}

- (EQKitSourceAttribution)attribution
{
  return self->_attribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);

  objc_storeStrong((id *)&self->_box, 0);
}

@end