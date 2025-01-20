@interface LSSliceInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LSSliceData)sliceValue;
- (LSSliceInfo)initWithCoder:(id)a3;
- (LSSliceInfo)initWithSliceDescData:(LSSliceData)a3;
- (LSSliceInfo)initWithType:(int)a3 subtype:(int)a4;
- (id)description;
- (int)subtype;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSSliceInfo

- (LSSliceInfo)initWithType:(int)a3 subtype:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LSSliceInfo;
  result = [(LSSliceInfo *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_subtype = a4;
  }
  return result;
}

- (LSSliceInfo)initWithSliceDescData:(LSSliceData)a3
{
  return [(LSSliceInfo *)self initWithType:a3 subtype:a3.var1];
}

- (LSSliceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LSSliceInfo;
  v5 = [(LSSliceInfo *)&v7 init];
  if (v5)
  {
    v5->_type = [v4 decodeInt64ForKey:@"type"];
    v5->_subtype = [v4 decodeInt64ForKey:@"subtype"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_type forKey:@"type"];
  [v4 encodeInt64:self->_subtype forKey:@"subtype"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = -[LSSliceInfo type](self, "type"), v5 == [v4 type]))
  {
    int v6 = [(LSSliceInfo *)self subtype];
    BOOL v7 = v6 == [v4 subtype];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (self->_type | (self->_type << 8)) ^ self->_subtype;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<LSSliceInfo@%p: t=%#x s=%#x>", self, self->_type, self->_subtype);
}

- (LSSliceData)sliceValue
{
  return *(LSSliceData *)&self->_type;
}

- (int)type
{
  return self->_type;
}

- (int)subtype
{
  return self->_subtype;
}

@end