@interface KGSetWrapper
- (BOOL)isEqual:(id)a3;
- (KGSetWrapper)initWithArray:(id)a3;
- (KGSetWrapper)initWithSet:(id)a3;
- (NSSet)set;
- (unint64_t)count;
- (unint64_t)hash;
@end

@implementation KGSetWrapper

- (void).cxx_destruct
{
}

- (NSSet)set
{
  return self->_set;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_set;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 ^= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hash", (void)v9);
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (KGSetWrapper *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NSSet *)self->_set isEqualToSet:v4->_set];
  }

  return v5;
}

- (unint64_t)count
{
  return [(NSSet *)self->_set count];
}

- (KGSetWrapper)initWithArray:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithArray:v5];

  v7 = [(KGSetWrapper *)self initWithSet:v6];
  return v7;
}

- (KGSetWrapper)initWithSet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGSetWrapper;
  id v5 = [(KGSetWrapper *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    set = v5->_set;
    v5->_set = (NSSet *)v6;
  }
  return v5;
}

@end