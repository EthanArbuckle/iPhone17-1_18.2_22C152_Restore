@interface BSCopyingCacheSet
- (BOOL)containsObject:(id)a3;
- (id)description;
- (id)immutableSet;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation BSCopyingCacheSet

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  if (v4) {
    char v5 = [(NSMutableSet *)self->_mutable containsObject:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)immutableSet
{
  immutable = self->_immutable;
  if (!immutable)
  {
    id v4 = (NSSet *)[(NSMutableSet *)self->_mutable copy];
    char v5 = self->_immutable;
    self->_immutable = v4;

    immutable = self->_immutable;
  }
  return immutable;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4 && ([(NSMutableSet *)self->_mutable containsObject:v4] & 1) == 0)
  {
    char v5 = self->_mutable;
    if (v5)
    {
      [(NSMutableSet *)v5 addObject:v4];
    }
    else
    {
      v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:&v9 count:1];
      v7 = self->_mutable;
      self->_mutable = v6;
    }
    immutable = self->_immutable;
    self->_immutable = 0;

    id v4 = v9;
  }
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    int v5 = [(NSMutableSet *)self->_mutable containsObject:v4];
    id v4 = v9;
    if (v5)
    {
      uint64_t v6 = [(NSMutableSet *)self->_mutable count];
      v7 = self->_mutable;
      if (v6 == 1)
      {
        self->_mutable = 0;
      }
      else
      {
        [(NSMutableSet *)v7 removeObject:v9];
      }
      immutable = self->_immutable;
      self->_immutable = 0;

      id v4 = v9;
    }
  }
}

- (unint64_t)count
{
  return [(NSMutableSet *)self->_mutable count];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> -> %@", objc_opt_class(), self, self->_mutable];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immutable, 0);
  objc_storeStrong((id *)&self->_mutable, 0);
}

@end