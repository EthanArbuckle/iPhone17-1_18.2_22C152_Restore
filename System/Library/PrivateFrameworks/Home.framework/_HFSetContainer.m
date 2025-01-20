@interface _HFSetContainer
+ (id)containerWithObject:(id)a3 atIndex:(unint64_t)a4 comparator:(id)a5 hashGenerator:(id)a6;
- (BOOL)isEqual:(id)a3;
- (id)comparator;
- (id)hashGenerator;
- (id)object;
- (unint64_t)hash;
- (unint64_t)index;
- (void)setComparator:(id)a3;
- (void)setHashGenerator:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setObject:(id)a3;
@end

@implementation _HFSetContainer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashGenerator, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong(&self->_object, 0);
}

- (unint64_t)index
{
  return self->_index;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_HFSetContainer *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(_HFSetContainer *)v4 object];
      v6 = [(_HFSetContainer *)self comparator];
      if (v6)
      {
        v7 = [(_HFSetContainer *)self comparator];
        v8 = [(_HFSetContainer *)self object];
        char v9 = ((uint64_t (**)(void, void *, void *))v7)[2](v7, v8, v5);
      }
      else
      {
        v7 = [(_HFSetContainer *)self object];
        char v9 = [v7 isEqual:v5];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(_HFSetContainer *)self hashGenerator];
  if (v3)
  {
    v4 = [(_HFSetContainer *)self hashGenerator];
    v5 = [(_HFSetContainer *)self object];
    unint64_t v6 = ((uint64_t (**)(void, void *))v4)[2](v4, v5);
  }
  else
  {
    v4 = [(_HFSetContainer *)self object];
    unint64_t v6 = [v4 hash];
  }

  return v6;
}

- (id)object
{
  return self->_object;
}

- (id)hashGenerator
{
  return self->_hashGenerator;
}

- (id)comparator
{
  return self->_comparator;
}

+ (id)containerWithObject:(id)a3 atIndex:(unint64_t)a4 comparator:(id)a5 hashGenerator:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = objc_alloc_init(_HFSetContainer);
  [(_HFSetContainer *)v12 setObject:v11];

  [(_HFSetContainer *)v12 setIndex:a4];
  [(_HFSetContainer *)v12 setComparator:v10];

  [(_HFSetContainer *)v12 setHashGenerator:v9];
  return v12;
}

- (void)setObject:(id)a3
{
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void)setHashGenerator:(id)a3
{
}

- (void)setComparator:(id)a3
{
}

@end