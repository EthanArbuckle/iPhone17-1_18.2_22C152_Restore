@interface CIVector
+ (BOOL)supportsSecureCoding;
+ (CIVector)vectorWithCGAffineTransform:(CGAffineTransform *)t;
+ (CIVector)vectorWithCGPoint:(CGPoint)p;
+ (CIVector)vectorWithCGRect:(CGRect)r;
+ (CIVector)vectorWithString:(NSString *)representation;
+ (CIVector)vectorWithValues:(const CGFloat *)values count:(size_t)count;
+ (CIVector)vectorWithX:(CGFloat)x;
+ (CIVector)vectorWithX:(CGFloat)x Y:(CGFloat)y;
+ (CIVector)vectorWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z;
+ (CIVector)vectorWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z W:(CGFloat)w;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)CGAffineTransformValue;
- (CGFloat)W;
- (CGFloat)X;
- (CGFloat)Y;
- (CGFloat)Z;
- (CGFloat)valueAtIndex:(size_t)index;
- (CGPoint)CGPointValue;
- (CGRect)CGRectValue;
- (CIVector)init;
- (CIVector)initWithCGAffineTransform:(CGAffineTransform *)r;
- (CIVector)initWithCGPoint:(CGPoint)p;
- (CIVector)initWithCGRect:(CGRect)r;
- (CIVector)initWithCoder:(id)a3;
- (CIVector)initWithString:(NSString *)representation;
- (CIVector)initWithValues:(const CGFloat *)values count:(size_t)count;
- (CIVector)initWithX:(CGFloat)x;
- (CIVector)initWithX:(CGFloat)x Y:(CGFloat)y;
- (CIVector)initWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z;
- (CIVector)initWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z W:(CGFloat)w;
- (double)_values;
- (float)_dot:(id)a3;
- (float)_norm;
- (id)_orthonormalizeTo:(id)a3;
- (id)description;
- (size_t)count;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CIVector

- (size_t)count
{
  return self->_count;
}

- (void)dealloc
{
  if (self->_count >= 5) {
    free(self->_u.ptr);
  }
  v3.receiver = self;
  v3.super_class = (Class)CIVector;
  [(CIVector *)&v3 dealloc];
}

+ (CIVector)vectorWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z
{
  v5 = (void *)[objc_alloc((Class)a1) initWithX:x Y:y Z:z];

  return (CIVector *)v5;
}

- (CIVector)initWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z
{
  v6[3] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)v6 = x;
  *(CGFloat *)&v6[1] = y;
  *(CGFloat *)&v6[2] = z;
  return [(CIVector *)self initWithValues:v6 count:3];
}

+ (CIVector)vectorWithX:(CGFloat)x Y:(CGFloat)y
{
  v4 = (void *)[objc_alloc((Class)a1) initWithX:x Y:y];

  return (CIVector *)v4;
}

- (CIVector)initWithX:(CGFloat)x Y:(CGFloat)y
{
  v5[2] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)v5 = x;
  *(CGFloat *)&v5[1] = y;
  return [(CIVector *)self initWithValues:v5 count:2];
}

- (CIVector)initWithValues:(const CGFloat *)values count:(size_t)count
{
  v14.receiver = self;
  v14.super_class = (Class)CIVector;
  v6 = [(CIVector *)&v14 init];
  v7 = v6;
  if (v6 && count)
  {
    if (count >= 0x401)
    {
LABEL_4:

      return 0;
    }
    v6->_count = count;
    if (count > 4)
    {
      v11 = (double *)malloc_type_malloc(8 * count, 0x100004000313F17uLL);
      v7->_u.ptr = v11;
      if (!v11) {
        goto LABEL_4;
      }
      uint64_t v12 = 0;
      do
      {
        v7->_u.ptr[v12] = values[v12];
        ++v12;
      }
      while (count != v12);
    }
    else
    {
      uint64_t v8 = 0;
      do
      {
        v6->_u.vec[v8] = values[v8];
        ++v8;
      }
      while (count != v8);
      if ((unint64_t)(v8 - 1) <= 2)
      {
        v9 = &v6->_u.vec[count];
        size_t v10 = 3 - count;
        if (count > 3) {
          size_t v10 = 0;
        }
        bzero(v9, 8 * v10 + 8);
      }
    }
  }
  return v7;
}

- (CGFloat)Z
{
  if (self->_count > 4) {
    v2 = self->_u.ptr + 2;
  }
  else {
    v2 = &self->_u.vec[2];
  }
  return *v2;
}

- (CGFloat)W
{
  if (self->_count > 4) {
    v2 = self->_u.ptr + 3;
  }
  else {
    v2 = &self->_u.vec[3];
  }
  return *v2;
}

- (CGFloat)Y
{
  if (self->_count > 4) {
    v2 = self->_u.ptr + 1;
  }
  else {
    v2 = &self->_u.vec[1];
  }
  return *v2;
}

- (CGFloat)X
{
  p_u = &self->_u;
  if (self->_count >= 5) {
    p_u = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)p_u->ptr;
  }
  return p_u->vec[0];
}

- (CGPoint)CGPointValue
{
  [(CIVector *)self X];
  double v4 = v3;
  [(CIVector *)self Y];
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (CIVector)initWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z W:(CGFloat)w
{
  v7[4] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)double v7 = x;
  *(CGFloat *)&v7[1] = y;
  *(CGFloat *)&v7[2] = z;
  *(CGFloat *)&v7[3] = w;
  return [(CIVector *)self initWithValues:v7 count:4];
}

- (CIVector)initWithCGPoint:(CGPoint)p
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CGPoint v4 = p;
  return [(CIVector *)self initWithValues:&v4 count:2];
}

+ (CIVector)vectorWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z W:(CGFloat)w
{
  double v6 = (void *)[objc_alloc((Class)a1) initWithX:x Y:y Z:z W:w];

  return (CIVector *)v6;
}

+ (CIVector)vectorWithCGPoint:(CGPoint)p
{
  double v3 = objc_msgSend(objc_alloc((Class)a1), "initWithCGPoint:", p.x, p.y);

  return (CIVector *)v3;
}

- (float)_norm
{
  if (self->_count)
  {
    unint64_t v3 = 0;
    double v4 = 0.0;
    do
    {
      [(CIVector *)self valueAtIndex:v3];
      double v4 = v4 + v5 * v5;
      ++v3;
    }
    while (v3 < self->_count);
    float v6 = v4;
  }
  else
  {
    float v6 = 0.0;
  }
  return sqrtf(v6);
}

- (id)_orthonormalizeTo:(id)a3
{
  objc_msgSend(a3, "_dot:");
  float v6 = v5;
  if (v5 < 0.000001) {
    return self;
  }
  [(CIVector *)self _dot:a3];
  float v9 = v8 / v6;
  [(CIVector *)self X];
  double v11 = v10;
  double v12 = v9;
  [(CIVector *)self X];
  double v14 = v11 + v9 * v13;
  [(CIVector *)self Y];
  double v16 = v15;
  [(CIVector *)self Y];

  return +[CIVector vectorWithX:v14 Y:v16 + v12 * v17];
}

- (float)_dot:(id)a3
{
  [(CIVector *)self X];
  double v6 = v5;
  [a3 X];
  double v8 = v7;
  [(CIVector *)self Y];
  double v10 = v9;
  [a3 Y];
  return v10 * v11 + v6 * v8;
}

+ (CIVector)vectorWithValues:(const CGFloat *)values count:(size_t)count
{
  double v4 = (void *)[objc_alloc((Class)a1) initWithValues:values count:count];

  return (CIVector *)v4;
}

+ (CIVector)vectorWithX:(CGFloat)x
{
  unint64_t v3 = (void *)[objc_alloc((Class)a1) initWithX:x];

  return (CIVector *)v3;
}

+ (CIVector)vectorWithCGRect:(CGRect)r
{
  unint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithCGRect:", r.origin.x, r.origin.y, r.size.width, r.size.height);

  return (CIVector *)v3;
}

+ (CIVector)vectorWithCGAffineTransform:(CGAffineTransform *)t
{
  id v4 = objc_alloc((Class)a1);
  long long v5 = *(_OWORD *)&t->c;
  v7[0] = *(_OWORD *)&t->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&t->tx;
  return (CIVector *)(id)[v4 initWithCGAffineTransform:v7];
}

+ (CIVector)vectorWithString:(NSString *)representation
{
  unint64_t v3 = (void *)[objc_alloc((Class)a1) initWithString:representation];

  return (CIVector *)v3;
}

- (CIVector)init
{
  uint64_t v3 = 0;
  return [(CIVector *)self initWithValues:&v3 count:0];
}

- (CIVector)initWithX:(CGFloat)x
{
  CGFloat v4 = x;
  return [(CIVector *)self initWithValues:&v4 count:1];
}

- (CIVector)initWithCGRect:(CGRect)r
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CGRect v4 = r;
  return [(CIVector *)self initWithValues:&v4 count:4];
}

- (CIVector)initWithCGAffineTransform:(CGAffineTransform *)r
{
  return [(CIVector *)self initWithValues:r count:6];
}

- (CIVector)initWithString:(NSString *)representation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CGRect v4 = [(NSString *)representation UTF8String];
  if (!v4)
  {
    return [(CIVector *)self init];
  }
  v18 = 0;
  if (*v4 == 91) {
    uint64_t v5 = v4 + 1;
  }
  else {
    uint64_t v5 = v4;
  }
  double v6 = strtod(v5, &v18);
  double v7 = v18;
  if (v18 == v5) {
    return -[CIVector initWithValues:count:](self, "initWithValues:count:", v19, 0, v6);
  }
  double v8 = v6;
  uint64_t v9 = 0;
  int v10 = 32;
  double v11 = (double *)v19;
  while (v9 != v10)
  {
    double v13 = v11;
LABEL_13:
    unsigned int v14 = v9 + 1;
    v13[v9] = v8;
    double v8 = strtod(v7, &v18);
    ++v9;
    BOOL v15 = v18 == v7;
    double v7 = v18;
    if (v15) {
      goto LABEL_21;
    }
  }
  double v12 = (double *)malloc_type_malloc(16 * v10, 0x4D5DE1A3uLL);
  if (v12)
  {
    double v13 = v12;
    memcpy(v12, v11, 8 * v10);
    if (v11 != (double *)v19) {
      free(v11);
    }
    v10 *= 2;
    double v7 = v18;
    double v11 = v13;
    goto LABEL_13;
  }
  double v13 = v11;
  unsigned int v14 = v9;
LABEL_21:
  double v17 = -[CIVector initWithValues:count:](self, "initWithValues:count:", v13, v14, v18);
  if (v13 != (double *)v19) {
    free(v13);
  }
  return v17;
}

- (CGFloat)valueAtIndex:(size_t)index
{
  size_t count = self->_count;
  CGFloat result = 0.0;
  if (count > index)
  {
    p_u = &self->_u;
    if (count > 4) {
      double v6 = &p_u->ptr[index];
    }
    else {
      double v6 = &p_u->vec[index];
    }
    return *v6;
  }
  return result;
}

- (CGRect)CGRectValue
{
  [(CIVector *)self X];
  double v4 = v3;
  [(CIVector *)self Y];
  double v6 = v5;
  [(CIVector *)self Z];
  double v8 = v7;
  [(CIVector *)self W];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGAffineTransform)CGAffineTransformValue
{
  [(CIVector *)self X];
  CGFloat v6 = v5;
  [(CIVector *)self Y];
  CGFloat v8 = v7;
  [(CIVector *)self Z];
  CGFloat v10 = v9;
  [(CIVector *)self W];
  CGFloat v12 = v11;
  [(CIVector *)self valueAtIndex:4];
  CGFloat v14 = v13;
  CGRect result = (CGAffineTransform *)[(CIVector *)self valueAtIndex:5];
  retstr->a = v6;
  retstr->b = v8;
  retstr->c = v10;
  retstr->d = v12;
  retstr->tx = v14;
  retstr->ty = v16;
  return result;
}

- (id)description
{
  switch(self->_count)
  {
    case 0uLL:
      id result = @"[]";
      break;
    case 1uLL:
      id result = (id)objc_msgSend(NSString, "stringWithFormat:", @"[%g]", self->_u.ptr, v17, v18, v19);
      break;
    case 2uLL:
      id result = (id)objc_msgSend(NSString, "stringWithFormat:", @"[%g %g]", self->_u.ptr, *(void *)&self->_u.vec[1], v18, v19);
      break;
    case 3uLL:
      id result = (id)objc_msgSend(NSString, "stringWithFormat:", @"[%g %g %g]", self->_u.ptr, *(void *)&self->_u.vec[1], *(void *)&self->_u.vec[2], v19);
      break;
    case 4uLL:
      id result = (id)objc_msgSend(NSString, "stringWithFormat:", @"[%g %g %g %g]", self->_u.ptr, *(void *)&self->_u.vec[1], *(void *)&self->_u.vec[2], *(void *)&self->_u.vec[3]);
      break;
    default:
      double v4 = NSString;
      [(CIVector *)self X];
      uint64_t v6 = v5;
      [(CIVector *)self Y];
      uint64_t v8 = v7;
      [(CIVector *)self Z];
      uint64_t v10 = v9;
      [(CIVector *)self W];
      CGFloat v12 = objc_msgSend(v4, "stringWithFormat:", @"[%g %g %g %g", v6, v8, v10, v11);
      if (self->_count >= 5)
      {
        unsigned int v13 = 5;
        uint64_t v14 = 4;
        do
        {
          [(CIVector *)self valueAtIndex:v14];
          CGFloat v12 = objc_msgSend(v12, "stringByAppendingFormat:", @" %g", v15);
          uint64_t v14 = v13;
        }
        while (self->_count > v13++);
      }
      id result = (id)[v12 stringByAppendingString:@"]"];
      break;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      unint64_t v6 = [a3 count];
      if (v6 == self->_count)
      {
        uint64_t v7 = (char *)a3 + 16;
        if (v6 > 4)
        {
          uint64_t v7 = (void *)*v7;
          ptr = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)self->_u.ptr;
        }
        else
        {
          ptr = &self->_u;
        }
        LOBYTE(v5) = memcmp(v7, ptr, 8 * v6) == 0;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t count = self->_count;
  p_u = &self->_u;
  if (count >= 5)
  {
    p_u = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)p_u->ptr;
  }
  else if (!count)
  {
    return 0;
  }
  unint64_t v5 = self->_count;
  do
  {
    double v6 = p_u->vec[0];
    p_u = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)((char *)p_u + 8);
    LODWORD(v5) = 33 * v5 + vcvtmd_s64_f64(v6 * 1024.0);
    --count;
  }
  while (count);
  return (int)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIVector)initWithCoder:(id)a3
{
  v19[64] = *MEMORY[0x1E4F143B8];
  if (![a3 containsValueForKey:@"CICount"]) {
    goto LABEL_4;
  }
  unsigned int v5 = [a3 decodeIntForKey:@"CICount"];
  if (v5)
  {
    unsigned int v6 = v5;
    if (v5 >= 0x401)
    {
LABEL_4:

      return 0;
    }
    if ([a3 containsValueForKey:@"CIVector"])
    {
      [a3 decodeRectForKey:@"CIVector"];
      v19[0] = v8;
      v19[1] = v9;
      v19[2] = v10;
      v19[3] = v11;
      if ((int)v6 >= 4) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = v6;
      }
      unsigned int v13 = v19;
      uint64_t v14 = self;
    }
    else
    {
      if (v6 >= 0x41)
      {
        uint64_t v15 = malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
        if (!v15) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v15 = v19;
      }
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"CI_%zu", i);
        [a3 decodeFloatForKey:v17];
        *(double *)&v15[i] = v18;
      }
      uint64_t v14 = self;
      unsigned int v13 = v15;
      uint64_t v12 = v6;
    }
    return [(CIVector *)v14 initWithValues:v13 count:v12];
  }

  return [(CIVector *)self init];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:LODWORD(self->_count) forKey:@"CICount"];
  unint64_t count = self->_count;
  if (count >= 5)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"CI_%zu", v9);
      double v11 = self->_u.ptr[v9];
      *(float *)&double v11 = v11;
      [a3 encodeFloat:v10 forKey:v11];

      ++v9;
    }
    while (v9 < self->_count);
  }
  else if (count)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"CI_%zu", v6);
      double v8 = self->_u.vec[v6];
      *(float *)&double v8 = v8;
      [a3 encodeFloat:v7 forKey:v8];

      ++v6;
    }
    while (v6 < self->_count);
  }
}

- (double)_values
{
  return self->_u.ptr;
}

@end