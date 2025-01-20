@interface EQKitOverlayBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)canContainBoxes;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)erasableBounds;
- (EQKitBox)box;
- (EQKitBox)overlayBox;
- (EQKitOverlayBox)initWithBox:(id)a3 overlayBox:(id)a4;
- (double)depth;
- (double)height;
- (double)width;
- (id)containedBoxes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)hitTest:(CGPoint)a3;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitOverlayBox

- (EQKitOverlayBox)initWithBox:(id)a3 overlayBox:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EQKitOverlayBox;
  v9 = [(EQKitOverlayBox *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_box, a3);
    objc_storeStrong((id *)&v10->_overlayBox, a4);
  }

  return v10;
}

- (BOOL)canContainBoxes
{
  return 1;
}

- (id)containedBoxes
{
  v7[2] = *MEMORY[0x263EF8340];
  v3 = [(EQKitOverlayBox *)self box];
  v7[0] = v3;
  v4 = [(EQKitOverlayBox *)self overlayBox];
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

- (double)width
{
  [(EQKitBox *)self->_box width];
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
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(EQKitBox *)self->_overlayBox erasableBounds];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = v4;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;

  return CGRectUnion(*(CGRect *)&v19, *(CGRect *)&v12);
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EQKitOverlayBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_, v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_box, "renderIntoContext:offset:", v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_overlayBox, "renderIntoContext:offset:", v7, x, y);
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
  uint64_t v6 = (EQKitOverlayBox *)a4;
  BOOL v7 = v6 == self || [(EQKitBox *)self->_box p_getTransform:a3 fromDescendant:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(EQKitOverlayBox *)self box];
  uint64_t v6 = [(EQKitOverlayBox *)self overlayBox];
  BOOL v7 = (void *)[v4 initWithBox:v5 overlayBox:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (EQKitOverlayBox *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if ([(EQKitOverlayBox *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    uint64_t v6 = [(EQKitOverlayBox *)self box];
    BOOL v7 = [(EQKitOverlayBox *)v5 box];
    if ([v6 isEqual:v7])
    {
      objc_super v8 = [(EQKitOverlayBox *)self overlayBox];
      uint64_t v9 = [(EQKitOverlayBox *)v5 overlayBox];
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
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitOverlayBox *)self height];
  uint64_t v6 = v5;
  [(EQKitOverlayBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitOverlayBox *)self width];
  uint64_t v10 = v9;
  uint64_t v11 = [(EQKitOverlayBox *)self box];
  uint64_t v12 = [(EQKitOverlayBox *)self overlayBox];
  uint64_t v13 = [v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f box=%@ overlayBox=%@ ", v4, self, v6, v8, v10, v11, v12];

  return v13;
}

- (EQKitBox)box
{
  return self->_box;
}

- (EQKitBox)overlayBox
{
  return self->_overlayBox;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayBox, 0);

  objc_storeStrong((id *)&self->_box, 0);
}

@end