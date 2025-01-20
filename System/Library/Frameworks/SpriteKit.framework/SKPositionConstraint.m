@interface SKPositionConstraint
+ (BOOL)supportsSecureCoding;
+ (id)constraintWithXRange:(id)a3;
+ (id)constraintWithXRange:(id)a3 YRange:(id)a4;
+ (id)constraintWithYRange:(id)a3;
- (BOOL)isEqualToPositionConstraint:(id)a3;
- (SKPositionConstraint)initWithCoder:(id)a3;
- (SKPositionConstraint)initWithXRange:(id)a3 YRange:(id)a4;
- (SKRange)xRange;
- (SKRange)yRange;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setXRange:(id)a3;
- (void)setYRange:(id)a3;
@end

@implementation SKPositionConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKPositionConstraint)initWithXRange:(id)a3 YRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKPositionConstraint;
  v8 = [(SKConstraint *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(SKPositionConstraint *)v8 setXRange:v6];
    [(SKPositionConstraint *)v9 setYRange:v7];
  }

  return v9;
}

- (SKPositionConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKPositionConstraint;
  v5 = [(SKConstraint *)&v9 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_xRange"];
    [(SKPositionConstraint *)v5 setXRange:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_yRange"];
    [(SKPositionConstraint *)v5 setYRange:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKPositionConstraint;
  [(SKConstraint *)&v7 encodeWithCoder:v4];
  v5 = [(SKPositionConstraint *)self xRange];
  [v4 encodeObject:v5 forKey:@"_xRange"];

  id v6 = [(SKPositionConstraint *)self yRange];
  [v4 encodeObject:v6 forKey:@"_yRange"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKPositionConstraint;
  id v4 = [(SKConstraint *)&v8 copyWithZone:a3];
  v5 = [(SKPositionConstraint *)self xRange];
  [v4 setXRange:v5];

  id v6 = [(SKPositionConstraint *)self yRange];
  [v4 setYRange:v6];

  return v4;
}

- (BOOL)isEqualToPositionConstraint:(id)a3
{
  id v4 = (SKPositionConstraint *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    v5 = [(SKPositionConstraint *)self xRange];
    id v6 = [(SKPositionConstraint *)v4 xRange];
    char v7 = [v5 isEqualToRange:v6];

    if (v7)
    {
      objc_super v8 = [(SKPositionConstraint *)self yRange];
      objc_super v9 = [(SKPositionConstraint *)v4 yRange];
      char v10 = [v8 isEqualToRange:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

+ (id)constraintWithXRange:(id)a3 YRange:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithXRange:v5 YRange:v6];

  return v7;
}

+ (id)constraintWithXRange:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = +[SKRange rangeWithNoLimits];
  id v6 = (void *)[v4 initWithXRange:v3 YRange:v5];

  return v6;
}

+ (id)constraintWithYRange:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = +[SKRange rangeWithNoLimits];
  id v6 = (void *)[v4 initWithXRange:v5 YRange:v3];

  return v6;
}

- (SKRange)xRange
{
  return (SKRange *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXRange:(id)a3
{
}

- (SKRange)yRange
{
  return (SKRange *)objc_getProperty(self, a2, 32, 1);
}

- (void)setYRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yRange, 0);

  objc_storeStrong((id *)&self->_xRange, 0);
}

@end