@interface SKOrientationConstraint
+ (BOOL)supportsSecureCoding;
+ (id)constraintOrientingToNode:(id)a3 offset:(id)a4;
+ (id)constraintOrientingToPoint:(CGPoint)a3 inNode:(id)a4 offset:(id)a5;
+ (id)constraintOrientingToPoint:(CGPoint)a3 offset:(id)a4;
- (BOOL)isEqualToOrientationConstraint:(id)a3;
- (CGPoint)point;
- (SKNode)node;
- (SKOrientationConstraint)initWithCoder:(id)a3;
- (SKOrientationConstraint)initWithNode:(id)a3 point:(CGPoint)a4 offset:(id)a5;
- (SKRange)offset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setNode:(id)a3;
- (void)setOffset:(id)a3;
- (void)setPoint:(CGPoint)a3;
@end

@implementation SKOrientationConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKOrientationConstraint)initWithNode:(id)a3 point:(CGPoint)a4 offset:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SKOrientationConstraint;
  v11 = [(SKConstraint *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(SKOrientationConstraint *)v11 setNode:v9];
    [(SKOrientationConstraint *)v12 setOffset:v10];
    -[SKOrientationConstraint setPoint:](v12, "setPoint:", x, y);
  }

  return v12;
}

- (SKOrientationConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKOrientationConstraint;
  v5 = [(SKConstraint *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_node"];
    [(SKOrientationConstraint *)v5 setNode:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_offset"];
    [(SKOrientationConstraint *)v5 setOffset:v7];

    [v4 decodeCGPointForKey:@"_point"];
    -[SKOrientationConstraint setPoint:](v5, "setPoint:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKOrientationConstraint;
  [(SKConstraint *)&v7 encodeWithCoder:v4];
  v5 = [(SKOrientationConstraint *)self node];
  [v4 encodeObject:v5 forKey:@"_node"];

  v6 = [(SKOrientationConstraint *)self offset];
  [v4 encodeObject:v6 forKey:@"_offset"];

  [(SKOrientationConstraint *)self point];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_point");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKOrientationConstraint;
  id v4 = [(SKConstraint *)&v8 copyWithZone:a3];
  v5 = [(SKOrientationConstraint *)self node];
  [v4 setNode:v5];

  v6 = [(SKOrientationConstraint *)self offset];
  [v4 setOffset:v6];

  [(SKOrientationConstraint *)self point];
  objc_msgSend(v4, "setPoint:");
  return v4;
}

- (BOOL)isEqualToOrientationConstraint:(id)a3
{
  id v4 = (SKOrientationConstraint *)a3;
  if (self != v4)
  {
    v5 = [(SKOrientationConstraint *)self offset];
    v6 = [(SKOrientationConstraint *)v4 offset];
    char v7 = [v5 isEqualToRange:v6];

    if (v7)
    {
      objc_super v8 = [(SKOrientationConstraint *)self node];
      if (v8
        || ([(SKOrientationConstraint *)v4 node], (v12 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_super v9 = [(SKOrientationConstraint *)self node];
        if (v9)
        {
          id v10 = [(SKOrientationConstraint *)v4 node];

          if (v8) {
          if (!v10)
          }
            goto LABEL_18;
        }
        else
        {

          if (v8) {
        }
          }
        v13 = [(SKOrientationConstraint *)self node];
        if (!v13) {
          goto LABEL_23;
        }
        objc_super v14 = [(SKOrientationConstraint *)v4 node];

        if (!v14
          || ([(SKOrientationConstraint *)self node],
              v15 = objc_claimAutoreleasedReturnValue(),
              [(SKOrientationConstraint *)v4 node],
              v16 = objc_claimAutoreleasedReturnValue(),
              char v17 = [v15 isEqualToNode:v16],
              v16,
              v15,
              (v17 & 1) != 0))
        {
LABEL_23:
          [(SKOrientationConstraint *)self point];
          double v19 = v18;
          [(SKOrientationConstraint *)self point];
          float v20 = v19;
          *(float *)&double v21 = v21;
          if ((COERCE_UNSIGNED_INT(v20 - *(float *)&v21) & 0x60000000) == 0)
          {
            [(SKOrientationConstraint *)self point];
            double v24 = v23;
            [(SKOrientationConstraint *)self point];
            float v25 = v24;
            *(float *)&double v26 = v26;
            BOOL v11 = (COERCE_UNSIGNED_INT(v25 - *(float *)&v26) & 0x60000000) == 0;
            goto LABEL_19;
          }
        }
        goto LABEL_18;
      }
    }
LABEL_18:
    BOOL v11 = 0;
    goto LABEL_19;
  }
  BOOL v11 = 1;
LABEL_19:

  return v11;
}

+ (id)constraintOrientingToPoint:(CGPoint)a3 inNode:(id)a4 offset:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNode:point:offset:", v8, v9, x, y);

  return v10;
}

+ (id)constraintOrientingToNode:(id)a3 offset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNode:point:offset:", v5, v6, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  return v7;
}

+ (id)constraintOrientingToPoint:(CGPoint)a3 offset:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  char v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNode:point:offset:", 0, v6, x, y);

  return v7;
}

- (SKNode)node
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_node);

  return (SKNode *)WeakRetained;
}

- (void)setNode:(id)a3
{
}

- (CGPoint)point
{
  objc_copyStruct(v4, &self->_point, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_point, &v3, 16, 1, 0);
}

- (SKRange)offset
{
  return (SKRange *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);

  objc_destroyWeak((id *)&self->_node);
}

@end