@interface _BSUIAnimationAttributesFactory
- (BOOL)isEqual:(id)a3;
- (double)delay;
- (double)duration;
- (id)description;
- (unint64_t)hash;
@end

@implementation _BSUIAnimationAttributesFactory

- (double)duration
{
  return 0.0;
}

- (double)delay
{
  return 0.0;
}

- (unint64_t)hash
{
  return [(_UIViewAnimationAttributes *)self->_attributes hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    char v6 = [(_UIViewAnimationAttributes *)self->_attributes isEqual:v4[3]];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p attributes=%@>", objc_opt_class(), self, self->_attributes];
}

- (void).cxx_destruct
{
}

@end