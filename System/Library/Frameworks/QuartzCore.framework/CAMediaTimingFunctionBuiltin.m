@interface CAMediaTimingFunctionBuiltin
+ (BOOL)supportsSecureCoding;
- (CAMediaTimingFunctionBuiltin)initWithCoder:(id)a3;
- (Class)classForCoder;
- (id)description;
- (void)_getPoints:(double *)a3;
- (void)encodeWithCAMLWriter:(id)a3;
@end

@implementation CAMediaTimingFunctionBuiltin

- (void)_getPoints:(double *)a3
{
  v3 = (float32x2_t *)((char *)&function_values + 16 * self->_index);
  *(float64x2_t *)a3 = vcvtq_f64_f32(*v3);
  a3[2] = v3[1].f32[0];
  a3[3] = 1.0;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t index = self->_index;
  if (index < 5) {
    return (id)*((void *)&off_1E52730A8 + index);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMediaTimingFunctionBuiltin;
  return [(CAMediaTimingFunction *)&v4 description];
}

- (void)encodeWithCAMLWriter:(id)a3
{
  id v4 = [(CAMediaTimingFunctionBuiltin *)self description];

  [a3 setElementContent:v4];
}

- (CAMediaTimingFunctionBuiltin)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([a3 containsValueForKey:@"index"])
  {
    unsigned int v5 = [a3 decodeIntForKey:@"index"];

    v6 = builtin_function(v5);
    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CAMediaTimingFunctionBuiltin;
    return [(CAMediaTimingFunction *)&v8 initWithCoder:a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end