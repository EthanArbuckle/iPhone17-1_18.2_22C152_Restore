@interface IKArray
+ (id)array;
- (IKArray)initWithNSArray:(id)a3;
- (NSMutableArray)arrayStore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstObject;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)obj0;
- (id)obj1;
- (id)objectAtIndex:(int64_t)a3;
- (id)objectEnumerator;
- (id)toNSArray;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (void)_setupWithNSArray:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)setArrayStore:(id)a3;
- (void)setObj0:(id)a3;
- (void)setObj1:(id)a3;
@end

@implementation IKArray

+ (id)array
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (IKArray)initWithNSArray:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKArray;
  v5 = [(IKArray *)&v8 init];
  v6 = v5;
  if (v5) {
    [(IKArray *)v5 _setupWithNSArray:v4];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(IKArray *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    id v4 = [IKArray alloc];
    v5 = [(IKArray *)self toNSArray];
    v6 = [(IKArray *)v4 initWithNSArray:v5];

    return v6;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [IKMutableArray alloc];
  v5 = [(IKArray *)self toNSArray];
  v6 = [(IKArray *)v4 initWithNSArray:v5];

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v9 = [(IKArray *)self arrayStore];

  if (v9)
  {
    v10 = [(IKArray *)self arrayStore];
    unint64_t v11 = [v10 countByEnumeratingWithState:a3 objects:a4 count:a5];

    return v11;
  }
  else
  {
    unint64_t var0 = a3->var0;
    int64_t v14 = [(IKArray *)self count];
    if (v14 - a3->var0 < a5) {
      a5 = v14 - a3->var0;
    }
    if (a5)
    {
      unint64_t v15 = var0;
      v16 = a4;
      unint64_t v17 = a5;
      do
      {
        *v16++ = [(IKArray *)self objectAtIndex:v15++];
        --v17;
      }
      while (v17);
    }
    a3->unint64_t var0 = a5 + var0;
    a3->var1 = a4;
    a3->var2 = a3->var3;
    return a5;
  }
}

- (id)objectAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(IKArray *)self count] <= a3)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C4A8];
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"Index :%ld out of range", a3);
    objc_super v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
    [v8 raise];
  }
  v9 = [(IKArray *)self arrayStore];
  if (v9)
  {
    v10 = [(IKArray *)self arrayStore];
    unint64_t v11 = [v10 objectAtIndexedSubscript:a3];

    goto LABEL_12;
  }
  if (a3 == 1)
  {
    uint64_t v12 = [(IKArray *)self obj1];
    goto LABEL_10;
  }
  if (!a3)
  {
    uint64_t v12 = [(IKArray *)self obj0];
LABEL_10:
    unint64_t v11 = (void *)v12;
    goto LABEL_12;
  }
  unint64_t v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(IKArray *)self arrayStore];
    if (v5)
    {
      uint64_t v6 = [(IKArray *)self arrayStore];
      unint64_t v7 = [v6 indexOfObject:v4];
    }
    else
    {
      uint64_t v6 = [(IKArray *)self obj1];
      if ([v6 isEqual:v4])
      {
        unint64_t v7 = 1;
      }
      else
      {
        objc_super v8 = [(IKArray *)self obj0];
        if ([v8 isEqual:v4]) {
          unint64_t v7 = 0;
        }
        else {
          unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)count
{
  v3 = [(IKArray *)self arrayStore];
  if (v3)
  {
    id v4 = [(IKArray *)self arrayStore];
    int64_t v5 = [v4 count];
  }
  else
  {
    id v4 = [(IKArray *)self obj1];
    if (v4)
    {
      int64_t v5 = 2;
    }
    else
    {
      uint64_t v6 = [(IKArray *)self obj0];
      int64_t v5 = v6 != 0;
    }
  }

  return v5;
}

- (id)firstObject
{
  v3 = [(IKArray *)self obj0];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(IKArray *)self arrayStore];
    id v5 = [v6 firstObject];
  }
  return v5;
}

- (id)lastObject
{
  v3 = [(IKArray *)self obj1];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(IKArray *)self obj0];
    unint64_t v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      objc_super v8 = [(IKArray *)self arrayStore];
      id v5 = [v8 lastObject];
    }
  }

  return v5;
}

- (id)objectEnumerator
{
  id v2 = [[_IKArrayEnumerator alloc] initWithArray:self];
  return v2;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  id v5 = [(IKArray *)self arrayStore];

  if (v5)
  {
    uint64_t v6 = [(IKArray *)self arrayStore];
    [v6 enumerateObjectsUsingBlock:v4];
LABEL_3:

    goto LABEL_4;
  }
  char v10 = 0;
  unint64_t v7 = [(IKArray *)self obj0];

  if (!v7
    || ([(IKArray *)self obj0],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        v4[2](v4, v8, 0, &v10),
        v8,
        !v10))
  {
    v9 = [(IKArray *)self obj1];

    if (v9)
    {
      uint64_t v6 = [(IKArray *)self obj1];
      v4[2](v4, v6, 1, &v10);
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (id)toNSArray
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = [(IKArray *)self arrayStore];
  if (v3)
  {
    id v4 = [(IKArray *)self arrayStore];
    id v5 = (void *)[v4 copy];
    goto LABEL_9;
  }
  id v4 = [(IKArray *)self obj1];
  uint64_t v6 = [(IKArray *)self obj0];
  unint64_t v7 = (void *)v6;
  if (v4)
  {
    v14[0] = v6;
    objc_super v8 = [(IKArray *)self obj1];
    v14[1] = v8;
    v9 = (void *)MEMORY[0x1E4F1C978];
    char v10 = (void **)v14;
    uint64_t v11 = 2;
  }
  else
  {
    if (!v6)
    {
      id v5 = 0;
      goto LABEL_8;
    }
    objc_super v8 = [(IKArray *)self obj0];
    v13 = v8;
    v9 = (void *)MEMORY[0x1E4F1C978];
    char v10 = &v13;
    uint64_t v11 = 1;
  }
  id v5 = objc_msgSend(v9, "arrayWithObjects:count:", v10, v11, v13);

LABEL_8:
LABEL_9:

  return v5;
}

- (void)_setupWithNSArray:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 count];
  if (v4 < 3)
  {
    if (v4 == 2)
    {
      unint64_t v7 = [v13 objectAtIndexedSubscript:0];
      id obj0 = self->_obj0;
      self->_id obj0 = v7;

      v9 = [v13 objectAtIndexedSubscript:1];
      obj1 = self->_obj1;
      self->_obj1 = v9;
    }
    else
    {
      BOOL v10 = v4 < 1;
      uint64_t v11 = v13;
      if (v10) {
        goto LABEL_8;
      }
      uint64_t v12 = [v13 objectAtIndexedSubscript:0];
      obj1 = self->_obj0;
      self->_id obj0 = v12;
    }
  }
  else
  {
    id v5 = (NSMutableArray *)[v13 mutableCopy];
    obj1 = self->_arrayStore;
    self->_arrayStore = v5;
  }

  uint64_t v11 = v13;
LABEL_8:
}

- (id)obj0
{
  return self->_obj0;
}

- (void)setObj0:(id)a3
{
}

- (id)obj1
{
  return self->_obj1;
}

- (void)setObj1:(id)a3
{
}

- (NSMutableArray)arrayStore
{
  return self->_arrayStore;
}

- (void)setArrayStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrayStore, 0);
  objc_storeStrong(&self->_obj1, 0);
  objc_storeStrong(&self->_obj0, 0);
}

@end