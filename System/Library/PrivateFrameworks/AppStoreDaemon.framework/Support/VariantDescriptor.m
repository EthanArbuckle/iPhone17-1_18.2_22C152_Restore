@interface VariantDescriptor
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation VariantDescriptor

- (id)description
{
  v3 = sub_10025B7C4((id *)&self->super.isa);
  v4 = +[NSString stringWithFormat:@"<VariantDescriptor %p>: {%@}", self, v3];

  return v4;
}

- (unint64_t)hash
{
  return self->_version ^ (unint64_t)[(NSArray *)self->_components hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VariantDescriptor *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = sub_10025BF24((uint64_t)self, v4);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end