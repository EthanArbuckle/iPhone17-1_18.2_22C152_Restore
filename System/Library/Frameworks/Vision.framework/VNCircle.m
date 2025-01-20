@interface VNCircle
+ (BOOL)supportsSecureCoding;
+ (VNCircle)zeroCircle;
- (BOOL)containsPoint:(VNPoint *)point;
- (BOOL)containsPoint:(VNPoint *)point inCircumferentialRingOfWidth:(double)ringWidth;
- (BOOL)isEqual:(id)a3;
- (VNCircle)init;
- (VNCircle)initWithCenter:(VNPoint *)center diameter:(double)diameter;
- (VNCircle)initWithCenter:(VNPoint *)center radius:(double)radius;
- (VNCircle)initWithCoder:(id)a3;
- (VNPoint)center;
- (double)diameter;
- (double)radius;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNCircle

- (void).cxx_destruct
{
}

- (double)radius
{
  return self->_radius;
}

- (VNPoint)center
{
  return (VNPoint *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(VNCircle *)self center];
  [(VNCircle *)self radius];
  uint64_t v6 = v5;
  [(VNCircle *)self diameter];
  v8 = (void *)[v3 initWithFormat:@"center = %@; radius = %f (diameter = %f)", v4, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(VNCircle *)self center];
    uint64_t v7 = [v5 center];
    char v8 = VisionCoreEqualOrNilObjects();

    if (v8)
    {
      [(VNCircle *)self radius];
      double v10 = v9;
      [v5 radius];
      BOOL v12 = v10 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)VNCircle;
  id v3 = [(VNCircle *)&v9 hash];
  id v4 = [(VNCircle *)self center];
  uint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  [(VNCircle *)self radius];
  double v7 = v6;
  if (v6 == 0.0) {
    double v7 = 0.0;
  }
  return *(void *)&v7 ^ __ROR8__(v5, 51);
}

- (BOOL)containsPoint:(VNPoint *)point inCircumferentialRingOfWidth:(double)ringWidth
{
  double v6 = point;
  if (ringWidth >= 0.0)
  {
    char v8 = [(VNCircle *)self center];
    objc_super v9 = [VNVector alloc];
    [(VNPoint *)v6 x];
    double v11 = v10;
    [v8 x];
    double v13 = v12;
    [(VNPoint *)v6 y];
    double v15 = v14;
    [v8 y];
    v17 = [(VNVector *)v9 initWithXComponent:v11 - v13 yComponent:v15 - v16];
    [(VNVector *)v17 length];
    double v19 = v18;
    [(VNCircle *)self radius];
    double v20 = ringWidth * 0.5;
    if (v19 <= ringWidth * 0.5 + v21)
    {
      [(VNVector *)v17 length];
      double v23 = v22;
      [(VNCircle *)self radius];
      BOOL v7 = v23 >= v24 - v20;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)containsPoint:(VNPoint *)point
{
  id v4 = point;
  uint64_t v5 = [(VNCircle *)self center];
  double v6 = [VNVector alloc];
  [(VNPoint *)v4 x];
  double v8 = v7;
  [v5 x];
  double v10 = v9;
  [(VNPoint *)v4 y];
  double v12 = v11;
  [v5 y];
  double v14 = [(VNVector *)v6 initWithXComponent:v8 - v10 yComponent:v12 - v13];
  [(VNVector *)v14 length];
  double v16 = v15;
  [(VNCircle *)self radius];
  LOBYTE(self) = v16 <= v17;

  return (char)self;
}

- (double)diameter
{
  [(VNCircle *)self radius];
  return v2 + v2;
}

- (VNCircle)initWithCenter:(VNPoint *)center diameter:(double)diameter
{
  return [(VNCircle *)self initWithCenter:center radius:diameter * 0.5];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_center forKey:@"ctr"];
  [v4 encodeDouble:@"rds" forKey:self->_radius];
}

- (VNCircle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ctr"];
  double v6 = (void *)[v5 copy];

  [v4 decodeDoubleForKey:@"rds"];
  double v7 = -[VNCircle initWithCenter:radius:](self, "initWithCenter:radius:", v6);

  return v7;
}

- (VNCircle)initWithCenter:(VNPoint *)center radius:(double)radius
{
  double v6 = center;
  v15.receiver = self;
  v15.super_class = (Class)VNCircle;
  double v7 = [(VNCircle *)&v15 init];
  if (!v7) {
    goto LABEL_13;
  }
  BOOL v8 = (*(void *)&radius & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  BOOL v9 = radius < 0.0 && ((*(void *)&radius & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (radius >= 0.0) {
    BOOL v8 = 0;
  }
  int v10 = (*(void *)&radius & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v8;
  if ((*(void *)&radius & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000) {
    int v10 = 1;
  }
  if (((v10 | v9) & 1) == 0)
  {
    uint64_t v12 = [(VNPoint *)v6 copy];
    double v13 = v7->_center;
    v7->_center = (VNPoint *)v12;

    v7->_radius = radius;
    double v11 = v7;
  }
  else
  {
LABEL_13:
    double v11 = 0;
  }

  return v11;
}

- (VNCircle)init
{
  id v3 = +[VNPoint zeroPoint];
  id v4 = [(VNCircle *)self initWithCenter:v3 radius:0.0];

  return v4;
}

+ (VNCircle)zeroCircle
{
  if (+[VNCircle zeroCircle]::onceToken != -1) {
    dispatch_once(&+[VNCircle zeroCircle]::onceToken, &__block_literal_global_37702);
  }
  double v2 = (void *)+[VNCircle zeroCircle]::zeroCircle;

  return (VNCircle *)v2;
}

void __22__VNCircle_zeroCircle__block_invoke()
{
  v0 = [VNCircle alloc];
  id v3 = +[VNPoint zeroPoint];
  uint64_t v1 = -[VNCircle initWithCenter:radius:](v0, "initWithCenter:radius:", 0.0);
  double v2 = (void *)+[VNCircle zeroCircle]::zeroCircle;
  +[VNCircle zeroCircle]::zeroCircle = v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end