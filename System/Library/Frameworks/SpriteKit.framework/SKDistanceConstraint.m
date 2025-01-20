@interface SKDistanceConstraint
+ (BOOL)supportsSecureCoding;
+ (id)constraintWithNode:(id)a3 distanceRange:(id)a4;
+ (id)constraintWithPoint:(CGPoint)a3 distanceRange:(id)a4;
+ (id)constraintWithPoint:(CGPoint)a3 inNode:(id)a4 distanceRange:(id)a5;
- (BOOL)isEqualToDistanceConstraint:(id)a3;
- (CGPoint)point;
- (SKDistanceConstraint)initWithCoder:(id)a3;
- (SKDistanceConstraint)initWithPoint:(CGPoint)a3 inNode:(id)a4 distanceRange:(id)a5;
- (SKNode)node;
- (SKRange)distanceRange;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDistanceRange:(id)a3;
- (void)setNode:(id)a3;
- (void)setPoint:(CGPoint)a3;
@end

@implementation SKDistanceConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKDistanceConstraint)initWithPoint:(CGPoint)a3 inNode:(id)a4 distanceRange:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SKDistanceConstraint;
  v11 = [(SKConstraint *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(SKDistanceConstraint *)v11 setNode:v9];
    [(SKDistanceConstraint *)v12 setDistanceRange:v10];
    -[SKDistanceConstraint setPoint:](v12, "setPoint:", x, y);
  }

  return v12;
}

- (SKDistanceConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKDistanceConstraint;
  v5 = [(SKConstraint *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_node"];
    [(SKDistanceConstraint *)v5 setNode:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_distanceRange"];
    [(SKDistanceConstraint *)v5 setDistanceRange:v7];

    [v4 decodeCGPointForKey:@"_point"];
    -[SKDistanceConstraint setPoint:](v5, "setPoint:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKDistanceConstraint;
  [(SKConstraint *)&v7 encodeWithCoder:v4];
  v5 = [(SKDistanceConstraint *)self node];
  [v4 encodeObject:v5 forKey:@"_node"];

  v6 = [(SKDistanceConstraint *)self distanceRange];
  [v4 encodeObject:v6 forKey:@"_distanceRange"];

  [(SKDistanceConstraint *)self point];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_point");
}

- (BOOL)isEqualToDistanceConstraint:(id)a3
{
  id v4 = (SKDistanceConstraint *)a3;
  if (self != v4)
  {
    v5 = [(SKDistanceConstraint *)self distanceRange];
    v6 = [(SKDistanceConstraint *)v4 distanceRange];
    char v7 = [v5 isEqualToRange:v6];

    if (v7)
    {
      v8 = [(SKDistanceConstraint *)self node];
      if (v8)
      {
      }
      else
      {
        id v10 = [(SKDistanceConstraint *)v4 node];

        if (!v10) {
          goto LABEL_8;
        }
      }
      v11 = [(SKDistanceConstraint *)self node];
      v12 = [(SKDistanceConstraint *)v4 node];
      char v13 = [v11 isEqualToNode:v12];

      if (v13)
      {
LABEL_8:
        [(SKDistanceConstraint *)self point];
        double v15 = v14;
        [(SKDistanceConstraint *)self point];
        float v16 = v15;
        *(float *)&double v17 = v17;
        if ((COERCE_UNSIGNED_INT(v16 - *(float *)&v17) & 0x60000000) == 0)
        {
          [(SKDistanceConstraint *)self point];
          double v20 = v19;
          [(SKDistanceConstraint *)self point];
          float v21 = v20;
          *(float *)&double v22 = v22;
          BOOL v9 = (COERCE_UNSIGNED_INT(v21 - *(float *)&v22) & 0x60000000) == 0;
          goto LABEL_10;
        }
      }
    }
    BOOL v9 = 0;
    goto LABEL_10;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKDistanceConstraint;
  id v4 = [(SKConstraint *)&v8 copyWithZone:a3];
  v5 = [(SKDistanceConstraint *)self node];
  [v4 setNode:v5];

  v6 = [(SKDistanceConstraint *)self distanceRange];
  [v4 setDistanceRange:v6];

  [(SKDistanceConstraint *)self point];
  objc_msgSend(v4, "setPoint:");
  return v4;
}

+ (id)constraintWithNode:(id)a3 distanceRange:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPoint:inNode:distanceRange:", v5, v6, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  return v7;
}

+ (id)constraintWithPoint:(CGPoint)a3 distanceRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  char v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPoint:inNode:distanceRange:", 0, v6, x, y);

  return v7;
}

+ (id)constraintWithPoint:(CGPoint)a3 inNode:(id)a4 distanceRange:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPoint:inNode:distanceRange:", v8, v9, x, y);

  return v10;
}

- (SKRange)distanceRange
{
  return (SKRange *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDistanceRange:(id)a3
{
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_node);

  objc_storeStrong((id *)&self->_distanceRange, 0);
}

@end