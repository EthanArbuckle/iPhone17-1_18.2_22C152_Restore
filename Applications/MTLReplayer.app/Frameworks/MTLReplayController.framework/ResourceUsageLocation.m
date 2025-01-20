@interface ResourceUsageLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualTo:(id)a3;
- (ResourceUsageLocation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)subCommandIndex;
- (unint64_t)functionIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFunctionIndex:(unint64_t)a3;
- (void)setSubCommandIndex:(int64_t)a3;
@end

@implementation ResourceUsageLocation

- (void)setSubCommandIndex:(int64_t)a3
{
  self->_subCommandIndex = a3;
}

- (int64_t)subCommandIndex
{
  return self->_subCommandIndex;
}

- (void)setFunctionIndex:(unint64_t)a3
{
  self->_functionIndex = a3;
}

- (unint64_t)functionIndex
{
  return self->_functionIndex;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ResourceUsageLocation);
  [(ResourceUsageLocation *)v4 setFunctionIndex:self->_functionIndex];
  [(ResourceUsageLocation *)v4 setSubCommandIndex:self->_subCommandIndex];
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ResourceUsageLocation *)self functionIndex];
  return [(ResourceUsageLocation *)self subCommandIndex] | (v3 << 32);
}

- (BOOL)isEqualTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(ResourceUsageLocation *)self functionIndex];
    if (v6 == [v5 functionIndex])
    {
      id v7 = [(ResourceUsageLocation *)self subCommandIndex];
      BOOL v8 = v7 == [v5 subCommandIndex];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_functionIndex forKey:@"functionIndex"];
  [v4 encodeInt64:self->_subCommandIndex forKey:@"subCommandIndex"];
}

- (ResourceUsageLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ResourceUsageLocation;
  id v5 = [(ResourceUsageLocation *)&v7 init];
  if (v5)
  {
    v5->_functionIndex = (unint64_t)[v4 decodeInt64ForKey:@"functionIndex"];
    v5->_subCommandIndex = (int64_t)[v4 decodeInt64ForKey:@"subCommandIndex"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end