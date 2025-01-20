@interface ACUISSizeDimensionRequest
+ (BOOL)supportsSecureCoding;
+ (id)fixed:(double)a3;
+ (id)new;
- (ACUISSizeDimensionRequest)init;
- (ACUISSizeDimensionRequest)initWithCoder:(id)a3;
- (ACUISSizeDimensionRequest)initWithDimensionRequest:(id)a3;
- (ACUISSizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4;
- (ACUISSizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4 type:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (double)maximum;
- (double)minimum;
- (id)_sizeDimensionRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)objcTypeFromSwift:(int64_t)a3;
- (int64_t)swiftTypeFromObjc:(int64_t)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ACUISSizeDimensionRequest

+ (id)new
{
  return 0;
}

- (ACUISSizeDimensionRequest)init
{
  return 0;
}

- (ACUISSizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4 type:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ACUISSizeDimensionRequest;
  result = [(ACUISSizeDimensionRequest *)&v9 init];
  if (result)
  {
    result->_minimum = a3;
    result->_maximum = a4;
    result->_type = a5;
  }
  return result;
}

- (ACUISSizeDimensionRequest)initWithDimensionRequest:(id)a3
{
  id v4 = a3;
  [v4 minimum];
  double v6 = v5;
  [v4 maximum];
  double v8 = v7;
  uint64_t v9 = [v4 type];

  int64_t v10 = [(ACUISSizeDimensionRequest *)self objcTypeFromSwift:v9];
  return [(ACUISSizeDimensionRequest *)self initWithMinimum:v10 maximum:v6 type:v8];
}

- (ACUISSizeDimensionRequest)initWithMinimum:(double)a3 maximum:(double)a4
{
  return [(ACUISSizeDimensionRequest *)self initWithMinimum:1 maximum:a3 type:a4];
}

+ (id)fixed:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithMinimum:0 maximum:a3 type:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ACUISSizeDimensionRequest *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      BOOL v6 = self->_minimum == v5->_minimum && self->_maximum == v5->_maximum && self->_type == v5->_type;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((unint64_t)self->_minimum) {
    BOOL v2 = (unint64_t)self->_maximum == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || self->_type == 0) {
    return 0;
  }
  else {
    return 3;
  }
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = v3;
  if (self->_type) {
    double v5 = @"dynamic";
  }
  else {
    double v5 = @"fixed";
  }
  [v3 appendString:v5 withName:@"type"];
  id v6 = (id)[v4 appendDouble:@"minimum" withName:2 decimalPrecision:self->_minimum];
  id v7 = (id)[v4 appendDouble:@"maximum" withName:2 decimalPrecision:self->_maximum];
  double v8 = [v4 build];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [ACUISSizeDimensionRequest alloc];
  [(ACUISSizeDimensionRequest *)self minimum];
  double v6 = v5;
  [(ACUISSizeDimensionRequest *)self maximum];
  double v8 = v7;
  int64_t v9 = [(ACUISSizeDimensionRequest *)self type];
  return [(ACUISSizeDimensionRequest *)v4 initWithMinimum:v9 maximum:v6 type:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACUISSizeDimensionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"min"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"max"];
  double v8 = v7;
  uint64_t v9 = [v4 decodeIntegerForKey:@"type"];

  return [(ACUISSizeDimensionRequest *)self initWithMinimum:v9 maximum:v6 type:v8];
}

- (void)encodeWithCoder:(id)a3
{
  double minimum = self->_minimum;
  id v5 = a3;
  [v5 encodeDouble:@"min" forKey:minimum];
  [v5 encodeDouble:@"max" forKey:self->_maximum];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (id)_sizeDimensionRequest
{
  v3 = [_TtC18ActivityUIServices20SizeDimensionRequest alloc];
  [(ACUISSizeDimensionRequest *)self minimum];
  double v5 = v4;
  [(ACUISSizeDimensionRequest *)self maximum];
  double v7 = [(SizeDimensionRequest *)v3 initWithMinimum:[(ACUISSizeDimensionRequest *)self swiftTypeFromObjc:[(ACUISSizeDimensionRequest *)self type]] maximum:v5 type:v6];
  return v7;
}

- (int64_t)objcTypeFromSwift:(int64_t)a3
{
  return a3 != 1;
}

- (int64_t)swiftTypeFromObjc:(int64_t)a3
{
  return a3 == 0;
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

- (int64_t)type
{
  return self->_type;
}

@end