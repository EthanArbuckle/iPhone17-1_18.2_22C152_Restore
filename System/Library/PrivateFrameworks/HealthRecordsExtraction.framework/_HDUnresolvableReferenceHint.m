@interface _HDUnresolvableReferenceHint
- (BOOL)isEqual:(id)a3;
- (NSString)reference;
- (_HDUnresolvableReferenceHint)initWithReference:(id)a3 hint:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)hint;
@end

@implementation _HDUnresolvableReferenceHint

- (_HDUnresolvableReferenceHint)initWithReference:(id)a3 hint:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDUnresolvableReferenceHint;
  v7 = [(_HDUnresolvableReferenceHint *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    reference = v7->_reference;
    v7->_reference = (NSString *)v8;

    v7->_hint = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_hint ^ [(NSString *)self->_reference hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_HDUnresolvableReferenceHint *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      reference = self->_reference;
      v7 = [(_HDUnresolvableReferenceHint *)v5 reference];
      if ([(NSString *)reference isEqualToString:v7])
      {
        unint64_t hint = self->_hint;
        BOOL v9 = hint == [(_HDUnresolvableReferenceHint *)v5 hint];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (NSString)reference
{
  return self->_reference;
}

- (unint64_t)hint
{
  return self->_hint;
}

- (void).cxx_destruct
{
}

@end