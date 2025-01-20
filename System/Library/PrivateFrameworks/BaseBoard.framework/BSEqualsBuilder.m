@interface BSEqualsBuilder
+ (id)builder;
+ (id)builderWithObject:(id)a3 ofExpectedClass:(Class)a4;
- (BOOL)isEqual;
- (BSEqualsBuilder)init;
- (id)appendArray:(id)a3 counterpart:(id)a4;
- (id)appendBool:(BOOL)a3 counterpart:(id)a4;
- (id)appendCGAffineTransform:(CGAffineTransform *)a3 counterpart:(id)a4;
- (id)appendCGFloat:(double)a3 counterpart:(id)a4;
- (id)appendCGPoint:(CGPoint)a3 counterpart:(id)a4;
- (id)appendCGRect:(CGRect)a3 counterpart:(id)a4;
- (id)appendCGSize:(CGSize)a3 counterpart:(id)a4;
- (id)appendClass:(Class)a3 counterpart:(id)a4;
- (id)appendDouble:(double)a3 counterpart:(id)a4;
- (id)appendEqualsBlocks:(id)a3;
- (id)appendFloat:(float)a3 counterpart:(id)a4;
- (id)appendInt64:(int64_t)a3 counterpart:(id)a4;
- (id)appendInteger:(int64_t)a3 counterpart:(id)a4;
- (id)appendObject:(id)a3 counterpart:(id)a4;
- (id)appendPointer:(void *)a3 counterpart:(id)a4;
- (id)appendSizeT:(unint64_t)a3 counterpart:(id)a4;
- (id)appendString:(id)a3 counterpart:(id)a4;
- (id)appendUnsignedInteger:(unint64_t)a3 counterpart:(id)a4;
@end

@implementation BSEqualsBuilder

- (id)appendBool:(BOOL)a3 counterpart:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) ^ a3 ^ 1;
  }

  return self;
}

- (id)appendInteger:(int64_t)a3 counterpart:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == a3;
  }

  return self;
}

- (id)appendPointer:(void *)a3 counterpart:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == (void)a3;
  }

  return self;
}

- (id)appendObject:(id)a3 counterpart:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && self->_equal)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v6)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v6 && v9) {
        char v10 = [v6 isEqual:v9];
      }
    }
    self->_equal = v10;
  }
  return self;
}

- (BOOL)isEqual
{
  return self->_equal;
}

+ (id)builderWithObject:(id)a3 ofExpectedClass:(Class)a4
{
  id v4 = a3;
  v5 = [BSEqualsBuilder alloc];
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v5)
  {
    char v7 = isKindOfClass;
    v10.receiver = v5;
    v10.super_class = (Class)BSEqualsBuilder;
    v8 = objc_msgSendSuper2(&v10, sel_init);
    v5 = v8;
    if (v8) {
      v8->_equal = v7 & 1;
    }
  }

  return v5;
}

- (id)appendCGFloat:(double)a3 counterpart:(id)a4
{
  id v6 = a4;
  char v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = vabdd_f64(a3, (*((double (**)(id))v6 + 2))(v6)) < 2.22044605e-16;
  }

  return self;
}

- (id)appendString:(id)a3 counterpart:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && self->_equal)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v6)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v6 && v9) {
        char v10 = [v6 isEqualToString:v9];
      }
    }
    self->_equal = v10;
  }
  return self;
}

- (id)appendDouble:(double)a3 counterpart:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = vabdd_f64(a3, (*((double (**)(id))v6 + 2))(v6)) < 2.22044605e-16;
  }

  return self;
}

- (id)appendUnsignedInteger:(unint64_t)a3 counterpart:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == a3;
  }

  return self;
}

- (id)appendCGSize:(CGSize)a3 counterpart:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = v7;
  if (v7 && self->_equal)
  {
    BOOL v9 = vabdd_f64(width, (*((double (**)(id))v7 + 2))(v7)) < 2.22044605e-16;
    if (vabdd_f64(height, v10) >= 2.22044605e-16) {
      BOOL v9 = 0;
    }
    self->_equal = v9;
  }

  return self;
}

- (id)appendCGRect:(CGRect)a3 counterpart:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = v9;
  if (v9 && self->_equal)
  {
    double v11 = (*((double (**)(id))v9 + 2))(v9);
    self->_equal = BSRectEqualToRect(x, y, width, height, v11, v12, v13, v14);
  }

  return self;
}

- (id)appendClass:(Class)a3 counterpart:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == (void)a3;
  }

  return self;
}

- (id)appendEqualsBlocks:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  if (v4 && self->_equal)
  {
    id v9 = &v10;
    do
    {
      self->_equal = v4[2](v4);
      v5 = v9++;
      uint64_t v6 = MEMORY[0x18C125630](*v5);

      BOOL v7 = !self->_equal || v6 == 0;
      id v4 = (uint64_t (**)(void))v6;
    }
    while (!v7);
    id v4 = (uint64_t (**)(void))v6;
  }

  return self;
}

- (id)appendSizeT:(unint64_t)a3 counterpart:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == a3;
  }

  return self;
}

+ (id)builder
{
  v2 = [BSEqualsBuilder alloc];
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)BSEqualsBuilder;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2) {
      v2->_equal = 1;
    }
  }
  return v2;
}

- (BSEqualsBuilder)init
{
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)BSEqualsBuilder;
    self = [(BSEqualsBuilder *)&v2 init];
    if (self) {
      self->_equal = 1;
    }
  }
  return self;
}

- (id)appendInt64:(int64_t)a3 counterpart:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = (*((uint64_t (**)(id))v6 + 2))(v6) == a3;
  }

  return self;
}

- (id)appendFloat:(float)a3 counterpart:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  if (v6 && self->_equal) {
    self->_equal = vabds_f32(a3, (*((float (**)(id))v6 + 2))(v6)) < 0.00000011921;
  }

  return self;
}

- (id)appendCGPoint:(CGPoint)a3 counterpart:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = v7;
  if (v7 && self->_equal)
  {
    BOOL v9 = vabdd_f64(x, (*((double (**)(id))v7 + 2))(v7)) < 2.22044605e-16;
    if (vabdd_f64(y, v10) >= 2.22044605e-16) {
      BOOL v9 = 0;
    }
    self->_equal = v9;
  }

  return self;
}

- (id)appendCGAffineTransform:(CGAffineTransform *)a3 counterpart:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6 && self->_equal)
  {
    (*((void (**)(CGAffineTransform *__return_ptr, id))v6 + 2))(&t2, v6);
    long long v8 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v10.c = v8;
    *(_OWORD *)&v10.tdouble x = *(_OWORD *)&a3->tx;
    self->_equal = CGAffineTransformEqualToTransform(&v10, &t2);
  }

  return self;
}

- (id)appendArray:(id)a3 counterpart:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = v7;
  if (v7 && self->_equal)
  {
    BOOL v9 = (*((void (**)(id))v7 + 2))(v7);
    self->_equal = [v6 isEqualToArray:v9];
  }
  return self;
}

@end