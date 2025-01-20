@interface CKQuadTreeNode
- (BOOL)isLeaf;
- (CGRect)bounds;
- (CKQuadTreeNode)init;
- (CKQuadTreeNode)initWithBounds:(CGRect)a3;
- (NSArray)nodes;
- (NSValue)point;
- (id)debugDescription;
- (id)debugDescriptionWithLevel:(int64_t)a3;
- (id)description;
- (id)nodeForPoint:(CGPoint)a3;
- (id)objectForKey:(id)a3;
- (void)insertPoint:(CGPoint)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPoint:(id)a3;
- (void)visit:(id)a3;
@end

@implementation CKQuadTreeNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_point, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_bottomRight, 0);
  objc_storeStrong((id *)&self->_bottomLeft, 0);
  objc_storeStrong((id *)&self->_topLeft, 0);
  objc_storeStrong((id *)&self->_topRight, 0);
}

- (void)setPoint:(id)a3
{
}

- (NSValue)point
{
  return self->_point;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_userInfo objectForKey:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)visit:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4 && ((*((uint64_t (**)(id, CKQuadTreeNode *))v4 + 2))(v4, self) & 1) == 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = [(CKQuadTreeNode *)self nodes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) visit:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)insertPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!CGRectContainsPoint(self->_bounds, a3))
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"CKQuadTree.m" lineNumber:99 description:@"You can only insert points within the calculated bounds"];
  }
  point = self->_point;
  if (!point)
  {
    if ([(CKQuadTreeNode *)self isLeaf])
    {
      objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
      self->_point = (NSValue *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    point = self->_point;
  }
  [(NSValue *)point CGPointValue];
  double v9 = v8;
  double v11 = v10;
  if ([(CKQuadTreeNode *)self isLeaf] && vabdd_f64(x, v9) + vabdd_f64(y, v11) > 0.00999999978)
  {
    long long v12 = -[CKQuadTreeNode nodeForPoint:](self, "nodeForPoint:", v9, v11);
    objc_msgSend(v12, "insertPoint:", v9, v11);

    long long v13 = self->_point;
    self->_point = 0;
  }
  -[CKQuadTreeNode nodeForPoint:](self, "nodeForPoint:", x, y);
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "insertPoint:", x, y);
LABEL_11:
  MEMORY[0x270F9A758]();
}

- (id)nodeForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  memset(&v24, 0, sizeof(v24));
  memset(&v23, 0, sizeof(v23));
  CGFloat v6 = CGRectGetWidth(self->_bounds) * 0.5;
  CGRectDivide(self->_bounds, &slice, &remainder, v6, CGRectMinXEdge);
  CGFloat v7 = CGRectGetHeight(self->_bounds) * 0.5;
  CGRectDivide(slice, &slice, &v24, v7, CGRectMinYEdge);
  CGFloat v8 = CGRectGetHeight(self->_bounds) * 0.5;
  CGRectDivide(remainder, &remainder, &v23, v8, CGRectMinYEdge);
  v28.CGFloat x = x;
  v28.CGFloat y = y;
  if (CGRectContainsPoint(remainder, v28))
  {
    topRight = self->_topRight;
    p_topRight = &self->_topRight;
    double v10 = topRight;
    long long v12 = topRight;
    if (topRight) {
      goto LABEL_14;
    }
    long long v13 = [CKQuadTreeNode alloc];
    double v14 = remainder.origin.x;
    double v15 = remainder.origin.y;
    double width = remainder.size.width;
    double height = remainder.size.height;
    goto LABEL_13;
  }
  v29.CGFloat x = x;
  v29.CGFloat y = y;
  if (CGRectContainsPoint(slice, v29))
  {
    topLeft = self->_topLeft;
    p_topRight = &self->_topLeft;
    double v10 = topLeft;
    long long v12 = topLeft;
    if (topLeft) {
      goto LABEL_14;
    }
    long long v13 = [CKQuadTreeNode alloc];
    double v14 = slice.origin.x;
    double v15 = slice.origin.y;
    double width = slice.size.width;
    double height = slice.size.height;
    goto LABEL_13;
  }
  v30.CGFloat x = x;
  v30.CGFloat y = y;
  if (CGRectContainsPoint(v24, v30))
  {
    bottomLeft = self->_bottomLeft;
    p_topRight = &self->_bottomLeft;
    double v10 = bottomLeft;
    long long v12 = bottomLeft;
    if (bottomLeft) {
      goto LABEL_14;
    }
    long long v13 = [CKQuadTreeNode alloc];
    double v14 = v24.origin.x;
    double v15 = v24.origin.y;
    double width = v24.size.width;
    double height = v24.size.height;
    goto LABEL_13;
  }
  v31.CGFloat x = x;
  v31.CGFloat y = y;
  if (!CGRectContainsPoint(v23, v31))
  {
    v21 = 0;
    goto LABEL_16;
  }
  bottomRight = self->_bottomRight;
  p_topRight = &self->_bottomRight;
  double v10 = bottomRight;
  long long v12 = bottomRight;
  if (!bottomRight)
  {
    long long v13 = [CKQuadTreeNode alloc];
    double v15 = v23.origin.y;
    double v14 = v23.origin.x;
    double height = v23.size.height;
    double width = v23.size.width;
LABEL_13:
    long long v12 = -[CKQuadTreeNode initWithBounds:](v13, "initWithBounds:", v14, v15, width, height, *(_OWORD *)&v23.origin, *(_OWORD *)&v23.size);
  }
LABEL_14:
  objc_storeStrong((id *)p_topRight, v12);
  v21 = v12;
  if (!v10) {

  }
LABEL_16:
  return v21;
}

- (BOOL)isLeaf
{
  return !self->_topLeft && !self->_topRight && !self->_bottomLeft && self->_bottomRight == 0;
}

- (NSArray)nodes
{
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", self->_topRight, 0);
  id v4 = v3;
  if (self->_topLeft) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_bottomLeft) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_bottomRight) {
    objc_msgSend(v4, "addObject:");
  }
  v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

- (id)debugDescription
{
  return [(CKQuadTreeNode *)self debugDescriptionWithLevel:0];
}

- (id)debugDescriptionWithLevel:(int64_t)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  int64_t v4 = a3 + 1;
  uint64_t v5 = [(CKQuadTreeNode *)self->_topRight debugDescriptionWithLevel:a3 + 1];
  CGFloat v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263EFF9D0] null];
  }
  v27 = (void *)v5;
  v34[0] = v5;
  CGFloat v7 = [(CKQuadTreeNode *)self->_topLeft debugDescriptionWithLevel:v4];
  CGFloat v8 = v7;
  if (!v7)
  {
    CGFloat v8 = [MEMORY[0x263EFF9D0] null];
  }
  v34[1] = v8;
  double v9 = [(CKQuadTreeNode *)self->_bottomLeft debugDescriptionWithLevel:v4];
  double v10 = v9;
  if (!v9)
  {
    double v10 = [MEMORY[0x263EFF9D0] null];
  }
  v34[2] = v10;
  double v11 = [(CKQuadTreeNode *)self->_bottomRight debugDescriptionWithLevel:v4];
  long long v12 = v11;
  if (!v11)
  {
    long long v12 = [MEMORY[0x263EFF9D0] null];
  }
  v34[3] = v12;
  long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  double v14 = (void *)[v13 mutableCopy];

  if (!v11) {
  if (!v9)
  }

  if (!v7) {
  if (!v6)
  }

  double v15 = [MEMORY[0x263EFF9D0] null];
  [v14 removeObject:v15];

  uint64_t v16 = [MEMORY[0x263F089D8] string];
  v17 = [MEMORY[0x263F089D8] stringWithString:@"\n"];
  if ((a3 & 0x8000000000000000) == 0)
  {
    int64_t v18 = a3 + 1;
    do
    {
      [v17 appendString:@"  | "];
      --v18;
    }
    while (v18);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v19 = v14;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        [v16 appendFormat:@"%@%@", v17, *(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v21);
  }

  CGRect v24 = [(CKQuadTreeNode *)self description];
  v25 = [v24 stringByAppendingString:v16];

  return v25;
}

- (id)description
{
  v3 = self->_point;
  if (v3)
  {
    int64_t v4 = NSString;
    [(NSValue *)v3 CGPointValue];
    uint64_t v5 = NSStringFromCGPoint(v14);
    CGFloat v6 = [v4 stringWithFormat:@", point: %@", v5];
  }
  else
  {
    CGFloat v6 = &stru_26DF570D0;
  }
  CGFloat v7 = NSString;
  CGFloat v8 = (objc_class *)objc_opt_class();
  double v9 = NSStringFromClass(v8);
  double v10 = NSStringFromCGRect(self->_bounds);
  double v11 = [v7 stringWithFormat:@"<%@: %p, bounds: %@%@>", v9, self, v10, v6];

  return v11;
}

- (CKQuadTreeNode)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    double v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CKQuadTree.m", 28, @"Invalid parameter not satisfying: %@", @"!CGRectIsNull(bounds)" object file lineNumber description];
  }
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  if (v9 != CGRectGetWidth(v19))
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"CKQuadTree.m" lineNumber:29 description:@"The bounds must be square"];
  }
  v17.receiver = self;
  v17.super_class = (Class)CKQuadTreeNode;
  double v10 = [(CKQuadTreeNode *)&v17 init];
  double v11 = v10;
  if (v10)
  {
    v10->_bounds.origin.CGFloat x = x;
    v10->_bounds.origin.CGFloat y = y;
    v10->_bounds.size.CGFloat width = width;
    v10->_bounds.size.CGFloat height = height;
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    userInfo = v11->_userInfo;
    v11->_userInfo = (NSMutableDictionary *)v12;
  }
  return v11;
}

- (CKQuadTreeNode)init
{
  return -[CKQuadTreeNode initWithBounds:](self, "initWithBounds:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

@end