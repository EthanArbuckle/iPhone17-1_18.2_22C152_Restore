@interface KGBinaryPredicate
- (KGBinaryPredicate)initWithComparator:(unint64_t)a3 value:(id)a4;
- (id)description;
- (id)value;
- (unint64_t)comparator;
@end

@implementation KGBinaryPredicate

- (void).cxx_destruct
{
}

- (id)value
{
  return self->_value;
}

- (unint64_t)comparator
{
  return self->_comparator;
}

- (id)description
{
  unint64_t v2 = self->_comparator - 1;
  if (v2 > 7) {
    v3 = @"_";
  }
  else {
    v3 = off_1E68DB3F8[v2];
  }
  return (id)[NSString stringWithFormat:@"%@ %@", v3, self->_value];
}

- (KGBinaryPredicate)initWithComparator:(unint64_t)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KGBinaryPredicate;
  v8 = [(KGBinaryPredicate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_comparator = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

@end