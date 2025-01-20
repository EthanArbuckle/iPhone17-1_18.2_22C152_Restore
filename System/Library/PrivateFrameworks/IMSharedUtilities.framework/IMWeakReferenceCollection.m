@interface IMWeakReferenceCollection
- (BOOL)containsObject:(id)a3;
- (IMWeakReferenceCollection)init;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation IMWeakReferenceCollection

- (void)enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unsigned char *))a3;
  char v10 = 0;
  if (v4)
  {
    uint64_t v5 = [(NSMutableArray *)self->_list count];
    if (v5 - 1 >= 0)
    {
      uint64_t v6 = v5;
      do
      {
        v7 = [(NSMutableArray *)self->_list objectAtIndex:--v6];
        v8 = [v7 object];

        if (v8)
        {
          if (!v10)
          {
            v9 = [v7 object];
            v4[2](v4, v9, &v10);
          }
        }
        else
        {
          [(NSMutableArray *)self->_list removeObjectAtIndex:v6];
        }
      }
      while (v6 > 0);
    }
  }
}

- (IMWeakReferenceCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMWeakReferenceCollection;
  v2 = [(IMWeakReferenceCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    list = v2->_list;
    v2->_list = (NSMutableArray *)v3;
  }
  return v2;
}

- (unint64_t)count
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A08388E4;
  v4[3] = &unk_1E5A135C0;
  v4[4] = &v5;
  [(IMWeakReferenceCollection *)self enumerateObjectsUsingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A08389E0;
  v7[3] = &unk_1E5A135E8;
  id v5 = v4;
  id v8 = v5;
  v9 = &v10;
  [(IMWeakReferenceCollection *)self enumerateObjectsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v8 = v4;
    id v4 = (id)[(IMWeakReferenceCollection *)self containsObject:v4];
    id v5 = v8;
    if ((v4 & 1) == 0)
    {
      list = self->_list;
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F6C428]) initRefWithObject:v8];
      [(NSMutableArray *)list addObject:v7];

      id v5 = v8;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)removeObject:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(NSMutableArray *)self->_list count];
  if (v4 - 1 >= 0)
  {
    uint64_t v5 = v4;
    do
    {
      objc_super v6 = [(NSMutableArray *)self->_list objectAtIndex:--v5];
      uint64_t v7 = [v6 object];
      if (!v7
        || (id v8 = (void *)v7,
            [v6 object],
            id v9 = (id)objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9 == v10))
      {
        [(NSMutableArray *)self->_list removeObjectAtIndex:v5];
      }
    }
    while (v5 > 0);
  }
}

- (void).cxx_destruct
{
}

@end