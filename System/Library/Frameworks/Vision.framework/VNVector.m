@interface VNVector
+ (BOOL)supportsSecureCoding;
+ (VNVector)unitVectorForVector:(VNVector *)vector;
+ (VNVector)vectorByAddingVector:(VNVector *)v1 toVector:(VNVector *)v2;
+ (VNVector)vectorByMultiplyingVector:(VNVector *)vector byScalar:(double)scalar;
+ (VNVector)vectorBySubtractingVector:(VNVector *)v1 fromVector:(VNVector *)v2;
+ (VNVector)zeroVector;
+ (double)dotProductOfVector:(VNVector *)v1 vector:(VNVector *)v2;
- (BOOL)isEqual:(id)a3;
- (VNVector)init;
- (VNVector)initWithCoder:(id)a3;
- (VNVector)initWithR:(double)r theta:(double)theta;
- (VNVector)initWithVectorHead:(VNPoint *)head tail:(VNPoint *)tail;
- (VNVector)initWithXComponent:(double)x yComponent:(double)y;
- (double)length;
- (double)squaredLength;
- (double)theta;
- (double)x;
- (double)y;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNVector

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = [NSString alloc];
  [(VNVector *)self x];
  uint64_t v5 = v4;
  [(VNVector *)self y];
  uint64_t v7 = v6;
  [(VNVector *)self r];
  uint64_t v9 = v8;
  [(VNVector *)self theta];
  v11 = objc_msgSend(v3, "initWithFormat:", @"(x; y) = (%f; %f); (r; theta) = (%f; %f)", v5, v7, v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = self->_vectorProjections;
    char v6 = VisionCoreEqualOrNilObjects();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNVector;
  return [(VNPoint *)self->_vectorProjections hash] ^ __ROR8__([(VNVector *)&v3 hash], 51);
}

- (double)squaredLength
{
  [(VNVector *)self x];
  double v4 = v3 * v3;
  [(VNVector *)self y];
  return v4 + v5 * v5;
}

- (double)length
{
  [(VNVector *)self squaredLength];
  return sqrt(v2);
}

- (double)theta
{
  [(VNPoint *)self->_vectorProjections y];
  double v4 = v3;
  [(VNPoint *)self->_vectorProjections x];
  double v6 = v4 / v5;

  return atan(v6);
}

- (double)y
{
  [(VNPoint *)self->_vectorProjections y];
  return result;
}

- (double)x
{
  [(VNPoint *)self->_vectorProjections x];
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (VNVector)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vproj"];
  double v6 = (void *)[v5 copy];

  [v6 x];
  double v8 = v7;
  [v6 y];
  uint64_t v10 = [(VNVector *)self initWithXComponent:v8 yComponent:v9];

  return v10;
}

- (VNVector)initWithVectorHead:(VNPoint *)head tail:(VNPoint *)tail
{
  double v6 = head;
  double v7 = tail;
  [(VNPoint *)v7 x];
  double v9 = v8;
  [(VNPoint *)v6 x];
  double v11 = v10;
  [(VNPoint *)v7 y];
  double v13 = v12;
  [(VNPoint *)v6 y];
  v15 = [(VNVector *)self initWithXComponent:v9 - v11 yComponent:v13 - v14];

  return v15;
}

- (VNVector)initWithR:(double)r theta:(double)theta
{
  if ((*(void *)&r & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(void *)&theta & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    __double2 v7 = __sincos_stret(theta);
    self = [(VNVector *)self initWithXComponent:v7.__cosval * r yComponent:v7.__sinval * r];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (VNVector)initWithXComponent:(double)x yComponent:(double)y
{
  v11.receiver = self;
  v11.super_class = (Class)VNVector;
  double v6 = [(VNVector *)&v11 init];
  if (v6
    && (*(void *)&x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(void *)&y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    double v9 = [[VNPoint alloc] initWithX:x y:y];
    vectorProjections = v6->_vectorProjections;
    v6->_vectorProjections = v9;

    __double2 v7 = v6;
  }
  else
  {
    __double2 v7 = 0;
  }

  return v7;
}

- (VNVector)init
{
  return [(VNVector *)self initWithXComponent:0.0 yComponent:0.0];
}

+ (double)dotProductOfVector:(VNVector *)v1 vector:(VNVector *)v2
{
  double v5 = v1;
  double v6 = v2;
  [(VNVector *)v5 x];
  double v8 = v7;
  [(VNVector *)v6 x];
  double v10 = v9;
  [(VNVector *)v5 y];
  double v12 = v11;
  [(VNVector *)v6 y];
  double v14 = v12 * v13 + v8 * v10;

  return v14;
}

+ (VNVector)vectorBySubtractingVector:(VNVector *)v1 fromVector:(VNVector *)v2
{
  double v5 = v1;
  double v6 = v2;
  double v7 = [VNVector alloc];
  [(VNVector *)v6 x];
  double v9 = v8;
  [(VNVector *)v5 x];
  double v11 = v10;
  [(VNVector *)v6 y];
  double v13 = v12;
  [(VNVector *)v5 y];
  v15 = [(VNVector *)v7 initWithXComponent:v9 - v11 yComponent:v13 - v14];

  return v15;
}

+ (VNVector)vectorByAddingVector:(VNVector *)v1 toVector:(VNVector *)v2
{
  double v5 = v1;
  double v6 = v2;
  double v7 = [VNVector alloc];
  [(VNVector *)v5 x];
  double v9 = v8;
  [(VNVector *)v6 x];
  double v11 = v10;
  [(VNVector *)v5 y];
  double v13 = v12;
  [(VNVector *)v6 y];
  v15 = [(VNVector *)v7 initWithXComponent:v9 + v11 yComponent:v13 + v14];

  return v15;
}

+ (VNVector)vectorByMultiplyingVector:(VNVector *)vector byScalar:(double)scalar
{
  double v5 = vector;
  double v6 = [VNVector alloc];
  [(VNVector *)v5 x];
  double v8 = v7;
  [(VNVector *)v5 y];
  double v10 = [(VNVector *)v6 initWithXComponent:v8 * scalar yComponent:v9 * scalar];

  return v10;
}

+ (VNVector)unitVectorForVector:(VNVector *)vector
{
  id v4 = vector;
  [(VNVector *)v4 length];
  double v6 = v5;
  if (v5 == 0.0)
  {
    uint64_t v7 = [a1 copy];
  }
  else
  {
    double v8 = [VNVector alloc];
    [(VNVector *)v4 x];
    double v10 = v9;
    [(VNVector *)v4 y];
    uint64_t v7 = [(VNVector *)v8 initWithXComponent:v10 / v6 yComponent:v11 / v6];
  }
  double v12 = (void *)v7;

  return (VNVector *)v12;
}

+ (VNVector)zeroVector
{
  if (+[VNVector zeroVector]::onceToken != -1) {
    dispatch_once(&+[VNVector zeroVector]::onceToken, &__block_literal_global_26362);
  }
  double v2 = (void *)+[VNVector zeroVector]::zeroVector;

  return (VNVector *)v2;
}

uint64_t __22__VNVector_zeroVector__block_invoke()
{
  +[VNVector zeroVector]::zeroVector = [[VNVector alloc] initWithXComponent:0.0 yComponent:0.0];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end