@interface SKSizeConstraint
+ (BOOL)supportsSecureCoding;
+ (id)constraintWithHeightRange:(id)a3;
+ (id)constraintWithWidthRange:(id)a3;
+ (id)constraintWithWidthRange:(id)a3 heightRange:(id)a4;
- (BOOL)isEqualToSizeConstraint:(id)a3;
- (SKRange)heightRange;
- (SKRange)widthRange;
- (SKSizeConstraint)initWithCoder:(id)a3;
- (SKSizeConstraint)initWithWidthRange:(id)a3 heightRange:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHeightRange:(id)a3;
- (void)setWidthRange:(id)a3;
@end

@implementation SKSizeConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSizeConstraint)initWithWidthRange:(id)a3 heightRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKSizeConstraint;
  v8 = [(SKConstraint *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(SKSizeConstraint *)v8 setWidthRange:v6];
    [(SKSizeConstraint *)v9 setHeightRange:v7];
  }

  return v9;
}

- (SKSizeConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKSizeConstraint;
  v5 = [(SKConstraint *)&v9 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_widthRange"];
    [(SKSizeConstraint *)v5 setWidthRange:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_heightRange"];
    [(SKSizeConstraint *)v5 setHeightRange:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKSizeConstraint;
  [(SKConstraint *)&v7 encodeWithCoder:v4];
  v5 = [(SKSizeConstraint *)self widthRange];
  [v4 encodeObject:v5 forKey:@"_widthRange"];

  id v6 = [(SKSizeConstraint *)self heightRange];
  [v4 encodeObject:v6 forKey:@"_heightRange"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKSizeConstraint;
  id v4 = [(SKConstraint *)&v8 copyWithZone:a3];
  v5 = [(SKSizeConstraint *)self widthRange];
  [v4 setWidthRange:v5];

  id v6 = [(SKSizeConstraint *)self heightRange];
  [v4 setHeightRange:v6];

  return v4;
}

- (BOOL)isEqualToSizeConstraint:(id)a3
{
  id v4 = (SKSizeConstraint *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    v5 = [(SKSizeConstraint *)self widthRange];
    id v6 = [(SKSizeConstraint *)v4 widthRange];
    char v7 = [v5 isEqualToRange:v6];

    if (v7)
    {
      objc_super v8 = [(SKSizeConstraint *)self heightRange];
      objc_super v9 = [(SKSizeConstraint *)v4 heightRange];
      char v10 = [v8 isEqualToRange:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

+ (id)constraintWithWidthRange:(id)a3 heightRange:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWidthRange:v5 heightRange:v6];

  return v7;
}

+ (id)constraintWithWidthRange:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = +[SKRange rangeWithNoLimits];
  id v6 = (void *)[v4 initWithWidthRange:v3 heightRange:v5];

  return v6;
}

+ (id)constraintWithHeightRange:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = +[SKRange rangeWithNoLimits];
  id v6 = (void *)[v4 initWithWidthRange:v5 heightRange:v3];

  return v6;
}

- (SKRange)widthRange
{
  return (SKRange *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWidthRange:(id)a3
{
}

- (SKRange)heightRange
{
  return (SKRange *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHeightRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightRange, 0);

  objc_storeStrong((id *)&self->_widthRange, 0);
}

@end