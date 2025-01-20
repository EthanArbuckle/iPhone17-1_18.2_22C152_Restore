@interface SKRotationConstraint
+ (BOOL)supportsSecureCoding;
+ (id)constraintWithZRotationRange:(id)a3;
- (BOOL)isEqualToRotationConstraint:(id)a3;
- (SKRange)zRotationRange;
- (SKRotationConstraint)initWithCoder:(id)a3;
- (SKRotationConstraint)initWithZRotationRange:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setZRotationRange:(id)a3;
@end

@implementation SKRotationConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRotationConstraint)initWithZRotationRange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRotationConstraint;
  v5 = [(SKConstraint *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SKRotationConstraint *)v5 setZRotationRange:v4];
  }

  return v6;
}

- (SKRotationConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRotationConstraint;
  v5 = [(SKConstraint *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_zRotationRange"];
    [(SKRotationConstraint *)v5 setZRotationRange:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKRotationConstraint;
  [(SKConstraint *)&v6 encodeWithCoder:v4];
  v5 = [(SKRotationConstraint *)self zRotationRange];
  [v4 encodeObject:v5 forKey:@"_zRotationRange"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKRotationConstraint;
  id v4 = [(SKConstraint *)&v7 copyWithZone:a3];
  v5 = [(SKRotationConstraint *)self zRotationRange];
  [v4 setZRotationRange:v5];

  return v4;
}

- (BOOL)isEqualToRotationConstraint:(id)a3
{
  id v4 = (SKRotationConstraint *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    v5 = [(SKRotationConstraint *)self zRotationRange];
    objc_super v6 = [(SKRotationConstraint *)v4 zRotationRange];
    char v7 = [v5 isEqualToRange:v6];
  }
  return v7;
}

+ (id)constraintWithZRotationRange:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithZRotationRange:v3];

  return v4;
}

- (SKRange)zRotationRange
{
  return (SKRange *)objc_getProperty(self, a2, 24, 1);
}

- (void)setZRotationRange:(id)a3
{
}

- (void).cxx_destruct
{
}

@end